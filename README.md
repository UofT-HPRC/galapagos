# Galapagos Hardware Stack 

Welcome to the Galapagos Hardware Stack. 

## Prerequisites

Vitis 2023.1 and Vitis HLS 2023.1 must be installed on your device or on an NFS attached directory
The Galapagos framework has been tested using Python 3.7.10, please have it installed.

## First-Time Setup
1. If not installed already, follow the steps to install Python 3.7.10 as Python 3.7 (follow `altinstall` step): [https://github.com/UofT-HPRC/tpdp/blob/main/configuring_server/new_students/README.md#install-a-specific-version-of-python](https://github.com/UofT-HPRC/tpdp/blob/main/configuring_server/new_students/README.md#install-a-specific-version-of-python)
2. We recommend creating a Python virtual environment. Create one by running: `python3.7 -m venv /path/to/venv`
	1. Eg. `python3.7 -m venv ./python_venv_3_7_10`
 	2. This creates a folder (python_venv_3_7_10) which contains the virtual environment (venv folder)
4. Enter the virtual environment by running `source /path/to/venv/bin/activate`
	1. Eg. `source ./python_venv_3_7_10/bin/activate`
6. Install the following dependencies: `pip3 install wheel pyfiglet regex PyInquirer xmltodict`
	1. If pip gives a timeout error, follow the instructions here: [https://github.com/UofT-HPRC/tpdp/blob/main/configuring_server/new_students/README.md#pip-error-ssl-timeout](https://github.com/UofT-HPRC/tpdp/blob/main/configuring_server/new_students/README.md#pip-error-ssl-timeout)
7. Install Galapagos

## Installing Galapagos/Laniakea

The following instructions installs both Galapagos and Laniakea in your machine. Note this process can, depending on the number of boards, take an hour or more to run.

1. Clone the github repository and checkout the branch you wish to use.
2. run: **make install** This will ask the following:
	1. The absolute file path of the galapagos repository (default is the current folder
	2. The folder location for the vitis 2023.1 install
 	3. A wizard will ask you the boards which you wish to install. A board must be installed in order to be able to make Galapagos or Laniakea projects which utilize that board.

# Galapagos Instructions

The following instructions are to create regular Galapagos clusters.

## Compile a Galapagos Project
## What you need before starting
1. A logical file describing your project's kernels. See the **LOGICALFILE** section of the README for more details.
2. A map file describing how your kernels are distributed on devices. See the **MAPFILE** section of the README for more details.
	1. NOTE: There must be at least two nodes in a Galapagos cluster.
 
## Steps to compile a Galapagos project
1. If using a virtual environment, enter it by running `source /path/to/venv/bin/activate`
	1. Eg. `source ./python_venv_3_7_10/bin/activate`
2. Create the project by running: `make galapagos PROJECTNAME="<project_name>" LOGICALFILE=</path/to/logical/file> MAPFILE=</path/to/map/file>`. Ensure any boards referenced in the map file are already installed
3. At this point, Galapagos will have created one Vivado project for each FPGA declared in your map file. this is located at projects/<project_name>/<node_number>. 

# Laniakea Instructions

The following instructions are to create regular Laniakea super clusters.

## What you need before starting
1. A logical file **For Each Galapagos Cluster** describing that cluster's kernels. See the **LOGICALFILE** section of the README for more details.
2. A map file **For Each Galapagos Cluster** describing how your kernels are distributed on devices. See the **MAPFILE** section of the README for more details.
	1. NOTE: There must be at least two nodes in a Galapagos cluster.
3. A api file **For Each Galapagos Cluster** describing how that cluster can be externally accessible. See the **APIFILE** section of the README for more details
4. A cluster file describing the laniakea cluster itself. See the **CLUSTERFILE** section of the README for more details

## Steps to compile a Laniakea Project
1. If using a virtual environment, enter it by running `source /path/to/venv/bin/activate`
	1. Eg. `source ./python_venv_3_7_10/bin/activate`
2. Create the project by running: `make laniakea PROJECTNAME="<project_name>" CLUSTERFILE=</path/to/cluster/file>`. Ensure any boards referenced in the project are already installed
	1. A folder will be created for each cluster declared in your cluster file. this is located at projects/<project_name>_<cluster_name>/. It will also create a folder with the informational cluster files at  projects/<project_name>_cluster_files/
3. Navigate to each of the cluster folders and run `source createCluster.sh`. This is a slightly time consuming process but you may run this for multiple clusters simultaneously.
4. At this point, Laniakea will have created one Vivado project for each FPGA declared in the cluster's map file. this is located at projects/<project_name>_<cluster_name>//<node_number>. 

## Informational Cluster Files
These files are automatically generated at projects/<project_name>_cluster_files/ when running laniakea. They perform the following
1. dns.py and dns_map.txt must be located in the dns server. The two files must be in the same directory. Running dns.py runs the dns server enabling the WAN subsystem to work.
2. clusterinfo.clinfo - a non human-readable file describing the clusters in the project. This is necessary when merging two laniakea projects together.
3. api_plaintext.txt - a plaintext readable file describing the API of all the clusters in the project.
4. api_database.csv - A csv file with the same information as api_plaintext.txt allowing the user to use it in scripts more easily

## Merging Cluster Files

Two or more laniakia projects may be joined together to form a larger project without requiring re-compilation. The instructions are as follows
1. run **make merge PROJECTNAME="<project_name> <clinfo_file1> <clinfo_file2>** containing the clusterinfo.clinfo file locations for the clusters you wish to merge
2. The informational cluster files for the combined project can be found in projects/<project_name>_cluster_files/

# Galapagos and Laniakea Compilation files

The following files may be needed to create Galapagos or Laniakea projects

## LOGICALFILE

The following is an example logical file:

```
<cluster>
	<userIpPath> /home/user/test/ip_repo </userIpPath>
	<kernel> kernelName
	        <num> 1 </num>
	        <rep> 2 </rep>
	        <clk> nameOfClockPort </clk>
	        <aresetn> nameOfResetPort </aresetn>
	        <type> verilog </type>
	        <control> TRUE </control>
		<control_range> 2k </control_range>
	        <s_axis>
	            <scope> global </scope>
	            <name> nameOfInputStreamInterface </name>
	        </s_axis>
	        <m_axis>
	            <scope> global </scope>
	            <name> nameOfOutputStreamInterface </name>
	        </m_axis>
		<!--
		The following is used in Laniakea projects but not in Galapagos projects
		-->
	        <wan>
			<enabled> True </enabled>
			<name> nameOfWanOutStreamInterface </name>
		</wan>
	</kernel>
	<kernel> otherKernelName
	        <num> 1 </num>
	        <rep> 2 </rep>
	        <clk> nameOfClockPort </clk>
	        <aresetn> nameOfResetPort </aresetn>
	        <type> open </type>
	        <control> FALSE </control>
	        <s_axis>
	            <scope> global </scope>
	            <name> nameOfInputStreamInterface </name>
	        </s_axis>
	        <m_axis>
	            <scope> global </scope>
	            <name> nameOfOutputStreamInterface </name>
	        </m_axis>
	</kernel>
</cluster>
```
`<userIPPath>` is the location of the repository containing all your IPs and source files you wish to be inserted. Unpackaged files must be in the in the described folder, not within subdirectories.

The `<num>` tag refers to the unique ID of a kernel. IDs must start at 1 and be consecutive <br/>

The `<rep>` field is optional (default 1), refers to the number of times to repeat a kernel. The IDs are of repeated kernels are increased sequentially. <br/>

The `<type>` can be sw, open, ip, vhdl, system_verilog, tcl, verilog, cpp_viv, or cpp_vit specifying if you want an open block design to add your work in, a packaged ip inserted, or a vhdl system verilog or verilog file, or a cpp file to be interpreted by vivado_hls (cpp_viv) or by vitis_hls (cpp_vit) 

    In sw mode, the kernel is a software lib-galapagos kernel

    In IP mode, the name of the ip must exactly match the kernel name. It must be found in <userIPPath>
    
    In verilog mode the file must be located at `<userIPPath>`/`<name>`.v, and the top level module must be `<name>`, where `<name>` is the kernelName. 
    
    In system verilog mode the file must be located at `<userIPPath>`/`<name>`.sv, and the top level module must be `<name>`, where `<name>` is the kernelName. 
    
    In vhdl mode the file must be named <name>.vhdl, and the top level module must be <name>, where <name> is the kernelName.
    
    In tcl mode, The tcl file located at `<userIPPath>`/`<name>`.tcl will be run inside the open block design 
    
    In Open mode, the block design is just called kernelName_inst<inst_num> where inst_num inumerates the number of copies of that kernel
    
    In cpp_viv or cpp_vit mode, the code must be contained to one file located at `<userIPPath>`/`<name>`.cpp with the main function being called `<name>`, where `<name>` is the kernelName.

The `<clk>` refers to the name of the clock interface, this will be tied to a 200MHz clock. <br/>

The `<control>` refers to whether an AXI Lite control interface is required. <br/>

The `<control_range>` refers to the range of the interface. Only required when control is TRUE <br/>

The `<aresetn>` refers to the name of the reset interface, this will be tied to the clock in the Hypervisor (negative edge triggered). <br/>

The `<id_port>` refers to the port name in the kernel that will be tied to a constant with the value of the unique kernel ID. (optional) <br/>

The `<s_axis>` and `<m_axis>` allows you to describe the name of the axi stream ports on the IP. In Open mode, this specifies the name of that port in the open block design.<scope> is for a future extension and for now must be global. The sideband signals (and the bitwidths) are as follows:
	TDEST(8) specifies the kernel number of the target of the message and TID(8) is the kernel number of the sender. You do not need to specify TID on the master port as that information is automatically added for security by Galapagos or Laniakea. WAN messages from other clusters arrive with TID=0.
 	TDATA(512), TLAST(1), and TKEEP(64) are used to send the payload as per the AXI Streaming Standard
  	TREADY(1), and TVALID(1) are the handshaking signals.

The `<wan>` section **in Laniakea only** allows you to describe the name of the output WAN axi stream ports on the IP. The WAN port is used to communicate with other clusters.  In Open mode, this specifies the name of that port in the open block design. By setting <enabled> to false, you can ask Laniakea to not create an output WAN axi stream port. The sideband signals are as follows:
	TDEST(32) specifies the cluster ID of the target cluster
 	TUSER(16) specifies the API port number of the function being performed
	TDATA(512), TLAST(1), and TKEEP(64) are used to send the payload as per the AXI Streaming Standard
  	TREADY(1), and TVALID(1) are the handshaking signals.

## MAPFILE

The following is an example map file:

```

<cluster>
    <node>
        <type> sw </type>
        <kernel> 1 </kernel>
        <mac>  0c:c4:7a:88:c0:47 </mac>
        <ip> 10.1.2.101 </ip>
    </node>
    <node>
        <type> hw </type>
        <board> sidewinder </board>
        <kernel> 2 </kernel>
	<kernel> 3 </kernel>
        <mac>  fa:16:3e:55:ca:08 </mac>
        <ip> 10.1.9.208 </ip>
        <comm> udp </comm>
        <autorun> True </autorun>
    </node>
 	<node>
        <type> hw </type>
        <board> u200 </board>
        <kernel>
		<num> 4 </num>
		<slr> SLR1 </slr>
	</kernel>
        <kernel>
		<num> 5 </num>
		<slr> SLR2 </slr>
	</kernel>
        <mac>  fa:16:3e:55:ca:08 </mac>
        <ip> 10.1.9.208 </ip>
        <comm> udp </comm>
        <autorun> True </autorun>
    </node>
</cluster>
```
The `<type>` is the type of device used. Currently supported is sw for a CPU node or hw for a hardware node

The `<board>` tag refers to the FPGA board you wish to use for this particular node. <br/>

For single SLR nodes the `<kernel>` refers to the unique kernel ID that you wish to put on this node. You can repeat this tag if an FPGA or CPU has multiple kernels in the same device  <br/>

For multi SLR nodes the `<kernel>` has two fields. `<num>` refers to the unique kernel ID that you wish to put on this node. `<slr>` refers to the SLR of the FPGA you wish to place this kernel in. You can repeat this tag if an FPGA or CPU has multiple kernels in the same device  <br/>

The `<mac>` and `<ip>` refer to the device's ip address and mac address respectively

For type hw nodes, the following is also required:

The `<com>` tag refers to whether the node is using the tcp or the udp protocol

The `<autorun>` can only be True if none of the kernels are `open`. When True, the scripts will automatically run synthesis, implementation, and bitstream generation on the device.

For an example refer to the `xml_examples` folder

## APIFILE

```
<cluster>
    <port>
        <form> direct </form>
        <tag> direct_to_2 </tag>
        <target> 2 </target>
    </port>
    <port>
        <form> broadcast </form>
        <tag> bc_123 </tag>
        <target> 1 </target>
        <target> 2 </target>
        <target> 3 </target>
    </port>
    <port>
        <form> control_multiple </form>
        <tag> bc_2345 </tag>
        <target>
             <num>4 </num>
             <address>0xA0000000 </address>
        </target>
        <target>
             <num>3 </num>
             <address>0xA0001000 </address>
        </target>
        <maxRange> 4K </maxRange>
    </port>
    <port>
        <form> direct </form>
        <tag> direct_to_1 </tag>
        <target> 1 </target>
    </port>
    <port>
        <form> broadcast </form>
        <tag> bc_1234 </tag>
        <target> 1 </target>
        <target> 2 </target>
        <target> 3 </target>
        <target> 4 </target>
    </port>
```

Describes the desired API of this cluster. 

For every port you must specify the name of the port (`<tag>`) and the type of port (`<form>`)

There are currently four possible port types:

1. direct
	1. Used to just forward a message to a specific kernel
	2. User needs to specify the target using `<target>`

2. broadcast
	1. Used to repeat the same message to send to multiple kernel
 	2. User needs to specify all the target kernels using `<target>`
3. control
	1. TBD, not implemented yet
4. control_multiple
	1. TBD, not implemented yet

## CLUSTERFILE

```
<superCluster>
    <dns> 10.1.9.109 </dns>
    <cluster>
        <name> first_cluster </name>
        <logicalFile> /home/savi/Desktop/imperial/wan2/galapagos/xml_examples/laniakea_2_hw_2_clusters/logical.xml </logicalFile>
        <mapFile> /home/savi/Desktop/imperial/wan2/galapagos/xml_examples/laniakea_2_hw_2_clusters/map.xml </mapFile>
        <apiFile> /home/savi/Desktop/imperial/wan2/galapagos/xml_examples/laniakea_2_hw_2_clusters/api.xml </apiFile>
        <gatewayIP> 10.1.9.200 </gatewayIP>
        <gatewayMac> 0c:c4:2b:2d:bd:05</gatewayMac>
        <hasGateway> True </hasGateway>
  <gatewayBoard> sidewinder </gatewayBoard>
    </cluster>

    <cluster>
        <name> second_cluster </name>
        <logicalFile>/home/savi/Desktop/imperial/wan2/galapagos/xml_examples/laniakea_2_hw_2_clusters/logical2.xml </logicalFile>
        <mapFile> /home/savi/Desktop/imperial/wan2/galapagos/xml_examples/laniakea_2_hw_2_clusters/map2.xml </mapFile>
        <hasGateway> False </hasGateway>
  </cluster>
</superCluster>
```

The `<dns>` is the IP of the dns in all of the servers

Specify a `<cluster>` block for each cluster containing the following:

The `<name>` specifies the cluster_name used in the folder naming convention as well as within the cluster information files

`<hasGateway>` specifies if the cluster needs an rx gateway which is placed at node 0. Clusters without a gateway can still send messages to other clusters, but they do not have any port numbers to receive messages from other clusters. If `<hasGateway>` is false, then we do not need to specify `<apiFile>`, `<gatewayIP>`, or `<gatewayMac>`.

The `<logicalFile>`, `<mapFile>`, and `<apiFile>` tags are used to specify the logical, map, and api files respectively for the referenced laniakea cluster. You must use absolute filepaths, relative paths are not acceptable.

`<gatewayIP>`, and `<gatewayMac>` specify the IP address and the Mac address respectively of the gateway.
