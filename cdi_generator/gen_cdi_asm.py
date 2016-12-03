import funct_cfg
import operator
import asm_parsing
import sys

def gen_cdi_asm(cfg, asm_file_descrs, options):
    """Writes cdi compliant assembly from cfg and assembly file descriptions"""
    
    sled_id_faucet = funct_cfg.SledIdFaucet()
    all_functs = list()
    for descr in asm_file_descrs:
        asm_parsing.DwarfSourceLoc.wipe_filename_mapping()
        dwarf_loc = asm_parsing.DwarfSourceLoc()
        asm_src = open(descr.filename, 'r')
        asm_dest = open(cdi_asm_name(descr.filename), 'r+')
        descr_functs = [cfg.funct(descr.filename + '.' + n) for n in descr.funct_names]
        functs = sorted(descr_functs, key=operator.attrgetter('asm_line_num'))
        all_functs.extend(functs)
       
         
        asm_line_num = 1
        for funct in functs:
            num_lines_to_write = funct.asm_line_num - asm_line_num
            write_lines(num_lines_to_write, asm_src, asm_dest, dwarf_loc)
            asm_line_num = funct.asm_line_num
            #increment_cdi_funct(functs, funct, num_lines_to_write)
            
            # unique labels are always global so that even static functions
            # can be reached from anywhere with sleds (Function pointers can
            # point to ANY function with the same signature, even static 
            # functions in a different translation unit)
            #asm_dest.write('.globl\t' + funct.uniq_label + '\n')
            debug_write(asm_dest, '.globl\t' + funct.uniq_label + '\n', functs, funct, apply_to_current_funct=True)
            #asm_dest.write(funct.uniq_label + ':\n')
            debug_write(asm_dest,funct.uniq_label + ':\n', functs, funct, apply_to_current_funct=True)
            #increment here by 2
            #increment_cdi_funct(functs, funct, 2, apply_to_current_funct=True)           
            
            funct.label_fixed_count = dict()
            for site in funct.sites:
                num_lines_to_write = site.asm_line_num - asm_line_num
                write_lines(num_lines_to_write, asm_src, asm_dest, dwarf_loc)
                #increment_cdi_funct(functs, funct, num_lines_to_write)
                
                line_to_fix = asm_src.readline()
                asm_line_num = site.asm_line_num + 1
                #increment_cdi_funct(functs, funct, 1) #shushu
                convert_to_cdi(site, funct, line_to_fix, asm_dest, cfg,
                        sled_id_faucet, dwarf_loc, options, functs)
                        
       
        # write the rest of the lines over
        src_line = asm_src.readline()
        while src_line:
            #asm_dest.write(src_line)
            debug_write(asm_dest, src_line, all_functs, all_functs[-1])
            src_line = asm_src.readline()
        #code here
        print("We're here")
        init_functToCallSites_map(all_functs)
        # pass descr for .s file, while asm_dest for .cdi.s file
        cp = clone_function(all_functs[2], asm_dest)
       
        asm_src.close()
        asm_dest.close()
 

 
functToCalSitesMap = dict() 
      
def init_functToCallSites_map(functs):
    #map = dict()
    for funct_org in functs:
        functToCalSitesMap[funct_org] = set()
        #print "Finding References to funct: " + funct_org.uniq_label
        for other_funct in functs:
            #print "Investigating funct: " + other_funct.uniq_label
            for site in other_funct.sites:
                if site.group == funct_cfg.Site.CALL_SITE:
                    #print "checking site:" + site.targets[0].uniq_label
                    if(site.targets[0] == funct_org):
                        functToCalSitesMap[funct_org].add(site)
                        #print "YES!"
    """
    for k in functToCalSitesMap:
        print(k.uniq_label)
        print('===')
        for item in functToCalSitesMap[k]:
            print(item.targets[0].uniq_label)
        print("-------------")    
        """
    return functToCalSitesMap
   
def increment_cdi_funct(functs, current_funct, amount, apply_to_current_funct=False):
    ind = functs.index(current_funct)
    if(apply_to_current_funct is False):
        ind = ind + 1
    
    # Bounds check
    if(ind >= len(functs)):
        return
        
    for item in functs[ind:]:
        item.asm_cdi_line_num += amount

   
def seek_file_to_line_number(file, target_line_no):
    # .name for reading cdi.s, while .filename for reading .s
    file.seek(0)
    #file = open(file_descr.name, 'r+')
    line = file.readline()
    current_line_num = 1
    while line:
        line = file.readline()
        current_line_num += 1
        if current_line_num >= target_line_no-1:
            return file
    #file.close()
    print "ERROR: target_line_no doesn't exist. Seeking failed."
    return None
    
import fileinput
 
def clone_function(funct, file_handler):
    # 1. Collect all lines in funct.
    # 2. Copy/Insert all lines after funct.
    # 3. Run extract_function to get new funct object.
    line_num = funct.asm_cdi_line_num
    #line_num += 1
    
    print(funct.asm_cdi_line_num)
    print("FILE: " + file_handler.name)
    print("FUNCTION: "  + funct.uniq_label)
    
    file_handler = seek_file_to_line_number(file_handler, line_num)
    #file_handler = open(file_.name, "r+")
    #file_handler.seek(line_num)
    asm_line = file_handler.readline()
    print(line_num)
    print(asm_line)
    copies = []
    return
    """
    try:
        first_word = asm_line.split()[0]
    except IndexError:
        pass # ignore empty line
        
    comment_continues = False
    sites = []
    direct_call_sites = []
    empty_ret_dict = dict()

    while asm_line:
        copies.append(asm_line)
        
        #asm_parsing.update_dwarf_loc(asm_line, dwarf_loc)
        try:
            first_word = asm_line.split()[0]
        except IndexError:
            # ignore empty line
            asm_line = file_handler.readline()
            line_num += 1
            
            continue

        if (first_word[:len('.LFE')] == '.LFE'):
            break
        
        asm_line = file_handler.readline()
        line_num += 1
    else:
        eprint(dwarf_loc.filename() + ':' + file_handler.name + ':' 
                + start_line_num + ' error: unterminated function: ', funct_name)
        sys.exit(1)
    
    #return copies
    #part 2: writing to the .s file
    file_handler.close()

  
    count = 0
    for line in fileinput.input(file_descr.filename, inplace=1):
        if count >= line_num:
            for c in copies:
                print c          
            break        
        #print line,
        count += 1
    """        
def cdi_asm_name(asm_name):
    assert asm_name[-2:] == '.s'
    return asm_name[:-2] + '.cdi.s'

def write_lines(num_lines, asm_src, asm_dest, dwarf_loc):
    """Writes from file obj asm_src to file obj asm_dest num_lines lines"""
    i = 0
    while i < num_lines:
        asm_line = asm_src.readline()
        asm_parsing.update_dwarf_loc(asm_line, dwarf_loc)
        asm_dest.write(asm_line)
        #debug_write(asm_dest, asm_line)
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
        #asm_dest.write(asm_line)
        debug_write(asm_dest, asm_line, functs, funct)
        #increment_cdi_funct(functs, funct, 1)
    else:
        eprint('warning: site has invalid type: line ' + site.asm_line_num, 
                'in function named \'' + funct.asm_name + '\'')

def increment_dict(dictionary, key, start = 1):
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
        label = '_CDI_' + target_name + '_TO_' + funct.uniq_label + '_' + str(times_fixed)

        globl_decl = ''
        if funct.asm_filename != site.targets[0].asm_filename:
            globl_decl = '.globl\t' + label + '\n'
        
        #asm_dest.write(asm_line + globl_decl + label + ':\n')
        debug_write(asm_dest, asm_line + globl_decl + label + ':\n', functs, funct)
        #increment_cdi_funct(functs, funct, c) #or 2?
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
       
        
    call_sled += '1:\n' # 8 complete lines
    cdi_abort_line = cdi_abort_str(sled_id_faucet(), funct.asm_filename, 
            options['--no-abort-messages'], dwarf_loc)
    call_sled += cdi_abort_line
    call_sled += '2:\n'
    
    #print("hi honey: " + call_sled)
    #print("The result: " + str(c))
    #increment_cdi_funct(functs, funct, c)
    #asm_dest.write(call_sled)
    debug_write(asm_dest, call_sled, functs, funct)
    
def super_newline_count(content):
    quotation_mode = False
    newline_count = 0
    for char in content:
        if quotation_mode == False:
            if char == '\n':
                newline_count += 1
        if char == '\"':
            quotation_mode = not quotation_mode
        
    return newline_count
    
def debug_write(file_handler, content, all_functs, funct, apply_to_current_funct=False):
    num_new_lines = super_newline_count(content)
    
    sys.stdout.write("[ADDITIONAL LINES BEGIN (" + str(num_new_lines) +  ")]\n")
    sys.stdout.write(content)
    sys.stdout.write("[ADDITIONAL LINES END]\n")
    sys.stdout.flush()
    
    increment_cdi_funct(all_functs, funct, num_new_lines, apply_to_current_funct)
    file_handler.write(content)
        
def convert_return_site(site, funct, asm_line, asm_dest, cfg,
        sled_id_faucet, dwarf_loc, options, functs):
    # don't fix 'main' in this version
    if funct.asm_name == 'main':
        #asm_dest.write(asm_line)
        debug_write(asm_dest, asm_line, functs, funct)
        return

    cdi_ret_prefix = '_CDI_' + funct.uniq_label + '_TO_'

    ret_sled= '\taddq $8, %rsp\n'
    
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
   
    #increment_cdi_funct(functs, funct, c)
    #asm_dest.write(ret_sled)
    debug_write(asm_dest, ret_sled, functs, funct)


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
        call_cdi_abort += '\tmovq\t$.CDI_sled_id_' + str(sled_id) +'_len, %rdx\n'
        call_cdi_abort += '\tcall\t_CDI_abort\n'
        call_cdi_abort += '.CDI_sled_id_' + str(sled_id) + ':\n'
        call_cdi_abort += '\t.string\t\"' + loc_str + ' id=' + str(sled_id) + '\"\n'
        call_cdi_abort += '\t.set\t.CDI_sled_id_' + str(sled_id) + '_len, '
        call_cdi_abort += '.-.CDI_sled_id_' + str(sled_id) + '\n'

    return call_cdi_abort

