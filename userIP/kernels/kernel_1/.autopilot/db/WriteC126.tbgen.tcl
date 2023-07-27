set moduleName WriteC126
set isTopModule 0
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isFreeRunPipelineModule 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {WriteC126}
set C_modelType { void 0 }
set C_modelArgList {
	{ N_pipe_V_V1 int 32 regular {fifo 0 volatile }  }
	{ in_V_V int 64 regular {fifo 0 volatile }  }
	{ out_V_data_V int 512 regular {fifo 1 volatile }  }
	{ out_V_id_V int 8 regular {fifo 1 volatile }  }
	{ out_V_dest_V int 8 regular {fifo 1 volatile }  }
	{ out_V_user_V int 16 regular {fifo 1 volatile }  }
	{ out_V_last_V int 1 regular {fifo 1 volatile }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "N_pipe_V_V1", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "in_V_V", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "out_V_data_V", "interface" : "fifo", "bitwidth" : 512, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_V_id_V", "interface" : "fifo", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_V_dest_V", "interface" : "fifo", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_V_user_V", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_V_last_V", "interface" : "fifo", "bitwidth" : 1, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 28
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ N_pipe_V_V1_dout sc_in sc_lv 32 signal 0 } 
	{ N_pipe_V_V1_empty_n sc_in sc_logic 1 signal 0 } 
	{ N_pipe_V_V1_read sc_out sc_logic 1 signal 0 } 
	{ in_V_V_dout sc_in sc_lv 64 signal 1 } 
	{ in_V_V_empty_n sc_in sc_logic 1 signal 1 } 
	{ in_V_V_read sc_out sc_logic 1 signal 1 } 
	{ out_V_data_V_din sc_out sc_lv 512 signal 2 } 
	{ out_V_data_V_full_n sc_in sc_logic 1 signal 2 } 
	{ out_V_data_V_write sc_out sc_logic 1 signal 2 } 
	{ out_V_id_V_din sc_out sc_lv 8 signal 3 } 
	{ out_V_id_V_full_n sc_in sc_logic 1 signal 3 } 
	{ out_V_id_V_write sc_out sc_logic 1 signal 3 } 
	{ out_V_dest_V_din sc_out sc_lv 8 signal 4 } 
	{ out_V_dest_V_full_n sc_in sc_logic 1 signal 4 } 
	{ out_V_dest_V_write sc_out sc_logic 1 signal 4 } 
	{ out_V_user_V_din sc_out sc_lv 16 signal 5 } 
	{ out_V_user_V_full_n sc_in sc_logic 1 signal 5 } 
	{ out_V_user_V_write sc_out sc_logic 1 signal 5 } 
	{ out_V_last_V_din sc_out sc_lv 1 signal 6 } 
	{ out_V_last_V_full_n sc_in sc_logic 1 signal 6 } 
	{ out_V_last_V_write sc_out sc_logic 1 signal 6 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "N_pipe_V_V1_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "N_pipe_V_V1", "role": "dout" }} , 
 	{ "name": "N_pipe_V_V1_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "N_pipe_V_V1", "role": "empty_n" }} , 
 	{ "name": "N_pipe_V_V1_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "N_pipe_V_V1", "role": "read" }} , 
 	{ "name": "in_V_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "in_V_V", "role": "dout" }} , 
 	{ "name": "in_V_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_V_V", "role": "empty_n" }} , 
 	{ "name": "in_V_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_V_V", "role": "read" }} , 
 	{ "name": "out_V_data_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "out_V_data_V", "role": "din" }} , 
 	{ "name": "out_V_data_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out_V_data_V", "role": "full_n" }} , 
 	{ "name": "out_V_data_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out_V_data_V", "role": "write" }} , 
 	{ "name": "out_V_id_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "out_V_id_V", "role": "din" }} , 
 	{ "name": "out_V_id_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out_V_id_V", "role": "full_n" }} , 
 	{ "name": "out_V_id_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out_V_id_V", "role": "write" }} , 
 	{ "name": "out_V_dest_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "out_V_dest_V", "role": "din" }} , 
 	{ "name": "out_V_dest_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out_V_dest_V", "role": "full_n" }} , 
 	{ "name": "out_V_dest_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out_V_dest_V", "role": "write" }} , 
 	{ "name": "out_V_user_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "out_V_user_V", "role": "din" }} , 
 	{ "name": "out_V_user_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out_V_user_V", "role": "full_n" }} , 
 	{ "name": "out_V_user_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out_V_user_V", "role": "write" }} , 
 	{ "name": "out_V_last_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_V_last_V", "role": "din" }} , 
 	{ "name": "out_V_last_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out_V_last_V", "role": "full_n" }} , 
 	{ "name": "out_V_last_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out_V_last_V", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "WriteC126",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "387", "EstimateLatencyMax" : "1572867",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "N_pipe_V_V1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "N_pipe_V_V1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "in_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "in_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "out_V_data_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "out_V_data_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "out_V_id_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "out_V_id_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "out_V_dest_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "out_V_dest_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "out_V_user_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "out_V_user_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "out_V_last_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "out_V_last_V_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	WriteC126 {
		N_pipe_V_V1 {Type I LastRead 0 FirstWrite -1}
		in_V_V {Type I LastRead 2 FirstWrite -1}
		out_V_data_V {Type O LastRead -1 FirstWrite 0}
		out_V_id_V {Type O LastRead -1 FirstWrite 0}
		out_V_dest_V {Type O LastRead -1 FirstWrite 0}
		out_V_user_V {Type O LastRead -1 FirstWrite 0}
		out_V_last_V {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "387", "Max" : "1572867"}
	, {"Name" : "Interval", "Min" : "387", "Max" : "1572867"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	N_pipe_V_V1 { ap_fifo {  { N_pipe_V_V1_dout fifo_data 0 32 }  { N_pipe_V_V1_empty_n fifo_status 0 1 }  { N_pipe_V_V1_read fifo_update 1 1 } } }
	in_V_V { ap_fifo {  { in_V_V_dout fifo_data 0 64 }  { in_V_V_empty_n fifo_status 0 1 }  { in_V_V_read fifo_update 1 1 } } }
	out_V_data_V { ap_fifo {  { out_V_data_V_din fifo_data 1 512 }  { out_V_data_V_full_n fifo_status 0 1 }  { out_V_data_V_write fifo_update 1 1 } } }
	out_V_id_V { ap_fifo {  { out_V_id_V_din fifo_data 1 8 }  { out_V_id_V_full_n fifo_status 0 1 }  { out_V_id_V_write fifo_update 1 1 } } }
	out_V_dest_V { ap_fifo {  { out_V_dest_V_din fifo_data 1 8 }  { out_V_dest_V_full_n fifo_status 0 1 }  { out_V_dest_V_write fifo_update 1 1 } } }
	out_V_user_V { ap_fifo {  { out_V_user_V_din fifo_data 1 16 }  { out_V_user_V_full_n fifo_status 0 1 }  { out_V_user_V_write fifo_update 1 1 } } }
	out_V_last_V { ap_fifo {  { out_V_last_V_din fifo_data 1 1 }  { out_V_last_V_full_n fifo_status 0 1 }  { out_V_last_V_write fifo_update 1 1 } } }
}
