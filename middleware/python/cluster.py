import threading
import warnings
import shutil
import copy
import tclFileGenerator
from abstractDict import abstractDict
from kernel import kernel
from node import node
import os
import socket, struct
import glob

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

    def __init__(self, name, kernel_file, map_file, mode='file'):
        """
        Initializes the cluster object using logical file and mapping file

        Args:
            name (string?): Cluster's name. Set this to project name?
            kernel_file (string): Filename of XML logical file
            map_file (string): Filename of XML mapping file
        """
        self.name = name
        self.kernel_file = kernel_file

        #placeholder defaults so functions still work
        self.packet_data = 64
        self.packet_dest = 8
        self.packet_keep = 0
        self.packet_last = 0
        self.packet_id = 0
        self.packet_user = 0


        if(mode=='file'):
            top_dict = self.getDict(kernel_file)['cluster']
        else:
            top_dict = kernel_file['cluster']

        print(top_dict)

        # The user may optionally specify a packet description in <packet> tags
        # Note: it would be nice if Python had some notion of strong typing,
        # since it would make it easier to deal with the user giving the wrong
        # format for the arguments in the XML/JSON file
        if 'packet' in top_dict:
            packet = top_dict['packet']
            if 'data' in packet:
                self.packet_data = packet['data']
            if 'keep' in packet:
                self.packet_keep = packet['keep']
            if 'last' in packet:
                self.packet_last = packet['last']
            if 'id' in packet:
                self.packet_id = packet['id']
            if 'user' in packet:
                self.packet_user = packet['user']

            galapagos_path = str(os.environ.get('GALAPAGOS_PATH'))

            #f = open(galapagos_path + '/middleware/include/packet_size.h', 'w')
            #f.write("#ifndef PACKET_SIZE_H\n#define PACKET_SIZE_H\n")
            #f.write("# define PACKET_DATA_LENGTH " + str(self.packet_data) + '\n')
            #if self.packet_keep:
            #    self.packet_keep = int(self.packet_data)/8
            #    f.write("# define PACKET_KEEP_LENGTH " + str(int(self.packet_keep)) + '\n')
            #if self.packet_last:
            #    f.write("# define PACKET_LAST\n")
            #if self.packet_id:
            #    f.write("# define PACKET_ID_LENGTH " + str(self.packet_id) + '\n')
            #if self.packet_user:
            #    f.write("# define PACKET_USER_LENGTH " + str(self.packet_user) + '\n')
            #else:
            #    f.write("# define PACKET_USER_LENGTH 16\n")
            #if self.packet_dest:
            #    f.write("# define PACKET_DEST_LENGTH " + str(self.packet_dest) + '\n')
            #f.write("#endif\n")

       
       
        if(mode=='file'):
            logical_dict = self.getDict(kernel_file)['cluster']['kernel']
            map_dict = self.getDict(map_file)['cluster']['node']
        else:
            logical_dict = kernel_file['cluster']['kernel']
            map_dict = map_file['cluster']['node']


        self.kernels = []
        for kern_dict in logical_dict:
            kern_dict['name'] = kern_dict['#text']
            # Number of repetitions of this kernel
            if 'rep' in kern_dict:
                # Automatically gives sequential numbers
                base_num = int(kern_dict['num'])
                for i in range(0, int(kern_dict['rep'])):
                    kern_dict_local = copy.deepcopy(kern_dict)
                    # Set number for this kernel instance
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
                    print("Finished appending")


            else:
                kern_dict_local['rep'] = 1
                kern_dict_local['num'] = int(kern_dict_local['num'])
                self.kernels.append(kernel(**kern_dict_local))

        ## Dumps kernel info to the screen (printf debugging)
        #for kern in self.kernels:
        #    print("kernel object " + str(kern.data))

        # Now deal with nodes (i.e. a CPU or an FPGA)
        self.nodes = []
        for node_idx, node_dict in enumerate(map_dict):
            # This basically copies the dictionary parsed from the <node> tags into another dictionary,
            # but it does also check the fields to make sure they're all valid and that no mandatory info
            # is missing
            node_inst = node(**node_dict)

            # I'm fairly sure these next few lines of code are just converting
            # data formats
            node_inst['kernel'] = []
            node_inst['kernel_map'] = {}
            #
            for kmap_node in node_dict['kernel']:
                for kern_idx, kern in enumerate(self.kernels):
                    # Perform linear search through self.kernels (the array of
                    # kernel objects we just built) to find the one matching
                    # this number
                    if int(kern['num']) == int(kmap_node):
                        # Instead of having numbers in node_inst['kernel'], have
                        # pointers to our properly parsed kernel objects
                        node_inst['kernel_map'][kern['num']] = len(node_inst['kernel'])
                        node_inst['kernel'].append(kern)
                        # At the same time, append mac and ip information to each
                        # kernel object? Not sure why we have to do this. By the
                        # way, mac and ip are optional fields in node, so I don't
                        # know what this does if the user doesn't specify them.
                        self.kernels[kern_idx]['mac'] = node_inst['mac']
                        self.kernels[kern_idx]['ip'] = node_inst['ip']
            # Why even bother making <num> a required field in <node> if we're
            # just gonna overwrite it anyway?
            node_inst['num'] = node_idx
            # Maintain array of pointer to node objects
            self.nodes.append(node_inst)

    def writeClusterTCL(self, output_path, sim):

        #tclFileThreads = []
        for node_idx, node in enumerate(self.nodes):
            #tclFileThreads.append(threading.Thread(target=tclFileGenerator.makeTCLFiles, args=(node,self.name, output_path, sim)))
            if node['type'] == 'hw':
                #tclFileThreads.append(threading.Thread(target=tclFileGenerator.makeTCLFiles, args=(node,self.name, output_path, sim)))
                #tclFileThreads[len(tclFileThreads)-1].start()
                tclFileGenerator.makeTCLFiles(node, self.name, output_path, sim)

#        for thread in tclFileThreads:
#            thread.join()



    #make COE to intialize BRAM of all IP addresses
    def writeBRAMFile(self, output_path, addr_type):
        if addr_type == 'mac':
            bramFile = open(output_path + '/' + self.name + '/mac.coe', 'w')
            bramFile.write('memory_initialization_radix=16;\n')
        else: #ip
            bramFile = open(output_path + '/' + self.name + '/ip.coe', 'w')
            bramFile.write('memory_initialization_radix=10;\n')
            nodeFile = open(output_path + '/' + self.name + '/node.coe', 'w')
            nodeFile.write('memory_initialization_radix=10;\n')
            nodeFile.write('memory_initialization_vector=\n')
        bramFile.write('memory_initialization_vector=\n')

        kernelIndex = 0
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
                    break
            if found==0:
                if addr_type == 'mac':
                    defaultStr = 'ffffffffffff'
                else: #ip
                    defaultStr = str(struct.unpack("!L", socket.inet_aton('1.1.1.1'))[0])

                if currIndex != (len(self.kernels) - 1):
                    bramFile.write(defaultStr + ',0, 0, 0,')
                else:
                    bramFile.write(defaultStr + ',0, 0, 0;')
                break

            if addr_type == "ip":
                for node in self.nodes:
                    for kern in node["kernel"]:
                        if currIndex == int(kern["num"]):
                            writeStr = str(node["num"])
                            if currIndex != (len(self.kernels) - 1):
                                nodeFile.write(writeStr + ',0, 0, 0,')
                            else:
                                nodeFile.write(writeStr + ',0, 0, 0;')
        if addr_type == "ip":
            nodeFile.close()
        bramFile.close()

    def makeProjectClusterScript(self, output_path):
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
        for node_idx, node_obj in enumerate(self.nodes):
            #only need vivado project for hw nodes
            if node_obj['type'] == 'hw':
                dirName = output_path + '/' + self.name + '/' + str(node_idx)

                if os.path.exists(dirName):
                    fileList = glob.glob(dirName + "/*.tcl")
                    for f in fileList:
                        os.remove(f)
                os.makedirs(dirName, exist_ok=True)

                #currently only making flattened bitstreams
                globalConfigFile.write("galapagos-update-board " + node_obj['board'] + "\n")
                globalConfigFile.write("vivado -mode batch -source shells/tclScripts/make_shell.tcl -tclargs --project_name " +  str(node_idx) + "  --pr_tcl " + dirName + "/" + str(node_idx) + ".tcl" + " --dir " + self.name +  " --start_synth 1" + "\n")
#                globalConfigFile.write("vivado -mode batch -source shells/tclScripts/make_shell.tcl -tclargs --project_name " +  str(node_idx) + "  --pr_tcl " + dirName + "/" + str(node_idx) + ".tcl" + " --dir " + output_path + '/' + self.name " & \n")
#                globalSimFile.write("vivado -mode gui -source tclScripts/createSim.tcl -tclargs " + node_obj['board'] + " " + self.name + " " + str(node_idx) + "\n")



if __name__=='__main__':

    #logical_file = 'hwMiddleware/packetSwitch/tests/conf0/logical.xml'
    #map_file = 'hwMiddleware/packetSwitch/tests/conf0/map.xml'
    path = '/home/tarafdar/workDir/galapagos/projects'
    logical_file = '/home/tarafdar/workDir/aegean/examples/resnet50/logical_aegean.json'
    map_file = '/home/tarafdar/workDir/aegean/examples/resnet50/map_aegean.json'
    cluster_inst = cluster('naif', logical_file, map_file)
    cluster_inst.makeProjectClusterScript(path)
    cluster_inst.writeClusterTCL(path, 0)
    cluster_inst.writeBRAMFile(path, 'mac')
    cluster_inst.writeBRAMFile(path, 'ip')

