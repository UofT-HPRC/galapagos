# Galapagos Hardware Stack 

Welcome to the Galapagos Hardware Stack. 

## Prerequisites

Both the Docker Container and native install requires Xilinx Vivado to be installed. Current versions supported are 2018.1, 2018.2, 2018.3, 2019.1

The Galapagos framework has been tested using Python 3.7.10, please have it installed.

## Docker Jupyter Tutorial

To run tutorial refer to instructions in [this README](https://github.com/UofT-HPRC/galapagos/blob/master/docker/README.md)

## First-Time Setup
1. If not installed already, follow the steps to install Python 3.7.10 as Python 3.7 (follow `altinstall` step): [https://github.com/UofT-HPRC/tpdp/blob/main/configuring_server/new_students/README.md#install-a-specific-version-of-python](https://github.com/UofT-HPRC/tpdp/blob/main/configuring_server/new_students/README.md#install-a-specific-version-of-python)
2. We recommend creating a Python virtual environment. Create one by running: `python3.7 -m venv /path/to/venv`
	1. Eg. `python3.7 -m venv ./python_venv_3_7_10`
 	2. This creates a folder (python_venv_3_7_10) which contains the virtual environment (venv folder)
4. Enter the virtual environment by running `source /path/to/venv/bin/activate`
	1. Eg. `source ./python_venv_3_7_10/bin/activate`
6. Install the following dependencies: `pip3 install wheel pyfiglet regex PyInquirer xmltodict`
	1. If pip gives a timeout error, follow the instructions here: [https://github.com/UofT-HPRC/tpdp/blob/main/configuring_server/new_students/README.md#pip-error-ssl-timeout](https://github.com/UofT-HPRC/tpdp/blob/main/configuring_server/new_students/README.md#pip-error-ssl-timeout)
7. In this directory (`galapagos`) run `source build.sh`.
	1. This sets several environment variables which are used by the Galapagos framework
9. Now you should be ready to go! To test your framework, run the following in this directory:
	1. ```
		make test
		source projects/test_proj/createCluster.sh
		```
## Compile a Galapagos Project
## What you need before starting
1. A logical file describing your project's kernels
2. A map file describing how your kernels are distributed on devices
	1. NOTE: Currently Galapagos requires a minimum of 2 declared devices (nodes). If you only want to use one node, create a dummy kernel in your logical file, and create a CPU node in your map file that hosts the kernel (for details on how to create a CPU node, see the map files in the userIP folder).
 
## Steps
1. If using a virtual environment, enter it by running `source /path/to/venv/bin/activate`
	1. Eg. `source ./python_venv_3_7_10/bin/activate`
2. Initialize environment variables by running: `source build.sh`
3. Compile the Vivado HLS IPs and generate TCL scripts by running: `make PROJECTNAME="<project_name>" LOGICALFILE=</path/to/logical/file> MAPFILE=</path/to/map/file>`
4. Use the TCL scripts to generate Vivado projects by running: `source projects/<project_name>/createCluster.sh`
5. At this point, Galapagos will have created one Vivado project for each FPGA declared in your map file. Each FPGA's Vivado project will contain a block diagram for each kernel mapped to it. The number in each block diagram is the ID of the kernel that the block diagram represents. For example, the Vivado project below has block diagrams generated for kernels 3 and 4 in the cluster.
	1. ![Galapagos Vivado Project](https://github.com/UofT-HPRC/galapagos/blob/reconfigurable/fig/galapagos_vivado_project.png)
6. In all of your Vivado projects, open up the kernel block diagrams and construct your kernels. The following connections will be provided for you:
	1. `CLK`: Clock pin
 	2. `rst`: Active-low reset
 	1. `RX_AXIS`: Input AXI-Stream port. AXI-Stream LAN messages sent to this kernel will arrive through this port.
 	2. `TX_AXIS`: Output AXI-Stream port. AXI-Stream LAN messages that this kernel sends must be sent through this port.
  	3. `TX_WAN_AXIS`: Output AXI-Stream port. AXI-Stream WAN messages that this kernel sends must be sent through this port.
  	4. `S_AXIL`: Input AXI-Lite port created if `control`-`s_axil/both` is selected in the Logical File. AXI-Lite messages sent using the control protocol will arrive through this port. 
  	3. `M_AXIL`: Output AXI-Lite port created if `control`-`m_axil/both` is selected in the Logical File. AXI-Lite control messages that this kernel sends must be sent through this port. 


## Initial Setup for Native Install


First you need to initialize all environment variables. This is done with a build script.

`source build.sh`

Second you need to compile the Vivado_HLS source code and generate a Vivado project.

`make PROJECTNAME=${project_name}`

Third you need to build the Vivado project.

`source projects/${project_name}/createCluster.sh`

The layers of the stack that we introduce are as follows:

- Middleware Layer
- Hypervisor Layer
- Physical Hardware /Network Setup

For more details on our automation process please refer to the Makefile. 

## Physical Hardware/Network Setup Layer

Our setup has all FPGAs connected directly to a network switch.  We have the following FPGA boards:
- Alphadata 7v3
- Alphadata 8k5
- Alphadata 8v3
- Fidus Sidewinder (also has a hardened ARM CPU)

Boards without the hardened ARM are connected with an X86 CPU via PCIe. 

## Hypervisor Layer

We plan to have hypervisors setup for various boards. Currently the hypervisor abstracts away the network and PCIe interfaces. 
This exposes all devices with a hypervisor as an AXI-stream in and out through the network interface, and an S_AXI interface from PCIe or ARM and M_AXI to off-chip memory


## Middleware Layer

This takes two files (refer to LOGICALFILE, MAPFILE defined in the Makefile) and partitions a large cluster logically described by the user into multiple separate FPGAs.

### LOGICALFILE

The cluster is described in a LOGICALFILE with no notion of the mappings. 
The following is an example kernel from the logical file:
```
 <kernel> kernelName
	<num> 1 </num>
        <rep> 1 </rep>
        <clk> nameOfClockPort </clk>
        <id_port> nameOfIDport </id_port>
        <aresetn> nameOfResetPort </aresetn>
        <s_axis>
            <name> nameOfInputStreamInterface </name>
	    <scope> scope </scope>
        </s_axis>
        <m_axis>
            <name> nameOfOutputStreamInterface </name>
	    <scope> scope </scope>
            <debug/>
        </m_axis>
        <s_axi>
            <name> nameofControlInterface </name>
	    <scope> scope </scope>
        </s_axi>
        <m_axi>
            <name> nameOfMemoryInterface </name>
	    <scope> scope </scope>
        </m_axi>
</kernel>
```

The `<num>` tag refers to the unique ID of a kernel. <br/>
The `<rep>` refers to the number of times to repeat a kernel. The IDs are of repeated kernels are increased sequentially. <br/>
The `<clk>` refers to the name of the clock interface, this will be tied to the clock in the Hypervisor. <br/
The `<aresetn>` refers to the name of the reset interface, this will be tied to the clock in the Hypervisor (negative edge triggered). <br/>
The `<id_port>` refers to the port name in the kernel that will be tied to a constant with the value of the unique kernel ID. (optional) <br/>
The `<s_axi>` refers to a port from that would be of the `s_axi` interface. If the scope is `global` then this will connect to the control interface (can be either PCIe or ARM, depending on the board). For a local scope, you can specify the `master` which would be another `m_axi` interface that is of `local` scope. <br/>
The `<m_axi>` refers to a port that would be of the `m_axi` interface. If it's of `global` scope then it will tie to the off-chip memory, else it will connect to an `s_axi` interface that is of `local` scope. <br/>
The `<s_axis>` and `<m_axis>` is similar to that of the above interfaces, except that is is the AXI stream. `global` scope ties to the networking port, `local` can connect to each other. <br/>


### MAPFILE

The cluster is described in a MAPFILE with no notion of the mappings.  <br/>
The following is an example kernel from the map file:

```
<node>
        <board> adm-8k5-debug </board>
        <comm> eth </comm>
        <type> hw </type>
        <kernel> 1 </kernel>
        <kernel> 2 </kernel>
        <kernel> 3 </kernel>
        <mac_addr>  fa:16:3e:55:ca:02 </mac_addr>
        <ip_addr> 10.1.2.102 </ip_addr>
</node>

```

The `<board>` tag refers to the FPGA board you wish to use for this particular node. <br/>
The `<kernel>` refers to the unique kernel ID that you wish to put on this node.  <br/>

  
For an example refer to `galapagos/middleware/python/tests/conf0/configuration_files/*`

