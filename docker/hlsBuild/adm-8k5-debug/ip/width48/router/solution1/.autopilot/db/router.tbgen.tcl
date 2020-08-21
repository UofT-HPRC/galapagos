set C_TypeInfoList {{ 
"router" : [[], { "return": [[], "void"]} , [{"ExternC" : 0}], [ {"network_table": [[], {"array": ["0", [256]]}] }, {"network_addr": [["const"],"0"] }, {"stream_in": [[],{ "pointer": "1"}] }, {"stream_out_switch": [[],{ "pointer": "1"}] }, {"stream_out_network": [[],{ "pointer": "1"}] }],[],""], 
"0": [ "ap_uint<48>", {"struct": [[{"pack": 0}],[{"_AP_W":[[], {"scalar": { "int": 48}}]}],[],""]}], 
"1": [ "stream<galapagos::stream_packet<64> >", {"hls_type": {"stream": [[[[],"2"]],"3"]}}], 
"2": [ "stream_packet<64>", {"struct": [[],[{"T":[[], {"scalar": { "int": 64}}]}],[{ "data": [[], "4"]},{ "dest": [[], "5"]},{ "last": [[], "6"]},{ "id": [[], "5"]},{ "keep": [[], "5"]}],"7"]}], 
"6": [ "ap_uint<1>", {"hls_type": {"ap_uint": [[[[], {"scalar": { "int": 1}}]],""]}}], 
"5": [ "ap_uint<8>", {"hls_type": {"ap_uint": [[[[], {"scalar": { "int": 8}}]],""]}}], 
"4": [ "ap_uint<64>", {"hls_type": {"ap_uint": [[[[], {"scalar": { "int": 64}}]],""]}}],
"3": ["hls", ""],
"7": ["galapagos", ""]
}}
set moduleName router
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type function
set FunctionProtocol ap_ctrl_none
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set C_modelName {router}
set C_modelType { void 0 }
set C_modelArgList {
	{ network_table_V int 48 regular {array 256 { 1 3 } 1 1 }  }
	{ network_addr_V int 48 regular  }
	{ stream_in_V int 89 regular {fifo 0 volatile }  }
	{ stream_out_switch_V int 89 regular {fifo 1 volatile }  }
	{ stream_out_network_V int 89 regular {fifo 1 volatile }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "network_table_V", "interface" : "memory", "bitwidth" : 48, "direction" : "READONLY", "bitSlice":[{"low":0,"up":47,"cElement": [{"cName": "network_table.V","cData": "uint48","bit_use": { "low": 0,"up": 47},"cArray": [{"low" : 0,"up" : 255,"step" : 1}]}]}]} , 
 	{ "Name" : "network_addr_V", "interface" : "wire", "bitwidth" : 48, "direction" : "READONLY", "bitSlice":[{"low":0,"up":47,"cElement": [{"cName": "network_addr.V","cData": "uint48","bit_use": { "low": 0,"up": 47},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "stream_in_V", "interface" : "fifo", "bitwidth" : 89, "direction" : "READONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "stream_in.V.data.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":64,"up":71,"cElement": [{"cName": "stream_in.V.dest.V","cData": "uint8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":72,"up":72,"cElement": [{"cName": "stream_in.V.last.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":73,"up":80,"cElement": [{"cName": "stream_in.V.id.V","cData": "uint8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":81,"up":88,"cElement": [{"cName": "stream_in.V.keep.V","cData": "uint8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "stream_out_switch_V", "interface" : "fifo", "bitwidth" : 89, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "stream_out_switch.V.data.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":64,"up":71,"cElement": [{"cName": "stream_out_switch.V.dest.V","cData": "uint8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":72,"up":72,"cElement": [{"cName": "stream_out_switch.V.last.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":73,"up":80,"cElement": [{"cName": "stream_out_switch.V.id.V","cData": "uint8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":81,"up":88,"cElement": [{"cName": "stream_out_switch.V.keep.V","cData": "uint8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "stream_out_network_V", "interface" : "fifo", "bitwidth" : 89, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "stream_out_network.V.data.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":64,"up":71,"cElement": [{"cName": "stream_out_network.V.dest.V","cData": "uint8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":72,"up":72,"cElement": [{"cName": "stream_out_network.V.last.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":73,"up":80,"cElement": [{"cName": "stream_out_network.V.id.V","cData": "uint8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":81,"up":88,"cElement": [{"cName": "stream_out_network.V.keep.V","cData": "uint8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} ]}
# RTL Port declarations: 
set portNum 15
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ network_table_V_address0 sc_out sc_lv 8 signal 0 } 
	{ network_table_V_ce0 sc_out sc_logic 1 signal 0 } 
	{ network_table_V_q0 sc_in sc_lv 48 signal 0 } 
	{ network_addr_V sc_in sc_lv 48 signal 1 } 
	{ stream_in_V_dout sc_in sc_lv 89 signal 2 } 
	{ stream_in_V_empty_n sc_in sc_logic 1 signal 2 } 
	{ stream_in_V_read sc_out sc_logic 1 signal 2 } 
	{ stream_out_switch_V_din sc_out sc_lv 89 signal 3 } 
	{ stream_out_switch_V_full_n sc_in sc_logic 1 signal 3 } 
	{ stream_out_switch_V_write sc_out sc_logic 1 signal 3 } 
	{ stream_out_network_V_din sc_out sc_lv 89 signal 4 } 
	{ stream_out_network_V_full_n sc_in sc_logic 1 signal 4 } 
	{ stream_out_network_V_write sc_out sc_logic 1 signal 4 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "network_table_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "network_table_V", "role": "address0" }} , 
 	{ "name": "network_table_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "network_table_V", "role": "ce0" }} , 
 	{ "name": "network_table_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":48, "type": "signal", "bundle":{"name": "network_table_V", "role": "q0" }} , 
 	{ "name": "network_addr_V", "direction": "in", "datatype": "sc_lv", "bitwidth":48, "type": "signal", "bundle":{"name": "network_addr_V", "role": "default" }} , 
 	{ "name": "stream_in_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":89, "type": "signal", "bundle":{"name": "stream_in_V", "role": "dout" }} , 
 	{ "name": "stream_in_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stream_in_V", "role": "empty_n" }} , 
 	{ "name": "stream_in_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stream_in_V", "role": "read" }} , 
 	{ "name": "stream_out_switch_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":89, "type": "signal", "bundle":{"name": "stream_out_switch_V", "role": "din" }} , 
 	{ "name": "stream_out_switch_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stream_out_switch_V", "role": "full_n" }} , 
 	{ "name": "stream_out_switch_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stream_out_switch_V", "role": "write" }} , 
 	{ "name": "stream_out_network_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":89, "type": "signal", "bundle":{"name": "stream_out_network_V", "role": "din" }} , 
 	{ "name": "stream_out_network_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stream_out_network_V", "role": "full_n" }} , 
 	{ "name": "stream_out_network_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stream_out_network_V", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "router",
		"Protocol" : "ap_ctrl_none",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "2", "EstimateLatencyMin" : "2", "EstimateLatencyMax" : "2",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"InDataflowNetwork" : "0",
		"Port" : [
			{"Name" : "network_table_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "network_addr_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "stream_in_V", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "stream_in_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "stream_out_switch_V", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "stream_out_switch_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "stream_out_network_V", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "stream_out_network_V_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	router {
		network_table_V {Type I LastRead 0 FirstWrite -1}
		network_addr_V {Type I LastRead 0 FirstWrite -1}
		stream_in_V {Type I LastRead 0 FirstWrite -1}
		stream_out_switch_V {Type O LastRead -1 FirstWrite 2}
		stream_out_network_V {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "2"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	network_table_V { ap_memory {  { network_table_V_address0 mem_address 1 8 }  { network_table_V_ce0 mem_ce 1 1 }  { network_table_V_q0 mem_dout 0 48 } } }
	network_addr_V { ap_none {  { network_addr_V in_data 0 48 } } }
	stream_in_V { ap_fifo {  { stream_in_V_dout fifo_data 0 89 }  { stream_in_V_empty_n fifo_status 0 1 }  { stream_in_V_read fifo_update 1 1 } } }
	stream_out_switch_V { ap_fifo {  { stream_out_switch_V_din fifo_data 1 89 }  { stream_out_switch_V_full_n fifo_status 0 1 }  { stream_out_switch_V_write fifo_update 1 1 } } }
	stream_out_network_V { ap_fifo {  { stream_out_network_V_din fifo_data 1 89 }  { stream_out_network_V_full_n fifo_status 0 1 }  { stream_out_network_V_write fifo_update 1 1 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
	stream_in_V { fifo_read 2 has_conditional }
	stream_out_switch_V { fifo_write 1 has_conditional }
	stream_out_network_V { fifo_write 1 has_conditional }
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
