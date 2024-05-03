#!/usr/bin/python
import copy

import subprocess
import os
import re
import math
from tclMe import tclMeFile
import gatewayFileGenerator
from MemoryPartitioner import MemoryPartitioner
from createTopLevel import createTopLevelVerilog, createMemoryPartitioner
"""
Most of these functions are called (directly or indirectly) by makeTclFiles.
Each one takes care of one self-contained part of the TCL file generation.
"""
#interfaces constant
#creates the standard interfaces, same for all fpgas

def createHierarchyTCL(project_name,outFile,kernel_properties,ctrl_ports_list, user_repo,fpga,is_gw,outDir,api_info,CAMILO_TEMP_DEBUG):
    hier_file = tclMeFile(outFile,fpga)
    has_attached = False
    for prop in kernel_properties:
        if ((prop['type'] == 'ip') or (prop['type'] == 'cpp_vit') or (prop['type'] == 'cpp_viv') ):
            has_attached = True
    if is_gw and fpga['num'] == 0:
        hier_file.add_ip_repo(outDir + "/Gateway_IP_repo")
    if has_attached:
        hier_file.add_ip_repo(user_repo)
    for prop in kernel_properties:
        kern = prop['inst']
        name = prop['name']
        Sname = prop['slave_name']
        Mname = prop['master_name']
        clkname = prop['clock_name']
        rstname = prop['reset_name']
        wanena = prop['wan_enabled'][0]
        wannam = prop['wan_name'][0]
        id_prt = ""
        if prop['has_id']:
            id_prt = str(prop['id_port'])
        hier_file.create_bd("\"user_"+str(kern)+"_i\"",clkname,199998001,rstname)
        if fpga.has_control:
            if kern in ctrl_ports_list:
                hier_file.add_axi4_port("AXI_CONTROL","Slave")
                hier_file.tprint("set_property -dict [ list CONFIG.DATA_WIDTH {128} CONFIG.ADDR_WIDTH {40} CONFIG.ID_WIDTH {16} CONFIG.ARUSER_WIDTH {16} CONFIG.AWUSER_WIDTH {16} ] [get_bd_intf_ports /AXI_CONTROL]")
        hier_file.add_axis_port(Sname,"Slave")
        hier_file.add_if_to_clk(Sname,clkname)
        hier_file.add_axis_port(Mname,  "Master")
        hier_file.add_if_to_clk(Mname, clkname)
        ### changes for ddr - Charles
        if fpga.has_ddr:
            for i in fpga['kernel']:
                if i['num'] == int(kern[-1]) and i['ddr']:
                    hier_file.tprint("create_bd_intf_port -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 out_ddr\n")
                    hier_file.tprint("set_property -dict [list CONFIG.DATA_WIDTH {512} CONFIG.ADDR_WIDTH {34} CONFIG.ID_WIDTH {1} CONFIG.FREQ_HZ {199998001} ] [get_bd_intf_ports out_ddr]\n")
                    print("DDR FOUND IN KERNEL BD")
        ###
        if wanena:
            hier_file.add_axis_port(wannam, "Master")
            hier_file.add_if_to_clk(wannam, clkname)
        if is_gw:
            hier_file.setup_axis_link("/" + Sname, 64, 1, 1, 16, 0, 48)
            hier_file.add_axis_port("Direct_port", "Master")
            hier_file.add_if_to_clk("Direct_port", clkname)
        else:
            hier_file.setup_axis_link("/" + Sname, 64, 1, 1, 24, 24, 8)
        if prop['has_id']:
            hier_file.tprint("create_bd_port -dir I -from 23 -to 0 " + id_prt)
        if (is_gw and fpga['num'] == 0 and (not CAMILO_TEMP_DEBUG)):
            cwd = os.getcwd()
            files_to_parse = gatewayFileGenerator.create_hls_files(api_info, outDir)
            subprocess.run(["mkdir", "-p", outDir + "/Gateway_IP_repo"])
            for file_inst in files_to_parse:
                subprocess.run(["cp", outDir + "/"+file_inst+".cpp",
                            outDir + "/Gateway_IP_repo/"+file_inst+".cpp"])
                os.chdir(outDir + "/Gateway_IP_repo/")
                tcl_file = tclMeFile( outDir + "/Gateway_IP_repo/" + file_inst, fpga)
                tcl_file.tlines(
                    ["set part_name " + fpga['part'],
                    "open_project " + file_inst,
                    "set_top " + file_inst,
                    "open_solution \"solution1\"",
                    "set_part ${part_name}",
                    "add_files " + outDir + "/Gateway_IP_repo/" + file_inst + ".cpp",
                    "create_clock -period 199.498000MHz -name default",
                    "csynth_design",
                    "export_design -format ip_catalog",
                    "close_project",
                    "quit"]
                )
                tcl_file.close()
                subprocess.run(["vitis_hls", outDir + "/Gateway_IP_repo/" + file_inst + ".tcl"])
                os.chdir(cwd)
            hier_file.addSource(outDir + '/0_gateway.tcl')
        elif ((prop['type'] == 'cpp_vit') or (prop['type'] == 'cpp_viv')):
            hier_file.instBlockcc(
                {'name': name,
                 'resetns_port': rstname,
                 'clock_port': clkname,
                 'inst': 'userIPinstance',
                 'clks': [clkname],
                 'resetns': [rstname],
                 },
                clkname
            )
            cwd = os.getcwd()
            subprocess.run(["mkdir","-p",user_repo + "/__galapagos_autogen_"+project_name+"/"+name])
            subprocess.run(["cp", user_repo+"/"+name+".cpp", user_repo + "/__galapagos_autogen_"+project_name+"/"+name+"/"+name+".cpp"])
            os.chdir(user_repo + "/__galapagos_autogen_"+project_name+"/"+name)
            tcl_file = tclMeFile(user_repo + "/__galapagos_autogen_"+project_name+"/"+name+"/"+name, fpga)
            tcl_file.tlines(["set part_name "+fpga['part'],
                           "open_project "+name,
                           "set_top "+name,
                           "open_solution \"solution1\"",
                           "set_part ${part_name}",
                           "add_files "+ user_repo + "/__galapagos_autogen_"+project_name+"/"+name+"/"+name+".cpp",
                           "create_clock -period 199.498000MHz -name default",
                           "csynth_design",
                           "export_design -format ip_catalog",
                           "close_project",
                           "quit"])
            tcl_file.close()
            if (prop['type'] == 'cpp_vit'):
                subprocess.run(["vitis_hls",user_repo + "/__galapagos_autogen_"+project_name+"/"+name+"/"+name+".tcl"])
            else:
                subprocess.run(["vivado_hls", user_repo + "/__galapagos_autogen_"+project_name+"/" + name + "/" + name + ".tcl"])
            os.chdir(cwd)
        elif prop['type'] == 'ip':
            hier_file.instBlockcc(
                {'name': name,
                 'resetns_port': rstname,
                 'clock_port': clkname,
                 'inst': 'userIPinstance',
                 'clks': [clkname],
                 'resetns': [rstname],
                 },
                clkname
            )
        elif (prop['type'] == 'verilog'):
            hier_file.addVerilog(user_repo + "/" + name +".v")
            hier_file.instModulecc(
                {'name': name,
                 'resetns_port': rstname,
                 'clock_port': clkname,
                 'inst': 'userIPinstance',
                 'clks': [clkname],
                 'resetns': [rstname],
                 },
                clkname
            )
        elif (prop['type'] == 'vhdl'):
            hier_file.addVerilog(user_repo + "/" + name + ".vhdl")
            hier_file.instModulecc(
                {'name': name,
                 'resetns_port': rstname,
                 'clock_port': clkname,
                 'inst': 'userIPinstance',
                 'clks': [clkname],
                 'resetns': [rstname],
                 },
                clkname
            )
        elif (prop['type'] == 'system_verilog'):
            hier_file.addVerilog(user_repo + "/" + name + ".sv")
            hier_file.instModulecc(
                {'name': name,
                 'resetns_port': rstname,
                 'clock_port': clkname,
                 'inst': 'userIPinstance',
                 'clks': [clkname],
                 'resetns': [rstname],
                 },
                clkname
            )
        elif (prop['type'] == 'tcl'):
            hier_file.addSource(user_repo + "/" + name + ".tcl")
        if ((prop['type'] != 'open') and (prop['type'] != 'tcl')):
            hier_file.makeConnection(
                "intf",
                {
                    'name': None,
                    'type': 'intf_port',
                    'port_name': Sname
                },
                {'name': 'userIPinstance',
                 'type': 'intf',
                 'port_name': Sname
                 }
            )
            hier_file.makeConnection(
                "intf",
                {
                    'name': None,
                    'type': 'intf_port',
                    'port_name': Mname
                },
                {'name': 'userIPinstance',
                 'type': 'intf',
                 'port_name': Mname
                 }
            )
            if wanena:
                hier_file.makeConnection(
                    "intf",
                    {
                        'name': None,
                        'type': 'intf_port',
                        'port_name': wannam
                    },
                    {'name': 'userIPinstance',
                     'type': 'intf',
                     'port_name': wannam
                     }
                )
            if prop['has_id']:
                hier_file.makeConnection(
                    "net",
                    {
                        'name': None,
                        'type': 'port',
                        'port_name': id_prt
                    },
                    {'name': 'userIPinstance',
                     'type': 'pin',
                     'port_name': id_prt
                     }
                )
            hier_file.validate()
        hier_file.save()
    hier_file.close()
# DEPRECATED BUT HAS CONTROL STUFF
#TODO: Merge
# def createHierarchyTCL(outFile,kernel_names,ctrl_kernel_dict, axil_addr_width=64):
#     """
#     Creates the TCL script that builds the block diagrams for the user kernels. Adds interface ports based on user preferences
    
#     Args:
#         outFile (string): Name of the TCL script
#         kernel_names (list): List of kernel instance names (eg. ['kernel_1_inst_1', 'kernel_1_inst_3', 'kernel_1_inst_5'] means building block diagrams for each kernel
#         ctrl_kernel_dict (dict): Dictionary indexed by kernel instance name. Each dictionary entry consists of a dictionary of 2 entries:
#             'inst': Instance name of the kernel, with 'applicationRegion' removed
#             'control_type': 'm_axil', 's_axil', or 'both' 
#     """
#     dst_file = open(outFile, "w")
#     for kern in kernel_names:
#         file_contents = ""
#         file_contents = file_contents +"create_bd_design \"user_"+str(kern)+"_i\"\n"
#         file_contents = file_contents + "create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 RX_AXIS\n"
#         file_contents = file_contents + "create_bd_intf_port -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 TX_AXIS\n"
#         file_contents = file_contents + "create_bd_intf_port -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 TX_WAN_AXIS\n"
#         file_contents = file_contents + "create_bd_port -dir I -type clk -freq_hz 199498000 CLK\n"
#         file_contents = file_contents + "create_bd_port -dir I -type rst rstn\nset_property CONFIG.ASSOCIATED_RESET {rstn} [get_bd_ports /CLK]\n"
#         file_contents = file_contents + "set_property -dict [ list CONFIG.HAS_TKEEP {1} CONFIG.HAS_TLAST {1} CONFIG.TDEST_WIDTH {24} CONFIG.TDATA_NUM_BYTES {64} CONFIG.TID_WIDTH {24} CONFIG.TUSER_WIDTH {16} ] [get_bd_intf_ports /RX_AXIS]\n"
#         if kern in ctrl_kernel_dict:
#             kernel_dict = ctrl_kernel_dict[kern]
#             if kernel_dict['control_type'] == 'm_axil' or kernel_dict['control_type'] == 'both':
#                 file_contents = file_contents + "create_bd_intf_port -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M_AXIL\n"
#                 file_contents = file_contents + "set_property -dict [ list CONFIG.PROTOCOL {AXI4LITE} CONFIG.ADDR_WIDTH %d CONFIG.CLK_DOMAIN {CLK} CONFIG.FREQ_HZ {200000000} CONFIG.HAS_BURST {0} CONFIG.HAS_CACHE {0} CONFIG.HAS_LOCK {0} CONFIG.HAS_PROT {0} CONFIG.HAS_QOS {0} CONFIG.HAS_REGION {0} CONFIG.HAS_RRESP {0} CONFIG.NUM_READ_OUTSTANDING {1} CONFIG.NUM_WRITE_OUTSTANDING {1} ] [get_bd_intf_ports /M_AXIL]\n" % (axil_addr_width)
#             if kernel_dict['control_type'] == 's_axil' or kernel_dict['control_type'] == 'both':
#                 file_contents = file_contents + "create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXIL\n"
#                 file_contents = file_contents + "set_property -dict [ list CONFIG.PROTOCOL {AXI4LITE} CONFIG.ADDR_WIDTH %d CONFIG.CLK_DOMAIN {CLK} CONFIG.FREQ_HZ {200000000} CONFIG.HAS_BURST {0} CONFIG.HAS_CACHE {0} CONFIG.HAS_LOCK {0} CONFIG.HAS_PROT {0} CONFIG.HAS_QOS {0} CONFIG.HAS_REGION {0} CONFIG.HAS_RRESP {0} CONFIG.NUM_READ_OUTSTANDING {1} CONFIG.NUM_WRITE_OUTSTANDING {1} ] [get_bd_intf_ports /S_AXIL]\n" % (axil_addr_width)
#         # Assign interface ports to clocks
#         file_contents = file_contents + "set_property CONFIG.ASSOCIATED_BUSIF {RX_AXIS:TX_AXIS"
#         if kern in ctrl_kernel_dict:
#             kernel_dict = ctrl_kernel_dict[kern]
#             if kernel_dict['control_type'] == 'm_axil' or kernel_dict['control_type'] == 'both':
#                 file_contents = file_contents + ":M_AXIL"
#             if kernel_dict['control_type'] == 's_axil' or kernel_dict['control_type'] == 'both':
#                 file_contents = file_contents + ":S_AXIL"
#         file_contents = file_contents + "} [get_bd_ports /CLK]\n"
#         file_contents = file_contents + "save_bd_design\n"
#         dst_file.write(file_contents)

def makeControlKernelDictionary(tcl_user_app, index):
    """
    Makes a dictionary of control kernels (ctrl_kernel_dict). ctrl_kernel_dict is indexed by "index" (chosen by user). The function identifies all control-enabled kernels inside tcl_user_app. For each entry, it creates a dictionary entry consisting of a 2-element dictionary (kernel_dict).
    Each kernel_dict consists of 2 entries:
        'inst': Instance name of the kernel, with 'applicationRegion' removed
        'control_type': 'm_axil', 's_axil', or 'both' 
    Eg. ctrl_kernel_dict = {
                                1: {'inst': 'kernel_1_inst_1', 'control_type': 'm_axil'},
                                6: {'inst': 'kernel_1_inst_6', 'control_type': 'm_axil'}
                            }
    Args:
        tcl_user_app: a tclMe object (which contains references to the FPGA's
                      node object and a handle to the output file)
        index(str): What to index the dictionary by ('num' or 'inst')
    """
    ctrl_kernel_dict = {}
    for kernel in tcl_user_app.fpga['kernel']:
        if kernel['control'] is True:
            instance_name = kernel['inst'].split('/')[-1] # Remove applicationRegion
            # ctrl_kernel_dict indexed by kernel ID or instance name
            if index == 'num':
                ctrl_kernel_dict[int(kernel['num'])] = {
                                                        'inst': instance_name, 
                                                        'control_type': kernel['control_type']
                                                    }
            elif index == 'inst':
                ctrl_kernel_dict[instance_name] = {
                                                        'inst': instance_name, 
                                                        'control_type': kernel['control_type']
                                                    }
    return ctrl_kernel_dict

def getSortedListofKeys(input_dict):
    """
    Sorts the dictionary keys into ascending order.
    
    Args:
        input_dict(dict): dictionary whose keys are all integers
    """
    keys_list = []
    for key in input_dict:
        keys_list.append(int(key))
    keys_list.sort()
    return keys_list

def setSwitchManagerPortRouting(tcl_user_app, switch_name, tdest_list):
    """
    Connects the manager ports of the specified switch to the TDESTs in the tdest_list. This happens in ascending order of the list eg. if tdest_list is [3 6 2 5] M00_AXIS will be connected to 3, M01_AXIS connected to 6, etc.
    
    Args:
        tcl_user_app: a tclMe object (which contains references to the FPGA's
                      node object and a handle to the output file)
        switch_name (str): Instance name of the switch eg. 'applicationRegion/input_switch'
        tdest_list (list): List of TDESTS which will be connected to the switch
    """
    num_tdest = len(tdest_list)
    properties = []
    for i in range(0, num_tdest):
        if i < 10:
            manager_port = 'M0' + str(i)
        else:
            manager_port = 'M' + str(i)
        tdest_str = "0x{:08x}".format(tdest_list[i])
        base_tdest_setting = 'CONFIG.' + manager_port + '_AXIS_BASETDEST {' + tdest_str + '}'
        properties.append(base_tdest_setting)
        high_tdest_setting = 'CONFIG.' + manager_port + '_AXIS_HIGHTDEST {' + tdest_str + '}'
        properties.append(high_tdest_setting)
    tcl_user_app.setProperties(switch_name, properties)

def buildControlToNBSwitch(tcl_user_app, path, num_ctrl_instances):
    """
    Creates a single output switch for control kernels. This switch is used to aggregate all Control IP instances' signals for a data path. Eg. this switch will sit between Control API kernels and the LAN router, collecting all LAN messages from the Control API instances.    
    Args:
        tcl_user_app: a tclMe object (which contains references to the FPGA's
                      node object and a handle to the output file)
        path (str): Which data path the switch will connect to ('LAN', 'WAN', or 'KIP')
        num_ctrl_instances (int): Number of inputs to the switch
    """
    switch_name = "applicationRegion/ctrl_to_nb_" + path + "_switch"
    tcl_user_app.instBlock(
        {
            'name':'axis_switch',
            'inst': switch_name,
            'clks':['aclk'],
            'resetns_port': 'rst',
            'resetns':['aresetn']
        }
    )
    #Configure the switch to have 1 slave per kernel, 1 master, that it allows all messages through, and arbitrate on TLAST only.
    properties = [
        'CONFIG.NUM_SI {' + str(num_ctrl_instances) + '}',
        'CONFIG.NUM_MI {1}',
        'CONFIG.HAS_TLAST.VALUE_SRC USER',
        'CONFIG.M00_AXIS_HIGHTDEST {0xffffffff}'
    ]
    tcl_user_app.setProperties(switch_name,properties)
    properties = [
        'CONFIG.HAS_TLAST {1}'
    ]
    tcl_user_app.setProperties(switch_name, properties)
    properties = [
        'CONFIG.ARB_ON_MAX_XFERS {0}',
        'CONFIG.ARB_ON_TLAST {1}'
    ]
    tcl_user_app.setProperties(switch_name, properties)

def buildControlAPIInst(tcl_user_app, kernel_id, kernel_dict, axil_addr_width, has_wstrb=True, has_reliability=True, rel_timeout=500):
    """
    Builds an instance of the Control API hierarchy for a kernel, and performs all internal connections

    Args:
        tcl_user_app: a tclMe object (which contains references to the FPGA's
                      node object and a handle to the output file)
        kernel_id (int): The ID of the kernel that this instance will be connected to
        kernel_dict (dict): Dictionary consisting of 2 entries:
                'inst': Instance name of the kernel, with 'applicationRegion' removed
                'control_type': 'm_axil', 's_axil', or 'both' 
        axil_addr_width (int): Width of the AXI-Lite Address channels
        has_wstrb (bool): Does the AXI-Lite WDATA interface have WSTRB enabled?
        has_reliability (bool): Does the user want to use reliability?
        rel_timeout (int): Number of cycles that the reliability module will wait before sending a re-transmission
    """
    hierarchy_name = "applicationRegion/control_api_inst_%d" % (kernel_id)
    tcl_user_app.createHierarchy(hierarchy_name)
    # Kernel ID
    tcl_user_app.instBlock(
        {
            'name': 'xlconstant',
            'inst':  hierarchy_name + '/kernel_id',
            'properties': [ 
                            'CONFIG.CONST_WIDTH {8}',
                            'CONFIG.CONST_VAL {' + str(kernel_id) + '}'
                          ]
        }
    )
    # Add AXI-Lite to Network Converter and connect to Kernel ID
    tcl_user_app.instBlock(
        {
            'name': 'axi_lite_to_network_converter',
            'inst':  hierarchy_name + '/anc',
            'clks': ['i_clk'],
            'resetns': ['i_ap_rst_n'],
            'resetns_port': 'rst',
            'properties': [ 
                            'CONFIG.AXI_LITE_ADDR_WIDTH {' + str(axil_addr_width) + '}',
                            'CONFIG.AXI_LITE_WSTRB_ENABLED {' + str(has_wstrb) + '}'
                          ]
        }
    )
    tcl_user_app.makeConnection(
        'net', 
        {
            'type': 'pin',
            'name': hierarchy_name + '/kernel_id',
            'port_name': 'dout'
        },
        {
            'type': 'pin',
            'name': hierarchy_name + '/anc',
            'port_name': 'i_kernel_id'
        }
    )
    # If the control type is only 'm_axil' or 's_axil', connect the unused AXIL ports to 0
    if kernel_dict['control_type'] != 'both':
        tcl_user_app.instBlock(
            {
                'name': 'xlconstant',
                'inst':  hierarchy_name + '/const_0',
                'properties': [ 
                                'CONFIG.CONST_WIDTH {1}',
                                'CONFIG.CONST_VAL {0}'
                            ]
            }
        )
        # Case 1: in 'm_axil' mode M_AXIL port of control is unused
        if kernel_dict['control_type'] == 'm_axil':
            port_name = 'M_AXIL_'
            pin_names = ['awready', 'wready', 'bvalid', 'arready', 'rvalid']
        else:
            port_name = 'S_AXIL_'
            pin_names = ['awvalid', 'wvalid', 'bready', 'arvalid', 'rready']
        for pin_name in pin_names:
            tcl_user_app.makeConnection(
                'net', 
                {
                    'type': 'pin',
                    'name': hierarchy_name + '/const_0',
                    'port_name': 'dout'
                },
                {
                    'type': 'pin',
                    'name': hierarchy_name + '/anc',
                    'port_name': port_name + pin_name
                }
            )

    # If Reliability is selected, build Reliability Protocol Module and connect to the AXI-Lite to Network Converter
    if has_reliability:
        tcl_user_app.instBlock(
            {
                'name': 'reliability_protocol_module',
                'inst':  hierarchy_name + '/rpm',
                'clks': ['i_clk'],
                'resetns': ['i_ap_rst_n'],
                'resetns_port': 'rst',
                'properties': [ 
                                'CONFIG.IS_WAN_RX {false}',
                                'CONFIG.PUBREC_TIMEOUT {' + str(rel_timeout) + '}',
                                'CONFIG.PUBCOMP_TIMEOUT {' + str(rel_timeout) + '}'
                              ]
            }
        )
        tcl_user_app.makeConnection(
            'net', 
            {
                'type': 'pin',
                'name': hierarchy_name + '/kernel_id',
                'port_name': 'dout'
            },
            {
                'type': 'pin',
                'name': hierarchy_name + '/rpm',
                'port_name': 'i_kernel_id'
            }
        )
        # Connect IP Address and Control Port Number to AXI-Lite to Network Converter. That way only ANC needs to be connected to the outside world
        tcl_user_app.makeConnection(
            'net', 
            {
                'type': 'pin',
                'name': hierarchy_name + '/anc',
                'port_name': 'i_kernel_ip_address'
            },
            {
                'type': 'pin',
                'name': hierarchy_name + '/rpm',
                'port_name': 'i_kernel_ip_address'
            }
        )
        tcl_user_app.makeConnection(
            'net', 
            {
                'type': 'pin',
                'name': hierarchy_name + '/anc',
                'port_name': 'i_control_port_number'
            },
            {
                'type': 'pin',
                'name': hierarchy_name + '/rpm',
                'port_name': 'i_KIP_port_number'
            }
        )
        # Connect Reliability Protocol Module to AXI-Lite to Network Converter    
        tcl_user_app.makeConnection(
            'intf', 
            {
                'type': 'intf',
                'name': hierarchy_name + '/anc',
                'port_name': 'to_LAN'
            },
            {
                'type': 'intf',
                'name': hierarchy_name + '/rpm',
                'port_name': 'from_ctrl_LAN'
            }
        )
        tcl_user_app.makeConnection(
            'intf', 
            {
                'type': 'intf',
                'name': hierarchy_name + '/anc',
                'port_name': 'to_WAN'
            },
            {
                'type': 'intf',
                'name': hierarchy_name + '/rpm',
                'port_name': 'from_ctrl_WAN'
            }
        )
        tcl_user_app.makeConnection(
            'intf', 
            {
                'type': 'intf',
                'name': hierarchy_name + '/anc',
                'port_name': 'to_KIP'
            },
            {
                'type': 'intf',
                'name': hierarchy_name + '/rpm',
                'port_name': 'from_ctrl_KIP'
            }
        )
        tcl_user_app.makeConnection(
            'intf', 
            {
                'type': 'intf',
                'name': hierarchy_name + '/rpm',
                'port_name': 'to_ctrl'
            },
            {
                'type': 'intf',
                'name': hierarchy_name + '/anc',
                'port_name': 'from_network_bridge'
            }
        )

def setControlAXILPortProperties(tcl_user_app, port_name, axil_addr_width):
    """
    Sets an external AXI port up for AXI-Lite communications. This involves switching the port to AXI-Lite, specifying Address width, and which side-channel signals will be included.

    Args:
        tcl_user_app: a tclMe object (which contains references to the FPGA's
                      node object and a handle to the output file)
        port_name (str): Name of the AXI interface port
        axil_addr_width (int): Width of the AXI-Lite Address channels
    """
    properties = [
        'CONFIG.PROTOCOL AXI4LITE',
        'CONFIG.ADDR_WIDTH ' + str(axil_addr_width),
        'CONFIG.CLK_DOMAIN CLK',
        'CONFIG.FREQ_HZ 200000000',
        'CONFIG.HAS_BURST 0',
        'CONFIG.HAS_CACHE 0',
        'CONFIG.HAS_LOCK 0',
        'CONFIG.HAS_PROT 0',
        'CONFIG.HAS_QOS 0',
        'CONFIG.HAS_REGION 0',
        'CONFIG.HAS_RRESP 0',
        'CONFIG.NUM_READ_OUTSTANDING 1',
        'CONFIG.NUM_WRITE_OUTSTANDING 1'
    ]
    tcl_user_app.setPortProperties(port_name, properties)

def getMaxAddressRangeByWidth(addr_width):
    """
    Figures out the maximum address range possible (starting from 0) based on address width. 
    Vivado segments address ranges every 10 bits, using K, M, G, etc. Eg. for 64-bit address width, returns '16E'. 

    Helpful guide:
    10 bit address = (2^10) 1K entries
    20 bit address = (2^20) 1M entries
    30 bit address = (2^30) 1G entries
    40 bit address = (2^40) 1T entries
    50 bit address = (2^50) 1P entries
    60 bit address = (2^60) 1E entries

    Address widths in these entries use remaining bits as multipliers (eg. 52-bit address = 1P * 2 bit remainder = 4P)
    Args:
        addr_width(int): address width
    """
    addr_unit = ''
    addr_multiplier = 0
    if addr_width >= 60:
        addr_unit = 'E'
        multiplier_exponent = addr_width - 60
    elif addr_width >= 50:
        addr_unit = 'P'
        multiplier_exponent = addr_width - 50
    elif addr_width >= 40:
        addr_unit = 'T'
        multiplier_exponent = addr_width - 40
    elif addr_width >= 30:
        addr_unit = 'G'
        multiplier_exponent = addr_width - 30
    elif addr_width >= 20:
        addr_unit = 'M'
        multiplier_exponent = addr_width - 20
    elif addr_width >= 10:
        addr_unit = 'K'
        multiplier_exponent = addr_width - 10
    else:
        # Edge case: below 1K just write the full number
        addr_unit = ''
        multiplier_exponent = addr_width
    addr_multiplier = str(2**multiplier_exponent)
    return addr_multiplier + addr_unit

def userApplicationRegionControlInst(tcl_user_app):
    """
    Builds the infrastructure needed to send control messages to and from user kernels

    Args:
        tcl_user_app: a tclMe object (which contains references to the FPGA's
                      node object and a handle to the output file)
    """
    # Parameters
    LAN_PORT_NUMBER = 32768
    KIP_PORT_NUMBER = 32769
    has_wstrb = True
    has_reliability = True
    rel_timeout = 500
    axil_addr_width = 64
    # Construct kernel dictionary indexed by kernel ID. 
    ctrl_kernel_dict = makeControlKernelDictionary(tcl_user_app, "num")
    num_ctrl_instances = len(ctrl_kernel_dict)
    # Only build components if there are control instances specified
    if num_ctrl_instances > 0:
        # In some cases, a list of keys sorted in ascending order will be useful
        kernel_ids_ascending_order = getSortedListofKeys(ctrl_kernel_dict)
        # 1. Build Control API hierarchies
        for kernel_id in ctrl_kernel_dict.keys():
            buildControlAPIInst(tcl_user_app, kernel_id, ctrl_kernel_dict[kernel_id], axil_addr_width, has_wstrb, has_reliability, rel_timeout)
        # 2. Build control infrastructure in Application Region
        tcl_user_app.instBlock(
            {
                'name': 'xlconstant',
                'inst':  'applicationRegion/LAN_port_number',
                'properties': [ 
                                'CONFIG.CONST_WIDTH {16}',
                                'CONFIG.CONST_VAL {' + str(LAN_PORT_NUMBER) + '}'
                            ]
            }
        )
        tcl_user_app.instBlock(
            {
                'name': 'xlconstant',
                'inst':  'applicationRegion/KIP_port_number',
                'properties': [ 
                                'CONFIG.CONST_WIDTH {16}',
                                'CONFIG.CONST_VAL {' + str(KIP_PORT_NUMBER) + '}'
                            ]
            }
        )
        # If there are multiple control instances, build switches for outbound control packets
        if num_ctrl_instances > 1:
            for path in ["LAN", "WAN", "KIP"]:
                buildControlToNBSwitch(tcl_user_app, path, num_ctrl_instances)
        # Build infrastructure for local LAN path
        tcl_user_app.instBlock(
            {
                'name': 'LAN_local_formatter',
                'inst':  'applicationRegion/LAN_local_formatter_0',
                'clks': ['i_clk'],
                'resetns': ['i_ap_rst_n'],
                'resetns_port': 'rst'
            }
        )
        # Build infrastructure for local KIP path
        tcl_user_app.instBlock(
            {
                'name': 'KIP_router',
                'inst':  'applicationRegion/KIP_router_0',
                'clks': ['i_clk'],
                'resetns': ['i_ap_rst_n'],
                'resetns_port': 'rst'
            }
        )
        tcl_user_app.instBlock(
            {
                'name': 'KIP_local_formatter',
                'inst':  'applicationRegion/KIP_local_formatter_0',
                'clks': ['i_clk'],
                'resetns': ['i_ap_rst_n'],
                'resetns_port': 'rst'
            }
        )
        # Build infrastructure for inbound packets
        # This switch is needed even if there is only 1 control kernel, because local and remote inbound packets converge here
        tcl_user_app.instBlock(
            {
                'name':'axis_switch',
                'inst': 'applicationRegion/ctrl_from_nb_switch',
                'clks':['aclk'],
                'resetns_port': 'rst',
                'resetns':['aresetn']
            }
        )
        # Configure the switch to have 1 Manager per kernel, 3 subordinates, and arbitrate on TLAST only.
        properties = [
            'CONFIG.NUM_SI {3}',
            'CONFIG.NUM_MI {' + str(num_ctrl_instances) + '}',
            'CONFIG.HAS_TLAST.VALUE_SRC USER'
        ]
        tcl_user_app.setProperties('applicationRegion/ctrl_from_nb_switch',properties)
        properties = [
            'CONFIG.HAS_TLAST {1}'
        ]
        tcl_user_app.setProperties('applicationRegion/ctrl_from_nb_switch', properties)
        properties = [
            'CONFIG.ARB_ON_MAX_XFERS {0}',
            'CONFIG.ARB_ON_TLAST {1}',
            'CONFIG.ARB_ALGORITHM {1}'
        ]
        tcl_user_app.setProperties('applicationRegion/ctrl_from_nb_switch', properties)
        # Configure Switch Routing: Lowest index kernel connects to port 0, second lowest to port 1, etc.
        setSwitchManagerPortRouting(tcl_user_app, 
                                    'applicationRegion/ctrl_from_nb_switch', 
                                    kernel_ids_ascending_order
                                    )        
        # 3. Create AXI-Lite block diagram ports (to be connected to kernels) and connect them to Control API instances
        # These ports are not created in Application Region, but are in the PR block diagram
        ctrl_axi_lite_ports = [] # Used to assign each port to 200MHz clock
        for kernel_id in ctrl_kernel_dict.keys():
            kernel_dict = ctrl_kernel_dict[kernel_id]
            ctrl_kernel_type = kernel_dict['control_type']
            presuffix_port_name = kernel_dict['inst']
            kernel_axil_net_converter_name = 'applicationRegion/control_api_inst_%d/anc' % (kernel_id)
            if ctrl_kernel_type == 'm_axil' or ctrl_kernel_type == 'both':
                # Everything is relative to user. Control Kernel's M_AXIL will connect to PR's M_AXIL port, which connects to S_AXIL port of network converter
                axil_port_name = presuffix_port_name + '_M_AXIL'
                tcl_user_app.add_axi4_port(axil_port_name, 'Slave')
                setControlAXILPortProperties(tcl_user_app, axil_port_name, axil_addr_width)
                tcl_user_app.makeConnection(
                    'intf', 
                    {
                        'type': 'intf_port',
                        'port_name': axil_port_name
                    },
                    {
                        'type': 'intf',
                        'name': kernel_axil_net_converter_name,
                        'port_name': 'S_AXIL'
                    }
                )
                ctrl_axi_lite_ports.append(axil_port_name)
            if ctrl_kernel_type == 's_axil' or ctrl_kernel_type == 'both':
                # Everything is relative to user. Control Kernel's S_AXIL will connect to PR's S_AXIL port, which connects to M_AXIL port of network converter
                axil_port_name = presuffix_port_name + '_S_AXIL'
                tcl_user_app.add_axi4_port(axil_port_name, 'Master')
                setControlAXILPortProperties(tcl_user_app, axil_port_name, axil_addr_width)
                tcl_user_app.makeConnection(
                    'intf', 
                    {
                        'type': 'intf',
                        'name': kernel_axil_net_converter_name,
                        'port_name': 'M_AXIL'
                    },
                    {
                        'type': 'intf_port',
                        'port_name': axil_port_name
                    }
                )
                ctrl_axi_lite_ports.append(axil_port_name)
        # Assign all AXI-Lite ports to 200 MHz clock
        tcl_user_app.setInterfacesCLK("CLK", ctrl_axi_lite_ports)
        # # Configure ARM processor link
        # properties = ['CONFIG.PROTOCOL AXI4']
        # tcl_user_app.setPortProperties('S_AXI_CONTROL', properties)
        # properties = ['CONFIG.ADDR_WIDTH {40}',
        #             'CONFIG.DATA_WIDTH {128}',
        #             'CONFIG.ARUSER_WIDTH {16}',
        #             'CONFIG.AWUSER_WIDTH {16}',
        #             'CONFIG.ID_WIDTH {16}'
        #             ]
        # tcl_user_app.setPortProperties('S_AXI_CONTROL', properties)
        # 4. Connect Control API Instances to inbound/outbound paths
        # Connect all control instances to IP Address and Ports
        # Only need to connect to ANC module because ANC and RPM IP addresses are already wired together in buildControlAPIInst
        for kernel_id in ctrl_kernel_dict.keys():
            sink_kernel = 'applicationRegion/control_api_inst_%d/anc' % (kernel_id)
            tcl_user_app.makeConnection(
                'net', 
                {
                    'type': 'pin',
                    'name': 'network/ip_constant_block_inst',
                    'port_name': 'ip'
                },
                {
                    'type': 'pin',
                    'name': sink_kernel,
                    'port_name': 'i_kernel_ip_address'
                }
            )
            tcl_user_app.makeConnection(
                'net', 
                {
                    'type': 'pin',
                    'name': 'applicationRegion/KIP_port_number',
                    'port_name': 'dout'
                },
                {
                    'type': 'pin',
                    'name': sink_kernel,
                    'port_name': 'i_control_port_number'
                }
            )
        # Path Case 1: Multiple Control API Instances on the same device
        if num_ctrl_instances > 1:
            # Inbound/Outbound pathway: Lowest index kernel connects to port 0, second lowest to port 1, etc.
            for i in range(0, num_ctrl_instances):
                kernel_id = kernel_ids_ascending_order[i]
                hierarchy_name = 'applicationRegion/control_api_inst_%d' % (kernel_id)
                if has_reliability:
                    kern_name = hierarchy_name + '/rpm'
                    inbound_port = 'from_nb'
                    outbound_port_prefix = 'to_nb_'
                else:
                    kern_name = hierarchy_name + '/anc'
                    inbound_port = 'from_network_bridge'
                    outbound_port_prefix = 'to_'
                if i < 10:
                    inbound_switch_port = 'M0' + str(i) + '_AXIS'
                    outbound_switch_port = 'S0' + str(i) + '_AXIS'
                else:
                    inbound_switch_port = 'M' + str(i) + '_AXIS'
                    outbound_switch_port = 'S' + str(i) + '_AXIS'
                # Inbound pathway
                tcl_user_app.makeConnection(
                        'intf', 
                        {
                            'type': 'intf',
                            'name': 'applicationRegion/ctrl_from_nb_switch',
                            'port_name': inbound_switch_port
                        },
                        {
                            'type': 'intf',
                            'name': kern_name,
                            'port_name': inbound_port
                        }
                    )
                # Connect all 3 output interface ports to switches
                for path in ["LAN", "WAN", "KIP"]:
                    tcl_user_app.makeConnection(
                        'intf', 
                        {
                            'type': 'intf',
                            'name': kern_name,
                            'port_name': outbound_port_prefix + path
                        },
                        {
                            'type': 'intf',
                            'name': 'applicationRegion/ctrl_to_nb_' + path + '_switch',
                            'port_name': outbound_switch_port
                        }
                    )
            # Connect output switches to outbound pathways
            tcl_user_app.makeConnection(
                'intf', 
                {
                    'type': 'intf',
                    'name': 'applicationRegion/ctrl_to_nb_LAN_switch',
                    'port_name': 'M00_AXIS'
                },
                {
                    'type': 'intf',
                    'name': 'applicationRegion/output_switch',
                    'port_name': 'S00_AXIS'
                }
            )
            # TODO: Connect NB WAN switch
            tcl_user_app.makeConnection(
                'intf', 
                {
                    'type': 'intf',
                    'name': 'applicationRegion/ctrl_to_nb_KIP_switch',
                    'port_name': 'M00_AXIS'
                },
                {
                    'type': 'intf',
                    'name': 'applicationRegion/KIP_router_0',
                    'port_name': 'from_kernels'
                }
            )
        # Path Case 2: Only 1 Control API Instance on this board, connect directly to outputs beyond the switch
        else:
            kernel_id = kernel_ids_ascending_order[0]
            hierarchy_name = 'applicationRegion/control_api_inst_%d' % (kernel_id)
            if has_reliability:
                kern_name = hierarchy_name + '/rpm'
                inbound_port = 'from_nb'
                outbound_port_prefix = 'to_nb_'
            else:
                kern_name = hierarchy_name + '/anc'
                inbound_port = 'from_network_bridge'
                outbound_port_prefix = 'to_'
            # Single kernel inbound pathway
            tcl_user_app.makeConnection(
                'intf', 
                {
                    'type': 'intf',
                    'name': 'applicationRegion/ctrl_from_nb_switch',
                    'port_name': 'M00_AXIS'
                },
                {
                    'type': 'intf',
                    'name': kern_name,
                    'port_name': inbound_port
                }
            )
            # Single kernel outbound pathway
            tcl_user_app.makeConnection(
                'intf', 
                {
                    'type': 'intf',
                    'name': kern_name,
                    'port_name': outbound_port_prefix + 'LAN'
                },
                {
                    'type': 'intf',
                    'name': 'applicationRegion/output_switch',
                    'port_name': 'S00_AXIS'
                }
            )
            # TODO: Connect NB WAN switch
            tcl_user_app.makeConnection(
                'intf', 
                {
                    'type': 'intf',
                    'name': kern_name,
                    'port_name': outbound_port_prefix + 'KIP'
                },
                {
                    'type': 'intf',
                    'name': 'applicationRegion/KIP_router_0',
                    'port_name': 'from_kernels'
                }
            )
        # 5. Connect KIP path to Galapagos infrastructure
        tcl_user_app.makeConnection(
            'net', 
            {
                'type': 'pin',
                'name': 'network/ip_constant_block_inst',
                'port_name': 'ip'
            },
            {
                'type': 'pin',
                'name': 'applicationRegion/KIP_router_0',
                'port_name': 'i_local_ip_address'
            }
        )
        tcl_user_app.makeConnection(
            'intf', 
            {
                'type': 'intf',
                'name': 'applicationRegion/KIP_router_0',
                'port_name': 'to_rx_nb'
            },
            {
                'type': 'intf',
                'name': 'applicationRegion/KIP_local_formatter_0',
                'port_name': 'from_router'
            }
        )
        # KIP Local Connection (KIP Remote Connection connected in bridgeConnections)
        tcl_user_app.makeConnection(
            'intf', 
            {
                'type': 'intf',
                'name': 'applicationRegion/KIP_local_formatter_0',
                'port_name': 'to_kernels'
            },
            {
                'type': 'intf',
                'name': 'applicationRegion/ctrl_from_nb_switch',
                'port_name': 'S00_AXIS'
            }
        )
        # 6. Connect local LAN path to Galapagos infrastructure
        tcl_user_app.makeConnection(
            'net', 
            {
                'type': 'pin',
                'name': 'network/ip_constant_block_inst',
                'port_name': 'ip'
            },
            {
                'type': 'pin',
                'name': 'applicationRegion/LAN_local_formatter_0',
                'port_name': 'i_local_ip_address'
            }
        )
        tcl_user_app.makeConnection(
            'net', 
            {
                'type': 'pin',
                'name': 'applicationRegion/LAN_port_number',
                'port_name': 'dout'
            },
            {
                'type': 'pin',
                'name': 'applicationRegion/LAN_local_formatter_0',
                'port_name': 'i_LAN_port_number'
            }
        )
        tcl_user_app.makeConnection(
            'intf', 
            {
                'type': 'intf',
                'name': 'applicationRegion/custom_switch_inst',
                'port_name': 'ctrl_out_switch'
            },
            {
                'type': 'intf',
                'name': 'applicationRegion/LAN_local_formatter_0',
                'port_name': 'from_router'
            }
        )
        tcl_user_app.makeConnection(
            'intf', 
            {
                'type': 'intf',
                'name': 'applicationRegion/LAN_local_formatter_0',
                'port_name': 'to_switch'
            },
            {
                'type': 'intf',
                'name': 'applicationRegion/ctrl_from_nb_switch',
                'port_name': 'S01_AXIS'
            }
        )
        # 7. Assign Control instances AXI-Lite addresses
        for kernel_id in ctrl_kernel_dict.keys():
            kernel_dict = ctrl_kernel_dict[kernel_id]
            # Addresses are assigned to AXI-Lite subordinates.
            # Case 1: User is using M_AXIL port (AXI-Lite to Network Converter is subordinate)
            if kernel_dict['control_type'] == 'm_axil' or kernel_dict['control_type'] == 'both':
                manager = kernel_dict['inst'] + "_M_AXIL" # User kernel's M_AXIL port
                ctrl_api_inst = 'applicationRegion/control_api_inst_%d/anc' % (kernel_id)
                inst_port = 'S_AXIL'
                base = 'reg0' # That's just what it says in Vivado
                tcl_user_app.assign_address(ctrl_api_inst, inst_port, base)
                # Set range and offset to be all possible bits
                # Range is based on AXIL_ADDRESS width
                ctrl_api_inst = "anc"
                prop = {'offset': "0x0000"}
                tcl_user_app.set_address_properties(ctrl_api_inst, inst_port, base, manager, **prop)
                address_range = getMaxAddressRangeByWidth(axil_addr_width)
                prop = {'range': address_range}
                tcl_user_app.set_address_properties(ctrl_api_inst, inst_port, base, manager, **prop)
            # Case 2: User is using S_AXIL port (User kernel is subordinate)
            if kernel_dict['control_type'] == 's_axil' or kernel_dict['control_type'] == 'both':
                manager = 'applicationRegion/control_api_inst_%d/anc/M_AXIL' % (kernel_id)
                # In this case, we supply the name of the PR AXI-Lite port that will be connected to the kernel
                subordinate_port = kernel_dict['inst'] + '_S_AXIL'
                base = 'Reg' # That's just what it says in Vivado
                tcl_user_app.assign_address(None, subordinate_port, base)
                prop = {'offset': "0x0000"}
                tcl_user_app.set_address_properties(None, subordinate_port, base, manager, **prop)
                address_range = getMaxAddressRangeByWidth(axil_addr_width)
                prop = {'range': address_range}
                tcl_user_app.set_address_properties(None, subordinate_port, base, manager, **prop)

def getInterfaces(fpga, intf, flag = None, scope = None):
    """
    Helper function to get a list of interfaces of a particular type from all
    the kernels in this particular node.

    Args:
        fpga: node object for this particular FPGA
        intf (string): the type of itnerface to look for. For example, "s_axi"
        flag: If specified, can ask the getInterfaces function to only match
              certain interfaces. Right now, the only thing you can do with it
              is set it to "scope" or leave it blank for no special behaviour
        scope: If flag is set to "scope", this variable is the scope to look for
               Can be "local" or "global", or left blank for no special behaviour

    Returns:
        An array of Python dicts, where each one is a subtree from the original
        mapping file. Note that this also adds a 'kernel_inst' member to the
        interface dict which contains a pointer to its parent kernel dict (this
        is used in userApplicationRegionKernelConnectSwitches, among others)
    """
    interfaces = []

    # For each <kernel>...
    for kern in fpga['kernel']:

        #if global we can look for master or slave
        # ^(Not sure what that comment means)
        #if intf=='s_axis' and flag=='scope' and scope =='global':
        #    print('kernel is ' + str(kern.data))

        # If this kernel has at least one <intf> tag, where intf is the string
        # passed into this function...
        if kern[intf] != None:
            for kern_intf in kern[intf]:

                # If we don't need a specific scope, match everything
                if (scope == None):
                    kern_intf['kernel_inst'] = kern
                    interfaces.append(copy.deepcopy(kern_intf))

                # Otherwise, only match the right scope
                elif(flag == 'scope' and kern_intf['scope'] == scope):
                    kern_intf['kernel_inst'] = kern
                    interfaces.append(copy.deepcopy(kern_intf))

                # (Not really sure what this is for, so I'm ignoring it)
                elif(flag == 'debug' and 'debug' in kern_intf):
                    kern_intf['kernel_inst'] = kern
                    interfaces.append(copy.deepcopy(kern_intf))


    #if intf=='s_axis' and flag=='scope' and scope =='global':
    #    print("interfaces returned are " + str(interfaces))

    return interfaces

def strCompare(s1, s2):
    s1 = s1.replace(" ", "")
    s1 = s1.replace("\t", "")
    s1 = s1.replace("\n", "")
    s2 = s2.replace(" ", "")
    s2 = s2.replace("\t", "")
    s2 = s2.replace("\n", "")
    return s1 == s2

def getSlaveInterfaces(fpga, intf, master):
    """
    Gets all the particular type (s_axi, s_axis, or wire_slave)  of slave interfaces for a given FPGA


    Args:
        fpga: The node object for this FPGA
        intf (string): The type of interface to look for
        master: The information associated with a particular master interface.
                This will be a Python dict built by parsing the XML/JSON file,
                but it is augmented with some extra stuff by the cluster __init__
                function. Specifically, it will be a pointer from the kernels[]
                member var in the cluster object (and even more specifically, the
                fpga parameter to this function is actually a pointer to a member
                of the nodes[] array of the cluster object, which itself contains
                pointers to members of the kernels[] array).
    """

    interfaces = []

    # First get all the interfaces that could connect to this master
    slave_array = getInterfaces(fpga, intf, 'scope', 'local')

    #print("local connections for :" + str(master['kernel_inst']['name']))
    for slave in slave_array:
        #print (str(slave))
        #print ("slave " + str(slave['master']['node']) + " port: " + slave['master']['port'])
        #print ("master " + str(master['kernel_inst']['num']) + " port: " + master['name'])
        #if  (int(slave['master']['node'])  == int(master['kernel_inst']['num'])):
        #    print(" adding to interfaces clause_1")
        #if (strCompare(slave['master']['port'], master['name'])):
        #    print(" adding to interfaces clause_2")
        if ( (int(slave['master']['node'])  == int(master['kernel_inst']['num'])) and strCompare(slave['master']['port'], master['name'])):
            interfaces.append(copy.deepcopy(slave))
            #TODO hack: to speed up assuming all local streams fanout to one node
            if(intf == 's_axis'):
                break

    return interfaces

def userApplicationRegionMemInstLocal(tcl_user_app):
    """
    For locally connected memory mapped slaves. This instantiates a local axi interconnecte
    between the master and the slaves, all within the given FPGA.


    Args:
        tcl_user_app: a tclMe object (which contains references to the FPGA's
                      node object and a handle to the output file)
    """
    m_axi_array = getInterfaces(tcl_user_app.fpga, 'm_axi', 'scope', 'local')
    for m_axi in m_axi_array:
        s_axi_array = getSlaveInterfaces(tcl_user_app.fpga, 's_axi', m_axi)

        inc_clks = ['aclk']
        inc_resetns = ['aresetn']
        for inc_index in range(0, len(s_axi_array)):
            inc_index_str = "%02d"%inc_index
            inc_clks.append('M' + inc_index_str + '_ACLK')
            inc_resetns.append('M' + inc_index_str + '_ARESETN')


        tcl_user_app.instBlock(
                {
                'name':'smartconnect',
                'resetns_port': 'rstn',
                'inst': m_axi['kernel_inst']['inst'] + '_' + m_axi['name'] + '_inc_inst',
                'clks': inc_clks,
                'resetns': inc_resetns,
                'properties':['CONFIG.NUM_SI {1}', 'CONFIG.NUM_MI {' + str(len(s_axi_array)) + '}']
                }
                )
        tcl_user_app.makeConnection(
                    'intf',
                    {
                    'name': m_axi['kernel_inst']['inst'],
                    'type':'intf',
                    'port_name': m_axi['name']
                    },
                    {'name': m_axi['kernel_inst']['inst'] + '_' + m_axi['name'] + '_inc_inst' ,
                    'type':'intf',
                    'port_name': 'S00_AXI'
                    }
                    )

        for s_axi_idx, s_axi in enumerate(s_axi_array):
            s_axi_idx_str = "%02d"%s_axi_idx
            tcl_user_app.makeConnection(
                        'intf',
                        {
                        'name': m_axi['kernel_inst']['inst'] + '_' + m_axi['name'] + '_inc_inst',
                        'type':'intf',
                        'port_name':'M' + s_axi_idx_str + '_AXI'
                        },
                        {'name':s_axi['kernel_inst']['inst'],
                        'type':'intf',
                        'port_name': s_axi['name']
                        }
                        )

def userApplicationRegionMemInstGlobal(tcl_user_app, shared):
    """
    Connects the kernels' AXI master port to the shell's off-chip memory
    controller. Also instantiates an AXI interconnect if there is more than
    one person trying to use the off-chip memory.

    Args:
        tcl_user_app: a tclMe object (which contains references to the FPGA's
                      node object and a handle to the output file)
        shared: I'm not sure what this does, exactly.
    """
    num_mem_interfaces = len(getInterfaces(tcl_user_app.fpga, 'm_axi', 'scope',  'global'))

    inc_clks = ['aclk']
    inc_resetns = ['aresetn']
    if (num_mem_interfaces > 0):
        if shared:
            properties = ['CONFIG.NUM_MI {2}']
        else:
            properties = ['CONFIG.NUM_MI {1}']


#MAKES SMARTCONNECT
#DOESN'T PLAY WELL WITH ENCRYPTED CORES, REPLACING WITH INTERCONNECT

        properties.append('CONFIG.NUM_SI {' + str(num_mem_interfaces) + '}')
        # adds an interface for the second memory interface to be added
        if shared:
            properties.append('CONFIG.NUM_MI {2}')
#
#        tcl_user_app.instBlock(
#                {
#                'name':'smartconnect',
#                'inst':'applicationRegion/axi_interconnect_mem',
#                'clks':['aclk'],
#                'resetns':['aresetn'],
#                'properties':properties
#                }
#                )

#AXI INTERCONNECT

        # print('axi interconnect mem properties ' + str(properties))

        # enable_AXI_mem_interconnect = True

        # if 'custom' in tcl_user_app.fpga:
        #     if tcl_user_app.fpga['custom'] == 'GAScore':
        #         enable_AXI_mem_interconnect = False

        # if enable_AXI_mem_interconnect:
        tcl_user_app.instBlock(
                {
                'name':'smartconnect',
                'inst':'applicationRegion/axi_interconnect_mem',
                'resetns_port': 'rstn',
                'clks':inc_clks,
                'resetns':inc_resetns,
                'properties':properties
                }
                )

        # tcl_user_app.makeConnection(
                    # 'intf',
                    # {
                    # 'name':'applicationRegion/axi_interconnect_mem',
                    # 'type':'intf',
                    # 'port_name':'M00_AXI'
                    # },
                    # {'name':None,
                    # 'type':'intf_port',
                    # 'port_name':'S_AXI_MEM_0'
                    # }
                    # )
        # if shared:
            # tcl_user_app.makeConnection(
                        # 'intf',
                        # {
                        # 'name':'applicationRegion/axi_interconnect_mem',
                        # 'type':'intf',
                        # 'port_name':'M01_AXI'
                        # },
                        # {'name':None,
                        # 'type':'intf_port',
                        # 'port_name':'S_AXI_MEM_1'
                        # }
                        # )


    #else:
        #no mem interface use VIP instead
        # tcl_user_app.instBlock(
                # {
                # 'name':'axi_vip',
                # 'inst':'applicationRegion/axi_vip_mem_0',
                # 'clks':['aclk'],
                # 'resetns':['aresetn'],
                # 'properties':['CONFIG.INTERFACE_MODE {MASTER}', 'CONFIG.DATA_WIDTH {512}']
                # }
                # )
        # tcl_user_app.makeConnection(
                    # 'intf',
                    # {
                    # 'name':'applicationRegion/axi_vip_mem_0',
                    # 'type':'intf',
                    # 'port_name':'M_AXI'
                    # },
                    # {'name':None,
                    # 'type':'intf_port',
                    # 'port_name':'S_AXI_MEM_0'
                    # }
                    # )
        # if shared:
            # tcl_user_app.instBlock(
                     # {
                      # 'name':'axi_vip',
                      # 'inst':'applicationRegion/axi_vip_mem_1',
                      # 'clks':['aclk'],
                      # 'resetns':['aresetn'],
                      # 'properties':['CONFIG.INTERFACE_MODE {MASTER}', 'CONFIG.DATA_WIDTH {512}']
                      # }
                      # )
            # tcl_user_app.makeConnection(
                          # 'intf',
                          # {
                          # 'name':'applicationRegion/axi_vip_mem_1',
                          # 'type':'intf',
                          # 'port_name':'M_AXI'
                          # },
                          # {
                          # 'name':None,
                          # 'type':'intf_port',
                          # 'port_name':'S_AXI_MEM_1'
                          # }
                          # )

def userApplicationRegionKernelsInst(tcl_user_app):
    """
    Loops through the list of kernels on one particular FPGA and generates the
    appropriate TCL commands to instantiate them in a block diagram.

    Args:
        tcl_user_app: a tclMe object (which contains references to the FPGA's
                      node object and a handle to the output file)
    """

    #instantiate kernels
    for kern_idx, kern in enumerate(tcl_user_app.fpga['kernel']):
        instName = kern['name'] + "_inst_" + str(kern['num'])
        #instantiate kernel
        tcl_user_app.fpga['kernel'][kern_idx]['inst'] = 'applicationRegion/' + instName
        '''
        if 'properties' in kern:
            print('properties ' + str(kern['properties']))
            tcl_user_app.instBlock(
                    {
                    'vendor':kern['vendor'],
                    'lib': kern['lib'],
                    'name': kern['name'],
                    'inst':'applicationRegion/' + instName,
                    'clks': kern['clk'],
                    'resetns_port': 'rstn',
                    'resetns': kern['aresetn'],
                    'properties': kern['properties']
                    }
                    )
        else:
            tcl_user_app.instBlock(
                    {
                    'vendor':kern['vendor'],
                    'lib': kern['lib'],
                    'name': kern['name'],
                    'inst':'applicationRegion/' + instName,
                    'clks': kern['clk'],
                    'resetns_port': 'rstn',
                    'resetns': kern['aresetn']
                    }
                    )
        '''
       # if 'properties' in tcl_user_app.fpga['kernel'][kern_idx]:
       #     for properties in tcl_user_app.fpga['kernel'][kern_idx]['properties']:
       #         tcl_user_app.setProperties('applicationRegion/' + instName, properties)

        #instantiate and connect constant for id
        '''
        if (kern['id_port'] != None):
            tcl_user_app.instBlock(
                    {
                    'name':'xlconstant',
                    'inst': 'applicationRegion/id_' + str(kern['num']),
                    'resetns_port': 'rstn',
                    'properties':['CONFIG.CONST_WIDTH {32}',
                        'CONFIG.CONST_VAL {'+ str(kern['num'])+'}']
                    }
                    )
            tcl_user_app.makeConnection(
                    'net',
                        {
                        'name':'applicationRegion/id_' + str(kern['num']),
                        'type':'pin',
                        'port_name':'dout'
                        },
                        {
                        'name':'applicationRegion/' + instName,
                        'type':'pin',
                        'port_name':kern['id_port']
                        }
                        )
        '''
        if kern['const'] != None:
            for const in kern['const']:
                #print(const)
                tcl_user_app.instBlock(
                        {
                        'name':'xlconstant',
                        'resetns_port': 'rstn',
                        'inst': 'applicationRegion/' + instName + '_' + const['name'],
                        'properties':['CONFIG.CONST_WIDTH {' + str(const['width']) + '}',
                            ' CONFIG.CONST_VAL {'+ str(const['val']) + '}']
                        }
                        )
                tcl_user_app.makeConnection(
                        'net',
                        {
                        'name':'applicationRegion/' + instName + '_' + const['name'] ,
                        'type':'pin',
                        'port_name':'dout'
                        },
                        {
                        'name':'applicationRegion/' + instName,
                        'type':'pin',
                        'port_name':const['name']
                        }
                        )

def userApplicationRegionSwitchesInst(tcl_user_app, sim,is_gw):
    """
    I think this is for making the Galapagos router (i.e. the one that sits in
    the application region and takes care of routing packets to the network
    switch or to another kernel in the same FPGA). This only instantiates IPs
    and does not make any connections (except to network table and IP/MAC consts)

    Args:
        tcl_user_app: a tclMe object (which contains references to the FPGA's
                      node object and a handle to the output file)
        sim: I still don't really know what this does, exactly
    """
    #Untested new addition for dns_ip

    # I think this is the BRAM which stores the routing table
    mem_to_use = 'blk_mem_gen'
    if tcl_user_app.fpga['board']== 'vck5000':
        mem_to_use = 'emb_mem_gen'
    if tcl_user_app.fpga['comm'] != 'none':
        # if 'custom' not in tcl_user_app.fpga or tcl_user_app.fpga['custom'] != 'GAScore':
        tcl_user_app.instBlock(
            {
                'name':mem_to_use,
                'resetns_port': 'rstn',
                'inst':'applicationRegion/blk_mem_switch_rom'
            }
        )


    # The next 250 lines of code are a big if-elif-else statement which generate
    # the correct Galapagos router depending on whether the communication type is
    # "tcp", "eth", or "raw"
    if tcl_user_app.fpga['comm'] == 'tcp' or tcl_user_app.fpga['comm'] == 'udp':
        tcl_user_app.instBlock(
            {'vendor':'xilinx.com',
            'lib':'hls',
            'name':'hls:router',
            'inst':'applicationRegion/custom_switch_inst',
            'clks':['ap_clk'],
            'resetns_port': 'rstn',
            'resetns':['ap_rst_n']
            }
            )

        # Properties for routing table BRAM
        properties = ['CONFIG.Memory_Type {Single_Port_ROM}',
                    'CONFIG.Enable_32bit_Address {true}',
                    'CONFIG.Use_Byte_Write_Enable {false}',
                    'CONFIG.Byte_Size {8}',
                    'CONFIG.Write_Depth_A {8192}',
                    'CONFIG.Register_PortA_Output_of_Memory_Primitives {false}',
                    'CONFIG.Use_RSTA_Pin {true}',
                    'CONFIG.Port_A_Write_Rate {0}',
                    'CONFIG.use_bram_block {Stand_Alone}',
                    'CONFIG.EN_SAFETY_CKT {true}'
                    ]
        if tcl_user_app.fpga['board']=='vck5000':
            #Nour, please correct this
            properties = ['CONFIG.ENABLE_32BIT_ADDRESS {true}',
                          'CONFIG.MEMORY_DEPTH {8192}',
                          'CONFIG.MEMORY_INIT_FILE $top_path/projects/$default_dir/ip.mem',
                          'CONFIG.MEMORY_OPTIMIZATION {no_mem_opt}',
                          'CONFIG.MEMORY_TYPE {Single_Port_ROM}',
                          'CONFIG.USE_MEMORY_BLOCK {Stand_Alone}',
                          'CONFIG.WRITE_DATA_WIDTH_A {8}',
                          'CONFIG.READ_LATENCY_A {1}'
                          ]

        tcl_user_app.setProperties('applicationRegion/blk_mem_switch_rom', properties)
        if tcl_user_app.fpga['board'] != 'vck5000':
            properties_bram_file = ['CONFIG.Load_Init_File {true}', 'CONFIG.Coe_File $top_path/projects/$default_dir/ip.coe']
            tcl_user_app.setProperties('applicationRegion/blk_mem_switch_rom', properties_bram_file)
        # I think this connects the board's local IP to the router (but I don't
        # know why this is needed)
        tcl_user_app.makeConnection(
            'net',
            {
            'name':'network/ip_constant_block_inst',
            'type':'pin',
            'port_name':'ip'
            },
            {
            'name':'applicationRegion/custom_switch_inst',
            'type':'pin',
            'port_name':'network_addr'
            }
            )

        # Connect routing table BRAM to Galapagos router
        tcl_user_app.makeConnection(
                    'intf',
                    {
                    'name':'applicationRegion/custom_switch_inst',
                    'type':'intf',
                    'port_name':'network_table_PORTA'
                    },
                    {
                    'name':'applicationRegion/blk_mem_switch_rom',
                    'type':'intf',
                    'port_name':'BRAM_PORTA'
                    }
                    )

    # Refer to comments in the case for TCP (above)
    elif tcl_user_app.fpga['comm'] == 'eth':
        # if 'custom' not in tcl_user_app.fpga or tcl_user_app.fpga['custom'] != 'GAScore':
        tcl_user_app.instBlock(
                {'vendor':'xilinx.com',
                'lib':'hls',
                'name':'width48router',
                'inst':'applicationRegion/custom_switch_inst',
                'clks':['ap_clk'],
                'resetns':['ap_rst_n'],
                'resetns_port': 'rstn'
                }
                )

        properties =['CONFIG.Memory_Type {Single_Port_ROM}',
                    'CONFIG.Enable_32bit_Address {true}',
                    'CONFIG.Use_Byte_Write_Enable {false}',
                    'CONFIG.Byte_Size {8}',
                    'CONFIG.Write_Width_A {64}',
                    'CONFIG.Write_Depth_A {8192}',
                    'CONFIG.Read_Width_A {64}',
                    'CONFIG.Write_Width_B {64}',
                    'CONFIG.Read_Width_B {64}',
                    'CONFIG.Register_PortA_Output_of_Memory_Primitives {false}',
                    'CONFIG.Use_RSTA_Pin {true}',
                    'CONFIG.Port_A_Write_Rate {0}',
                    'CONFIG.use_bram_block {Stand_Alone}',
                    'CONFIG.EN_SAFETY_CKT {true}',
                    'CONFIG.Load_init_file {true}',
                    'CONFIG.Coe_File $top_path/projects/$default_dir/mac.coe'
                    ]

        tcl_user_app.setProperties('applicationRegion/blk_mem_switch_rom', properties)

        tcl_user_app.makeConnection(
                    'net',
                    {
                    'name':'network/ip_constant_block_inst',
                    'type':'pin',
                    'port_name':'mac_big'
                    },
                    {
                    'name':'applicationRegion/custom_switch_inst',
                    'type':'pin',
                    'port_name':'network_addr'
                    }
                    )

        tcl_user_app.makeConnection(
                'intf',
                {
                'name':'applicationRegion/custom_switch_inst',
                'type':'intf',
                'port_name':'network_table_PORTA'
                },
                {
                'name':'applicationRegion/blk_mem_switch_rom',
                'type':'intf',
                'port_name':'BRAM_PORTA'
                }
                )

    elif tcl_user_app.fpga['comm'] == 'raw':

        # configures one memory to hold the IP addresses
        properties = ['CONFIG.Memory_Type {Single_Port_ROM}',
                    'CONFIG.Enable_32bit_Address {true}',
                    'CONFIG.Use_Byte_Write_Enable {false}',
                    'CONFIG.Byte_Size {8}',
                    'CONFIG.Write_Depth_A {8192}',
                    'CONFIG.Register_PortA_Output_of_Memory_Primitives {false}',
                    'CONFIG.Use_RSTA_Pin {true}',
                    'CONFIG.Port_A_Write_Rate {0}',
                    'CONFIG.use_bram_block {Stand_Alone}',
                    'CONFIG.EN_SAFETY_CKT {true}',
                    'CONFIG.Load_Init_File {true}',
                    'CONFIG.Coe_File $top_path/projects/$default_dir/ip.coe'
                    ]

        tcl_user_app.setProperties('applicationRegion/blk_mem_switch_rom', properties)

        tcl_user_app.instBlock(
            {
            'name':'axi_bram_ctrl',
            'inst':'applicationRegion/ctrl_blk_mem_switch_rom',
            'clks':['s_axi_aclk'],
            'resetns_port': 'rstn',
            'resetns':['s_axi_aresetn']
            }
        )
        tcl_user_app.setProperties('applicationRegion/ctrl_blk_mem_switch_rom', ["CONFIG.SINGLE_PORT_BRAM {1}"])

        # configures another memory to hold the MAC addresses

        tcl_user_app.instBlock(
            {
            'name':mem_to_use,
            'inst':'applicationRegion/blk_mem_switch_rom_mac',
            'resetns_port': 'rstn',
            }
        )

        tcl_user_app.instBlock(
            {
            'name':'axi_bram_ctrl',
            'inst':'applicationRegion/ctrl_blk_mem_switch_rom_mac',
            'clks':['s_axi_aclk'],
            'resetns':['s_axi_aresetn'],
            'resetns_port': 'rstn'
            }
        )
        tcl_user_app.setProperties('applicationRegion/ctrl_blk_mem_switch_rom_mac',
                                   ["CONFIG.SINGLE_PORT_BRAM {1}", "CONFIG.DATA_WIDTH {64}"])
        if tcl_user_app.fpga['board'] == 'vck5000':
            properties = ['CONFIG.MEMORY_DEPTH {256}',
                          'CONFIG.MEMORY_INIT_FILE $top_path/projects/$default_dir/mac.mem',
                          'CONFIG.MEMORY_OPTIMIZATION {no_mem_opt}',
                          'CONFIG.MEMORY_TYPE {Single_Port_ROM}',
                          'CONFIG.READ_LATENCY_A {1}',
                          'CONFIG.USE_MEMORY_BLOCK {Stand_Alone}'
                          'CONFIG.WRITE_DATA_WIDTH_A {64}',
                          'CONFIG.WRITE_PROTECT {false}'
                          ]
        else:
            properties =['CONFIG.Memory_Type {Single_Port_ROM}',
                        'CONFIG.Enable_32bit_Address {true}',
                        'CONFIG.Use_Byte_Write_Enable {false}',
                        'CONFIG.Byte_Size {8}',
                        'CONFIG.Write_Width_A {64}',
                        'CONFIG.Write_Depth_A {256}',
                        'CONFIG.Read_Width_A {64}',
                        'CONFIG.Write_Width_B {64}',
                        'CONFIG.Read_Width_B {64}',
                        'CONFIG.Register_PortA_Output_of_Memory_Primitives {false}',
                        'CONFIG.Use_RSTA_Pin {true}',
                        'CONFIG.Port_A_Write_Rate {0}',
                        'CONFIG.use_bram_block {BRAM_Controller}',
                        'CONFIG.EN_SAFETY_CKT {true}',
                        'CONFIG.Load_init_file {true}',
                        'CONFIG.Coe_File $top_path/projects/$default_dir/mac.coe'
                        ]

        tcl_user_app.setProperties('applicationRegion/blk_mem_switch_rom_mac', properties)

        # connect these two memories to the global interconnect
        app_interfaces = len(getInterfaces(tcl_user_app.fpga, 's_axi', 'scope', 'global'))
        idx_str = "%02d"%(app_interfaces)
        tcl_user_app.makeConnection(
                'intf',
                {'name':'applicationRegion/axi_interconnect_ctrl',
                'type':'intf',
                'port_name':'M' + idx_str + '_AXI'
                },
                {
                'name':'applicationRegion/ctrl_blk_mem_switch_rom',
                'type':'intf',
                'port_name':'S_AXI'
                }
                )
        idx_str = "%02d"%(app_interfaces + 1)
        tcl_user_app.makeConnection(
                'intf',
                {'name':'applicationRegion/axi_interconnect_ctrl',
                'type':'intf',
                'port_name':'M' + idx_str + '_AXI'
                },
                {
                'name':'applicationRegion/ctrl_blk_mem_switch_rom_mac',
                'type':'intf',
                'port_name':'S_AXI'
                }
                )

        # connect the BRAMs to their controllers
        tcl_user_app.makeConnection(
                'intf',
                {
                'name':'applicationRegion/ctrl_blk_mem_switch_rom',
                'type':'intf',
                'port_name':'BRAM_PORTA'
                },
                {
                'name':'applicationRegion/blk_mem_switch_rom',
                'type':'intf',
                'port_name':'BRAM_PORTA'
                }
                )
        tcl_user_app.makeConnection(
                'intf',
                {
                'name':'applicationRegion/ctrl_blk_mem_switch_rom_mac',
                'type':'intf',
                'port_name':'BRAM_PORTA'
                },
                {
                'name':'applicationRegion/blk_mem_switch_rom_mac',
                'type':'intf',
                'port_name':'BRAM_PORTA'
                }
                )

    elif tcl_user_app.fpga['comm'] == 'none':
        pass

    else:
        print("Unknown communication type: " + tcl_user_app.fpga['comm'])
        exit(1)

    # Ask how many (global) s_axis connections are in the user app region.
    num_slave_s_axis_global = len(getInterfaces(tcl_user_app.fpga, 's_axis', 'scope' , 'global'))


    if num_slave_s_axis_global == 0:
        ##TO DO: CHANGE TO VIP FOR 0 SLAVES
        print("TO DO: CHANGE TO VIP FOR 0 SLAVES in userApplicationRegionSwitchesInst " + str(tcl_user_app.fpga['num']))
        quit(0)
        quit(0)

    else:
#for simulation purposes use custom arbiter instead of axis_switch
        if(sim == 0):
            # we don't want an input switch IFF 1 slave and mode is raw
            # if it is raw, we need just a single slave interface
            if num_slave_s_axis_global > 1 and tcl_user_app.fpga['comm'] in ['raw', 'none']:
                if not is_gw:
                    tcl_user_app.instBlock(
                                {
                                'name':'axis_switch',
                                'inst':'applicationRegion/input_switch',
                                'clks':['aclk'],
                                'resetns':['aresetn'],
                                'resetns_port': 'rstn',
                                'properties':['CONFIG.NUM_SI {1}',
                                    'CONFIG.NUM_MI {' + str(num_slave_s_axis_global) + '}',
                                    'CONFIG.ARG_ON_TLAST {1}',
                                    'CONFIG.HAS_TLAST {1}'

                                    ]
                                }
                            )
            elif tcl_user_app.fpga['comm'] not in ['raw', 'none']:
                # if 'custom' not in tcl_user_app.fpga or tcl_user_app.fpga['custom'] != 'GAScore':
                if not is_gw:
                    tcl_user_app.instBlock(
                            {
                            'name':'axis_switch',
                            'inst':'applicationRegion/input_switch',
                            'clks':['aclk'],
                            'resetns':['aresetn'],
                            'resetns_port': 'rstn',
                            'properties':['CONFIG.NUM_SI {2}',
                                'CONFIG.NUM_MI {' + str(num_slave_s_axis_global) + '}',
                                'CONFIG.HAS_TLAST {1}',
                                'CONFIG.ARB_ON_TLAST {1}'
                                ]
                            }
                            )

                # else:
                #     if num_slave_s_axis_global > 1:
                #         tcl_user_app.instBlock(
                #                 {
                #                 'name':'axis_switch',
                #                 'inst':'applicationRegion/input_switch',
                #                 'clks':['aclk'],
                #                 'resetns':['aresetn'],
                #                 'properties':['CONFIG.NUM_SI {1}',
                #                     'CONFIG.NUM_MI {' + str(num_slave_s_axis_global) + '}',
                #                     'CONFIG.HAS_TLAST {1}',
                #                     'CONFIG.ARB_ON_TLAST {1}'
                #                     ]
                #                 }
                #             )



        else:
            tcl_user_app.instBlock(
                    {
                    'name':'arbiter',
                    'lib':'hls',
                    'vendor':'xilinx.com',
                    'inst':'applicationRegion/arbiter',
                    'resetns_port': 'rstn',
                    'clks':['ap_clk'],
                    'resetns':['ap_rst_n'],
                    }
                    )

        switch_port_index = 0
        properties = ['CONFIG.ARB_ON_MAX_XFERS {0}']
        for kern in tcl_user_app.fpga['kernel']:
            if kern['s_axis'] != None:
                for s_axis in kern['s_axis']:
                    if s_axis['scope'] == 'global':
                        #print("adding kernel to switch " + kern['inst'])
                        kernel_index_str = "0x{:08x}".format(int(kern['num']))
                        switch_port_index_str = "%02d"%switch_port_index
                        properties.append('CONFIG.M' + switch_port_index_str + '_AXIS_BASETDEST {' + kernel_index_str + '}')
                        properties.append('CONFIG.M' + switch_port_index_str + '_AXIS_HIGHTDEST {' + kernel_index_str + '}')
                        switch_port_index = switch_port_index + 1

        # this condition is prerequisite to have an input_switch
        if num_slave_s_axis_global > 1 or tcl_user_app.fpga['comm'] != 'raw':
            # if 'custom' not in tcl_user_app.fpga or tcl_user_app.fpga['custom'] != 'GAScore':
            if not is_gw:
                tcl_user_app.setProperties('applicationRegion/input_switch', properties)


    # Ask how many (global) m_axis connections are in the user app region.
    num_slave_m_axis_global = len(getInterfaces(tcl_user_app.fpga, 'm_axis', 'scope', 'global'))+1
    if not is_gw:
        tcl_user_app.instBlock(
            {
                'name':'axis_switch',
                'inst':'applicationRegion/output_switch',
                'clks':['aclk'],
                'resetns_port': 'rstn',
                'resetns':['aresetn']
            }
        )
        #Configure the switch to have 1 slave per kernel, 1 master, that it allows all messages through, and arbitrate on TLAST only.
        properties = [
            'CONFIG.NUM_SI {' + str(num_slave_m_axis_global) + '}',
            'CONFIG.NUM_MI {1}',
            'CONFIG.HAS_TLAST.VALUE_SRC USER',
            'CONFIG.M00_AXIS_HIGHTDEST {0xffffffff}'
        ]
        tcl_user_app.setProperties('applicationRegion/output_switch',properties)
        properties = [
            'CONFIG.HAS_TLAST {1}'
        ]
        tcl_user_app.setProperties('applicationRegion/output_switch', properties)
        properties = [
            'CONFIG.ARB_ON_MAX_XFERS {0}',
            'CONFIG.ARB_ON_TLAST {1}'
        ]
        tcl_user_app.setProperties('applicationRegion/output_switch', properties)
        if tcl_user_app.fpga['has_wan']:
            tcl_user_app.instBlock(
                {
                    'name': 'axis_switch',
                    'inst': 'applicationRegion/WAN_switch',
                    'clks': ['aclk'],
                    'resetns_port': 'rstn',
                    'resetns': ['aresetn']
                }
            )
            properties = [
                'CONFIG.NUM_SI {' + str(num_slave_m_axis_global) + '}',
                'CONFIG.NUM_MI {1}',
                'CONFIG.HAS_TLAST.VALUE_SRC USER',
                'CONFIG.M00_AXIS_HIGHTDEST {0xffffffff}'
            ]
            tcl_user_app.setProperties('applicationRegion/WAN_switch', properties)
            properties = [
                'CONFIG.HAS_TLAST {1}'
            ]
            tcl_user_app.setProperties('applicationRegion/WAN_switch', properties)
            properties = [
                'CONFIG.ARB_ON_MAX_XFERS {0}',
                'CONFIG.ARB_ON_TLAST {1}'
            ]
            tcl_user_app.setProperties('applicationRegion/WAN_switch', properties)

### changes for ddr - Charles
def userApplicationRegionDDR(tcl_user_app, outDir, output_path):
    s_axis_array = getInterfaces(tcl_user_app.fpga, 's_axis', 'scope', 'global')
    num_kern_with_ddr = 0
    max_ddr_id_width = 1
    for i in s_axis_array:
        if i['kernel_inst']['ddr']:
            num_kern_with_ddr += 1
            if max_ddr_id_width < int(i['kernel_inst']['ddr_id_width']):
                max_ddr_id_width = int(i['kernel_inst']['ddr_id_width'])

    if num_kern_with_ddr == 1:
        ddr4_AXI_PROPERTIES = [
            "CONFIG.DATA_WIDTH {512}",
            "CONFIG.ADDR_WIDTH {34}",
            "CONFIG.ID_WIDTH {" + str(max_ddr_id_width) + "}",
            "CONFIG.FREQ_HZ {199998001}"
        ]
        kernel_AXI_PROPERTIES = [
            "CONFIG.DATA_WIDTH {512}",
            "CONFIG.ADDR_WIDTH {34}",
            "CONFIG.ID_WIDTH {" + str(max_ddr_id_width) + "}",
            "CONFIG.FREQ_HZ {199998001}"
        ]

        if s_axis_array[0]['kernel_inst']['ddr']:
            instName = s_axis_array[0]['kernel_inst']['inst']
            ht_name = instName.split('/')[-1]
            portName = ht_name + "_DDR_SAXI"
            tcl_user_app.add_axi4_port(portName, 'Slave')
            tcl_user_app.add_axi4_port('ddr4_AXI', 'Master')
            tcl_user_app.setPortProperties(portName, kernel_AXI_PROPERTIES)
            tcl_user_app.setPortProperties('ddr4_AXI', ddr4_AXI_PROPERTIES)

            tcl_user_app.instBlock(
                {
                    'name': 'axi_interconnect',
                    'inst': 'ddr_inter',
                    'clks': ['ACLK', 'S00_ACLK', 'M00_ACLK', 'M01_ACLK'],
                    'resetns': ['ARESETN', 'S00_ARESETN', 'M00_ARESETN', 'M01_ARESETN'],
                    'resetns_port': 'rstn'
                }
            )

            tcl_user_app.makeConnection(
                'intf',
                {
                    'type': 'intf_port',
                    'port_name': portName
                },
                {
                    'name': 'ddr_inter',
                    'type': 'intf',
                    'port_name': 'S00_AXI'
                }
            )

            tcl_user_app.makeConnection(
                'intf',
                {
                    'type': 'intf_port',
                    'port_name': 'ddr4_AXI'
                },
                {
                    'name': 'ddr_inter',
                    'type': 'intf',
                    'port_name': 'M00_AXI'
                }
            )

            tcl_user_app.assign_address(
                None,
                'ddr4_AXI',
                'Reg'
            )

            prop = {'offset': "0x00000000"}
            tcl_user_app.set_address_properties(None, 'ddr4_AXI', 'Reg', portName, **prop)
            prop = {'range': '16G'}
            tcl_user_app.set_address_properties(None, 'ddr4_AXI', 'Reg', portName, **prop)
            print("TCL FILE GENERATOR DDR FOUND")
        else:
            print("TCL FILE GENERATOR DDR NOT FOUND")
        if s_axis_array[0]['kernel_inst']['ddr_size']:
            print("TCL FILE GENERATOR DDR_SIZE FOUND")
        else:
            print("TCL FILE GENERATOR DDR_SIZE NOT FOUND")

    elif num_kern_with_ddr > 1:
        for i in s_axis_array:
            if i['kernel_inst']['ddr']:
                if max_ddr_id_width < int(i['kernel_inst']['ddr_id_width']):
                    max_ddr_id_width = int(i['kernel_inst']['ddr_id_width'])

        print("IN APP: DDR_ID_WIDTH: ", max_ddr_id_width)
        ddr4_AXI_id_width = max_ddr_id_width + math.ceil(math.log2(num_kern_with_ddr))
        print("IN APP ID Width: ", ddr4_AXI_id_width)
        ddr4_AXI_PROPERTIES = [
            "CONFIG.DATA_WIDTH {512}",
            "CONFIG.ADDR_WIDTH {34}",
            "CONFIG.ID_WIDTH {" + str(ddr4_AXI_id_width) + "}",
            "CONFIG.FREQ_HZ {199998001}"
        ]
        tcl_user_app.add_axi4_port('ddr4_AXI', 'Master')
        tcl_user_app.setPortProperties('ddr4_AXI', ddr4_AXI_PROPERTIES)

        tcl_user_app.createHierarchy("ddrRegion")

        partitioner = MemoryPartitioner()
        kern_array = []
        for i in s_axis_array:
            instName = i['kernel_inst']['inst']
            print(instName)
            ht_name = instName.split('/')[-1]
            portName = ht_name + "_DDR_SAXI"
            tcl_user_app.add_axi4_port(portName, 'Slave')

            kernel_AXI_PROPERTIES = [
                "CONFIG.DATA_WIDTH {512}",
                "CONFIG.ADDR_WIDTH {34}",
                "CONFIG.ID_WIDTH {" + i['kernel_inst']['ddr_id_width'] + "}",
                "CONFIG.FREQ_HZ {199998001}"
            ]

            tcl_user_app.setPortProperties(portName, kernel_AXI_PROPERTIES)

            if i['kernel_inst']['ddr_size']:
                kern_array.append(i['kernel_inst'])
                print("Kernel num: " + str(i['kernel_inst']['num']))
                print("DDR_size FOUND in MULTI-KERN")

        sorted_kern_array = sorted(kern_array, key=lambda k: ddr_size_to_bytes(k['ddr_size']), reverse = True)
        for j in sorted_kern_array:
            start, end = partitioner.allocate_partition(j['ddr_size'])
            size_in_bytes = ddr_size_to_bytes(j['ddr_size']) - 1
            vir_addr_len = size_in_bytes.bit_length()
            phy_addr_prefix = start >> vir_addr_len
            print(hex(phy_addr_prefix) + ", " + str(vir_addr_len))
            createMemoryPartitioner(outDir + "/MemoryPartitioner_kern" + str(j['num']) + ".v", output_path + "/../middleware/python",
                                    phy_addr_prefix, vir_addr_len, str(j['num']), str(j['ddr_id_width']))

            verilog_path = outDir + "/MemoryPartitioner_kern" + str(j['num']) + ".v"
            print(verilog_path)
            tcl_user_app.addVerilog(verilog_path)
            tcl_user_app.instModule(
                {
                    'name': 'addr_translator_kern' + str(j['num']),
                    'inst': 'ddrRegion/addr_translator_kern' + str(j['num'])
                }
            )
        DDR_INTERCONNECT_PROPERTIES = [
            "CONFIG.NUM_MI {1}",
            "CONFIG.NUM_SI {" + str(num_kern_with_ddr) + "}",
            "CONFIG.M00_HAS_REGSLICE {1}"
        ]

        DDR_INSTANCE_SETTING = {
            'name': 'axi_interconnect',
            'properties': DDR_INTERCONNECT_PROPERTIES,
            'inst': 'ddrRegion/ddr_inter',
            'clks': ['ACLK', 'M00_ACLK'],
            'resetns': ['ARESETN', 'M00_ARESETN'],
            'resetns_port': 'rstn'
        }
        for i in range(num_kern_with_ddr):
            DDR_INSTANCE_SETTING['clks'].append('S0' + str(i) + '_ACLK')
            DDR_INSTANCE_SETTING['resetns'].append('S0' + str(i) + '_ARESETN')

        tcl_user_app.instBlock(DDR_INSTANCE_SETTING)

        tcl_user_app.makeConnection(
            'intf',
            {
                'type': 'intf_port',
                'port_name': 'ddr4_AXI'
            },
            {
                'name': 'ddrRegion/ddr_inter',
                'type': 'intf',
                'port_name': 'M00_AXI'
            }
        )
        count = 0
        for i in s_axis_array:
            instName = i['kernel_inst']['inst']
            ht_name = instName.split('/')[-1]
            portName = ht_name + "_DDR_SAXI"
            tcl_user_app.makeConnection(
                'intf',
                {
                    'type': 'intf_port',
                    'port_name': portName
                },
                {
                    'name': 'ddrRegion/addr_translator_kern' + str(i['kernel_inst']['num']),
                    'type': 'intf',
                    'port_name': 's0_axi'
                }
            )

            tcl_user_app.makeConnection(
                'net',
                {
                    'type': 'port',
                    'port_name': 'CLK'
                },
                {
                    'name': 'ddrRegion/addr_translator_kern' + str(i['kernel_inst']['num']),
                    'type': 'pin',
                    'port_name': 'clk'
                }
            )

            tcl_user_app.makeConnection(
                'net',
                {
                    'type': 'port',
                    'port_name': 'rstn'
                },
                {
                    'name': 'ddrRegion/addr_translator_kern' + str(i['kernel_inst']['num']),
                    'type': 'pin',
                    'port_name': 'resetn'
                }
            )

    # Now connect the Galapagos router through the input switch into all of
    # the s_axis interfaces
    port_names_list=[]
    # clk_200_intf_config = ['S_AXI_CONTROL']
    clk_200_intf_config = []
    clk_300_intf_config = ['S_AXIS', 'M_AXIS']
    # Case 1: More than 1 kernel input stream on this node
    if len(s_axis_array) > 1:
        if(sim == 1):
            tcl_user_app.makeConnection(
                'intf',
                {
                    'type': 'intf_port',
                    'port_name': portName
                },
                {
                    'name': 'ddrRegion/addr_translator_kern' + str(i['kernel_inst']['num']),
                    'type': 'intf',
                    'port_name': 's0_axi'
                }
            )

            tcl_user_app.makeConnection(
                'intf',
                {
                    'name': 'ddrRegion/addr_translator_kern' + str(i['kernel_inst']['num']),
                    'type': 'intf',
                    'port_name': 'm0_axi'
                },
                {
                    'name': 'ddrRegion/ddr_inter',
                    'type': 'intf',
                    'port_name': 'S0' + str(count) + '_AXI'
                },
            )

            count += 1

        for i in s_axis_array:
            portName = "ddrRegion/addr_translator_kern" + str(i['kernel_inst']['num']) + "/m0_axi"

            tcl_user_app.assign_address(
                None,
                'ddr4_AXI',
                'Reg'
            )

            prop = {'offset': "0x00000000"}
            tcl_user_app.set_address_properties(None, 'ddr4_AXI', 'Reg', portName, **prop)
            prop = {'range': '16G'}
            tcl_user_app.set_address_properties(None, 'ddr4_AXI', 'Reg', portName, **prop)

            #ddrRegion / addr_translator_kern2 / s0_axi / reg0  #  test_core_inst_2_DDR_SAXI/SEG_addr_translator_kern2_reg0
            instName = i['kernel_inst']['inst']
            ht_name = instName.split('/')[-1]
            portName = ht_name + "_DDR_SAXI"

            tcl_user_app.assign_address(
                'ddrRegion/addr_translator_kern' + str(i['kernel_inst']['num']),
                's0_axi',
                'reg0'
            )

            prop = {'offset': "0x00000000"}
            tcl_user_app.set_address_properties(None, 'addr_translator_kern' + str(i['kernel_inst']['num']), 'reg0', portName, **prop)
            prop = {'range': i['kernel_inst']['ddr_size']}
            tcl_user_app.set_address_properties(None, 'addr_translator_kern' + str(i['kernel_inst']['num']), 'reg0', portName, **prop)
        # for idx, (start, end) in enumerate(partitioner.get_partitions()):
        #     print(f"Partition {idx+1}: Start Address = {hex(start)}, End Address = {hex(end)}")
        # createMemoryPartitioner(outDir + "/MemoryPartitioner.v", output_path + "/../middleware/python", phy_addr_prefix, vir_addr_len, partitioner.get_partitions(), tcl_user_app.fpga)

def ddr_size_to_bytes(ddr_size):
    match = re.match(r'(\d+)([KMG])', ddr_size)
    if not match:
        raise ValueError("INVALID ddr_size format")

    size, unit = match.groups()
    size = int(size)

    if unit == 'K':
        return size * 1024
    elif unit == 'M':
        return size * 1024 * 1024
    elif unit == 'G':
        return size * 1024 * 1024 * 1024
###



def userApplicationRegionKernelConnectSwitches(project_name,outDir,output_path, tcl_user_app, sim,is_gw,api_info,CAMILO_TEMP_DEBUG):
    """
    Now that the kernels, Galapagos router, and memory controllers are instantiated,
    it's time to connect them all together.

    Args:
        tcl_user_app: a tclMe object (which contains references to the FPGA's
                      node object and a handle to the output file)
        sim: I still don't really know what this does, exactly
    """

    #iterate through all kernels on FPGA connecting them to the input and output switches and their control and memory interfaces
    ctrl_interface_index = 0
    mem_interface_index = 0

    # Get list of all (global) s_axis. That is, all the kernel input streams
    # By the way, the getInterfaces function has the side effect of adding refs
    # to the interface's dict represntation which links to its parent kernel
    # dict (under the 'kernel_inst' key).
    s_axis_array = getInterfaces(tcl_user_app.fpga, 's_axis', 'scope', 'global')

    # Now connect the Galapagos router through the input switch into all of
    # the s_axis interfaces
    kernel_properties=[]
    control_port_names_list=[]
    control_properties_list=[]
    types_list=[]
    if tcl_user_app.fpga.has_control:
        clk_200_intf_config = ['S_AXI_CONTROL']
    else:
        clk_200_intf_config = []
    clk_300_intf_config = ['S_AXIS', 'M_AXIS']
    if len(s_axis_array) > 1:
        if(sim == 1):
            tcl_user_app.makeBufferedIntfConnection(
                    {
                    'name':'applicationRegion/arbiter',
                    'type':'intf',
                    'port_name':'M00_AXIS'
                    },
                    {'name':'applicationRegion/input_switch',
                    'type':'intf',
                    'port_name':'S00_AXIS'
                    },
                'applicationRegion/arbiter',
                1
                    )

        # For each s_axis connection
        for idx, s_axis in enumerate(s_axis_array):
            instName = s_axis['kernel_inst']['inst']
            presufix_port_name = instName.split('/')[-1]
            portName = presufix_port_name+"_MAXIS"
            idx_str = "%02d"%idx
            # Connect it to the correct port on the AXI switch (NOT directly into
            # the Galapagos router; there is an AXI stream switch IP between
            # the router and the kernel(s) )
            tcl_user_app.add_axis_port(portName, 'Master')
            if not is_gw:
                tcl_user_app.makeBufferedIntfConnection(
                    {
                        'name':'applicationRegion/input_switch',
                        'type':'intf',
                        'port_name':'M' + idx_str + '_AXIS'
                    },
                    {
                        'type':'intf_port',
                        'port_name':portName
                    },
                    portName,
                    int(s_axis['kernel_inst']['distance'])
                )
            clk_200_intf_config.append(presufix_port_name + "_MAXIS")
            clk_200_intf_config.append(presufix_port_name + "_SAXIS")
            #TODO: MERGE THis
            # START OF RECONFIGURABLE
            if s_axis['kernel_inst']['wan_enabled'][0]:
                clk_200_intf_config.append(presufix_port_name + "_SWAN")
            if s_axis['kernel_inst']['control']:
                clk_200_intf_config.append(presufix_port_name + "_CONTROL")
                control_port_names_list.append(str(presufix_port_name))
                control_properties_list.append([s_axis['kernel_inst']['control_size'],s_axis['kernel_inst']['control_address']])
            kernel_properties.append({'name':s_axis['kernel_inst']['name'],
                                      'type':s_axis['kernel_inst']['type'],
                                      'inst':str(presufix_port_name),
                                      'slave_name': s_axis['kernel_inst']['s_axis'][0]['name'],
                                      'master_name': s_axis['kernel_inst']['m_axis'][0]['name'],
                                      'clock_name': s_axis['kernel_inst']['clk'][0],
                                      'reset_name': s_axis['kernel_inst']['aresetn'][0],
                                      'wan_enabled': s_axis['kernel_inst']['wan_enabled'],
                                      'wan_name': s_axis['kernel_inst']['wan_name'],
                                      'id': s_axis['kernel_inst']['num'],
                                      'has_id': s_axis['kernel_inst']['has_id_port'],
                                      'id_port': s_axis['kernel_inst']['id_port']
                                      })
            if ('type' in s_axis['kernel_inst']):
                print('type of \"'+str(s_axis['kernel_inst']['name'])+'\" is defined as\n'+str(s_axis['kernel_inst']['type']))
            else:
                kernel_properties.append({'name': s_axis['kernel_inst']['name'], 'type':'open',
                                          'inst': str(presufix_port_name),
                                          'slave_name': s_axis['kernel_inst']['s_axis'][0]['name'],
                                          'master_name': s_axis['kernel_inst']['m_axis'][0]['name'],
                                          'clock_name': s_axis['kernel_inst']['clk'][0],
                                          'reset_name': s_axis['kernel_inst']['aresetn'][0],
                                          'wan_enabled': s_axis['kernel_inst']['wan_enabled'],
                                          'wan_name': s_axis['kernel_inst']['wan_name'],
                                          'id': s_axis['kernel_inst']['num'],
                                          'has_id': s_axis['kernel_inst']['has_id_port'],
                                          'id_port': s_axis['kernel_inst']['id_port']
                                          })
                print('type is not defined for kernel '+str(s_axis['kernel_inst']['inst'])+', assuming open\n')
            # END OF RECONFIGURABLE, START OF CONTROL
            clk_200_intf_config.append(presufix_port_name + "_SWAN")
            port_names_list.append(str(presufix_port_name))
            # END OF CONTROL

        # custom_switch_inst only exists without raw
        if tcl_user_app.fpga['comm'] not in ['raw', 'none']:
            # if 'custom' not in tcl_user_app.fpga or tcl_user_app.fpga['custom'] != 'GAScore':
                # Connect the AXI input switch to the Galapagos router
            if not is_gw:
                tcl_user_app.makeBufferedIntfConnection(
                        {
                        'name':'applicationRegion/custom_switch_inst',
                        'type':'intf',
                        'port_name':'stream_out_switch'
                        },
                        {'name':'applicationRegion/input_switch',
                        'type':'intf',
                        'port_name':'S01_AXIS'
                        },
                    'applicationRegion/custom_switch_inst',
                    1
                        )

    elif len(s_axis_array) == 1:
        if (sim == 1):
            tcl_user_app.makeConnection(
                    'intf',
                    {
                    'name':'applicationRegion/arbiter',
                    'type':'intf',
                    'port_name':'M00_AXIS'
                    },
                    {'name': s_axis_array[0]['kernel_inst']['inst'],
                    'type':'intf',
                    'port_name': s_axis_array[0]['name']
                    }
                    )
            kernel_properties.append({'name': str(s_axis_array[0]['name']), 'type': 'open',
                                      'inst': str(str(s_axis_array[0]['inst'].split('/')[-1])),
                                      'slave_name': s_axis_array[0]['kernel_inst']['s_axis'][0]['name'],
                                      'master_name': s_axis_array[0]['kernel_inst']['m_axis'][0]['name'],
                                      'clock_name': s_axis_array[0]['kernel_inst']['clk'][0],
                                      'reset_name': s_axis_array[0]['kernel_inst']['aresetn'][0],
                                      'wan_enabled': s_axis_array[0]['kernel_inst']['wan_enabled'],
                                      'wan_name': s_axis_array[0]['kernel_inst']['wan_name'],
                                      'id': s_axis_array[0]['kernel_inst']['num'],
                                      'has_id': s_axis_array[0]['kernel_inst']['has_id_port'],
                                      'id_port': s_axis_array[0]['kernel_inst']['id_port']
                                      })
            clk_200_intf_config.append(str(s_axis_array[0]['name']) + "_MAXIS")
            clk_200_intf_config.append(str(s_axis_array[0]['name']) + "_SAXIS")
            if s_axis_array[0]['kernel_inst']['wan_enabled'][0]:
                clk_200_intf_config.append(str(s_axis_array[0]['name']) + "_SWAN")
            if s_axis_array[0]['kernel_inst']['control']:
                clk_200_intf_config.append(str(s_axis_array[0]['name']) + "_CONTROL")
                control_port_names_list.append(str(s_axis_array[0]['name']))
                control_properties_list.append([s_axis_array[0]['kernel_inst']['control_size'], s_axis_array[0]['kernel_inst']['control_address']])
            if tcl_user_app.fpga['comm'] not in ['raw', 'none']:
                tcl_user_app.makeConnection(
                        'intf',
                        {
                        'name':'applicationRegion/custom_switch_inst',
                        'type':'intf',
                        'port_name':'stream_out_switch'
                        },
                        {'name':'applicationRegion/arbiter',
                        'type':'intf',
                        'port_name':'S01_AXIS'
                        }
                        )
        else:
            # there's no input switch in this case
            if tcl_user_app.fpga['comm'] not in ['raw', 'none']:
                instName = s_axis_array[0]['kernel_inst']['inst']
                presufix_port_name = instName.split('/')[-1]
                portName = presufix_port_name+ "_MAXIS"
                tcl_user_app.add_axis_port(portName, 'Master')
                # if 'custom' not in tcl_user_app.fpga or tcl_user_app.fpga['custom'] != 'GAScore':
                if not is_gw:
                    tcl_user_app.makeBufferedIntfConnection(
                        {
                        'name':'applicationRegion/input_switch',
                        'type':'intf',
                        'port_name':'M00_AXIS'
                        },
                        {'type':'intf_port',
                        'port_name': portName
                        },
                        portName,
                        int(s_axis_array[0]['kernel_inst']['distance'])
                    )
                clk_200_intf_config.append(str(presufix_port_name) + "_MAXIS")
                clk_200_intf_config.append(str(presufix_port_name) + "_SAXIS")
                if s_axis_array[0]['kernel_inst']['wan_enabled'][0]:
                    clk_200_intf_config.append(str(presufix_port_name) + "_SWAN")
                if s_axis_array[0]['kernel_inst']['control']:
                    clk_200_intf_config.append(str(presufix_port_name) + "_CONTROL")
                    control_port_names_list.append(str(presufix_port_name))
                    control_properties_list.append([s_axis_array[0]['kernel_inst']['control_size'], s_axis_array[0]['kernel_inst']['control_address']])
                if ('type' in s_axis_array[0]['kernel_inst']):
                    kernel_properties.append({'name': s_axis_array[0]['kernel_inst']['name'],
                                              'type': s_axis_array[0]['kernel_inst']['type'],
                                              'inst': str(presufix_port_name),
                                              'slave_name': s_axis_array[0]['kernel_inst']['s_axis'][0]['name'],
                                              'master_name': s_axis_array[0]['kernel_inst']['m_axis'][0]['name'],
                                              'clock_name': s_axis_array[0]['kernel_inst']['clk'][0],
                                              'reset_name': s_axis_array[0]['kernel_inst']['aresetn'][0],
                                              'wan_enabled': s_axis_array[0]['kernel_inst']['wan_enabled'],
                                              'wan_name': s_axis_array[0]['kernel_inst']['wan_name'],
                                              'id': s_axis_array[0]['kernel_inst']['num'],
                                              'has_id': s_axis_array[0]['kernel_inst']['has_id_port'],
                                              'id_port': s_axis_array[0]['kernel_inst']['id_port']
                                              })
                    print('type of \"' + str(s_axis_array[0]['kernel_inst']['name']) + '\" is defined as\n' + str(s_axis_array[0]['kernel_inst']['type']))
                else:
                    kernel_properties.append({'name': s_axis_array[0]['kernel_inst']['name'],
                                              'type': 'open',
                                              'inst': str(presufix_port_name),
                                              'slave_name': s_axis_array[0]['kernel_inst']['s_axis'][0]['name'],
                                              'master_name': s_axis_array[0]['kernel_inst']['m_axis'][0]['name'],
                                              'clock_name': s_axis_array[0]['kernel_inst']['clk'][0],
                                              'reset_name': s_axis_array[0]['kernel_inst']['aresetn'][0],
                                              'wan_enabled': s_axis_array[0]['kernel_inst']['wan_enabled'],
                                              'wan_name': s_axis_array[0]['kernel_inst']['wan_name'],
                                              'id': s_axis_array[0]['kernel_inst']['num'],
                                              'has_id': s_axis_array[0]['kernel_inst']['has_id_port'],
                                              'id_port': s_axis_array[0]['kernel_inst']['id_port']
                                              })
                    print('type is not defined for kernel ' + str(s_axis_array[0]['kernel_inst']['inst']) + ', assuming open\n')
                if not is_gw:
                    tcl_user_app.makeBufferedIntfConnection(
                        {
                        'name':'applicationRegion/custom_switch_inst',
                        'type':'intf',
                        'port_name':'stream_out_switch'
                        },
                        {'name':'applicationRegion/input_switch',
                        'type':'intf',
                        'port_name':'S01_AXIS'
                        },
                        'applicationRegion/custom_switch_inst',
                        1
                    )
    ctrl_kernel_dict = makeControlKernelDictionary(tcl_user_app, 'inst') 
    createTopLevelVerilog(outDir + "/topLevel.v", output_path + "/../middleware/python",kernel_properties,ctrl_kernel_dict,tcl_user_app.fpga,is_gw)
    createHierarchyTCL(project_name,outDir + "/userkernels",kernel_properties,ctrl_kernel_dict,tcl_user_app.fpga['ip_folder'],tcl_user_app.fpga,is_gw,outDir,api_info,CAMILO_TEMP_DEBUG)
    m_axis_array = getInterfaces(tcl_user_app.fpga, 'm_axis', 'scope', 'global')
    kern_name_list= port_names_list


    # Now connect all m_axis interfaces through the output switch into the
    # Galapagos router

    #no output switch, direct connect if only one
    AXIS_PROPERTIES = [
        "CONFIG.HAS_TLAST {1}",
        "CONFIG.HAS_TKEEP {1}",
        "CONFIG.TDATA_NUM_BYTES {64}",
        "CONFIG.TDEST_WIDTH {8}",
        "CONFIG.TID_WIDTH {8}",
        "CONFIG.TUSER_WIDTH {8}"
    ]
    SWAN_PROPERTIES = [
        "CONFIG.HAS_TLAST {1}",
        "CONFIG.HAS_TKEEP {1}",
        "CONFIG.TDATA_NUM_BYTES {64}",
        "CONFIG.TDEST_WIDTH {32}",
        "CONFIG.TUSER_WIDTH {16}"
    ]
    wan_idx = 0;
    for idx, m_axis in enumerate(m_axis_array):
        instName = m_axis['kernel_inst']['inst']
        ht_name = instName.split('/')[-1]
        portName = ht_name + "_SAXIS"
        if not is_gw:
            tcl_user_app.add_axis_port(portName, 'Slave')
            tcl_user_app.setPortProperties(portName, AXIS_PROPERTIES)
        else:
            DIRECT_PROPERTIES = [
                "CONFIG.HAS_TLAST {1}",
                "CONFIG.HAS_TKEEP {1}",
                "CONFIG.TDATA_NUM_BYTES {64}",
                "CONFIG.TDEST_WIDTH {0}",
                "CONFIG.TID_WIDTH {0}",
                "CONFIG.TUSER_WIDTH {64}"
            ]
            tcl_user_app.add_axis_port(portName, 'Slave')
            tcl_user_app.add_axis_port('Direct_port', 'Slave')
            tcl_user_app.setPortProperties(portName, AXIS_PROPERTIES)
            tcl_user_app.setPortProperties('Direct_port', DIRECT_PROPERTIES)
        if m_axis['kernel_inst']['wan_enabled'][0]:
            WANportName = ht_name + "_SWAN"
            tcl_user_app.add_axis_port(WANportName, 'Slave')
            tcl_user_app.setPortProperties(WANportName, SWAN_PROPERTIES)
        idx_str = "%02d"%(idx+1)
        wan_idx_str = "%02d"%(wan_idx+1)
        if not is_gw:
            tcl_user_app.makeBufferedIntfConnection(
                {
                    'type': 'intf_port',
                    'port_name': portName
                },
                    {
                    'name':'applicationRegion/output_switch',
                    'type':'intf',
                    'port_name':'S'+ idx_str + '_AXIS'
                    },
                portName,
                int(m_axis['kernel_inst']['distance'])
            )
        if m_axis['kernel_inst']['wan_enabled'][0]:
            wan_idx = wan_idx + 1
            tcl_user_app.makeBufferedIntfConnection(
                {
                    'type': 'intf_port',
                    'port_name': WANportName
                },
                {
                'name':'applicationRegion/WAN_switch',
                'type':'intf',
                'port_name':'S'+ wan_idx_str + '_AXIS'
                },
                WANportName,
                int(m_axis['kernel_inst']['distance'])
            )
    if tcl_user_app.fpga['has_wan']:
        properties = [
            'CONFIG.NUM_SI {' + str(wan_idx+1) + '}',
            'CONFIG.NUM_MI {1}',
            'CONFIG.HAS_TLAST.VALUE_SRC USER',
            'CONFIG.M00_AXIS_HIGHTDEST {0xffffffff}'
        ]
        tcl_user_app.setProperties('applicationRegion/WAN_switch', properties)
    if tcl_user_app.fpga['comm'] not in ['raw', 'none']:
        # if 'custom' not in tcl_user_app.fpga or tcl_user_app.fpga['custom'] != 'GAScore':
        if not is_gw:
            tcl_user_app.makeBufferedIntfConnection(
                {
                    'name':'applicationRegion/output_switch',
                    'type':'intf',
                    'port_name':'M00_AXIS'
                },
                {
                    'name':'applicationRegion/custom_switch_inst',
                    'type':'intf',
                    'port_name':'stream_in'
                },
                'applicationRegion/output_switch_out',
                1
            )
    # Now handle the WAN Sector
    if (tcl_user_app.fpga['has_wan']):
        tcl_user_app.instBlock(
            {
                'name': 'WAN_bridge',
                'inst': 'applicationRegion/WAN_bridge',
                'clks': ['ap_clk'],
                'resetns': ['ap_rst_n'],
                'resetns_port': 'rstn',
            }
        )
        tcl_user_app.makeBufferedIntfConnection(
            {
                'name': 'applicationRegion/WAN_switch',
                'type': 'intf',
                'port_name': 'M00_AXIS'
            },
            {
                'name': 'applicationRegion/WAN_bridge',
                'type': 'intf',
                'port_name': 'g2N_input'
            },
            'applicationRegion/WAN_switch',
            1
        )
        tcl_user_app.makeBufferedIntfConnection(
            {
                'name': 'applicationRegion/WAN_bridge',
                'type': 'intf',
                'port_name': 'g2N_output'
            },
            {
                'name': 'network/fetch/dispatcher',
                'type': 'intf',
                'port_name': 'rxGalapagosBridge'
            },
            "applicationRegion/WAN_bridge_buffer",
            1
        )
    # Now handle the control interfaces

    s_axi_array = getInterfaces(tcl_user_app.fpga, 's_axi', 'scope', 'global')
    for idx, s_axi in enumerate(s_axi_array):
        instName = s_axi['kernel_inst']['inst']
        idx_str = "%02d"%idx
        tcl_user_app.makeConnection(
                'intf',
                {'name':'applicationRegion/axi_interconnect_ctrl',
                'type':'intf',
                'port_name':'M' + idx_str + '_AXI'
                },
                {'name': instName,
                'type':'intf',
                'port_name':s_axi['name']
                }
                )

    # And finally the off-chip memory interface

    # enable_AXI_mem_interconnect = True

    # if 'custom' in tcl_user_app.fpga:
    #     if tcl_user_app.fpga['custom'] == 'GAScore':
    #         enable_AXI_mem_interconnect = False

    m_axi_array = getInterfaces(tcl_user_app.fpga, 'm_axi', 'scope', 'global')
    # if enable_AXI_mem_interconnect:
    for idx, m_axi in enumerate(m_axi_array):
        instName = m_axi['kernel_inst']['inst']
        idx_str = "%02d"%idx
        tcl_user_app.makeConnection(
                'intf',
                {
                'name': instName,
                'type':'intf',
                'port_name':m_axi['name']
                },
                {
                'name':'applicationRegion/axi_interconnect_mem',
                'type':'intf',
                'port_name':'S' +idx_str + '_AXI'
                }
                )
    # else:
    if 'custom' in tcl_user_app.fpga:
        tcl_custom = tclMeFile( outDir + '/' + str(tcl_user_app.fpga['num']) + '_custom', tcl_user_app.fpga)
        memory_lines = []
        prev_instName = ""
        curr_row = -1
        curr_col = 0
        for idx, m_axi in enumerate(m_axi_array):
            instName = m_axi['kernel_inst']['inst']
            idx_str = "%02d"%idx
            if instName != prev_instName:
                curr_row += 1
                tcl_custom.tprint('set CUSTOM_arr(' + str(curr_row) + ',0) ' + instName)
                prev_instName = instName
                curr_col = 1
            else:
                curr_col += 1
            tcl_custom.tprint('set CUSTOM_arr(' + str(curr_row) + ',' + str(curr_col) + ') ' + m_axi['name'])
    return (kernel_properties , control_port_names_list , control_properties_list,clk_200_intf_config,clk_300_intf_config)

def getKernel(fpga, num):

    for kern in fpga['kernel']:
        if int(kern['num']) == num:
            return kern

    return None

def getSlaveAddressInfo(s_axi):
    slave_inst = s_axi['kernel_inst']['inst']
    slave_inst = slave_inst.split('/')[1]
    if (s_axi['kernel_inst']['lib'] == 'hls'):
        slave_port = 'Data_' + s_axi['name']
    else:
        slave_port = s_axi['name']

    if 'base' in s_axi:
        slave_base = s_axi['base']
    else:
        slave_base = 'Reg'


    properties = {}
    if 'offset' in s_axi:
        properties.update({'offset': s_axi['offset']})
    if 'range' in s_axi:
        properties.update({'range': s_axi['range']})

    return slave_inst, slave_port, slave_base, properties

def userApplicationRegionAssignAddresses(tcl_user_app):
    """
    connect mem interconnect and assign addresses, all kernels need to be 32 bit addressable
    connect ctrl interconnect and assign addresses

    Args:
        tcl_user_app: a tclMe object (which contains references to the FPGA's
                      node object and a handle to the output file)
        shared: Not really sure what this is for
    """

    # if 'custom' in tcl_user_app.fpga and tcl_user_app.fpga['custom'] == 'GAScore':
    #     s_axi_array = getInterfaces(tcl_user_app.fpga, 's_axi', 'scope', 'global')
    #     master = 'S_AXI_CONTROL'
    #     for global_s_axi in s_axi_array:
    #         slave_inst = global_s_axi['kernel_inst']['inst']
    #         slave_inst, slave_port, slave_base, properties = getSlaveAddressInfo(global_s_axi)
    #         tcl_user_app.assign_address(slave_inst, slave_port, slave_base)
    #         if 'offset' in properties:
    #             prop = {'offset': properties['offset']}
    #             tcl_user_app.set_address_properties(slave_inst, slave_port, slave_base, master, **prop)
    #         if 'range' in properties:
    #             prop = {'range': properties['range']}
    #             tcl_user_app.set_address_properties(slave_inst, slave_port, slave_base, master, **prop)
    #     return

    #global m_axi
    m_axi_array = getInterfaces(tcl_user_app.fpga, 'm_axi', 'scope', 'global')
    # tcl_user_app.assign_address(None, 'S_AXI_MEM_0', 'Reg')
    # if shared:
        # tcl_user_app.assign_address(None, 'S_AXI_MEM_1', 'Reg')

    for global_m_axi in m_axi_array:
        instName = global_m_axi['kernel_inst']['inst']

        if(global_m_axi['kernel_inst']['lib'] == 'hls'):
            master = instName + '/Data_' + global_m_axi['name']
        else:
            master = instName + '/' + global_m_axi['name']

        properties = {'offset': '0x00000000', 'range': '4G'}

        # tcl_user_app.set_address_properties(None, 'S_AXI_MEM_0', 'Reg', master, offset='0x00000000')
        # if shared:
            # tcl_user_app.set_address_properties(None, 'S_AXI_MEM_1', 'Reg', master, offset='0x00000000')

    for global_m_axi in m_axi_array:
        instName = global_m_axi['kernel_inst']['inst']

        if(global_m_axi['kernel_inst']['lib'] == 'hls'):
            master = instName + '/Data_' + global_m_axi['name']
        else:
            master = instName + '/' + global_m_axi['name']

        properties = {'range': '4G'}

        # tcl_user_app.set_address_properties(None, 'S_AXI_MEM_0', 'Reg', master, **properties)
        # if shared:
            # tcl_user_app.set_address_properties(None, 'S_AXI_MEM_1', 'Reg', master, **properties)

    # #global s_axi
    # s_axi_array = getInterfaces(tcl_user_app.fpga, 's_axi', 'scope', 'global')
    # master = 'S_AXI_CONTROL'

    # # set up the address space for the memories that were added in raw mode
    # if tcl_user_app.fpga['comm'] == 'raw':
    #     slave_inst = "applicationRegion/ctrl_blk_mem_switch_rom"
    #     slave_port = "S_AXI"
    #     slave_base = "Mem0"
    #     tcl_user_app.assign_address(slave_inst, slave_port, slave_base)
    #     slave_inst = "ctrl_blk_mem_switch_rom"
    #     # range is done first because if offset is done first, depending on the range, it can be misaligned
    #     prop = {'range': '4K'}
    #     tcl_user_app.set_address_properties(slave_inst, slave_port, slave_base, master, **prop)
    #     prop = {'offset': "0x0000"}
    #     tcl_user_app.set_address_properties(slave_inst, slave_port, slave_base, master, **prop)
    #     slave_inst = "applicationRegion/ctrl_blk_mem_switch_rom_mac"
    #     tcl_user_app.assign_address(slave_inst, slave_port, slave_base)
    #     slave_inst = "ctrl_blk_mem_switch_rom_mac"
    #     prop = {'range': '4K'}
    #     tcl_user_app.set_address_properties(slave_inst, slave_port, slave_base, master, **prop)
    #     prop = {'offset': "0x1000"}
    #     tcl_user_app.set_address_properties(slave_inst, slave_port, slave_base, master, **prop)

    # for global_s_axi in s_axi_array:
    #     slave_inst = global_s_axi['kernel_inst']['inst']
    #     slave_inst, slave_port, slave_base, properties = getSlaveAddressInfo(global_s_axi)
    #     tcl_user_app.assign_address(slave_inst, slave_port, slave_base)
    #     if 'offset' in properties:
    #         prop = {'offset': properties['offset']}
    #         tcl_user_app.set_address_properties(slave_inst, slave_port, slave_base, master, **prop)
    #     if 'range' in properties:
    #         prop = {'range': properties['range']}
    #         tcl_user_app.set_address_properties(slave_inst, slave_port, slave_base, master, **prop)





    #local m_axi and s_axi
    m_axi_array = getInterfaces(tcl_user_app.fpga, 'm_axi', 'scope', 'local')


    for local_m_axi in m_axi_array:
        if (local_m_axi['kernel_inst']['lib'] == 'hls'):
            master_port = 'Data_' + local_m_axi['name']
        else:
            master_port =  local_m_axi['name']

        s_axi_array = getSlaveInterfaces(tcl_user_app.fpga, 's_axi', local_m_axi)

        for local_s_axi in s_axi_array:
            slave_inst, slave_port, slave_base, properties = getSlaveAddressInfo(local_s_axi)
            tcl_user_app.assign_address(slave_inst, slave_port, slave_base)
            if 'offset' in properties:
                prop = {'offset': properties['offset']}
                tcl_user_app.set_address_properties(slave_inst, slave_port, slave_base, local_m_axi['kernel_inst']['inst'] + '/' + master_port, **prop)
            if 'range' in properties:
                prop = {'range': properties['range']}
                tcl_user_app.set_address_properties(slave_inst, slave_port, slave_base, local_m_axi['kernel_inst']['inst'] + '/' + master_port, **prop)

def userApplicationLocalConnections(tcl_user_app):
    """
    Takes care of generating the TCL commands for wiring up the <scope>local</scope>
    connections between kernels, as defined in the logical file.

    THIS NEEDS AN OVERHAUL!

    Args:
        tcl_user_app: Basically a handle to a file on disk, but in a fancy tclMe
                      object with a bunch of helper functions to make writing to
                      it a little easier.

    Raises:
        ValueError: If the local connection specification doesn't make sense
    """
    #connect local axis and wires

    m_axis_array = getInterfaces(tcl_user_app.fpga, 'm_axis', 'scope', 'local')

    for local_m_axis in m_axis_array:
        #s_axis_array = getSlaveInterfaces(tcl_user_app.fpga, 's_axis', local_m_axis)
        print('local_m_axis ' + str(local_m_axis))
        print('local_m_axis_kern_num ' + str(local_m_axis['kernel_inst']['num']))
        print('local_m_axis_kern_name ' + str(local_m_axis['kernel_inst']['name']))
        s_axis = local_m_axis['slave']
        #print('local_m_axis[keys]:' +  str(local_m_axis.keys()))
        #print('local_m_axis[values]:' +  str(local_m_axis.values()))
        #print('fpga[keys]:' +  str(tcl_user_app.fpga.data.keys()))
        #print('fpga[values]:' +  str(tcl_user_app.fpga.data.values()))
        #print('kernel:' +  str(tcl_user_app.fpga['kernel']))
        #print('kernel_map:' +  str(tcl_user_app.fpga['kernel_map']))
        #print('s_axis:' +  str(s_axis))
        print('kernel')
        print (tcl_user_app.fpga['kernel'])
        print('kernel_map')
        print (tcl_user_app.fpga['kernel_map'])
        print('s_axis[node]')
        print (s_axis['node'])
        print('kernel_name')


        for local_kern in tcl_user_app.fpga['kernel']:
            print (local_kern['name'])
            print('kernel_inst')
            print (local_kern['#text'])


        print("first: " + str(tcl_user_app.fpga['kernel_map']))
        print("second: " + str(s_axis))
        print("third: " + str(local_m_axis))
        print("fourth: " + str(local_m_axis['kernel_inst']['name']))
        print("fifth: " + str(local_m_axis['kernel_inst']['num']))
        s_axis_kernel = tcl_user_app.fpga['kernel'][tcl_user_app.fpga['kernel_map'][s_axis['node']]]['inst']
        tcl_user_app.makeConnection(
                'intf',
                {
                'name': local_m_axis['kernel_inst']['inst'],
                'type':'intf',
                'port_name': local_m_axis['name']
                },
                {
                'name':  s_axis_kernel,
                'type':'intf',
                'port_name': s_axis['port']
                }
                )

    #m_bram_array = getInterfaces(tcl_user_app.fpga, 'm_bram')



    ##each master bram port, instantiate new bram, and connect
    #for local_m_bram in m_bram_array:

    #    tcl_user_app.instBlock(
    #        {
    #            'name':'blk_mem_gen',
    #            'inst': local_m_bram['kernel_inst']['inst'] + '_' + local_m_bram['name'] + '_m_bram'
    #        }
    #    )
    ##tcl_bridge_connections.instBlock(
    #    {
    #        'name':'blk_mem_gen',
    #        'inst':'network/galapagos_bridge_buffer'
    #    }
    #)
        #tcl_net.makeConnection(
        #s_bram = local_m_bram['slave']
        #s_bram_kernel = tcl_user_app.fpga['kernel'][tcl_user_app.fpga['kernel_map'][s_bram['node']]]['inst']
        #s_bram_kernel = t




    wire_master_array = getInterfaces(tcl_user_app.fpga, 'wire_master', 'scope' ,'local')

    for wire_master in wire_master_array:
        wire_slave_array = getSlaveInterfaces(tcl_user_app.fpga, 'wire_slave', wire_master)


        for wire_slave in wire_slave_array:
            tcl_user_app.makeConnection(
                    'net',
                        {
                        'name': wire_master['kernel_inst']['inst'],
                        'type':'pin',
                        'port_name': wire_master['name']
                        },
                        {
                        'name': wire_slave['kernel_inst']['inst'],
                        'type':'pin',
                        'port_name': wire_slave['name']
                        }
                        )
def userApplicationRegionMultiSLR(tcl_user_app, mappings,outDir,main_slr,reset_slr,board):
    ec_file = open(outDir+"/extra_constraints.xdc","w")
    tcl_user_app.addConstraints(outDir+'/extra_constraints.xdc')
    for region in mappings:
        active = False
        if mappings[region]['name'] == main_slr:
            active = True
            ec_file.write('create_pblock ' + mappings[region]['name']+'\n')
            ec_file.write('add_cells_to_pblock [get_pblocks ' + mappings[region]['name'] + '] [get_cells -quiet [list')
            if board == 'u250':
                ec_file.write(' shell_i/ethernet pr_i/applicationRegion pr_i/network')
            else:
                ec_file.write(' shell_i pr_i/applicationRegion pr_i/network')
        elif mappings[region]['name'] == reset_slr:
            active = True
            ec_file.write('create_pblock '+mappings[region]['name']+'\n')
            ec_file.write('add_cells_to_pblock [get_pblocks ' + mappings[region]['name'] + '] [get_cells -quiet [list')
            ec_file.write(' ' + "shell_i/clock_reset_generator")
        elif mappings[region]['kernel'] != []:
            active = True
            ec_file.write('create_pblock '+mappings[region]['name']+'\n')
            ec_file.write('add_cells_to_pblock [get_pblocks ' + mappings[region]['name'] + '] [get_cells -quiet [list')
        for kernel_inst in mappings[region]['kernel']:
            port_name = "user_"+kernel_inst['name'] + "_inst_" + str(kernel_inst['num'])+'_i_i'
            ec_file.write(' '+port_name)
        if active:
            ec_file.write(']]\nresize_pblock [get_pblocks ' + mappings[region]['name'] + '] -add {'+mappings[region]['clockregion']+"}\n\n\n")
def userApplicationRegionGWShellChanges(tcl_user_app):
    tcl_user_app.makeBufferedIntfConnection(
        {
            'type': 'intf_port',
            'port_name': 'gateway_inst_0_SAXIS'
        },
        {
            'name': 'applicationRegion/custom_switch_inst',
            'type': 'intf',
            'port_name': 'stream_in'
        },
        'gateway_inst_0_SAXIS',
        1
    )
    tcl_user_app.makeConnection(
        "intf",
        {
            'type': 'intf_port',
            'port_name': 'Direct_port'
        },
        {
            'name': 'network/network_bridge_inst/direct_cc',
            'type': 'intf',
            'port_name': 'S_AXIS'
        }
    )
    tcl_user_app.makeBufferedIntfConnection(
        {
            'name': 'network/network_bridge_inst/axis_clock_converter_1',
            'type': 'intf',
            'port_name': 'M_AXIS'
        },
        {
            'type': 'intf_port',
            'port_name': 'gateway_inst_0_MAXIS'
        },
        'gateway_inst_0_MAXIS',
        1
    )
    tcl_user_app.saxis_tie_off(
        'network/network_bridge_udp'
        ,'lbRxDataIn')
def userApplicationRegion(project_name,outDir,output_path, fpga, sim,is_gw,api_info,CAMILO_TEMP_DEBUG):
    """
    Takes care of calling a bunch of functions for assembling the user application
    region part of the block diagram. To be specific, this function takes care
    of generating a single TCL file whose only purpose is to draw up the user's
    IPs and connections into a sub-heirarchy named "applicationRegion". The shell
    is then done in another TCL file by another function

    Args:
        outDir (string): The output location for this TCL file
        fpga: the node object for this FPGA
        sim: some boolean for turning on sims or something
    """
    tcl_user_app = tclMeFile( outDir + '/' + str(fpga['num']) + '_app', fpga)
    #tcl_user_app = open( outDir + '/' + str(fpga['num']) + '_app.tcl', 'w')
    tcl_user_app.createHierarchy('applicationRegion')
    userApplicationRegionKernelsInst(tcl_user_app)
    #if communication medium is ethernet then combine offchip memory into one shared address space
    userApplicationRegionMemInstGlobal(tcl_user_app, tcl_user_app.fpga['comm'] != 'tcp')
    userApplicationRegionMemInstLocal(tcl_user_app)
    userApplicationRegionSwitchesInst(tcl_user_app, sim,is_gw)
    (kernel_properies,control_name_list,control_prop_list,clk_200_int,clk_300_int)=userApplicationRegionKernelConnectSwitches(project_name,outDir,output_path, tcl_user_app, sim,is_gw,api_info,CAMILO_TEMP_DEBUG)
    if tcl_user_app.fpga.has_control:
        userApplicationRegionAssignAddresses(tcl_user_app, tcl_user_app.fpga['comm'] !='tcp' and tcl_user_app.fpga.address_space == 64)
    userApplicationLocalConnections(tcl_user_app)
    if tcl_user_app.fpga.has_control:
        userApplicationRegionControlInst(tcl_user_app,control_name_list,control_prop_list)
    if tcl_user_app.fpga.has_ddr:
        userApplicationRegionDDR(tcl_user_app, outDir, output_path)
        print("DDR written!!!")
    tcl_user_app.setInterfacesCLK("CLK",clk_200_int)
    tcl_user_app.setInterfacesCLK("CLK300", clk_300_int)
    if fpga['multi_slr']:
        userApplicationRegionMultiSLR(tcl_user_app,fpga['slr_mappings'],outDir, fpga['main_slr'],fpga['reset_slr'],fpga['board'])
    if is_gw:
        userApplicationRegionGWShellChanges(tcl_user_app)
    tcl_user_app.close()
    #return num_debug_interfaces

def netBridgeConstants(tcl_net,is_gw):
    """
    Generate ip_constant_blocks related to the network bridge. For example, this
    would make a block for the MAC address and the IP address

    Args:
        tcl_net: A tclMe object for the TCL file for generating the network stuff
    """

    # these constants are unneeded in raw mode
    ip_addr = tcl_net.fpga['dns_ip'].split(".")
    ip_addr_val = (int(ip_addr[0])<<24)|(int(ip_addr[1])<<16)|(int(ip_addr[2])<<8)|(int(ip_addr[3]));
    if tcl_net.fpga['has_wan']:
        tcl_net.instBlock(
            {
                'name': 'xlconstant',
                'resetns_port': 'rstn',
                'inst': 'network/dns_server_info',
                'properties': ['CONFIG.CONST_WIDTH {32}',
                               ' CONFIG.CONST_VAL {'+str(ip_addr_val)+'}']
            }
        )
    if tcl_net.fpga['comm'] != "raw":
        ip_addr = tcl_net.fpga['ip'].split(".")
        #tcl_net.write('addip ip_constant_block network/ip_constant_block_inst\n')

        # Not sure where this vendor and lib came from
        tcl_net.addVerilog(str(os.environ.get('GALAPAGOS_PATH'))+"/middleware/verilog/ip_constant_block.v")
        tcl_net.instModule(
                {
                'name':'ip_constant_block',
                'resetns_port': 'rstn',
                'inst':'network/ip_constant_block_inst'
                }
                )

        # I guess this is a custom module that Naif made? The regular IP for
        # constants doesn't have these properties
        properties = ['CONFIG.C_IP_B0 {'+ ip_addr[0] + '}',
                    'CONFIG.C_IP_B1 {'+ ip_addr[1] + '}',
                    'CONFIG.C_IP_B2 {'+ ip_addr[2] + '}',
                    'CONFIG.C_IP_B3 {'+ ip_addr[3] + '}']

        properties = properties + ['CONFIG.C_GATEWAY_B0 {' + ip_addr[0] +'}',
                    'CONFIG.C_GATEWAY_B1 {' + ip_addr[1] +'}',
                    'CONFIG.C_GATEWAY_B2 {' + ip_addr[2] +'}',
                    'CONFIG.C_GATEWAY_B3 {100}']

        properties = properties + ['CONFIG.C_SUBNET_B0 {255}',
                'CONFIG.C_SUBNET_B1 {255}',
                'CONFIG.C_SUBNET_B2 {0}',
                'CONFIG.C_SUBNET_B3 {0}']

        # MAC address
        mac_int_val = tcl_net.fpga['mac'].split(":")
        if len(mac_int_val)!= 6:
            raise ValueError("MAC address needs to be 6 octets")
        for i in range(6):
            properties = properties + ['CONFIG.C_MAC_B'+str(i)+' {' + str( int(mac_int_val[i], 16 ) ) + '}']
        tcl_net.setProperties('network/ip_constant_block_inst', properties)

    # Instantiate the proper netBridge depending on the comm type
    # By the way, these scripts also take care of hooking up the constants
    # This should really be in the netBridge function instead of in this one...
    galapagos_path = str(os.environ.get('GALAPAGOS_PATH'))
    if tcl_net.fpga['comm'] == 'tcp':
        tcl_net.addSource(galapagos_path + '/middleware/tclScripts/pr_tcp_bridge.tcl')
        tcl_net.instBlock(
            {
                'name':'xlconstant',
                'inst': 'network/node_id',
                'resetns_port': 'rstn',
                'properties':[
                    'CONFIG.CONST_WIDTH {8}',
                    'CONFIG.CONST_VAL {' + str(tcl_net.fpga['num']) + '}'
                ]
            }
        )
        tcl_net.makeConnection(
            'net',
            {
                'name':'network/node_id',
                'type':'pin',
                'port_name':'dout'
            },
            {
                'name':'network/network_bridge_inst',
                'type':'pin',
                'port_name': 'node_id'
            }
        )
    elif tcl_net.fpga['comm'] == 'eth':
        tcl_net.addSource(galapagos_path + '/middleware/tclScripts/pr_eth_bridge.tcl')
    elif tcl_net.fpga['comm'] == 'raw':
        tcl_net.addSource(galapagos_path + '/middleware/tclScripts/pr_raw_bridge.tcl')
    elif tcl_net.fpga['comm'] == 'udp':
        ip_addr = tcl_net.fpga['ip'].split(".")
        tcl_net.tprint('set ip_addr ' + '0x{0:0{1}X}'.format(int(ip_addr[0]),2) +'0x{0:0{1}X}'.format(int(ip_addr[1]),2)[2:] + '0x{0:0{1}X}'.format(int(ip_addr[2]),2)[2:]   + '0x{0:0{1}X}'.format(int(ip_addr[3]),2)[2:]   )
        tcl_net.tprint('set ip_gateway ' + '0x{0:0{1}X}'.format(int(ip_addr[0]),2) +'0x{0:0{1}X}'.format(int(ip_addr[1]),2)[2:] + '0x{0:0{1}X}'.format(int(ip_addr[2]),2)[2:]   + '0x{0:0{1}X}'.format(0,2)[2:]   )
        tcl_net.tprint('set mac_addr 0x' + tcl_net.fpga['mac'].replace(":","")    )
        tcl_net.tprint('set net_mask 0xFFFF0000')

        if tcl_net.fpga['board'] == 'vck5000' and is_gw:
            tcl_net.addSource(galapagos_path + '/middleware/tclScripts/pr_udp100_vck_bridge_gw.tcl')
        elif is_gw:
            tcl_net.addSource(galapagos_path + '/middleware/tclScripts/pr_udp100_bridge_gw.tcl')
        elif tcl_net.fpga['board'] == 'vck5000' and tcl_net.fpga['has_wan']:
            tcl_net.addSource(galapagos_path + '/middleware/tclScripts/pr_udp100_vck_bridge.tcl')
        elif tcl_net.fpga['board'] == 'vck5000':
            tcl_net.addSource(galapagos_path + '/middleware/tclScripts/pr_udp100_vck_bridge_no_wan.tcl')
        elif tcl_net.fpga['has_wan']:
            tcl_net.addSource(galapagos_path + '/middleware/tclScripts/pr_udp100_bridge.tcl')
        else:
            tcl_net.addSource(galapagos_path + '/middleware/tclScripts/pr_udp100_bridge_no_wan.tcl')


def netBridge(outDir, fpga,is_gw):
    """
    Handles making a TCL file for generating this FPGA's network bridge.
    All IPs are made in a hierarchy called "network"

    Args:
        outDir (string): The output location for this TCL file
        fpga: the node object for this FPGA
    """
    tcl_net = tclMeFile( outDir + '/' + str(fpga['num']) + '_net', fpga)

    tcl_net.createHierarchy('network')
    netBridgeConstants(tcl_net,is_gw)
    tcl_net.close()

def bridgeConnections(outDir, fpga, sim,is_gw):
    """
    At this point, the IP blocks for the network bridge and user app region are
    in place, and the user app region is completely connected. This takes care
    of stringing up all the stuff for the network bridge (and I think it also
    takes care of the user appBridge option?)

    Args:
        outDir (string): The output location for this TCL file
        fpga: the node object for this FPGA
        sim: some boolean for turning on sims or something
    """
    tcl_bridge_connections = tclMeFile( outDir + '/' + str(fpga['num']) + '_bridge_connections', fpga)
    if 'custom' in tcl_bridge_connections.fpga:
        tcl_custom = tclMeFile( outDir + '/' + str(fpga['num']) + '_custom', fpga)

    tcl_bridge_connections.instBlock(
        {'name':'galapagos_bridge',
            'inst':'network/galapagos_bridge_inst',
            'vendor':'xilinx.com',
            'lib':'hls',
            'resetns_port': 'rstn',
            'clks':['ap_clk'],
            'resetns':['ap_rst_n']
        }
    )
    if is_gw:
        tcl_bridge_connections.saxis_tie_off(
            'network/galapagos_bridge_inst'
            ,'n2G_input')
    #tcl_bridge_connections.instBlock(
    #    {
    #        'name':'blk_mem_gen',
    #        'inst':'network/galapagos_bridge_buffer'
    #    }
    #)


    #properties = ['CONFIG.Memory_Type {True_Dual_Port_RAM}',
    #              'CONFIG.Enable_B {Use_ENB_Pin}',
    #              'CONFIG.Use_RSTB_Pin {true}',
    #              'CONFIG.Port_B_Clock {100}',
    #              'CONFIG.Port_B_Write_Rate {50}',
    #              'CONFIG.Port_B_Enable_Rate {100}']
    #tcl_bridge_connections.setProperties('network/galapagos_bridge_buffer', properties)

    #tcl_bridge_connections.makeConnection(
    #        'intf',
    #        {
    #        'name':'network/galapagos_bridge_inst',
    #        'type':'intf',
    #        'port_name':'buffer_storage_A_V_PORTA'
    #        },
    #        {
    #        'name':'network/galapagos_bridge_buffer',
    #        'type':'intf',
    #        'port_name':'BRAM_PORTA'
    #        }
    #        )

    #tcl_bridge_connections.makeConnection(
    #        'intf',
    #        {
    #        'name':'network/galapagos_bridge_inst',
    #        'type':'intf',
    #        'port_name':'buffer_storage_B_V_PORTA'
    #        },
    #        {
    #        'name':'network/galapagos_bridge_buffer',
    #        'type':'intf',
    #        'port_name':'BRAM_PORTB'
    #        }
    #        )

    #no bridge directly connect
    if tcl_bridge_connections.fpga['app_bridge'] == None:

        # custom_switch_inst only exists without raw
        if tcl_bridge_connections.fpga['comm'] not in ['raw', 'none']:
            # if 'custom' not in tcl_bridge_connections.fpga or tcl_bridge_connections.fpga['custom'] != 'GAScore':
            tcl_bridge_connections.makeBufferedIntfConnection(
                    {
                    'name':'applicationRegion/custom_switch_inst',
                    'type':'intf',
                    'port_name':'stream_out_network'
                    },
                    {
                    'name':'network/galapagos_bridge_inst',
                    'type':'intf',
                    'port_name':'g2N_input'
                    },
                    "applicationRegion/stream_out_network",
                    1
                    )

            tcl_bridge_connections.makeConnection(
                    'intf',
                    {
                    'name':'network/galapagos_bridge_inst',
                    'type':'intf',
                    'port_name':'g2N_output'
                    },
                    {
                    'name':'network/network_bridge_inst/axis_clock_converter_0',
                    'type':'intf',
                    'port_name':'S_AXIS'
                    }
                    )
            # else:
            if "custom" in tcl_bridge_connections.fpga:
                tcl_custom.tprint('set CUSTOM_net_out network/galapagos_bridge_inst/g2N_input')
                s_axis_array = getInterfaces(tcl_bridge_connections.fpga, 's_axis', 'scope', 'global')
                if len(s_axis_array) > 1:
                    if not is_gw:
                        tcl_custom.tprint('set CUSTOM_kernel_in applicationRegion/input_switch/S00_AXIS')
                    tcl_custom.tprint('set CUSTOM_kernels_stream_in ' + str(len(s_axis_array)))
                else:
                    instName = s_axis_array[0]['kernel_inst']['inst']
                    tcl_custom.tprint('set CUSTOM_kernel_in ' + instName + '/' + s_axis_array[0]['name'])
                    tcl_custom.tprint('set CUSTOM_kernels_stream_in 1')

                m_axis_array = getInterfaces(tcl_bridge_connections.fpga, 'm_axis', 'scope', 'global')
                if len(m_axis_array) > 1:
                    if not is_gw:
                        tcl_custom.tprint('set CUSTOM_kernel_out applicationRegion/output_switch/M00_AXIS')
                    tcl_custom.tprint('set CUSTOM_kernels_stream_out ' + str(len(m_axis_array)))
                else:
                    instName = m_axis_array[0]['kernel_inst']['inst']
                    tcl_custom.tprint('set CUSTOM_kernel_out ' + instName + '/' + m_axis_array[0]['name'])
                    tcl_custom.tprint('set CUSTOM_kernels_stream_out 1')
            # Connect control KIP outbound path to network
            ctrl_kernel_dict = makeControlKernelDictionary(tcl_bridge_connections, 'num')
            num_ctrl_instances = len(ctrl_kernel_dict)
            if num_ctrl_instances > 0:
                tcl_bridge_connections.makeConnection(
                    'net',
                    {
                        'name':'applicationRegion/KIP_port_number',
                        'type':'pin',
                        'port_name':'dout'
                    },
                    {
                        'name':'network/ctrl_rx_nb',
                        'type':'pin',
                        'port_name':'i_CTRL_KIP_port_number'
                    }
                )
                tcl_bridge_connections.makeConnection(
                    'intf',
                    {
                        'name':'applicationRegion/KIP_router_0',
                        'type':'intf',
                        'port_name':'to_gs'
                    },
                    {
                        'name':'network/ctrl_to_nb_KIP_CDC',
                        'type':'intf',
                        'port_name':'S_AXIS'
                    }
                )
            # Edge case: No control instances are used, tie off KIP path to 0
            else:
                tcl_bridge_connections.instBlock(
                    {
                        'name': 'xlconstant',
                        'inst':  'network/const_0',
                        'properties': [ 
                                        'CONFIG.CONST_WIDTH {1}',
                                        'CONFIG.CONST_VAL {0}'
                                    ]
                    }
                )
                tcl_bridge_connections.makeConnection(
                    'net', 
                    {
                        'type': 'pin',
                        'name': 'network/const_0',
                        'port_name': 'dout'
                    },
                    {
                        'type': 'pin',
                        'name': 'network/ctrl_to_nb_KIP_CDC',
                        'port_name': 's_axis_tvalid'
                    }
                )
        else:
            # depending on the number of slaves, either connect the network to a switch or the slave
            s_axis_array = getInterfaces(tcl_bridge_connections.fpga, 's_axis', 'scope', 'global')
            if len(s_axis_array) > 1:
                if tcl_bridge_connections.fpga['comm'] != 'none':
                    if not is_gw:
                        tcl_bridge_connections.makeBufferedIntfConnection(
                                    {
                                    'name':'network/network_bridge_inst',
                                    'type':'intf',
                                    'port_name':'${netBridge_to_app}'
                                    },
                                    {'name':'applicationRegion/input_switch',
                                    'type':'intf',
                                    'port_name':'S00_AXIS'
                                    },
                                    'network/network_bridge_inst',
                                    1
                                    )
                else:
                    if not is_gw:
                        tcl_custom.tprint('set CUSTOM_kernel_in applicationRegion/input_switch/S00_AXIS')
                    tcl_custom.tprint('set CUSTOM_kernels_stream_in ' + str(len(s_axis_array)))
            else:
                instName = s_axis_array[0]['kernel_inst']['inst']
                if tcl_bridge_connections.fpga['comm'] != 'none':
                    tcl_bridge_connections.makeConnection(
                                'intf',
                                {
                                'name':'network/network_bridge_inst',
                                'type':'intf',
                                'port_name':'${netBridge_to_app}'
                                },
                                {'name': instName,
                                'type':'intf',
                                'port_name': s_axis_array[0]['name']
                                }
                                )
                else:
                    tcl_custom.tprint('set CUSTOM_kernel_in ' + instName + '/' + s_axis_array[0]['name'])
                    tcl_custom.tprint('set CUSTOM_kernels_stream_in 1')

            m_axis_array = getInterfaces(tcl_bridge_connections.fpga, 'm_axis', 'scope', 'global')
            if len(m_axis_array) > 1:
                if not is_gw:
                    if tcl_bridge_connections.fpga['comm'] != 'none':
                        tcl_bridge_connections.makeBufferedIntfConnection(
                                    {
                                    'name':'applicationRegion/output_switch',
                                    'type':'intf',
                                    'port_name':'M00_AXIS'
                                    },
                                    {
                                    'name':'network/network_bridge_inst',
                                    'type':'intf',
                                    'port_name':'${netBridge_from_app}'
                                    },
                                    'output_switch',
                                    1
                                    )
                    else:
                        tcl_custom.tprint('set CUSTOM_kernel_out applicationRegion/output_switch/M00_AXIS')
                        tcl_custom.tprint('set CUSTOM_kernels_stream_out ' + str(len(m_axis_array)))
            else:
                instName = m_axis_array[0]['kernel_inst']['inst']
                if tcl_bridge_connections.fpga['comm'] != 'none':
                    tcl_bridge_connections.makeConnection(
                            'intf',
                            {
                            'name': instName,
                            'type':'intf',
                            'port_name': m_axis_array[0]['name']
                            },
                            {
                            'name':'network/network_bridge_inst',
                            'type':'intf',
                            'port_name':'${netBridge_from_app}'
                            }
                            )
                else:
                    tcl_custom.tprint('set CUSTOM_kernel_out ' + instName + '/' + m_axis_array[0]['name'])
                    tcl_custom.tprint('set CUSTOM_kernels_stream_out 1')


        if tcl_bridge_connections.fpga['comm'] not in ['raw', 'none']:
            if (sim == 0):
                # if 'custom' not in tcl_bridge_connections.fpga or tcl_bridge_connections.fpga['custom'] != 'GAScore':
                if not is_gw:
                    tcl_bridge_connections.makeConnection(
                            'intf',
                            {
                            'name':'network/network_bridge_inst/axis_clock_converter_1',
                            'type':'intf',
                            'port_name':'M_AXIS'
                            },
                            {
                            'name':'network/galapagos_bridge_inst',
                            'type':'intf',
                            'port_name':'n2G_input'
                            }
                            )
                    tcl_bridge_connections.makeBufferedIntfConnection(
                            {
                            'name':'network/galapagos_bridge_inst',
                            'type':'intf',
                            'port_name':'n2G_output'
                            },
                            {
                            'name':'applicationRegion/input_switch',
                            'type':'intf',
                            'port_name':'S00_AXIS'
                            },
                        'network/galapagos_bridge_inst',
                        1
                            )
                if "custom" in tcl_bridge_connections.fpga:
                    tcl_custom.tprint('set CUSTOM_net_in network/galapagos_bridge_inst/n2G_output')
                # Connect control inbound path to kernels
                if num_ctrl_instances > 0:
                    tcl_bridge_connections.makeConnection(
                        'intf',
                        {
                        'name':'network/ctrl_from_nb_CDC',
                        'type':'intf',
                        'port_name':'M_AXIS'
                        },
                        {
                        'name':'applicationRegion/ctrl_from_nb_switch',
                        'type':'intf',
                        'port_name':'S02_AXIS'
                        }
                    )
                # Edge case: No control instances are used, tie off path to 0
                else:
                    tcl_bridge_connections.instBlock(
                        {
                            'name': 'xlconstant',
                            'inst':  'network/const_1',
                            'properties': [ 
                                            'CONFIG.CONST_WIDTH {1}',
                                            'CONFIG.CONST_VAL {1}'
                                        ]
                        }
                    )
                    tcl_bridge_connections.makeConnection(
                        'net', 
                        {
                            'type': 'pin',
                            'name': 'network/const_1',
                            'port_name': 'dout'
                        },
                        {
                            'type': 'pin',
                            'name': 'network/ctrl_from_nb_CDC',
                            'port_name': 'm_axis_tready'
                        }
                    )
            else: #sim == 1
                tcl_bridge_connections.makeConnection(
                        'intf',
                        {
                        'name':'network/network_bridge_inst',
                        'type':'intf',
                        'port_name':'${netBridge_to_app}'
                        },
                        {
                        'name':'applicationRegion/arbiter',
                        'type':'intf',
                        'port_name':'S00_AXIS'
                        }
                        )
    else:
        tcl_bridge_connections.instBlock(
                {
                'name': tcl_bridge_connections.fpga['app_bridge']['name'],
                'inst':'application_bridge_inst',
                'lib': tcl_bridge_connections.fpga['app_bridge']['lib'],
                'vendor': tcl_bridge_connections.fpga['app_bridge']['vendor'],
                'clks':tcl_bridge_connections.fpga['app_bridge']['clk'],
                'resetns':tcl_bridge_connections.fpga['app_bridge']['aresetn'],
                'resetns_port': 'rstn'
                }
                )
        if (sim == 1):
            tcl_bridge_connections.makeConnection(
                    'intf',
                    {
                    'name':'application_bridge_inst',
                    'type':'intf',
                    'port_name':tcl_bridge_connections.fpga['app_bridge']['to_app']
                    },
                    {
                    'name':'applicationRegion/arbiter',
                    'type':'intf',
                    'port_name':'S00_AXIS'
                    }
                    )
        else: #sim == 0
            if not is_gw:
                tcl_bridge_connections.makeBufferedIntfConnection(
                        {
                        'name':'application_bridge_inst',
                        'type':'intf',
                        'port_name':tcl_bridge_connections.fpga['app_bridge']['to_app']
                        },
                        {
                        'name':'applicationRegion/input_switch',
                        'type':'intf',
                        'port_name':'S00_AXIS'
                        },
                    'applicationRegion/input_switch_in',
                    1
                        )
        if tcl_bridge_connections.fpga['comm'] not in ['raw', 'none']:


            tcl_bridge_connections.makeBufferedIntfConnection(
                    {
                    'name':'applicationRegion/custom_switch_inst',
                    'type':'intf',
                    'port_name':'stream_out_network'
                    },
                    {
                    'name':'application_bridge_inst',
                    'type':'intf',
                    'port_name':tcl_bridge_connections.fpga['app_bridge']['from_app']
                    },
                    'application_region/stream_out_network',
                    1
                    )
        else:
            m_axis_array = getInterfaces(tcl_bridge_connections.fpga, 'm_axis', 'scope', 'global')
            if len(m_axis_array) > 1:
                if not is_gw:
                    tcl_bridge_connections.makeBufferedIntfConnection(
                            {
                            'name':'applicationRegion/output_switch',
                            'type':'intf',
                            'port_name':'M00_AXIS'
                            },
                            {
                            'name':'application_bridge_inst',
                            'type':'intf',
                            'port_name':tcl_bridge_connections.fpga['app_bridge']['from_app']
                            },
                            'output_switch',
                            1
                            )
            else:
                instName = m_axis_array[0]['kernel_inst']['inst']
                tcl_bridge_connections.makeConnection(
                        'intf',
                        {
                        'name': instName,
                        'type':'intf',
                        'port_name': m_axis_array[0]['name']
                        },
                        {
                        'name':'application_bridge_inst',
                        'type':'intf',
                        'port_name':tcl_bridge_connections.fpga['app_bridge']['from_app']
                        }
                        )

        if tcl_bridge_connections.fpga['comm'] != 'none':
            tcl_bridge_connections.makeConnection(
                    'intf',
                    {
                    'name':'application_bridge_inst',
                    'type':'intf',
                    'port_name':tcl_bridge_connections.fpga['app_bridge']['to_net']
                    },
                    {
                    'name':'network/network_bridge_inst',
                    'type':'intf',
                    'port_name':'${netBridge_from_app}'
                    }
                    )

            tcl_bridge_connections.makeConnection(
                    'intf',
                    {
                    'name':'network/network_bridge_inst',
                    'type':'intf',
                    'port_name':'${netBridge_to_app}'
                    },
                    {
                    'name':'application_bridge_inst',
                    'type':'intf',
                    'port_name':tcl_bridge_connections.fpga['app_bridge']['from_net']
                    }
                    )
    if tcl_bridge_connections.fpga['comm'] == 'none':
        tcl_custom.close()
    tcl_bridge_connections.close()

def makeSWFile(fpga, projectName, output_path, listOfKernelIPs):
    outDir = output_path + '/' + projectName + '/' + str(fpga['num'])+'/user_files/'
    kern_hpp = open(outDir+"/kern.hpp","w")
    kern_cpp = open(outDir + "/kern.cpp", "w")
    cpu_cpp = open(outDir + "/cpu_node.cpp", "w")
    to_write = '''
#include "ap_int.h"
#include "hls_stream.h"
#include "ap_utils.h"
#include "../packet_size.h"
#include "../galapagos_interface.hpp"
#include <math.h>

typedef ap_uint<PACKET_DATA_LENGTH> T;
    '''
    for i in fpga['kernel']:
        to_write = to_write + "void "+i['name']+"(short id, galapagos_interface * in, galapagos_interface * out);\n\n"
    kern_hpp.write(to_write)
    kern_hpp.close()
    to_write = '''
using namespace std;
#include<unistd.h>
#define INTERFACE_100G
#include "kern.hpp"


    '''
    for i in fpga['kernel']:
        to_write = to_write + "void "+i['name']+"(short id, galapagos_interface * in, galapagos_interface * out)\n{\n"
        to_write = to_write + "#pragma HLS INTERFACE axis register both port = out\n"
        to_write = to_write + "#pragma HLS INTERFACE axis register both port = in"
        to_write = to_write + "\n    //User Code Start\n\n}\n\n"
    kern_cpp.write(to_write)
    kern_cpp.close()
    to_write = '''
#define INTERFACE_100G
#include <string>
#include <math.h>
#include <thread>
#include <chrono>
#include <boost/program_options.hpp>

#include "../util/CommandLine.hpp"
#include "../galapagos_node.hpp"
#include "../galapagos_net_udp.hpp"
#include "kern.hpp"

#define GALAPAGOS_PORT 9000
using namespace boost::program_options;

int main (int argc, char **argv)
{
    std::vector<std::string> kern_info;
    std::vector<galapagos::external_driver<T> *> ext_drivers;
    std::unique_ptr<galapagos::node<T>> node_ptr;
'''
    to_write = to_write + "    std::string node_ip_address = \""+fpga['ip']+"\";\n"
    for index in range(len(listOfKernelIPs)):
        to_write = to_write + "    std::string ip_"+str(index)+" = \""+ listOfKernelIPs[index]+"\";\n"
    for index in range(len(listOfKernelIPs)):
        to_write = to_write + "    kern_info.push_back(ip_"+str(index)+");\n"
    to_write = to_write + '''
    galapagos::net::udp<T> my_udp(
        GALAPAGOS_PORT,
        kern_info,
        node_ip_address);
    ext_drivers.push_back(&my_udp);
    node_ptr = std::make_unique<galapagos::node<T>>(kern_info, node_ip_address, ext_drivers);
    
    //Adding Kernels
'''
    for i in fpga['kernel']:
        to_write = to_write + "    node_ptr->add_kernel("+str(i['num'])+", "+str(i['name'])+");\n"

    to_write = to_write +'''
    node_ptr -> start();
    node_ptr -> end();
}
'''
    cpu_cpp.write(to_write)

def makeTCLFiles(fpga, projectName, output_path, sim,is_gw,api_info,CAMILO_TEMP_DEBUG):
    """
    Top-level function call for TCL file generation functions.

    Args:
        fpga: a node object which has already been determined to be hw type
        projectName (string): The project name
        output_path (string): The folder path where the output TCL files will go
        sim: I think you set this to nonzero if you want your design to be
             intrumented for simulation or something
    """
    outDir = output_path + '/' + projectName + '/' + str(fpga['num'])
    #make bridge to network
    if fpga['comm'] != 'none':
        netBridge(outDir, fpga,is_gw)
    userApplicationRegion(projectName,outDir,output_path, fpga, sim,is_gw,api_info,CAMILO_TEMP_DEBUG)
    bridgeConnections(outDir, fpga, sim,is_gw)
    #if(num_debug_interfaces > 0):
    #    add_debug_interfaces(outDir, num_debug_interfaces, fpga)

    galapagos_path = str(os.environ.get('GALAPAGOS_PATH'))
    tclMain = tclMeFile( outDir + '/' + str(fpga['num']), fpga)
    tclMain.tprint(
"if { ! [info exists top_dir] } {\n\
    set top_path ${::env(GALAPAGOS_PATH)}\n\
}\n\
if { ! [info exists default_dir] } {\n\
    set default_dir " + projectName + "\n\
}\n\
"
    )
    tclMain.tprint("add_files -norecurse " + galapagos_path + "/middleware/verilog/ht_marker.v\nupdate_compile_order -fileset sources_1")
    tclMain.tprint("add_files -norecurse "+outDir+"/topLevel.v\nupdate_compile_order -fileset sources_1")
    tclMain.addSource(galapagos_path + '/shells/tclScripts/helper_functions.tcl')
    if fpga['board'] == 'sidewinder':
        tclMain.tprint('set HUNDREDG 1')
    tclMain.addSource(galapagos_path + '/shells/tclScripts/pr_standard_interfaces.tcl')
    if fpga['comm'] != 'none':
        tclMain.addSource(outDir + '/' + str(fpga['num']) + '_net.tcl')
    tclMain.addSource(outDir + '/' + str(fpga['num']) + '_app.tcl')
    tclMain.addSource(outDir + '/' + str(fpga['num']) + '_bridge_connections.tcl')

    #if(num_debug_interfaces > 0):
    #    tclMain.addSource(outDir + '/' + str(fpga['num']) + '_debug.tcl')

    if 'custom' in fpga:
        tclMain.addSource(outDir + '/' + str(fpga['num']) + '_custom.tcl')
        tclMain.addSource(galapagos_path + '/middleware/tclScripts/custom/' + fpga['custom'] + '.tcl')

    tclMain.tprint('validate_bd_design')
    tclMain.close()
