ENABLE_DEBUG = True
if ENABLE_DEBUG:
    from inspect import getframeinfo, stack
    import os
    targetFile = "/middleware/python/tclFileGenerator.py"
    fullPath = os.environ.get("GALAPAGOS_PATH") + targetFile

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
        self.fileHandle = open(fileName + '.tcl', 'a+')
        self.fpga = fpga

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
            for index, stackFrame in enumerate(stack()):
                caller = getframeinfo(stackFrame[0])
                if caller.filename == fullPath:
                    stackIndex = index
                    break                    
            caller = getframeinfo(stack()[stackIndex][0])
            self.fileHandle.write("# " + targetFile + ":" + str(caller.lineno) + '\n')
        self.tprint_raw(cmd, end)

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
    def add_intf_port(self, port_name, intf_type, type):
        self.tprint('create_bd_intf_port -mode '+type+' -vlnv '+intf_type+' '+port_name)
    def add_axis_port(self, port_name, type):
        self.add_intf_port(port_name, 'xilinx.com:interface:axis_rtl:1.0', type)
    def add_axi4_port(self, port_name, type):
        self.add_intf_port(port_name, 'xilinx.com:interface:aximm_rtl:1.0', type)
    def instBlock(self, ip):

        if 'vendor' in ip and ip['vendor'] != None:
            self.tprint('addip ' + ip['name'] + ' ' +  ip['inst'] )
        else:
            self.tprint('addip ' + ip['name'] + ' ' +  ip['inst'])
        
        if 'properties' in ip and ip['properties'] != None:
            self.setProperties(ip['inst'], ip['properties'])

        if 'clks' in ip and ip['clks'] != None:
            for clk_name in ip['clks']:
                self.tprint('connect_bd_net [get_bd_ports CLK] [get_bd_pins ' + ip['inst'] + '/' + clk_name + ']')

        if 'resetns' in ip and ip['resetns'] != None:
            if ip['resetns_port'] != None:
                for reset_name in ip['resetns']:
                    self.tprint('connect_bd_net [get_bd_ports '+ip['resetns_port']+'] [get_bd_pins ' + ip['inst'] + '/' + reset_name + ']')
            else:
                for reset_name in ip['resetns']:
                    self.tprint('connect_bd_net [get_bd_ports ARESETN] [get_bd_pins ' + ip['inst'] + '/' + reset_name + ']')

    def instModule(self, ip):

        self.tprint('create_bd_cell -type module -reference '+ip['name']+' '+ip['inst'])
        if 'properties' in ip and ip['properties'] != None:
            self.setProperties(ip['inst'], ip['properties'])

        if 'clks' in ip and ip['clks'] != None:
            for clk_name in ip['clks']:
                self.tprint('connect_bd_net [get_bd_ports CLK] [get_bd_pins ' + ip['inst'] + '/' + clk_name + ']')

        if 'resetns' in ip and ip['resetns'] != None:
            if ip['resetns_port'] != None:
                for reset_name in ip['resetns']:
                    self.tprint('connect_bd_net [get_bd_ports ' + ip['resetns_port'] + '] [get_bd_pins ' + ip[
                        'inst'] + '/' + reset_name + ']')
            else:
                for reset_name in ip['resetns']:
                    self.tprint(
                        'connect_bd_net [get_bd_ports ARESETN] [get_bd_pins ' + ip['inst'] + '/' + reset_name + ']')

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
