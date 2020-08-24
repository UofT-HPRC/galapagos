#!/usr/bin/env python
# coding: utf-8

# # Building Your Projects
# 
# To make your final project navigate to `<galapagos_home>/projects/middleware_test`
# 
# `source createCluster.sh`
# 
# This will build all the vivado projects. You can run it below, but it is highly recommended you run this in your own terminal as this is a long running process.

# In[3]:


galapagos_path=/home/user/galapagos
vivado_version=2018.1
hls_version=2018.1
galapagos_board=adm-8k5-debug
vivado_path=/opt/Xilinx/Vivado
hls_path=/opt/Xilinx/Vivado/$hls_version
project_name=middleware_test

source /home/user/.license.sh
source $galapagos_path/init.sh $galapagos_path $vivado_path $hls_path $vivado_version $hls_version
galapagos-update-board $galapagos_board


#cd $GALAPAGOS_PATH/projects/$project_name
#source createCluster.sh


# In[ ]:




