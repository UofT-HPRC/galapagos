set moduleName payload_validator
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
set C_modelName {payload_validator}
set C_modelType { void 0 }
set C_modelArgList {
	{ clear_V int 1 regular  }
	{ packet_num_V int 32 regular  }
	{ counter_in_V int 32 regular  }
	{ s_axis_data_V int 512 regular  }
	{ s_axis_keep_V int 64 regular  }
	{ s_axis_last_V int 1 regular  }
	{ s_axis_valid_V int 1 regular  }
	{ latency_sum_V int 64 regular {pointer 1}  }
	{ time_elapse_V int 64 regular {pointer 1}  }
	{ curr_cnt_V int 32 regular {pointer 1}  }
	{ done_V int 1 regular {pointer 1}  }
	{ error_V int 1 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "clear_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "clear.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "packet_num_V", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "packet_num.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "counter_in_V", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "counter_in.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "s_axis_data_V", "interface" : "wire", "bitwidth" : 512, "direction" : "READONLY", "bitSlice":[{"low":0,"up":511,"cElement": [{"cName": "s_axis.data.V","cData": "uint512","bit_use": { "low": 0,"up": 511},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "s_axis_keep_V", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "s_axis.keep.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "s_axis_last_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "s_axis.last.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "s_axis_valid_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "s_axis.valid.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "latency_sum_V", "interface" : "wire", "bitwidth" : 64, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "latency_sum.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "time_elapse_V", "interface" : "wire", "bitwidth" : 64, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "time_elapse.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "curr_cnt_V", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "curr_cnt.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "done_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "done.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "error_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "error.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} ]}
# RTL Port declarations: 
set portNum 14
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ clear_V sc_in sc_lv 1 signal 0 } 
	{ packet_num_V sc_in sc_lv 32 signal 1 } 
	{ counter_in_V sc_in sc_lv 32 signal 2 } 
	{ s_axis_data_V sc_in sc_lv 512 signal 3 } 
	{ s_axis_keep_V sc_in sc_lv 64 signal 4 } 
	{ s_axis_last_V sc_in sc_lv 1 signal 5 } 
	{ s_axis_valid_V sc_in sc_lv 1 signal 6 } 
	{ latency_sum_V sc_out sc_lv 64 signal 7 } 
	{ time_elapse_V sc_out sc_lv 64 signal 8 } 
	{ curr_cnt_V sc_out sc_lv 32 signal 9 } 
	{ done_V sc_out sc_lv 1 signal 10 } 
	{ error_V sc_out sc_lv 1 signal 11 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "clear_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "clear_V", "role": "default" }} , 
 	{ "name": "packet_num_V", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "packet_num_V", "role": "default" }} , 
 	{ "name": "counter_in_V", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "counter_in_V", "role": "default" }} , 
 	{ "name": "s_axis_data_V", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "s_axis_data_V", "role": "default" }} , 
 	{ "name": "s_axis_keep_V", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "s_axis_keep_V", "role": "default" }} , 
 	{ "name": "s_axis_last_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_axis_last_V", "role": "default" }} , 
 	{ "name": "s_axis_valid_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_axis_valid_V", "role": "default" }} , 
 	{ "name": "latency_sum_V", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "latency_sum_V", "role": "default" }} , 
 	{ "name": "time_elapse_V", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "time_elapse_V", "role": "default" }} , 
 	{ "name": "curr_cnt_V", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "curr_cnt_V", "role": "default" }} , 
 	{ "name": "done_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "done_V", "role": "default" }} , 
 	{ "name": "error_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "error_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "payload_validator",
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
			{"Name" : "clear_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "packet_num_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "counter_in_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "s_axis_data_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "s_axis_keep_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "s_axis_last_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "s_axis_valid_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "latency_sum_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "time_elapse_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "curr_cnt_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "done_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "error_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "packet_cnt_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "error_reg_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "done_reg_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "latency_sum_reg_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "time_elapse_reg_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "clear_reg_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "IN_PACKET_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "latency_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "init_reg_V", "Type" : "OVld", "Direction" : "IO"}]}]}


set ArgLastReadFirstWriteLatency {
	payload_validator {
		clear_V {Type I LastRead 0 FirstWrite -1}
		packet_num_V {Type I LastRead 0 FirstWrite -1}
		counter_in_V {Type I LastRead 0 FirstWrite -1}
		s_axis_data_V {Type I LastRead 0 FirstWrite -1}
		s_axis_keep_V {Type I LastRead 0 FirstWrite -1}
		s_axis_last_V {Type I LastRead 0 FirstWrite -1}
		s_axis_valid_V {Type I LastRead 0 FirstWrite -1}
		latency_sum_V {Type O LastRead -1 FirstWrite 0}
		time_elapse_V {Type O LastRead -1 FirstWrite 0}
		curr_cnt_V {Type O LastRead -1 FirstWrite 0}
		done_V {Type O LastRead -1 FirstWrite 0}
		error_V {Type O LastRead -1 FirstWrite 0}
		packet_cnt_V {Type IO LastRead -1 FirstWrite -1}
		error_reg_V {Type IO LastRead -1 FirstWrite -1}
		done_reg_V {Type IO LastRead -1 FirstWrite -1}
		latency_sum_reg_V {Type IO LastRead -1 FirstWrite -1}
		time_elapse_reg_V {Type IO LastRead -1 FirstWrite -1}
		clear_reg_V {Type IO LastRead -1 FirstWrite -1}
		IN_PACKET_V {Type IO LastRead -1 FirstWrite -1}
		latency_V {Type IO LastRead -1 FirstWrite -1}
		init_reg_V {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "0", "Max" : "0"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	clear_V { ap_none {  { clear_V in_data 0 1 } } }
	packet_num_V { ap_none {  { packet_num_V in_data 0 32 } } }
	counter_in_V { ap_none {  { counter_in_V in_data 0 32 } } }
	s_axis_data_V { ap_none {  { s_axis_data_V in_data 0 512 } } }
	s_axis_keep_V { ap_none {  { s_axis_keep_V in_data 0 64 } } }
	s_axis_last_V { ap_none {  { s_axis_last_V in_data 0 1 } } }
	s_axis_valid_V { ap_none {  { s_axis_valid_V in_data 0 1 } } }
	latency_sum_V { ap_none {  { latency_sum_V out_data 1 64 } } }
	time_elapse_V { ap_none {  { time_elapse_V out_data 1 64 } } }
	curr_cnt_V { ap_none {  { curr_cnt_V out_data 1 32 } } }
	done_V { ap_none {  { done_V out_data 1 1 } } }
	error_V { ap_none {  { error_V out_data 1 1 } } }
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
