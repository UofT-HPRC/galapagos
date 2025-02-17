import copy
from tclMe import tclMeFile
from cppMe import cppMeFile
from tclMeCtrl import buildControlInboundSwitchRange, buildControlOutboundSwitch
import os

def parseAPI(topAPI,Gateway_ip):
    direct = []
    broadcast = []
    control_preprogrammed = []
    control_multiple = []
    for port in topAPI['port']:
        local_port = copy.deepcopy(port)
        if port['form'].strip().lower()=="direct":
            direct.append(local_port)
        elif port['form'].strip().lower() == "broadcast":
            broadcast.append(local_port)
        elif port['form'].strip().lower() == "control_preprogrammed":
            control_preprogrammed.append(local_port)
        elif port['form'].strip().lower() == "control_multiple":
            control_multiple.append(local_port)
    current_port = 1
    for idx in range(len(direct)):
        direct[idx]['num'] = current_port
        current_port = current_port + 1
    broadcast_start = current_port
    broadcast_mem_loc = 0
    total_broadcast_mem_length = 0
    for idx in range(len(broadcast)):
        if not isinstance(broadcast[idx]['target'],list) or len(broadcast[idx]['target'])<2:
            raise ValueError("Broadcasts need more than one target kernel")
        total_broadcast_mem_length = total_broadcast_mem_length + len(broadcast[idx]['target'])
    for idx in range(len(broadcast)):
        broadcast_length = len(broadcast[idx]['target'])
        broadcast[idx]['num'] = current_port
        broadcast[idx]['mem_start']=broadcast_mem_loc
        broadcast[idx]['num_of_elements'] = broadcast_length
        broadcast[idx]['offset'] = broadcast_start
        broadcast[idx]['total_length']= total_broadcast_mem_length
        broadcast_mem_loc = broadcast_mem_loc + broadcast_length
        current_port = current_port + 1
    control_preprogrammed_start = current_port
    for idx in range(len(control_preprogrammed)):
        control_preprogrammed[idx]['num'] = current_port
        current_port = current_port + 1
    control_multiple_start = current_port
    for idx in range(len(control_multiple)):
        control_multiple[idx]['num'] = current_port
        current_port = current_port + 1
    last_port = current_port-1
    return_dict = {"has_gateway": True, "direct": direct, "broadcast": broadcast, "control_preprogrammed": control_preprogrammed,
                   "control_multiple": control_multiple, "gateway_ip": Gateway_ip,
                   "port_regions": [broadcast_start,control_preprogrammed_start,control_multiple_start,last_port],
                   "length": last_port}
    return return_dict
def generate_api_report(api_info,header):
    if not api_info["has_gateway"]:
        return "No Gateway found in project"
    string = ""
    if len(api_info["direct"]) != 0:
        if header:
            string = string + "Direct Ports:\nname,type,port number,target\n"
        for port in api_info["direct"]:
            string = string + str(port["tag"])+",direct,"+str(port["num"])+","+str(port["target"])+"\n"
    if len(api_info["broadcast"]) != 0:
        if header:
            string = string + "\n\nBroadcast Ports:\nname,type,port number,targets\n"
        for port in api_info["broadcast"]:
            string = string + str(port["tag"])+",broadcast,"+str(port["num"])
            for target in port["target"]:
                string = string + "," + str(target)
            string = string + "\n"
    if len(api_info["control_preprogrammed"]) != 0:
        if header:
            string = string + "\n\Preprogrammed Control Ports:\nname,type,port number,target, address (hex), range\n"
        for port in api_info["control_preprogrammed"]:
            string = (string + str(port["tag"])+",direct,"+str(port["num"])+","+str(port["target"])+
                      ","+str(port["address"])+"\n")
    if len(api_info["control_multiple"]) != 0:
        if header:
            string = string + "\n\nControl Broadcast Ports:"
            string = string + "\nname,type,port number,range, target, address, target, address, ...\n"
        for port in api_info["control_multiple"]:
            string = string + str(port["tag"])+",control broadcast,"+str(port["num"])+","+str(port["maxRange"])
            for target in port["target"]:
                string = string + "," + str(target["num"])+ "," + str(target["address"])
            string = string + "\n"
    return string

def generate_parser (api_info,gatewayFile):
    number_of_MI = 4 # Control needs 2 ports
    KIP_PORT_NUMBER = 32768
    if len(api_info["direct"]) == 0:
        number_of_MI = number_of_MI - 1
    else:
        gatewayFile.createHierarchy("direct")
        gatewayFile.add_intf_pin("direct/direct_in", "xilinx.com:interface:axis_rtl:1.0", "Slave")
        gatewayFile.add_intf_pin("direct/lan_out", "xilinx.com:interface:axis_rtl:1.0", "Master")
    if len(api_info["broadcast"]) == 0:
        number_of_MI = number_of_MI - 1
    else:
        gatewayFile.createHierarchy("broadcast")
        gatewayFile.add_intf_pin("broadcast/direct_in", "xilinx.com:interface:axis_rtl:1.0", "Slave")
        gatewayFile.add_intf_pin("broadcast/lan_out", "xilinx.com:interface:axis_rtl:1.0", "Master")
    if (len(api_info["control_preprogrammed"]) == 0 and len(api_info["control_multiple"]) == 0):
        # Remove 2 ports, 1 for control, 1 for reliability KIP
        number_of_MI = number_of_MI - 2
    else:
        gatewayFile.createHierarchy("control")
        gatewayFile.add_intf_pin("control/direct_in", "xilinx.com:interface:axis_rtl:1.0", "Slave")
        # KIP_in used for reliability, if it's used
        gatewayFile.add_intf_pin("control/KIP_in", "xilinx.com:interface:axis_rtl:1.0", "Slave")
        gatewayFile.add_intf_pin("control/direct_out", "xilinx.com:interface:axis_rtl:1.0", "Master")
        gatewayFile.add_intf_pin("control/lan_out", "xilinx.com:interface:axis_rtl:1.0", "Master")
    if number_of_MI == 0:
        #TODO handle this case in cluster.xml
        raise ValueError ("Gateway requires at least one open port. Otherwise set has_api to False in cluster.xml")
    elif number_of_MI == 1:
        if len(api_info["direct"]) != 0:
            gatewayFile.makeConnection(
                'intf',
                {
                    'name': None,
                    'type': 'intf_port',
                    'port_name': 'direct_rx'
                },
                {'name': 'direct',
                 'type': 'intf',
                 'port_name': 'direct_in'
                 }
            )
            gatewayFile.makeConnection(
                'intf',
                {
                    'name': 'direct',
                    'type': 'intf',
                    'port_name': 'lan_out'
                },
                {
                    'name': None,
                    'type': 'intf_port',
                    'port_name': 'lan_tx'
                }
            )
        elif len(api_info["broadcast"]) != 0:
            gatewayFile.makeConnection(
                'intf',
                {
                    'name': None,
                    'type': 'intf_port',
                    'port_name': 'direct_rx'
                },
                {'name': 'broadcast',
                 'type': 'intf',
                 'port_name': 'direct_in'
                 }
            )
            gatewayFile.makeConnection(
                'intf',
                {
                    'name': 'broadcast',
                    'type': 'intf',
                    'port_name': 'lan_out'
                },
                {
                    'name': None,
                    'type': 'intf_port',
                    'port_name': 'lan_tx'
                }
            )
        elif (len(api_info["control_preprogrammed"]) != 0) or (len(api_info["control_multiple"]) != 0):
            gatewayFile.makeConnection(
                'intf',
                {
                    'name': None,
                    'type': 'intf_port',
                    'port_name': 'direct_rx'
                },
                {'name': 'control',
                 'type': 'intf',
                 'port_name': 'direct_in'
                 }
            )
            gatewayFile.makeConnection(
                'intf',
                {
                    'name': 'control',
                    'type': 'intf',
                    'port_name': 'lan_out'
                },
                {
                    'name': None,
                    'type': 'intf_port',
                    'port_name': 'lan_tx'
                }
            )
    else:
        gatewayFile.createHierarchy("parser")
        gatewayFile.instBlock(
        {
            'name': 'axis_switch',
            'inst': 'parser/input_switch',
            'clks': ['aclk'],
            'resetns': ['aresetn'],
            'resetns_port': 'rstn',
            'properties': ['CONFIG.NUM_SI {1}',
                           'CONFIG.NUM_MI {'+str(number_of_MI)+'}',
                           'CONFIG.HAS_TLAST {1}',
                           'CONFIG.ARB_ON_TLAST {1}'
                           ]
        }
        )
        gatewayFile.instBlock(
            {
                'name': 'axis_switch',
                'inst': 'parser/output_lan_switch',
                'clks': ['aclk'],
                'resetns': ['aresetn'],
                'resetns_port': 'rstn',
                'properties': ['CONFIG.NUM_SI {' + str(number_of_MI) + '}',
                               'CONFIG.NUM_MI {1}',
                               'CONFIG.HAS_TLAST {1}',
                               'CONFIG.ARB_ON_TLAST {1}'
                               ]
            }
        )
        gatewayFile.makeConnection(
            'intf',
            {
                'name': None,
                'type': 'intf_port',
                'port_name': 'direct_rx'
            },
            {'name': 'parser/input_switch',
             'type': 'intf',
             'port_name': 'S00_AXIS'
             }
        )
        gatewayFile.makeConnection(
            'intf',
            {
                'name': 'parser/output_lan_switch',
                'type': 'intf',
                'port_name': 'M00_AXIS'
            },
            {
                'name': None,
                'type': 'intf_port',
                'port_name': 'lan_tx'
            }
        )
        props = ["CONFIG.M00_AXIS_BASETDEST {0x00000000}","CONFIG.M00_AXIS_HIGHTDEST {0xFFFFFFFF}"]
        gatewayFile.setProperties("parser/output_lan_switch", props)
        current_port = 0
        is_props = []
        if len(api_info["direct"]) != 0:
            start_address = "0x"+hex(1)[2:].zfill(8)
            end_address = "0x"+hex((api_info["port_regions"][0]-1))[2:].zfill(8)
            str_port = str(current_port).zfill(2)+"_AXIS"
            gatewayFile.makeBufferedIntfConnection(
                {
                    'name': 'parser/input_switch',
                    'type': 'intf',
                    'port_name': 'M'+str_port
                },
                {
                    'name': 'direct',
                    'type': 'intf',
                    'port_name': 'direct_in'
                 },
                "parser/input_switch_d",
                1
            )
            gatewayFile.makeBufferedIntfConnection(
                {
                    'name': 'direct',
                    'type': 'intf',
                    'port_name': 'lan_out'
                },
                {
                    'name': 'parser/output_lan_switch',
                    'type': 'intf',
                    'port_name': 'S' + str_port
                },
                "parser/output_lan_switch_d",
                1
            )
            is_props.append("CONFIG.M" + str_port + "_BASETDEST {" + start_address + "}")
            is_props.append("CONFIG.M" + str_port + "_HIGHTDEST {" + end_address   + "}")
            current_port = current_port + 1
        if len(api_info["broadcast"]) != 0:
            start_address = "0x"+hex(api_info["port_regions"][0])[2:].zfill(8)
            end_address = "0x"+hex((api_info["port_regions"][1]-1))[2:].zfill(8)
            str_port = str(current_port).zfill(2)+"_AXIS"
            gatewayFile.makeBufferedIntfConnection(
                {
                    'name': 'parser/input_switch',
                    'type': 'intf',
                    'port_name': 'M'+str_port
                },
                {
                    'name': 'broadcast',
                    'type': 'intf',
                    'port_name': 'direct_in'
                 },
                "parser/input_switch_b",
                1
            )
            gatewayFile.makeBufferedIntfConnection(
                {
                    'name': 'broadcast',
                    'type': 'intf',
                    'port_name': 'lan_out'
                },
                {
                    'name': 'parser/output_lan_switch',
                    'type': 'intf',
                    'port_name': 'S' + str_port
                },
                "parser/output_lan_switch_int_b",
                1
            )
            is_props.append("CONFIG.M" + str_port + "_BASETDEST {" + start_address + "}")
            is_props.append("CONFIG.M" + str_port + "_HIGHTDEST {" + end_address   + "}")
            current_port = current_port + 1
        if (len(api_info["control_preprogrammed"]) != 0) or (len(api_info["control_multiple"]) != 0):
            start_address = "0x"+hex(api_info["port_regions"][1])[2:].zfill(8)
            #end_address = "0x"+hex((api_info["port_regions"][2]-1))[2:].zfill(8)
            end_address = "0x" + hex((api_info["port_regions"][3]))[2:].zfill(8)
            str_port = str(current_port).zfill(2)+"_AXIS"
            gatewayFile.makeBufferedIntfConnection(
                {
                    'name': 'parser/input_switch',
                    'type': 'intf',
                    'port_name': 'M'+str_port
                },
                {
                    'name': 'control',
                    'type': 'intf',
                    'port_name': 'direct_in'
                 },
                "parser/input_switch_c",
                1
            )
            gatewayFile.makeBufferedIntfConnection(
                {
                    'name': 'control',
                    'type': 'intf',
                    'port_name': 'lan_out'
                },
                {
                    'name': 'parser/output_lan_switch',
                    'type': 'intf',
                    'port_name': 'S' + str_port
                },
                "parser/output_lan_switch_c",
                1
            )
            is_props.append("CONFIG.M" + str_port + "_BASETDEST {" + start_address + "}")
            is_props.append("CONFIG.M" + str_port + "_HIGHTDEST {" + end_address   + "}")
            current_port = current_port + 1
            # KIP Ports go directly to the RPN LAN TX
            str_port = str(current_port).zfill(2)+"_AXIS"
            kip_port = str(hex(KIP_PORT_NUMBER))
            gatewayFile.makeBufferedIntfConnection(
                {
                    'name': 'parser/input_switch',
                    'type': 'intf',
                    'port_name': 'M'+str_port
                },
                {
                    'name': 'control',
                    'type': 'intf',
                    'port_name': 'KIP_in'
                 },
                "parser/input_switch_KIP",
                1
            )
            is_props.append("CONFIG.M" + str_port + "_BASETDEST {" + kip_port + "}")
            is_props.append("CONFIG.M" + str_port + "_HIGHTDEST {" + kip_port + "}")

        gatewayFile.setProperties("parser/input_switch", is_props)

def implement_direct_section(gatewayFile):
    gatewayFile.instBlock(
        {
            'name': 'direct_channel',
            'inst': 'direct/direct_processor',
            'clks': ['ap_clk'],
            'resetns': ['ap_rst_n'],
            'resetns_port': 'rstn',
        }
    )
    gatewayFile.makeBufferedIntfConnection(
        {
            'name': 'direct',
            'type': 'intf',
            'port_name': 'direct_in'
        },
        {
            'name': 'direct/direct_processor',
            'type': 'intf',
            'port_name': 'direct_in'
        },
        "direct/direct_in",
        1
    )
    gatewayFile.makeBufferedIntfConnection(
        {
            'name': 'direct/direct_processor',
            'type': 'intf',
            'port_name': 'lan_out'
        },
        {
            'name': 'direct',
            'type': 'intf',
            'port_name': 'lan_out'
        },
        "direct/lan_out",
        1
    )
    return
def implement_broadcast_section(gatewayFile):
    gatewayFile.instBlock(
        {
            'name': 'broadcast_localizer',
            'inst': 'broadcast/localizer',
            'clks': ['ap_clk'],
            'resetns': ['ap_rst_n'],
            'resetns_port': 'rstn',
        }
    )
    gatewayFile.instBlock(
        {
            'name': 'broadcast_repeater',
            'inst': 'broadcast/repeater',
            'clks': ['ap_clk'],
            'resetns': ['ap_rst_n'],
            'resetns_port': 'rstn',
        }
    )
    gatewayFile.instBlock(
        {
            'name': 'axis_data_fifo',
            'inst': 'broadcast/repeater_ff',
            'clks': ['s_axis_aclk'],
            'resetns': ['s_axis_aresetn'],
            'resetns_port': 'rstn',
        }
    )
    gatewayFile.makeBufferedIntfConnection(
        {
            'name': 'broadcast',
            'type': 'intf',
            'port_name': 'direct_in'
        },
        {
            'name': 'broadcast/localizer',
            'type': 'intf',
            'port_name': 'direct_in'
        },
        "broadcast/direct_in",
        1
    )
    gatewayFile.makeBufferedIntfConnection(
        {
            'name': 'broadcast/localizer',
            'type': 'intf',
            'port_name': 'bc_info_out'
        },
        {
            'name': 'broadcast/repeater',
            'type': 'intf',
            'port_name': 'bc_info_in'
        },
        "broadcast/loc_rep",
        1
    )
    gatewayFile.makeBufferedIntfConnection(
        {
            'name': 'broadcast/repeater',
            'type': 'intf',
            'port_name': 'fifo_out'
        },
        {
            'name': 'broadcast/repeater_ff',
            'type': 'intf',
            'port_name': 'S_AXIS'
        },
        "broadcast/ff_o",
        1
    )
    gatewayFile.makeBufferedIntfConnection(
        {
            'name': 'broadcast/repeater_ff',
            'type': 'intf',
            'port_name': 'M_AXIS'
        },
        {
            'name': 'broadcast/repeater',
            'type': 'intf',
            'port_name': 'fifo_in'
        },
        "broadcast/ff_i",
        1
    )
    gatewayFile.makeBufferedIntfConnection(
        {
            'name': 'broadcast/repeater',
            'type': 'intf',
            'port_name': 'lan_out'
        },
        {
            'name': 'broadcast',
            'type': 'intf',
            'port_name': 'lan_out'
        },
        "broadcast/lan_out",
        1
    )
    return

def implement_control_reliability_instance(gatewayFile, parent_hierarchy, LAN_timeout=500):
    # Parameters
    num_nodes = gatewayFile.fpga['total_node_num'] # Total number of FPGA nodes in this cluster, including gateway
    num_clusters = gatewayFile.fpga['num_clusters']
    num_kernels = gatewayFile.fpga['total_kernel_num'] # Total number of FPGA kernels in this cluster, including gateway
    KIP_PORT_NUMBER = 32768
    # Initial modules
    hierarchy_name = parent_hierarchy + '/reliability_protocol_node'
    gatewayFile.createHierarchy(hierarchy_name)
    cluster_id = gatewayFile.fpga['cluster_id']
    gatewayFile.instBlock(
        {
            'name': 'xlconstant',
            'inst':  hierarchy_name + '/cluster_id',
            'properties': [ 
                            'CONFIG.CONST_WIDTH {32}',
                            'CONFIG.CONST_VAL {' + str(cluster_id) + '}'
                        ]
        }
    )
    # Build incoming WAN reception path
    gatewayFile.instBlock(
        {
            'name': 'rpn_WAN_RX',
            'inst':  hierarchy_name + '/rpn_WAN_RX',
            'clks': ['i_clk'],
            'resetns': ['i_ap_rst_n'],
            'resetns_port': 'rstn'
        }
    )
    gatewayFile.makeConnection(
        'net', 
        {
            'type': 'pin',
            'name': hierarchy_name + '/cluster_id',
            'port_name': 'dout'
        },
        {
            'type': 'pin',
            'name': hierarchy_name + '/rpn_WAN_RX',
            'port_name': 'i_cluster_id'
        }
    )
    #TODO: WAN RX doesn't actually need gateway IP address, tie off to 0
    gatewayFile.instBlock(
        {
            'name': 'xlconstant',
            'inst':  hierarchy_name + '/const_0',
            'properties': [ 
                            'CONFIG.CONST_WIDTH {32}',
                            'CONFIG.CONST_VAL {0}'
                        ]
        }
    )
    gatewayFile.makeConnection(
        'net', 
        {
            'type': 'pin',
            'name': hierarchy_name + '/const_0',
            'port_name': 'dout'
        },
        {
            'type': 'pin',
            'name': hierarchy_name + '/rpn_WAN_RX',
            'port_name': 'i_gateway_ip_address'
        }
    )
    # Create and connect KIP Port Number
    gatewayFile.instBlock(
        {
            'name': 'xlconstant',
            'inst':  hierarchy_name + '/KIP_port_number',
            'properties': [ 
                            'CONFIG.CONST_WIDTH {16}',
                            'CONFIG.CONST_VAL {' + str(KIP_PORT_NUMBER) + '}'
                        ]
        }
    )
    gatewayFile.makeConnection(
        'net', 
        {
            'type': 'pin',
            'name': hierarchy_name + '/KIP_port_number',
            'port_name': 'dout'
        },
        {
            'type': 'pin',
            'name': hierarchy_name + '/rpn_WAN_RX',
            'port_name': 'i_KIP_port_number'
        }
    )
    gatewayFile.instBlock(
        {
            'name': 'blk_mem_gen',
            'inst':  hierarchy_name + '/WAN_RX_sequence_number_BRAM'
        }
    )
    properties = [
        'CONFIG.use_bram_block {Stand_Alone}',
        'CONFIG.Memory_Type {Single_Port_RAM}',
        'CONFIG.ENABLE_32BIT_ADDRESS {true}',
        'CONFIG.Register_PortA_Output_of_Memory_Primitives {false}',
        'CONFIG.Write_Depth_A {' + str(num_clusters) + '}', # BRAM has dummy Node 0
        'CONFIG.Load_Init_File {false}', # Instead of COE, initialize all sequence numbers to 0
        'CONFIG.Fill_Remaining_Memory_Locations {true}',
        'CONFIG.Remaining_Memory_Locations {0}'
    ]
    gatewayFile.setProperties(hierarchy_name + '/WAN_RX_sequence_number_BRAM', properties)
    gatewayFile.makeConnection(
        'intf',
        {
            'name': hierarchy_name + '/rpn_WAN_RX',
            'type':'intf',
            'port_name':'to_sequence_number_BRAM'
        },
        {
            'name': hierarchy_name + '/WAN_RX_sequence_number_BRAM',
            'type':'intf',
            'port_name':'BRAM_PORTA'
        }
    )
    # Build outgoing LAN transmission path
    # Create RPN LAN TX Pathway
    gatewayFile.instBlock(
        {
            'name': 'rpn_LAN_node_finder',
            'inst':  hierarchy_name + '/rpn_LAN_node_finder',
            'clks': ['i_clk'],
            'resetns': ['i_ap_rst_n'],
            'resetns_port': 'rstn'
        }
    )
    # This BRAM is used by the LAN Node Finder to convert between kernel TDEST and destination node
    gatewayFile.instBlock(
        {
            'name': 'blk_mem_gen',
            'inst':  hierarchy_name + '/kernel_to_node_ROM'
        }
    )
    properties = [
        'CONFIG.use_bram_block {Stand_Alone}',
        'CONFIG.Memory_Type {Single_Port_ROM}',
        'CONFIG.ENABLE_32BIT_ADDRESS {true}',
        'CONFIG.Register_PortA_Output_of_Memory_Primitives {false}',
        'CONFIG.Write_Depth_A {' + str(num_kernels) + '}',
        'CONFIG.Load_Init_File {True}',
        'CONFIG.Coe_File $top_path/projects/$default_dir/kernel_to_node.coe' # Every cluster has one of these written for it
    ]
    gatewayFile.setProperties(hierarchy_name + '/kernel_to_node_ROM', properties)
    gatewayFile.makeConnection(
        'intf',
        {
            'name': hierarchy_name + '/rpn_LAN_node_finder',
            'type': 'intf',
            'port_name': 'kernel_to_node_ROM'
        },
        {
            'name': hierarchy_name + '/kernel_to_node_ROM',
            'type': 'intf',
            'port_name': 'BRAM_PORTA'
        }
    )
    gatewayFile.instBlock(
        {
            'name': 'rpn_LAN_TX',
            'inst':  hierarchy_name + '/rpn_LAN_TX',
            'clks': ['i_clk'],
            'resetns': ['i_ap_rst_n'],
            'resetns_port': 'rstn',
            'properties': [ 
                            'CONFIG.ACK_TIMEOUT {' + str(LAN_timeout) + '}',
                        ]
        }
    )
    # Node ID of the gateway is 0
    gatewayFile.makeConnection(
        'net', 
        {
            'type': 'pin',
            'name': hierarchy_name + '/const_0',
            'port_name': 'dout'
        },
        {
            'type': 'pin',
            'name': hierarchy_name + '/rpn_LAN_TX',
            'port_name': 'i_node_id'
        }
    )
    # TODO: For now, LAN Sequence Number Initialization has been disabled. Instead, tie off sequence_numbers_initialized to 1
    gatewayFile.instBlock(
        {
            'name': 'xlconstant',
            'inst':  hierarchy_name + '/const_1',
            'properties': [ 
                            'CONFIG.CONST_WIDTH {1}',
                            'CONFIG.CONST_VAL {1}'
                        ]
        }
    )
    gatewayFile.makeConnection(
        'net', 
        {
            'type': 'pin',
            'name': hierarchy_name + '/const_1',
            'port_name': 'dout'
        },
        {
            'type': 'pin',
            'name': hierarchy_name + '/rpn_LAN_TX',
            'port_name': 'i_sequence_numbers_initialized'
        }
    )
    gatewayFile.instBlock(
        {
            'name': 'blk_mem_gen',
            'inst':  hierarchy_name + '/LAN_TX_sequence_number_BRAM'
        }
    )
    properties = [
        'CONFIG.use_bram_block {Stand_Alone}',
        'CONFIG.Memory_Type {Single_Port_RAM}',
        'CONFIG.ENABLE_32BIT_ADDRESS {true}',
        'CONFIG.Register_PortA_Output_of_Memory_Primitives {false}',
        'CONFIG.Write_Depth_A {' + str(num_nodes) + '}', # BRAM has dummy Node 0
        'CONFIG.Load_Init_File {false}', # Instead of COE, initialize all sequence numbers to 0
        'CONFIG.Fill_Remaining_Memory_Locations {true}',
        'CONFIG.Remaining_Memory_Locations {0}'
    ]
    gatewayFile.setProperties(hierarchy_name + '/LAN_TX_sequence_number_BRAM', properties)
    gatewayFile.makeConnection(
        'intf',
        {
            'name': hierarchy_name + '/rpn_LAN_TX',
            'type': 'intf',
            'port_name': 'node_to_LAN_seq_num_BRAM'
        },
        {
            'name': hierarchy_name + '/LAN_TX_sequence_number_BRAM',
            'type': 'intf',
            'port_name': 'BRAM_PORTA'
        }
    )
    gatewayFile.makeConnection(
        'intf',
        {
            'name': hierarchy_name + '/rpn_LAN_node_finder',
            'type': 'intf',
            'port_name': 'to_LAN_TX'
        },
        {
            'name': hierarchy_name + '/rpn_LAN_TX',
            'type': 'intf',
            'port_name': 'from_LAN_node_finder'
        }
    )

def write_control_preprogrammed_coe_files(sorted_array, outDir):
    # Two files have to be written: 
    # Preprogrammed reg addr: Holds the target register addresses based on port number
    # Preprogrammed TDEST: holds the target tdest based on port number
    reg_addr_file = open(outDir + '/ctrl_preprogrammed_reg_addr.coe', 'w')
    reg_addr_file.write('memory_initialization_radix=10;\n')
    reg_addr_file.write('memory_initialization_vector=\n')
    tdest_file = open(outDir + '/ctrl_preprogrammed_tdest.coe', 'w')
    tdest_file.write('memory_initialization_radix=10;\n')
    tdest_file.write('memory_initialization_vector=\n')
    # Control ports are guaranteed to be an unbroken sequence of numbers, but the ports may not start from 0. Therefore, we need to fill the arrays with 0's until we get to the first entry
    first_port = sorted_array[0]['num']
    for i in range(0, first_port):
        if i == 0:
            reg_addr_file.write('0')
            tdest_file.write('0')
        else:
            reg_addr_file.write(',0')
            tdest_file.write(',0')
    # Now, write control port values into the COE files
    for i in range(len(sorted_array)):
        control_entry = sorted_array[i]
        port_num = control_entry['num']
        # Convert register address from hex to decimal
        dest_register_address = str(int(control_entry['address'], 16))
        # TDEST ROM entries are of the following format:
        # | TDEST | IS_INFRA |
        # |8     1|     0    |
        # For now, Infra is not supported, so set IS_INFRA to 0
        # For consistency, TDEST will remain decimal
        tdest = str(int(control_entry['target']) << 1)
        if port_num != 0:
            dest_register_address = ',' + dest_register_address
            tdest = ',' + tdest
        reg_addr_file.write(dest_register_address)
        tdest_file.write(tdest)
    reg_addr_file.close()
    tdest_file.close()

def implement_control_section(array,multiple_array,gatewayFile,outDir):
    # All control modules should be in the following format:
    # have from_WAN and to_LAN AXI-Stream connections
    # Parameters
    has_reliability = True
    hierarchy_name = 'control'
    # gatewayFile.createHierarchy(hierarchy_name)
    # 1. Determine what type of control modules to build
    gateway_control_modules = []
    if (len(array)) > 0:
        gateway_control_modules.append('gw_ctrl_preprogrammed')
        # Sort control ports in order of ascending port number
        sorted_array = sorted(array, key=lambda k: k['num'])
        write_control_preprogrammed_coe_files(sorted_array, outDir)
    num_ctrl_modules = len(gateway_control_modules)
    # 2. Build control modules
    for module in gateway_control_modules:
        gatewayFile.instBlock(
            {
                'name': module,
                'inst':  hierarchy_name + '/' + module + '_0',
                'clks': ['i_clk'],
                'resetns': ['i_ap_rst_n'],
                'resetns_port': 'rstn'
            }
        )
    # Make module-specific adjustments/parameters here
    # Preprogrammed control requires ROMS to hold register addresses and TDEST
    if len(array) > 0:
        # Each ROM will be indexed by port number, so make sure it's big enough to hold the largest port
        preprogrammed_ROM_capacity = sorted_array[-1]['num'] + 1
        gatewayFile.instBlock(
            {
                'name': 'blk_mem_gen',
                'inst':  hierarchy_name + '/preprogrammed_reg_addr_ROM'
            }
        )
        properties = [
            'CONFIG.use_bram_block {Stand_Alone}',
            'CONFIG.Memory_Type {Single_Port_ROM}',
            'CONFIG.ENABLE_32BIT_ADDRESS {true}',
            'CONFIG.Register_PortA_Output_of_Memory_Primitives {false}',
            'CONFIG.Write_Width_A {64}',
            'CONFIG.Write_Depth_A {' + str(preprogrammed_ROM_capacity) + '}',
            'CONFIG.Load_Init_File {True}',
            'CONFIG.Coe_File $top_path/projects/$default_dir/0/ctrl_preprogrammed_reg_addr.coe'
        ]   
        gatewayFile.setProperties(hierarchy_name + '/preprogrammed_reg_addr_ROM', properties) 
        gatewayFile.makeConnection(
            'intf',
            {
                'name': hierarchy_name + '/gw_ctrl_preprogrammed_0',
                'type': 'intf',
                'port_name': 'to_register_address_ROM'
            },
            {
                'name': hierarchy_name + '/preprogrammed_reg_addr_ROM',
                'type': 'intf',
                'port_name': 'BRAM_PORTA'
            }
        )
        gatewayFile.instBlock(
            {
                'name': 'blk_mem_gen',
                'inst':  hierarchy_name + '/preprogrammed_tdest_ROM'
            }
        )
        properties = [
            'CONFIG.use_bram_block {Stand_Alone}',
            'CONFIG.Memory_Type {Single_Port_ROM}',
            'CONFIG.ENABLE_32BIT_ADDRESS {true}',
            'CONFIG.Register_PortA_Output_of_Memory_Primitives {false}',
            'CONFIG.Write_Depth_A {' + str(preprogrammed_ROM_capacity) + '}',
            'CONFIG.Load_Init_File {True}',
            'CONFIG.Coe_File $top_path/projects/$default_dir/0/ctrl_preprogrammed_tdest.coe'
        ]   
        # 'CONFIG.Coe_File $top_path/projects/$default_dir/kernel_to_node.coe'
        gatewayFile.setProperties(hierarchy_name + '/preprogrammed_tdest_ROM', properties) 
        gatewayFile.makeConnection(
            'intf',
            {
                'name': hierarchy_name + '/gw_ctrl_preprogrammed_0',
                'type': 'intf',
                'port_name': 'to_tdest_ROM'
            },
            {
                'name': hierarchy_name + '/preprogrammed_tdest_ROM',
                'type': 'intf',
                'port_name': 'BRAM_PORTA'
            }
        )
    # 3. Connect control outputs and inputs together
    if num_ctrl_modules > 1:
        # Outbound path
        # Gateway kernels can only send LAN messages
        buildControlOutboundSwitch(gatewayFile, hierarchy_name + '/ctrl_to_LAN_switch', num_ctrl_modules)
        i = 0
        for module in gateway_control_modules:
            if i < 10:
                dest_port_name = 'S0' + str(i) + '_AXIS'
            else:
                dest_port_name = 'S' + str(i) + '_AXIS'
            gatewayFile.makeConnection(
                'intf',
                {
                    'name': hierarchy_name + '/' + module + '_0',
                    'type': 'intf',
                    'port_name': 'to_LAN'
                },
                {
                    'name': hierarchy_name + '/ctrl_to_LAN_switch',
                    'type': 'intf',
                    'port_name': dest_port_name
                }
            )
            i += 1
        # Inbound path
        # Route TDEST based on port number
        #TODO: This part is untested. Also, if other modules are added their ports must be added here too
        # Modules are in a list, so order is fixed
        port_range_list = []
        for module in gateway_control_modules:
            if module == 'gw_ctrl_preprogrammed':
                # Port names are automatically sorted in order
                for entry in array:
                    port_range_list.append([array[0]['num'], array[-1]['num']])
        buildControlInboundSwitch(gatewayFile, hierarchy_name + '/ctrl_from_nb_switch', num_ctrl_modules, port_range_list)
        i = 0
        for module in gateway_control_modules:
            if i < 10:
                src_port_name = 'M0' + str(i) + '_AXIS'
            else:
                src_port_name = 'M' + str(i) + '_AXIS'
            gatewayFile.makeConnection(
                'intf',
                {
                    'name': hierarchy_name + '/ctrl_from_nb_switch',
                    'type': 'intf',
                    'port_name': src_port_name
                },
                {
                    'name': hierarchy_name + '/' + module + '_0',
                    'type': 'intf',
                    'port_name': 'from_WAN'
                }
            )
            i += 1            
    # 4. If reliability is used, build reliability module, and connect control modules
    if has_reliability:
        implement_control_reliability_instance(gatewayFile, hierarchy_name)
        # Connect outbound path of control modules
        if num_ctrl_modules > 1:
            src_kernel = hierarchy_name + '/ctrl_to_LAN_switch'
            src_port_name = 'M00_AXIS'
        else:
            src_kernel = hierarchy_name + '/' + gateway_control_modules[0] + '_0'
            src_port_name = 'to_LAN'
        gatewayFile.makeConnection(
            'intf',
            {
                'name': src_kernel,
                'type': 'intf',
                'port_name': src_port_name
            },
            {
                'name': hierarchy_name + '/reliability_protocol_node/rpn_LAN_node_finder',
                'type': 'intf',
                'port_name': 'from_ctrl_LAN'
            }
        )
        # Connect inbound path of control modules
        if num_ctrl_modules > 1:
            dest_kernel = hierarchy_name + '/ctrl_from_nb_switch'
            dest_port_name = 'S00_AXIS'
        else:
            dest_kernel = hierarchy_name + '/' + gateway_control_modules[0] + '_0'
            dest_port_name = 'from_WAN'
        gatewayFile.makeConnection(
            'intf',
            {
                'name': hierarchy_name + '/reliability_protocol_node/rpn_WAN_RX',
                'type': 'intf',
                'port_name': 'to_ctrl'
            },
            {
                'name': dest_kernel,
                'type': 'intf',
                'port_name': dest_port_name
            }
        )
    # All incoming packets will first go through a network bridge to strip headers
    gatewayFile.instBlock(
        {
            'name': 'control_gw_network_bridge',
            'inst':  hierarchy_name + '/gw_rx_network_bridge',
            'clks': ['i_clk'],
            'resetns': ['i_ap_rst_n'],
            'resetns_port': 'rstn'
        }
    )
    # Connect Gateway RX network bridge to control or reliability modules
    # Case 1: If reliability is used, everything goes through RPN
    if has_reliability:
        dest_kernel = hierarchy_name + '/reliability_protocol_node/rpn_WAN_RX'
        dest_port_name = 'from_nb'
    # Case 2: If there are multiple control modules, connect to inbound switch
    elif num_ctrl_modules > 1:
        dest_kernel = hierarchy_name + '/ctrl_from_nb_switch'
        dest_port_name = 'S00_AXIS'
    # Case 3: Only 1 control module, connect directly
    else:
        dest_kernel = hierarchy_name + '/' + gateway_control_modules[0] + '_0'
        dest_port_name = 'from_WAN'
    gatewayFile.makeConnection(
        "intf",
        {
            'name': hierarchy_name + '/gw_rx_network_bridge',
            'type': 'intf',
            'port_name': 'to_ctrl'
        },
        {
            'name': dest_kernel,
            'type': 'intf',
            'port_name': dest_port_name
        },
    )
    # 5. Connect inputs and outputs to the parser
    # Outbound path
    # Case 1: If reliability is enabled, everything goes through RPN
    if has_reliability:
        src_kernel = hierarchy_name + '/reliability_protocol_node/rpn_LAN_TX'
        src_port_name = 'to_nb_LAN'
    # Case 2: More than 1 gateway instance, connect to switch
    elif num_ctrl_modules > 1:
        src_kernel = hierarchy_name + '/ctrl_to_LAN_switch'
        src_port_name = 'M00_AXIS'
    # Case 3: Only 1 gateway instance
    else:
        src_kernel = hierarchy_name + '/' + gateway_control_modules[0] + '_0'
        src_port_name = 'to_LAN'
    gatewayFile.makeConnection(
        'intf',
        {
            'name': src_kernel,
            'type': 'intf',
            'port_name': src_port_name
        },
        {
            'name': hierarchy_name,
            'type': 'intf',
            'port_name': 'lan_out'
        }
    )
    # Special case: if reliability is used, outbound path must connect KIP connection to RPN WAN RX
    if has_reliability:
        gatewayFile.makeConnection(
            'intf',
            {
                'name': hierarchy_name + '/reliability_protocol_node/rpn_WAN_RX',
                'type': 'intf',
                'port_name': 'to_nb_KIP'
            },
            {
                'name': hierarchy_name,
                'type': 'intf',
                'port_name': 'direct_out'
            }
        )
    # Inbound Path
    # All inbound WAN packets go through the network bridge
    gatewayFile.makeConnection(
        "intf",
        {
            'name': hierarchy_name,
            'type': 'intf',
            'port_name': 'direct_in'
        },
        {
            'name': hierarchy_name + '/gw_rx_network_bridge',
            'type': 'intf',
            'port_name': 'from_network_bridge'
        },
    )
    # If reliability is used, route KIP packets to reliability. If not, tie it off
    if has_reliability:
        gatewayFile.makeConnection(
            "intf",
            {
                'name': hierarchy_name,
                'type': 'intf',
                'port_name': 'KIP_in'
            },
            {
                'name': hierarchy_name + '/reliability_protocol_node/rpn_LAN_TX',
                'type': 'intf',
                'port_name': 'from_nb'
            },
        )
    else:
        tcl_user_app.instBlock(
            {
                'name': 'xlconstant',
                'inst':  hierarchy_name + '/KIP_in_tieoff_tready',
                'properties': [ 
                                'CONFIG.CONST_WIDTH {1}',
                                'CONFIG.CONST_VAL {1}'
                            ]
            }
        )
        tcl_user_app.instBlock(
            {
                'name': 'axis_register_slice',
                'inst':  hierarchy_name + '/KIP_in_tieoff',
                'clks': ['aclk'],
                'resetns': ['aresetn'],
                'resetns_port': 'rstn'
            }
        )
        tcl_user_app.makeConnection(
            'intf',
            {
                'name': hierarchy_name,
                'type':'intf',
                'port_name': 'KIP_in'
            },
            {
                'name': hierarchy_name + '/KIP_in_tieoff',
                'type':'intf',
                'port_name':'S_AXIS'
            }
        ) 
        tcl_user_app.makeConnection(
            'net', 
            {
                'type': 'pin',
                'name': hierarchy_name + '/KIP_in_tieoff_tready',
                'port_name': 'dout'
            },
            {
                'type': 'pin',
                'name': hierarchy_name + '/KIP_in_tieoff',
                'port_name': 'M_AXIS_tready'
            }
        )
    return
def query_API(outDir,topAPI,Gateway_ip):
    api_info = parseAPI(topAPI,Gateway_ip)
    gatewayInfoFile = open(outDir + '/gateway_info.txt', "w")
    gatewayInfoFile.write(generate_api_report(api_info, True))
    gatewayInfoFile.close()
    gatewayInfoFile2 = open(outDir + '/gateway_info.csv', "w")
    gatewayInfoFile2.write(generate_api_report(api_info, False))
    gatewayInfoFile2.close()
    return api_info
def makeGWFiles (fpga, outDir,topAPI,Gateway_ip):
    api_info= query_API(outDir,topAPI,Gateway_ip)
    gatewayFile = tclMeFile(outDir + '/0_gateway', fpga)
    generate_parser(api_info,gatewayFile)
    if (len(api_info["control_preprogrammed"]) == 0) and (len(api_info["control_multiple"]) == 0):
        gatewayFile.addVerilog(str(os.environ.get('GALAPAGOS_PATH'))+"/middleware/verilog/direct_tieoff.v")
    if len(api_info["direct"])!= 0:
        implement_direct_section(gatewayFile)
    if len(api_info["broadcast"])!= 0:
        implement_broadcast_section(gatewayFile)
    if (len(api_info["control_preprogrammed"])!= 0) or (len(api_info["control_multiple"])!= 0):
        implement_control_section(api_info["control_preprogrammed"],api_info["control_multiple"], gatewayFile,outDir)
        gatewayFile.makeBufferedIntfConnection(
            {
                'name': 'control',
                'type': 'intf',
                'port_name': 'direct_out'
            },
            {
                'name': None,
                'type': 'intf_port',
                'port_name': 'Direct_port'
            },
            "direct_out",
            1
        )
    else:
        gatewayFile.instModule(
            {
                'name': 'direct_tieoff',
                'inst': 'dt',
                'clks': ['aclk'],
                'resetns': ['aresetn'],
                'resetns_port': 'rstn',
            }
        )
        gatewayFile.makeConnection(
            "intf",
            {
                'name': 'dt',
                'type': 'intf',
                'port_name': 'dt'
            },
            {
                'name': None,
                'type': 'intf_port',
                'port_name': 'Direct_port'
            },
        )
    gatewayFile.close()
    return api_info
def write_direct_channel(CF,array):
    CF.import_libs(["<stdint.h>","<stdlib.h>","<iostream>","<iomanip>","<string.h>","<stdio.h>","\"hls_stream.h\"",
                    "\"ap_int.h\"","\"ap_axi_sdata.h\""])
    CF.start_function("direct_channel",[["hls::stream< "+CF.return_stream(512,48,0,16)+" >","&direct_in"],
                                        ["hls::stream< "+CF.return_stream(512,8,8,8)+" >","&lan_out"]])
    CF.set_pragma("HLS INTERFACE ap_ctrl_none port=return")
    CF.set_axis_pragmas(["direct_in","lan_out"])
    length_of_mem = len(array)+1
    dest_array = [0]*(length_of_mem)
    for elem in array:
        dest_array[elem["num"]] = elem["target"]
    CF.declare_var(CF.return_stream(512,48,0,16),"direct_in_target")
    CF.declare_var(CF.return_stream(512,8,8,8), "lan_out_target")
    #CF.cline("lan_out_target.last = 0")
    CF.declare_array("ap_uint<16>", "destination",length_of_mem,dest_array)
    if (length_of_mem > 50):
        CF.set_pragma("HLS bind_storage variable=destination type=ROM_1P impl=BRAM")
    else:
        CF.set_pragma("HLS bind_storage variable=destination type=ROM_1P impl=LUTRAM")
    CF.clines(["direct_in_target = direct_in.read()", "ap_uint<8> saved_dest = destination[direct_in_target.dest]"])
    CF.start_block("while", "direct_in_target.last == 0")
    CF.set_pragma("HLS PIPELINE")
    CF.start_block("if", "(!lan_out.full()) && (!direct_in.empty())")
    CF.cline("direct_in_target = direct_in.read()")  # new
    CF.object_write("lan_out_target",["data","dest","id","user","keep","last"],
                    ["direct_in_target.data","saved_dest",0,0,
                     "direct_in_target.keep","direct_in_target.last"])
    CF.cline("lan_out.write(lan_out_target)")
    # CF.start_block("if", "direct_in_target.last == 0")
    # CF.cline("direct_in_target = direct_in.read()")
    # CF.end_block()
    CF.end_block()
    CF.end_block()
    CF.end_function()
def write_broadcast_localizer(CF,array):
    CF.import_libs(["<stdint.h>","<stdlib.h>","<iostream>","<iomanip>","<string.h>","<stdio.h>","\"hls_stream.h\"",
                    "\"ap_int.h\"","\"ap_axi_sdata.h\""])
    CF.start_function("broadcast_localizer", [["hls::stream< " + CF.return_stream(512, 48, 0, 16) + " >", "&direct_in"],
                                         ["hls::stream< " + CF.return_stream(512, 8, 0, 16) + " >", "&bc_info_out"]])
    #User is the number of reps, dest is the start address in the mem structure
    CF.set_pragma("HLS INTERFACE ap_ctrl_none port=return")
    CF.set_axis_pragmas(["direct_in", "bc_info_out"])
    length_of_mem = len(array)
    dest_array = [0] * (length_of_mem)
    for elem in array:
        dest_array[elem["num"]-elem["offset"]] = elem["mem_start"]+ (elem["num_of_elements"]<<16)
    CF.declare_var(CF.return_stream(512, 48, 0, 16), "direct_in_target")
    CF.declare_var(CF.return_stream(512, 8, 0, 16), "bc_info_target")
    CF.declare_array("ap_uint<24>", "destination", length_of_mem, dest_array)
    if (length_of_mem > 50):
        CF.set_pragma("HLS bind_storage variable=destination type=ROM_1P impl=BRAM")
    else:
        CF.set_pragma("HLS bind_storage variable=destination type=ROM_1P impl=LUTRAM")
    CF.cline("direct_in_target = direct_in.read()")
    # CF.clines(["direct_in_target = direct_in.read()","bc_info_target.last = 0"])
    CF.cline("ap_uint<24> saved_dest = destination[direct_in_target.dest-" + str(array[0]["offset"]) + "]")
    CF.start_block("while", "direct_in_target.last == 0")
    CF.set_pragma("HLS PIPELINE")
    CF.start_block("if", "(!bc_info_out.full()) && (!direct_in.empty())")
    CF.cline("direct_in_target = direct_in.read()")
    CF.object_write("bc_info_target", ["data", "dest", "user", "keep", "last"],
                    ["direct_in_target.data", "saved_dest.range(15,0)", "saved_dest.range(23,16)",
                     "direct_in_target.keep", "direct_in_target.last"])
    CF.cline("bc_info_out.write(bc_info_target)")
    # CF.start_block("if", "direct_in_target.last == 0")
    # CF.cline("direct_in_target = direct_in.read()")
    # CF.end_block()
    CF.end_block()
    CF.end_block()
    CF.end_function()
def write_broadcast_repeater (CF, array):
    CF.import_libs(
        ["<stdint.h>", "<stdlib.h>", "<iostream>", "<iomanip>", "<string.h>", "<stdio.h>", "\"hls_stream.h\"",
         "\"ap_int.h\"", "\"ap_axi_sdata.h\""])
    CF.start_function("broadcast_repeater", [["hls::stream< " + CF.return_stream(512, 8, 0, 16) + " >", "&bc_info_in"],
                                             ["hls::stream< " + CF.return_stream(512, 0, 0, 0) + " >", "&fifo_out"],
                                             ["hls::stream< " + CF.return_stream(512, 0, 0, 0) + " >", "&fifo_in"],
                                             ["hls::stream< " + CF.return_stream(512, 8, 8, 8) + " >", "&lan_out"]])
    CF.set_pragma("HLS INTERFACE ap_ctrl_none port=return")
    CF.set_axis_pragmas(["bc_info_in", "fifo_out", "fifo_in", "lan_out"])
    length_of_mem = array[0]["total_length"]
    dest_array = [0] * length_of_mem
    for elem in array:
        for target_idx in range(len(elem["target"])):
            dest_array[elem["mem_start"] + target_idx] = elem["target"][target_idx]
    CF.declare_var(CF.return_stream(512, 8, 0, 16), "bc_info_target")
    CF.declare_var(CF.return_stream(512, 8, 8, 8), "lan_out_target")
    CF.declare_var(CF.return_stream(512, 0, 0, 0), "fifo_out_target")
    CF.declare_var(CF.return_stream(512, 0, 0, 0), "fifo_in_target")
    CF.declare_array("ap_uint<24>", "destination", length_of_mem, dest_array)
    if (length_of_mem > 50):
        CF.set_pragma("HLS bind_storage variable=destination type=ROM_1P impl=BRAM")
    else:
        CF.set_pragma("HLS bind_storage variable=destination type=ROM_1P impl=LUTRAM")
    CF.clines(["bc_info_target=bc_info_in.read()", "ap_uint<16> address = bc_info_target.dest",
               "ap_uint<8> num_targets = bc_info_target.user", "ap_uint<8> target = destination[address]",
               "ap_uint<8> flit_count = 0"])
    CF.object_write("lan_out_target", ["user", "id", "last"], [0, 0, 0])
    CF.start_block("while","lan_out_target.last == 0")
    CF.set_pragma("HLS PIPELINE")
    CF.start_block("if", "!lan_out.full() && !fifo_out.full()")
    CF.object_copy("fifo_out_target","bc_info_target", ["data", "keep", "last"])
    CF.object_copy("lan_out_target", "bc_info_target", ["data", "keep", "last"])
    CF.clines(["lan_out_target.dest = target", "fifo_out.write(fifo_out_target)", "lan_out.write(lan_out_target)"])
    CF.start_block("if","bc_info_target.last == 0")
    CF.cline("bc_info_target=bc_info_in.read()")
    CF.end_block()
    CF.cline("flit_count = flit_count + 1;")
    CF.end_block()
    CF.end_block()
    CF.start_block("for", "ap_uint<8> i=1; i< num_targets; i++")
    CF.clines(["target = destination[address+i]","ap_uint<8> fc = 0"])
    CF.start_block("while", "fc<flit_count")
    CF.start_block("if", "!lan_out.full() && i == (num_targets - 1)")
    CF.cline("fc++")
    CF.cline("fifo_in_target=fifo_in.read()")
    CF.object_copy("lan_out_target", "fifo_in_target", ["data", "keep", "last"])
    CF.clines(["lan_out_target.dest = target","lan_out.write(lan_out_target)"])
    CF.end_block()
    CF.start_block("else if", "!lan_out.full() && !fifo_out.full()")
    CF.cline("fifo_in_target=fifo_in.read()")
    CF.object_copy("fifo_out_target", "fifo_in_target", ["data", "keep", "last"])
    CF.object_copy("lan_out_target", "fifo_in_target", ["data", "keep", "last"])
    CF.clines(["lan_out_target.dest = target", "lan_out.write(lan_out_target)","fifo_out.write(fifo_out_target)","fc++"])
    CF.end_block()
    CF.end_block()
    CF.end_block()
    CF.end_function()
def create_hls_files (api_info, outDir):
    files_to_parse = []
    if len(api_info["direct"])!= 0:
        CF = cppMeFile(outDir + "/direct_channel")
        write_direct_channel(CF,api_info["direct"])
        files_to_parse.append("direct_channel")
    if len(api_info["broadcast"])!=0:
        CF = cppMeFile(outDir + "/broadcast_localizer")
        write_broadcast_localizer(CF, api_info["broadcast"])
        CF = cppMeFile(outDir + "/broadcast_repeater")
        write_broadcast_repeater(CF, api_info["broadcast"])
        files_to_parse.append("broadcast_localizer")
        files_to_parse.append("broadcast_repeater")
    return files_to_parse
