set moduleName udp_ip_receive
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
set C_modelName {udp_ip_receive}
set C_modelType { void 0 }
set C_modelArgList {
	{ myIP_V int 32 regular  }
	{ ip_in_data_V int 336 regular  }
	{ ip_in_valid_V int 1 regular  }
	{ meta_out_src_ip_V int 32 regular {pointer 1}  }
	{ meta_out_protocol_header_V int 64 regular {pointer 1}  }
	{ meta_out_checksum_V int 32 regular {pointer 1}  }
	{ meta_out_action_V int 2 regular {pointer 1}  }
	{ arp_internal_resp_Mac_IP_V int 80 regular {pointer 1}  }
	{ arp_internal_resp_valid_V int 1 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "myIP_V", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "myIP.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "ip_in_data_V", "interface" : "wire", "bitwidth" : 336, "direction" : "READONLY", "bitSlice":[{"low":0,"up":335,"cElement": [{"cName": "ip_in.data.V","cData": "uint336","bit_use": { "low": 0,"up": 335},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "ip_in_valid_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "ip_in.valid.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "meta_out_src_ip_V", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "meta_out.src_ip.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "meta_out_protocol_header_V", "interface" : "wire", "bitwidth" : 64, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "meta_out.protocol_header.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "meta_out_checksum_V", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "meta_out.checksum.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "meta_out_action_V", "interface" : "wire", "bitwidth" : 2, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":1,"cElement": [{"cName": "meta_out.action.V","cData": "uint2","bit_use": { "low": 0,"up": 1},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "arp_internal_resp_Mac_IP_V", "interface" : "wire", "bitwidth" : 80, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":79,"cElement": [{"cName": "arp_internal_resp.Mac_IP.V","cData": "uint80","bit_use": { "low": 0,"up": 79},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "arp_internal_resp_valid_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "arp_internal_resp.valid.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} ]}
# RTL Port declarations: 
set portNum 11
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ myIP_V sc_in sc_lv 32 signal 0 } 
	{ ip_in_data_V sc_in sc_lv 336 signal 1 } 
	{ ip_in_valid_V sc_in sc_lv 1 signal 2 } 
	{ meta_out_src_ip_V sc_out sc_lv 32 signal 3 } 
	{ meta_out_protocol_header_V sc_out sc_lv 64 signal 4 } 
	{ meta_out_checksum_V sc_out sc_lv 32 signal 5 } 
	{ meta_out_action_V sc_out sc_lv 2 signal 6 } 
	{ arp_internal_resp_Mac_IP_V sc_out sc_lv 80 signal 7 } 
	{ arp_internal_resp_valid_V sc_out sc_lv 1 signal 8 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "myIP_V", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "myIP_V", "role": "default" }} , 
 	{ "name": "ip_in_data_V", "direction": "in", "datatype": "sc_lv", "bitwidth":336, "type": "signal", "bundle":{"name": "ip_in_data_V", "role": "default" }} , 
 	{ "name": "ip_in_valid_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ip_in_valid_V", "role": "default" }} , 
 	{ "name": "meta_out_src_ip_V", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "meta_out_src_ip_V", "role": "default" }} , 
 	{ "name": "meta_out_protocol_header_V", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "meta_out_protocol_header_V", "role": "default" }} , 
 	{ "name": "meta_out_checksum_V", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "meta_out_checksum_V", "role": "default" }} , 
 	{ "name": "meta_out_action_V", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "meta_out_action_V", "role": "default" }} , 
 	{ "name": "arp_internal_resp_Mac_IP_V", "direction": "out", "datatype": "sc_lv", "bitwidth":80, "type": "signal", "bundle":{"name": "arp_internal_resp_Mac_IP_V", "role": "default" }} , 
 	{ "name": "arp_internal_resp_valid_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "arp_internal_resp_valid_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "udp_ip_receive",
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
			{"Name" : "ip_in_data_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "ip_in_valid_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "meta_out_src_ip_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "meta_out_protocol_header_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "meta_out_checksum_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "meta_out_action_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "arp_internal_resp_Mac_IP_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "arp_internal_resp_valid_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "arp_internal_resp_re_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "arp_internal_resp_re", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_out_reg_src_ip_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_out_reg_protoco", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_out_reg_checksu", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_out_reg_action_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_in_reg5_src_ip_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "eth_src_mac5_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_in_reg5_valid_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_in_reg5_dst_ip_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "myIP_reg_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "checksum_reg_final_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_in_reg5_proto_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_in_reg5_proto_hea", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_in_reg5_fixed_hea", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_in_reg5_fragment_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "udp_ignore_flag4_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "udp_cksum4_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "checksum_reg3_0_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "udp_cksum3_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "udp_ignore_flag3_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_in_reg4_fixed_hea", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_in_reg4_fragment_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_in_reg4_proto_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_in_reg4_src_ip_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_in_reg4_dst_ip_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_in_reg4_proto_hea", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_in_reg4_valid_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "eth_src_mac4_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "checksum_reg2_0_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "checksum_reg2_1_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "udp_cksum2_0_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "udp_cksum2_1_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "udp_ignore_flag2_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_in_reg3_fixed_hea", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_in_reg3_fragment_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_in_reg3_proto_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_in_reg3_src_ip_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_in_reg3_dst_ip_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_in_reg3_proto_hea", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_in_reg3_valid_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "eth_src_mac3_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "checksum_reg1_2_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "checksum_reg1_3_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "checksum_reg1_0_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "checksum_reg1_1_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "udp_cksum1_0_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "udp_cksum1_1_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "udp_cksum1_2_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "udp_cksum1_3_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "udp_ignore_flag1_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_in_reg2_proto_hea", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_in_reg2_fixed_hea", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_in_reg2_fragment_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_in_reg2_proto_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_in_reg2_src_ip_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_in_reg2_dst_ip_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_in_reg2_valid_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "eth_src_mac2_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "checksum_reg0_6_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "checksum_reg0_7_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "checksum_reg0_4_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "checksum_reg0_5_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "checksum_reg0_2_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "checksum_reg0_3_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "checksum_reg0_0_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "checksum_reg0_1_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "udp_cksum0_0_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "udp_cksum0_1_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "udp_cksum0_2_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "udp_cksum0_3_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "udp_cksum0_4_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "udp_cksum0_5_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "udp_cksum0_6_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "udp_cksum0_7_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "udp_ignore_flag0_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_in_reg1_fixed_hea", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_in_reg1_fragment_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_in_reg1_proto_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_in_reg1_src_ip_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_in_reg1_dst_ip_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_in_reg1_proto_hea", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_in_reg1_valid_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "eth_src_mac1_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_in_reg0_src_ip_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_in_reg0_checksum_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_in_reg0_proto_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_in_reg0_ttl_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_in_reg0_fragment_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_in_reg0_id_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_in_reg0_length_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "checksum_precompute_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_in_reg0_proto_hea", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_in_reg0_fixed_hea", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_in_reg0_dst_ip_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_in_reg0_valid_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "eth_src_mac0_V", "Type" : "OVld", "Direction" : "IO"}]}]}


set ArgLastReadFirstWriteLatency {
	udp_ip_receive {
		myIP_V {Type I LastRead 0 FirstWrite -1}
		ip_in_data_V {Type I LastRead 0 FirstWrite -1}
		ip_in_valid_V {Type I LastRead 0 FirstWrite -1}
		meta_out_src_ip_V {Type O LastRead -1 FirstWrite 0}
		meta_out_protocol_header_V {Type O LastRead -1 FirstWrite 0}
		meta_out_checksum_V {Type O LastRead -1 FirstWrite 0}
		meta_out_action_V {Type O LastRead -1 FirstWrite 0}
		arp_internal_resp_Mac_IP_V {Type O LastRead -1 FirstWrite 0}
		arp_internal_resp_valid_V {Type O LastRead -1 FirstWrite 0}
		arp_internal_resp_re_1 {Type IO LastRead -1 FirstWrite -1}
		arp_internal_resp_re {Type IO LastRead -1 FirstWrite -1}
		meta_out_reg_src_ip_s {Type IO LastRead -1 FirstWrite -1}
		meta_out_reg_protoco {Type IO LastRead -1 FirstWrite -1}
		meta_out_reg_checksu {Type IO LastRead -1 FirstWrite -1}
		meta_out_reg_action_s {Type IO LastRead -1 FirstWrite -1}
		ip_in_reg5_src_ip_V {Type IO LastRead -1 FirstWrite -1}
		eth_src_mac5_V {Type IO LastRead -1 FirstWrite -1}
		ip_in_reg5_valid_V {Type IO LastRead -1 FirstWrite -1}
		ip_in_reg5_dst_ip_V {Type IO LastRead -1 FirstWrite -1}
		myIP_reg_V {Type IO LastRead -1 FirstWrite -1}
		checksum_reg_final_V {Type IO LastRead -1 FirstWrite -1}
		ip_in_reg5_proto_V {Type IO LastRead -1 FirstWrite -1}
		ip_in_reg5_proto_hea {Type IO LastRead -1 FirstWrite -1}
		ip_in_reg5_fixed_hea {Type IO LastRead -1 FirstWrite -1}
		ip_in_reg5_fragment_s {Type IO LastRead -1 FirstWrite -1}
		udp_ignore_flag4_V {Type IO LastRead -1 FirstWrite -1}
		udp_cksum4_V {Type IO LastRead -1 FirstWrite -1}
		checksum_reg3_0_V {Type IO LastRead -1 FirstWrite -1}
		udp_cksum3_V {Type IO LastRead -1 FirstWrite -1}
		udp_ignore_flag3_V {Type IO LastRead -1 FirstWrite -1}
		ip_in_reg4_fixed_hea {Type IO LastRead -1 FirstWrite -1}
		ip_in_reg4_fragment_s {Type IO LastRead -1 FirstWrite -1}
		ip_in_reg4_proto_V {Type IO LastRead -1 FirstWrite -1}
		ip_in_reg4_src_ip_V {Type IO LastRead -1 FirstWrite -1}
		ip_in_reg4_dst_ip_V {Type IO LastRead -1 FirstWrite -1}
		ip_in_reg4_proto_hea {Type IO LastRead -1 FirstWrite -1}
		ip_in_reg4_valid_V {Type IO LastRead -1 FirstWrite -1}
		eth_src_mac4_V {Type IO LastRead -1 FirstWrite -1}
		checksum_reg2_0_V {Type IO LastRead -1 FirstWrite -1}
		checksum_reg2_1_V {Type IO LastRead -1 FirstWrite -1}
		udp_cksum2_0_V {Type IO LastRead -1 FirstWrite -1}
		udp_cksum2_1_V {Type IO LastRead -1 FirstWrite -1}
		udp_ignore_flag2_V {Type IO LastRead -1 FirstWrite -1}
		ip_in_reg3_fixed_hea {Type IO LastRead -1 FirstWrite -1}
		ip_in_reg3_fragment_s {Type IO LastRead -1 FirstWrite -1}
		ip_in_reg3_proto_V {Type IO LastRead -1 FirstWrite -1}
		ip_in_reg3_src_ip_V {Type IO LastRead -1 FirstWrite -1}
		ip_in_reg3_dst_ip_V {Type IO LastRead -1 FirstWrite -1}
		ip_in_reg3_proto_hea {Type IO LastRead -1 FirstWrite -1}
		ip_in_reg3_valid_V {Type IO LastRead -1 FirstWrite -1}
		eth_src_mac3_V {Type IO LastRead -1 FirstWrite -1}
		checksum_reg1_2_V {Type IO LastRead -1 FirstWrite -1}
		checksum_reg1_3_V {Type IO LastRead -1 FirstWrite -1}
		checksum_reg1_0_V {Type IO LastRead -1 FirstWrite -1}
		checksum_reg1_1_V {Type IO LastRead -1 FirstWrite -1}
		udp_cksum1_0_V {Type IO LastRead -1 FirstWrite -1}
		udp_cksum1_1_V {Type IO LastRead -1 FirstWrite -1}
		udp_cksum1_2_V {Type IO LastRead -1 FirstWrite -1}
		udp_cksum1_3_V {Type IO LastRead -1 FirstWrite -1}
		udp_ignore_flag1_V {Type IO LastRead -1 FirstWrite -1}
		ip_in_reg2_proto_hea {Type IO LastRead -1 FirstWrite -1}
		ip_in_reg2_fixed_hea {Type IO LastRead -1 FirstWrite -1}
		ip_in_reg2_fragment_s {Type IO LastRead -1 FirstWrite -1}
		ip_in_reg2_proto_V {Type IO LastRead -1 FirstWrite -1}
		ip_in_reg2_src_ip_V {Type IO LastRead -1 FirstWrite -1}
		ip_in_reg2_dst_ip_V {Type IO LastRead -1 FirstWrite -1}
		ip_in_reg2_valid_V {Type IO LastRead -1 FirstWrite -1}
		eth_src_mac2_V {Type IO LastRead -1 FirstWrite -1}
		checksum_reg0_6_V {Type IO LastRead -1 FirstWrite -1}
		checksum_reg0_7_V {Type IO LastRead -1 FirstWrite -1}
		checksum_reg0_4_V {Type IO LastRead -1 FirstWrite -1}
		checksum_reg0_5_V {Type IO LastRead -1 FirstWrite -1}
		checksum_reg0_2_V {Type IO LastRead -1 FirstWrite -1}
		checksum_reg0_3_V {Type IO LastRead -1 FirstWrite -1}
		checksum_reg0_0_V {Type IO LastRead -1 FirstWrite -1}
		checksum_reg0_1_V {Type IO LastRead -1 FirstWrite -1}
		udp_cksum0_0_V {Type IO LastRead -1 FirstWrite -1}
		udp_cksum0_1_V {Type IO LastRead -1 FirstWrite -1}
		udp_cksum0_2_V {Type IO LastRead -1 FirstWrite -1}
		udp_cksum0_3_V {Type IO LastRead -1 FirstWrite -1}
		udp_cksum0_4_V {Type IO LastRead -1 FirstWrite -1}
		udp_cksum0_5_V {Type IO LastRead -1 FirstWrite -1}
		udp_cksum0_6_V {Type IO LastRead -1 FirstWrite -1}
		udp_cksum0_7_V {Type IO LastRead -1 FirstWrite -1}
		udp_ignore_flag0_V {Type IO LastRead -1 FirstWrite -1}
		ip_in_reg1_fixed_hea {Type IO LastRead -1 FirstWrite -1}
		ip_in_reg1_fragment_s {Type IO LastRead -1 FirstWrite -1}
		ip_in_reg1_proto_V {Type IO LastRead -1 FirstWrite -1}
		ip_in_reg1_src_ip_V {Type IO LastRead -1 FirstWrite -1}
		ip_in_reg1_dst_ip_V {Type IO LastRead -1 FirstWrite -1}
		ip_in_reg1_proto_hea {Type IO LastRead -1 FirstWrite -1}
		ip_in_reg1_valid_V {Type IO LastRead -1 FirstWrite -1}
		eth_src_mac1_V {Type IO LastRead -1 FirstWrite -1}
		ip_in_reg0_src_ip_V {Type IO LastRead -1 FirstWrite -1}
		ip_in_reg0_checksum_s {Type IO LastRead -1 FirstWrite -1}
		ip_in_reg0_proto_V {Type IO LastRead -1 FirstWrite -1}
		ip_in_reg0_ttl_V {Type IO LastRead -1 FirstWrite -1}
		ip_in_reg0_fragment_s {Type IO LastRead -1 FirstWrite -1}
		ip_in_reg0_id_V {Type IO LastRead -1 FirstWrite -1}
		ip_in_reg0_length_V {Type IO LastRead -1 FirstWrite -1}
		checksum_precompute_s {Type IO LastRead -1 FirstWrite -1}
		ip_in_reg0_proto_hea {Type IO LastRead -1 FirstWrite -1}
		ip_in_reg0_fixed_hea {Type IO LastRead -1 FirstWrite -1}
		ip_in_reg0_dst_ip_V {Type IO LastRead -1 FirstWrite -1}
		ip_in_reg0_valid_V {Type IO LastRead -1 FirstWrite -1}
		eth_src_mac0_V {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "0", "Max" : "0"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	myIP_V { ap_none {  { myIP_V in_data 0 32 } } }
	ip_in_data_V { ap_none {  { ip_in_data_V in_data 0 336 } } }
	ip_in_valid_V { ap_none {  { ip_in_valid_V in_data 0 1 } } }
	meta_out_src_ip_V { ap_none {  { meta_out_src_ip_V out_data 1 32 } } }
	meta_out_protocol_header_V { ap_none {  { meta_out_protocol_header_V out_data 1 64 } } }
	meta_out_checksum_V { ap_none {  { meta_out_checksum_V out_data 1 32 } } }
	meta_out_action_V { ap_none {  { meta_out_action_V out_data 1 2 } } }
	arp_internal_resp_Mac_IP_V { ap_none {  { arp_internal_resp_Mac_IP_V out_data 1 80 } } }
	arp_internal_resp_valid_V { ap_none {  { arp_internal_resp_valid_V out_data 1 1 } } }
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
