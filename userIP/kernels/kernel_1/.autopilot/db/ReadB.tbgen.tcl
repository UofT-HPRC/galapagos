set moduleName ReadB
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
set C_modelName {ReadB}
set C_modelType { void 0 }
set C_modelArgList {
	{ in_V_data_V int 512 regular {axi_s 0 volatile  { in_r Data } }  }
	{ in_V_id_V int 8 regular {axi_s 0 volatile  { in_r ID } }  }
	{ in_V_dest_V int 8 regular {axi_s 0 volatile  { in_r Dest } }  }
	{ in_V_user_V int 16 regular {axi_s 0 volatile  { in_r User } }  }
	{ in_V_last_V int 1 regular {axi_s 0 volatile  { in_r Last } }  }
	{ b_pipes_1_V_V int 256 regular {fifo 1 volatile }  }
	{ b_pipes_2_V_V int 256 regular {fifo 1 volatile }  }
	{ N_pipes_0_V_V int 32 regular {fifo 1 volatile }  }
	{ N_pipes_1_V_V int 32 regular {fifo 1 volatile }  }
	{ N_pipes_2_V_V int 32 regular {fifo 1 volatile }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "in_V_data_V", "interface" : "axis", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "in_V_id_V", "interface" : "axis", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "in_V_dest_V", "interface" : "axis", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "in_V_user_V", "interface" : "axis", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "in_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "b_pipes_1_V_V", "interface" : "fifo", "bitwidth" : 256, "direction" : "WRITEONLY"} , 
 	{ "Name" : "b_pipes_2_V_V", "interface" : "fifo", "bitwidth" : 256, "direction" : "WRITEONLY"} , 
 	{ "Name" : "N_pipes_0_V_V", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "N_pipes_1_V_V", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "N_pipes_2_V_V", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 32
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ start_full_n sc_in sc_logic 1 signal -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ start_out sc_out sc_logic 1 signal -1 } 
	{ start_write sc_out sc_logic 1 signal -1 } 
	{ in_r_TDATA sc_in sc_lv 512 signal 0 } 
	{ in_r_TVALID sc_in sc_logic 1 invld 4 } 
	{ in_r_TREADY sc_out sc_logic 1 inacc 4 } 
	{ in_r_TID sc_in sc_lv 8 signal 1 } 
	{ in_r_TDEST sc_in sc_lv 8 signal 2 } 
	{ in_r_TUSER sc_in sc_lv 16 signal 3 } 
	{ in_r_TLAST sc_in sc_lv 1 signal 4 } 
	{ b_pipes_1_V_V_din sc_out sc_lv 256 signal 5 } 
	{ b_pipes_1_V_V_full_n sc_in sc_logic 1 signal 5 } 
	{ b_pipes_1_V_V_write sc_out sc_logic 1 signal 5 } 
	{ b_pipes_2_V_V_din sc_out sc_lv 256 signal 6 } 
	{ b_pipes_2_V_V_full_n sc_in sc_logic 1 signal 6 } 
	{ b_pipes_2_V_V_write sc_out sc_logic 1 signal 6 } 
	{ N_pipes_0_V_V_din sc_out sc_lv 32 signal 7 } 
	{ N_pipes_0_V_V_full_n sc_in sc_logic 1 signal 7 } 
	{ N_pipes_0_V_V_write sc_out sc_logic 1 signal 7 } 
	{ N_pipes_1_V_V_din sc_out sc_lv 32 signal 8 } 
	{ N_pipes_1_V_V_full_n sc_in sc_logic 1 signal 8 } 
	{ N_pipes_1_V_V_write sc_out sc_logic 1 signal 8 } 
	{ N_pipes_2_V_V_din sc_out sc_lv 32 signal 9 } 
	{ N_pipes_2_V_V_full_n sc_in sc_logic 1 signal 9 } 
	{ N_pipes_2_V_V_write sc_out sc_logic 1 signal 9 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "start_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_full_n", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "start_out", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_out", "role": "default" }} , 
 	{ "name": "start_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_write", "role": "default" }} , 
 	{ "name": "in_r_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "in_V_data_V", "role": "default" }} , 
 	{ "name": "in_r_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "in_V_last_V", "role": "default" }} , 
 	{ "name": "in_r_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "in_V_last_V", "role": "default" }} , 
 	{ "name": "in_r_TID", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "in_V_id_V", "role": "default" }} , 
 	{ "name": "in_r_TDEST", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "in_V_dest_V", "role": "default" }} , 
 	{ "name": "in_r_TUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "in_V_user_V", "role": "default" }} , 
 	{ "name": "in_r_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_V_last_V", "role": "default" }} , 
 	{ "name": "b_pipes_1_V_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "b_pipes_1_V_V", "role": "din" }} , 
 	{ "name": "b_pipes_1_V_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b_pipes_1_V_V", "role": "full_n" }} , 
 	{ "name": "b_pipes_1_V_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b_pipes_1_V_V", "role": "write" }} , 
 	{ "name": "b_pipes_2_V_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "b_pipes_2_V_V", "role": "din" }} , 
 	{ "name": "b_pipes_2_V_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b_pipes_2_V_V", "role": "full_n" }} , 
 	{ "name": "b_pipes_2_V_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b_pipes_2_V_V", "role": "write" }} , 
 	{ "name": "N_pipes_0_V_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "N_pipes_0_V_V", "role": "din" }} , 
 	{ "name": "N_pipes_0_V_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "N_pipes_0_V_V", "role": "full_n" }} , 
 	{ "name": "N_pipes_0_V_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "N_pipes_0_V_V", "role": "write" }} , 
 	{ "name": "N_pipes_1_V_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "N_pipes_1_V_V", "role": "din" }} , 
 	{ "name": "N_pipes_1_V_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "N_pipes_1_V_V", "role": "full_n" }} , 
 	{ "name": "N_pipes_1_V_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "N_pipes_1_V_V", "role": "write" }} , 
 	{ "name": "N_pipes_2_V_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "N_pipes_2_V_V", "role": "din" }} , 
 	{ "name": "N_pipes_2_V_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "N_pipes_2_V_V", "role": "full_n" }} , 
 	{ "name": "N_pipes_2_V_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "N_pipes_2_V_V", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "ReadB",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "14", "EstimateLatencyMax" : "49154",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "in_V_data_V", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "in_r_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "in_V_id_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "in_V_dest_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "in_V_user_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "in_V_last_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "b_pipes_1_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "b_pipes_1_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "b_pipes_2_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "b_pipes_2_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "N_pipes_0_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "N_pipes_0_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "N_pipes_1_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "N_pipes_1_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "N_pipes_2_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "N_pipes_2_V_V_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	ReadB {
		in_V_data_V {Type I LastRead 1 FirstWrite -1}
		in_V_id_V {Type I LastRead 1 FirstWrite -1}
		in_V_dest_V {Type I LastRead 1 FirstWrite -1}
		in_V_user_V {Type I LastRead 1 FirstWrite -1}
		in_V_last_V {Type I LastRead 1 FirstWrite -1}
		b_pipes_1_V_V {Type O LastRead -1 FirstWrite 2}
		b_pipes_2_V_V {Type O LastRead -1 FirstWrite 2}
		N_pipes_0_V_V {Type O LastRead -1 FirstWrite 0}
		N_pipes_1_V_V {Type O LastRead -1 FirstWrite 0}
		N_pipes_2_V_V {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "14", "Max" : "49154"}
	, {"Name" : "Interval", "Min" : "14", "Max" : "49154"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	in_V_data_V { axis {  { in_r_TDATA in_data 0 512 } } }
	in_V_id_V { axis {  { in_r_TID in_data 0 8 } } }
	in_V_dest_V { axis {  { in_r_TDEST in_data 0 8 } } }
	in_V_user_V { axis {  { in_r_TUSER in_data 0 16 } } }
	in_V_last_V { axis {  { in_r_TVALID in_vld 0 1 }  { in_r_TREADY in_acc 1 1 }  { in_r_TLAST in_data 0 1 } } }
	b_pipes_1_V_V { ap_fifo {  { b_pipes_1_V_V_din fifo_data 1 256 }  { b_pipes_1_V_V_full_n fifo_status 0 1 }  { b_pipes_1_V_V_write fifo_update 1 1 } } }
	b_pipes_2_V_V { ap_fifo {  { b_pipes_2_V_V_din fifo_data 1 256 }  { b_pipes_2_V_V_full_n fifo_status 0 1 }  { b_pipes_2_V_V_write fifo_update 1 1 } } }
	N_pipes_0_V_V { ap_fifo {  { N_pipes_0_V_V_din fifo_data 1 32 }  { N_pipes_0_V_V_full_n fifo_status 0 1 }  { N_pipes_0_V_V_write fifo_update 1 1 } } }
	N_pipes_1_V_V { ap_fifo {  { N_pipes_1_V_V_din fifo_data 1 32 }  { N_pipes_1_V_V_full_n fifo_status 0 1 }  { N_pipes_1_V_V_write fifo_update 1 1 } } }
	N_pipes_2_V_V { ap_fifo {  { N_pipes_2_V_V_din fifo_data 1 32 }  { N_pipes_2_V_V_full_n fifo_status 0 1 }  { N_pipes_2_V_V_write fifo_update 1 1 } } }
}
