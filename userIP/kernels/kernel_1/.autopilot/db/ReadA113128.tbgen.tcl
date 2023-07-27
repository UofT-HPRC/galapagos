set moduleName ReadA113128
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
set C_modelName {ReadA113128}
set C_modelType { void 0 }
set C_modelArgList {
	{ N_pipe_in_V_V int 32 regular {fifo 0 volatile }  }
	{ N_pipe_out_V_V7 int 32 regular {fifo 1 volatile }  }
	{ a_pipes_1_V_V int 256 regular {fifo 1 volatile }  }
	{ a_pipes_2_V_V int 256 regular {fifo 1 volatile }  }
	{ a_pipes_3_V_V int 256 regular {fifo 1 volatile }  }
	{ a_pipes_4_V_V int 256 regular {fifo 1 volatile }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "N_pipe_in_V_V", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "N_pipe_out_V_V7", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "a_pipes_1_V_V", "interface" : "fifo", "bitwidth" : 256, "direction" : "WRITEONLY"} , 
 	{ "Name" : "a_pipes_2_V_V", "interface" : "fifo", "bitwidth" : 256, "direction" : "WRITEONLY"} , 
 	{ "Name" : "a_pipes_3_V_V", "interface" : "fifo", "bitwidth" : 256, "direction" : "WRITEONLY"} , 
 	{ "Name" : "a_pipes_4_V_V", "interface" : "fifo", "bitwidth" : 256, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 28
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
	{ N_pipe_in_V_V_dout sc_in sc_lv 32 signal 0 } 
	{ N_pipe_in_V_V_empty_n sc_in sc_logic 1 signal 0 } 
	{ N_pipe_in_V_V_read sc_out sc_logic 1 signal 0 } 
	{ N_pipe_out_V_V7_din sc_out sc_lv 32 signal 1 } 
	{ N_pipe_out_V_V7_full_n sc_in sc_logic 1 signal 1 } 
	{ N_pipe_out_V_V7_write sc_out sc_logic 1 signal 1 } 
	{ a_pipes_1_V_V_din sc_out sc_lv 256 signal 2 } 
	{ a_pipes_1_V_V_full_n sc_in sc_logic 1 signal 2 } 
	{ a_pipes_1_V_V_write sc_out sc_logic 1 signal 2 } 
	{ a_pipes_2_V_V_din sc_out sc_lv 256 signal 3 } 
	{ a_pipes_2_V_V_full_n sc_in sc_logic 1 signal 3 } 
	{ a_pipes_2_V_V_write sc_out sc_logic 1 signal 3 } 
	{ a_pipes_3_V_V_din sc_out sc_lv 256 signal 4 } 
	{ a_pipes_3_V_V_full_n sc_in sc_logic 1 signal 4 } 
	{ a_pipes_3_V_V_write sc_out sc_logic 1 signal 4 } 
	{ a_pipes_4_V_V_din sc_out sc_lv 256 signal 5 } 
	{ a_pipes_4_V_V_full_n sc_in sc_logic 1 signal 5 } 
	{ a_pipes_4_V_V_write sc_out sc_logic 1 signal 5 } 
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
 	{ "name": "N_pipe_in_V_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "N_pipe_in_V_V", "role": "dout" }} , 
 	{ "name": "N_pipe_in_V_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "N_pipe_in_V_V", "role": "empty_n" }} , 
 	{ "name": "N_pipe_in_V_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "N_pipe_in_V_V", "role": "read" }} , 
 	{ "name": "N_pipe_out_V_V7_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "N_pipe_out_V_V7", "role": "din" }} , 
 	{ "name": "N_pipe_out_V_V7_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "N_pipe_out_V_V7", "role": "full_n" }} , 
 	{ "name": "N_pipe_out_V_V7_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "N_pipe_out_V_V7", "role": "write" }} , 
 	{ "name": "a_pipes_1_V_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "a_pipes_1_V_V", "role": "din" }} , 
 	{ "name": "a_pipes_1_V_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_pipes_1_V_V", "role": "full_n" }} , 
 	{ "name": "a_pipes_1_V_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_pipes_1_V_V", "role": "write" }} , 
 	{ "name": "a_pipes_2_V_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "a_pipes_2_V_V", "role": "din" }} , 
 	{ "name": "a_pipes_2_V_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_pipes_2_V_V", "role": "full_n" }} , 
 	{ "name": "a_pipes_2_V_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_pipes_2_V_V", "role": "write" }} , 
 	{ "name": "a_pipes_3_V_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "a_pipes_3_V_V", "role": "din" }} , 
 	{ "name": "a_pipes_3_V_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_pipes_3_V_V", "role": "full_n" }} , 
 	{ "name": "a_pipes_3_V_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_pipes_3_V_V", "role": "write" }} , 
 	{ "name": "a_pipes_4_V_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "a_pipes_4_V_V", "role": "din" }} , 
 	{ "name": "a_pipes_4_V_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_pipes_4_V_V", "role": "full_n" }} , 
 	{ "name": "a_pipes_4_V_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_pipes_4_V_V", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32"],
		"CDFG" : "ReadA113128",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "770", "EstimateLatencyMax" : "3145730",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "N_pipe_in_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "N_pipe_in_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "N_pipe_out_V_V7", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "N_pipe_out_V_V7_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_pipes_1_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "a_pipes_1_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_pipes_2_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "a_pipes_2_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_pipes_3_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "a_pipes_3_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_pipes_4_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "a_pipes_4_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "weights_0_0_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_0_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_0_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_0_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_0_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_0_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_0_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_0_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_0_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_0_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_0_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_0_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_0_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_0_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_0_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_0_15", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_0_16", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_0_17", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_0_18", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_0_19", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_0_20", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_0_21", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_0_22", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_0_23", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_0_24", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_0_25", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_0_26", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_0_27", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_0_28", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_0_29", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_0_30", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_0_31", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_0_0_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_0_1_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_0_2_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_0_3_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_0_4_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_0_5_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_0_6_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_0_7_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_0_8_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_0_9_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_0_10_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_0_11_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_0_12_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_0_13_U", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_0_14_U", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_0_15_U", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_0_16_U", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_0_17_U", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_0_18_U", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_0_19_U", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_0_20_U", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_0_21_U", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_0_22_U", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_0_23_U", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_0_24_U", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_0_25_U", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_0_26_U", "Parent" : "0"},
	{"ID" : "28", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_0_27_U", "Parent" : "0"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_0_28_U", "Parent" : "0"},
	{"ID" : "30", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_0_29_U", "Parent" : "0"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_0_30_U", "Parent" : "0"},
	{"ID" : "32", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_0_31_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	ReadA113128 {
		N_pipe_in_V_V {Type I LastRead 0 FirstWrite -1}
		N_pipe_out_V_V7 {Type O LastRead -1 FirstWrite 0}
		a_pipes_1_V_V {Type O LastRead -1 FirstWrite 2}
		a_pipes_2_V_V {Type O LastRead -1 FirstWrite 2}
		a_pipes_3_V_V {Type O LastRead -1 FirstWrite 2}
		a_pipes_4_V_V {Type O LastRead -1 FirstWrite 2}
		weights_0_0_0 {Type I LastRead -1 FirstWrite -1}
		weights_0_0_1 {Type I LastRead -1 FirstWrite -1}
		weights_0_0_2 {Type I LastRead -1 FirstWrite -1}
		weights_0_0_3 {Type I LastRead -1 FirstWrite -1}
		weights_0_0_4 {Type I LastRead -1 FirstWrite -1}
		weights_0_0_5 {Type I LastRead -1 FirstWrite -1}
		weights_0_0_6 {Type I LastRead -1 FirstWrite -1}
		weights_0_0_7 {Type I LastRead -1 FirstWrite -1}
		weights_0_0_8 {Type I LastRead -1 FirstWrite -1}
		weights_0_0_9 {Type I LastRead -1 FirstWrite -1}
		weights_0_0_10 {Type I LastRead -1 FirstWrite -1}
		weights_0_0_11 {Type I LastRead -1 FirstWrite -1}
		weights_0_0_12 {Type I LastRead -1 FirstWrite -1}
		weights_0_0_13 {Type I LastRead -1 FirstWrite -1}
		weights_0_0_14 {Type I LastRead -1 FirstWrite -1}
		weights_0_0_15 {Type I LastRead -1 FirstWrite -1}
		weights_0_0_16 {Type I LastRead -1 FirstWrite -1}
		weights_0_0_17 {Type I LastRead -1 FirstWrite -1}
		weights_0_0_18 {Type I LastRead -1 FirstWrite -1}
		weights_0_0_19 {Type I LastRead -1 FirstWrite -1}
		weights_0_0_20 {Type I LastRead -1 FirstWrite -1}
		weights_0_0_21 {Type I LastRead -1 FirstWrite -1}
		weights_0_0_22 {Type I LastRead -1 FirstWrite -1}
		weights_0_0_23 {Type I LastRead -1 FirstWrite -1}
		weights_0_0_24 {Type I LastRead -1 FirstWrite -1}
		weights_0_0_25 {Type I LastRead -1 FirstWrite -1}
		weights_0_0_26 {Type I LastRead -1 FirstWrite -1}
		weights_0_0_27 {Type I LastRead -1 FirstWrite -1}
		weights_0_0_28 {Type I LastRead -1 FirstWrite -1}
		weights_0_0_29 {Type I LastRead -1 FirstWrite -1}
		weights_0_0_30 {Type I LastRead -1 FirstWrite -1}
		weights_0_0_31 {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "770", "Max" : "3145730"}
	, {"Name" : "Interval", "Min" : "770", "Max" : "3145730"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	N_pipe_in_V_V { ap_fifo {  { N_pipe_in_V_V_dout fifo_data 0 32 }  { N_pipe_in_V_V_empty_n fifo_status 0 1 }  { N_pipe_in_V_V_read fifo_update 1 1 } } }
	N_pipe_out_V_V7 { ap_fifo {  { N_pipe_out_V_V7_din fifo_data 1 32 }  { N_pipe_out_V_V7_full_n fifo_status 0 1 }  { N_pipe_out_V_V7_write fifo_update 1 1 } } }
	a_pipes_1_V_V { ap_fifo {  { a_pipes_1_V_V_din fifo_data 1 256 }  { a_pipes_1_V_V_full_n fifo_status 0 1 }  { a_pipes_1_V_V_write fifo_update 1 1 } } }
	a_pipes_2_V_V { ap_fifo {  { a_pipes_2_V_V_din fifo_data 1 256 }  { a_pipes_2_V_V_full_n fifo_status 0 1 }  { a_pipes_2_V_V_write fifo_update 1 1 } } }
	a_pipes_3_V_V { ap_fifo {  { a_pipes_3_V_V_din fifo_data 1 256 }  { a_pipes_3_V_V_full_n fifo_status 0 1 }  { a_pipes_3_V_V_write fifo_update 1 1 } } }
	a_pipes_4_V_V { ap_fifo {  { a_pipes_4_V_V_din fifo_data 1 256 }  { a_pipes_4_V_V_full_n fifo_status 0 1 }  { a_pipes_4_V_V_write fifo_update 1 1 } } }
}
