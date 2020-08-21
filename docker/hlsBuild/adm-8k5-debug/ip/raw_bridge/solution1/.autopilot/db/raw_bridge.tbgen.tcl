set C_TypeInfoList {{ 
"raw_bridge" : [[], { "return": [[], "void"]} , [{"ExternC" : 0}], [ {"to_app": [[], {"reference": "0"}] }, {"from_raw": [[], {"reference": "1"}] }, {"from_app": [[], {"reference": "0"}] }, {"to_raw": [[], {"reference": "1"}] }],[],""], 
"0": [ "galapagos_interface", {"typedef": [[[],"2"],""]}], 
"2": [ "stream<galapagos::stream_packet<64> >", {"hls_type": {"stream": [[[[],"3"]],"4"]}}], 
"1": [ "stream<raw_axis>", {"hls_type": {"stream": [[[[],"5"]],"4"]}}], 
"3": [ "stream_packet<64>", {"struct": [[],[{"T":[[], {"scalar": { "int": 64}}]}],[{ "data": [[], "6"]},{ "dest": [[], "7"]},{ "last": [[], "8"]},{ "id": [[], "7"]},{ "keep": [[], "7"]}],"9"]}], 
"5": [ "raw_axis", {"struct": [[],[],[{ "data": [[], "10"]},{ "last": [[], "8"]},{ "tkeep": [[], "7"]}],""]}], 
"10": [ "ap_int<64>", {"hls_type": {"ap_int": [[[[], {"scalar": { "int": 64}}]],""]}}], 
"6": [ "ap_uint<64>", {"hls_type": {"ap_uint": [[[[], {"scalar": { "int": 64}}]],""]}}], 
"8": [ "ap_uint<1>", {"hls_type": {"ap_uint": [[[[], {"scalar": { "int": 1}}]],""]}}], 
"7": [ "ap_uint<8>", {"hls_type": {"ap_uint": [[[[], {"scalar": { "int": 8}}]],""]}}],
"4": ["hls", ""],
"9": ["galapagos", ""]
}}
set moduleName raw_bridge
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type dataflow
set FunctionProtocol ap_ctrl_none
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set C_modelName {raw_bridge}
set C_modelType { void 0 }
set C_modelArgList {
	{ to_app_V int 89 regular {fifo 1 volatile }  }
	{ from_raw_V int 73 regular {fifo 0 volatile }  }
	{ from_app_V int 89 regular {fifo 0 volatile }  }
	{ to_raw_V int 73 regular {fifo 1 volatile }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "to_app_V", "interface" : "fifo", "bitwidth" : 89, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "to_app.V.data.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":64,"up":71,"cElement": [{"cName": "to_app.V.dest.V","cData": "uint8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":72,"up":72,"cElement": [{"cName": "to_app.V.last.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":73,"up":80,"cElement": [{"cName": "to_app.V.id.V","cData": "uint8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":81,"up":88,"cElement": [{"cName": "to_app.V.keep.V","cData": "uint8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "from_raw_V", "interface" : "fifo", "bitwidth" : 73, "direction" : "READONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "from_raw.V.data.V","cData": "int64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":64,"up":64,"cElement": [{"cName": "from_raw.V.last.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":65,"up":72,"cElement": [{"cName": "from_raw.V.tkeep.V","cData": "uint8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "from_app_V", "interface" : "fifo", "bitwidth" : 89, "direction" : "READONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "from_app.V.data.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":64,"up":71,"cElement": [{"cName": "from_app.V.dest.V","cData": "uint8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":72,"up":72,"cElement": [{"cName": "from_app.V.last.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":73,"up":80,"cElement": [{"cName": "from_app.V.id.V","cData": "uint8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":81,"up":88,"cElement": [{"cName": "from_app.V.keep.V","cData": "uint8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "to_raw_V", "interface" : "fifo", "bitwidth" : 73, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "to_raw.V.data.V","cData": "int64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":64,"up":64,"cElement": [{"cName": "to_raw.V.last.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":65,"up":72,"cElement": [{"cName": "to_raw.V.tkeep.V","cData": "uint8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} ]}
# RTL Port declarations: 
set portNum 14
set portList { 
	{ to_app_V_din sc_out sc_lv 89 signal 0 } 
	{ to_app_V_full_n sc_in sc_logic 1 signal 0 } 
	{ to_app_V_write sc_out sc_logic 1 signal 0 } 
	{ from_raw_V_dout sc_in sc_lv 73 signal 1 } 
	{ from_raw_V_empty_n sc_in sc_logic 1 signal 1 } 
	{ from_raw_V_read sc_out sc_logic 1 signal 1 } 
	{ from_app_V_dout sc_in sc_lv 89 signal 2 } 
	{ from_app_V_empty_n sc_in sc_logic 1 signal 2 } 
	{ from_app_V_read sc_out sc_logic 1 signal 2 } 
	{ to_raw_V_din sc_out sc_lv 73 signal 3 } 
	{ to_raw_V_full_n sc_in sc_logic 1 signal 3 } 
	{ to_raw_V_write sc_out sc_logic 1 signal 3 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
}
set NewPortList {[ 
	{ "name": "to_app_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":89, "type": "signal", "bundle":{"name": "to_app_V", "role": "din" }} , 
 	{ "name": "to_app_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "to_app_V", "role": "full_n" }} , 
 	{ "name": "to_app_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "to_app_V", "role": "write" }} , 
 	{ "name": "from_raw_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":73, "type": "signal", "bundle":{"name": "from_raw_V", "role": "dout" }} , 
 	{ "name": "from_raw_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "from_raw_V", "role": "empty_n" }} , 
 	{ "name": "from_raw_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "from_raw_V", "role": "read" }} , 
 	{ "name": "from_app_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":89, "type": "signal", "bundle":{"name": "from_app_V", "role": "dout" }} , 
 	{ "name": "from_app_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "from_app_V", "role": "empty_n" }} , 
 	{ "name": "from_app_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "from_app_V", "role": "read" }} , 
 	{ "name": "to_raw_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":73, "type": "signal", "bundle":{"name": "to_raw_V", "role": "din" }} , 
 	{ "name": "to_raw_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "to_raw_V", "role": "full_n" }} , 
 	{ "name": "to_raw_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "to_raw_V", "role": "write" }} , 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2"],
		"CDFG" : "raw_bridge",
		"Protocol" : "ap_ctrl_none",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"InDataflowNetwork" : "0",
		"InputProcess" : [
			{"ID" : "1", "Name" : "raw_to_app_U0"},
			{"ID" : "2", "Name" : "app_to_raw_U0"}],
		"OutputProcess" : [
			{"ID" : "1", "Name" : "raw_to_app_U0"},
			{"ID" : "2", "Name" : "app_to_raw_U0"}],
		"Port" : [
			{"Name" : "to_app_V", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "raw_to_app_U0", "Port" : "to_app_V"}]},
			{"Name" : "from_raw_V", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "raw_to_app_U0", "Port" : "from_raw_V"}]},
			{"Name" : "from_app_V", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "app_to_raw_U0", "Port" : "from_app_V"}]},
			{"Name" : "to_raw_V", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "app_to_raw_U0", "Port" : "to_raw_V"}]},
			{"Name" : "state_V_1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "raw_to_app_U0", "Port" : "state_V_1"}]},
			{"Name" : "dest_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "raw_to_app_U0", "Port" : "dest_V"}]},
			{"Name" : "state_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "app_to_raw_U0", "Port" : "state_V"}]},
			{"Name" : "app_packet_in_last_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "app_to_raw_U0", "Port" : "app_packet_in_last_V"}]},
			{"Name" : "app_packet_in_data_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "app_to_raw_U0", "Port" : "app_packet_in_data_V"}]},
			{"Name" : "app_packet_in_keep_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "app_to_raw_U0", "Port" : "app_packet_in_keep_V"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.raw_to_app_U0", "Parent" : "0",
		"CDFG" : "raw_to_app",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"InDataflowNetwork" : "1",
		"Port" : [
			{"Name" : "from_raw_V", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "from_raw_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "to_app_V", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "to_app_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "state_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dest_V", "Type" : "OVld", "Direction" : "IO"}]},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.app_to_raw_U0", "Parent" : "0",
		"CDFG" : "app_to_raw",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"InDataflowNetwork" : "1",
		"Port" : [
			{"Name" : "from_app_V", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "from_app_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "to_raw_V", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "to_raw_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "state_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "app_packet_in_last_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "app_packet_in_data_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "app_packet_in_keep_V", "Type" : "OVld", "Direction" : "IO"}]}]}


set ArgLastReadFirstWriteLatency {
	raw_bridge {
		to_app_V {Type O LastRead -1 FirstWrite 1}
		from_raw_V {Type I LastRead 0 FirstWrite -1}
		from_app_V {Type I LastRead 0 FirstWrite -1}
		to_raw_V {Type O LastRead -1 FirstWrite 1}
		state_V_1 {Type IO LastRead -1 FirstWrite -1}
		dest_V {Type IO LastRead -1 FirstWrite -1}
		state_V {Type IO LastRead -1 FirstWrite -1}
		app_packet_in_last_V {Type IO LastRead -1 FirstWrite -1}
		app_packet_in_data_V {Type IO LastRead -1 FirstWrite -1}
		app_packet_in_keep_V {Type IO LastRead -1 FirstWrite -1}}
	raw_to_app {
		from_raw_V {Type I LastRead 0 FirstWrite -1}
		to_app_V {Type O LastRead -1 FirstWrite 1}
		state_V_1 {Type IO LastRead -1 FirstWrite -1}
		dest_V {Type IO LastRead -1 FirstWrite -1}}
	app_to_raw {
		from_app_V {Type I LastRead 0 FirstWrite -1}
		to_raw_V {Type O LastRead -1 FirstWrite 1}
		state_V {Type IO LastRead -1 FirstWrite -1}
		app_packet_in_last_V {Type IO LastRead -1 FirstWrite -1}
		app_packet_in_data_V {Type IO LastRead -1 FirstWrite -1}
		app_packet_in_keep_V {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	to_app_V { ap_fifo {  { to_app_V_din fifo_data 1 89 }  { to_app_V_full_n fifo_status 0 1 }  { to_app_V_write fifo_update 1 1 } } }
	from_raw_V { ap_fifo {  { from_raw_V_dout fifo_data 0 73 }  { from_raw_V_empty_n fifo_status 0 1 }  { from_raw_V_read fifo_update 1 1 } } }
	from_app_V { ap_fifo {  { from_app_V_dout fifo_data 0 89 }  { from_app_V_empty_n fifo_status 0 1 }  { from_app_V_read fifo_update 1 1 } } }
	to_raw_V { ap_fifo {  { to_raw_V_din fifo_data 1 73 }  { to_raw_V_full_n fifo_status 0 1 }  { to_raw_V_write fifo_update 1 1 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
	to_app_V { fifo_write 1 no_conditional }
	from_raw_V { fifo_read 1 no_conditional }
	from_app_V { fifo_read 1 no_conditional }
	to_raw_V { fifo_write 1 no_conditional }
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
