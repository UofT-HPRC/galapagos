set moduleName PE_3
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
set C_modelName {PE.3}
set C_modelType { void 0 }
set C_modelArgList {
	{ N_pipe_in_1_V_V int 32 regular {fifo 0 volatile }  }
	{ N_pipe_out_2_V_V int 32 regular {fifo 1 volatile }  }
	{ a_in_1_1_V_V int 256 regular {fifo 0 volatile }  }
	{ a_in_2_1_V_V int 256 regular {fifo 0 volatile }  }
	{ a_in_3_1_V_V int 256 regular {fifo 0 volatile }  }
	{ a_in_4_1_V_V int 256 regular {fifo 0 volatile }  }
	{ b_in_1_1_V_V int 256 regular {fifo 0 volatile }  }
	{ b_in_2_1_V_V int 256 regular {fifo 0 volatile }  }
	{ b_out_1_2_V_V int 256 regular {fifo 1 volatile }  }
	{ b_out_2_2_V_V int 256 regular {fifo 1 volatile }  }
	{ c_in_1_1_V_V int 32 regular {fifo 0 volatile }  }
	{ c_in_2_1_V_V int 32 regular {fifo 0 volatile }  }
	{ c_out_1_2_V_V int 32 regular {fifo 1 volatile }  }
	{ c_out_2_2_V_V int 32 regular {fifo 1 volatile }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "N_pipe_in_1_V_V", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "N_pipe_out_2_V_V", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "a_in_1_1_V_V", "interface" : "fifo", "bitwidth" : 256, "direction" : "READONLY"} , 
 	{ "Name" : "a_in_2_1_V_V", "interface" : "fifo", "bitwidth" : 256, "direction" : "READONLY"} , 
 	{ "Name" : "a_in_3_1_V_V", "interface" : "fifo", "bitwidth" : 256, "direction" : "READONLY"} , 
 	{ "Name" : "a_in_4_1_V_V", "interface" : "fifo", "bitwidth" : 256, "direction" : "READONLY"} , 
 	{ "Name" : "b_in_1_1_V_V", "interface" : "fifo", "bitwidth" : 256, "direction" : "READONLY"} , 
 	{ "Name" : "b_in_2_1_V_V", "interface" : "fifo", "bitwidth" : 256, "direction" : "READONLY"} , 
 	{ "Name" : "b_out_1_2_V_V", "interface" : "fifo", "bitwidth" : 256, "direction" : "WRITEONLY"} , 
 	{ "Name" : "b_out_2_2_V_V", "interface" : "fifo", "bitwidth" : 256, "direction" : "WRITEONLY"} , 
 	{ "Name" : "c_in_1_1_V_V", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "c_in_2_1_V_V", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "c_out_1_2_V_V", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "c_out_2_2_V_V", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 52
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
	{ N_pipe_in_1_V_V_dout sc_in sc_lv 32 signal 0 } 
	{ N_pipe_in_1_V_V_empty_n sc_in sc_logic 1 signal 0 } 
	{ N_pipe_in_1_V_V_read sc_out sc_logic 1 signal 0 } 
	{ N_pipe_out_2_V_V_din sc_out sc_lv 32 signal 1 } 
	{ N_pipe_out_2_V_V_full_n sc_in sc_logic 1 signal 1 } 
	{ N_pipe_out_2_V_V_write sc_out sc_logic 1 signal 1 } 
	{ a_in_1_1_V_V_dout sc_in sc_lv 256 signal 2 } 
	{ a_in_1_1_V_V_empty_n sc_in sc_logic 1 signal 2 } 
	{ a_in_1_1_V_V_read sc_out sc_logic 1 signal 2 } 
	{ a_in_2_1_V_V_dout sc_in sc_lv 256 signal 3 } 
	{ a_in_2_1_V_V_empty_n sc_in sc_logic 1 signal 3 } 
	{ a_in_2_1_V_V_read sc_out sc_logic 1 signal 3 } 
	{ a_in_3_1_V_V_dout sc_in sc_lv 256 signal 4 } 
	{ a_in_3_1_V_V_empty_n sc_in sc_logic 1 signal 4 } 
	{ a_in_3_1_V_V_read sc_out sc_logic 1 signal 4 } 
	{ a_in_4_1_V_V_dout sc_in sc_lv 256 signal 5 } 
	{ a_in_4_1_V_V_empty_n sc_in sc_logic 1 signal 5 } 
	{ a_in_4_1_V_V_read sc_out sc_logic 1 signal 5 } 
	{ b_in_1_1_V_V_dout sc_in sc_lv 256 signal 6 } 
	{ b_in_1_1_V_V_empty_n sc_in sc_logic 1 signal 6 } 
	{ b_in_1_1_V_V_read sc_out sc_logic 1 signal 6 } 
	{ b_in_2_1_V_V_dout sc_in sc_lv 256 signal 7 } 
	{ b_in_2_1_V_V_empty_n sc_in sc_logic 1 signal 7 } 
	{ b_in_2_1_V_V_read sc_out sc_logic 1 signal 7 } 
	{ b_out_1_2_V_V_din sc_out sc_lv 256 signal 8 } 
	{ b_out_1_2_V_V_full_n sc_in sc_logic 1 signal 8 } 
	{ b_out_1_2_V_V_write sc_out sc_logic 1 signal 8 } 
	{ b_out_2_2_V_V_din sc_out sc_lv 256 signal 9 } 
	{ b_out_2_2_V_V_full_n sc_in sc_logic 1 signal 9 } 
	{ b_out_2_2_V_V_write sc_out sc_logic 1 signal 9 } 
	{ c_in_1_1_V_V_dout sc_in sc_lv 32 signal 10 } 
	{ c_in_1_1_V_V_empty_n sc_in sc_logic 1 signal 10 } 
	{ c_in_1_1_V_V_read sc_out sc_logic 1 signal 10 } 
	{ c_in_2_1_V_V_dout sc_in sc_lv 32 signal 11 } 
	{ c_in_2_1_V_V_empty_n sc_in sc_logic 1 signal 11 } 
	{ c_in_2_1_V_V_read sc_out sc_logic 1 signal 11 } 
	{ c_out_1_2_V_V_din sc_out sc_lv 32 signal 12 } 
	{ c_out_1_2_V_V_full_n sc_in sc_logic 1 signal 12 } 
	{ c_out_1_2_V_V_write sc_out sc_logic 1 signal 12 } 
	{ c_out_2_2_V_V_din sc_out sc_lv 32 signal 13 } 
	{ c_out_2_2_V_V_full_n sc_in sc_logic 1 signal 13 } 
	{ c_out_2_2_V_V_write sc_out sc_logic 1 signal 13 } 
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
 	{ "name": "N_pipe_in_1_V_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "N_pipe_in_1_V_V", "role": "dout" }} , 
 	{ "name": "N_pipe_in_1_V_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "N_pipe_in_1_V_V", "role": "empty_n" }} , 
 	{ "name": "N_pipe_in_1_V_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "N_pipe_in_1_V_V", "role": "read" }} , 
 	{ "name": "N_pipe_out_2_V_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "N_pipe_out_2_V_V", "role": "din" }} , 
 	{ "name": "N_pipe_out_2_V_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "N_pipe_out_2_V_V", "role": "full_n" }} , 
 	{ "name": "N_pipe_out_2_V_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "N_pipe_out_2_V_V", "role": "write" }} , 
 	{ "name": "a_in_1_1_V_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "a_in_1_1_V_V", "role": "dout" }} , 
 	{ "name": "a_in_1_1_V_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_in_1_1_V_V", "role": "empty_n" }} , 
 	{ "name": "a_in_1_1_V_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_in_1_1_V_V", "role": "read" }} , 
 	{ "name": "a_in_2_1_V_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "a_in_2_1_V_V", "role": "dout" }} , 
 	{ "name": "a_in_2_1_V_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_in_2_1_V_V", "role": "empty_n" }} , 
 	{ "name": "a_in_2_1_V_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_in_2_1_V_V", "role": "read" }} , 
 	{ "name": "a_in_3_1_V_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "a_in_3_1_V_V", "role": "dout" }} , 
 	{ "name": "a_in_3_1_V_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_in_3_1_V_V", "role": "empty_n" }} , 
 	{ "name": "a_in_3_1_V_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_in_3_1_V_V", "role": "read" }} , 
 	{ "name": "a_in_4_1_V_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "a_in_4_1_V_V", "role": "dout" }} , 
 	{ "name": "a_in_4_1_V_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_in_4_1_V_V", "role": "empty_n" }} , 
 	{ "name": "a_in_4_1_V_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_in_4_1_V_V", "role": "read" }} , 
 	{ "name": "b_in_1_1_V_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "b_in_1_1_V_V", "role": "dout" }} , 
 	{ "name": "b_in_1_1_V_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b_in_1_1_V_V", "role": "empty_n" }} , 
 	{ "name": "b_in_1_1_V_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b_in_1_1_V_V", "role": "read" }} , 
 	{ "name": "b_in_2_1_V_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "b_in_2_1_V_V", "role": "dout" }} , 
 	{ "name": "b_in_2_1_V_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b_in_2_1_V_V", "role": "empty_n" }} , 
 	{ "name": "b_in_2_1_V_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b_in_2_1_V_V", "role": "read" }} , 
 	{ "name": "b_out_1_2_V_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "b_out_1_2_V_V", "role": "din" }} , 
 	{ "name": "b_out_1_2_V_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b_out_1_2_V_V", "role": "full_n" }} , 
 	{ "name": "b_out_1_2_V_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b_out_1_2_V_V", "role": "write" }} , 
 	{ "name": "b_out_2_2_V_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "b_out_2_2_V_V", "role": "din" }} , 
 	{ "name": "b_out_2_2_V_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b_out_2_2_V_V", "role": "full_n" }} , 
 	{ "name": "b_out_2_2_V_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b_out_2_2_V_V", "role": "write" }} , 
 	{ "name": "c_in_1_1_V_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "c_in_1_1_V_V", "role": "dout" }} , 
 	{ "name": "c_in_1_1_V_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "c_in_1_1_V_V", "role": "empty_n" }} , 
 	{ "name": "c_in_1_1_V_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "c_in_1_1_V_V", "role": "read" }} , 
 	{ "name": "c_in_2_1_V_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "c_in_2_1_V_V", "role": "dout" }} , 
 	{ "name": "c_in_2_1_V_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "c_in_2_1_V_V", "role": "empty_n" }} , 
 	{ "name": "c_in_2_1_V_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "c_in_2_1_V_V", "role": "read" }} , 
 	{ "name": "c_out_1_2_V_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "c_out_1_2_V_V", "role": "din" }} , 
 	{ "name": "c_out_1_2_V_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "c_out_1_2_V_V", "role": "full_n" }} , 
 	{ "name": "c_out_1_2_V_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "c_out_1_2_V_V", "role": "write" }} , 
 	{ "name": "c_out_2_2_V_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "c_out_2_2_V_V", "role": "din" }} , 
 	{ "name": "c_out_2_2_V_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "c_out_2_2_V_V", "role": "full_n" }} , 
 	{ "name": "c_out_2_2_V_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "c_out_2_2_V_V", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64"],
		"CDFG" : "PE_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "774", "EstimateLatencyMax" : "3145734",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "N_pipe_in_1_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "N_pipe_in_1_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "N_pipe_out_2_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "N_pipe_out_2_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_in_1_1_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "a_in_1_1_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_in_2_1_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "a_in_2_1_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_in_3_1_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "a_in_3_1_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_in_4_1_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "a_in_4_1_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "b_in_1_1_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "b_in_1_1_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "b_in_2_1_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "b_in_2_1_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "b_out_1_2_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "b_out_1_2_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "b_out_2_2_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "b_out_2_2_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "c_in_1_1_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "c_in_1_1_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "c_in_2_1_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "c_in_2_1_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "c_out_1_2_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "c_out_1_2_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "c_out_2_2_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "c_out_2_2_V_V_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U167", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U168", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U169", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U170", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U171", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U172", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U173", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U174", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U175", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U176", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U177", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U178", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U179", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U180", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U181", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U182", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U183", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U184", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U185", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U186", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U187", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U188", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U189", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U190", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U191", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U192", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U193", "Parent" : "0"},
	{"ID" : "28", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U194", "Parent" : "0"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U195", "Parent" : "0"},
	{"ID" : "30", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U196", "Parent" : "0"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U197", "Parent" : "0"},
	{"ID" : "32", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U198", "Parent" : "0"},
	{"ID" : "33", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U199", "Parent" : "0"},
	{"ID" : "34", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U200", "Parent" : "0"},
	{"ID" : "35", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U201", "Parent" : "0"},
	{"ID" : "36", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U202", "Parent" : "0"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U203", "Parent" : "0"},
	{"ID" : "38", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U204", "Parent" : "0"},
	{"ID" : "39", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U205", "Parent" : "0"},
	{"ID" : "40", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U206", "Parent" : "0"},
	{"ID" : "41", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U207", "Parent" : "0"},
	{"ID" : "42", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U208", "Parent" : "0"},
	{"ID" : "43", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U209", "Parent" : "0"},
	{"ID" : "44", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U210", "Parent" : "0"},
	{"ID" : "45", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U211", "Parent" : "0"},
	{"ID" : "46", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U212", "Parent" : "0"},
	{"ID" : "47", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U213", "Parent" : "0"},
	{"ID" : "48", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U214", "Parent" : "0"},
	{"ID" : "49", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U215", "Parent" : "0"},
	{"ID" : "50", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U216", "Parent" : "0"},
	{"ID" : "51", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U217", "Parent" : "0"},
	{"ID" : "52", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U218", "Parent" : "0"},
	{"ID" : "53", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U219", "Parent" : "0"},
	{"ID" : "54", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U220", "Parent" : "0"},
	{"ID" : "55", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U221", "Parent" : "0"},
	{"ID" : "56", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U222", "Parent" : "0"},
	{"ID" : "57", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U223", "Parent" : "0"},
	{"ID" : "58", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U224", "Parent" : "0"},
	{"ID" : "59", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U225", "Parent" : "0"},
	{"ID" : "60", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U226", "Parent" : "0"},
	{"ID" : "61", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U227", "Parent" : "0"},
	{"ID" : "62", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U228", "Parent" : "0"},
	{"ID" : "63", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U229", "Parent" : "0"},
	{"ID" : "64", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.kernel_1_am_addmul_24s_24s_8s_32_1_1_U230", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	PE_3 {
		N_pipe_in_1_V_V {Type I LastRead 0 FirstWrite -1}
		N_pipe_out_2_V_V {Type O LastRead -1 FirstWrite 0}
		a_in_1_1_V_V {Type I LastRead 2 FirstWrite -1}
		a_in_2_1_V_V {Type I LastRead 2 FirstWrite -1}
		a_in_3_1_V_V {Type I LastRead 2 FirstWrite -1}
		a_in_4_1_V_V {Type I LastRead 2 FirstWrite -1}
		b_in_1_1_V_V {Type I LastRead 2 FirstWrite -1}
		b_in_2_1_V_V {Type I LastRead 2 FirstWrite -1}
		b_out_1_2_V_V {Type O LastRead -1 FirstWrite 2}
		b_out_2_2_V_V {Type O LastRead -1 FirstWrite 2}
		c_in_1_1_V_V {Type I LastRead 5 FirstWrite -1}
		c_in_2_1_V_V {Type I LastRead 5 FirstWrite -1}
		c_out_1_2_V_V {Type O LastRead -1 FirstWrite 6}
		c_out_2_2_V_V {Type O LastRead -1 FirstWrite 6}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "774", "Max" : "3145734"}
	, {"Name" : "Interval", "Min" : "774", "Max" : "3145734"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	N_pipe_in_1_V_V { ap_fifo {  { N_pipe_in_1_V_V_dout fifo_data 0 32 }  { N_pipe_in_1_V_V_empty_n fifo_status 0 1 }  { N_pipe_in_1_V_V_read fifo_update 1 1 } } }
	N_pipe_out_2_V_V { ap_fifo {  { N_pipe_out_2_V_V_din fifo_data 1 32 }  { N_pipe_out_2_V_V_full_n fifo_status 0 1 }  { N_pipe_out_2_V_V_write fifo_update 1 1 } } }
	a_in_1_1_V_V { ap_fifo {  { a_in_1_1_V_V_dout fifo_data 0 256 }  { a_in_1_1_V_V_empty_n fifo_status 0 1 }  { a_in_1_1_V_V_read fifo_update 1 1 } } }
	a_in_2_1_V_V { ap_fifo {  { a_in_2_1_V_V_dout fifo_data 0 256 }  { a_in_2_1_V_V_empty_n fifo_status 0 1 }  { a_in_2_1_V_V_read fifo_update 1 1 } } }
	a_in_3_1_V_V { ap_fifo {  { a_in_3_1_V_V_dout fifo_data 0 256 }  { a_in_3_1_V_V_empty_n fifo_status 0 1 }  { a_in_3_1_V_V_read fifo_update 1 1 } } }
	a_in_4_1_V_V { ap_fifo {  { a_in_4_1_V_V_dout fifo_data 0 256 }  { a_in_4_1_V_V_empty_n fifo_status 0 1 }  { a_in_4_1_V_V_read fifo_update 1 1 } } }
	b_in_1_1_V_V { ap_fifo {  { b_in_1_1_V_V_dout fifo_data 0 256 }  { b_in_1_1_V_V_empty_n fifo_status 0 1 }  { b_in_1_1_V_V_read fifo_update 1 1 } } }
	b_in_2_1_V_V { ap_fifo {  { b_in_2_1_V_V_dout fifo_data 0 256 }  { b_in_2_1_V_V_empty_n fifo_status 0 1 }  { b_in_2_1_V_V_read fifo_update 1 1 } } }
	b_out_1_2_V_V { ap_fifo {  { b_out_1_2_V_V_din fifo_data 1 256 }  { b_out_1_2_V_V_full_n fifo_status 0 1 }  { b_out_1_2_V_V_write fifo_update 1 1 } } }
	b_out_2_2_V_V { ap_fifo {  { b_out_2_2_V_V_din fifo_data 1 256 }  { b_out_2_2_V_V_full_n fifo_status 0 1 }  { b_out_2_2_V_V_write fifo_update 1 1 } } }
	c_in_1_1_V_V { ap_fifo {  { c_in_1_1_V_V_dout fifo_data 0 32 }  { c_in_1_1_V_V_empty_n fifo_status 0 1 }  { c_in_1_1_V_V_read fifo_update 1 1 } } }
	c_in_2_1_V_V { ap_fifo {  { c_in_2_1_V_V_dout fifo_data 0 32 }  { c_in_2_1_V_V_empty_n fifo_status 0 1 }  { c_in_2_1_V_V_read fifo_update 1 1 } } }
	c_out_1_2_V_V { ap_fifo {  { c_out_1_2_V_V_din fifo_data 1 32 }  { c_out_1_2_V_V_full_n fifo_status 0 1 }  { c_out_1_2_V_V_write fifo_update 1 1 } } }
	c_out_2_2_V_V { ap_fifo {  { c_out_2_2_V_V_din fifo_data 1 32 }  { c_out_2_2_V_V_full_n fifo_status 0 1 }  { c_out_2_2_V_V_write fifo_update 1 1 } } }
}
