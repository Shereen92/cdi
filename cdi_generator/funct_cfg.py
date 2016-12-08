"""
funct_cfg.py ~ A module housing classes representing Control Flow Graphs,
               Functions, etc.
"""

import types
import jsonpickle

class FunctControlFlowGraph:
    """A CFG class with functions as vertices instead of basic blocks

    Function are accessed by their "uniq_label" which is in the form:

        <source filename>.<assembly function name>

    Notice that in C the assembly function name is simply the source name, while
    in C++ it is the source function name but mangled
    """

    def __init__(self):
        # don't touch this attribute; it's internal
        self._funct_vertices = dict()

    def add_funct(self, funct):
        """
        Add funct to the control flow graph.
        """
        uniq_label = funct.asm_filename + '.' + funct.asm_name
        self._funct_vertices[uniq_label] = funct

    def funct(self, uniq_label):
        return self._funct_vertices[uniq_label]

    def __iter__(self):
        return iter(FunctControlFlowGraphIterator(self))

    def __contains__(self, funct):
        return funct in self._funct_vertices.values()

    def print_json_to(self, filename):
        with open(filename, 'w') as cfg_file:
            encoding = jsonpickle.encode(self)
            cfg_file.write(encoding)

class FunctControlFlowGraphIterator:
    def __init__(self, cfg):
        self.cfg_iter = iter(cfg._funct_vertices.values())

    def __iter__(self):
        return self

    def next(self):
        return self.cfg_iter.next()

class CDIRetSite:
    """
    A container for the 2 lines that compose a ret site.
    """
    def __init__(self, line_1, line_2):
        """
        "lines" is a length 2 list. The first line looks something like...
        cmpq	$_CDI_benchmark.s.encipher_TO_benchmark.s.cipher_main_1, -8(%rsp)
        while the second line looks something like...
        je	_CDI_benchmark.s.encipher_TO_benchmark.s.cipher_main_1
        """
        self.line_1 = line_1
        self.line_2 = line_2
        
    def GetLineNumbers(self, file_content):
        return file_content.index(self.line_1), \
            file_content.index(self.line_2)
        
class Function:
    def __init__(self, asm_name, asm_filename, src_filename, sites, 
                 asm_line_num):
        self.asm_name = asm_name
        self.asm_filename = asm_filename
        self.sites = sites
        self.asm_line_num = asm_line_num
        #self.asm_cdi_line_num = asm_line_num
        #self.asm_cdi_end_line_num = -1
        self.uniq_label = asm_filename + '.' + asm_name
        self.src_filename = src_filename
        self.body = []
        self.clones = []
        self.cdi_return_sites = []
        
        # unitialized / improperly set until gen_cfg finishes
        self.ftype = None # function type
        self.ret_dict = dict()
        self.is_global = True
    
    def get_num_clones(self):
        return len(self.clones)

    def register_return_site(self, line):
        if line[-1] == '\n':
            line = line[:-1]
        self.cdi_return_sites.append(line)

    def get_cdi_line_num(self, file_lines_map):   
        #print("HEREEEE " + self.asm_filename)
        #print(self.asm_name)
        for line in file_lines_map[self.asm_filename]:
            if self.asm_name in line:
                #print "FOUND 1: " + line
                if ':' in line:
                    #print "FOUND 2 -> " + str(line) + " with length " + str(len(line)) + " compared to: " + str(self.asm_name) + " with " + str(len(self.asm_name)+1)
                    if len(line) == len(self.asm_name)+1:
                        #print "FOUND 3"
                        
                        return file_lines_map[self.asm_filename].index(line)
                        
    def get_cdi_end_line_num(self, file_lines_map, functs):
        closest = 9999999
        cur_position = self.get_cdi_line_num(file_lines_map) 
        for funct in functs:
            if funct == self:
                continue
            func_position = funct.get_cdi_line_num(file_lines_map)
            diff = func_position - cur_position
            if diff < closest and diff > 0:
                closest = diff
        end = cur_position + closest 
        return end

class FunctionType:
    """
    A function signature type. May be associated with a particular function
    """
    def __init__(self, mangled_str):
        self.mangled_str = mangled_str
        self.src_name = '' # used when function type

        # location
        self.src_filename = ''
        self.src_line_num = -1
        self.enclosing_funct_name = '' # optional (used for fp location)

    def __str__(self):
        if not self.src_name:
            return self.mangled_str
        after_z_index = self.mangled_str.find('_Z') + len('_Z')
        name_index = self.mangled_str.find(self.src_name, after_z_index)
        return (self.mangled_str[:after_z_index] + 
                self.mangled_str[name_index + len(self.src_name):])

    def is_local(self):
        """
        Returns true if signature associated with particular funct is static
        """

        # must be associated with particular function
        assert self.src_name
        z_index = self.mangled_str.find('_Z')
        return self.mangled_str[z_index + len('_Z')] == 'L'

    def __eq__(self, other):
        return str(self) == str(other)

    def __ne__(self, other):
        return not self.__eq__(other)

FunctionType.arbitrary = FunctionType('')

class SledIdFaucet:
    def __init__(self):
        self.__sled_id = 0

    def __call__(self):
        self.__sled_id += 1
        return self. __sled_id

class Site:
    CALL_SITE = 0
    RETURN_SITE = 1
    INDIR_JMP_SITE = 2
    PLT_SITE = 3

    def __init__(self, line_num, targets, type_of_site, dwarf_loc):
        assert type(line_num) is types.IntType
        assert type(type_of_site) is types.IntType
        assert (type_of_site == Site.CALL_SITE or 
                type_of_site == Site.RETURN_SITE or
                type_of_site == Site.INDIR_JMP_SITE)

        self.actual_line = ""
        self.asm_line_num = line_num
        self.group = type_of_site
        self.targets = targets
        if dwarf_loc.valid():
            self.src_line_num = dwarf_loc.line_num
        else:
            self.src_line_num = ''

    def register_actual_line(self, line):
        if line[-1] == '\n':
            line = line[:-1]
        self.actual_line = line
            