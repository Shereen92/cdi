"""
gen_cdi_asm.py ~ A module for CDI conversion of an assembly source file.
"""
import funct_cfg
import operator
import asm_parsing
from eprint import eprint
from collections import defaultdict

class Global:
    file_lines_map = defaultdict(list)
dwarf_loc = asm_parsing.DwarfSourceLoc()

def gen_cdi_asm(cfg, asm_file_descrs, options):
  
    """Writes cdi compliant assembly from cfg and assembly file descriptions"""
    sled_id_faucet = funct_cfg.SledIdFaucet()
    all_functs = list()
    for descr in asm_file_descrs:
        asm_parsing.DwarfSourceLoc.wipe_filename_mapping()
        dwarf_loc = asm_parsing.DwarfSourceLoc()
        asm_src = open(descr.filename, 'r')
        asm_dest = open(cdi_asm_name(descr.filename), 'w')
        descr_functs = \
            [cfg.funct(descr.filename + '.' + n) for n in descr.funct_names]
        functs = sorted(descr_functs, key=operator.attrgetter('asm_line_num'))
        all_functs.extend(functs)
        
        asm_line_num = 1
        for funct in functs:
            num_lines_to_write = funct.asm_line_num - asm_line_num
            write_lines(num_lines_to_write, asm_src, asm_dest, dwarf_loc)
            asm_line_num = funct.asm_line_num
            
            # unique labels are always global so that even static functions
            # can be reached from anywhere with sleds (Function pointers can
            # point to ANY function with the same signature, even static 
            # functions in a different translation unit)
            register_file_lines('.globl\t' + funct.uniq_label + '\n', funct.asm_filename)
            register_file_lines(funct.uniq_label + ':\n', funct.asm_filename)
            
            funct.label_fixed_count = dict()
            for site in funct.sites:
                num_lines_to_write = site.asm_line_num - asm_line_num
                write_lines(num_lines_to_write, asm_src, asm_dest, dwarf_loc)
                
                line_to_fix = asm_src.readline()
                asm_line_num = site.asm_line_num + 1
                convert_to_cdi(site, funct, line_to_fix, asm_dest, cfg,
                        sled_id_faucet, dwarf_loc, options, functs)
                        
        # write the rest of the lines over
        src_line = asm_src.readline()
        while src_line:
            register_file_lines(src_line, asm_src.name)
            src_line = asm_src.readline()
    
    aggressive_default_cloning_heuristic(all_functs)
    finalize_output_file(Global.file_lines_map)
 
    asm_src.close()
    asm_dest.close()
    
def conservative_cloning_heuristic(all_functs):
    # The conservative cloning heuristic only attempts to clone a function once, and only if
    # there exists more than one callsite for the function.
    for funct in all_functs:
        callsite_map = collect_calls(funct)
        num_callsites = 0
        for key in callsite_map.keys():
            num_callsites += len(callsite_map[key])
        
        if num_callsites > 1:
            clone_multiple_times(funct, all_functs, 1)
            
    for funct in all_functs:
        return_site_elimination_map = distribute_callsites_among_clones(funct, all_functs)
        eliminate_extra_return_sites(return_site_elimination_map)
    
def aggressive_default_cloning_heuristic(all_functs):
    # The default heuristic is to produce a clone of a function for each callsite of that function - 1.
    # Here, we calculate the number of callsites for each function, and produce that many (-1) clones.
    for funct in all_functs:
        callsite_map = collect_calls(funct)
        num_callsites = 0
        for key in callsite_map.keys():
            num_callsites += len(callsite_map[key])
        
        if num_callsites > 1:
            clone_multiple_times(funct, all_functs, num_callsites - 1)
            
    for funct in all_functs:
        return_site_elimination_map = distribute_callsites_among_clones(funct, all_functs)
        eliminate_extra_return_sites(return_site_elimination_map)
    
def clone_multiple_times(funct, functs, num):
    for n in range(num):
        clone_function(funct, functs)

def debug_map(line, file_name):
    pass

from copy import deepcopy
def eliminate_extra_return_sites(ret_map):
    """
    ret_map is the list of rets that should be kept.
    """
    functs = ret_map.keys()
    
    for f in functs:
        return_sites_for_funct = f.cdi_return_sites
        
        # ret_map[x] and returns_sites_for_funct hold different formats of what is essentially the same data.
        # The former holds labels, while the latter holds actual, full call instructions.
        # We convert the former to the latter for comparisons sake.
        ret_list = deepcopy(ret_map[f])
        
        for label in ret_list:
            temp_label = "\tcmpq\t$" + label 
            temp_label = temp_label[:-1]
            temp_label = temp_label + ", -8(%rsp)"
            ret_list[ret_list.index(label)] = temp_label
        
        rets_to_delete = list(set(return_sites_for_funct) - set(ret_list))
            
        for del_line in rets_to_delete:
            
            ind = Global.file_lines_map[f.asm_filename].index(del_line)
            Global.file_lines_map[f.asm_filename].pop(ind)
            Global.file_lines_map[f.asm_filename].pop(ind)
            f.cdi_return_sites.remove(del_line)

def collect_calls(funct):
    callsite_line = "\tcall\t" + funct.asm_name
    
    indices_map = defaultdict(list)
    for key in Global.file_lines_map.keys():
        line_no = 0
        for line in Global.file_lines_map[key]:
            if callsite_line == line:
                indices_map[key].append(line_no)    
            line_no += 1
            
    return indices_map
            
def distribute_callsites_among_clones(funct, all_functs):
    """
    funct must be an original function-- not a copy.
    """
    num_functs = len(funct.clones) + 1
    functs = [funct]
    for clone in funct.clones:
        functs.append(clone)
    
    # Init funct to return label map.
    funct_to_return_label_map = dict()
    for f in functs:
        funct_to_return_label_map[f] = []

    # Perform call sled rewrite
    call_sites_map = collect_calls(funct)
    for key in call_sites_map.keys():
        for i in range(len(call_sites_map[key])):
            funct_num_to_assign_callsite_to = i % num_functs
            funct_to_assign_callsite_to = functs[funct_num_to_assign_callsite_to]
            # Edit actual callsite
            current_call_site_line_number = call_sites_map[key][i]
            n = 0 
            Global.file_lines_map[key][current_call_site_line_number] = "\tcall\t" + funct_to_assign_callsite_to.asm_name   
            closest_func = get_funct_via_line(current_call_site_line_number+1, all_functs, key)                
            desired_line_1 = Global.file_lines_map[key][current_call_site_line_number+1]
            desired_line_2 = Global.file_lines_map[key][current_call_site_line_number+2]
            if desired_line_1.startswith('.globl'):              
                n= parse_line(desired_line_2)
                glabel = ".globl _CDI_" + funct_to_assign_callsite_to.asm_filename + "." + funct_to_assign_callsite_to.asm_name + "_TO_" + closest_func.asm_filename + "."  + closest_func.asm_name + "_" + str(n)                  
                Global.file_lines_map[key][current_call_site_line_number+1] = glabel
                label = "_CDI_" + funct_to_assign_callsite_to.asm_filename + "." + funct_to_assign_callsite_to.asm_name + "_TO_" + closest_func.asm_filename + "." + closest_func.asm_name + "_" + str(n) + ":" 
                Global.file_lines_map[key][current_call_site_line_number+2] = label 
            else:
                num= parse_line(desired_line_1)
                label = "_CDI_" + funct_to_assign_callsite_to.asm_filename + "." + funct_to_assign_callsite_to.asm_name + "_TO_" + closest_func.asm_filename + "." + closest_func.asm_name + "_" + str(num) + ":" 
                Global.file_lines_map[key][current_call_site_line_number+1] = label 

            funct_to_return_label_map[funct_to_assign_callsite_to].append(label)
    
    return funct_to_return_label_map

def get_funct_via_line(line_num, all_functs, file):
    ind = line_num
    
    closest_funct = None
    
    for f in all_functs:
        funct_list = [f]
        funct_list.extend(f.clones)
        for fc in funct_list:
            if(fc.asm_filename != file):
                continue
            start_line_of_fc = fc.get_cdi_line_num(Global.file_lines_map)
            if(closest_funct == None or (start_line_of_fc > closest_funct.get_cdi_line_num(Global.file_lines_map) and start_line_of_fc < ind)):
                closest_funct = fc
    return closest_funct

def parse_line(line):
    if(line.startswith('_CDI')):
        str = line.split('_TO_')
        source = str[0].replace("CDI", "").split('.')
        dest = str[1].replace("CDI", "").replace(":","").split('.')
        s = source[2]
        f = source[0].replace("_", "")
        d = dest[2].rsplit('_', 1)[0]
        n = dest[2].rsplit('_', 1)[-1]

        return n
    else:
        return None

def finalize_output_file(code_lines_map):
    for key in code_lines_map.keys():
        name = key.replace('.s', '.cdi.s')
        output_file = open(name, 'w')
        for line in code_lines_map[key]:
            output_file.write(line + '\n')
        output_file.close()
          
import sys   
def extract_funct_alt(funct_lines, funct_name, starting_line_num):
    """
    Constructs a cloned function from an array of code lines. 
    """
    start_line_num = 0
    call_list = ["call","callf", "callq"]
    returns = ["ret", "retf", "iret", "retq", "iretq"]
    jmp_list = ["jo", "jno", "jb", "jnae", "jc", "jnb", "jae", "jnc", "jz", 
                "je", "jnz", "jne", "jbe", "jna", "jnbe", "ja", "js", "jns", 
                "jp", "jpe", "jnp", "jpo", "jl", "jnge", "jnl", "jge", "jle",
                "jng", "jnle", "jg", "jecxz", "jrcxz", "jmp", "jmpe"]
    CALL_SITE, RETURN_SITE, INDIR_JMP_SITE, PLT_SITE, = 0, 1, 2, 3
    
    comment_continues = False
    sites = []
    direct_call_sites = []
    empty_ret_dict = dict()
    line_num = starting_line_num
    
    for asm_line in funct_lines:
        asm_parsing.update_dwarf_loc(asm_line, dwarf_loc)
        try:
            first_word = asm_line.split()[0]
        except IndexError:
            # ignore empty line
            asm_line = asm_file.readline()
            line_num += 1
            continue
        if first_word[:len('.LFE')] == '.LFE':
            break
        else:
            targets = []
            labels, key_symbol, arg_str, comment_continues = (
                    asm_parsing.decode_line(asm_line, comment_continues))

        if key_symbol in call_list:
            new_site = funct_cfg.Site(line_num, targets, CALL_SITE, dwarf_loc)
            if '%' not in arg_str:
                new_site.targets.append(arg_str)
                direct_call_sites.append(new_site)
            sites.append(new_site)
        elif key_symbol in returns:
            # empty return dict passed so that every site's return dict is
            # a reference to the function's return dict
            sites.append(funct_cfg.Site(line_num, empty_ret_dict, RETURN_SITE,
                         dwarf_loc))
        elif key_symbol in jmp_list:
            if '%' in arg_str:
                sites.append(funct_cfg.Site(line_num, targets, INDIR_JMP_SITE,
                             dwarf_loc))
        line_num += 1
    else:
        eprint(dwarf_loc.filename() + ':' + ' ' + ':' 
                + str(start_line_num) + ' error: unterminated function: ',
                funct_name)

    src_filename = dwarf_loc.filename()
    new_funct = funct_cfg.Function(funct_name, ' ', 
            src_filename, sites, starting_line_num)
    new_funct.direct_call_sites = direct_call_sites
    new_funct.ret_dict = empty_ret_dict
    return new_funct, line_num
         
def clone_function(funct, functs):
    line_num = funct.get_cdi_line_num(Global.file_lines_map)
    copies = []
    clone_num = funct.get_num_clones() + 2
    end = funct.get_cdi_end_line_num(Global.file_lines_map, functs)
    start = line_num
    
    end_line_content = Global.file_lines_map[funct.asm_filename][end]    
    labels = []
    return_lines = []
    
    for line in Global.file_lines_map[funct.asm_filename][start:]:       
        if(line_num < end):
            if(line.startswith('.L') or line.startswith('.CDI')): #gather labels
                labels.append(line.replace(':', ''))               
            altered_line = line.replace(funct.uniq_label, funct.uniq_label + "_clone" + str(clone_num))
            if("\tcmpq\t$_CDI_" in altered_line):
                return_lines.append(altered_line)
            if(".file" in altered_line):
                line_num += 1  
                continue
            
            if(".local" in altered_line):
                line_num += 1   
                continue
                
            if(".comm" in altered_line):
                line_num += 1
                continue
            
            # Special: If we hit a call...
            if "\tcall\t" in altered_line:
                #Add return site to function being called.
                special_ret_site = Global.file_lines_map[funct.asm_filename][line_num]
                
                if ".globl" not in Global.file_lines_map[funct.asm_filename][line_num+1]:
                    return_label = Global.file_lines_map[funct.asm_filename][line_num+1]
                else:    
                    return_label = Global.file_lines_map[funct.asm_filename][line_num+2]
                return_label = return_label.replace(funct.uniq_label, funct.uniq_label + "_clone" + str(clone_num))
                
                # Find funct being called
                name_of_funct_being_called = special_ret_site.split('\t')[2]
                funct_being_called = get_funct_via_name(name_of_funct_being_called, functs)
                
                # Perform insertion
                if funct_being_called is not None:
                    increment = funct_being_called.insert_return_site(return_label, Global.file_lines_map, line_num)
                    line_num += increment
                    end += increment
            
            copies.append(altered_line)
            line_num += 1
    
    copies = fix_names(copies, funct, labels, clone_num) #add _clone_num to other places needed
    true_end = Global.file_lines_map[funct.asm_filename].index(end_line_content)
    
    Global.file_lines_map[funct.asm_filename][true_end:true_end] = copies
    
    f,n = extract_funct_alt(copies, funct.asm_name + "_clone" + str(clone_num), true_end)
    f.asm_filename = funct.asm_filename
    
    for ret_line in return_lines:
        if ret_line not in f.cdi_return_sites:
            f.cdi_return_sites.append(ret_line)
    
    if f not in funct.clones:
        funct.clones.append(f)

    return f
    
#For debugging purposes    
def dump_lines_snapshot(special_name):
    for key in Global.file_lines_map.keys():
        name = key.replace('.s', '.snap_' + special_name + ".txt")
        output_file = open(name, 'w')
        for line in Global.file_lines_map[key]:
            output_file.write(line + '\n')
        output_file.close()  

def get_funct_via_name(funct_name, all_functs):
    for funct in all_functs:
        if funct.asm_name == funct_name:
            return funct
            
    return None
    
def fix_names(copies, funct, labels, clone_num): 
    copies[0] = copies[0].replace(':', '') #remove :
    copies[0] = copies[0].replace(copies[0], copies[0] + '_clone' + str(clone_num) + ':') #add clone_num to name of funct
    for s in labels:
        for line in copies:
            ind = copies.index(line)
            if(s in line or line.startswith(s)):
                #get index of label and replace it with _clone_num
                line = line.replace(s, s + "_clone" + str(clone_num))            
                copies[ind] = line  
            if('.size' in line):
                line = line.replace(line, '\t.size\t' + funct.asm_name + '_clone' +str(clone_num)+ ',\t.-' + funct.asm_name+ '_clone' + str(clone_num))
                copies[ind] = line 
    return copies
    
def cdi_asm_name(asm_name):
    assert asm_name[-2:] == '.s'
    return asm_name[:-2] + '.cdi.s'

def write_lines(num_lines, asm_src, asm_dest, dwarf_loc):

    """Writes from file obj asm_src to file obj asm_dest num_lines lines"""
    i = 0
    while i < num_lines:
        asm_line = asm_src.readline()
        asm_parsing.update_dwarf_loc(asm_line, dwarf_loc)
        register_file_lines(asm_line, asm_src.name)
        i += 1

def convert_to_cdi(site, funct, asm_line, asm_dest, cfg, 
        sled_id_faucet, dwarf_loc, options, functs):
    """Converts asm_line to cdi compliant code then writes it to asm_dest"""

    if site.group == site.CALL_SITE:
        convert_call_site(site, funct, asm_line, asm_dest, 
                sled_id_faucet, dwarf_loc, options, functs)
    elif site.group == site.RETURN_SITE:
        convert_return_site(site, funct, asm_line, asm_dest, cfg, 
                sled_id_faucet, dwarf_loc, options, functs)
    elif site.group == site.INDIR_JMP_SITE:
        convert_indir_jmp_site(site, funct, asm_line, asm_dest)
    elif site.group == site.PLT_SITE:
        register_file_lines(asm_line, funct.asm_filename)
    else:
        eprint('warning: site has invalid type: line ' + site.asm_line_num, 
                'in function named \'' + funct.asm_name + '\'')

def increment_dict(dictionary, key, start=1):
    dictionary[key] = dictionary.get(key, start - 1) + 1
    return dictionary[key]

def convert_call_site(site, funct, asm_line, asm_dest, 
        sled_id_faucet, dwarf_loc, options, functs):

    arg_str = asm_parsing.decode_line(asm_line, False)[2]

    indirect_call = '%' in arg_str
    if not indirect_call:
        assert len(site.targets) == 1
        target_name = site.targets[0].uniq_label
        times_fixed = increment_dict(funct.label_fixed_count, target_name)
        label = '_CDI_' + target_name + '_TO_' + funct.uniq_label + \
                '_' + str(times_fixed)

        globl_decl = ''
        if funct.asm_filename != site.targets[0].asm_filename:
            globl_decl = '.globl\t' + label + '\n'
        
        register_file_lines(asm_line + globl_decl + label + ':\n', funct.asm_filename)
        return
    
    call_sled = ''
    assert len(arg_str.split()) == 1

    for target in site.targets:
        target_name = target.uniq_label
        call_operand = arg_str.replace('*', '')
        times_fixed = increment_dict(funct.label_fixed_count, target_name)

        return_label = '_CDI_' + target_name + '_TO_' + funct.uniq_label 
        return_label += '_' + str(times_fixed)

        globl_decl = ''
        if funct.asm_filename != target.asm_filename:
            globl_decl = '.globl\t' + return_label + '\n'
        
        call_sled += '1:\n'
        call_sled += '\tcmpq\t$' + target_name + ', ' + call_operand + '\n'
        call_sled += '\tjne\t1f\n'
        call_sled += '\tcall\t' + target_name + '\n'
        call_sled += globl_decl
        call_sled += return_label + ':\n'
        call_sled += '\tjmp\t2f\n'
       
    call_sled += '1:\n'
    cdi_abort_line = cdi_abort_str(sled_id_faucet(), funct.asm_filename, 
            options['--no-abort-messages'], dwarf_loc)
    call_sled += cdi_abort_line
    call_sled += '2:\n'
    
    register_file_lines(call_sled, funct.asm_filename)

def register_file_lines(content, file_name):
    r = content.split('\n')
    while '' in r:
        r.remove('')
    Global.file_lines_map[file_name].extend(r)
        
def convert_return_site(site, funct, asm_line, asm_dest, cfg,
        sled_id_faucet, dwarf_loc, options, functs):
    # don't fix 'main' in this version
    if funct.asm_name == 'main':
        register_file_lines(asm_line, funct.asm_filename)
        return

    cdi_ret_prefix = '_CDI_' + funct.uniq_label + '_TO_'

    ret_sled = '\taddq $8, %rsp\n'
    
    for target_label, multiplicity in site.targets.iteritems():
        i = 1
        while i <= multiplicity:
            sled_label = cdi_ret_prefix + target_label + '_' + str(i)
            new_comparison_line = '\tcmpq\t$' + sled_label + ', -8(%rsp)\n'
            ret_sled += new_comparison_line
            funct.register_return_site(new_comparison_line)
            ret_sled += '\tje\t' + sled_label + '\n'
            i += 1
       
    cdi_abort_line = cdi_abort_str(sled_id_faucet(), funct.asm_filename,
        options['--no-abort-messages'], dwarf_loc)
            
    ret_sled += cdi_abort_line
   
    register_file_lines(ret_sled, funct.asm_filename)


def convert_indir_jmp_site(site, funct, asm_line, asm_dest):
    pass

def cdi_abort_str(sled_id, asm_filename, no_abort_msg, dwarf_loc):
    """Return string that aborts from cdi code with a useful debug message"""

    loc_str = asm_filename
    if dwarf_loc.valid():
        loc_str = str(dwarf_loc) + ':' + loc_str

    call_cdi_abort = ''
    if no_abort_msg:
        call_cdi_abort = '\tmovq\t$0, %rdx\n\tcall _CDI_abort\n'

    else:
        call_cdi_abort += '\tmovq\t $.CDI_sled_id_' + str(sled_id) + ', %rsi\n'
        call_cdi_abort += '\tmovq\t$.CDI_sled_id_' + str(sled_id) + \
                          '_len, %rdx\n'
        call_cdi_abort += '\tcall\t_CDI_abort\n'
        call_cdi_abort += '.CDI_sled_id_' + str(sled_id) + ':\n'
        call_cdi_abort += '\t.string\t\"' + loc_str + ' id=' + str(sled_id) + \
                          '\"\n'
        call_cdi_abort += '\t.set\t.CDI_sled_id_' + str(sled_id) + '_len, '
        call_cdi_abort += '.-.CDI_sled_id_' + str(sled_id) + '\n'

    return call_cdi_abort

