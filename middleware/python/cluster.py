
import copy
import tclFileGenerator
import gatewayFileGenerator
from abstractDict import abstractDict
from kernel import kernel
from collections import OrderedDict
from node import node
import os
import socket, struct
import glob
import subprocess
multi_slr_boards = ['u200','u250','u280']
board_pairs={'sidewinder':'xczu19eg-ffvc1760-2-i','vck5000':'xcvc1902-vsvd1760-2mp-e-s','u200':'xcu200-fsgd2104-2-e','u250':'xcu250-figd2104-2l-e','u280':'xcu280-fsvh2892-2l-e'}
def memory_sort_and_validate(memories):
    #Process the size
    #Returns an array of arrays containing
    #[index,mem_size word, address as hex string]
    int_memory = []
    final_memory = []
    k_sizes =[4,8,16,32,64,128,256,512]
    m_sizes = [1024,2048,4096,8192,16384,32768,65536,131072]
    current_memory = 0xA0000000
    valid_sizes = k_sizes + m_sizes
    for mem in memories:
        try:
            processed=mem[1].replace(" ","").lower().rstrip("b")
            if processed.endswith("k"):
                value = int(processed.rstrip("k"))
            elif processed.endswith("m"):
                value = int(processed.rstrip("m"))*1024
            else:
                value = int(processed)
                assert (value%1024==0)
                value = int(value / 1024)
        except:
            raise ValueError('Memory size \"'+mem[1]+'\" is invalid')
        if value in k_sizes:
            word = str(value)+"K"
        elif value in m_sizes:
            word = str(int(value/1024)) + "M"
        else:
            raise ValueError('Memory size \"' + mem[1] + '\" is invalid')
        int_memory.append([value,word,mem[0]])
    int_memory = sorted(int_memory,reverse=True)
    for mem in int_memory:
        final_memory.append([mem[2],mem[1],hex(current_memory).lower().replace("l","")])
        current_memory = current_memory + mem[0]*1024
    if (current_memory > 0xAFF00000):
        raise ValueError('Exposed control memory in FPGA exceeds maximum 255M size')
    return final_memory



class cluster(abstractDict):
    """ This class is the top-level interface to the myriad other objects used
    by Galapagos. Note that the globalFPGAParser provides a rudimentary command
    line tool to interact with these cluster objects. """

    def getDict(self, file_name):
        """
        Checks whether a file's extension is ".xml" or ".json", and parses the
        file (depending on the extension) as XML or JSON.

        Args:
            file_name (string): File name

        Returns:
            Python dict filled with info from file. Hierarchy is faithfully
            reproduced.
        """
        filename, extension = os.path.splitext(file_name)
        if extension == ".xml":
            try:
                import xmltodict
            except ImportError:
                print("xmltodict module not installed in Python")
                exit(1)
            with open(file_name) as fd:
                return xmltodict.parse(fd.read())
        elif extension == ".json":
            import json
            with open(file_name) as fd:
                return json.load(fd)
        else:
            print("Unhandled exetension for " + file_name)
            return None

    def __init__(self, cluster_desc, lan_flow, mode='file'):
        """
        Initializes the cluster object using logical file and mapping file

        Args:
            name (string?): Cluster's name. Set this to project name?
            kernel_file (string): Filename of XML logical file
            map_file (string): Filename of XML mapping file
        """
        name = cluster_desc['name']
        kernel_file = cluster_desc['logic']
        self.name = name
        self.kernel_file = kernel_file

        if(mode=='file'):
            top_kern = self.getDict(kernel_file)['cluster']
            top_map = self.getDict(cluster_desc['map'])['cluster']
        else:
            top_kern = kernel_file['cluster']
            top_map = cluster_desc['map']['cluster']
        logical_dict = top_kern['kernel']
        map_dict = top_map['node']
        if "userIpPath" in top_kern:
            user_ip_folder = top_kern['userIpPath']
            subprocess.run(["rm", "-rf", user_ip_folder + "/__galapagos_autogen_"+name])
            subprocess.run(["mkdir", user_ip_folder + "/__galapagos_autogen_"+name])
        else:
            user_ip_folder = ''
        self.kernels = []
        for log_inst in logical_dict:
            if(int(log_inst['num'])==0):
                raise ValueError("There can not be any nodes pointing to kernel 0")
        s_axis_array = OrderedDict([('scope','global'),('name','direct_rx')])
        m_axis_array = OrderedDict([('scope', 'global'), ('name', 'lan_tx')])
        wan_array = OrderedDict([('enabled', 'False'), ('name', 'wan_prt')])
        kern0=OrderedDict([('#text','gateway'),('type','open'),('num','0'),('control','false'),('clk','CLK'),('aresetn','rstn'),('s_axis',s_axis_array),('m_axis',m_axis_array),('wan',wan_array)])
        logical_dict.insert(0, kern0)
        for kern_dict in logical_dict:
            if (('wan' in kern_dict) and (kern_dict['wan']['enabled'].lower()== 'true')):
                kern_dict['wan_enabled'] = True
                kern_dict['wan_name'] = kern_dict['wan']['name']
                if not lan_flow:
                    raise ValueError("WAN features require laniakea flow, not galapagos flow")
            else:
                kern_dict['wan_enabled'] = False
                kern_dict['wan_name'] = ""
            kern_dict['name'] = kern_dict['#text']
            # Number of repetitions of this kernel
            if 'rep' not in kern_dict:
                kern_dict['rep']='1'
            # Automatically gives sequential numbers
            base_num = int(kern_dict['num'])
            for i in range(0, int(kern_dict['rep'])):
                kern_dict_local = copy.deepcopy(kern_dict)
                # Set number for this kernel instance
                if 'id_port' in kern_dict_local:
                    kern_dict_local['has_id_port'] = True
                else:
                    kern_dict_local['has_id_port'] = False
                kern_dict_local['num'] = base_num + i

                # This code is setting some mysterious values inside the
                # dictionary, which probably get used by another function?
                # Otherwise, I have no idea what this is doing...

                # (This is a guess) Naif mentioned that you can hook up local
                # AXI full/lite connections between your kernels (unrelated to
                # Galapagos's router, network bridge, etc.). This must be the
                # code that handles it
                # What the heck is with all these conversions to and from strings?
                if 's_axi' in kern_dict_local:
                    # If more than one <s_axi> tag is present...
                    if type(kern_dict_local['s_axi']) == type([]):
                        for s_axi_idx, s_axi in enumerate(kern_dict_local['s_axi']):
                            if s_axi['scope'] == 'local':
                                kern_dict_local['s_axi'][s_axi_idx]['master']['num'] = str(i + base_num)
                    else:
                        if kern_dict_local['s_axi']['scope'] == 'local':
                            kern_dict_local['s_axi']['master']['num'] = str( i + int(kern_dict_local['s_axi']['master']['num']))
                            #print("i is " +  str( i ))
                            #print("updating master port to " +  str( int(kern_dict_local['s_axi']['master']['num'])))



                #print('kern_dict_local ' + str(kern_dict_local))
                # (This is a guess) Naif mentioned that you can hook up local
                # AXI stream connections between your kernels (unrelated to
                # Galapagos's router, network bridge, etc.). This must be the
                # code that handles it
                if 's_axis' in kern_dict_local:
                    if type(kern_dict_local['s_axis']) == type([]):
                        for s_axis_idx, s_axis in enumerate(kern_dict_local['s_axis']):
                            if s_axis['scope'] == 'local':
                                kern_dict_local['s_axis'][s_axis_idx]['master']['node'] = str(i + int(s_axis['master']['node']))
                    else:
                        if kern_dict_local['s_axis']['scope'] == 'local':
                            kern_dict_local['s_axis']['master']['node'] = str( i + int(kern_dict_local['s_axis']['master']['node']))

                if 'wire_slave' in kern_dict_local:
                    if type(kern_dict_local['wire_slave']) == type([]):
                        for slave_idx, slave in enumerate(kern_dict_local['wire_slave']):
                            kern_dict_local['wire_slave'][slave_idx]['master']['node'] = str(i + int(slave['master']['node']))
                    else:
                        kern_dict_local['wire_slave']['master']['node'] = str(i + int(kern_dict_local['wire_slave']['master']['node']))

                # This basically copies the dictionary parsed from the <kernel> tags into another dictionary,
                # but it does also check the fields to make sure they're all valid and that no mandatory info
                # is missing
                #print("kernelONE object " + str(self.kernels[len(self.kernels) - 1].data))
                #print("Appending " + str(kern_dict_local['inst']))
                self.kernels.append(kernel(**kern_dict_local))
        ## Dumps kernel info to the screen (printf debugging)
        #for kern in self.kernels:
        #    print("kernel object " + str(kern.data))

        # Now deal with nodes (i.e. a CPU or an FPGA)
        self.nodes = []
        for node_inst in map_dict:
            if (('board' in node_inst) and (node_inst['board'] in multi_slr_boards)):
                if type(node_inst['kernel']) is list:
                    for element in node_inst['kernel']:
                        if (int(element['num'])==0):
                            raise ValueError("There can not be any nodes pointing to kernel 0")
                elif(int(node_inst['kernel']['num'])==0):
                    raise ValueError("There can not be any nodes pointing to kernel 0")
            else:
                if type(node_inst['kernel']) is list:
                    for element in node_inst['kernel']:
                        if (int(element)==0):
                            raise ValueError("There can not be any nodes pointing to kernel 0")
                elif(int(node_inst['kernel'])==0):
                    raise ValueError("There can not be any nodes pointing to kernel 0")
        map0=OrderedDict([('type','hw'),('kernel','0'),('mac',cluster_desc['gatewayMac']),
                          ('ip',cluster_desc['gatewayIP']),('autorun','False'),('comm','udp'),
                          ('board',cluster_desc['gatewayBoard'])])
        map_dict.insert(0,map0)
        for node_idx, node_dict in enumerate(map_dict):
            # This basically copies the dictionary parsed from the <node> tags into another dictionary,
            # but it does also check the fields to make sure they're all valid and that no mandatory info
            # is missing
            node_inst = node(**node_dict)
            if ((node_inst['type']=='hw') and ('part' not in node_inst)):
                node_inst['part']=board_pairs[node_inst['board']]
            node_inst['kernel'] = []
            node_inst['kernel_map'] = {}
            node_inst['dns_ip']=cluster_desc['dns']
            node_inst['has_wan'] = False
            node_inst['ip_folder']=user_ip_folder
            no_open = True
            if (('board' in node_inst) and (node_inst['board'] in multi_slr_boards)):
                node_inst['multi_slr'] = True
                #Specify the Multi SLR settings
                #distance is the number of reg slices to do the crossing
                #clockregion specifies that clock region setting for each of the slices
                if node_inst['board'] == 'u200':
                    node_inst['slr_mappings'] = \
                        {'SLR2': { 'kernel' : [], 'distance': 1, 'name': 'pb_slr2','clockregion': 'CLOCKREGION_X0Y10:CLOCKREGION_X5Y14'},
                         'SLR1': { 'kernel' : [], 'distance': 3, 'name': 'pb_slr1','clockregion': 'CLOCKREGION_X0Y5:CLOCKREGION_X5Y9' },
                         'SLR0': {'kernel': [], 'distance': 5, 'name': 'pb_slr0','clockregion': 'CLOCKREGION_X0Y0:CLOCKREGION_X5Y4'}
                    }
                    node_inst['main_slr'] = 'pb_slr2'
                    node_inst['reset_slr'] = 'NONE'
                elif node_inst['board'] == 'u250':
                    node_inst['slr_mappings'] = \
                        {'SLR3': {'kernel': [], 'distance': 3, 'name': 'pb_slr3','clockregion': 'CLOCKREGION_X0Y12:CLOCKREGION_X7Y15'},
                         'SLR2': {'kernel': [], 'distance': 1, 'name': 'pb_slr2','clockregion': 'CLOCKREGION_X0Y8:CLOCKREGION_X7Y11'},
                         'SLR1': {'kernel': [], 'distance': 3, 'name': 'pb_slr1','clockregion': 'CLOCKREGION_X0Y4:CLOCKREGION_X7Y7' },
                         'SLR0': {'kernel': [], 'distance': 5, 'name': 'pb_slr0','clockregion': 'CLOCKREGION_X0Y0:CLOCKREGION_X7Y3'}
                    }
                    node_inst['main_slr'] = 'pb_slr2'
                    node_inst['reset_slr'] = 'pb_slr3'
                elif node_inst['board'] == 'u280':
                    node_inst['slr_mappings'] = \
                        {'SLR2': { 'kernel' : [], 'distance': 1, 'name': 'pb_slr2','clockregion': 'CLOCKREGION_X0Y8:CLOCKREGION_X7Y11'},
                         'SLR1': { 'kernel' : [], 'distance': 3, 'name': 'pb_slr1','clockregion': 'CLOCKREGION_X0Y4:CLOCKREGION_X7Y7' },
                         'SLR0': {'kernel': [], 'distance': 5, 'name': 'pb_slr0','clockregion': 'CLOCKREGION_X0Y0:CLOCKREGION_X7Y3'}
                    }
                    node_inst['main_slr'] = 'pb_slr2'
                    node_inst['reset_slr'] = 'NONE'
            else:
                node_inst['multi_slr'] = False
            #
            if node_inst['multi_slr']:
                if not (type(node_dict['kernel']) is list):
                    node_dict['kernel']=[node_dict['kernel']]
                for kmap_node in node_dict['kernel']:
                    for kern_idx, kern in enumerate(self.kernels):
                        # Perform linear search through self.kernels (the array of
                        # kernel objects we just built) to find the one matching
                        # this number
                        if int(kern['num']) == int(kmap_node['num']):
                            node_inst['has_wan'] = node_inst['has_wan'] or kern['wan_enabled'][0]
                            # Instead of having numbers in node_inst['kernel'], have
                            # pointers to our properly parsed kernel objects
                            node_inst['kernel_map'][kern['num']] = len(node_inst['kernel'])
                            kern['distance'] = node_inst['slr_mappings'][kmap_node['slr']]['distance']
                            node_inst['kernel'].append(kern)
                            # At the same time, append mac and ip information to each
                            # kernel object? Not sure why we have to do this. By the
                            # way, mac and ip are optional fields in node, so I don't
                            # know what this does if the user doesn't specify them.
                            self.kernels[kern_idx]['mac'] = node_inst['mac']
                            self.kernels[kern_idx]['ip'] = node_inst['ip']
                            if kern['type'] == 'open':
                                no_open=False
                            node_inst['slr_mappings'][kmap_node['slr']]['kernel'].append(kern)
            else:
                for kmap_node in node_dict['kernel']:
                    for kern_idx, kern in enumerate(self.kernels):
                        if int(kern['num']) == int(kmap_node):
                            node_inst['has_wan'] = node_inst['has_wan'] or kern['wan_enabled'][0]
                            # Instead of having numbers in node_inst['kernel'], have
                            # pointers to our properly parsed kernel objects
                            kern['distance']=1
                            node_inst['kernel_map'][kern['num']] = len(node_inst['kernel'])
                            node_inst['kernel'].append(kern)
                            # At the same time, append mac and ip information to each
                            # kernel object? Not sure why we have to do this. By the
                            # way, mac and ip are optional fields in node, so I don't
                            # know what this does if the user doesn't specify them.
                            self.kernels[kern_idx]['mac'] = node_inst['mac']
                            self.kernels[kern_idx]['ip'] = node_inst['ip']
                            if kern['type'] == 'open':
                                no_open=False

            if ( ('autorun' in node_inst) and ((node_inst['autorun'].lower())=="true")):
                if (no_open == False):
                    raise ValueError("You can't autorun on an open kernel")
                node_inst['make_bit'] = True
            else:
                node_inst['make_bit'] = False
            # Why even bother making <num> a required field in <node> if we're
            # just gonna overwrite it anyway?
            node_inst['num'] = node_idx
            # Maintain array of pointer to node objects
            self.nodes.append(node_inst)

    def processMemoryBus(self):
        for i in range(len(self.nodes)):
            memories = []
            has_control = False
            for j in range(len(self.nodes[i]['kernel'])):
                if self.nodes[i]['kernel'][j].data['control']:
                    memories.append([j,self.nodes[i]['kernel'][j].data['control_range']])
                    has_control = True
            ext_memories = memory_sort_and_validate(memories)
            for mem in ext_memories:
                self.nodes[i]['kernel'][mem[0]].data['control_size'] = mem[1]
                self.nodes[i]['kernel'][mem[0]].data['control_address'] = mem[2]
            self.nodes[i].has_control = has_control

    ### changes by Charles
    def checkDDR(self):
        for i in range(len(self.nodes)):
            has_ddr = False
            max_ddr_id_width = 1
            for j in range(len(self.nodes[i]['kernel'])):
                if self.nodes[i]['kernel'][j].data['ddr']:
                    self.nodes[i]['kernel'][j].has_ddr = True
                    has_ddr = True
                    if max_ddr_id_width < int(self.nodes[i]['kernel'][j]['ddr_id_width']):
                        max_ddr_id_width = int(self.nodes[i]['kernel'][j]['ddr_id_width'])
                    # print("Node: ", i, " Kernel: ", j, " has ddr")
                    # print("Max DDR ID Width: ", str(max_ddr_id_width))
            self.nodes[i].has_ddr = has_ddr
            self.nodes[i].max_ddr_id_width = max_ddr_id_width
        return
    ###

        return
    def writeClusterTCL(self, output_path, sim, has_GW,api_info,CAMILO_TEMP_DEBUG):
        #tclFileThreads = []
        for node_idx, node in enumerate(self.nodes):
            if ((node_idx == 0) and (not has_GW)):
                continue
            elif node['type'] == 'hw':
                tclFileGenerator.makeTCLFiles(node, self.name, output_path, sim, node_idx==0,api_info,CAMILO_TEMP_DEBUG)
            elif node['type']=='sw':
                tclFileGenerator.makeSWFile(node,self.name, output_path,self.getListOfKernelIPs())
    def writeGatewayFile(self,path,api_file):
        api_info = {}
        topAPI = self.getDict(api_file)['cluster']
        for node_idx, node in enumerate(self.nodes):
            if (node_idx == 0):
                Gateway_ip = node['ip']
                outDir = path + '/' + self.name + '/' + str(node['num'])
                api_info = gatewayFileGenerator.makeGWFiles(node, outDir, topAPI,Gateway_ip)
        return api_info
    def getListOfKernelIPs(self):

        kernelIndex = 0
        #iterate through kernels in order of tdest, populating the ipaddress at that location
        maxKernelIndex = 0
        for kern in self.kernels:
            if kern['num'] > maxKernelIndex:
                maxKernelIndex = kern['num']
        list_inst = []
        for currIndex in range(0, maxKernelIndex + 1):
            found = 0

            for kern in self.kernels:
                if currIndex == int(kern['num']):
                    found = 1
                    list_inst.append(kern['ip'])
            if found==0:
                list_inst.append('1.1.1.1')
                break
        print(list_inst)
        return(list_inst)
    #make COE to intialize BRAM of all IP addresses
    def BRAM_entry_formatter(self,address,value):
        hex_addr = hex(address)[2:]
        hex_val = value
        hex_addr = (4-len(hex_addr))*'0'+hex_addr
        return ' @'+hex_addr+' '+hex_val
    def writeBRAMFile(self, output_path, addr_type):
        its_mac = False
        print("Writing BRAM FILE")
        if addr_type == 'mac':
            bramFile = open(output_path + '/' + self.name + '/mac.coe', 'w')
            bramFile.write('memory_initialization_radix=16;\n')
            bramFilevck = open(output_path + '/' + self.name + '/mac.mem', 'w')
            its_mac=True
            nodeFile = open(os.devnull, 'w')
            nodeFilevck = open(os.devnull, 'w')
        else: #ip
            bramFile = open(output_path + '/' + self.name + '/ip.coe', 'w')
            bramFile.write('memory_initialization_radix=10;\n')
            bramFilevck = open(output_path + '/' + self.name + '/ip.mem', 'w')
            nodeFile = open(output_path + '/' + self.name + '/node.coe', 'w')
            nodeFile.write('memory_initialization_radix=10;\n')
            nodeFile.write('memory_initialization_vector=\n')
            nodeFilevck = open(output_path + '/' + self.name + '/node.mem', 'w')
        bramFile.write('memory_initialization_vector=\n')
        bram_address = 0
        node_address = 0
        #iterate through kernels in order of tdest, populating the ipaddress at that location
        maxKernelIndex = 0
        for kern in self.kernels:
            if kern['num'] > maxKernelIndex:
                maxKernelIndex = kern['num']

        for currIndex in range(0, maxKernelIndex + 1):
            found = 0
            for kern in self.kernels:
                if currIndex == int(kern['num']):
                    found = 1
                    if addr_type == 'mac':
                        writeStr = kern['mac'].replace(":", "")
                    else: #ip
                        writeStr = str(struct.unpack("!L", socket.inet_aton(kern['ip']))[0])

                    if currIndex != (len(self.kernels) - 1):
                        bramFile.write(writeStr + ',0, 0, 0,')
                    else:
                        bramFile.write(writeStr + ',0, 0, 0;')
                    if its_mac:
                        bramFilevck.write(self.BRAM_entry_formatter(bram_address, writeStr))
                    else:
                        bramFilevck.write(self.BRAM_entry_formatter(bram_address, hex(int(writeStr))[2:]))
                    bramFilevck.write(self.BRAM_entry_formatter(bram_address + 4, '0'))
                    bramFilevck.write(self.BRAM_entry_formatter(bram_address + 8, '0'))
                    bramFilevck.write(self.BRAM_entry_formatter(bram_address + 12, '0'))
                    bram_address = bram_address + 16
            if found==0:
                if addr_type == 'mac':
                    defaultStr = 'ffffffffffff'
                else: #ip
                    defaultStr = str(struct.unpack("!L", socket.inet_aton('1.1.1.1'))[0])

                if currIndex != (len(self.kernels) - 1):
                    bramFile.write(defaultStr + ',0, 0, 0,')
                else:
                    bramFile.write(defaultStr + ',0, 0, 0;')
                if its_mac:
                    bramFilevck.write(self.BRAM_entry_formatter(bram_address, defaultStr))
                else:
                    bramFilevck.write(self.BRAM_entry_formatter(bram_address, hex(int(defaultStr))[2:]))
                bramFilevck.write(self.BRAM_entry_formatter(bram_address + 4, '0'))
                bramFilevck.write(self.BRAM_entry_formatter(bram_address + 8, '0'))
                bramFilevck.write(self.BRAM_entry_formatter(bram_address + 12, '0'))
                bram_address = bram_address +16
            if addr_type == "ip":
                for node in self.nodes:
                    for kern in node["kernel"]:
                        if currIndex == int(kern["num"]):
                            writeStr = str(node["num"])
                            if currIndex != (len(self.kernels) - 1):
                                nodeFile.write(writeStr + ',0, 0, 0,')
                            else:
                                nodeFile.write(writeStr + ',0, 0, 0;')
                            nodeFilevck.write(self.BRAM_entry_formatter(node_address, writeStr))
                            nodeFilevck.write(self.BRAM_entry_formatter(node_address + 4, '0'))
                            nodeFilevck.write(self.BRAM_entry_formatter(node_address + 8, '0'))
                            nodeFilevck.write(self.BRAM_entry_formatter(node_address + 12, '0'))
                            node_address = node_address +16
        if addr_type == "ip":
            nodeFile.close()
        bramFile.close()

    def makeProjectClusterScript(self, output_path,hasGW):
        """
        As per the name, makes a project cluster script. You may be wondering what a
        project cluster script is. Me too.

        It looks like this automatically generates bash scripts which take care of
        making a cluster of _vivado_ projects, one for each hardware node (i.e.
        <nodes> in the mapping file with <type>hw</type>.

        Galapagos's project management is (in my opinion) too gardenwalled. There is
        one common projects directory (which is under projects/ in the Galapagos
        install location by default) and it makes a subdirectory named after each
        project. I really dislike this kind of file management, and it will only
        cause headaches with permissions. Also, I hate playing the guessing game of
        "will it automatically make a directory for me or not?" And one more thing:
        this means that your project name has to be a valid folder name.

        Args:
            output_path (string): Location of Galapagos's projects folder.
        """

        # If this project directory already exists, just delete it! Oops! I forgot
        # I already had a super important project with the same name!
        # ^ this has been amended below by just removing the tcl files
        # if os.path.exists(output_path + '/' + self.name):
        #     shutil.rmtree(output_path + '/' + self.name)
        os.makedirs(output_path + '/' + self.name, exist_ok=True)

        globalConfigFile = open(output_path + "/" + self.name + '/createCluster.sh', 'w')
        globalSimFile = open(output_path + "/" + self.name + '/simCluster.sh', 'w')

        globalConfigFile.write("cd " + str(os.environ.get('GALAPAGOS_PATH')) + "\n")
        globalConfigFile.write("source " + str(os.environ.get('GALAPAGOS_PATH'))+"/environmental_reset.sh" + "\n")
        for node_idx, node_obj in enumerate(self.nodes):
            #only need vivado project for hw nodes
            if ((node_idx == 0) and (not hasGW)):
                continue
            elif node_obj['type'] == 'hw':
                dirName = output_path + '/' + self.name + '/' + str(node_idx)

                if os.path.exists(dirName):
                    fileList = glob.glob(dirName + "/*.tcl")
                    for f in fileList:
                        os.remove(f)
                os.makedirs(dirName, exist_ok=True)
                #currently only making flattened bitstreams
                if node_obj['make_bit']:
                    globalConfigFile.write("vivado -mode batch -source shells/tclScripts/make_shell.tcl -tclargs --project_name " +  str(node_idx) + "  --pr_tcl " + dirName + "/" + str(node_idx) + ".tcl" + "  --board " + node_obj['board'] + "  --part "+ node_obj['part'] + " --dir " + self.name +  " --start_synth 1" + "\n")
                else:
                    globalConfigFile.write("vivado -mode batch -source shells/tclScripts/make_shell.tcl -tclargs --project_name " +  str(node_idx) + "  --pr_tcl " + dirName + "/" + str(node_idx) + ".tcl" + "  --board " + node_obj['board'] + "  --part "+ node_obj['part'] + " --dir " + self.name +  " --start_synth 0" + "\n")
            elif node_obj['type'] == 'sw':
                dirName = output_path + '/' + self.name + '/' + str(node_idx)
                if os.path.exists(dirName):
                    subprocess.run(['rm','-r',dirName])
                os.makedirs(dirName, exist_ok=True)
                subprocess.run(['cp', '-r', output_path+'/../middleware/sw/.',dirName+"/"])
        globalConfigFile.close()
