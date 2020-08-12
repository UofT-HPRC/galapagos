#!/usr/bin/env python
# coding: utf-8

# # Welcome To The Galapagos Setup

# The Galapagos Middleware presents an orchestration framework to create multi-FPGA and CPU networks and can be built on top of any device that has a Galapagos Hypervisor.

# <a id='own_example'></a>
# 
# # Setup
# 
# ## Setup Environment Variables
# 
# The following cells follow the initial setup. The first sets up the environment variables needed by the scripts below.

# In[5]:


galapagos_path=home/user/galapagos
cd $galapagos_path

vivado_version=2018.1
hls_version=2018.1
galapagos_board=adm-8k5-debug
vivado_path=/opt/Xilinx/Vivado
hls_path=/opt/Xilinx/Vivado_HLS

source init.sh $galapagos_path $vivado_path $hls_path $vivado_version $hls_version
galapagos-update-board $galapagos_board
export XILINX_VIVADO=$GALAPAGOS_VIVADO_PATH


# ## Make Middleware IP
# 
# 
# Next we need to build the IP cores used by the middleware layer to connect different Galapagos objects
# 
# The middleware IP cores are shown in the following figure:
# 
# <img style="float: left;" src="fig/middleware_ip.png"/>  

# In[2]:


cd $GALAPAGOS_PATH
make hlsmiddleware  


# The previous section makes the router blocks, and two network bridges. One network bridge translates TCP/IP packets into Galapagos packets, and another network bridge translates L2 ethernet packets into Galapagos packets.
# The user can select in their cluster description map file their choice of off-chip network communication.

# ## Compiling User Kernels (Hardware) 
# 
# To create a user kernel it is very similar to that of creating the hlsmiddleware in the previous section.
# In the following we have an example.
# 
# First we set the board we wish to target:

# In[2]:


galapagos-update-board adm-8k5-debug


# To compile hardware kernels we need to include the Galapagos hardware library found in `<galapagos_home>/middleware/include`
# 
# The following is the tcl_script that compiles the hardware kernel:
# 
# ```tcl
# set galapagos_path $::env(GALAPAGOS_PATH)
# set board_name $::env(GALAPAGOS_BOARD_NAME)
# set part_name $::env(GALAPAGOS_PART)
# set src_path_root [pwd] 
# 
# cd $galapagos_path/hlsBuild/${board_name}/ip
# 
# open_project hls4ml_hcal
# set_top hls4ml_hcal
# open_solution "solution1"
# set_part ${part_name}
# add_files $src_path_root/ereg_v1.cpp
# add_files $src_path_root/hls4ml_hcal.cpp -cflags "-I $galapagos_path/middleware/include -I $src_path_root -I $src_path_root/weights -I $src_path_root/nnet_utils"
# create_clock -period 250MHz -name default
# config_interface -expose_global
# csynth_design
# export_design -format ip_catalog
# close_project
# 
# quit
# 
# ```
# 
# The key things to note is that the board name, parth and galapagos_path are all taken from environment variables that was set up earlier. Second thing to note is the inclusion of our middleware library.
# 
# 
# This kernel is made with our Makefile (that calls the included tcl script) in the following code block:

# In[3]:


cd /home/user/HCAL_HLS4ML
make hls


# This will place the generated IP cores in `<galapagos_home>/hlsBuild/<board_name>/ip`. Here we can see all the IP cores that we have created for this board. This includes the middleware IP cores and the User IP cores

# In[4]:


cd $GALAPAGOS_PATH/hlsBuild/$GALAPAGOS_BOARD_NAME/ip
ls


# Now that we have created our IP cores, we can describe them in a cluster and stitch them together. <a href='http://127.0.0.1:9000/notebooks/02_middleware.ipynb'>Using the Middleware'</a>

# ## Compiling User Kernels (Software)
# 
# Hardware and software kernels have the same code structure (HLS code). However the compilation process is slightly different. To compile software we have to include the Galapagos library found in: `<galapagos_home>/middleware/CPP_lib/Galapagos_lib`
# 
# This is compiled using our Makefile in the following code block:

# In[6]:


cd /home/user/HCAL_HLS4ML
make cpu_node.exe


# ## Example Galapagos Kernel
# 
# Since both hardware and software kernels look the same we can investigate both kernels with one example. The following is a code example of a sample kernel:
# 
# ```cpp
# void kern_send(short id, galapagos_stream * in, galapagos_stream  * out)
# {
# #pragma HLS INTERFACE ap_ctrl_none port=return
# #pragma HLS INTERFACE axis register both port=out
# #pragma HLS INTERFACE axis register both port=in
# 
#     int num_flits = STREAMSIZE*N_INPUTS;
# 
#     galapagos_stream_packet gp;
#     gp.id = id;
# 
#     #include "inputs_demo.h"
# 
# 
#     for(int j=0; j<num_flits; j++){
#         gp.dest = 1; // FIRST
#         gp.data = 0;
#         (gp.data)(31,0) = input_vals[j];
#         if(j==(num_flits -1))
#             gp.last = 1;
#         else
#             gp.last = 0;
#         out->write(gp);
#     }   
# 
# 
#     num_flits = STREAMSIZE*N_OUTPUTS;
# 
# 
#     for(int j=0; j<num_flits; j++){
#         gp = in->read();
#     }
# }
# 
# ```
# 
# ### Interfaces
# 
# All kernels have 3 interfaces <br/>
# 1. ID: This is the id of the kernel. If another kernel specifies the dest field of an outgoing packet with this ID then this kernel will receive it in the in stream.
# 2. In: This is the input galapagos_stream. 
# 3. Out: This is the output galapagos_stream
# 
# At the very beginning there are three interface pragma. This is ignored by gcc if compiling for software.
# 
# 
# ### Program Behaviour
# 
# This program first writes in a loop of flits to dest of 1. It produces one packet with `<num_flits>` flits. The end of the packet is signified by the raising of the last signal.
# 
# Then the program waits to receive one multi-flit packet at the end of the program. Both reading and writing of these streams are blocking calls.
