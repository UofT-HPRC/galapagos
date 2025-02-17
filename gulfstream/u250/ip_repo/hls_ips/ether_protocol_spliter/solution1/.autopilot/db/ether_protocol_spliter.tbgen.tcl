set moduleName ether_protocol_spliter
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
set C_modelName {ether_protocol_spliter}
set C_modelType { void 0 }
set C_modelArgList {
	{ myMacAddr_V int 48 regular  }
	{ s_axis_data_V int 512 regular  }
	{ s_axis_keep_V int 64 regular  }
	{ s_axis_last_V int 1 regular  }
	{ s_axis_valid_V int 1 regular  }
	{ arp_data_V int 336 regular {pointer 1}  }
	{ arp_valid_V int 1 regular {pointer 1}  }
	{ ip_data_V int 336 regular {pointer 1}  }
	{ ip_valid_V int 1 regular {pointer 1}  }
	{ payload_data_V int 512 regular {pointer 1}  }
	{ payload_valid_V int 1 regular {pointer 1}  }
	{ payload_last_V int 1 regular {pointer 1}  }
	{ payload_len_data_V int 16 regular {pointer 1}  }
	{ payload_len_valid_V int 1 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "myMacAddr_V", "interface" : "wire", "bitwidth" : 48, "direction" : "READONLY", "bitSlice":[{"low":0,"up":47,"cElement": [{"cName": "myMacAddr.V","cData": "uint48","bit_use": { "low": 0,"up": 47},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "s_axis_data_V", "interface" : "wire", "bitwidth" : 512, "direction" : "READONLY", "bitSlice":[{"low":0,"up":511,"cElement": [{"cName": "s_axis.data.V","cData": "uint512","bit_use": { "low": 0,"up": 511},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "s_axis_keep_V", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "s_axis.keep.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "s_axis_last_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "s_axis.last.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "s_axis_valid_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "s_axis.valid.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "arp_data_V", "interface" : "wire", "bitwidth" : 336, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":335,"cElement": [{"cName": "arp.data.V","cData": "uint336","bit_use": { "low": 0,"up": 335},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "arp_valid_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "arp.valid.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "ip_data_V", "interface" : "wire", "bitwidth" : 336, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":335,"cElement": [{"cName": "ip.data.V","cData": "uint336","bit_use": { "low": 0,"up": 335},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "ip_valid_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "ip.valid.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "payload_data_V", "interface" : "wire", "bitwidth" : 512, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":511,"cElement": [{"cName": "payload.data.V","cData": "uint512","bit_use": { "low": 0,"up": 511},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "payload_valid_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "payload.valid.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "payload_last_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "payload.last.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "payload_len_data_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "payload_len.data.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "payload_len_valid_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "payload_len.valid.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} ]}
# RTL Port declarations: 
set portNum 16
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ myMacAddr_V sc_in sc_lv 48 signal 0 } 
	{ s_axis_data_V sc_in sc_lv 512 signal 1 } 
	{ s_axis_keep_V sc_in sc_lv 64 signal 2 } 
	{ s_axis_last_V sc_in sc_lv 1 signal 3 } 
	{ s_axis_valid_V sc_in sc_lv 1 signal 4 } 
	{ arp_data_V sc_out sc_lv 336 signal 5 } 
	{ arp_valid_V sc_out sc_lv 1 signal 6 } 
	{ ip_data_V sc_out sc_lv 336 signal 7 } 
	{ ip_valid_V sc_out sc_lv 1 signal 8 } 
	{ payload_data_V sc_out sc_lv 512 signal 9 } 
	{ payload_valid_V sc_out sc_lv 1 signal 10 } 
	{ payload_last_V sc_out sc_lv 1 signal 11 } 
	{ payload_len_data_V sc_out sc_lv 16 signal 12 } 
	{ payload_len_valid_V sc_out sc_lv 1 signal 13 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "myMacAddr_V", "direction": "in", "datatype": "sc_lv", "bitwidth":48, "type": "signal", "bundle":{"name": "myMacAddr_V", "role": "default" }} , 
 	{ "name": "s_axis_data_V", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "s_axis_data_V", "role": "default" }} , 
 	{ "name": "s_axis_keep_V", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "s_axis_keep_V", "role": "default" }} , 
 	{ "name": "s_axis_last_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_axis_last_V", "role": "default" }} , 
 	{ "name": "s_axis_valid_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_axis_valid_V", "role": "default" }} , 
 	{ "name": "arp_data_V", "direction": "out", "datatype": "sc_lv", "bitwidth":336, "type": "signal", "bundle":{"name": "arp_data_V", "role": "default" }} , 
 	{ "name": "arp_valid_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "arp_valid_V", "role": "default" }} , 
 	{ "name": "ip_data_V", "direction": "out", "datatype": "sc_lv", "bitwidth":336, "type": "signal", "bundle":{"name": "ip_data_V", "role": "default" }} , 
 	{ "name": "ip_valid_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ip_valid_V", "role": "default" }} , 
 	{ "name": "payload_data_V", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "payload_data_V", "role": "default" }} , 
 	{ "name": "payload_valid_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "payload_valid_V", "role": "default" }} , 
 	{ "name": "payload_last_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "payload_last_V", "role": "default" }} , 
 	{ "name": "payload_len_data_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "payload_len_data_V", "role": "default" }} , 
 	{ "name": "payload_len_valid_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "payload_len_valid_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "ether_protocol_spliter",
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
			{"Name" : "myMacAddr_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "s_axis_data_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "s_axis_keep_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "s_axis_last_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "s_axis_valid_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "arp_data_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "arp_valid_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "ip_data_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "ip_valid_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "payload_data_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "payload_valid_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "payload_last_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "payload_len_data_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "payload_len_valid_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "arp_output_reg_data_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "arp_output_reg_valid", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_output_reg_data_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ip_output_reg_valid_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "payload_output_reg_d", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "payload_output_reg_v", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "payload_output_reg_l", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "payload_len_reg_data", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "payload_len_reg_vali", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "axis_input_reg_valid", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "axis_input_reg_data_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "myMacAddr_reg_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "in_ip_packet_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "axis_input_reg_last_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "axis_input_reg_keep_s", "Type" : "OVld", "Direction" : "IO"}]}]}


set ArgLastReadFirstWriteLatency {
	ether_protocol_spliter {
		myMacAddr_V {Type I LastRead 0 FirstWrite -1}
		s_axis_data_V {Type I LastRead 0 FirstWrite -1}
		s_axis_keep_V {Type I LastRead 0 FirstWrite -1}
		s_axis_last_V {Type I LastRead 0 FirstWrite -1}
		s_axis_valid_V {Type I LastRead 0 FirstWrite -1}
		arp_data_V {Type O LastRead -1 FirstWrite 0}
		arp_valid_V {Type O LastRead -1 FirstWrite 0}
		ip_data_V {Type O LastRead -1 FirstWrite 0}
		ip_valid_V {Type O LastRead -1 FirstWrite 0}
		payload_data_V {Type O LastRead -1 FirstWrite 0}
		payload_valid_V {Type O LastRead -1 FirstWrite 0}
		payload_last_V {Type O LastRead -1 FirstWrite 0}
		payload_len_data_V {Type O LastRead -1 FirstWrite 0}
		payload_len_valid_V {Type O LastRead -1 FirstWrite 0}
		arp_output_reg_data_s {Type IO LastRead -1 FirstWrite -1}
		arp_output_reg_valid {Type IO LastRead -1 FirstWrite -1}
		ip_output_reg_data_V {Type IO LastRead -1 FirstWrite -1}
		ip_output_reg_valid_s {Type IO LastRead -1 FirstWrite -1}
		payload_output_reg_d {Type IO LastRead -1 FirstWrite -1}
		payload_output_reg_v {Type IO LastRead -1 FirstWrite -1}
		payload_output_reg_l {Type IO LastRead -1 FirstWrite -1}
		payload_len_reg_data {Type IO LastRead -1 FirstWrite -1}
		payload_len_reg_vali {Type IO LastRead -1 FirstWrite -1}
		axis_input_reg_valid {Type IO LastRead -1 FirstWrite -1}
		axis_input_reg_data_s {Type IO LastRead -1 FirstWrite -1}
		myMacAddr_reg_V {Type IO LastRead -1 FirstWrite -1}
		in_ip_packet_V {Type IO LastRead -1 FirstWrite -1}
		axis_input_reg_last_s {Type IO LastRead -1 FirstWrite -1}
		axis_input_reg_keep_s {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "0", "Max" : "0"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	myMacAddr_V { ap_none {  { myMacAddr_V in_data 0 48 } } }
	s_axis_data_V { ap_none {  { s_axis_data_V in_data 0 512 } } }
	s_axis_keep_V { ap_none {  { s_axis_keep_V in_data 0 64 } } }
	s_axis_last_V { ap_none {  { s_axis_last_V in_data 0 1 } } }
	s_axis_valid_V { ap_none {  { s_axis_valid_V in_data 0 1 } } }
	arp_data_V { ap_none {  { arp_data_V out_data 1 336 } } }
	arp_valid_V { ap_none {  { arp_valid_V out_data 1 1 } } }
	ip_data_V { ap_none {  { ip_data_V out_data 1 336 } } }
	ip_valid_V { ap_none {  { ip_valid_V out_data 1 1 } } }
	payload_data_V { ap_none {  { payload_data_V out_data 1 512 } } }
	payload_valid_V { ap_none {  { payload_valid_V out_data 1 1 } } }
	payload_last_V { ap_none {  { payload_last_V out_data 1 1 } } }
	payload_len_data_V { ap_none {  { payload_len_data_V out_data 1 16 } } }
	payload_len_valid_V { ap_none {  { payload_len_valid_V out_data 1 1 } } }
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
