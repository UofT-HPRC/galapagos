#!/usr/bin/env python
# coding: utf-8

# # Welcome To Galapagos Middleware Tutorial

# Now that we have made our IP cores that are the building blocks of our cluster, we can use the middleware to describe our cluster and generate our vivado projects. We use a logical_file and a map_file to describe our cluster. 

# We need the environment variables setup in our path again. This was done in bash last time, the following is python code to set the env as the same.

# In[5]:


import os

os.environ['GALAPAGOS_PATH']='/home/user/galapagos'

print("set GALAPAGOS_PATH")


# The following is an example logical_file:

# In[6]:


logical_file = {
	"cluster": {
		"kernel": [
			{
				"num": "0",
				"rep": "1",
				"clk": "ap_clk",
				"aresetn": "ap_rst_n",
				"s_axis": {
					"scope": "global",
					"name": "in_r"
				},
				"m_axis": {
					"scope": "global",
					"name": "out_r"
				},
				"#text": "kern_send"
			},
			{
				"num": "1",
				"rep": "1",
				"clk": "ap_clk",
				"vendor": "xilinx.com",
				"lib": "hls",
				"aresetn": "ap_rst_n",
				"s_axis": {
					"scope": "global",
					"name": "in_r"
				},
				"m_axis": {
					"scope": "global",
					"name": "out_r"
				},
				"id_port": "id",
				"#text": "hls4ml_hcal"
			}
		]
	}
}


print("...................Logical File...................")
for kern in logical_file['cluster']['kernel']:
    print(kern)


# The above logical file describes two kernels within the cluster. 
# 
# The `<num>` field represents the kernel id of that specific kernel. Any other kernel when setting their dest to this number will send a packet to this kernel. <br/>
# The `<rep>` field represents the number of times to repeat this kernel within the cluster (on any device). <br/>
# The `<clk>` field represents the name of the port that is the clock port. <br/>
# The `<aresetn>` field represents the name of the reset n port.
# 
# Next each kernel also has an `<s_axis>` which represents the galapagos stream in and the `<m_axis>` which represents the galpagos stream out.
# Each of these is set to a `"scope", "global"`. This allows these streams to be directly accessible by any other kernel in the global dest addressing scheme. We also can set extra `"local"` connections, which directly connects kernels together.
# 
# The `<id_port>` refers to the name of the port that we wish to attach a constant representing the id of the kernel. This can be used internally to figure out the destinations of other kernels relative to your own id.
# 
# The `<#text>` refers to the name of the kernel ip core.
# 
# Below is an example of a map_file:

# In[7]:


map_file = {
	"cluster": {
		"node": [
			{
				"type": "sw",
				"kernel": [
					"0"
				],
				"mac": "0c:c4:7a:88:c0:47",
				"ip": "10.1.2.155"
			},
			{
				"board": "adm-8k5-debug",
				"comm": "tcp",
				"type": "hw",
				"kernel": "1",
				"mac": "fa:16:3e:55:ca:02",
				"ip": "10.1.2.156"
			}
		]
	}
}
print("...................Map File...................")
for node in map_file['cluster']['node']:
    print(node)


# The above map file describes two nodes within the cluster.
# 
# The `<type>` field can be hardware or software. <br/>
# The `<kernel>` field can be a list or an individual kernel. This refers to the kernels by number in the logical file to be placed in this node. <br/>
# The `<mac>` field refers to the nodes L2 Mac address. <br/>
# The `<ip>` field refers to the nodes L3 IP Address. <br/>
# Currently the only off-chip communication support in software is TCP/IP. However if the node is a hardware node we can specify the `<comm>` field which denotes the off-chip communication protocol to be used. <br/>
# Furthermore if the node is a hardware node, the `<board>` denotes the type of board this node is. <br/>
# 
# Next we will generate the script files to build our vivado projects using the logical and map file.

# In[8]:


import os
from cluster import cluster

project_name = "middleware_test"
path = str(os.environ.get('GALAPAGOS_PATH'))+ "/projects"

cluster_inst = cluster(project_name, logical_file, map_file, mode='dict')
cluster_inst.makeProjectClusterScript(path)
cluster_inst.writeClusterTCL(path, 0)
cluster_inst.writeBRAMFile(path, 'mac')
cluster_inst.writeBRAMFile(path, 'ip')

print("Created cluster generation script at " + path + "/" + project_name + "/createCluster.sh")


# This will create a cluster in `<galapagos_home>/projects/middleware_test` as we set `middleware_test` as the `project_name`.
# However we are not yet ready to create the project as the scripts assume all the IP cores are ready to use. The following is the final step in building your project. <a href='http://127.0.0.1:9000/notebooks/03_building_the_project.ipynb'> Building Your Project </a>
