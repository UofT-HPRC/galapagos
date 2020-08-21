set moduleName g2N_ingress
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set C_modelName {g2N_ingress}
set C_modelType { void 0 }
set C_modelArgList {
	{ input_V int 89 regular {fifo 0 volatile }  }
	{ buffer_storage_V int 64 regular {array 512 { 0 } 0 1 }  }
	{ length_stream_V_V int 16 regular {pointer 1 volatile }  }
	{ dest_stream_V_V int 8 regular {pointer 1 volatile }  }
	{ src_stream_V_V int 8 regular {pointer 1 volatile }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "input_V", "interface" : "fifo", "bitwidth" : 89, "direction" : "READONLY"} , 
 	{ "Name" : "buffer_storage_V", "interface" : "memory", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "length_stream_V_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "dest_stream_V_V", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "src_stream_V_V", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 20
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ input_V_dout sc_in sc_lv 89 signal 0 } 
	{ input_V_empty_n sc_in sc_logic 1 signal 0 } 
	{ input_V_read sc_out sc_logic 1 signal 0 } 
	{ buffer_storage_V_address0 sc_out sc_lv 9 signal 1 } 
	{ buffer_storage_V_ce0 sc_out sc_logic 1 signal 1 } 
	{ buffer_storage_V_we0 sc_out sc_logic 1 signal 1 } 
	{ buffer_storage_V_d0 sc_out sc_lv 64 signal 1 } 
	{ length_stream_V_V sc_out sc_lv 16 signal 2 } 
	{ length_stream_V_V_ap_vld sc_out sc_logic 1 outvld 2 } 
	{ dest_stream_V_V sc_out sc_lv 8 signal 3 } 
	{ dest_stream_V_V_ap_vld sc_out sc_logic 1 outvld 3 } 
	{ src_stream_V_V sc_out sc_lv 8 signal 4 } 
	{ src_stream_V_V_ap_vld sc_out sc_logic 1 outvld 4 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "input_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":89, "type": "signal", "bundle":{"name": "input_V", "role": "dout" }} , 
 	{ "name": "input_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_V", "role": "empty_n" }} , 
 	{ "name": "input_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_V", "role": "read" }} , 
 	{ "name": "buffer_storage_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "buffer_storage_V", "role": "address0" }} , 
 	{ "name": "buffer_storage_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "buffer_storage_V", "role": "ce0" }} , 
 	{ "name": "buffer_storage_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "buffer_storage_V", "role": "we0" }} , 
 	{ "name": "buffer_storage_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "buffer_storage_V", "role": "d0" }} , 
 	{ "name": "length_stream_V_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "length_stream_V_V", "role": "default" }} , 
 	{ "name": "length_stream_V_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "length_stream_V_V", "role": "ap_vld" }} , 
 	{ "name": "dest_stream_V_V", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "dest_stream_V_V", "role": "default" }} , 
 	{ "name": "dest_stream_V_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "dest_stream_V_V", "role": "ap_vld" }} , 
 	{ "name": "src_stream_V_V", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "src_stream_V_V", "role": "default" }} , 
 	{ "name": "src_stream_V_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "src_stream_V_V", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "g2N_ingress",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "3", "EstimateLatencyMax" : "514",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"InDataflowNetwork" : "1",
		"Port" : [
			{"Name" : "input_V", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "input_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "buffer_storage_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "length_stream_V_V", "Type" : "Vld", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0"},
			{"Name" : "dest_stream_V_V", "Type" : "Vld", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0"},
			{"Name" : "src_stream_V_V", "Type" : "Vld", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0"}]}]}


set ArgLastReadFirstWriteLatency {
	g2N_ingress {
		input_V {Type I LastRead 1 FirstWrite -1}
		buffer_storage_V {Type O LastRead -1 FirstWrite 1}
		length_stream_V_V {Type O LastRead -1 FirstWrite 2}
		dest_stream_V_V {Type O LastRead -1 FirstWrite 2}
		src_stream_V_V {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "3", "Max" : "514"}
	, {"Name" : "Interval", "Min" : "3", "Max" : "514"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	input_V { ap_fifo {  { input_V_dout fifo_data 0 89 }  { input_V_empty_n fifo_status 0 1 }  { input_V_read fifo_update 1 1 } } }
	buffer_storage_V { ap_memory {  { buffer_storage_V_address0 mem_address 1 9 }  { buffer_storage_V_ce0 mem_ce 1 1 }  { buffer_storage_V_we0 mem_we 1 1 }  { buffer_storage_V_d0 mem_din 1 64 } } }
	length_stream_V_V { ap_vld {  { length_stream_V_V out_data 1 16 }  { length_stream_V_V_ap_vld out_vld 1 1 } } }
	dest_stream_V_V { ap_vld {  { dest_stream_V_V out_data 1 8 }  { dest_stream_V_V_ap_vld out_vld 1 1 } } }
	src_stream_V_V { ap_vld {  { src_stream_V_V out_data 1 8 }  { src_stream_V_V_ap_vld out_vld 1 1 } } }
}
