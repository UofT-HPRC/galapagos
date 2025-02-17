set moduleName payload_generator
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
set C_modelName {payload_generator}
set C_modelType { void 0 }
set C_modelArgList {
	{ start_V int 1 regular  }
	{ ready_V int 1 regular  }
	{ packet_num_V int 32 regular  }
	{ payload_len_V int 16 regular  }
	{ counter_out_V int 32 regular {pointer 1}  }
	{ time_elapse_V int 64 regular {pointer 1}  }
	{ m_axis_data_V int 512 regular {pointer 1}  }
	{ m_axis_keep_V int 64 regular {pointer 1}  }
	{ m_axis_last_V int 1 regular {pointer 1}  }
	{ m_axis_valid_V int 1 regular {pointer 1}  }
	{ done_V int 1 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "start_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "start.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "ready_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "ready.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "packet_num_V", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "packet_num.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "payload_len_V", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "payload_len.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "counter_out_V", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "counter_out.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "time_elapse_V", "interface" : "wire", "bitwidth" : 64, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "time_elapse.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "m_axis_data_V", "interface" : "wire", "bitwidth" : 512, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":511,"cElement": [{"cName": "m_axis.data.V","cData": "uint512","bit_use": { "low": 0,"up": 511},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "m_axis_keep_V", "interface" : "wire", "bitwidth" : 64, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "m_axis.keep.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "m_axis_last_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "m_axis.last.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "m_axis_valid_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "m_axis.valid.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "done_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "done.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} ]}
# RTL Port declarations: 
set portNum 13
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ start_V sc_in sc_lv 1 signal 0 } 
	{ ready_V sc_in sc_lv 1 signal 1 } 
	{ packet_num_V sc_in sc_lv 32 signal 2 } 
	{ payload_len_V sc_in sc_lv 16 signal 3 } 
	{ counter_out_V sc_out sc_lv 32 signal 4 } 
	{ time_elapse_V sc_out sc_lv 64 signal 5 } 
	{ m_axis_data_V sc_out sc_lv 512 signal 6 } 
	{ m_axis_keep_V sc_out sc_lv 64 signal 7 } 
	{ m_axis_last_V sc_out sc_lv 1 signal 8 } 
	{ m_axis_valid_V sc_out sc_lv 1 signal 9 } 
	{ done_V sc_out sc_lv 1 signal 10 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "start_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "start_V", "role": "default" }} , 
 	{ "name": "ready_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ready_V", "role": "default" }} , 
 	{ "name": "packet_num_V", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "packet_num_V", "role": "default" }} , 
 	{ "name": "payload_len_V", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "payload_len_V", "role": "default" }} , 
 	{ "name": "counter_out_V", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "counter_out_V", "role": "default" }} , 
 	{ "name": "time_elapse_V", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "time_elapse_V", "role": "default" }} , 
 	{ "name": "m_axis_data_V", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "m_axis_data_V", "role": "default" }} , 
 	{ "name": "m_axis_keep_V", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "m_axis_keep_V", "role": "default" }} , 
 	{ "name": "m_axis_last_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m_axis_last_V", "role": "default" }} , 
 	{ "name": "m_axis_valid_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m_axis_valid_V", "role": "default" }} , 
 	{ "name": "done_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "done_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "payload_generator",
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
			{"Name" : "start_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "ready_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "packet_num_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "payload_len_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "counter_out_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "time_elapse_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "m_axis_data_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "m_axis_keep_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "m_axis_last_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "m_axis_valid_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "done_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "done_reg_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "axis_reg_data_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "axis_reg_keep_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "axis_reg_last_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "axis_reg_valid_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "cnt_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "time_elapse_reg_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "start_reg_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "payload_len_adjusted", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "status_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "packet_id_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "length_remain_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "packet_num_reg_V", "Type" : "OVld", "Direction" : "IO"}]}]}


set ArgLastReadFirstWriteLatency {
	payload_generator {
		start_V {Type I LastRead 0 FirstWrite -1}
		ready_V {Type I LastRead 0 FirstWrite -1}
		packet_num_V {Type I LastRead 0 FirstWrite -1}
		payload_len_V {Type I LastRead 0 FirstWrite -1}
		counter_out_V {Type O LastRead -1 FirstWrite 0}
		time_elapse_V {Type O LastRead -1 FirstWrite 0}
		m_axis_data_V {Type O LastRead -1 FirstWrite 0}
		m_axis_keep_V {Type O LastRead -1 FirstWrite 0}
		m_axis_last_V {Type O LastRead -1 FirstWrite 0}
		m_axis_valid_V {Type O LastRead -1 FirstWrite 0}
		done_V {Type O LastRead -1 FirstWrite 0}
		done_reg_V {Type IO LastRead -1 FirstWrite -1}
		axis_reg_data_V {Type IO LastRead -1 FirstWrite -1}
		axis_reg_keep_V {Type IO LastRead -1 FirstWrite -1}
		axis_reg_last_V {Type IO LastRead -1 FirstWrite -1}
		axis_reg_valid_V {Type IO LastRead -1 FirstWrite -1}
		cnt_V {Type IO LastRead -1 FirstWrite -1}
		time_elapse_reg_V {Type IO LastRead -1 FirstWrite -1}
		start_reg_V {Type IO LastRead -1 FirstWrite -1}
		payload_len_adjusted {Type IO LastRead -1 FirstWrite -1}
		status_V {Type IO LastRead -1 FirstWrite -1}
		packet_id_V {Type IO LastRead -1 FirstWrite -1}
		length_remain_V {Type IO LastRead -1 FirstWrite -1}
		packet_num_reg_V {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "0", "Max" : "0"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	start_V { ap_none {  { start_V in_data 0 1 } } }
	ready_V { ap_none {  { ready_V in_data 0 1 } } }
	packet_num_V { ap_none {  { packet_num_V in_data 0 32 } } }
	payload_len_V { ap_none {  { payload_len_V in_data 0 16 } } }
	counter_out_V { ap_none {  { counter_out_V out_data 1 32 } } }
	time_elapse_V { ap_none {  { time_elapse_V out_data 1 64 } } }
	m_axis_data_V { ap_none {  { m_axis_data_V out_data 1 512 } } }
	m_axis_keep_V { ap_none {  { m_axis_keep_V out_data 1 64 } } }
	m_axis_last_V { ap_none {  { m_axis_last_V out_data 1 1 } } }
	m_axis_valid_V { ap_none {  { m_axis_valid_V out_data 1 1 } } }
	done_V { ap_none {  { done_V out_data 1 1 } } }
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
