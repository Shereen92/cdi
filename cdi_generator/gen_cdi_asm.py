"""
gen_cdi_asm.py ~ A module for CDI conversion of an assembly source file.
"""
import funct_cfg
import operator
import asm_parsing
from eprint import eprint

class Global:
    file_lines = []

def gen_cdi_asm(cfg, asm_file_descrs, options):
    """Writes cdi compliant assembly from cfg and assembly file descriptions"""
    
    sled_id_faucet = funct_cfg.SledIdFaucet()
    all_functs = list()
    for descr in asm_file_descrs:
        asm_parsing.DwarfSourceLoc.wipe_filename_mapping()
        dwarf_loc = asm_parsing.DwarfSourceLoc()
        asm_src = open(descr.filename, 'r')
        asm_dest = open(cdi_asm_name(descr.filename), 'r+')
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
            register_file_lines('.globl\t' + funct.uniq_label + '\n')
            register_file_lines(funct.uniq_label + ':\n')
            
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
            register_file_lines(src_line)
            src_line = asm_src.readline()
   
        # Perform cloning experiments (TODO: move to proper place)
        init_functToCallSites_map(all_functs)
        clone_function(all_functs[1], all_functs)
        
        finalize_output_file(asm_dest, Global.file_lines)
 
        asm_src.close()
        asm_dest.close()

def finalize_output_file(output_file, code_lines):
    for line in code_lines:
            output_file.write(line + '\n')
 
functToCallSitesMap = dict() 
      
def init_functToCallSites_map(functs):
    """
    Initialize the functToCallSitesMap.
    funct objects are keys. They associate with lists of call sites.
    """
    #map = dict()
    for funct_org in functs:
        functToCallSitesMap[funct_org] = set()
        #print "Finding References to funct: " + funct_org.uniq_label
        for other_funct in functs:
            #print "Investigating funct: " + other_funct.uniq_label
            for site in other_funct.sites:
                if site.group == funct_cfg.Site.CALL_SITE:
                    #print "checking site:" + site.targets[0].uniq_label
                    if(site.targets[0] == funct_org):
                        functToCallSitesMap[funct_org].add(site)
                        #print "YES!"
    return functToCallSitesMap
   

def seek_file_to_line_number(file_handler, target_line_no):
    """
    Seek a file handler a particular number of lines from the beginning
    of the handler's file.
    """
    file.seek(0)
    line = file.readline()
    current_line_num = 1
    while line:
        line = file.readline()
        current_line_num += 1
        if current_line_num >= target_line_no-1:
            return file
    eprint("ERROR: target_line_no doesn't exist. Seeking failed.")
    return None
     
def clone_function(funct, functs):
    line_num = funct.get_cdi_line_num(Global.file_lines)
    copies = []
    
    end = funct.get_cdi_end_line_num(Global.file_lines, functs)
    start = line_num
    for line in Global.file_lines[start:]:       
        if(line_num < end):
            copies.append(line.replace(funct.asm_name, funct.asm_name + "_2"))
        line_num += 1
    
    Global.file_lines[end:end] = copies
    
def cdi_asm_name(asm_name):
    assert asm_name[-2:] == '.s'
    return asm_name[:-2] + '.cdi.s'

def write_lines(num_lines, asm_src, asm_dest, dwarf_loc):
    """Writes from file obj asm_src to file obj asm_dest num_lines lines"""
    i = 0
    while i < num_lines:
        asm_line = asm_src.readline()
        asm_parsing.update_dwarf_loc(asm_line, dwarf_loc)
        register_file_lines(asm_line)
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
        register_file_lines(asm_line)
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
        
        register_file_lines(asm_line + globl_decl + label + ':\n')
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
    
    register_file_lines(call_sled)

def register_file_lines(content):
    r = content.split('\n')
    while '' in r:
        r.remove('')
    Global.file_lines.extend(r)
        
def convert_return_site(site, funct, asm_line, asm_dest, cfg,
        sled_id_faucet, dwarf_loc, options, functs):
    # don't fix 'main' in this version
    if funct.asm_name == 'main':
        register_file_lines(asm_line)
        return

    cdi_ret_prefix = '_CDI_' + funct.uniq_label + '_TO_'

    ret_sled = '\taddq $8, %rsp\n'
    
    for target_label, multiplicity in site.targets.iteritems():
        i = 1
        while i <= multiplicity:
            sled_label = cdi_ret_prefix + target_label + '_' + str(i)
            ret_sled += '\tcmpq\t$' + sled_label + ', -8(%rsp)\n'
            ret_sled += '\tje\t' + sled_label + '\n'
            i += 1
       
    cdi_abort_line = cdi_abort_str(sled_id_faucet(), funct.asm_filename,
        options['--no-abort-messages'], dwarf_loc)
            
    ret_sled += cdi_abort_line
   
    register_file_lines(ret_sled)


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

