import copy
from tclMe import tclMeFile
from cppMe import cppMeFile
import os

def parseAPI(topAPI):
    direct = []
    broadcast = []
    control = []
    control_multiple = []
    for port in topAPI['port']:
        local_port = copy.deepcopy(port)
        if port['form'].strip().lower()=="direct":
            direct.append(local_port)
        elif port['form'].strip().lower() == "broadcast":
            broadcast.append(local_port)
        elif port['form'].strip().lower() == "control":
            control.append(local_port)
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
    control_start = current_port
    for idx in range(len(control)):
        control[idx]['num'] = current_port
        current_port = current_port + 1
    control_multiple_start = current_port
    for idx in range(len(control_multiple)):
        control_multiple[idx]['num'] = current_port
        current_port = current_port + 1
    last_port = current_port-1
    return_dict = {"has_gateway": True,"direct": direct, "broadcast": broadcast, "control": control,
                   "control_multiple": control_multiple,
                   "port_regions": [broadcast_start,control_start,control_multiple_start,last_port]}
    print(return_dict)
    return return_dict
def generate_parser (api_info,gatewayFile):
    print("Generating the gateway file")
    number_of_MI = 3
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
    if (len(api_info["control"]) == 0) or (len(api_info["control_multiple"]) == 0):
        number_of_MI = number_of_MI - 1
    else:
        gatewayFile.createHierarchy("control")
        gatewayFile.add_intf_pin("control/direct_in", "xilinx.com:interface:axis_rtl:1.0", "Slave")
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
        elif (len(api_info["control"]) != 0) or (len(api_info["control_multiple"]) != 0):
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
        gatewayFile.setProperties("parser/output_direct_switch",props)
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
        if (len(api_info["control"]) != 0) or (len(api_info["control_multiple"]) != 0):
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
def implement_control_section(array,multiple_array,gatewayFile,outDir):
    return
def makeGWFiles (fpga, outDir,topAPI):
    api_info = parseAPI(topAPI)
    gatewayFile = tclMeFile(outDir + '/0_gateway', fpga)
    generate_parser(api_info,gatewayFile)
    if (len(api_info["control"]) == 0) and (len(api_info["control_multiple"]) == 0):
        gatewayFile.addVerilog(str(os.environ.get('GALAPAGOS_PATH'))+"/middleware/verilog/direct_tieoff.v")
    if len(api_info["direct"])!= 0:
        implement_direct_section(gatewayFile)
    if len(api_info["broadcast"])!= 0:
        implement_broadcast_section(gatewayFile)
    if (len(api_info["control"])!= 0) or (len(api_info["control_multiple"])!= 0):
        implement_control_section(api_info["control"],api_info["control_multiple"], gatewayFile,outDir)
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
    CF.cline("lan_out_target.last = 0")
    CF.declare_array("ap_uint<16>", "destination",length_of_mem,dest_array)
    if (length_of_mem > 50):
        CF.set_pragma("HLS bind_storage variable=destination type=ROM_1P impl=BRAM")
    else:
        CF.set_pragma("HLS bind_storage variable=destination type=ROM_1P impl=LUTRAM")
    CF.clines(["direct_in_target = direct_in.read()", "ap_uint<8> saved_dest = destination[direct_in_target.dest]"])
    CF.start_block("while", "lan_out_target.last == 0")
    CF.set_pragma("HLS PIPELINE")
    CF.start_block("if", "!lan_out.full()")
    CF.object_write("lan_out_target",["data","dest","id","user","keep","last"],
                    ["direct_in_target.data","saved_dest",0,0,
                     "direct_in_target.keep","direct_in_target.last"])
    CF.cline("lan_out.write(lan_out_target)")
    CF.start_block("if", "direct_in_target.last == 0")
    CF.cline("direct_in_target = direct_in.read()")
    CF.end_block()
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
    CF.clines(["direct_in_target = direct_in.read()","bc_info_target.last = 0"])
    CF.cline("ap_uint<24> saved_dest = destination[direct_in_target.dest-" + str(array[0]["offset"]) + "]")
    CF.start_block("while", "bc_info_target.last == 0")
    CF.set_pragma("HLS PIPELINE")
    CF.start_block("if", "!bc_info_out.full()")
    CF.object_write("bc_info_target", ["data", "dest", "user", "keep", "last"],
                    ["direct_in_target.data", "saved_dest.range(15,0)", "saved_dest.range(23,16)",
                     "direct_in_target.keep", "direct_in_target.last"])
    CF.cline("bc_info_out.write(bc_info_target)")
    CF.start_block("if", "direct_in_target.last == 0")
    CF.cline("direct_in_target = direct_in.read()")
    CF.end_block()
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
