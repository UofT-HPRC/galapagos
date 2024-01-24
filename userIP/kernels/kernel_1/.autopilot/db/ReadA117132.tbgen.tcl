set moduleName ReadA117132
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
set C_modelName {ReadA117132}
set C_modelType { void 0 }
set C_modelArgList {
	{ N_pipe_in_V_V2 int 32 regular {fifo 0 volatile }  }
	{ N_pipe_out_V_V9 int 32 regular {fifo 1 volatile }  }
	{ a_pipes_1_V_V14 int 256 regular {fifo 1 volatile }  }
	{ a_pipes_2_V_V19 int 256 regular {fifo 1 volatile }  }
	{ a_pipes_3_V_V24 int 256 regular {fifo 1 volatile }  }
	{ a_pipes_4_V_V29 int 256 regular {fifo 1 volatile }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "N_pipe_in_V_V2", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "N_pipe_out_V_V9", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "a_pipes_1_V_V14", "interface" : "fifo", "bitwidth" : 256, "direction" : "WRITEONLY"} , 
 	{ "Name" : "a_pipes_2_V_V19", "interface" : "fifo", "bitwidth" : 256, "direction" : "WRITEONLY"} , 
 	{ "Name" : "a_pipes_3_V_V24", "interface" : "fifo", "bitwidth" : 256, "direction" : "WRITEONLY"} , 
 	{ "Name" : "a_pipes_4_V_V29", "interface" : "fifo", "bitwidth" : 256, "direction" : "WRITEONLY"} ]}
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
	{ N_pipe_in_V_V2_dout sc_in sc_lv 32 signal 0 } 
	{ N_pipe_in_V_V2_empty_n sc_in sc_logic 1 signal 0 } 
	{ N_pipe_in_V_V2_read sc_out sc_logic 1 signal 0 } 
	{ N_pipe_out_V_V9_din sc_out sc_lv 32 signal 1 } 
	{ N_pipe_out_V_V9_full_n sc_in sc_logic 1 signal 1 } 
	{ N_pipe_out_V_V9_write sc_out sc_logic 1 signal 1 } 
	{ a_pipes_1_V_V14_din sc_out sc_lv 256 signal 2 } 
	{ a_pipes_1_V_V14_full_n sc_in sc_logic 1 signal 2 } 
	{ a_pipes_1_V_V14_write sc_out sc_logic 1 signal 2 } 
	{ a_pipes_2_V_V19_din sc_out sc_lv 256 signal 3 } 
	{ a_pipes_2_V_V19_full_n sc_in sc_logic 1 signal 3 } 
	{ a_pipes_2_V_V19_write sc_out sc_logic 1 signal 3 } 
	{ a_pipes_3_V_V24_din sc_out sc_lv 256 signal 4 } 
	{ a_pipes_3_V_V24_full_n sc_in sc_logic 1 signal 4 } 
	{ a_pipes_3_V_V24_write sc_out sc_logic 1 signal 4 } 
	{ a_pipes_4_V_V29_din sc_out sc_lv 256 signal 5 } 
	{ a_pipes_4_V_V29_full_n sc_in sc_logic 1 signal 5 } 
	{ a_pipes_4_V_V29_write sc_out sc_logic 1 signal 5 } 
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
 	{ "name": "N_pipe_in_V_V2_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "N_pipe_in_V_V2", "role": "dout" }} , 
 	{ "name": "N_pipe_in_V_V2_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "N_pipe_in_V_V2", "role": "empty_n" }} , 
 	{ "name": "N_pipe_in_V_V2_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "N_pipe_in_V_V2", "role": "read" }} , 
 	{ "name": "N_pipe_out_V_V9_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "N_pipe_out_V_V9", "role": "din" }} , 
 	{ "name": "N_pipe_out_V_V9_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "N_pipe_out_V_V9", "role": "full_n" }} , 
 	{ "name": "N_pipe_out_V_V9_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "N_pipe_out_V_V9", "role": "write" }} , 
 	{ "name": "a_pipes_1_V_V14_din", "direction": "out", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "a_pipes_1_V_V14", "role": "din" }} , 
 	{ "name": "a_pipes_1_V_V14_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_pipes_1_V_V14", "role": "full_n" }} , 
 	{ "name": "a_pipes_1_V_V14_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_pipes_1_V_V14", "role": "write" }} , 
 	{ "name": "a_pipes_2_V_V19_din", "direction": "out", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "a_pipes_2_V_V19", "role": "din" }} , 
 	{ "name": "a_pipes_2_V_V19_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_pipes_2_V_V19", "role": "full_n" }} , 
 	{ "name": "a_pipes_2_V_V19_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_pipes_2_V_V19", "role": "write" }} , 
 	{ "name": "a_pipes_3_V_V24_din", "direction": "out", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "a_pipes_3_V_V24", "role": "din" }} , 
 	{ "name": "a_pipes_3_V_V24_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_pipes_3_V_V24", "role": "full_n" }} , 
 	{ "name": "a_pipes_3_V_V24_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_pipes_3_V_V24", "role": "write" }} , 
 	{ "name": "a_pipes_4_V_V29_din", "direction": "out", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "a_pipes_4_V_V29", "role": "din" }} , 
 	{ "name": "a_pipes_4_V_V29_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_pipes_4_V_V29", "role": "full_n" }} , 
 	{ "name": "a_pipes_4_V_V29_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_pipes_4_V_V29", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32"],
		"CDFG" : "ReadA117132",
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
			{"Name" : "N_pipe_in_V_V2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "N_pipe_in_V_V2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "N_pipe_out_V_V9", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "N_pipe_out_V_V9_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_pipes_1_V_V14", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "a_pipes_1_V_V14_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_pipes_2_V_V19", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "a_pipes_2_V_V19_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_pipes_3_V_V24", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "a_pipes_3_V_V24_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_pipes_4_V_V29", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "a_pipes_4_V_V29_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "weights_0_2_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_2_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_2_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_2_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_2_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_2_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_2_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_2_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_2_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_2_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_2_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_2_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_2_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_2_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_2_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_2_15", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_2_16", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_2_17", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_2_18", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_2_19", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_2_20", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_2_21", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_2_22", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_2_23", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_2_24", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_2_25", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_2_26", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_2_27", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_2_28", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_2_29", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_2_30", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_2_31", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_2_0_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_2_1_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_2_2_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_2_3_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_2_4_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_2_5_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_2_6_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_2_7_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_2_8_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_2_9_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_2_10_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_2_11_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_2_12_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_2_13_U", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_2_14_U", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_2_15_U", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_2_16_U", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_2_17_U", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_2_18_U", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_2_19_U", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_2_20_U", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_2_21_U", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_2_22_U", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_2_23_U", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_2_24_U", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_2_25_U", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_2_26_U", "Parent" : "0"},
	{"ID" : "28", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_2_27_U", "Parent" : "0"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_2_28_U", "Parent" : "0"},
	{"ID" : "30", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_2_29_U", "Parent" : "0"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_2_30_U", "Parent" : "0"},
	{"ID" : "32", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.weights_0_2_31_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	ReadA117132 {
		N_pipe_in_V_V2 {Type I LastRead 0 FirstWrite -1}
		N_pipe_out_V_V9 {Type O LastRead -1 FirstWrite 0}
		a_pipes_1_V_V14 {Type O LastRead -1 FirstWrite 2}
		a_pipes_2_V_V19 {Type O LastRead -1 FirstWrite 2}
		a_pipes_3_V_V24 {Type O LastRead -1 FirstWrite 2}
		a_pipes_4_V_V29 {Type O LastRead -1 FirstWrite 2}
		weights_0_2_0 {Type I LastRead -1 FirstWrite -1}
		weights_0_2_1 {Type I LastRead -1 FirstWrite -1}
		weights_0_2_2 {Type I LastRead -1 FirstWrite -1}
		weights_0_2_3 {Type I LastRead -1 FirstWrite -1}
		weights_0_2_4 {Type I LastRead -1 FirstWrite -1}
		weights_0_2_5 {Type I LastRead -1 FirstWrite -1}
		weights_0_2_6 {Type I LastRead -1 FirstWrite -1}
		weights_0_2_7 {Type I LastRead -1 FirstWrite -1}
		weights_0_2_8 {Type I LastRead -1 FirstWrite -1}
		weights_0_2_9 {Type I LastRead -1 FirstWrite -1}
		weights_0_2_10 {Type I LastRead -1 FirstWrite -1}
		weights_0_2_11 {Type I LastRead -1 FirstWrite -1}
		weights_0_2_12 {Type I LastRead -1 FirstWrite -1}
		weights_0_2_13 {Type I LastRead -1 FirstWrite -1}
		weights_0_2_14 {Type I LastRead -1 FirstWrite -1}
		weights_0_2_15 {Type I LastRead -1 FirstWrite -1}
		weights_0_2_16 {Type I LastRead -1 FirstWrite -1}
		weights_0_2_17 {Type I LastRead -1 FirstWrite -1}
		weights_0_2_18 {Type I LastRead -1 FirstWrite -1}
		weights_0_2_19 {Type I LastRead -1 FirstWrite -1}
		weights_0_2_20 {Type I LastRead -1 FirstWrite -1}
		weights_0_2_21 {Type I LastRead -1 FirstWrite -1}
		weights_0_2_22 {Type I LastRead -1 FirstWrite -1}
		weights_0_2_23 {Type I LastRead -1 FirstWrite -1}
		weights_0_2_24 {Type I LastRead -1 FirstWrite -1}
		weights_0_2_25 {Type I LastRead -1 FirstWrite -1}
		weights_0_2_26 {Type I LastRead -1 FirstWrite -1}
		weights_0_2_27 {Type I LastRead -1 FirstWrite -1}
		weights_0_2_28 {Type I LastRead -1 FirstWrite -1}
		weights_0_2_29 {Type I LastRead -1 FirstWrite -1}
		weights_0_2_30 {Type I LastRead -1 FirstWrite -1}
		weights_0_2_31 {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "770", "Max" : "3145730"}
	, {"Name" : "Interval", "Min" : "770", "Max" : "3145730"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	N_pipe_in_V_V2 { ap_fifo {  { N_pipe_in_V_V2_dout fifo_data 0 32 }  { N_pipe_in_V_V2_empty_n fifo_status 0 1 }  { N_pipe_in_V_V2_read fifo_update 1 1 } } }
	N_pipe_out_V_V9 { ap_fifo {  { N_pipe_out_V_V9_din fifo_data 1 32 }  { N_pipe_out_V_V9_full_n fifo_status 0 1 }  { N_pipe_out_V_V9_write fifo_update 1 1 } } }
	a_pipes_1_V_V14 { ap_fifo {  { a_pipes_1_V_V14_din fifo_data 1 256 }  { a_pipes_1_V_V14_full_n fifo_status 0 1 }  { a_pipes_1_V_V14_write fifo_update 1 1 } } }
	a_pipes_2_V_V19 { ap_fifo {  { a_pipes_2_V_V19_din fifo_data 1 256 }  { a_pipes_2_V_V19_full_n fifo_status 0 1 }  { a_pipes_2_V_V19_write fifo_update 1 1 } } }
	a_pipes_3_V_V24 { ap_fifo {  { a_pipes_3_V_V24_din fifo_data 1 256 }  { a_pipes_3_V_V24_full_n fifo_status 0 1 }  { a_pipes_3_V_V24_write fifo_update 1 1 } } }
	a_pipes_4_V_V29 { ap_fifo {  { a_pipes_4_V_V29_din fifo_data 1 256 }  { a_pipes_4_V_V29_full_n fifo_status 0 1 }  { a_pipes_4_V_V29_write fifo_update 1 1 } } }
}
