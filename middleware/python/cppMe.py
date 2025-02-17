ENABLE_DEBUG = True
if ENABLE_DEBUG:
    from inspect import getframeinfo, stack
    import os

    badFile = "/middleware/python/cppMe.py"
    fullbadPath = os.environ.get("GALAPAGOS_PATH") + badFile


class cppMeFile():
    """
    Basically a file handle with a bunch of helper functions to make writing TCL
    files easier.
    """
    fileHandle = None

    def __init__(self, fileName):
        """
        Initialize this object with a file handle and a pointer to a node object
        for the particular FPGA we're dealing with

        Args:
            fileName (string): The file name
            fpga: The node object for the FPGA of interest
        """
        self.fileHandle = open(fileName + '.cpp', 'w')
        self.indent = 0
        self.in_function = False
        self.prev_line = -1

    def tprint_raw(self, cmd, end='\n'):
        """
        Print string directly to output TCL file

        Args:
            cmd (string): The command
            end (string): Optional line end string
        """
        self.fileHandle.write(cmd + end)

    def tprint(self, cmd, end='\n'):
        """
        Wrapper around tprint_raw which allows for debugging
        """
        if ENABLE_DEBUG:
            stackIndex = 0
            fullPath = ""
            for index, stackFrame in enumerate(stack()):
                caller = getframeinfo(stackFrame[0])
                if caller.filename != fullbadPath:
                    fullPath = caller.filename
                    stackIndex = index
                    break
            caller = getframeinfo(stack()[stackIndex][0])
            if self.prev_line != caller.lineno:
                self.fileHandle.write(" "*self.indent+"// " + fullPath + ":" + str(caller.lineno) + '\n')
            self.prev_line = caller.lineno
        self.tprint_raw(cmd, end)
    def inc_indent(self):
        self.indent = self.indent + 4
    def dec_indent(self):
        if self.indent < 2:
            raise ValueError("Attempting to set indent negative")
        self.indent = self.indent - 4
    def iprint(self,cmd):
        self.tprint(" "*self.indent+cmd)
    def cline(self,cmd):
        self.iprint(cmd+";")
    def clines(self,cmd_array):
        for cmd in cmd_array:
            self.cline(cmd)
    def object_write(self,variable,params,values):
        if len(params)!= len(values):
            raise ValueError("Performing an object write where values does not match parameters")
        for idx in range(len(params)):
            self.cline(variable + "." + str(params[idx]) + " = " + str(values[idx]))
    def object_copy(self,target,source,params):
        for idx in range(len(params)):
            self.cline(target + "." + str(params[idx]) + " = " + source + "." + str(params[idx]))
    def set_pragma(self,content):
        self.iprint("#pragma "+content)
    def set_axis_pragmas(self,ports):
        for port in ports:
            self.set_pragma("HLS INTERFACE axis port="+port+" register_mode=off")
    def import_libs(self,libs):
        for lib in libs:
            self.tprint('#include ' + lib)
    def declare_function(self,name,params):
        if self.in_function:
            raise ValueError ("Attempting to write C++ file with a function inside another function")
        self.iprint("void " + name + "(")
        self.in_function = True
        self.inc_indent()
        notFirst = False
        for param in params:
            self.iprint(notFirst*","+ " ".join(param))
            notFirst = True
        self.iprint(");")
        self.dec_indent()
    def start_function(self,name,params):
        if self.in_function:
            raise ValueError ("Attempting to write C++ file with a function inside another function")
        self.iprint("void " + name + "(")
        self.in_function = True
        self.inc_indent()
        notFirst = False
        for param in params:
            self.iprint(notFirst*","+ " ".join(param))
            notFirst = True
        self.iprint(")")
        self.dec_indent()
        self.iprint("{")
        self.inc_indent()
    def end_function(self):
        if not self.in_function:
            raise ValueError ("Attempting to write C++ file with a function ending without having started")
        self.dec_indent()
        self.iprint("}")
        self.in_function = False
    def declare_var(self,type,name):
        self.cline(type + " " + name)
    def declare_array(self,type,name,length,init=[]):
        line_to_write = type + " " + name+"["+str(length)+"]"
        if len(init)!=0:
            line_to_write = line_to_write + " = {" + str(init[0])
            for i in range (len(init)-1):
                line_to_write = line_to_write + " , " + str(init[i+1])
            line_to_write = line_to_write + "}"
        self.cline(line_to_write)

    def return_stream(self,data,user,dest,id):
        return "ap_axiu<"+str(data)+", "+str(user)+", "+str(dest)+", "+str(id)+" >"
    def start_block(self,type,cond=""):
        if cond=="":
            self.iprint(type)
        else:
            self.iprint(type+" ("+cond+")")
        self.iprint("{")
        self.inc_indent()
    def end_block(self):
        self.dec_indent()
        self.iprint("}")
    def close(self):
        self.fileHandle.close()
