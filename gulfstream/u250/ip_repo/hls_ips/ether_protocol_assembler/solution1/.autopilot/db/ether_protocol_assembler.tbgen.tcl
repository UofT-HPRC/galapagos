set moduleName ether_protocol_assembler
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
set C_modelName {ether_protocol_assembler}
set C_modelType { void 0 }
set C_modelArgList {
	{ eth_arp_in_data_V int 512 regular  }
	{ eth_arp_in_keep_V int 64 regular  }
	{ eth_arp_in_valid_V int 1 regular  }
	{ eth_arp_in_last_V int 1 regular  }
	{ arp_ready_V int 1 regular {pointer 1}  }
	{ eth_ip_in_data_V int 512 regular  }
	{ eth_ip_in_keep_V int 64 regular  }
	{ eth_ip_in_valid_V int 1 regular  }
	{ eth_ip_in_last_V int 1 regular  }
	{ ip_ready_V int 1 regular {pointer 1}  }
	{ eth_out_data_V int 512 regular {pointer 1}  }
	{ eth_out_keep_V int 64 regular {pointer 1}  }
	{ eth_out_valid_V int 1 regular {pointer 1}  }
	{ eth_out_last_V int 1 regular {pointer 1}  }
	{ eth_out_ready_V int 1 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "eth_arp_in_data_V", "interface" : "wire", "bitwidth" : 512, "direction" : "READONLY", "bitSlice":[{"low":0,"up":511,"cElement": [{"cName": "eth_arp_in.data.V","cData": "uint512","bit_use": { "low": 0,"up": 511},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "eth_arp_in_keep_V", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "eth_arp_in.keep.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "eth_arp_in_valid_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "eth_arp_in.valid.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "eth_arp_in_last_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "eth_arp_in.last.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "arp_ready_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "arp_ready.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "eth_ip_in_data_V", "interface" : "wire", "bitwidth" : 512, "direction" : "READONLY", "bitSlice":[{"low":0,"up":511,"cElement": [{"cName": "eth_ip_in.data.V","cData": "uint512","bit_use": { "low": 0,"up": 511},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "eth_ip_in_keep_V", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "eth_ip_in.keep.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "eth_ip_in_valid_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "eth_ip_in.valid.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "eth_ip_in_last_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "eth_ip_in.last.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "ip_ready_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "ip_ready.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "eth_out_data_V", "interface" : "wire", "bitwidth" : 512, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":511,"cElement": [{"cName": "eth_out.data.V","cData": "uint512","bit_use": { "low": 0,"up": 511},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "eth_out_keep_V", "interface" : "wire", "bitwidth" : 64, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "eth_out.keep.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "eth_out_valid_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "eth_out.valid.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "eth_out_last_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "eth_out.last.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "eth_out_ready_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "eth_out_ready.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} ]}
# RTL Port declarations: 
set portNum 17
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ eth_arp_in_data_V sc_in sc_lv 512 signal 0 } 
	{ eth_arp_in_keep_V sc_in sc_lv 64 signal 1 } 
	{ eth_arp_in_valid_V sc_in sc_lv 1 signal 2 } 
	{ eth_arp_in_last_V sc_in sc_lv 1 signal 3 } 
	{ arp_ready_V sc_out sc_lv 1 signal 4 } 
	{ eth_ip_in_data_V sc_in sc_lv 512 signal 5 } 
	{ eth_ip_in_keep_V sc_in sc_lv 64 signal 6 } 
	{ eth_ip_in_valid_V sc_in sc_lv 1 signal 7 } 
	{ eth_ip_in_last_V sc_in sc_lv 1 signal 8 } 
	{ ip_ready_V sc_out sc_lv 1 signal 9 } 
	{ eth_out_data_V sc_out sc_lv 512 signal 10 } 
	{ eth_out_keep_V sc_out sc_lv 64 signal 11 } 
	{ eth_out_valid_V sc_out sc_lv 1 signal 12 } 
	{ eth_out_last_V sc_out sc_lv 1 signal 13 } 
	{ eth_out_ready_V sc_in sc_lv 1 signal 14 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "eth_arp_in_data_V", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "eth_arp_in_data_V", "role": "default" }} , 
 	{ "name": "eth_arp_in_keep_V", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "eth_arp_in_keep_V", "role": "default" }} , 
 	{ "name": "eth_arp_in_valid_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "eth_arp_in_valid_V", "role": "default" }} , 
 	{ "name": "eth_arp_in_last_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "eth_arp_in_last_V", "role": "default" }} , 
 	{ "name": "arp_ready_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "arp_ready_V", "role": "default" }} , 
 	{ "name": "eth_ip_in_data_V", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "eth_ip_in_data_V", "role": "default" }} , 
 	{ "name": "eth_ip_in_keep_V", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "eth_ip_in_keep_V", "role": "default" }} , 
 	{ "name": "eth_ip_in_valid_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "eth_ip_in_valid_V", "role": "default" }} , 
 	{ "name": "eth_ip_in_last_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "eth_ip_in_last_V", "role": "default" }} , 
 	{ "name": "ip_ready_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ip_ready_V", "role": "default" }} , 
 	{ "name": "eth_out_data_V", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "eth_out_data_V", "role": "default" }} , 
 	{ "name": "eth_out_keep_V", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "eth_out_keep_V", "role": "default" }} , 
 	{ "name": "eth_out_valid_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "eth_out_valid_V", "role": "default" }} , 
 	{ "name": "eth_out_last_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "eth_out_last_V", "role": "default" }} , 
 	{ "name": "eth_out_ready_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "eth_out_ready_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "ether_protocol_assembler",
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
			{"Name" : "eth_arp_in_data_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "eth_arp_in_keep_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "eth_arp_in_valid_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "eth_arp_in_last_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "arp_ready_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "eth_ip_in_data_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "eth_ip_in_keep_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "eth_ip_in_valid_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "eth_ip_in_last_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "ip_ready_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "eth_out_data_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "eth_out_keep_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "eth_out_valid_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "eth_out_last_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "eth_out_ready_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "eth_out_reg_data_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "eth_out_reg_keep_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "eth_out_reg_valid_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "eth_out_reg_last_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "arbiter_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "output_sw_reg_V", "Type" : "OVld", "Direction" : "IO"}]}]}


set ArgLastReadFirstWriteLatency {
	ether_protocol_assembler {
		eth_arp_in_data_V {Type I LastRead 0 FirstWrite -1}
		eth_arp_in_keep_V {Type I LastRead 0 FirstWrite -1}
		eth_arp_in_valid_V {Type I LastRead 0 FirstWrite -1}
		eth_arp_in_last_V {Type I LastRead 0 FirstWrite -1}
		arp_ready_V {Type O LastRead -1 FirstWrite 0}
		eth_ip_in_data_V {Type I LastRead 0 FirstWrite -1}
		eth_ip_in_keep_V {Type I LastRead 0 FirstWrite -1}
		eth_ip_in_valid_V {Type I LastRead 0 FirstWrite -1}
		eth_ip_in_last_V {Type I LastRead 0 FirstWrite -1}
		ip_ready_V {Type O LastRead -1 FirstWrite 0}
		eth_out_data_V {Type O LastRead -1 FirstWrite 0}
		eth_out_keep_V {Type O LastRead -1 FirstWrite 0}
		eth_out_valid_V {Type O LastRead -1 FirstWrite 0}
		eth_out_last_V {Type O LastRead -1 FirstWrite 0}
		eth_out_ready_V {Type I LastRead 0 FirstWrite -1}
		eth_out_reg_data_V {Type IO LastRead -1 FirstWrite -1}
		eth_out_reg_keep_V {Type IO LastRead -1 FirstWrite -1}
		eth_out_reg_valid_V {Type IO LastRead -1 FirstWrite -1}
		eth_out_reg_last_V {Type IO LastRead -1 FirstWrite -1}
		arbiter_V {Type IO LastRead -1 FirstWrite -1}
		output_sw_reg_V {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "0", "Max" : "0"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	eth_arp_in_data_V { ap_none {  { eth_arp_in_data_V in_data 0 512 } } }
	eth_arp_in_keep_V { ap_none {  { eth_arp_in_keep_V in_data 0 64 } } }
	eth_arp_in_valid_V { ap_none {  { eth_arp_in_valid_V in_data 0 1 } } }
	eth_arp_in_last_V { ap_none {  { eth_arp_in_last_V in_data 0 1 } } }
	arp_ready_V { ap_none {  { arp_ready_V out_data 1 1 } } }
	eth_ip_in_data_V { ap_none {  { eth_ip_in_data_V in_data 0 512 } } }
	eth_ip_in_keep_V { ap_none {  { eth_ip_in_keep_V in_data 0 64 } } }
	eth_ip_in_valid_V { ap_none {  { eth_ip_in_valid_V in_data 0 1 } } }
	eth_ip_in_last_V { ap_none {  { eth_ip_in_last_V in_data 0 1 } } }
	ip_ready_V { ap_none {  { ip_ready_V out_data 1 1 } } }
	eth_out_data_V { ap_none {  { eth_out_data_V out_data 1 512 } } }
	eth_out_keep_V { ap_none {  { eth_out_keep_V out_data 1 64 } } }
	eth_out_valid_V { ap_none {  { eth_out_valid_V out_data 1 1 } } }
	eth_out_last_V { ap_none {  { eth_out_last_V out_data 1 1 } } }
	eth_out_ready_V { ap_none {  { eth_out_ready_V in_data 0 1 } } }
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
