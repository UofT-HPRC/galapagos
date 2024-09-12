set moduleName action_excecutor
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
set C_modelName {action_excecutor}
set C_modelType { void 0 }
set C_modelArgList {
	{ action int 65 regular  }
	{ action_valid_V int 1 regular  }
	{ action_empty_V int 1 regular  }
	{ action_re_V int 1 regular {pointer 1}  }
	{ payload_in_data_V int 512 regular  }
	{ payload_in_keep_V int 64 regular  }
	{ payload_in_valid_V int 1 regular  }
	{ payload_in_last_V int 1 regular  }
	{ payload_ready_V int 1 regular {pointer 1}  }
	{ payload_out_data_V int 512 regular {pointer 1}  }
	{ payload_out_keep_V int 64 regular {pointer 1}  }
	{ payload_out_valid_V int 1 regular {pointer 1}  }
	{ payload_out_last_V int 1 regular {pointer 1}  }
	{ src_ip_V int 32 regular {pointer 1}  }
	{ src_port_V int 16 regular {pointer 1}  }
	{ dst_port_V int 16 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "action", "interface" : "wire", "bitwidth" : 65, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "action.src_ip.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]},{"low":32,"up":47,"cElement": [{"cName": "action.src_port.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]},{"low":48,"up":63,"cElement": [{"cName": "action.dst_port.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]},{"low":64,"up":64,"cElement": [{"cName": "action.action.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "action_valid_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "action_valid.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "action_empty_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "action_empty.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "action_re_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "action_re.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "payload_in_data_V", "interface" : "wire", "bitwidth" : 512, "direction" : "READONLY", "bitSlice":[{"low":0,"up":511,"cElement": [{"cName": "payload_in.data.V","cData": "uint512","bit_use": { "low": 0,"up": 511},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "payload_in_keep_V", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "payload_in.keep.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "payload_in_valid_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "payload_in.valid.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "payload_in_last_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "payload_in.last.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "payload_ready_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "payload_ready.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "payload_out_data_V", "interface" : "wire", "bitwidth" : 512, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":511,"cElement": [{"cName": "payload_out.data.V","cData": "uint512","bit_use": { "low": 0,"up": 511},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "payload_out_keep_V", "interface" : "wire", "bitwidth" : 64, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "payload_out.keep.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "payload_out_valid_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "payload_out.valid.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "payload_out_last_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "payload_out.last.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "src_ip_V", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "src_ip.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "src_port_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "src_port.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "dst_port_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "dst_port.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} ]}
# RTL Port declarations: 
set portNum 18
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ action sc_in sc_lv 65 signal 0 } 
	{ action_valid_V sc_in sc_lv 1 signal 1 } 
	{ action_empty_V sc_in sc_lv 1 signal 2 } 
	{ action_re_V sc_out sc_lv 1 signal 3 } 
	{ payload_in_data_V sc_in sc_lv 512 signal 4 } 
	{ payload_in_keep_V sc_in sc_lv 64 signal 5 } 
	{ payload_in_valid_V sc_in sc_lv 1 signal 6 } 
	{ payload_in_last_V sc_in sc_lv 1 signal 7 } 
	{ payload_ready_V sc_out sc_lv 1 signal 8 } 
	{ payload_out_data_V sc_out sc_lv 512 signal 9 } 
	{ payload_out_keep_V sc_out sc_lv 64 signal 10 } 
	{ payload_out_valid_V sc_out sc_lv 1 signal 11 } 
	{ payload_out_last_V sc_out sc_lv 1 signal 12 } 
	{ src_ip_V sc_out sc_lv 32 signal 13 } 
	{ src_port_V sc_out sc_lv 16 signal 14 } 
	{ dst_port_V sc_out sc_lv 16 signal 15 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "action", "direction": "in", "datatype": "sc_lv", "bitwidth":65, "type": "signal", "bundle":{"name": "action", "role": "default" }} , 
 	{ "name": "action_valid_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "action_valid_V", "role": "default" }} , 
 	{ "name": "action_empty_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "action_empty_V", "role": "default" }} , 
 	{ "name": "action_re_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "action_re_V", "role": "default" }} , 
 	{ "name": "payload_in_data_V", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "payload_in_data_V", "role": "default" }} , 
 	{ "name": "payload_in_keep_V", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "payload_in_keep_V", "role": "default" }} , 
 	{ "name": "payload_in_valid_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "payload_in_valid_V", "role": "default" }} , 
 	{ "name": "payload_in_last_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "payload_in_last_V", "role": "default" }} , 
 	{ "name": "payload_ready_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "payload_ready_V", "role": "default" }} , 
 	{ "name": "payload_out_data_V", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "payload_out_data_V", "role": "default" }} , 
 	{ "name": "payload_out_keep_V", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "payload_out_keep_V", "role": "default" }} , 
 	{ "name": "payload_out_valid_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "payload_out_valid_V", "role": "default" }} , 
 	{ "name": "payload_out_last_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "payload_out_last_V", "role": "default" }} , 
 	{ "name": "src_ip_V", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "src_ip_V", "role": "default" }} , 
 	{ "name": "src_port_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "src_port_V", "role": "default" }} , 
 	{ "name": "dst_port_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "dst_port_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "action_excecutor",
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
			{"Name" : "action", "Type" : "None", "Direction" : "I"},
			{"Name" : "action_valid_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "action_empty_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "action_re_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "payload_in_data_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "payload_in_keep_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "payload_in_valid_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "payload_in_last_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "payload_ready_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "payload_out_data_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "payload_out_keep_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "payload_out_valid_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "payload_out_last_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "src_ip_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "src_port_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "dst_port_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "payload_out_reg_data", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "payload_out_reg_keep", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "payload_out_reg_vali", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "payload_out_reg_last", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "src_ip_reg_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "src_port_reg_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dst_port_reg_V", "Type" : "OVld", "Direction" : "IO"}]}]}


set ArgLastReadFirstWriteLatency {
	action_excecutor {
		action {Type I LastRead 0 FirstWrite -1}
		action_valid_V {Type I LastRead 0 FirstWrite -1}
		action_empty_V {Type I LastRead 0 FirstWrite -1}
		action_re_V {Type O LastRead -1 FirstWrite 0}
		payload_in_data_V {Type I LastRead 0 FirstWrite -1}
		payload_in_keep_V {Type I LastRead 0 FirstWrite -1}
		payload_in_valid_V {Type I LastRead 0 FirstWrite -1}
		payload_in_last_V {Type I LastRead 0 FirstWrite -1}
		payload_ready_V {Type O LastRead -1 FirstWrite 0}
		payload_out_data_V {Type O LastRead -1 FirstWrite 0}
		payload_out_keep_V {Type O LastRead -1 FirstWrite 0}
		payload_out_valid_V {Type O LastRead -1 FirstWrite 0}
		payload_out_last_V {Type O LastRead -1 FirstWrite 0}
		src_ip_V {Type O LastRead -1 FirstWrite 0}
		src_port_V {Type O LastRead -1 FirstWrite 0}
		dst_port_V {Type O LastRead -1 FirstWrite 0}
		payload_out_reg_data {Type IO LastRead -1 FirstWrite -1}
		payload_out_reg_keep {Type IO LastRead -1 FirstWrite -1}
		payload_out_reg_vali {Type IO LastRead -1 FirstWrite -1}
		payload_out_reg_last {Type IO LastRead -1 FirstWrite -1}
		src_ip_reg_V {Type IO LastRead -1 FirstWrite -1}
		src_port_reg_V {Type IO LastRead -1 FirstWrite -1}
		dst_port_reg_V {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "0", "Max" : "0"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	action { ap_none {  { action in_data 0 65 } } }
	action_valid_V { ap_none {  { action_valid_V in_data 0 1 } } }
	action_empty_V { ap_none {  { action_empty_V in_data 0 1 } } }
	action_re_V { ap_none {  { action_re_V out_data 1 1 } } }
	payload_in_data_V { ap_none {  { payload_in_data_V in_data 0 512 } } }
	payload_in_keep_V { ap_none {  { payload_in_keep_V in_data 0 64 } } }
	payload_in_valid_V { ap_none {  { payload_in_valid_V in_data 0 1 } } }
	payload_in_last_V { ap_none {  { payload_in_last_V in_data 0 1 } } }
	payload_ready_V { ap_none {  { payload_ready_V out_data 1 1 } } }
	payload_out_data_V { ap_none {  { payload_out_data_V out_data 1 512 } } }
	payload_out_keep_V { ap_none {  { payload_out_keep_V out_data 1 64 } } }
	payload_out_valid_V { ap_none {  { payload_out_valid_V out_data 1 1 } } }
	payload_out_last_V { ap_none {  { payload_out_last_V out_data 1 1 } } }
	src_ip_V { ap_none {  { src_ip_V out_data 1 32 } } }
	src_port_V { ap_none {  { src_port_V out_data 1 16 } } }
	dst_port_V { ap_none {  { dst_port_V out_data 1 16 } } }
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
