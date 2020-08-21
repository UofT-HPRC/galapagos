set moduleName g2N_egress
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set C_modelName {g2N_egress}
set C_modelType { void 0 }
set C_modelArgList {
	{ output_V int 73 regular {fifo 1 volatile }  }
	{ buffer_storage_V int 64 regular {array 512 { 1 } 1 1 }  }
	{ length_stream_V_V int 16 regular {pointer 0 volatile }  }
	{ dest_stream_V_V int 8 regular {pointer 0 volatile }  }
	{ src_stream_V_V int 8 regular {pointer 0 volatile }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "output_V", "interface" : "fifo", "bitwidth" : 73, "direction" : "WRITEONLY"} , 
 	{ "Name" : "buffer_storage_V", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "length_stream_V_V", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "dest_stream_V_V", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "src_stream_V_V", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 16
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ output_V_din sc_out sc_lv 73 signal 0 } 
	{ output_V_full_n sc_in sc_logic 1 signal 0 } 
	{ output_V_write sc_out sc_logic 1 signal 0 } 
	{ buffer_storage_V_address0 sc_out sc_lv 9 signal 1 } 
	{ buffer_storage_V_ce0 sc_out sc_logic 1 signal 1 } 
	{ buffer_storage_V_q0 sc_in sc_lv 64 signal 1 } 
	{ length_stream_V_V sc_in sc_lv 16 signal 2 } 
	{ dest_stream_V_V sc_in sc_lv 8 signal 3 } 
	{ src_stream_V_V sc_in sc_lv 8 signal 4 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "output_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":73, "type": "signal", "bundle":{"name": "output_V", "role": "din" }} , 
 	{ "name": "output_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_V", "role": "full_n" }} , 
 	{ "name": "output_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_V", "role": "write" }} , 
 	{ "name": "buffer_storage_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "buffer_storage_V", "role": "address0" }} , 
 	{ "name": "buffer_storage_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "buffer_storage_V", "role": "ce0" }} , 
 	{ "name": "buffer_storage_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "buffer_storage_V", "role": "q0" }} , 
 	{ "name": "length_stream_V_V", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "length_stream_V_V", "role": "default" }} , 
 	{ "name": "dest_stream_V_V", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "dest_stream_V_V", "role": "default" }} , 
 	{ "name": "src_stream_V_V", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "src_stream_V_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "g2N_egress",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2", "EstimateLatencyMax" : "65537",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"InDataflowNetwork" : "1",
		"Port" : [
			{"Name" : "output_V", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "output_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "buffer_storage_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "length_stream_V_V", "Type" : "None", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0"},
			{"Name" : "dest_stream_V_V", "Type" : "None", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0"},
			{"Name" : "src_stream_V_V", "Type" : "None", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0"}]}]}


set ArgLastReadFirstWriteLatency {
	g2N_egress {
		output_V {Type O LastRead -1 FirstWrite 0}
		buffer_storage_V {Type I LastRead 1 FirstWrite -1}
		length_stream_V_V {Type I LastRead 0 FirstWrite -1}
		dest_stream_V_V {Type I LastRead 0 FirstWrite -1}
		src_stream_V_V {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "65537"}
	, {"Name" : "Interval", "Min" : "2", "Max" : "65537"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	output_V { ap_fifo {  { output_V_din fifo_data 1 73 }  { output_V_full_n fifo_status 0 1 }  { output_V_write fifo_update 1 1 } } }
	buffer_storage_V { ap_memory {  { buffer_storage_V_address0 mem_address 1 9 }  { buffer_storage_V_ce0 mem_ce 1 1 }  { buffer_storage_V_q0 mem_dout 0 64 } } }
	length_stream_V_V { ap_none {  { length_stream_V_V in_data 0 16 } } }
	dest_stream_V_V { ap_none {  { dest_stream_V_V in_data 0 8 } } }
	src_stream_V_V { ap_none {  { src_stream_V_V in_data 0 8 } } }
}
