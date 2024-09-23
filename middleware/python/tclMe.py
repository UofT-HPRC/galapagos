ENABLE_DEBUG = True
if ENABLE_DEBUG:
    from inspect import getframeinfo, stack
    import os
    badFile = "/middleware/python/tclMe.py"
    fullbadPath = os.environ.get("GALAPAGOS_PATH") + badFile

class tclMeFile():
    """
    Basically a file handle with a bunch of helper functions to make writing TCL
    files easier.
    """
    fileHandle = None

    def __init__(self, fileName, fpga):
        """
        Initialize this object with a file handle and a pointer to a node object
        for the particular FPGA we're dealing with
        
        Args:
            fileName (string): The file name
            fpga: The node object for the FPGA of interest
        """
        self.fileHandle = open(fileName + '.tcl', 'w')
        self.fpga = fpga
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
            fullname = ""
            for index, stackFrame in enumerate(stack()):
                caller = getframeinfo(stackFrame[0])
                if caller.filename != fullbadPath:
                    fullname = caller.filename
                    stackIndex = index
                    break                    
            caller = getframeinfo(stack()[stackIndex][0])
            if self.prev_line != caller.lineno:
                self.fileHandle.write("# " + fullname + ":" + str(caller.lineno) + '\n')
            self.prev_line = caller.lineno
        self.tprint_raw(cmd, end)
    def tlines(self,array):
        for line in array:
            self.tprint(line)
    def create_bd(self,name,clock,freq,reset):
        self.tlines(["create_bd_design "+name,
                     "create_bd_port -dir I -type clk -freq_hz "+str(freq)+" "+clock,
                     "create_bd_port -dir I -type rst "+reset,
                     "set_property CONFIG.ASSOCIATED_RESET {"+reset+"} [get_bd_ports /"+clock+"]"])
    def add_ip_repo(self, repoDir):
        self.tlines(["set existing_ip_repo_path [ get_property ip_repo_paths [current_project] ]",
                     "set addition_ip_repo_path "+repoDir,
                     "set new_ip_repo_path \"${existing_ip_repo_path} ${addition_ip_repo_path}\"",
                     "set_property ip_repo_paths $new_ip_repo_path [current_project]",
                     "update_ip_catalog -rebuild -scan_changes"])
    def createHierarchy(self, hierarchy):
        """
        Does what it says on the tin.
        
        Args:
            hierarchy (string): name of heirarchy
        """
        self.tprint('create_bd_cell -type hier ' + hierarchy)

    def addSource(self, source):
        """
        Adds a command to include another existing TCL file in this one
        
        Args:
            source (string): Full pathname of another TCL file
        """
        self.tprint('source ' + source)
    def addConstraints(self,file_path):
        self.tprint('add_files -fileset constrs_1 -norecurse '+file_path)
    def addVerilog(self,file_path):
        self.tprint('add_files -fileset sources_1 -norecurse ' + file_path)
        self.tprint('update_compile_order -fileset sources_1')
    def setInterfacesCLK(self,clk_name,intfs):
        self.tprint("set_property CONFIG.ASSOCIATED_BUSIF {",'')
        first_config = True
        for intf in intfs:
            if not first_config:
                self.tprint(":","")
            self.tprint(str(intf) , "")
        self.tprint("} [get_bd_ports /"+clk_name+"]")
    def setProperties(self, inst_name, properties):
        self.setGeneralProperies(inst_name,properties,'cells')
    def setPortProperties(self, inst_name, properties):
        self.setGeneralProperies(inst_name, properties, 'intf_ports')
    def setGeneralProperies(self, inst_name, properties, type):
        if properties != None:
            self.tprint('set_property -dict [list ', '')
        for prop in properties:
            self.tprint_raw(prop + ' ', end ='')
        if properties != None:
            self.tprint_raw('] [get_bd_'+type+' ' + inst_name + ']')
    def assign_address(self, slave_inst, slave_port, slave_base):
        
        if slave_inst != None:
            self.tprint('assign_bd_address [get_bd_addr_segs {' + slave_inst + '/' + slave_port + '/' + slave_base + '}]')
        else:
            self.tprint('assign_bd_address [get_bd_addr_segs {' + slave_port + '/' + slave_base + '}]')

    def set_address_properties(self, slave_inst, slave_port, slave_base, master, **properties):

        for key,value in properties.items():
            if slave_inst != None:
                self.tprint('set_property  ' + key + ' ' + value +  ' [get_bd_addr_segs {' + master + '/SEG_' + slave_inst + '_' + slave_base + '}]')
            else:
                self.tprint('set_property  ' + key + ' ' + value +  ' [get_bd_addr_segs {' + master + '/SEG_' + slave_port + '_' + slave_base + '}]')
    def add_if_to_clk(self,interface,clock):
        self.tprint("addIfToClock "+clock+" " + interface)
    def setup_axis_link(self,name,bytes,keep,last,dest,id,user):
        self.setPortProperties(name, ["CONFIG.HAS_TKEEP {"+ str(keep)+"}", "CONFIG.HAS_TLAST {"+ str(last)+"}",
                                      "CONFIG.TDEST_WIDTH {"+ str(dest)+"}", "CONFIG.TDATA_NUM_BYTES {"+ str(bytes)+"}",
                                      "CONFIG.TID_WIDTH {"+ str(id)+"}", "CONFIG.TUSER_WIDTH {"+ str(user)+"}"])
    def add_intf_pin(self,pin_name, intf_type, type):
        self.tprint("create_bd_intf_pin -mode "+type+" -vlnv "+intf_type+" "+pin_name)
    def add_intf_port(self, port_name, intf_type, type):
        self.tprint('create_bd_intf_port -mode '+type+' -vlnv '+intf_type+' '+port_name)
    def add_axis_port(self, port_name, type):
        self.add_intf_port(port_name, 'xilinx.com:interface:axis_rtl:1.0', type)
    def add_axi4_port(self, port_name, type):
        self.add_intf_port(port_name, 'xilinx.com:interface:aximm_rtl:1.0', type)
    def instBlockcc(self,ip,clk):

        self.tprint('addip ' + ip['name'] + ' ' +  ip['inst'])
        
        if 'properties' in ip and ip['properties'] != None:
            self.setProperties(ip['inst'], ip['properties'])

        if 'clks' in ip and ip['clks'] != None:
            for clk_name in ip['clks']:
                self.tprint('connect_bd_net [get_bd_ports '+clk+'] [get_bd_pins ' + ip['inst'] + '/' + clk_name + ']')

        if 'resetns' in ip and ip['resetns'] != None:
            if ip['resetns_port'] != None:
                for reset_name in ip['resetns']:
                    self.tprint('connect_bd_net [get_bd_ports '+ip['resetns_port']+'] [get_bd_pins ' + ip['inst'] + '/' + reset_name + ']')
            else:
                for reset_name in ip['resetns']:
                    self.tprint('connect_bd_net [get_bd_ports ARESETN] [get_bd_pins ' + ip['inst'] + '/' + reset_name + ']')

    def instBlock(self, ip):
        self.instBlockcc(ip, "CLK")

    def instModule(self, ip):
        self.instModulecc(ip, "CLK")

    def instModulecc(self, ip,clk):

        self.tprint('create_bd_cell -type module -reference '+ip['name']+' '+ip['inst'])
        if 'properties' in ip and ip['properties'] != None:
            self.setProperties(ip['inst'], ip['properties'])

        if 'clks' in ip and ip['clks'] != None:
            for clk_name in ip['clks']:
                self.tprint('connect_bd_net [get_bd_ports '+clk+'] [get_bd_pins ' + ip['inst'] + '/' + clk_name + ']')

        if 'resetns' in ip and ip['resetns'] != None:
            if ip['resetns_port'] != None:
                for reset_name in ip['resetns']:
                    self.tprint('connect_bd_net [get_bd_ports ' + ip['resetns_port'] + '] [get_bd_pins ' + ip[
                        'inst'] + '/' + reset_name + ']')
            else:
                for reset_name in ip['resetns']:
                    self.tprint(
                        'connect_bd_net [get_bd_ports ARESETN] [get_bd_pins ' + ip['inst'] + '/' + reset_name + ']')

    def saxis_tie_off(self, block,port):
        self.instBlock(
            {
                'name': 'xlconstant',
                'inst': block+"_"+port+"_tie",
                'properties': ['CONFIG.CONST_WIDTH {1}',
                               ' CONFIG.CONST_VAL {0}']
            }
        )
        self.makeConnection(
            'net',
            {
                'name': block,
                'type': 'pin',
                'port_name': port+"_TVALID"
            },
            {
                'name': block+"_"+port+"_tie",
                'type': 'pin',
                'port_name': 'dout'
            }
        )

    def makeBufferedIntfConnection(self,source,sink,name,distance):
        cur_source = source
        for i in range(distance):
            self.instBlock(
                {
                    'name': 'axis_register_slice',
                    'inst': name+"reg_"+str(i),
                    'clks': ['aclk'],
                    'resetns_port': 'rstn',
                    'resetns': ['aresetn']
                }
            )
            self.makeConnection(
                'intf',
                cur_source,
                {
                    'name': name+"reg_"+str(i),
                    'type': 'intf',
                    'port_name': 'S_AXIS'
                }
            )
            cur_source = {
                'name': name + "reg_" + str(i),
                'type': 'intf',
                'port_name': 'M_AXIS'
            }
        self.makeConnection(
            'intf',
            cur_source,
            sink
        )

    def validate(self):
        self.tprint('validate_bd_design')
    def save(self):
        self.tprint('save_bd_design')
    def makeConnection(self, conn_type, source, sink):
        if conn_type == 'net':
            self.tprint('connect_bd_net [', end = '')
        elif conn_type == 'intf':
            self.tprint('connect_bd_intf_net [', end = '')

        if source['type'] == 'port':
            self.tprint_raw('get_bd_ports ', end = '')
            self.tprint_raw(source['port_name'] + '] [', end = '')
        elif source['type'] == 'intf_port':
            self.tprint_raw('get_bd_intf_ports ', end = '')
            self.tprint_raw(source['port_name'] + '] [', end = '')
        elif source['type'] == 'intf':
            self.tprint_raw('get_bd_intf_pins ', end = '')
            self.tprint_raw(source['name'] + '/' + source['port_name'] + '] [', end = '')
        elif source['type'] == 'pin':
            self.tprint_raw('get_bd_pins ', end = '')
            self.tprint_raw(source['name'] + '/' + source['port_name'] + '] [', end = '')



        if sink['type'] == 'port':
            self.tprint_raw('get_bd_ports ', end='')
            self.tprint_raw(sink['port_name'] + ']')
        elif sink['type'] == 'intf_port':
            self.tprint_raw('get_bd_intf_ports ', end='')
            self.tprint_raw(sink['port_name'] + ']')
        elif sink['type'] == 'intf':
            self.tprint_raw('get_bd_intf_pins ', end='')
            self.tprint_raw(sink['name'] + '/' + sink['port_name'] + ']')
        elif sink['type'] == 'pin':
            self.tprint_raw('get_bd_pins ', end = '')
            self.tprint_raw(sink['name'] + '/' + sink['port_name'] + ']')
            
    def close(self):
        self.fileHandle.close()
