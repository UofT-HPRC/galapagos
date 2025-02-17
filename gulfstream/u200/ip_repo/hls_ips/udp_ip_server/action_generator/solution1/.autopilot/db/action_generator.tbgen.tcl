set moduleName action_generator
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
set C_modelName {action_generator}
set C_modelType { void 0 }
set C_modelArgList {
	{ meta_in_src_ip_V int 32 regular  }
	{ meta_in_protocol_header_V int 64 regular  }
	{ meta_in_checksum_V int 32 regular  }
	{ meta_in_action_V int 2 regular  }
	{ payload_cksum_data_V int 32 regular  }
	{ payload_cksum_valid_V int 1 regular  }
	{ action_out int 65 regular {pointer 1}  }
	{ action_out_valid_V int 1 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "meta_in_src_ip_V", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "meta_in.src_ip.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "meta_in_protocol_header_V", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "meta_in.protocol_header.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "meta_in_checksum_V", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "meta_in.checksum.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "meta_in_action_V", "interface" : "wire", "bitwidth" : 2, "direction" : "READONLY", "bitSlice":[{"low":0,"up":1,"cElement": [{"cName": "meta_in.action.V","cData": "uint2","bit_use": { "low": 0,"up": 1},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "payload_cksum_data_V", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "payload_cksum.data.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "payload_cksum_valid_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "payload_cksum.valid.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "action_out", "interface" : "wire", "bitwidth" : 65, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "action_out.src_ip.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":32,"up":47,"cElement": [{"cName": "action_out.src_port.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":48,"up":63,"cElement": [{"cName": "action_out.dst_port.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":64,"up":64,"cElement": [{"cName": "action_out.action.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "action_out_valid_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "action_out_valid.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} ]}
# RTL Port declarations: 
set portNum 10
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ meta_in_src_ip_V sc_in sc_lv 32 signal 0 } 
	{ meta_in_protocol_header_V sc_in sc_lv 64 signal 1 } 
	{ meta_in_checksum_V sc_in sc_lv 32 signal 2 } 
	{ meta_in_action_V sc_in sc_lv 2 signal 3 } 
	{ payload_cksum_data_V sc_in sc_lv 32 signal 4 } 
	{ payload_cksum_valid_V sc_in sc_lv 1 signal 5 } 
	{ action_out sc_out sc_lv 65 signal 6 } 
	{ action_out_valid_V sc_out sc_lv 1 signal 7 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "meta_in_src_ip_V", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "meta_in_src_ip_V", "role": "default" }} , 
 	{ "name": "meta_in_protocol_header_V", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "meta_in_protocol_header_V", "role": "default" }} , 
 	{ "name": "meta_in_checksum_V", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "meta_in_checksum_V", "role": "default" }} , 
 	{ "name": "meta_in_action_V", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "meta_in_action_V", "role": "default" }} , 
 	{ "name": "payload_cksum_data_V", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "payload_cksum_data_V", "role": "default" }} , 
 	{ "name": "payload_cksum_valid_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "payload_cksum_valid_V", "role": "default" }} , 
 	{ "name": "action_out", "direction": "out", "datatype": "sc_lv", "bitwidth":65, "type": "signal", "bundle":{"name": "action_out", "role": "default" }} , 
 	{ "name": "action_out_valid_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "action_out_valid_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "action_generator",
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
			{"Name" : "meta_in_src_ip_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "meta_in_protocol_header_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "meta_in_checksum_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "meta_in_action_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "payload_cksum_data_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "payload_cksum_valid_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "action_out", "Type" : "None", "Direction" : "O"},
			{"Name" : "action_out_valid_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "action_out_reg1_src_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_out_reg1_src_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_out_reg1_dst_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ignore_flag1_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "combined_cksum_final", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_out_valid_reg", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "combined_cksum_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_out_reg_src_i", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_out_reg_src_p", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_out_reg_dst_p", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "action_out_valid_reg_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ignore_flag_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_in_reg_checksum", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_in_reg_src_ip_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_in_reg_protocol", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_in_reg_action_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_in_reg0_src_ip_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_in_reg0_protoco", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_in_reg0_checksu", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_in_reg0_action_s", "Type" : "OVld", "Direction" : "IO"}]}]}


set ArgLastReadFirstWriteLatency {
	action_generator {
		meta_in_src_ip_V {Type I LastRead 0 FirstWrite -1}
		meta_in_protocol_header_V {Type I LastRead 0 FirstWrite -1}
		meta_in_checksum_V {Type I LastRead 0 FirstWrite -1}
		meta_in_action_V {Type I LastRead 0 FirstWrite -1}
		payload_cksum_data_V {Type I LastRead 0 FirstWrite -1}
		payload_cksum_valid_V {Type I LastRead 0 FirstWrite -1}
		action_out {Type O LastRead -1 FirstWrite 0}
		action_out_valid_V {Type O LastRead -1 FirstWrite 0}
		action_out_reg1_src_1 {Type IO LastRead -1 FirstWrite -1}
		action_out_reg1_src_s {Type IO LastRead -1 FirstWrite -1}
		action_out_reg1_dst_s {Type IO LastRead -1 FirstWrite -1}
		ignore_flag1_V {Type IO LastRead -1 FirstWrite -1}
		combined_cksum_final {Type IO LastRead -1 FirstWrite -1}
		action_out_valid_reg {Type IO LastRead -1 FirstWrite -1}
		combined_cksum_V {Type IO LastRead -1 FirstWrite -1}
		action_out_reg_src_i {Type IO LastRead -1 FirstWrite -1}
		action_out_reg_src_p {Type IO LastRead -1 FirstWrite -1}
		action_out_reg_dst_p {Type IO LastRead -1 FirstWrite -1}
		action_out_valid_reg_1 {Type IO LastRead -1 FirstWrite -1}
		ignore_flag_V {Type IO LastRead -1 FirstWrite -1}
		meta_in_reg_checksum {Type IO LastRead -1 FirstWrite -1}
		meta_in_reg_src_ip_V {Type IO LastRead -1 FirstWrite -1}
		meta_in_reg_protocol {Type IO LastRead -1 FirstWrite -1}
		meta_in_reg_action_V {Type IO LastRead -1 FirstWrite -1}
		meta_in_reg0_src_ip_s {Type IO LastRead -1 FirstWrite -1}
		meta_in_reg0_protoco {Type IO LastRead -1 FirstWrite -1}
		meta_in_reg0_checksu {Type IO LastRead -1 FirstWrite -1}
		meta_in_reg0_action_s {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "0", "Max" : "0"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	meta_in_src_ip_V { ap_none {  { meta_in_src_ip_V in_data 0 32 } } }
	meta_in_protocol_header_V { ap_none {  { meta_in_protocol_header_V in_data 0 64 } } }
	meta_in_checksum_V { ap_none {  { meta_in_checksum_V in_data 0 32 } } }
	meta_in_action_V { ap_none {  { meta_in_action_V in_data 0 2 } } }
	payload_cksum_data_V { ap_none {  { payload_cksum_data_V in_data 0 32 } } }
	payload_cksum_valid_V { ap_none {  { payload_cksum_valid_V in_data 0 1 } } }
	action_out { ap_none {  { action_out out_data 1 65 } } }
	action_out_valid_V { ap_none {  { action_out_valid_V out_data 1 1 } } }
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
