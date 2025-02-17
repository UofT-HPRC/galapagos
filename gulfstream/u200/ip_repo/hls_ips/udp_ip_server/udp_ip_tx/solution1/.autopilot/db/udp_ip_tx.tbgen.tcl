set moduleName udp_ip_tx
set isTopModule 1
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isFreeRunPipelineModule 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_none
set isOneStateSeq 1
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {udp_ip_tx}
set C_modelType { void 0 }
set C_modelArgList {
	{ myIP_V int 32 regular  }
	{ dst_ip_V int 32 regular  }
	{ dst_mac_V int 48 regular  }
	{ src_port_V int 16 regular  }
	{ dst_port_V int 16 regular  }
	{ arp_status_V int 2 regular  }
	{ payload_in_data_V int 512 regular  }
	{ payload_in_keep_V int 64 regular  }
	{ payload_in_valid_V int 1 regular  }
	{ payload_in_last_V int 1 regular  }
	{ payload_in_ready_V int 1 regular {pointer 1}  }
	{ payload_out_data_V int 512 regular {pointer 1}  }
	{ payload_out_keep_V int 64 regular {pointer 1}  }
	{ payload_out_valid_V int 1 regular {pointer 1}  }
	{ payload_out_last_V int 1 regular {pointer 1}  }
	{ payload_out_ready_V int 1 regular  }
	{ action_out int 161 regular {pointer 1}  }
	{ action_out_we_V int 1 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "myIP_V", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "myIP.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "dst_ip_V", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "dst_ip.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "dst_mac_V", "interface" : "wire", "bitwidth" : 48, "direction" : "READONLY", "bitSlice":[{"low":0,"up":47,"cElement": [{"cName": "dst_mac.V","cData": "uint48","bit_use": { "low": 0,"up": 47},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "src_port_V", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "src_port.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "dst_port_V", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "dst_port.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "arp_status_V", "interface" : "wire", "bitwidth" : 2, "direction" : "READONLY", "bitSlice":[{"low":0,"up":1,"cElement": [{"cName": "arp_status.V","cData": "uint2","bit_use": { "low": 0,"up": 1},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "payload_in_data_V", "interface" : "wire", "bitwidth" : 512, "direction" : "READONLY", "bitSlice":[{"low":0,"up":511,"cElement": [{"cName": "payload_in.data.V","cData": "uint512","bit_use": { "low": 0,"up": 511},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "payload_in_keep_V", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "payload_in.keep.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "payload_in_valid_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "payload_in.valid.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "payload_in_last_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "payload_in.last.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "payload_in_ready_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "payload_in_ready.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "payload_out_data_V", "interface" : "wire", "bitwidth" : 512, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":511,"cElement": [{"cName": "payload_out.data.V","cData": "uint512","bit_use": { "low": 0,"up": 511},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "payload_out_keep_V", "interface" : "wire", "bitwidth" : 64, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "payload_out.keep.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "payload_out_valid_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "payload_out.valid.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "payload_out_last_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "payload_out.last.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "payload_out_ready_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "payload_out_ready.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "action_out", "interface" : "wire", "bitwidth" : 161, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "action_out.dst_ip.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":32,"up":79,"cElement": [{"cName": "action_out.dst_mac.V","cData": "uint48","bit_use": { "low": 0,"up": 47},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":80,"up":95,"cElement": [{"cName": "action_out.src_port.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":96,"up":111,"cElement": [{"cName": "action_out.dst_port.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":112,"up":128,"cElement": [{"cName": "action_out.udp_cksum.V","cData": "uint17","bit_use": { "low": 0,"up": 16},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":129,"up":144,"cElement": [{"cName": "action_out.ip_cksum.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":145,"up":160,"cElement": [{"cName": "action_out.payload_length.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "action_out_we_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "action_out_we.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} ]}
# RTL Port declarations: 
set portNum 20
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ myIP_V sc_in sc_lv 32 signal 0 } 
	{ dst_ip_V sc_in sc_lv 32 signal 1 } 
	{ dst_mac_V sc_in sc_lv 48 signal 2 } 
	{ src_port_V sc_in sc_lv 16 signal 3 } 
	{ dst_port_V sc_in sc_lv 16 signal 4 } 
	{ arp_status_V sc_in sc_lv 2 signal 5 } 
	{ payload_in_data_V sc_in sc_lv 512 signal 6 } 
	{ payload_in_keep_V sc_in sc_lv 64 signal 7 } 
	{ payload_in_valid_V sc_in sc_lv 1 signal 8 } 
	{ payload_in_last_V sc_in sc_lv 1 signal 9 } 
	{ payload_in_ready_V sc_out sc_lv 1 signal 10 } 
	{ payload_out_data_V sc_out sc_lv 512 signal 11 } 
	{ payload_out_keep_V sc_out sc_lv 64 signal 12 } 
	{ payload_out_valid_V sc_out sc_lv 1 signal 13 } 
	{ payload_out_last_V sc_out sc_lv 1 signal 14 } 
	{ payload_out_ready_V sc_in sc_lv 1 signal 15 } 
	{ action_out sc_out sc_lv 161 signal 16 } 
	{ action_out_we_V sc_out sc_lv 1 signal 17 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "myIP_V", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "myIP_V", "role": "default" }} , 
 	{ "name": "dst_ip_V", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "dst_ip_V", "role": "default" }} , 
 	{ "name": "dst_mac_V", "direction": "in", "datatype": "sc_lv", "bitwidth":48, "type": "signal", "bundle":{"name": "dst_mac_V", "role": "default" }} , 
 	{ "name": "src_port_V", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "src_port_V", "role": "default" }} , 
 	{ "name": "dst_port_V", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "dst_port_V", "role": "default" }} , 
 	{ "name": "arp_status_V", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "arp_status_V", "role": "default" }} , 
 	{ "name": "payload_in_data_V", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "payload_in_data_V", "role": "default" }} , 
 	{ "name": "payload_in_keep_V", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "payload_in_keep_V", "role": "default" }} , 
 	{ "name": "payload_in_valid_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "payload_in_valid_V", "role": "default" }} , 
 	{ "name": "payload_in_last_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "payload_in_last_V", "role": "default" }} , 
 	{ "name": "payload_in_ready_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "payload_in_ready_V", "role": "default" }} , 
 	{ "name": "payload_out_data_V", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "payload_out_data_V", "role": "default" }} , 
 	{ "name": "payload_out_keep_V", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "payload_out_keep_V", "role": "default" }} , 
 	{ "name": "payload_out_valid_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "payload_out_valid_V", "role": "default" }} , 
 	{ "name": "payload_out_last_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "payload_out_last_V", "role": "default" }} , 
 	{ "name": "payload_out_ready_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "payload_out_ready_V", "role": "default" }} , 
 	{ "name": "action_out", "direction": "out", "datatype": "sc_lv", "bitwidth":161, "type": "signal", "bundle":{"name": "action_out", "role": "default" }} , 
 	{ "name": "action_out_we_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "action_out_we_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "udp_ip_tx",
		"Protocol" : "ap_ctrl_none",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "myIP_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "dst_ip_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "dst_mac_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "src_port_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "dst_port_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "arp_status_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "payload_in_data_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "payload_in_keep_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "payload_in_valid_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "payload_in_last_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "payload_in_ready_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "payload_out_data_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "payload_out_keep_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "payload_out_valid_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "payload_out_last_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "payload_out_ready_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "action_out", "Type" : "None", "Direction" : "O"},
			{"Name" : "action_out_we_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "payload_in_reg2_vali", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_we_reg3_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dst_mac_reg8_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_reg11_dst_ip_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_reg11_src_por", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_reg11_dst_por", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "udp_cksum_final_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_cksum_final_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_final3_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "payload_in_reg2_keep", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "payload_in_reg2_data", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "payload_in_reg2_last", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_cksum_final0_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "udp_cksum_combined_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dst_mac_reg7_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_reg10_dst_ip_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_reg10_src_por", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_reg10_dst_por", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_we_reg2_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_final2_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_cksum6_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "udp_cksum6_0_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "udp_cksum6_1_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dst_mac_reg6_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_reg9_dst_ip_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_reg9_src_port", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_reg9_dst_port", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_we_reg1_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_final1_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_cksum5_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_final_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "udp_cksum5_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "payload_cksum_final_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dst_mac_reg5_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_reg8_dst_ip_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_reg8_src_port", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_reg8_dst_port", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_we_reg0_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "last_l5_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "valid_l5_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_lastCycle_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l5_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_lastCycle_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l5_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l4_V_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l4_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l4_V_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l4_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "last_l4_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "valid_l4_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l3_V_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l3_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l3_V_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l3_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l3_V_2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l3_V_3", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l3_V_2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l3_V_3", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "last_l3_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "valid_l3_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l2_V_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l2_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l2_V_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l2_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l2_V_2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l2_V_3", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l2_V_2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l2_V_3", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l2_V_4", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l2_V_5", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l2_V_4", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l2_V_5", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l2_V_6", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l2_V_7", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l2_V_6", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l2_V_7", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "last_l2_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "valid_l2_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l1_V_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l1_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l1_V_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l1_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l1_V_2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l1_V_3", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l1_V_2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l1_V_3", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l1_V_4", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l1_V_5", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l1_V_4", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l1_V_5", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l1_V_6", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l1_V_7", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l1_V_6", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l1_V_7", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l1_V_8", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l1_V_9", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l1_V_8", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l1_V_9", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l1_V_10", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l1_V_11", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l1_V_10", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l1_V_11", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l1_V_12", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l1_V_13", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l1_V_12", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l1_V_13", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l1_V_14", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l1_V_15", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l1_V_14", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l1_V_15", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "last_l1_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "valid_l1_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l0_V_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l0_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_3", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l0_V_2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l0_V_3", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_4", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_5", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l0_V_4", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l0_V_5", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_6", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_7", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l0_V_6", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l0_V_7", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_8", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_9", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l0_V_8", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l0_V_9", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_10", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_11", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l0_V_10", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l0_V_11", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_12", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_13", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l0_V_12", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l0_V_13", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_14", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_15", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l0_V_14", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l0_V_15", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_16", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_17", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l0_V_16", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l0_V_17", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_18", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_19", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l0_V_18", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l0_V_19", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_20", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_21", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l0_V_20", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l0_V_21", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_22", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_23", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l0_V_22", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l0_V_23", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_24", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_25", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l0_V_24", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l0_V_25", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_26", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_27", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l0_V_26", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l0_V_27", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_28", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_29", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l0_V_28", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l0_V_29", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_30", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_31", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l0_V_30", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_l0_V_31", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "last_l0_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "valid_l0_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_reg7_dst_ip_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_reg7_src_port", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_reg7_dst_port", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_reg6_dst_ip_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_reg6_src_port", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_reg6_dst_port", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_reg5_dst_ip_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_reg5_src_port", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_reg5_dst_port", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_reg4_dst_ip_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_reg4_src_port", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_reg4_dst_port", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_reg3_dst_ip_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_reg3_src_port", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_reg3_dst_port", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_reg_sampled_d_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_reg_sampled_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_reg_sampled_d", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dst_mac_reg4_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dst_mac_reg3_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dst_mac_reg2_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dst_mac_reg1_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dst_mac_reg0_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dst_mac_reg_sampled_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_cksum4_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_cksum3_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_cksum2_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_cksum1_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_cksum0_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_cksum_precompute_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "udp_cksum4_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "udp_cksum3_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "udp_cksum2_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "udp_cksum1_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "udp_cksum_precompute", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "udp_cksum0_0_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "udp_cksum0_1_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "checksum_precompute_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "myIP_reg_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "IN_PACKET_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_reg2_dst_ip_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_reg2_src_port", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_reg2_dst_port", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "payload_in_reg1_data", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "payload_in_reg1_keep", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "payload_in_reg1_vali", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "payload_in_reg1_last", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "payload_in_reg0_data", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "payload_in_reg0_keep", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "payload_in_reg0_vali", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "payload_in_reg0_last", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "payload_in_reg_data_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "payload_in_reg_keep_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "payload_in_reg_valid", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "payload_in_reg_last_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_reg1_dst_ip_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_reg1_src_port", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_reg1_dst_port", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_reg0_dst_ip_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_reg0_src_port", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_reg0_dst_port", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_reg_dst_ip_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_reg_src_port_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_reg_dst_port_s", "Type" : "OVld", "Direction" : "IO"}]}]}


set ArgLastReadFirstWriteLatency {
	udp_ip_tx {
		myIP_V {Type I LastRead 0 FirstWrite -1}
		dst_ip_V {Type I LastRead 0 FirstWrite -1}
		dst_mac_V {Type I LastRead 0 FirstWrite -1}
		src_port_V {Type I LastRead 0 FirstWrite -1}
		dst_port_V {Type I LastRead 0 FirstWrite -1}
		arp_status_V {Type I LastRead 0 FirstWrite -1}
		payload_in_data_V {Type I LastRead 0 FirstWrite -1}
		payload_in_keep_V {Type I LastRead 0 FirstWrite -1}
		payload_in_valid_V {Type I LastRead 0 FirstWrite -1}
		payload_in_last_V {Type I LastRead 0 FirstWrite -1}
		payload_in_ready_V {Type O LastRead -1 FirstWrite 0}
		payload_out_data_V {Type O LastRead -1 FirstWrite 0}
		payload_out_keep_V {Type O LastRead -1 FirstWrite 0}
		payload_out_valid_V {Type O LastRead -1 FirstWrite 0}
		payload_out_last_V {Type O LastRead -1 FirstWrite 0}
		payload_out_ready_V {Type I LastRead 0 FirstWrite -1}
		action_out {Type O LastRead -1 FirstWrite 0}
		action_out_we_V {Type O LastRead -1 FirstWrite 0}
		payload_in_reg2_vali {Type IO LastRead -1 FirstWrite -1}
		action_we_reg3_V {Type IO LastRead -1 FirstWrite -1}
		dst_mac_reg8_V {Type IO LastRead -1 FirstWrite -1}
		action_reg11_dst_ip_s {Type IO LastRead -1 FirstWrite -1}
		action_reg11_src_por {Type IO LastRead -1 FirstWrite -1}
		action_reg11_dst_por {Type IO LastRead -1 FirstWrite -1}
		udp_cksum_final_V {Type IO LastRead -1 FirstWrite -1}
		ip_cksum_final_V {Type IO LastRead -1 FirstWrite -1}
		length_final3_V {Type IO LastRead -1 FirstWrite -1}
		payload_in_reg2_keep {Type IO LastRead -1 FirstWrite -1}
		payload_in_reg2_data {Type IO LastRead -1 FirstWrite -1}
		payload_in_reg2_last {Type IO LastRead -1 FirstWrite -1}
		ip_cksum_final0_V {Type IO LastRead -1 FirstWrite -1}
		udp_cksum_combined_V {Type IO LastRead -1 FirstWrite -1}
		dst_mac_reg7_V {Type IO LastRead -1 FirstWrite -1}
		action_reg10_dst_ip_s {Type IO LastRead -1 FirstWrite -1}
		action_reg10_src_por {Type IO LastRead -1 FirstWrite -1}
		action_reg10_dst_por {Type IO LastRead -1 FirstWrite -1}
		action_we_reg2_V {Type IO LastRead -1 FirstWrite -1}
		length_final2_V {Type IO LastRead -1 FirstWrite -1}
		ip_cksum6_V {Type IO LastRead -1 FirstWrite -1}
		udp_cksum6_0_V {Type IO LastRead -1 FirstWrite -1}
		udp_cksum6_1_V {Type IO LastRead -1 FirstWrite -1}
		dst_mac_reg6_V {Type IO LastRead -1 FirstWrite -1}
		action_reg9_dst_ip_V {Type IO LastRead -1 FirstWrite -1}
		action_reg9_src_port {Type IO LastRead -1 FirstWrite -1}
		action_reg9_dst_port {Type IO LastRead -1 FirstWrite -1}
		action_we_reg1_V {Type IO LastRead -1 FirstWrite -1}
		length_final1_V {Type IO LastRead -1 FirstWrite -1}
		ip_cksum5_V {Type IO LastRead -1 FirstWrite -1}
		length_final_V {Type IO LastRead -1 FirstWrite -1}
		udp_cksum5_V {Type IO LastRead -1 FirstWrite -1}
		payload_cksum_final_s {Type IO LastRead -1 FirstWrite -1}
		dst_mac_reg5_V {Type IO LastRead -1 FirstWrite -1}
		action_reg8_dst_ip_V {Type IO LastRead -1 FirstWrite -1}
		action_reg8_src_port {Type IO LastRead -1 FirstWrite -1}
		action_reg8_dst_port {Type IO LastRead -1 FirstWrite -1}
		action_we_reg0_V {Type IO LastRead -1 FirstWrite -1}
		last_l5_V {Type IO LastRead -1 FirstWrite -1}
		valid_l5_V {Type IO LastRead -1 FirstWrite -1}
		adderTree_lastCycle_s {Type IO LastRead -1 FirstWrite -1}
		adderTree_l5_V {Type IO LastRead -1 FirstWrite -1}
		length_lastCycle_V {Type IO LastRead -1 FirstWrite -1}
		length_l5_V {Type IO LastRead -1 FirstWrite -1}
		adderTree_l4_V_0 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l4_V_1 {Type IO LastRead -1 FirstWrite -1}
		length_l4_V_0 {Type IO LastRead -1 FirstWrite -1}
		length_l4_V_1 {Type IO LastRead -1 FirstWrite -1}
		last_l4_V {Type IO LastRead -1 FirstWrite -1}
		valid_l4_V {Type IO LastRead -1 FirstWrite -1}
		adderTree_l3_V_0 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l3_V_1 {Type IO LastRead -1 FirstWrite -1}
		length_l3_V_0 {Type IO LastRead -1 FirstWrite -1}
		length_l3_V_1 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l3_V_2 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l3_V_3 {Type IO LastRead -1 FirstWrite -1}
		length_l3_V_2 {Type IO LastRead -1 FirstWrite -1}
		length_l3_V_3 {Type IO LastRead -1 FirstWrite -1}
		last_l3_V {Type IO LastRead -1 FirstWrite -1}
		valid_l3_V {Type IO LastRead -1 FirstWrite -1}
		adderTree_l2_V_0 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l2_V_1 {Type IO LastRead -1 FirstWrite -1}
		length_l2_V_0 {Type IO LastRead -1 FirstWrite -1}
		length_l2_V_1 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l2_V_2 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l2_V_3 {Type IO LastRead -1 FirstWrite -1}
		length_l2_V_2 {Type IO LastRead -1 FirstWrite -1}
		length_l2_V_3 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l2_V_4 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l2_V_5 {Type IO LastRead -1 FirstWrite -1}
		length_l2_V_4 {Type IO LastRead -1 FirstWrite -1}
		length_l2_V_5 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l2_V_6 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l2_V_7 {Type IO LastRead -1 FirstWrite -1}
		length_l2_V_6 {Type IO LastRead -1 FirstWrite -1}
		length_l2_V_7 {Type IO LastRead -1 FirstWrite -1}
		last_l2_V {Type IO LastRead -1 FirstWrite -1}
		valid_l2_V {Type IO LastRead -1 FirstWrite -1}
		adderTree_l1_V_0 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l1_V_1 {Type IO LastRead -1 FirstWrite -1}
		length_l1_V_0 {Type IO LastRead -1 FirstWrite -1}
		length_l1_V_1 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l1_V_2 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l1_V_3 {Type IO LastRead -1 FirstWrite -1}
		length_l1_V_2 {Type IO LastRead -1 FirstWrite -1}
		length_l1_V_3 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l1_V_4 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l1_V_5 {Type IO LastRead -1 FirstWrite -1}
		length_l1_V_4 {Type IO LastRead -1 FirstWrite -1}
		length_l1_V_5 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l1_V_6 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l1_V_7 {Type IO LastRead -1 FirstWrite -1}
		length_l1_V_6 {Type IO LastRead -1 FirstWrite -1}
		length_l1_V_7 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l1_V_8 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l1_V_9 {Type IO LastRead -1 FirstWrite -1}
		length_l1_V_8 {Type IO LastRead -1 FirstWrite -1}
		length_l1_V_9 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l1_V_10 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l1_V_11 {Type IO LastRead -1 FirstWrite -1}
		length_l1_V_10 {Type IO LastRead -1 FirstWrite -1}
		length_l1_V_11 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l1_V_12 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l1_V_13 {Type IO LastRead -1 FirstWrite -1}
		length_l1_V_12 {Type IO LastRead -1 FirstWrite -1}
		length_l1_V_13 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l1_V_14 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l1_V_15 {Type IO LastRead -1 FirstWrite -1}
		length_l1_V_14 {Type IO LastRead -1 FirstWrite -1}
		length_l1_V_15 {Type IO LastRead -1 FirstWrite -1}
		last_l1_V {Type IO LastRead -1 FirstWrite -1}
		valid_l1_V {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_0 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_1 {Type IO LastRead -1 FirstWrite -1}
		length_l0_V_0 {Type IO LastRead -1 FirstWrite -1}
		length_l0_V_1 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_2 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_3 {Type IO LastRead -1 FirstWrite -1}
		length_l0_V_2 {Type IO LastRead -1 FirstWrite -1}
		length_l0_V_3 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_4 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_5 {Type IO LastRead -1 FirstWrite -1}
		length_l0_V_4 {Type IO LastRead -1 FirstWrite -1}
		length_l0_V_5 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_6 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_7 {Type IO LastRead -1 FirstWrite -1}
		length_l0_V_6 {Type IO LastRead -1 FirstWrite -1}
		length_l0_V_7 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_8 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_9 {Type IO LastRead -1 FirstWrite -1}
		length_l0_V_8 {Type IO LastRead -1 FirstWrite -1}
		length_l0_V_9 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_10 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_11 {Type IO LastRead -1 FirstWrite -1}
		length_l0_V_10 {Type IO LastRead -1 FirstWrite -1}
		length_l0_V_11 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_12 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_13 {Type IO LastRead -1 FirstWrite -1}
		length_l0_V_12 {Type IO LastRead -1 FirstWrite -1}
		length_l0_V_13 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_14 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_15 {Type IO LastRead -1 FirstWrite -1}
		length_l0_V_14 {Type IO LastRead -1 FirstWrite -1}
		length_l0_V_15 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_16 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_17 {Type IO LastRead -1 FirstWrite -1}
		length_l0_V_16 {Type IO LastRead -1 FirstWrite -1}
		length_l0_V_17 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_18 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_19 {Type IO LastRead -1 FirstWrite -1}
		length_l0_V_18 {Type IO LastRead -1 FirstWrite -1}
		length_l0_V_19 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_20 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_21 {Type IO LastRead -1 FirstWrite -1}
		length_l0_V_20 {Type IO LastRead -1 FirstWrite -1}
		length_l0_V_21 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_22 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_23 {Type IO LastRead -1 FirstWrite -1}
		length_l0_V_22 {Type IO LastRead -1 FirstWrite -1}
		length_l0_V_23 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_24 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_25 {Type IO LastRead -1 FirstWrite -1}
		length_l0_V_24 {Type IO LastRead -1 FirstWrite -1}
		length_l0_V_25 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_26 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_27 {Type IO LastRead -1 FirstWrite -1}
		length_l0_V_26 {Type IO LastRead -1 FirstWrite -1}
		length_l0_V_27 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_28 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_29 {Type IO LastRead -1 FirstWrite -1}
		length_l0_V_28 {Type IO LastRead -1 FirstWrite -1}
		length_l0_V_29 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_30 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_31 {Type IO LastRead -1 FirstWrite -1}
		length_l0_V_30 {Type IO LastRead -1 FirstWrite -1}
		length_l0_V_31 {Type IO LastRead -1 FirstWrite -1}
		last_l0_V {Type IO LastRead -1 FirstWrite -1}
		valid_l0_V {Type IO LastRead -1 FirstWrite -1}
		action_reg7_dst_ip_V {Type IO LastRead -1 FirstWrite -1}
		action_reg7_src_port {Type IO LastRead -1 FirstWrite -1}
		action_reg7_dst_port {Type IO LastRead -1 FirstWrite -1}
		action_reg6_dst_ip_V {Type IO LastRead -1 FirstWrite -1}
		action_reg6_src_port {Type IO LastRead -1 FirstWrite -1}
		action_reg6_dst_port {Type IO LastRead -1 FirstWrite -1}
		action_reg5_dst_ip_V {Type IO LastRead -1 FirstWrite -1}
		action_reg5_src_port {Type IO LastRead -1 FirstWrite -1}
		action_reg5_dst_port {Type IO LastRead -1 FirstWrite -1}
		action_reg4_dst_ip_V {Type IO LastRead -1 FirstWrite -1}
		action_reg4_src_port {Type IO LastRead -1 FirstWrite -1}
		action_reg4_dst_port {Type IO LastRead -1 FirstWrite -1}
		action_reg3_dst_ip_V {Type IO LastRead -1 FirstWrite -1}
		action_reg3_src_port {Type IO LastRead -1 FirstWrite -1}
		action_reg3_dst_port {Type IO LastRead -1 FirstWrite -1}
		action_reg_sampled_d_1 {Type IO LastRead -1 FirstWrite -1}
		action_reg_sampled_s {Type IO LastRead -1 FirstWrite -1}
		action_reg_sampled_d {Type IO LastRead -1 FirstWrite -1}
		dst_mac_reg4_V {Type IO LastRead -1 FirstWrite -1}
		dst_mac_reg3_V {Type IO LastRead -1 FirstWrite -1}
		dst_mac_reg2_V {Type IO LastRead -1 FirstWrite -1}
		dst_mac_reg1_V {Type IO LastRead -1 FirstWrite -1}
		dst_mac_reg0_V {Type IO LastRead -1 FirstWrite -1}
		dst_mac_reg_sampled_s {Type IO LastRead -1 FirstWrite -1}
		ip_cksum4_V {Type IO LastRead -1 FirstWrite -1}
		ip_cksum3_V {Type IO LastRead -1 FirstWrite -1}
		ip_cksum2_V {Type IO LastRead -1 FirstWrite -1}
		ip_cksum1_V {Type IO LastRead -1 FirstWrite -1}
		ip_cksum0_V {Type IO LastRead -1 FirstWrite -1}
		ip_cksum_precompute_s {Type IO LastRead -1 FirstWrite -1}
		udp_cksum4_V {Type IO LastRead -1 FirstWrite -1}
		udp_cksum3_V {Type IO LastRead -1 FirstWrite -1}
		udp_cksum2_V {Type IO LastRead -1 FirstWrite -1}
		udp_cksum1_V {Type IO LastRead -1 FirstWrite -1}
		udp_cksum_precompute {Type IO LastRead -1 FirstWrite -1}
		udp_cksum0_0_V {Type IO LastRead -1 FirstWrite -1}
		udp_cksum0_1_V {Type IO LastRead -1 FirstWrite -1}
		checksum_precompute_s {Type IO LastRead -1 FirstWrite -1}
		myIP_reg_V {Type IO LastRead -1 FirstWrite -1}
		IN_PACKET_V {Type IO LastRead -1 FirstWrite -1}
		action_reg2_dst_ip_V {Type IO LastRead -1 FirstWrite -1}
		action_reg2_src_port {Type IO LastRead -1 FirstWrite -1}
		action_reg2_dst_port {Type IO LastRead -1 FirstWrite -1}
		payload_in_reg1_data {Type IO LastRead -1 FirstWrite -1}
		payload_in_reg1_keep {Type IO LastRead -1 FirstWrite -1}
		payload_in_reg1_vali {Type IO LastRead -1 FirstWrite -1}
		payload_in_reg1_last {Type IO LastRead -1 FirstWrite -1}
		payload_in_reg0_data {Type IO LastRead -1 FirstWrite -1}
		payload_in_reg0_keep {Type IO LastRead -1 FirstWrite -1}
		payload_in_reg0_vali {Type IO LastRead -1 FirstWrite -1}
		payload_in_reg0_last {Type IO LastRead -1 FirstWrite -1}
		payload_in_reg_data_s {Type IO LastRead -1 FirstWrite -1}
		payload_in_reg_keep_s {Type IO LastRead -1 FirstWrite -1}
		payload_in_reg_valid {Type IO LastRead -1 FirstWrite -1}
		payload_in_reg_last_s {Type IO LastRead -1 FirstWrite -1}
		action_reg1_dst_ip_V {Type IO LastRead -1 FirstWrite -1}
		action_reg1_src_port {Type IO LastRead -1 FirstWrite -1}
		action_reg1_dst_port {Type IO LastRead -1 FirstWrite -1}
		action_reg0_dst_ip_V {Type IO LastRead -1 FirstWrite -1}
		action_reg0_src_port {Type IO LastRead -1 FirstWrite -1}
		action_reg0_dst_port {Type IO LastRead -1 FirstWrite -1}
		action_reg_dst_ip_V {Type IO LastRead -1 FirstWrite -1}
		action_reg_src_port_s {Type IO LastRead -1 FirstWrite -1}
		action_reg_dst_port_s {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "0", "Max" : "0"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	myIP_V { ap_none {  { myIP_V in_data 0 32 } } }
	dst_ip_V { ap_none {  { dst_ip_V in_data 0 32 } } }
	dst_mac_V { ap_none {  { dst_mac_V in_data 0 48 } } }
	src_port_V { ap_none {  { src_port_V in_data 0 16 } } }
	dst_port_V { ap_none {  { dst_port_V in_data 0 16 } } }
	arp_status_V { ap_none {  { arp_status_V in_data 0 2 } } }
	payload_in_data_V { ap_none {  { payload_in_data_V in_data 0 512 } } }
	payload_in_keep_V { ap_none {  { payload_in_keep_V in_data 0 64 } } }
	payload_in_valid_V { ap_none {  { payload_in_valid_V in_data 0 1 } } }
	payload_in_last_V { ap_none {  { payload_in_last_V in_data 0 1 } } }
	payload_in_ready_V { ap_none {  { payload_in_ready_V out_data 1 1 } } }
	payload_out_data_V { ap_none {  { payload_out_data_V out_data 1 512 } } }
	payload_out_keep_V { ap_none {  { payload_out_keep_V out_data 1 64 } } }
	payload_out_valid_V { ap_none {  { payload_out_valid_V out_data 1 1 } } }
	payload_out_last_V { ap_none {  { payload_out_last_V out_data 1 1 } } }
	payload_out_ready_V { ap_none {  { payload_out_ready_V in_data 0 1 } } }
	action_out { ap_none {  { action_out out_data 1 161 } } }
	action_out_we_V { ap_none {  { action_out_we_V out_data 1 1 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
