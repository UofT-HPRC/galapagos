set moduleName arp_send
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
set C_modelName {arp_send}
set C_modelType { void 0 }
set C_modelArgList {
	{ myMac_V int 48 regular  }
	{ myIP_V int 32 regular  }
	{ gateway_V int 32 regular  }
	{ netmask_V int 32 regular  }
	{ arptable_addr_V int 8 regular {pointer 1}  }
	{ arptable_data_V int 80 regular  }
	{ call_for_responce_Mac_IP_V int 80 regular  }
	{ call_for_responce_valid_V int 1 regular  }
	{ lookup_req_V int 32 regular  }
	{ lookup_result_V int 48 regular {pointer 1}  }
	{ arp_status_V int 2 regular {pointer 1}  }
	{ arp_out_data_V int 512 regular {pointer 1}  }
	{ arp_out_keep_V int 64 regular {pointer 1}  }
	{ arp_out_last_V int 1 regular {pointer 1}  }
	{ arp_out_valid_V int 1 regular {pointer 1}  }
	{ arp_out_ready_V int 1 unused {pointer 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "myMac_V", "interface" : "wire", "bitwidth" : 48, "direction" : "READONLY", "bitSlice":[{"low":0,"up":47,"cElement": [{"cName": "myMac.V","cData": "uint48","bit_use": { "low": 0,"up": 47},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "myIP_V", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "myIP.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "gateway_V", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "gateway.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "netmask_V", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "netmask.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "arptable_addr_V", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "arptable_addr.V","cData": "uint8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "arptable_data_V", "interface" : "wire", "bitwidth" : 80, "direction" : "READONLY", "bitSlice":[{"low":0,"up":79,"cElement": [{"cName": "arptable_data.V","cData": "uint80","bit_use": { "low": 0,"up": 79},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "call_for_responce_Mac_IP_V", "interface" : "wire", "bitwidth" : 80, "direction" : "READONLY", "bitSlice":[{"low":0,"up":79,"cElement": [{"cName": "call_for_responce.Mac_IP.V","cData": "uint80","bit_use": { "low": 0,"up": 79},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "call_for_responce_valid_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "call_for_responce.valid.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "lookup_req_V", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "lookup_req.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "lookup_result_V", "interface" : "wire", "bitwidth" : 48, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":47,"cElement": [{"cName": "lookup_result.V","cData": "uint48","bit_use": { "low": 0,"up": 47},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "arp_status_V", "interface" : "wire", "bitwidth" : 2, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":1,"cElement": [{"cName": "arp_status.V","cData": "uint2","bit_use": { "low": 0,"up": 1},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "arp_out_data_V", "interface" : "wire", "bitwidth" : 512, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":511,"cElement": [{"cName": "arp_out.data.V","cData": "uint512","bit_use": { "low": 0,"up": 511},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "arp_out_keep_V", "interface" : "wire", "bitwidth" : 64, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "arp_out.keep.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "arp_out_last_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "arp_out.last.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "arp_out_valid_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "arp_out.valid.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "arp_out_ready_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "arp_out.ready.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} ]}
# RTL Port declarations: 
set portNum 18
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ myMac_V sc_in sc_lv 48 signal 0 } 
	{ myIP_V sc_in sc_lv 32 signal 1 } 
	{ gateway_V sc_in sc_lv 32 signal 2 } 
	{ netmask_V sc_in sc_lv 32 signal 3 } 
	{ arptable_addr_V sc_out sc_lv 8 signal 4 } 
	{ arptable_data_V sc_in sc_lv 80 signal 5 } 
	{ call_for_responce_Mac_IP_V sc_in sc_lv 80 signal 6 } 
	{ call_for_responce_valid_V sc_in sc_lv 1 signal 7 } 
	{ lookup_req_V sc_in sc_lv 32 signal 8 } 
	{ lookup_result_V sc_out sc_lv 48 signal 9 } 
	{ arp_status_V sc_out sc_lv 2 signal 10 } 
	{ arp_out_data_V sc_out sc_lv 512 signal 11 } 
	{ arp_out_keep_V sc_out sc_lv 64 signal 12 } 
	{ arp_out_last_V sc_out sc_lv 1 signal 13 } 
	{ arp_out_valid_V sc_out sc_lv 1 signal 14 } 
	{ arp_out_ready_V sc_in sc_lv 1 signal 15 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "myMac_V", "direction": "in", "datatype": "sc_lv", "bitwidth":48, "type": "signal", "bundle":{"name": "myMac_V", "role": "default" }} , 
 	{ "name": "myIP_V", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "myIP_V", "role": "default" }} , 
 	{ "name": "gateway_V", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gateway_V", "role": "default" }} , 
 	{ "name": "netmask_V", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "netmask_V", "role": "default" }} , 
 	{ "name": "arptable_addr_V", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "arptable_addr_V", "role": "default" }} , 
 	{ "name": "arptable_data_V", "direction": "in", "datatype": "sc_lv", "bitwidth":80, "type": "signal", "bundle":{"name": "arptable_data_V", "role": "default" }} , 
 	{ "name": "call_for_responce_Mac_IP_V", "direction": "in", "datatype": "sc_lv", "bitwidth":80, "type": "signal", "bundle":{"name": "call_for_responce_Mac_IP_V", "role": "default" }} , 
 	{ "name": "call_for_responce_valid_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "call_for_responce_valid_V", "role": "default" }} , 
 	{ "name": "lookup_req_V", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "lookup_req_V", "role": "default" }} , 
 	{ "name": "lookup_result_V", "direction": "out", "datatype": "sc_lv", "bitwidth":48, "type": "signal", "bundle":{"name": "lookup_result_V", "role": "default" }} , 
 	{ "name": "arp_status_V", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "arp_status_V", "role": "default" }} , 
 	{ "name": "arp_out_data_V", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "arp_out_data_V", "role": "default" }} , 
 	{ "name": "arp_out_keep_V", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "arp_out_keep_V", "role": "default" }} , 
 	{ "name": "arp_out_last_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "arp_out_last_V", "role": "default" }} , 
 	{ "name": "arp_out_valid_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "arp_out_valid_V", "role": "default" }} , 
 	{ "name": "arp_out_ready_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "arp_out_ready_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2"],
		"CDFG" : "arp_send",
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
			{"Name" : "myMac_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "myIP_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "gateway_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "netmask_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "arptable_addr_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "arptable_data_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "call_for_responce_Mac_IP_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "call_for_responce_valid_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "lookup_req_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "lookup_result_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "arp_status_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "arp_out_data_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "arp_out_keep_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "arp_out_last_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "arp_out_valid_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "arp_out_ready_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "arptable_addr_reg_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lookup_result_reg_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "arp_status_reg_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "arp_out_reg_dst_mac_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "myMacReg_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "arp_out_reg_fixed_he", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "arp_out_reg_opcode_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "arp_out_reg_src_mac_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "arp_out_reg_src_ip_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "arp_out_reg_dst_ip_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "arp_out_reg_valid_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "send_req_fifo_rdidx_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "send_req_fifo_wridx_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "myIPReg_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "send_req_fifo_V_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "send_req_fifo_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "send_req_fifo_V_2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "send_req_fifo_V_3", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "send_resp_fifo_wridx", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "send_resp_fifo_ip_V_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "send_resp_fifo_ip_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "send_resp_fifo_ip_V_2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "send_resp_fifo_ip_V_3", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "send_resp_fifo_rdidx", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "send_resp_fifo_mac_V_3", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "send_resp_fifo_mac_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "send_resp_fifo_mac_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "send_resp_fifo_mac_V_2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "call_for_responce_re", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "call_for_responce_re_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "arp_timeout_cnt_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lookup_req_issued0_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lookup_req_issued1_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lookup_req_valid_reg_2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lookup_req_valid_reg", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lookup_req_valid_reg_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "netmaskReg_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "gatewayReg_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lookup_req_reg_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lookup_req_issued_V", "Type" : "OVld", "Direction" : "IO"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.arp_send_mux_42_32_1_1_U1", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.arp_send_mux_42_32_1_1_U2", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	arp_send {
		myMac_V {Type I LastRead 0 FirstWrite -1}
		myIP_V {Type I LastRead 0 FirstWrite -1}
		gateway_V {Type I LastRead 0 FirstWrite -1}
		netmask_V {Type I LastRead 0 FirstWrite -1}
		arptable_addr_V {Type O LastRead -1 FirstWrite 0}
		arptable_data_V {Type I LastRead 0 FirstWrite -1}
		call_for_responce_Mac_IP_V {Type I LastRead 0 FirstWrite -1}
		call_for_responce_valid_V {Type I LastRead 0 FirstWrite -1}
		lookup_req_V {Type I LastRead 0 FirstWrite -1}
		lookup_result_V {Type O LastRead -1 FirstWrite 0}
		arp_status_V {Type O LastRead -1 FirstWrite 0}
		arp_out_data_V {Type O LastRead -1 FirstWrite 0}
		arp_out_keep_V {Type O LastRead -1 FirstWrite 0}
		arp_out_last_V {Type O LastRead -1 FirstWrite 0}
		arp_out_valid_V {Type O LastRead -1 FirstWrite 0}
		arp_out_ready_V {Type I LastRead -1 FirstWrite -1}
		arptable_addr_reg_V {Type IO LastRead -1 FirstWrite -1}
		lookup_result_reg_V {Type IO LastRead -1 FirstWrite -1}
		arp_status_reg_V {Type IO LastRead -1 FirstWrite -1}
		arp_out_reg_dst_mac_s {Type IO LastRead -1 FirstWrite -1}
		myMacReg_V {Type IO LastRead -1 FirstWrite -1}
		arp_out_reg_fixed_he {Type IO LastRead -1 FirstWrite -1}
		arp_out_reg_opcode_V {Type IO LastRead -1 FirstWrite -1}
		arp_out_reg_src_mac_s {Type IO LastRead -1 FirstWrite -1}
		arp_out_reg_src_ip_V {Type IO LastRead -1 FirstWrite -1}
		arp_out_reg_dst_ip_V {Type IO LastRead -1 FirstWrite -1}
		arp_out_reg_valid_V {Type IO LastRead -1 FirstWrite -1}
		send_req_fifo_rdidx_s {Type IO LastRead -1 FirstWrite -1}
		send_req_fifo_wridx_s {Type IO LastRead -1 FirstWrite -1}
		myIPReg_V {Type IO LastRead -1 FirstWrite -1}
		send_req_fifo_V_0 {Type IO LastRead -1 FirstWrite -1}
		send_req_fifo_V_1 {Type IO LastRead -1 FirstWrite -1}
		send_req_fifo_V_2 {Type IO LastRead -1 FirstWrite -1}
		send_req_fifo_V_3 {Type IO LastRead -1 FirstWrite -1}
		send_resp_fifo_wridx {Type IO LastRead -1 FirstWrite -1}
		send_resp_fifo_ip_V_s {Type IO LastRead -1 FirstWrite -1}
		send_resp_fifo_ip_V_1 {Type IO LastRead -1 FirstWrite -1}
		send_resp_fifo_ip_V_2 {Type IO LastRead -1 FirstWrite -1}
		send_resp_fifo_ip_V_3 {Type IO LastRead -1 FirstWrite -1}
		send_resp_fifo_rdidx {Type IO LastRead -1 FirstWrite -1}
		send_resp_fifo_mac_V_3 {Type IO LastRead -1 FirstWrite -1}
		send_resp_fifo_mac_V {Type IO LastRead -1 FirstWrite -1}
		send_resp_fifo_mac_V_1 {Type IO LastRead -1 FirstWrite -1}
		send_resp_fifo_mac_V_2 {Type IO LastRead -1 FirstWrite -1}
		call_for_responce_re {Type IO LastRead -1 FirstWrite -1}
		call_for_responce_re_1 {Type IO LastRead -1 FirstWrite -1}
		arp_timeout_cnt_V {Type IO LastRead -1 FirstWrite -1}
		lookup_req_issued0_V {Type IO LastRead -1 FirstWrite -1}
		lookup_req_issued1_V {Type IO LastRead -1 FirstWrite -1}
		lookup_req_valid_reg_2 {Type IO LastRead -1 FirstWrite -1}
		lookup_req_valid_reg {Type IO LastRead -1 FirstWrite -1}
		lookup_req_valid_reg_1 {Type IO LastRead -1 FirstWrite -1}
		netmaskReg_V {Type IO LastRead -1 FirstWrite -1}
		gatewayReg_V {Type IO LastRead -1 FirstWrite -1}
		lookup_req_reg_V {Type IO LastRead -1 FirstWrite -1}
		lookup_req_issued_V {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "0", "Max" : "0"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	myMac_V { ap_none {  { myMac_V in_data 0 48 } } }
	myIP_V { ap_none {  { myIP_V in_data 0 32 } } }
	gateway_V { ap_none {  { gateway_V in_data 0 32 } } }
	netmask_V { ap_none {  { netmask_V in_data 0 32 } } }
	arptable_addr_V { ap_none {  { arptable_addr_V out_data 1 8 } } }
	arptable_data_V { ap_none {  { arptable_data_V in_data 0 80 } } }
	call_for_responce_Mac_IP_V { ap_none {  { call_for_responce_Mac_IP_V in_data 0 80 } } }
	call_for_responce_valid_V { ap_none {  { call_for_responce_valid_V in_data 0 1 } } }
	lookup_req_V { ap_none {  { lookup_req_V in_data 0 32 } } }
	lookup_result_V { ap_none {  { lookup_result_V out_data 1 48 } } }
	arp_status_V { ap_none {  { arp_status_V out_data 1 2 } } }
	arp_out_data_V { ap_none {  { arp_out_data_V out_data 1 512 } } }
	arp_out_keep_V { ap_none {  { arp_out_keep_V out_data 1 64 } } }
	arp_out_last_V { ap_none {  { arp_out_last_V out_data 1 1 } } }
	arp_out_valid_V { ap_none {  { arp_out_valid_V out_data 1 1 } } }
	arp_out_ready_V { ap_none {  { arp_out_ready_V in_data 0 1 } } }
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
