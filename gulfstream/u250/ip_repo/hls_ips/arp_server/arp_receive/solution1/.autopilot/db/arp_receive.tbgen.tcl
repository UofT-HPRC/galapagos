set moduleName arp_receive
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
set C_modelName {arp_receive}
set C_modelType { void 0 }
set C_modelArgList {
	{ myIP_V int 32 regular  }
	{ arp_in_data_V int 336 regular  }
	{ arp_in_valid_V int 1 regular  }
	{ arp_internal_resp_Mac_IP_V int 80 regular  }
	{ arp_internal_resp_valid_V int 1 regular  }
	{ call_for_responce_Mac_IP_V int 80 regular {pointer 1}  }
	{ call_for_responce_valid_V int 1 regular {pointer 1}  }
	{ arptable_dataout_Mac_IP_V int 80 regular {pointer 1}  }
	{ arptable_dataout_valid_V int 1 regular {pointer 1}  }
	{ arptable_addrout_V int 8 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "myIP_V", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "myIP.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "arp_in_data_V", "interface" : "wire", "bitwidth" : 336, "direction" : "READONLY", "bitSlice":[{"low":0,"up":335,"cElement": [{"cName": "arp_in.data.V","cData": "uint336","bit_use": { "low": 0,"up": 335},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "arp_in_valid_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "arp_in.valid.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "arp_internal_resp_Mac_IP_V", "interface" : "wire", "bitwidth" : 80, "direction" : "READONLY", "bitSlice":[{"low":0,"up":79,"cElement": [{"cName": "arp_internal_resp.Mac_IP.V","cData": "uint80","bit_use": { "low": 0,"up": 79},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "arp_internal_resp_valid_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "arp_internal_resp.valid.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "call_for_responce_Mac_IP_V", "interface" : "wire", "bitwidth" : 80, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":79,"cElement": [{"cName": "call_for_responce.Mac_IP.V","cData": "uint80","bit_use": { "low": 0,"up": 79},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "call_for_responce_valid_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "call_for_responce.valid.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "arptable_dataout_Mac_IP_V", "interface" : "wire", "bitwidth" : 80, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":79,"cElement": [{"cName": "arptable_dataout.Mac_IP.V","cData": "uint80","bit_use": { "low": 0,"up": 79},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "arptable_dataout_valid_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "arptable_dataout.valid.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "arptable_addrout_V", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "arptable_addrout.V","cData": "uint8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} ]}
# RTL Port declarations: 
set portNum 12
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ myIP_V sc_in sc_lv 32 signal 0 } 
	{ arp_in_data_V sc_in sc_lv 336 signal 1 } 
	{ arp_in_valid_V sc_in sc_lv 1 signal 2 } 
	{ arp_internal_resp_Mac_IP_V sc_in sc_lv 80 signal 3 } 
	{ arp_internal_resp_valid_V sc_in sc_lv 1 signal 4 } 
	{ call_for_responce_Mac_IP_V sc_out sc_lv 80 signal 5 } 
	{ call_for_responce_valid_V sc_out sc_lv 1 signal 6 } 
	{ arptable_dataout_Mac_IP_V sc_out sc_lv 80 signal 7 } 
	{ arptable_dataout_valid_V sc_out sc_lv 1 signal 8 } 
	{ arptable_addrout_V sc_out sc_lv 8 signal 9 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "myIP_V", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "myIP_V", "role": "default" }} , 
 	{ "name": "arp_in_data_V", "direction": "in", "datatype": "sc_lv", "bitwidth":336, "type": "signal", "bundle":{"name": "arp_in_data_V", "role": "default" }} , 
 	{ "name": "arp_in_valid_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "arp_in_valid_V", "role": "default" }} , 
 	{ "name": "arp_internal_resp_Mac_IP_V", "direction": "in", "datatype": "sc_lv", "bitwidth":80, "type": "signal", "bundle":{"name": "arp_internal_resp_Mac_IP_V", "role": "default" }} , 
 	{ "name": "arp_internal_resp_valid_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "arp_internal_resp_valid_V", "role": "default" }} , 
 	{ "name": "call_for_responce_Mac_IP_V", "direction": "out", "datatype": "sc_lv", "bitwidth":80, "type": "signal", "bundle":{"name": "call_for_responce_Mac_IP_V", "role": "default" }} , 
 	{ "name": "call_for_responce_valid_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "call_for_responce_valid_V", "role": "default" }} , 
 	{ "name": "arptable_dataout_Mac_IP_V", "direction": "out", "datatype": "sc_lv", "bitwidth":80, "type": "signal", "bundle":{"name": "arptable_dataout_Mac_IP_V", "role": "default" }} , 
 	{ "name": "arptable_dataout_valid_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "arptable_dataout_valid_V", "role": "default" }} , 
 	{ "name": "arptable_addrout_V", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "arptable_addrout_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "arp_receive",
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
			{"Name" : "arp_in_data_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "arp_in_valid_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "arp_internal_resp_Mac_IP_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "arp_internal_resp_valid_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "call_for_responce_Mac_IP_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "call_for_responce_valid_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "arptable_dataout_Mac_IP_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "arptable_dataout_valid_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "arptable_addrout_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "call_for_responce_re_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "call_for_responce_re", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "arptable_dataout_reg_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "arptable_dataout_reg", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "arptable_addrout_reg", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "arp_in_reg_valid_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "arp_in_reg_fixed_hea", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "arp_in_reg_dst_ip_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "myIPReg_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "arp_in_reg_opcode_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "arp_in_reg_dst_mac_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "arp_in_reg_src_ip_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "arp_internal_resp_va", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "arp_in_reg_src_mac_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "eth_src_mac_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "arp_internal_resp_re", "Type" : "OVld", "Direction" : "IO"}]}]}


set ArgLastReadFirstWriteLatency {
	arp_receive {
		myIP_V {Type I LastRead 0 FirstWrite -1}
		arp_in_data_V {Type I LastRead 0 FirstWrite -1}
		arp_in_valid_V {Type I LastRead 0 FirstWrite -1}
		arp_internal_resp_Mac_IP_V {Type I LastRead 0 FirstWrite -1}
		arp_internal_resp_valid_V {Type I LastRead 0 FirstWrite -1}
		call_for_responce_Mac_IP_V {Type O LastRead -1 FirstWrite 0}
		call_for_responce_valid_V {Type O LastRead -1 FirstWrite 0}
		arptable_dataout_Mac_IP_V {Type O LastRead -1 FirstWrite 0}
		arptable_dataout_valid_V {Type O LastRead -1 FirstWrite 0}
		arptable_addrout_V {Type O LastRead -1 FirstWrite 0}
		call_for_responce_re_1 {Type IO LastRead -1 FirstWrite -1}
		call_for_responce_re {Type IO LastRead -1 FirstWrite -1}
		arptable_dataout_reg_1 {Type IO LastRead -1 FirstWrite -1}
		arptable_dataout_reg {Type IO LastRead -1 FirstWrite -1}
		arptable_addrout_reg {Type IO LastRead -1 FirstWrite -1}
		arp_in_reg_valid_V {Type IO LastRead -1 FirstWrite -1}
		arp_in_reg_fixed_hea {Type IO LastRead -1 FirstWrite -1}
		arp_in_reg_dst_ip_V {Type IO LastRead -1 FirstWrite -1}
		myIPReg_V {Type IO LastRead -1 FirstWrite -1}
		arp_in_reg_opcode_V {Type IO LastRead -1 FirstWrite -1}
		arp_in_reg_dst_mac_V {Type IO LastRead -1 FirstWrite -1}
		arp_in_reg_src_ip_V {Type IO LastRead -1 FirstWrite -1}
		arp_internal_resp_va {Type IO LastRead -1 FirstWrite -1}
		arp_in_reg_src_mac_V {Type IO LastRead -1 FirstWrite -1}
		eth_src_mac_V {Type IO LastRead -1 FirstWrite -1}
		arp_internal_resp_re {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "0", "Max" : "0"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	myIP_V { ap_none {  { myIP_V in_data 0 32 } } }
	arp_in_data_V { ap_none {  { arp_in_data_V in_data 0 336 } } }
	arp_in_valid_V { ap_none {  { arp_in_valid_V in_data 0 1 } } }
	arp_internal_resp_Mac_IP_V { ap_none {  { arp_internal_resp_Mac_IP_V in_data 0 80 } } }
	arp_internal_resp_valid_V { ap_none {  { arp_internal_resp_valid_V in_data 0 1 } } }
	call_for_responce_Mac_IP_V { ap_none {  { call_for_responce_Mac_IP_V out_data 1 80 } } }
	call_for_responce_valid_V { ap_none {  { call_for_responce_valid_V out_data 1 1 } } }
	arptable_dataout_Mac_IP_V { ap_none {  { arptable_dataout_Mac_IP_V out_data 1 80 } } }
	arptable_dataout_valid_V { ap_none {  { arptable_dataout_valid_V out_data 1 1 } } }
	arptable_addrout_V { ap_none {  { arptable_addrout_V out_data 1 8 } } }
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
