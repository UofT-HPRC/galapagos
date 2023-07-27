set moduleName TILE125
set isTopModule 0
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isFreeRunPipelineModule 0
set isPipelined 1
set pipeline_type dataflow
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {TILE125}
set C_modelType { void 0 }
set C_modelArgList {
	{ N_in_V_V2 int 32 regular {fifo 0 volatile }  }
	{ b_in_1_V_V int 256 regular {fifo 0 volatile }  }
	{ b_in_2_V_V int 256 regular {fifo 0 volatile }  }
	{ c_out_1_V_V int 32 regular {fifo 1 volatile }  }
	{ c_out_2_V_V7 int 32 regular {fifo 1 volatile }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "N_in_V_V2", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "b_in_1_V_V", "interface" : "fifo", "bitwidth" : 256, "direction" : "READONLY"} , 
 	{ "Name" : "b_in_2_V_V", "interface" : "fifo", "bitwidth" : 256, "direction" : "READONLY"} , 
 	{ "Name" : "c_out_1_V_V", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "c_out_2_V_V7", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 22
set portList { 
	{ N_in_V_V2_dout sc_in sc_lv 32 signal 0 } 
	{ N_in_V_V2_empty_n sc_in sc_logic 1 signal 0 } 
	{ N_in_V_V2_read sc_out sc_logic 1 signal 0 } 
	{ b_in_1_V_V_dout sc_in sc_lv 256 signal 1 } 
	{ b_in_1_V_V_empty_n sc_in sc_logic 1 signal 1 } 
	{ b_in_1_V_V_read sc_out sc_logic 1 signal 1 } 
	{ b_in_2_V_V_dout sc_in sc_lv 256 signal 2 } 
	{ b_in_2_V_V_empty_n sc_in sc_logic 1 signal 2 } 
	{ b_in_2_V_V_read sc_out sc_logic 1 signal 2 } 
	{ c_out_1_V_V_din sc_out sc_lv 32 signal 3 } 
	{ c_out_1_V_V_full_n sc_in sc_logic 1 signal 3 } 
	{ c_out_1_V_V_write sc_out sc_logic 1 signal 3 } 
	{ c_out_2_V_V7_din sc_out sc_lv 32 signal 4 } 
	{ c_out_2_V_V7_full_n sc_in sc_logic 1 signal 4 } 
	{ c_out_2_V_V7_write sc_out sc_logic 1 signal 4 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
}
set NewPortList {[ 
	{ "name": "N_in_V_V2_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "N_in_V_V2", "role": "dout" }} , 
 	{ "name": "N_in_V_V2_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "N_in_V_V2", "role": "empty_n" }} , 
 	{ "name": "N_in_V_V2_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "N_in_V_V2", "role": "read" }} , 
 	{ "name": "b_in_1_V_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "b_in_1_V_V", "role": "dout" }} , 
 	{ "name": "b_in_1_V_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b_in_1_V_V", "role": "empty_n" }} , 
 	{ "name": "b_in_1_V_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b_in_1_V_V", "role": "read" }} , 
 	{ "name": "b_in_2_V_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":256, "type": "signal", "bundle":{"name": "b_in_2_V_V", "role": "dout" }} , 
 	{ "name": "b_in_2_V_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b_in_2_V_V", "role": "empty_n" }} , 
 	{ "name": "b_in_2_V_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "b_in_2_V_V", "role": "read" }} , 
 	{ "name": "c_out_1_V_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "c_out_1_V_V", "role": "din" }} , 
 	{ "name": "c_out_1_V_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "c_out_1_V_V", "role": "full_n" }} , 
 	{ "name": "c_out_1_V_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "c_out_1_V_V", "role": "write" }} , 
 	{ "name": "c_out_2_V_V7_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "c_out_2_V_V7", "role": "din" }} , 
 	{ "name": "c_out_2_V_V7_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "c_out_2_V_V7", "role": "full_n" }} , 
 	{ "name": "c_out_2_V_V7_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "c_out_2_V_V7", "role": "write" }} , 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "35", "100", "133", "198", "231", "296", "329", "394", "427", "492", "525", "590", "591", "592", "593", "594", "595", "596", "597", "598", "599", "600", "601", "602", "603", "604", "605", "606", "607", "608", "609", "610", "611", "612", "613", "614", "615", "616", "617", "618", "619", "620", "621", "622", "623", "624", "625", "626", "627", "628", "629", "630", "631", "632", "633", "634", "635", "636", "637", "638", "639", "640", "641", "642", "643", "644", "645", "646", "647", "648", "649", "650", "651", "652", "653", "654", "655", "656"],
		"CDFG" : "TILE125",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "786", "EstimateLatencyMax" : "3145746",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"InputProcess" : [
			{"ID" : "1", "Name" : "ReadN127_U0", "ReadyCount" : "ReadN127_U0_ap_ready_count"},
			{"ID" : "35", "Name" : "PE114129_U0", "ReadyCount" : "PE114129_U0_ap_ready_count"}],
		"OutputProcess" : [
			{"ID" : "525", "Name" : "PE_4_U0"}],
		"Port" : [
			{"Name" : "N_in_V_V2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "ReadN127_U0", "Port" : "N_in_V_V2"}]},
			{"Name" : "b_in_1_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"SubConnect" : [
					{"ID" : "35", "SubInstance" : "PE114129_U0", "Port" : "b_in_1_V_V"}]},
			{"Name" : "b_in_2_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"SubConnect" : [
					{"ID" : "35", "SubInstance" : "PE114129_U0", "Port" : "b_in_2_V_V"}]},
			{"Name" : "c_out_1_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"SubConnect" : [
					{"ID" : "525", "SubInstance" : "PE_4_U0", "Port" : "c_out_1_V_V"}]},
			{"Name" : "c_out_2_V_V7", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"SubConnect" : [
					{"ID" : "525", "SubInstance" : "PE_4_U0", "Port" : "c_out_2_V_V2"}]},
			{"Name" : "weights_0_0_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "ReadA113128_U0", "Port" : "weights_0_0_0"}]},
			{"Name" : "weights_0_0_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "ReadA113128_U0", "Port" : "weights_0_0_1"}]},
			{"Name" : "weights_0_0_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "ReadA113128_U0", "Port" : "weights_0_0_2"}]},
			{"Name" : "weights_0_0_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "ReadA113128_U0", "Port" : "weights_0_0_3"}]},
			{"Name" : "weights_0_0_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "ReadA113128_U0", "Port" : "weights_0_0_4"}]},
			{"Name" : "weights_0_0_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "ReadA113128_U0", "Port" : "weights_0_0_5"}]},
			{"Name" : "weights_0_0_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "ReadA113128_U0", "Port" : "weights_0_0_6"}]},
			{"Name" : "weights_0_0_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "ReadA113128_U0", "Port" : "weights_0_0_7"}]},
			{"Name" : "weights_0_0_8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "ReadA113128_U0", "Port" : "weights_0_0_8"}]},
			{"Name" : "weights_0_0_9", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "ReadA113128_U0", "Port" : "weights_0_0_9"}]},
			{"Name" : "weights_0_0_10", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "ReadA113128_U0", "Port" : "weights_0_0_10"}]},
			{"Name" : "weights_0_0_11", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "ReadA113128_U0", "Port" : "weights_0_0_11"}]},
			{"Name" : "weights_0_0_12", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "ReadA113128_U0", "Port" : "weights_0_0_12"}]},
			{"Name" : "weights_0_0_13", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "ReadA113128_U0", "Port" : "weights_0_0_13"}]},
			{"Name" : "weights_0_0_14", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "ReadA113128_U0", "Port" : "weights_0_0_14"}]},
			{"Name" : "weights_0_0_15", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "ReadA113128_U0", "Port" : "weights_0_0_15"}]},
			{"Name" : "weights_0_0_16", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "ReadA113128_U0", "Port" : "weights_0_0_16"}]},
			{"Name" : "weights_0_0_17", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "ReadA113128_U0", "Port" : "weights_0_0_17"}]},
			{"Name" : "weights_0_0_18", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "ReadA113128_U0", "Port" : "weights_0_0_18"}]},
			{"Name" : "weights_0_0_19", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "ReadA113128_U0", "Port" : "weights_0_0_19"}]},
			{"Name" : "weights_0_0_20", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "ReadA113128_U0", "Port" : "weights_0_0_20"}]},
			{"Name" : "weights_0_0_21", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "ReadA113128_U0", "Port" : "weights_0_0_21"}]},
			{"Name" : "weights_0_0_22", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "ReadA113128_U0", "Port" : "weights_0_0_22"}]},
			{"Name" : "weights_0_0_23", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "ReadA113128_U0", "Port" : "weights_0_0_23"}]},
			{"Name" : "weights_0_0_24", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "ReadA113128_U0", "Port" : "weights_0_0_24"}]},
			{"Name" : "weights_0_0_25", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "ReadA113128_U0", "Port" : "weights_0_0_25"}]},
			{"Name" : "weights_0_0_26", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "ReadA113128_U0", "Port" : "weights_0_0_26"}]},
			{"Name" : "weights_0_0_27", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "ReadA113128_U0", "Port" : "weights_0_0_27"}]},
			{"Name" : "weights_0_0_28", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "ReadA113128_U0", "Port" : "weights_0_0_28"}]},
			{"Name" : "weights_0_0_29", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "ReadA113128_U0", "Port" : "weights_0_0_29"}]},
			{"Name" : "weights_0_0_30", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "ReadA113128_U0", "Port" : "weights_0_0_30"}]},
			{"Name" : "weights_0_0_31", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "ReadA113128_U0", "Port" : "weights_0_0_31"}]},
			{"Name" : "weights_0_1_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "100", "SubInstance" : "ReadA115130_U0", "Port" : "weights_0_1_0"}]},
			{"Name" : "weights_0_1_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "100", "SubInstance" : "ReadA115130_U0", "Port" : "weights_0_1_1"}]},
			{"Name" : "weights_0_1_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "100", "SubInstance" : "ReadA115130_U0", "Port" : "weights_0_1_2"}]},
			{"Name" : "weights_0_1_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "100", "SubInstance" : "ReadA115130_U0", "Port" : "weights_0_1_3"}]},
			{"Name" : "weights_0_1_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "100", "SubInstance" : "ReadA115130_U0", "Port" : "weights_0_1_4"}]},
			{"Name" : "weights_0_1_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "100", "SubInstance" : "ReadA115130_U0", "Port" : "weights_0_1_5"}]},
			{"Name" : "weights_0_1_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "100", "SubInstance" : "ReadA115130_U0", "Port" : "weights_0_1_6"}]},
			{"Name" : "weights_0_1_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "100", "SubInstance" : "ReadA115130_U0", "Port" : "weights_0_1_7"}]},
			{"Name" : "weights_0_1_8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "100", "SubInstance" : "ReadA115130_U0", "Port" : "weights_0_1_8"}]},
			{"Name" : "weights_0_1_9", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "100", "SubInstance" : "ReadA115130_U0", "Port" : "weights_0_1_9"}]},
			{"Name" : "weights_0_1_10", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "100", "SubInstance" : "ReadA115130_U0", "Port" : "weights_0_1_10"}]},
			{"Name" : "weights_0_1_11", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "100", "SubInstance" : "ReadA115130_U0", "Port" : "weights_0_1_11"}]},
			{"Name" : "weights_0_1_12", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "100", "SubInstance" : "ReadA115130_U0", "Port" : "weights_0_1_12"}]},
			{"Name" : "weights_0_1_13", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "100", "SubInstance" : "ReadA115130_U0", "Port" : "weights_0_1_13"}]},
			{"Name" : "weights_0_1_14", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "100", "SubInstance" : "ReadA115130_U0", "Port" : "weights_0_1_14"}]},
			{"Name" : "weights_0_1_15", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "100", "SubInstance" : "ReadA115130_U0", "Port" : "weights_0_1_15"}]},
			{"Name" : "weights_0_1_16", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "100", "SubInstance" : "ReadA115130_U0", "Port" : "weights_0_1_16"}]},
			{"Name" : "weights_0_1_17", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "100", "SubInstance" : "ReadA115130_U0", "Port" : "weights_0_1_17"}]},
			{"Name" : "weights_0_1_18", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "100", "SubInstance" : "ReadA115130_U0", "Port" : "weights_0_1_18"}]},
			{"Name" : "weights_0_1_19", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "100", "SubInstance" : "ReadA115130_U0", "Port" : "weights_0_1_19"}]},
			{"Name" : "weights_0_1_20", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "100", "SubInstance" : "ReadA115130_U0", "Port" : "weights_0_1_20"}]},
			{"Name" : "weights_0_1_21", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "100", "SubInstance" : "ReadA115130_U0", "Port" : "weights_0_1_21"}]},
			{"Name" : "weights_0_1_22", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "100", "SubInstance" : "ReadA115130_U0", "Port" : "weights_0_1_22"}]},
			{"Name" : "weights_0_1_23", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "100", "SubInstance" : "ReadA115130_U0", "Port" : "weights_0_1_23"}]},
			{"Name" : "weights_0_1_24", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "100", "SubInstance" : "ReadA115130_U0", "Port" : "weights_0_1_24"}]},
			{"Name" : "weights_0_1_25", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "100", "SubInstance" : "ReadA115130_U0", "Port" : "weights_0_1_25"}]},
			{"Name" : "weights_0_1_26", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "100", "SubInstance" : "ReadA115130_U0", "Port" : "weights_0_1_26"}]},
			{"Name" : "weights_0_1_27", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "100", "SubInstance" : "ReadA115130_U0", "Port" : "weights_0_1_27"}]},
			{"Name" : "weights_0_1_28", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "100", "SubInstance" : "ReadA115130_U0", "Port" : "weights_0_1_28"}]},
			{"Name" : "weights_0_1_29", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "100", "SubInstance" : "ReadA115130_U0", "Port" : "weights_0_1_29"}]},
			{"Name" : "weights_0_1_30", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "100", "SubInstance" : "ReadA115130_U0", "Port" : "weights_0_1_30"}]},
			{"Name" : "weights_0_1_31", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "100", "SubInstance" : "ReadA115130_U0", "Port" : "weights_0_1_31"}]},
			{"Name" : "weights_0_2_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "198", "SubInstance" : "ReadA117132_U0", "Port" : "weights_0_2_0"}]},
			{"Name" : "weights_0_2_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "198", "SubInstance" : "ReadA117132_U0", "Port" : "weights_0_2_1"}]},
			{"Name" : "weights_0_2_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "198", "SubInstance" : "ReadA117132_U0", "Port" : "weights_0_2_2"}]},
			{"Name" : "weights_0_2_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "198", "SubInstance" : "ReadA117132_U0", "Port" : "weights_0_2_3"}]},
			{"Name" : "weights_0_2_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "198", "SubInstance" : "ReadA117132_U0", "Port" : "weights_0_2_4"}]},
			{"Name" : "weights_0_2_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "198", "SubInstance" : "ReadA117132_U0", "Port" : "weights_0_2_5"}]},
			{"Name" : "weights_0_2_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "198", "SubInstance" : "ReadA117132_U0", "Port" : "weights_0_2_6"}]},
			{"Name" : "weights_0_2_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "198", "SubInstance" : "ReadA117132_U0", "Port" : "weights_0_2_7"}]},
			{"Name" : "weights_0_2_8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "198", "SubInstance" : "ReadA117132_U0", "Port" : "weights_0_2_8"}]},
			{"Name" : "weights_0_2_9", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "198", "SubInstance" : "ReadA117132_U0", "Port" : "weights_0_2_9"}]},
			{"Name" : "weights_0_2_10", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "198", "SubInstance" : "ReadA117132_U0", "Port" : "weights_0_2_10"}]},
			{"Name" : "weights_0_2_11", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "198", "SubInstance" : "ReadA117132_U0", "Port" : "weights_0_2_11"}]},
			{"Name" : "weights_0_2_12", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "198", "SubInstance" : "ReadA117132_U0", "Port" : "weights_0_2_12"}]},
			{"Name" : "weights_0_2_13", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "198", "SubInstance" : "ReadA117132_U0", "Port" : "weights_0_2_13"}]},
			{"Name" : "weights_0_2_14", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "198", "SubInstance" : "ReadA117132_U0", "Port" : "weights_0_2_14"}]},
			{"Name" : "weights_0_2_15", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "198", "SubInstance" : "ReadA117132_U0", "Port" : "weights_0_2_15"}]},
			{"Name" : "weights_0_2_16", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "198", "SubInstance" : "ReadA117132_U0", "Port" : "weights_0_2_16"}]},
			{"Name" : "weights_0_2_17", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "198", "SubInstance" : "ReadA117132_U0", "Port" : "weights_0_2_17"}]},
			{"Name" : "weights_0_2_18", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "198", "SubInstance" : "ReadA117132_U0", "Port" : "weights_0_2_18"}]},
			{"Name" : "weights_0_2_19", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "198", "SubInstance" : "ReadA117132_U0", "Port" : "weights_0_2_19"}]},
			{"Name" : "weights_0_2_20", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "198", "SubInstance" : "ReadA117132_U0", "Port" : "weights_0_2_20"}]},
			{"Name" : "weights_0_2_21", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "198", "SubInstance" : "ReadA117132_U0", "Port" : "weights_0_2_21"}]},
			{"Name" : "weights_0_2_22", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "198", "SubInstance" : "ReadA117132_U0", "Port" : "weights_0_2_22"}]},
			{"Name" : "weights_0_2_23", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "198", "SubInstance" : "ReadA117132_U0", "Port" : "weights_0_2_23"}]},
			{"Name" : "weights_0_2_24", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "198", "SubInstance" : "ReadA117132_U0", "Port" : "weights_0_2_24"}]},
			{"Name" : "weights_0_2_25", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "198", "SubInstance" : "ReadA117132_U0", "Port" : "weights_0_2_25"}]},
			{"Name" : "weights_0_2_26", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "198", "SubInstance" : "ReadA117132_U0", "Port" : "weights_0_2_26"}]},
			{"Name" : "weights_0_2_27", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "198", "SubInstance" : "ReadA117132_U0", "Port" : "weights_0_2_27"}]},
			{"Name" : "weights_0_2_28", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "198", "SubInstance" : "ReadA117132_U0", "Port" : "weights_0_2_28"}]},
			{"Name" : "weights_0_2_29", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "198", "SubInstance" : "ReadA117132_U0", "Port" : "weights_0_2_29"}]},
			{"Name" : "weights_0_2_30", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "198", "SubInstance" : "ReadA117132_U0", "Port" : "weights_0_2_30"}]},
			{"Name" : "weights_0_2_31", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "198", "SubInstance" : "ReadA117132_U0", "Port" : "weights_0_2_31"}]},
			{"Name" : "weights_0_3_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "296", "SubInstance" : "ReadA119134_U0", "Port" : "weights_0_3_0"}]},
			{"Name" : "weights_0_3_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "296", "SubInstance" : "ReadA119134_U0", "Port" : "weights_0_3_1"}]},
			{"Name" : "weights_0_3_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "296", "SubInstance" : "ReadA119134_U0", "Port" : "weights_0_3_2"}]},
			{"Name" : "weights_0_3_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "296", "SubInstance" : "ReadA119134_U0", "Port" : "weights_0_3_3"}]},
			{"Name" : "weights_0_3_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "296", "SubInstance" : "ReadA119134_U0", "Port" : "weights_0_3_4"}]},
			{"Name" : "weights_0_3_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "296", "SubInstance" : "ReadA119134_U0", "Port" : "weights_0_3_5"}]},
			{"Name" : "weights_0_3_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "296", "SubInstance" : "ReadA119134_U0", "Port" : "weights_0_3_6"}]},
			{"Name" : "weights_0_3_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "296", "SubInstance" : "ReadA119134_U0", "Port" : "weights_0_3_7"}]},
			{"Name" : "weights_0_3_8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "296", "SubInstance" : "ReadA119134_U0", "Port" : "weights_0_3_8"}]},
			{"Name" : "weights_0_3_9", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "296", "SubInstance" : "ReadA119134_U0", "Port" : "weights_0_3_9"}]},
			{"Name" : "weights_0_3_10", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "296", "SubInstance" : "ReadA119134_U0", "Port" : "weights_0_3_10"}]},
			{"Name" : "weights_0_3_11", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "296", "SubInstance" : "ReadA119134_U0", "Port" : "weights_0_3_11"}]},
			{"Name" : "weights_0_3_12", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "296", "SubInstance" : "ReadA119134_U0", "Port" : "weights_0_3_12"}]},
			{"Name" : "weights_0_3_13", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "296", "SubInstance" : "ReadA119134_U0", "Port" : "weights_0_3_13"}]},
			{"Name" : "weights_0_3_14", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "296", "SubInstance" : "ReadA119134_U0", "Port" : "weights_0_3_14"}]},
			{"Name" : "weights_0_3_15", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "296", "SubInstance" : "ReadA119134_U0", "Port" : "weights_0_3_15"}]},
			{"Name" : "weights_0_3_16", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "296", "SubInstance" : "ReadA119134_U0", "Port" : "weights_0_3_16"}]},
			{"Name" : "weights_0_3_17", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "296", "SubInstance" : "ReadA119134_U0", "Port" : "weights_0_3_17"}]},
			{"Name" : "weights_0_3_18", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "296", "SubInstance" : "ReadA119134_U0", "Port" : "weights_0_3_18"}]},
			{"Name" : "weights_0_3_19", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "296", "SubInstance" : "ReadA119134_U0", "Port" : "weights_0_3_19"}]},
			{"Name" : "weights_0_3_20", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "296", "SubInstance" : "ReadA119134_U0", "Port" : "weights_0_3_20"}]},
			{"Name" : "weights_0_3_21", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "296", "SubInstance" : "ReadA119134_U0", "Port" : "weights_0_3_21"}]},
			{"Name" : "weights_0_3_22", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "296", "SubInstance" : "ReadA119134_U0", "Port" : "weights_0_3_22"}]},
			{"Name" : "weights_0_3_23", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "296", "SubInstance" : "ReadA119134_U0", "Port" : "weights_0_3_23"}]},
			{"Name" : "weights_0_3_24", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "296", "SubInstance" : "ReadA119134_U0", "Port" : "weights_0_3_24"}]},
			{"Name" : "weights_0_3_25", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "296", "SubInstance" : "ReadA119134_U0", "Port" : "weights_0_3_25"}]},
			{"Name" : "weights_0_3_26", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "296", "SubInstance" : "ReadA119134_U0", "Port" : "weights_0_3_26"}]},
			{"Name" : "weights_0_3_27", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "296", "SubInstance" : "ReadA119134_U0", "Port" : "weights_0_3_27"}]},
			{"Name" : "weights_0_3_28", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "296", "SubInstance" : "ReadA119134_U0", "Port" : "weights_0_3_28"}]},
			{"Name" : "weights_0_3_29", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "296", "SubInstance" : "ReadA119134_U0", "Port" : "weights_0_3_29"}]},
			{"Name" : "weights_0_3_30", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "296", "SubInstance" : "ReadA119134_U0", "Port" : "weights_0_3_30"}]},
			{"Name" : "weights_0_3_31", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "296", "SubInstance" : "ReadA119134_U0", "Port" : "weights_0_3_31"}]},
			{"Name" : "weights_0_4_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "394", "SubInstance" : "ReadA121136_U0", "Port" : "weights_0_4_0"}]},
			{"Name" : "weights_0_4_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "394", "SubInstance" : "ReadA121136_U0", "Port" : "weights_0_4_1"}]},
			{"Name" : "weights_0_4_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "394", "SubInstance" : "ReadA121136_U0", "Port" : "weights_0_4_2"}]},
			{"Name" : "weights_0_4_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "394", "SubInstance" : "ReadA121136_U0", "Port" : "weights_0_4_3"}]},
			{"Name" : "weights_0_4_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "394", "SubInstance" : "ReadA121136_U0", "Port" : "weights_0_4_4"}]},
			{"Name" : "weights_0_4_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "394", "SubInstance" : "ReadA121136_U0", "Port" : "weights_0_4_5"}]},
			{"Name" : "weights_0_4_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "394", "SubInstance" : "ReadA121136_U0", "Port" : "weights_0_4_6"}]},
			{"Name" : "weights_0_4_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "394", "SubInstance" : "ReadA121136_U0", "Port" : "weights_0_4_7"}]},
			{"Name" : "weights_0_4_8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "394", "SubInstance" : "ReadA121136_U0", "Port" : "weights_0_4_8"}]},
			{"Name" : "weights_0_4_9", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "394", "SubInstance" : "ReadA121136_U0", "Port" : "weights_0_4_9"}]},
			{"Name" : "weights_0_4_10", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "394", "SubInstance" : "ReadA121136_U0", "Port" : "weights_0_4_10"}]},
			{"Name" : "weights_0_4_11", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "394", "SubInstance" : "ReadA121136_U0", "Port" : "weights_0_4_11"}]},
			{"Name" : "weights_0_4_12", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "394", "SubInstance" : "ReadA121136_U0", "Port" : "weights_0_4_12"}]},
			{"Name" : "weights_0_4_13", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "394", "SubInstance" : "ReadA121136_U0", "Port" : "weights_0_4_13"}]},
			{"Name" : "weights_0_4_14", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "394", "SubInstance" : "ReadA121136_U0", "Port" : "weights_0_4_14"}]},
			{"Name" : "weights_0_4_15", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "394", "SubInstance" : "ReadA121136_U0", "Port" : "weights_0_4_15"}]},
			{"Name" : "weights_0_4_16", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "394", "SubInstance" : "ReadA121136_U0", "Port" : "weights_0_4_16"}]},
			{"Name" : "weights_0_4_17", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "394", "SubInstance" : "ReadA121136_U0", "Port" : "weights_0_4_17"}]},
			{"Name" : "weights_0_4_18", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "394", "SubInstance" : "ReadA121136_U0", "Port" : "weights_0_4_18"}]},
			{"Name" : "weights_0_4_19", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "394", "SubInstance" : "ReadA121136_U0", "Port" : "weights_0_4_19"}]},
			{"Name" : "weights_0_4_20", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "394", "SubInstance" : "ReadA121136_U0", "Port" : "weights_0_4_20"}]},
			{"Name" : "weights_0_4_21", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "394", "SubInstance" : "ReadA121136_U0", "Port" : "weights_0_4_21"}]},
			{"Name" : "weights_0_4_22", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "394", "SubInstance" : "ReadA121136_U0", "Port" : "weights_0_4_22"}]},
			{"Name" : "weights_0_4_23", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "394", "SubInstance" : "ReadA121136_U0", "Port" : "weights_0_4_23"}]},
			{"Name" : "weights_0_4_24", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "394", "SubInstance" : "ReadA121136_U0", "Port" : "weights_0_4_24"}]},
			{"Name" : "weights_0_4_25", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "394", "SubInstance" : "ReadA121136_U0", "Port" : "weights_0_4_25"}]},
			{"Name" : "weights_0_4_26", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "394", "SubInstance" : "ReadA121136_U0", "Port" : "weights_0_4_26"}]},
			{"Name" : "weights_0_4_27", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "394", "SubInstance" : "ReadA121136_U0", "Port" : "weights_0_4_27"}]},
			{"Name" : "weights_0_4_28", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "394", "SubInstance" : "ReadA121136_U0", "Port" : "weights_0_4_28"}]},
			{"Name" : "weights_0_4_29", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "394", "SubInstance" : "ReadA121136_U0", "Port" : "weights_0_4_29"}]},
			{"Name" : "weights_0_4_30", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "394", "SubInstance" : "ReadA121136_U0", "Port" : "weights_0_4_30"}]},
			{"Name" : "weights_0_4_31", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "394", "SubInstance" : "ReadA121136_U0", "Port" : "weights_0_4_31"}]},
			{"Name" : "weights_0_5_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "492", "SubInstance" : "ReadA123138_U0", "Port" : "weights_0_5_0"}]},
			{"Name" : "weights_0_5_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "492", "SubInstance" : "ReadA123138_U0", "Port" : "weights_0_5_1"}]},
			{"Name" : "weights_0_5_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "492", "SubInstance" : "ReadA123138_U0", "Port" : "weights_0_5_2"}]},
			{"Name" : "weights_0_5_3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "492", "SubInstance" : "ReadA123138_U0", "Port" : "weights_0_5_3"}]},
			{"Name" : "weights_0_5_4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "492", "SubInstance" : "ReadA123138_U0", "Port" : "weights_0_5_4"}]},
			{"Name" : "weights_0_5_5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "492", "SubInstance" : "ReadA123138_U0", "Port" : "weights_0_5_5"}]},
			{"Name" : "weights_0_5_6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "492", "SubInstance" : "ReadA123138_U0", "Port" : "weights_0_5_6"}]},
			{"Name" : "weights_0_5_7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "492", "SubInstance" : "ReadA123138_U0", "Port" : "weights_0_5_7"}]},
			{"Name" : "weights_0_5_8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "492", "SubInstance" : "ReadA123138_U0", "Port" : "weights_0_5_8"}]},
			{"Name" : "weights_0_5_9", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "492", "SubInstance" : "ReadA123138_U0", "Port" : "weights_0_5_9"}]},
			{"Name" : "weights_0_5_10", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "492", "SubInstance" : "ReadA123138_U0", "Port" : "weights_0_5_10"}]},
			{"Name" : "weights_0_5_11", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "492", "SubInstance" : "ReadA123138_U0", "Port" : "weights_0_5_11"}]},
			{"Name" : "weights_0_5_12", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "492", "SubInstance" : "ReadA123138_U0", "Port" : "weights_0_5_12"}]},
			{"Name" : "weights_0_5_13", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "492", "SubInstance" : "ReadA123138_U0", "Port" : "weights_0_5_13"}]},
			{"Name" : "weights_0_5_14", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "492", "SubInstance" : "ReadA123138_U0", "Port" : "weights_0_5_14"}]},
			{"Name" : "weights_0_5_15", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "492", "SubInstance" : "ReadA123138_U0", "Port" : "weights_0_5_15"}]},
			{"Name" : "weights_0_5_16", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "492", "SubInstance" : "ReadA123138_U0", "Port" : "weights_0_5_16"}]},
			{"Name" : "weights_0_5_17", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "492", "SubInstance" : "ReadA123138_U0", "Port" : "weights_0_5_17"}]},
			{"Name" : "weights_0_5_18", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "492", "SubInstance" : "ReadA123138_U0", "Port" : "weights_0_5_18"}]},
			{"Name" : "weights_0_5_19", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "492", "SubInstance" : "ReadA123138_U0", "Port" : "weights_0_5_19"}]},
			{"Name" : "weights_0_5_20", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "492", "SubInstance" : "ReadA123138_U0", "Port" : "weights_0_5_20"}]},
			{"Name" : "weights_0_5_21", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "492", "SubInstance" : "ReadA123138_U0", "Port" : "weights_0_5_21"}]},
			{"Name" : "weights_0_5_22", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "492", "SubInstance" : "ReadA123138_U0", "Port" : "weights_0_5_22"}]},
			{"Name" : "weights_0_5_23", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "492", "SubInstance" : "ReadA123138_U0", "Port" : "weights_0_5_23"}]},
			{"Name" : "weights_0_5_24", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "492", "SubInstance" : "ReadA123138_U0", "Port" : "weights_0_5_24"}]},
			{"Name" : "weights_0_5_25", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "492", "SubInstance" : "ReadA123138_U0", "Port" : "weights_0_5_25"}]},
			{"Name" : "weights_0_5_26", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "492", "SubInstance" : "ReadA123138_U0", "Port" : "weights_0_5_26"}]},
			{"Name" : "weights_0_5_27", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "492", "SubInstance" : "ReadA123138_U0", "Port" : "weights_0_5_27"}]},
			{"Name" : "weights_0_5_28", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "492", "SubInstance" : "ReadA123138_U0", "Port" : "weights_0_5_28"}]},
			{"Name" : "weights_0_5_29", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "492", "SubInstance" : "ReadA123138_U0", "Port" : "weights_0_5_29"}]},
			{"Name" : "weights_0_5_30", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "492", "SubInstance" : "ReadA123138_U0", "Port" : "weights_0_5_30"}]},
			{"Name" : "weights_0_5_31", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "492", "SubInstance" : "ReadA123138_U0", "Port" : "weights_0_5_31"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ReadN127_U0", "Parent" : "0",
		"CDFG" : "ReadN127",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "N_in_V_V2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "N_in_V_V2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "N_pipe_1_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "35", "DependentChan" : "590",
				"BlockSignal" : [
					{"Name" : "N_pipe_1_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "N_pipe_2_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "2", "DependentChan" : "591",
				"BlockSignal" : [
					{"Name" : "N_pipe_2_V_V_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ReadA113128_U0", "Parent" : "0", "Child" : ["3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34"],
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
		"StartSource" : "1",
		"StartFifo" : "start_for_ReadA113128_U0_U",
		"Port" : [
			{"Name" : "N_pipe_in_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "1", "DependentChan" : "591",
				"BlockSignal" : [
					{"Name" : "N_pipe_in_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "N_pipe_out_V_V7", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "100", "DependentChan" : "592",
				"BlockSignal" : [
					{"Name" : "N_pipe_out_V_V7_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_pipes_1_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "35", "DependentChan" : "593",
				"BlockSignal" : [
					{"Name" : "a_pipes_1_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_pipes_2_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "35", "DependentChan" : "594",
				"BlockSignal" : [
					{"Name" : "a_pipes_2_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_pipes_3_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "35", "DependentChan" : "595",
				"BlockSignal" : [
					{"Name" : "a_pipes_3_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_pipes_4_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "35", "DependentChan" : "596",
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
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA113128_U0.weights_0_0_0_U", "Parent" : "2"},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA113128_U0.weights_0_0_1_U", "Parent" : "2"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA113128_U0.weights_0_0_2_U", "Parent" : "2"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA113128_U0.weights_0_0_3_U", "Parent" : "2"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA113128_U0.weights_0_0_4_U", "Parent" : "2"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA113128_U0.weights_0_0_5_U", "Parent" : "2"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA113128_U0.weights_0_0_6_U", "Parent" : "2"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA113128_U0.weights_0_0_7_U", "Parent" : "2"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA113128_U0.weights_0_0_8_U", "Parent" : "2"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA113128_U0.weights_0_0_9_U", "Parent" : "2"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA113128_U0.weights_0_0_10_U", "Parent" : "2"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA113128_U0.weights_0_0_11_U", "Parent" : "2"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA113128_U0.weights_0_0_12_U", "Parent" : "2"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA113128_U0.weights_0_0_13_U", "Parent" : "2"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA113128_U0.weights_0_0_14_U", "Parent" : "2"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA113128_U0.weights_0_0_15_U", "Parent" : "2"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA113128_U0.weights_0_0_16_U", "Parent" : "2"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA113128_U0.weights_0_0_17_U", "Parent" : "2"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA113128_U0.weights_0_0_18_U", "Parent" : "2"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA113128_U0.weights_0_0_19_U", "Parent" : "2"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA113128_U0.weights_0_0_20_U", "Parent" : "2"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA113128_U0.weights_0_0_21_U", "Parent" : "2"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA113128_U0.weights_0_0_22_U", "Parent" : "2"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA113128_U0.weights_0_0_23_U", "Parent" : "2"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA113128_U0.weights_0_0_24_U", "Parent" : "2"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA113128_U0.weights_0_0_25_U", "Parent" : "2"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA113128_U0.weights_0_0_26_U", "Parent" : "2"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA113128_U0.weights_0_0_27_U", "Parent" : "2"},
	{"ID" : "31", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA113128_U0.weights_0_0_28_U", "Parent" : "2"},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA113128_U0.weights_0_0_29_U", "Parent" : "2"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA113128_U0.weights_0_0_30_U", "Parent" : "2"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA113128_U0.weights_0_0_31_U", "Parent" : "2"},
	{"ID" : "35", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.PE114129_U0", "Parent" : "0", "Child" : ["36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99"],
		"CDFG" : "PE114129",
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
			{"Name" : "N_pipe_in_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "1", "DependentChan" : "590",
				"BlockSignal" : [
					{"Name" : "N_pipe_in_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "N_pipe_out_V_V7", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "133", "DependentChan" : "597",
				"BlockSignal" : [
					{"Name" : "N_pipe_out_V_V7_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_in_1_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "2", "DependentChan" : "593",
				"BlockSignal" : [
					{"Name" : "a_in_1_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_in_2_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "2", "DependentChan" : "594",
				"BlockSignal" : [
					{"Name" : "a_in_2_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_in_3_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "2", "DependentChan" : "595",
				"BlockSignal" : [
					{"Name" : "a_in_3_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_in_4_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "2", "DependentChan" : "596",
				"BlockSignal" : [
					{"Name" : "a_in_4_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "b_in_1_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "b_in_1_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "b_in_2_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "b_in_2_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "b_out_1_V_V33", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "133", "DependentChan" : "598",
				"BlockSignal" : [
					{"Name" : "b_out_1_V_V33_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "b_out_2_V_V39", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "133", "DependentChan" : "599",
				"BlockSignal" : [
					{"Name" : "b_out_2_V_V39_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "c_out_1_V_V55", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "133", "DependentChan" : "600",
				"BlockSignal" : [
					{"Name" : "c_out_1_V_V55_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "c_out_2_V_V60", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "133", "DependentChan" : "601",
				"BlockSignal" : [
					{"Name" : "c_out_2_V_V60_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U52", "Parent" : "35"},
	{"ID" : "37", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U53", "Parent" : "35"},
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U54", "Parent" : "35"},
	{"ID" : "39", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U55", "Parent" : "35"},
	{"ID" : "40", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U56", "Parent" : "35"},
	{"ID" : "41", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U57", "Parent" : "35"},
	{"ID" : "42", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U58", "Parent" : "35"},
	{"ID" : "43", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U59", "Parent" : "35"},
	{"ID" : "44", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U60", "Parent" : "35"},
	{"ID" : "45", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U61", "Parent" : "35"},
	{"ID" : "46", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U62", "Parent" : "35"},
	{"ID" : "47", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U63", "Parent" : "35"},
	{"ID" : "48", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U64", "Parent" : "35"},
	{"ID" : "49", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U65", "Parent" : "35"},
	{"ID" : "50", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U66", "Parent" : "35"},
	{"ID" : "51", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U67", "Parent" : "35"},
	{"ID" : "52", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U68", "Parent" : "35"},
	{"ID" : "53", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U69", "Parent" : "35"},
	{"ID" : "54", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U70", "Parent" : "35"},
	{"ID" : "55", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U71", "Parent" : "35"},
	{"ID" : "56", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U72", "Parent" : "35"},
	{"ID" : "57", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U73", "Parent" : "35"},
	{"ID" : "58", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U74", "Parent" : "35"},
	{"ID" : "59", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U75", "Parent" : "35"},
	{"ID" : "60", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U76", "Parent" : "35"},
	{"ID" : "61", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U77", "Parent" : "35"},
	{"ID" : "62", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U78", "Parent" : "35"},
	{"ID" : "63", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U79", "Parent" : "35"},
	{"ID" : "64", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U80", "Parent" : "35"},
	{"ID" : "65", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U81", "Parent" : "35"},
	{"ID" : "66", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U82", "Parent" : "35"},
	{"ID" : "67", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U83", "Parent" : "35"},
	{"ID" : "68", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U84", "Parent" : "35"},
	{"ID" : "69", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U85", "Parent" : "35"},
	{"ID" : "70", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U86", "Parent" : "35"},
	{"ID" : "71", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U87", "Parent" : "35"},
	{"ID" : "72", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U88", "Parent" : "35"},
	{"ID" : "73", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U89", "Parent" : "35"},
	{"ID" : "74", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U90", "Parent" : "35"},
	{"ID" : "75", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U91", "Parent" : "35"},
	{"ID" : "76", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U92", "Parent" : "35"},
	{"ID" : "77", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U93", "Parent" : "35"},
	{"ID" : "78", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U94", "Parent" : "35"},
	{"ID" : "79", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U95", "Parent" : "35"},
	{"ID" : "80", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U96", "Parent" : "35"},
	{"ID" : "81", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U97", "Parent" : "35"},
	{"ID" : "82", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U98", "Parent" : "35"},
	{"ID" : "83", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U99", "Parent" : "35"},
	{"ID" : "84", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U100", "Parent" : "35"},
	{"ID" : "85", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U101", "Parent" : "35"},
	{"ID" : "86", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U102", "Parent" : "35"},
	{"ID" : "87", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U103", "Parent" : "35"},
	{"ID" : "88", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U104", "Parent" : "35"},
	{"ID" : "89", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U105", "Parent" : "35"},
	{"ID" : "90", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U106", "Parent" : "35"},
	{"ID" : "91", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U107", "Parent" : "35"},
	{"ID" : "92", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U108", "Parent" : "35"},
	{"ID" : "93", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U109", "Parent" : "35"},
	{"ID" : "94", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U110", "Parent" : "35"},
	{"ID" : "95", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U111", "Parent" : "35"},
	{"ID" : "96", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U112", "Parent" : "35"},
	{"ID" : "97", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U113", "Parent" : "35"},
	{"ID" : "98", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U114", "Parent" : "35"},
	{"ID" : "99", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE114129_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U115", "Parent" : "35"},
	{"ID" : "100", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ReadA115130_U0", "Parent" : "0", "Child" : ["101", "102", "103", "104", "105", "106", "107", "108", "109", "110", "111", "112", "113", "114", "115", "116", "117", "118", "119", "120", "121", "122", "123", "124", "125", "126", "127", "128", "129", "130", "131", "132"],
		"CDFG" : "ReadA115130",
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
		"StartSource" : "2",
		"StartFifo" : "start_for_ReadA115130_U0_U",
		"Port" : [
			{"Name" : "N_pipe_in_V_V1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "2", "DependentChan" : "592",
				"BlockSignal" : [
					{"Name" : "N_pipe_in_V_V1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "N_pipe_out_V_V8", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "198", "DependentChan" : "602",
				"BlockSignal" : [
					{"Name" : "N_pipe_out_V_V8_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_pipes_1_V_V13", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "133", "DependentChan" : "603",
				"BlockSignal" : [
					{"Name" : "a_pipes_1_V_V13_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_pipes_2_V_V18", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "133", "DependentChan" : "604",
				"BlockSignal" : [
					{"Name" : "a_pipes_2_V_V18_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_pipes_3_V_V23", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "133", "DependentChan" : "605",
				"BlockSignal" : [
					{"Name" : "a_pipes_3_V_V23_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_pipes_4_V_V28", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "133", "DependentChan" : "606",
				"BlockSignal" : [
					{"Name" : "a_pipes_4_V_V28_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "weights_0_1_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_1_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_1_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_1_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_1_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_1_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_1_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_1_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_1_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_1_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_1_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_1_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_1_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_1_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_1_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_1_15", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_1_16", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_1_17", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_1_18", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_1_19", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_1_20", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_1_21", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_1_22", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_1_23", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_1_24", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_1_25", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_1_26", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_1_27", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_1_28", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_1_29", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_1_30", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_1_31", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "101", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA115130_U0.weights_0_1_0_U", "Parent" : "100"},
	{"ID" : "102", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA115130_U0.weights_0_1_1_U", "Parent" : "100"},
	{"ID" : "103", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA115130_U0.weights_0_1_2_U", "Parent" : "100"},
	{"ID" : "104", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA115130_U0.weights_0_1_3_U", "Parent" : "100"},
	{"ID" : "105", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA115130_U0.weights_0_1_4_U", "Parent" : "100"},
	{"ID" : "106", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA115130_U0.weights_0_1_5_U", "Parent" : "100"},
	{"ID" : "107", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA115130_U0.weights_0_1_6_U", "Parent" : "100"},
	{"ID" : "108", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA115130_U0.weights_0_1_7_U", "Parent" : "100"},
	{"ID" : "109", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA115130_U0.weights_0_1_8_U", "Parent" : "100"},
	{"ID" : "110", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA115130_U0.weights_0_1_9_U", "Parent" : "100"},
	{"ID" : "111", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA115130_U0.weights_0_1_10_U", "Parent" : "100"},
	{"ID" : "112", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA115130_U0.weights_0_1_11_U", "Parent" : "100"},
	{"ID" : "113", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA115130_U0.weights_0_1_12_U", "Parent" : "100"},
	{"ID" : "114", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA115130_U0.weights_0_1_13_U", "Parent" : "100"},
	{"ID" : "115", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA115130_U0.weights_0_1_14_U", "Parent" : "100"},
	{"ID" : "116", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA115130_U0.weights_0_1_15_U", "Parent" : "100"},
	{"ID" : "117", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA115130_U0.weights_0_1_16_U", "Parent" : "100"},
	{"ID" : "118", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA115130_U0.weights_0_1_17_U", "Parent" : "100"},
	{"ID" : "119", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA115130_U0.weights_0_1_18_U", "Parent" : "100"},
	{"ID" : "120", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA115130_U0.weights_0_1_19_U", "Parent" : "100"},
	{"ID" : "121", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA115130_U0.weights_0_1_20_U", "Parent" : "100"},
	{"ID" : "122", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA115130_U0.weights_0_1_21_U", "Parent" : "100"},
	{"ID" : "123", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA115130_U0.weights_0_1_22_U", "Parent" : "100"},
	{"ID" : "124", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA115130_U0.weights_0_1_23_U", "Parent" : "100"},
	{"ID" : "125", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA115130_U0.weights_0_1_24_U", "Parent" : "100"},
	{"ID" : "126", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA115130_U0.weights_0_1_25_U", "Parent" : "100"},
	{"ID" : "127", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA115130_U0.weights_0_1_26_U", "Parent" : "100"},
	{"ID" : "128", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA115130_U0.weights_0_1_27_U", "Parent" : "100"},
	{"ID" : "129", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA115130_U0.weights_0_1_28_U", "Parent" : "100"},
	{"ID" : "130", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA115130_U0.weights_0_1_29_U", "Parent" : "100"},
	{"ID" : "131", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA115130_U0.weights_0_1_30_U", "Parent" : "100"},
	{"ID" : "132", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA115130_U0.weights_0_1_31_U", "Parent" : "100"},
	{"ID" : "133", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.PE_3_U0", "Parent" : "0", "Child" : ["134", "135", "136", "137", "138", "139", "140", "141", "142", "143", "144", "145", "146", "147", "148", "149", "150", "151", "152", "153", "154", "155", "156", "157", "158", "159", "160", "161", "162", "163", "164", "165", "166", "167", "168", "169", "170", "171", "172", "173", "174", "175", "176", "177", "178", "179", "180", "181", "182", "183", "184", "185", "186", "187", "188", "189", "190", "191", "192", "193", "194", "195", "196", "197"],
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
		"StartSource" : "35",
		"StartFifo" : "start_for_PE_3_U0_U",
		"Port" : [
			{"Name" : "N_pipe_in_1_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "35", "DependentChan" : "597",
				"BlockSignal" : [
					{"Name" : "N_pipe_in_1_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "N_pipe_out_2_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "231", "DependentChan" : "607",
				"BlockSignal" : [
					{"Name" : "N_pipe_out_2_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_in_1_1_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "100", "DependentChan" : "603",
				"BlockSignal" : [
					{"Name" : "a_in_1_1_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_in_2_1_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "100", "DependentChan" : "604",
				"BlockSignal" : [
					{"Name" : "a_in_2_1_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_in_3_1_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "100", "DependentChan" : "605",
				"BlockSignal" : [
					{"Name" : "a_in_3_1_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_in_4_1_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "100", "DependentChan" : "606",
				"BlockSignal" : [
					{"Name" : "a_in_4_1_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "b_in_1_1_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "35", "DependentChan" : "598",
				"BlockSignal" : [
					{"Name" : "b_in_1_1_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "b_in_2_1_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "35", "DependentChan" : "599",
				"BlockSignal" : [
					{"Name" : "b_in_2_1_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "b_out_1_2_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "231", "DependentChan" : "608",
				"BlockSignal" : [
					{"Name" : "b_out_1_2_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "b_out_2_2_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "231", "DependentChan" : "609",
				"BlockSignal" : [
					{"Name" : "b_out_2_2_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "c_in_1_1_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "35", "DependentChan" : "600",
				"BlockSignal" : [
					{"Name" : "c_in_1_1_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "c_in_2_1_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "35", "DependentChan" : "601",
				"BlockSignal" : [
					{"Name" : "c_in_2_1_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "c_out_1_2_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "231", "DependentChan" : "610",
				"BlockSignal" : [
					{"Name" : "c_out_1_2_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "c_out_2_2_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "231", "DependentChan" : "611",
				"BlockSignal" : [
					{"Name" : "c_out_2_2_V_V_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "134", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U167", "Parent" : "133"},
	{"ID" : "135", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U168", "Parent" : "133"},
	{"ID" : "136", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U169", "Parent" : "133"},
	{"ID" : "137", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U170", "Parent" : "133"},
	{"ID" : "138", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U171", "Parent" : "133"},
	{"ID" : "139", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U172", "Parent" : "133"},
	{"ID" : "140", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U173", "Parent" : "133"},
	{"ID" : "141", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U174", "Parent" : "133"},
	{"ID" : "142", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U175", "Parent" : "133"},
	{"ID" : "143", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U176", "Parent" : "133"},
	{"ID" : "144", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U177", "Parent" : "133"},
	{"ID" : "145", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U178", "Parent" : "133"},
	{"ID" : "146", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U179", "Parent" : "133"},
	{"ID" : "147", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U180", "Parent" : "133"},
	{"ID" : "148", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U181", "Parent" : "133"},
	{"ID" : "149", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U182", "Parent" : "133"},
	{"ID" : "150", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U183", "Parent" : "133"},
	{"ID" : "151", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U184", "Parent" : "133"},
	{"ID" : "152", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U185", "Parent" : "133"},
	{"ID" : "153", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U186", "Parent" : "133"},
	{"ID" : "154", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U187", "Parent" : "133"},
	{"ID" : "155", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U188", "Parent" : "133"},
	{"ID" : "156", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U189", "Parent" : "133"},
	{"ID" : "157", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U190", "Parent" : "133"},
	{"ID" : "158", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U191", "Parent" : "133"},
	{"ID" : "159", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U192", "Parent" : "133"},
	{"ID" : "160", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U193", "Parent" : "133"},
	{"ID" : "161", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U194", "Parent" : "133"},
	{"ID" : "162", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U195", "Parent" : "133"},
	{"ID" : "163", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U196", "Parent" : "133"},
	{"ID" : "164", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U197", "Parent" : "133"},
	{"ID" : "165", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U198", "Parent" : "133"},
	{"ID" : "166", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U199", "Parent" : "133"},
	{"ID" : "167", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U200", "Parent" : "133"},
	{"ID" : "168", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U201", "Parent" : "133"},
	{"ID" : "169", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U202", "Parent" : "133"},
	{"ID" : "170", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U203", "Parent" : "133"},
	{"ID" : "171", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U204", "Parent" : "133"},
	{"ID" : "172", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U205", "Parent" : "133"},
	{"ID" : "173", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U206", "Parent" : "133"},
	{"ID" : "174", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U207", "Parent" : "133"},
	{"ID" : "175", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U208", "Parent" : "133"},
	{"ID" : "176", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U209", "Parent" : "133"},
	{"ID" : "177", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U210", "Parent" : "133"},
	{"ID" : "178", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U211", "Parent" : "133"},
	{"ID" : "179", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U212", "Parent" : "133"},
	{"ID" : "180", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U213", "Parent" : "133"},
	{"ID" : "181", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U214", "Parent" : "133"},
	{"ID" : "182", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U215", "Parent" : "133"},
	{"ID" : "183", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U216", "Parent" : "133"},
	{"ID" : "184", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U217", "Parent" : "133"},
	{"ID" : "185", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U218", "Parent" : "133"},
	{"ID" : "186", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U219", "Parent" : "133"},
	{"ID" : "187", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U220", "Parent" : "133"},
	{"ID" : "188", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U221", "Parent" : "133"},
	{"ID" : "189", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U222", "Parent" : "133"},
	{"ID" : "190", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U223", "Parent" : "133"},
	{"ID" : "191", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U224", "Parent" : "133"},
	{"ID" : "192", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U225", "Parent" : "133"},
	{"ID" : "193", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U226", "Parent" : "133"},
	{"ID" : "194", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U227", "Parent" : "133"},
	{"ID" : "195", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U228", "Parent" : "133"},
	{"ID" : "196", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U229", "Parent" : "133"},
	{"ID" : "197", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_3_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U230", "Parent" : "133"},
	{"ID" : "198", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ReadA117132_U0", "Parent" : "0", "Child" : ["199", "200", "201", "202", "203", "204", "205", "206", "207", "208", "209", "210", "211", "212", "213", "214", "215", "216", "217", "218", "219", "220", "221", "222", "223", "224", "225", "226", "227", "228", "229", "230"],
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
		"StartSource" : "100",
		"StartFifo" : "start_for_ReadA117132_U0_U",
		"Port" : [
			{"Name" : "N_pipe_in_V_V2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "100", "DependentChan" : "602",
				"BlockSignal" : [
					{"Name" : "N_pipe_in_V_V2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "N_pipe_out_V_V9", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "296", "DependentChan" : "612",
				"BlockSignal" : [
					{"Name" : "N_pipe_out_V_V9_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_pipes_1_V_V14", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "231", "DependentChan" : "613",
				"BlockSignal" : [
					{"Name" : "a_pipes_1_V_V14_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_pipes_2_V_V19", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "231", "DependentChan" : "614",
				"BlockSignal" : [
					{"Name" : "a_pipes_2_V_V19_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_pipes_3_V_V24", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "231", "DependentChan" : "615",
				"BlockSignal" : [
					{"Name" : "a_pipes_3_V_V24_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_pipes_4_V_V29", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "231", "DependentChan" : "616",
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
	{"ID" : "199", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA117132_U0.weights_0_2_0_U", "Parent" : "198"},
	{"ID" : "200", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA117132_U0.weights_0_2_1_U", "Parent" : "198"},
	{"ID" : "201", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA117132_U0.weights_0_2_2_U", "Parent" : "198"},
	{"ID" : "202", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA117132_U0.weights_0_2_3_U", "Parent" : "198"},
	{"ID" : "203", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA117132_U0.weights_0_2_4_U", "Parent" : "198"},
	{"ID" : "204", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA117132_U0.weights_0_2_5_U", "Parent" : "198"},
	{"ID" : "205", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA117132_U0.weights_0_2_6_U", "Parent" : "198"},
	{"ID" : "206", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA117132_U0.weights_0_2_7_U", "Parent" : "198"},
	{"ID" : "207", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA117132_U0.weights_0_2_8_U", "Parent" : "198"},
	{"ID" : "208", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA117132_U0.weights_0_2_9_U", "Parent" : "198"},
	{"ID" : "209", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA117132_U0.weights_0_2_10_U", "Parent" : "198"},
	{"ID" : "210", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA117132_U0.weights_0_2_11_U", "Parent" : "198"},
	{"ID" : "211", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA117132_U0.weights_0_2_12_U", "Parent" : "198"},
	{"ID" : "212", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA117132_U0.weights_0_2_13_U", "Parent" : "198"},
	{"ID" : "213", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA117132_U0.weights_0_2_14_U", "Parent" : "198"},
	{"ID" : "214", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA117132_U0.weights_0_2_15_U", "Parent" : "198"},
	{"ID" : "215", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA117132_U0.weights_0_2_16_U", "Parent" : "198"},
	{"ID" : "216", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA117132_U0.weights_0_2_17_U", "Parent" : "198"},
	{"ID" : "217", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA117132_U0.weights_0_2_18_U", "Parent" : "198"},
	{"ID" : "218", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA117132_U0.weights_0_2_19_U", "Parent" : "198"},
	{"ID" : "219", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA117132_U0.weights_0_2_20_U", "Parent" : "198"},
	{"ID" : "220", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA117132_U0.weights_0_2_21_U", "Parent" : "198"},
	{"ID" : "221", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA117132_U0.weights_0_2_22_U", "Parent" : "198"},
	{"ID" : "222", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA117132_U0.weights_0_2_23_U", "Parent" : "198"},
	{"ID" : "223", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA117132_U0.weights_0_2_24_U", "Parent" : "198"},
	{"ID" : "224", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA117132_U0.weights_0_2_25_U", "Parent" : "198"},
	{"ID" : "225", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA117132_U0.weights_0_2_26_U", "Parent" : "198"},
	{"ID" : "226", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA117132_U0.weights_0_2_27_U", "Parent" : "198"},
	{"ID" : "227", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA117132_U0.weights_0_2_28_U", "Parent" : "198"},
	{"ID" : "228", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA117132_U0.weights_0_2_29_U", "Parent" : "198"},
	{"ID" : "229", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA117132_U0.weights_0_2_30_U", "Parent" : "198"},
	{"ID" : "230", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA117132_U0.weights_0_2_31_U", "Parent" : "198"},
	{"ID" : "231", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.PE_2_U0", "Parent" : "0", "Child" : ["232", "233", "234", "235", "236", "237", "238", "239", "240", "241", "242", "243", "244", "245", "246", "247", "248", "249", "250", "251", "252", "253", "254", "255", "256", "257", "258", "259", "260", "261", "262", "263", "264", "265", "266", "267", "268", "269", "270", "271", "272", "273", "274", "275", "276", "277", "278", "279", "280", "281", "282", "283", "284", "285", "286", "287", "288", "289", "290", "291", "292", "293", "294", "295"],
		"CDFG" : "PE_2",
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
		"StartSource" : "133",
		"StartFifo" : "start_for_PE_2_U0_U",
		"Port" : [
			{"Name" : "N_pipe_in_2_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "133", "DependentChan" : "607",
				"BlockSignal" : [
					{"Name" : "N_pipe_in_2_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "N_pipe_out_3_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "329", "DependentChan" : "617",
				"BlockSignal" : [
					{"Name" : "N_pipe_out_3_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_in_1_2_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "198", "DependentChan" : "613",
				"BlockSignal" : [
					{"Name" : "a_in_1_2_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_in_2_2_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "198", "DependentChan" : "614",
				"BlockSignal" : [
					{"Name" : "a_in_2_2_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_in_3_2_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "198", "DependentChan" : "615",
				"BlockSignal" : [
					{"Name" : "a_in_3_2_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_in_4_2_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "198", "DependentChan" : "616",
				"BlockSignal" : [
					{"Name" : "a_in_4_2_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "b_in_1_2_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "133", "DependentChan" : "608",
				"BlockSignal" : [
					{"Name" : "b_in_1_2_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "b_in_2_2_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "133", "DependentChan" : "609",
				"BlockSignal" : [
					{"Name" : "b_in_2_2_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "b_out_1_3_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "329", "DependentChan" : "618",
				"BlockSignal" : [
					{"Name" : "b_out_1_3_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "b_out_2_3_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "329", "DependentChan" : "619",
				"BlockSignal" : [
					{"Name" : "b_out_2_3_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "c_in_1_2_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "133", "DependentChan" : "610",
				"BlockSignal" : [
					{"Name" : "c_in_1_2_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "c_in_2_2_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "133", "DependentChan" : "611",
				"BlockSignal" : [
					{"Name" : "c_in_2_2_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "c_out_1_3_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "329", "DependentChan" : "620",
				"BlockSignal" : [
					{"Name" : "c_out_1_3_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "c_out_2_3_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "329", "DependentChan" : "621",
				"BlockSignal" : [
					{"Name" : "c_out_2_3_V_V_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "232", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U283", "Parent" : "231"},
	{"ID" : "233", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U284", "Parent" : "231"},
	{"ID" : "234", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U285", "Parent" : "231"},
	{"ID" : "235", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U286", "Parent" : "231"},
	{"ID" : "236", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U287", "Parent" : "231"},
	{"ID" : "237", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U288", "Parent" : "231"},
	{"ID" : "238", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U289", "Parent" : "231"},
	{"ID" : "239", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U290", "Parent" : "231"},
	{"ID" : "240", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U291", "Parent" : "231"},
	{"ID" : "241", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U292", "Parent" : "231"},
	{"ID" : "242", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U293", "Parent" : "231"},
	{"ID" : "243", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U294", "Parent" : "231"},
	{"ID" : "244", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U295", "Parent" : "231"},
	{"ID" : "245", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U296", "Parent" : "231"},
	{"ID" : "246", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U297", "Parent" : "231"},
	{"ID" : "247", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U298", "Parent" : "231"},
	{"ID" : "248", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U299", "Parent" : "231"},
	{"ID" : "249", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U300", "Parent" : "231"},
	{"ID" : "250", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U301", "Parent" : "231"},
	{"ID" : "251", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U302", "Parent" : "231"},
	{"ID" : "252", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U303", "Parent" : "231"},
	{"ID" : "253", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U304", "Parent" : "231"},
	{"ID" : "254", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U305", "Parent" : "231"},
	{"ID" : "255", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U306", "Parent" : "231"},
	{"ID" : "256", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U307", "Parent" : "231"},
	{"ID" : "257", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U308", "Parent" : "231"},
	{"ID" : "258", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U309", "Parent" : "231"},
	{"ID" : "259", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U310", "Parent" : "231"},
	{"ID" : "260", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U311", "Parent" : "231"},
	{"ID" : "261", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U312", "Parent" : "231"},
	{"ID" : "262", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U313", "Parent" : "231"},
	{"ID" : "263", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U314", "Parent" : "231"},
	{"ID" : "264", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U315", "Parent" : "231"},
	{"ID" : "265", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U316", "Parent" : "231"},
	{"ID" : "266", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U317", "Parent" : "231"},
	{"ID" : "267", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U318", "Parent" : "231"},
	{"ID" : "268", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U319", "Parent" : "231"},
	{"ID" : "269", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U320", "Parent" : "231"},
	{"ID" : "270", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U321", "Parent" : "231"},
	{"ID" : "271", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U322", "Parent" : "231"},
	{"ID" : "272", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U323", "Parent" : "231"},
	{"ID" : "273", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U324", "Parent" : "231"},
	{"ID" : "274", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U325", "Parent" : "231"},
	{"ID" : "275", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U326", "Parent" : "231"},
	{"ID" : "276", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U327", "Parent" : "231"},
	{"ID" : "277", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U328", "Parent" : "231"},
	{"ID" : "278", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U329", "Parent" : "231"},
	{"ID" : "279", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U330", "Parent" : "231"},
	{"ID" : "280", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U331", "Parent" : "231"},
	{"ID" : "281", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U332", "Parent" : "231"},
	{"ID" : "282", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U333", "Parent" : "231"},
	{"ID" : "283", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U334", "Parent" : "231"},
	{"ID" : "284", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U335", "Parent" : "231"},
	{"ID" : "285", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U336", "Parent" : "231"},
	{"ID" : "286", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U337", "Parent" : "231"},
	{"ID" : "287", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U338", "Parent" : "231"},
	{"ID" : "288", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U339", "Parent" : "231"},
	{"ID" : "289", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U340", "Parent" : "231"},
	{"ID" : "290", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U341", "Parent" : "231"},
	{"ID" : "291", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U342", "Parent" : "231"},
	{"ID" : "292", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U343", "Parent" : "231"},
	{"ID" : "293", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U344", "Parent" : "231"},
	{"ID" : "294", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U345", "Parent" : "231"},
	{"ID" : "295", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_2_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U346", "Parent" : "231"},
	{"ID" : "296", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ReadA119134_U0", "Parent" : "0", "Child" : ["297", "298", "299", "300", "301", "302", "303", "304", "305", "306", "307", "308", "309", "310", "311", "312", "313", "314", "315", "316", "317", "318", "319", "320", "321", "322", "323", "324", "325", "326", "327", "328"],
		"CDFG" : "ReadA119134",
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
		"StartSource" : "198",
		"StartFifo" : "start_for_ReadA119134_U0_U",
		"Port" : [
			{"Name" : "N_pipe_in_V_V3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "198", "DependentChan" : "612",
				"BlockSignal" : [
					{"Name" : "N_pipe_in_V_V3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "N_pipe_out_V_V10", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "394", "DependentChan" : "622",
				"BlockSignal" : [
					{"Name" : "N_pipe_out_V_V10_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_pipes_1_V_V15", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "329", "DependentChan" : "623",
				"BlockSignal" : [
					{"Name" : "a_pipes_1_V_V15_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_pipes_2_V_V20", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "329", "DependentChan" : "624",
				"BlockSignal" : [
					{"Name" : "a_pipes_2_V_V20_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_pipes_3_V_V25", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "329", "DependentChan" : "625",
				"BlockSignal" : [
					{"Name" : "a_pipes_3_V_V25_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_pipes_4_V_V30", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "329", "DependentChan" : "626",
				"BlockSignal" : [
					{"Name" : "a_pipes_4_V_V30_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "weights_0_3_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_3_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_3_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_3_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_3_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_3_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_3_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_3_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_3_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_3_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_3_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_3_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_3_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_3_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_3_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_3_15", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_3_16", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_3_17", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_3_18", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_3_19", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_3_20", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_3_21", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_3_22", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_3_23", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_3_24", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_3_25", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_3_26", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_3_27", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_3_28", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_3_29", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_3_30", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_3_31", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "297", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA119134_U0.weights_0_3_0_U", "Parent" : "296"},
	{"ID" : "298", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA119134_U0.weights_0_3_1_U", "Parent" : "296"},
	{"ID" : "299", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA119134_U0.weights_0_3_2_U", "Parent" : "296"},
	{"ID" : "300", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA119134_U0.weights_0_3_3_U", "Parent" : "296"},
	{"ID" : "301", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA119134_U0.weights_0_3_4_U", "Parent" : "296"},
	{"ID" : "302", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA119134_U0.weights_0_3_5_U", "Parent" : "296"},
	{"ID" : "303", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA119134_U0.weights_0_3_6_U", "Parent" : "296"},
	{"ID" : "304", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA119134_U0.weights_0_3_7_U", "Parent" : "296"},
	{"ID" : "305", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA119134_U0.weights_0_3_8_U", "Parent" : "296"},
	{"ID" : "306", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA119134_U0.weights_0_3_9_U", "Parent" : "296"},
	{"ID" : "307", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA119134_U0.weights_0_3_10_U", "Parent" : "296"},
	{"ID" : "308", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA119134_U0.weights_0_3_11_U", "Parent" : "296"},
	{"ID" : "309", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA119134_U0.weights_0_3_12_U", "Parent" : "296"},
	{"ID" : "310", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA119134_U0.weights_0_3_13_U", "Parent" : "296"},
	{"ID" : "311", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA119134_U0.weights_0_3_14_U", "Parent" : "296"},
	{"ID" : "312", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA119134_U0.weights_0_3_15_U", "Parent" : "296"},
	{"ID" : "313", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA119134_U0.weights_0_3_16_U", "Parent" : "296"},
	{"ID" : "314", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA119134_U0.weights_0_3_17_U", "Parent" : "296"},
	{"ID" : "315", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA119134_U0.weights_0_3_18_U", "Parent" : "296"},
	{"ID" : "316", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA119134_U0.weights_0_3_19_U", "Parent" : "296"},
	{"ID" : "317", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA119134_U0.weights_0_3_20_U", "Parent" : "296"},
	{"ID" : "318", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA119134_U0.weights_0_3_21_U", "Parent" : "296"},
	{"ID" : "319", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA119134_U0.weights_0_3_22_U", "Parent" : "296"},
	{"ID" : "320", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA119134_U0.weights_0_3_23_U", "Parent" : "296"},
	{"ID" : "321", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA119134_U0.weights_0_3_24_U", "Parent" : "296"},
	{"ID" : "322", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA119134_U0.weights_0_3_25_U", "Parent" : "296"},
	{"ID" : "323", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA119134_U0.weights_0_3_26_U", "Parent" : "296"},
	{"ID" : "324", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA119134_U0.weights_0_3_27_U", "Parent" : "296"},
	{"ID" : "325", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA119134_U0.weights_0_3_28_U", "Parent" : "296"},
	{"ID" : "326", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA119134_U0.weights_0_3_29_U", "Parent" : "296"},
	{"ID" : "327", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA119134_U0.weights_0_3_30_U", "Parent" : "296"},
	{"ID" : "328", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA119134_U0.weights_0_3_31_U", "Parent" : "296"},
	{"ID" : "329", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.PE_1_U0", "Parent" : "0", "Child" : ["330", "331", "332", "333", "334", "335", "336", "337", "338", "339", "340", "341", "342", "343", "344", "345", "346", "347", "348", "349", "350", "351", "352", "353", "354", "355", "356", "357", "358", "359", "360", "361", "362", "363", "364", "365", "366", "367", "368", "369", "370", "371", "372", "373", "374", "375", "376", "377", "378", "379", "380", "381", "382", "383", "384", "385", "386", "387", "388", "389", "390", "391", "392", "393"],
		"CDFG" : "PE_1",
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
		"StartSource" : "231",
		"StartFifo" : "start_for_PE_1_U0_U",
		"Port" : [
			{"Name" : "N_pipe_in_3_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "231", "DependentChan" : "617",
				"BlockSignal" : [
					{"Name" : "N_pipe_in_3_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "N_pipe_out_4_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "427", "DependentChan" : "627",
				"BlockSignal" : [
					{"Name" : "N_pipe_out_4_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_in_1_3_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "296", "DependentChan" : "623",
				"BlockSignal" : [
					{"Name" : "a_in_1_3_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_in_2_3_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "296", "DependentChan" : "624",
				"BlockSignal" : [
					{"Name" : "a_in_2_3_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_in_3_3_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "296", "DependentChan" : "625",
				"BlockSignal" : [
					{"Name" : "a_in_3_3_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_in_4_3_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "296", "DependentChan" : "626",
				"BlockSignal" : [
					{"Name" : "a_in_4_3_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "b_in_1_3_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "231", "DependentChan" : "618",
				"BlockSignal" : [
					{"Name" : "b_in_1_3_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "b_in_2_3_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "231", "DependentChan" : "619",
				"BlockSignal" : [
					{"Name" : "b_in_2_3_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "b_out_1_4_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "427", "DependentChan" : "628",
				"BlockSignal" : [
					{"Name" : "b_out_1_4_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "b_out_2_4_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "427", "DependentChan" : "629",
				"BlockSignal" : [
					{"Name" : "b_out_2_4_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "c_in_1_3_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "231", "DependentChan" : "620",
				"BlockSignal" : [
					{"Name" : "c_in_1_3_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "c_in_2_3_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "231", "DependentChan" : "621",
				"BlockSignal" : [
					{"Name" : "c_in_2_3_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "c_out_1_4_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "427", "DependentChan" : "630",
				"BlockSignal" : [
					{"Name" : "c_out_1_4_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "c_out_2_4_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "427", "DependentChan" : "631",
				"BlockSignal" : [
					{"Name" : "c_out_2_4_V_V_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "330", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U399", "Parent" : "329"},
	{"ID" : "331", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U400", "Parent" : "329"},
	{"ID" : "332", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U401", "Parent" : "329"},
	{"ID" : "333", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U402", "Parent" : "329"},
	{"ID" : "334", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U403", "Parent" : "329"},
	{"ID" : "335", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U404", "Parent" : "329"},
	{"ID" : "336", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U405", "Parent" : "329"},
	{"ID" : "337", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U406", "Parent" : "329"},
	{"ID" : "338", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U407", "Parent" : "329"},
	{"ID" : "339", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U408", "Parent" : "329"},
	{"ID" : "340", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U409", "Parent" : "329"},
	{"ID" : "341", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U410", "Parent" : "329"},
	{"ID" : "342", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U411", "Parent" : "329"},
	{"ID" : "343", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U412", "Parent" : "329"},
	{"ID" : "344", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U413", "Parent" : "329"},
	{"ID" : "345", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U414", "Parent" : "329"},
	{"ID" : "346", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U415", "Parent" : "329"},
	{"ID" : "347", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U416", "Parent" : "329"},
	{"ID" : "348", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U417", "Parent" : "329"},
	{"ID" : "349", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U418", "Parent" : "329"},
	{"ID" : "350", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U419", "Parent" : "329"},
	{"ID" : "351", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U420", "Parent" : "329"},
	{"ID" : "352", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U421", "Parent" : "329"},
	{"ID" : "353", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U422", "Parent" : "329"},
	{"ID" : "354", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U423", "Parent" : "329"},
	{"ID" : "355", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U424", "Parent" : "329"},
	{"ID" : "356", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U425", "Parent" : "329"},
	{"ID" : "357", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U426", "Parent" : "329"},
	{"ID" : "358", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U427", "Parent" : "329"},
	{"ID" : "359", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U428", "Parent" : "329"},
	{"ID" : "360", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U429", "Parent" : "329"},
	{"ID" : "361", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U430", "Parent" : "329"},
	{"ID" : "362", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U431", "Parent" : "329"},
	{"ID" : "363", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U432", "Parent" : "329"},
	{"ID" : "364", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U433", "Parent" : "329"},
	{"ID" : "365", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U434", "Parent" : "329"},
	{"ID" : "366", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U435", "Parent" : "329"},
	{"ID" : "367", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U436", "Parent" : "329"},
	{"ID" : "368", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U437", "Parent" : "329"},
	{"ID" : "369", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U438", "Parent" : "329"},
	{"ID" : "370", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U439", "Parent" : "329"},
	{"ID" : "371", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U440", "Parent" : "329"},
	{"ID" : "372", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U441", "Parent" : "329"},
	{"ID" : "373", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U442", "Parent" : "329"},
	{"ID" : "374", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U443", "Parent" : "329"},
	{"ID" : "375", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U444", "Parent" : "329"},
	{"ID" : "376", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U445", "Parent" : "329"},
	{"ID" : "377", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U446", "Parent" : "329"},
	{"ID" : "378", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U447", "Parent" : "329"},
	{"ID" : "379", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U448", "Parent" : "329"},
	{"ID" : "380", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U449", "Parent" : "329"},
	{"ID" : "381", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U450", "Parent" : "329"},
	{"ID" : "382", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U451", "Parent" : "329"},
	{"ID" : "383", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U452", "Parent" : "329"},
	{"ID" : "384", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U453", "Parent" : "329"},
	{"ID" : "385", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U454", "Parent" : "329"},
	{"ID" : "386", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U455", "Parent" : "329"},
	{"ID" : "387", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U456", "Parent" : "329"},
	{"ID" : "388", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U457", "Parent" : "329"},
	{"ID" : "389", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U458", "Parent" : "329"},
	{"ID" : "390", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U459", "Parent" : "329"},
	{"ID" : "391", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U460", "Parent" : "329"},
	{"ID" : "392", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U461", "Parent" : "329"},
	{"ID" : "393", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_1_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U462", "Parent" : "329"},
	{"ID" : "394", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ReadA121136_U0", "Parent" : "0", "Child" : ["395", "396", "397", "398", "399", "400", "401", "402", "403", "404", "405", "406", "407", "408", "409", "410", "411", "412", "413", "414", "415", "416", "417", "418", "419", "420", "421", "422", "423", "424", "425", "426"],
		"CDFG" : "ReadA121136",
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
		"StartSource" : "296",
		"StartFifo" : "start_for_ReadA121136_U0_U",
		"Port" : [
			{"Name" : "N_pipe_in_V_V4", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "296", "DependentChan" : "622",
				"BlockSignal" : [
					{"Name" : "N_pipe_in_V_V4_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "N_pipe_out_V_V11", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "492", "DependentChan" : "632",
				"BlockSignal" : [
					{"Name" : "N_pipe_out_V_V11_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_pipes_1_V_V16", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "427", "DependentChan" : "633",
				"BlockSignal" : [
					{"Name" : "a_pipes_1_V_V16_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_pipes_2_V_V21", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "427", "DependentChan" : "634",
				"BlockSignal" : [
					{"Name" : "a_pipes_2_V_V21_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_pipes_3_V_V26", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "427", "DependentChan" : "635",
				"BlockSignal" : [
					{"Name" : "a_pipes_3_V_V26_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_pipes_4_V_V31", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "427", "DependentChan" : "636",
				"BlockSignal" : [
					{"Name" : "a_pipes_4_V_V31_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "weights_0_4_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_4_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_4_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_4_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_4_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_4_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_4_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_4_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_4_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_4_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_4_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_4_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_4_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_4_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_4_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_4_15", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_4_16", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_4_17", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_4_18", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_4_19", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_4_20", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_4_21", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_4_22", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_4_23", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_4_24", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_4_25", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_4_26", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_4_27", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_4_28", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_4_29", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_4_30", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_4_31", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "395", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA121136_U0.weights_0_4_0_U", "Parent" : "394"},
	{"ID" : "396", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA121136_U0.weights_0_4_1_U", "Parent" : "394"},
	{"ID" : "397", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA121136_U0.weights_0_4_2_U", "Parent" : "394"},
	{"ID" : "398", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA121136_U0.weights_0_4_3_U", "Parent" : "394"},
	{"ID" : "399", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA121136_U0.weights_0_4_4_U", "Parent" : "394"},
	{"ID" : "400", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA121136_U0.weights_0_4_5_U", "Parent" : "394"},
	{"ID" : "401", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA121136_U0.weights_0_4_6_U", "Parent" : "394"},
	{"ID" : "402", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA121136_U0.weights_0_4_7_U", "Parent" : "394"},
	{"ID" : "403", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA121136_U0.weights_0_4_8_U", "Parent" : "394"},
	{"ID" : "404", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA121136_U0.weights_0_4_9_U", "Parent" : "394"},
	{"ID" : "405", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA121136_U0.weights_0_4_10_U", "Parent" : "394"},
	{"ID" : "406", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA121136_U0.weights_0_4_11_U", "Parent" : "394"},
	{"ID" : "407", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA121136_U0.weights_0_4_12_U", "Parent" : "394"},
	{"ID" : "408", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA121136_U0.weights_0_4_13_U", "Parent" : "394"},
	{"ID" : "409", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA121136_U0.weights_0_4_14_U", "Parent" : "394"},
	{"ID" : "410", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA121136_U0.weights_0_4_15_U", "Parent" : "394"},
	{"ID" : "411", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA121136_U0.weights_0_4_16_U", "Parent" : "394"},
	{"ID" : "412", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA121136_U0.weights_0_4_17_U", "Parent" : "394"},
	{"ID" : "413", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA121136_U0.weights_0_4_18_U", "Parent" : "394"},
	{"ID" : "414", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA121136_U0.weights_0_4_19_U", "Parent" : "394"},
	{"ID" : "415", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA121136_U0.weights_0_4_20_U", "Parent" : "394"},
	{"ID" : "416", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA121136_U0.weights_0_4_21_U", "Parent" : "394"},
	{"ID" : "417", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA121136_U0.weights_0_4_22_U", "Parent" : "394"},
	{"ID" : "418", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA121136_U0.weights_0_4_23_U", "Parent" : "394"},
	{"ID" : "419", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA121136_U0.weights_0_4_24_U", "Parent" : "394"},
	{"ID" : "420", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA121136_U0.weights_0_4_25_U", "Parent" : "394"},
	{"ID" : "421", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA121136_U0.weights_0_4_26_U", "Parent" : "394"},
	{"ID" : "422", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA121136_U0.weights_0_4_27_U", "Parent" : "394"},
	{"ID" : "423", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA121136_U0.weights_0_4_28_U", "Parent" : "394"},
	{"ID" : "424", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA121136_U0.weights_0_4_29_U", "Parent" : "394"},
	{"ID" : "425", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA121136_U0.weights_0_4_30_U", "Parent" : "394"},
	{"ID" : "426", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA121136_U0.weights_0_4_31_U", "Parent" : "394"},
	{"ID" : "427", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.PE_U0", "Parent" : "0", "Child" : ["428", "429", "430", "431", "432", "433", "434", "435", "436", "437", "438", "439", "440", "441", "442", "443", "444", "445", "446", "447", "448", "449", "450", "451", "452", "453", "454", "455", "456", "457", "458", "459", "460", "461", "462", "463", "464", "465", "466", "467", "468", "469", "470", "471", "472", "473", "474", "475", "476", "477", "478", "479", "480", "481", "482", "483", "484", "485", "486", "487", "488", "489", "490", "491"],
		"CDFG" : "PE",
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
		"StartSource" : "329",
		"StartFifo" : "start_for_PE_U0_U",
		"Port" : [
			{"Name" : "N_pipe_in_4_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "329", "DependentChan" : "627",
				"BlockSignal" : [
					{"Name" : "N_pipe_in_4_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "N_pipe_out_5_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "525", "DependentChan" : "637",
				"BlockSignal" : [
					{"Name" : "N_pipe_out_5_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_in_1_4_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "394", "DependentChan" : "633",
				"BlockSignal" : [
					{"Name" : "a_in_1_4_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_in_2_4_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "394", "DependentChan" : "634",
				"BlockSignal" : [
					{"Name" : "a_in_2_4_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_in_3_4_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "394", "DependentChan" : "635",
				"BlockSignal" : [
					{"Name" : "a_in_3_4_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_in_4_4_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "394", "DependentChan" : "636",
				"BlockSignal" : [
					{"Name" : "a_in_4_4_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "b_in_1_4_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "329", "DependentChan" : "628",
				"BlockSignal" : [
					{"Name" : "b_in_1_4_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "b_in_2_4_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "329", "DependentChan" : "629",
				"BlockSignal" : [
					{"Name" : "b_in_2_4_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "b_out_1_5_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "525", "DependentChan" : "638",
				"BlockSignal" : [
					{"Name" : "b_out_1_5_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "b_out_2_5_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "525", "DependentChan" : "639",
				"BlockSignal" : [
					{"Name" : "b_out_2_5_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "c_in_1_4_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "329", "DependentChan" : "630",
				"BlockSignal" : [
					{"Name" : "c_in_1_4_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "c_in_2_4_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "329", "DependentChan" : "631",
				"BlockSignal" : [
					{"Name" : "c_in_2_4_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "c_out_1_5_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "525", "DependentChan" : "640",
				"BlockSignal" : [
					{"Name" : "c_out_1_5_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "c_out_2_5_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "525", "DependentChan" : "641",
				"BlockSignal" : [
					{"Name" : "c_out_2_5_V_V_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "428", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U515", "Parent" : "427"},
	{"ID" : "429", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U516", "Parent" : "427"},
	{"ID" : "430", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U517", "Parent" : "427"},
	{"ID" : "431", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U518", "Parent" : "427"},
	{"ID" : "432", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U519", "Parent" : "427"},
	{"ID" : "433", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U520", "Parent" : "427"},
	{"ID" : "434", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U521", "Parent" : "427"},
	{"ID" : "435", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U522", "Parent" : "427"},
	{"ID" : "436", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U523", "Parent" : "427"},
	{"ID" : "437", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U524", "Parent" : "427"},
	{"ID" : "438", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U525", "Parent" : "427"},
	{"ID" : "439", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U526", "Parent" : "427"},
	{"ID" : "440", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U527", "Parent" : "427"},
	{"ID" : "441", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U528", "Parent" : "427"},
	{"ID" : "442", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U529", "Parent" : "427"},
	{"ID" : "443", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U530", "Parent" : "427"},
	{"ID" : "444", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U531", "Parent" : "427"},
	{"ID" : "445", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U532", "Parent" : "427"},
	{"ID" : "446", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U533", "Parent" : "427"},
	{"ID" : "447", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U534", "Parent" : "427"},
	{"ID" : "448", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U535", "Parent" : "427"},
	{"ID" : "449", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U536", "Parent" : "427"},
	{"ID" : "450", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U537", "Parent" : "427"},
	{"ID" : "451", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U538", "Parent" : "427"},
	{"ID" : "452", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U539", "Parent" : "427"},
	{"ID" : "453", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U540", "Parent" : "427"},
	{"ID" : "454", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U541", "Parent" : "427"},
	{"ID" : "455", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U542", "Parent" : "427"},
	{"ID" : "456", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U543", "Parent" : "427"},
	{"ID" : "457", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U544", "Parent" : "427"},
	{"ID" : "458", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U545", "Parent" : "427"},
	{"ID" : "459", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U546", "Parent" : "427"},
	{"ID" : "460", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U547", "Parent" : "427"},
	{"ID" : "461", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U548", "Parent" : "427"},
	{"ID" : "462", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U549", "Parent" : "427"},
	{"ID" : "463", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U550", "Parent" : "427"},
	{"ID" : "464", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U551", "Parent" : "427"},
	{"ID" : "465", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U552", "Parent" : "427"},
	{"ID" : "466", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U553", "Parent" : "427"},
	{"ID" : "467", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U554", "Parent" : "427"},
	{"ID" : "468", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U555", "Parent" : "427"},
	{"ID" : "469", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U556", "Parent" : "427"},
	{"ID" : "470", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U557", "Parent" : "427"},
	{"ID" : "471", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U558", "Parent" : "427"},
	{"ID" : "472", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U559", "Parent" : "427"},
	{"ID" : "473", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U560", "Parent" : "427"},
	{"ID" : "474", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U561", "Parent" : "427"},
	{"ID" : "475", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U562", "Parent" : "427"},
	{"ID" : "476", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U563", "Parent" : "427"},
	{"ID" : "477", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U564", "Parent" : "427"},
	{"ID" : "478", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U565", "Parent" : "427"},
	{"ID" : "479", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U566", "Parent" : "427"},
	{"ID" : "480", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U567", "Parent" : "427"},
	{"ID" : "481", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U568", "Parent" : "427"},
	{"ID" : "482", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U569", "Parent" : "427"},
	{"ID" : "483", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U570", "Parent" : "427"},
	{"ID" : "484", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U571", "Parent" : "427"},
	{"ID" : "485", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U572", "Parent" : "427"},
	{"ID" : "486", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U573", "Parent" : "427"},
	{"ID" : "487", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U574", "Parent" : "427"},
	{"ID" : "488", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U575", "Parent" : "427"},
	{"ID" : "489", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U576", "Parent" : "427"},
	{"ID" : "490", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U577", "Parent" : "427"},
	{"ID" : "491", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U578", "Parent" : "427"},
	{"ID" : "492", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ReadA123138_U0", "Parent" : "0", "Child" : ["493", "494", "495", "496", "497", "498", "499", "500", "501", "502", "503", "504", "505", "506", "507", "508", "509", "510", "511", "512", "513", "514", "515", "516", "517", "518", "519", "520", "521", "522", "523", "524"],
		"CDFG" : "ReadA123138",
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
		"StartSource" : "394",
		"StartFifo" : "start_for_ReadA123138_U0_U",
		"Port" : [
			{"Name" : "N_pipe_in_V_V5", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "394", "DependentChan" : "632",
				"BlockSignal" : [
					{"Name" : "N_pipe_in_V_V5_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_pipes_1_V_V17", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "525", "DependentChan" : "642",
				"BlockSignal" : [
					{"Name" : "a_pipes_1_V_V17_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_pipes_2_V_V22", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "525", "DependentChan" : "643",
				"BlockSignal" : [
					{"Name" : "a_pipes_2_V_V22_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_pipes_3_V_V27", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "525", "DependentChan" : "644",
				"BlockSignal" : [
					{"Name" : "a_pipes_3_V_V27_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_pipes_4_V_V32", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "525", "DependentChan" : "645",
				"BlockSignal" : [
					{"Name" : "a_pipes_4_V_V32_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "weights_0_5_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_5_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_5_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_5_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_5_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_5_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_5_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_5_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_5_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_5_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_5_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_5_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_5_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_5_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_5_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_5_15", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_5_16", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_5_17", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_5_18", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_5_19", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_5_20", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_5_21", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_5_22", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_5_23", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_5_24", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_5_25", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_5_26", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_5_27", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_5_28", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_5_29", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_5_30", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "weights_0_5_31", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "493", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA123138_U0.weights_0_5_0_U", "Parent" : "492"},
	{"ID" : "494", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA123138_U0.weights_0_5_1_U", "Parent" : "492"},
	{"ID" : "495", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA123138_U0.weights_0_5_2_U", "Parent" : "492"},
	{"ID" : "496", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA123138_U0.weights_0_5_3_U", "Parent" : "492"},
	{"ID" : "497", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA123138_U0.weights_0_5_4_U", "Parent" : "492"},
	{"ID" : "498", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA123138_U0.weights_0_5_5_U", "Parent" : "492"},
	{"ID" : "499", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA123138_U0.weights_0_5_6_U", "Parent" : "492"},
	{"ID" : "500", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA123138_U0.weights_0_5_7_U", "Parent" : "492"},
	{"ID" : "501", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA123138_U0.weights_0_5_8_U", "Parent" : "492"},
	{"ID" : "502", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA123138_U0.weights_0_5_9_U", "Parent" : "492"},
	{"ID" : "503", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA123138_U0.weights_0_5_10_U", "Parent" : "492"},
	{"ID" : "504", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA123138_U0.weights_0_5_11_U", "Parent" : "492"},
	{"ID" : "505", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA123138_U0.weights_0_5_12_U", "Parent" : "492"},
	{"ID" : "506", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA123138_U0.weights_0_5_13_U", "Parent" : "492"},
	{"ID" : "507", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA123138_U0.weights_0_5_14_U", "Parent" : "492"},
	{"ID" : "508", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA123138_U0.weights_0_5_15_U", "Parent" : "492"},
	{"ID" : "509", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA123138_U0.weights_0_5_16_U", "Parent" : "492"},
	{"ID" : "510", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA123138_U0.weights_0_5_17_U", "Parent" : "492"},
	{"ID" : "511", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA123138_U0.weights_0_5_18_U", "Parent" : "492"},
	{"ID" : "512", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA123138_U0.weights_0_5_19_U", "Parent" : "492"},
	{"ID" : "513", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA123138_U0.weights_0_5_20_U", "Parent" : "492"},
	{"ID" : "514", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA123138_U0.weights_0_5_21_U", "Parent" : "492"},
	{"ID" : "515", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA123138_U0.weights_0_5_22_U", "Parent" : "492"},
	{"ID" : "516", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA123138_U0.weights_0_5_23_U", "Parent" : "492"},
	{"ID" : "517", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA123138_U0.weights_0_5_24_U", "Parent" : "492"},
	{"ID" : "518", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA123138_U0.weights_0_5_25_U", "Parent" : "492"},
	{"ID" : "519", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA123138_U0.weights_0_5_26_U", "Parent" : "492"},
	{"ID" : "520", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA123138_U0.weights_0_5_27_U", "Parent" : "492"},
	{"ID" : "521", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA123138_U0.weights_0_5_28_U", "Parent" : "492"},
	{"ID" : "522", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA123138_U0.weights_0_5_29_U", "Parent" : "492"},
	{"ID" : "523", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA123138_U0.weights_0_5_30_U", "Parent" : "492"},
	{"ID" : "524", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.ReadA123138_U0.weights_0_5_31_U", "Parent" : "492"},
	{"ID" : "525", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.PE_4_U0", "Parent" : "0", "Child" : ["526", "527", "528", "529", "530", "531", "532", "533", "534", "535", "536", "537", "538", "539", "540", "541", "542", "543", "544", "545", "546", "547", "548", "549", "550", "551", "552", "553", "554", "555", "556", "557", "558", "559", "560", "561", "562", "563", "564", "565", "566", "567", "568", "569", "570", "571", "572", "573", "574", "575", "576", "577", "578", "579", "580", "581", "582", "583", "584", "585", "586", "587", "588", "589"],
		"CDFG" : "PE_4",
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
		"StartSource" : "427",
		"StartFifo" : "start_for_PE_4_U0_U",
		"Port" : [
			{"Name" : "N_pipe_in_5_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "427", "DependentChan" : "637",
				"BlockSignal" : [
					{"Name" : "N_pipe_in_5_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_in_1_5_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "492", "DependentChan" : "642",
				"BlockSignal" : [
					{"Name" : "a_in_1_5_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_in_2_5_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "492", "DependentChan" : "643",
				"BlockSignal" : [
					{"Name" : "a_in_2_5_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_in_3_5_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "492", "DependentChan" : "644",
				"BlockSignal" : [
					{"Name" : "a_in_3_5_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "a_in_4_5_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "492", "DependentChan" : "645",
				"BlockSignal" : [
					{"Name" : "a_in_4_5_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "b_in_1_5_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "427", "DependentChan" : "638",
				"BlockSignal" : [
					{"Name" : "b_in_1_5_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "b_in_2_5_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "427", "DependentChan" : "639",
				"BlockSignal" : [
					{"Name" : "b_in_2_5_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "c_in_1_5_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "427", "DependentChan" : "640",
				"BlockSignal" : [
					{"Name" : "c_in_1_5_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "c_in_2_5_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "427", "DependentChan" : "641",
				"BlockSignal" : [
					{"Name" : "c_in_2_5_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "c_out_1_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "c_out_1_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "c_out_2_V_V2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "c_out_2_V_V2_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "526", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U630", "Parent" : "525"},
	{"ID" : "527", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U631", "Parent" : "525"},
	{"ID" : "528", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U632", "Parent" : "525"},
	{"ID" : "529", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U633", "Parent" : "525"},
	{"ID" : "530", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U634", "Parent" : "525"},
	{"ID" : "531", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U635", "Parent" : "525"},
	{"ID" : "532", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U636", "Parent" : "525"},
	{"ID" : "533", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U637", "Parent" : "525"},
	{"ID" : "534", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U638", "Parent" : "525"},
	{"ID" : "535", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U639", "Parent" : "525"},
	{"ID" : "536", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U640", "Parent" : "525"},
	{"ID" : "537", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U641", "Parent" : "525"},
	{"ID" : "538", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U642", "Parent" : "525"},
	{"ID" : "539", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U643", "Parent" : "525"},
	{"ID" : "540", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U644", "Parent" : "525"},
	{"ID" : "541", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U645", "Parent" : "525"},
	{"ID" : "542", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U646", "Parent" : "525"},
	{"ID" : "543", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U647", "Parent" : "525"},
	{"ID" : "544", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U648", "Parent" : "525"},
	{"ID" : "545", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U649", "Parent" : "525"},
	{"ID" : "546", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U650", "Parent" : "525"},
	{"ID" : "547", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U651", "Parent" : "525"},
	{"ID" : "548", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U652", "Parent" : "525"},
	{"ID" : "549", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U653", "Parent" : "525"},
	{"ID" : "550", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U654", "Parent" : "525"},
	{"ID" : "551", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U655", "Parent" : "525"},
	{"ID" : "552", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U656", "Parent" : "525"},
	{"ID" : "553", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U657", "Parent" : "525"},
	{"ID" : "554", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U658", "Parent" : "525"},
	{"ID" : "555", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U659", "Parent" : "525"},
	{"ID" : "556", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U660", "Parent" : "525"},
	{"ID" : "557", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U661", "Parent" : "525"},
	{"ID" : "558", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U662", "Parent" : "525"},
	{"ID" : "559", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U663", "Parent" : "525"},
	{"ID" : "560", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U664", "Parent" : "525"},
	{"ID" : "561", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U665", "Parent" : "525"},
	{"ID" : "562", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U666", "Parent" : "525"},
	{"ID" : "563", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U667", "Parent" : "525"},
	{"ID" : "564", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U668", "Parent" : "525"},
	{"ID" : "565", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U669", "Parent" : "525"},
	{"ID" : "566", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U670", "Parent" : "525"},
	{"ID" : "567", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U671", "Parent" : "525"},
	{"ID" : "568", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U672", "Parent" : "525"},
	{"ID" : "569", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U673", "Parent" : "525"},
	{"ID" : "570", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U674", "Parent" : "525"},
	{"ID" : "571", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U675", "Parent" : "525"},
	{"ID" : "572", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U676", "Parent" : "525"},
	{"ID" : "573", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U677", "Parent" : "525"},
	{"ID" : "574", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U678", "Parent" : "525"},
	{"ID" : "575", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U679", "Parent" : "525"},
	{"ID" : "576", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U680", "Parent" : "525"},
	{"ID" : "577", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U681", "Parent" : "525"},
	{"ID" : "578", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U682", "Parent" : "525"},
	{"ID" : "579", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U683", "Parent" : "525"},
	{"ID" : "580", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U684", "Parent" : "525"},
	{"ID" : "581", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U685", "Parent" : "525"},
	{"ID" : "582", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U686", "Parent" : "525"},
	{"ID" : "583", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U687", "Parent" : "525"},
	{"ID" : "584", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U688", "Parent" : "525"},
	{"ID" : "585", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U689", "Parent" : "525"},
	{"ID" : "586", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U690", "Parent" : "525"},
	{"ID" : "587", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U691", "Parent" : "525"},
	{"ID" : "588", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U692", "Parent" : "525"},
	{"ID" : "589", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.PE_4_U0.kernel_1_am_addmul_24s_24s_8s_32_1_1_U693", "Parent" : "525"},
	{"ID" : "590", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.N_pipes_0_V_V_U", "Parent" : "0"},
	{"ID" : "591", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.N_pipes_reada_0_V_V_U", "Parent" : "0"},
	{"ID" : "592", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.N_pipes_reada_1_V_V_U", "Parent" : "0"},
	{"ID" : "593", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.a_pipes_1_0_V_V_U", "Parent" : "0"},
	{"ID" : "594", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.a_pipes_2_0_V_V_U", "Parent" : "0"},
	{"ID" : "595", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.a_pipes_3_0_V_V_U", "Parent" : "0"},
	{"ID" : "596", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.a_pipes_4_0_V_V_U", "Parent" : "0"},
	{"ID" : "597", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.N_pipes_1_V_V_U", "Parent" : "0"},
	{"ID" : "598", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.b_pipes_1_1_V_V_U", "Parent" : "0"},
	{"ID" : "599", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.b_pipes_2_1_V_V_U", "Parent" : "0"},
	{"ID" : "600", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.c_pipes_1_1_V_V_U", "Parent" : "0"},
	{"ID" : "601", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.c_pipes_2_1_V_V_U", "Parent" : "0"},
	{"ID" : "602", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.N_pipes_reada_2_V_V_U", "Parent" : "0"},
	{"ID" : "603", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.a_pipes_1_1_V_V_U", "Parent" : "0"},
	{"ID" : "604", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.a_pipes_2_1_V_V_U", "Parent" : "0"},
	{"ID" : "605", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.a_pipes_3_1_V_V_U", "Parent" : "0"},
	{"ID" : "606", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.a_pipes_4_1_V_V_U", "Parent" : "0"},
	{"ID" : "607", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.N_pipes_2_V_V_U", "Parent" : "0"},
	{"ID" : "608", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.b_pipes_1_2_V_V_U", "Parent" : "0"},
	{"ID" : "609", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.b_pipes_2_2_V_V_U", "Parent" : "0"},
	{"ID" : "610", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.c_pipes_1_2_V_V_U", "Parent" : "0"},
	{"ID" : "611", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.c_pipes_2_2_V_V_U", "Parent" : "0"},
	{"ID" : "612", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.N_pipes_reada_3_V_V_U", "Parent" : "0"},
	{"ID" : "613", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.a_pipes_1_2_V_V_U", "Parent" : "0"},
	{"ID" : "614", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.a_pipes_2_2_V_V_U", "Parent" : "0"},
	{"ID" : "615", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.a_pipes_3_2_V_V_U", "Parent" : "0"},
	{"ID" : "616", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.a_pipes_4_2_V_V_U", "Parent" : "0"},
	{"ID" : "617", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.N_pipes_3_V_V_U", "Parent" : "0"},
	{"ID" : "618", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.b_pipes_1_3_V_V_U", "Parent" : "0"},
	{"ID" : "619", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.b_pipes_2_3_V_V_U", "Parent" : "0"},
	{"ID" : "620", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.c_pipes_1_3_V_V_U", "Parent" : "0"},
	{"ID" : "621", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.c_pipes_2_3_V_V_U", "Parent" : "0"},
	{"ID" : "622", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.N_pipes_reada_4_V_V_U", "Parent" : "0"},
	{"ID" : "623", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.a_pipes_1_3_V_V_U", "Parent" : "0"},
	{"ID" : "624", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.a_pipes_2_3_V_V_U", "Parent" : "0"},
	{"ID" : "625", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.a_pipes_3_3_V_V_U", "Parent" : "0"},
	{"ID" : "626", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.a_pipes_4_3_V_V_U", "Parent" : "0"},
	{"ID" : "627", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.N_pipes_4_V_V_U", "Parent" : "0"},
	{"ID" : "628", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.b_pipes_1_4_V_V_U", "Parent" : "0"},
	{"ID" : "629", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.b_pipes_2_4_V_V_U", "Parent" : "0"},
	{"ID" : "630", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.c_pipes_1_4_V_V_U", "Parent" : "0"},
	{"ID" : "631", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.c_pipes_2_4_V_V_U", "Parent" : "0"},
	{"ID" : "632", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.N_pipes_reada_5_V_V_U", "Parent" : "0"},
	{"ID" : "633", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.a_pipes_1_4_V_V_U", "Parent" : "0"},
	{"ID" : "634", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.a_pipes_2_4_V_V_U", "Parent" : "0"},
	{"ID" : "635", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.a_pipes_3_4_V_V_U", "Parent" : "0"},
	{"ID" : "636", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.a_pipes_4_4_V_V_U", "Parent" : "0"},
	{"ID" : "637", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.N_pipes_5_V_V_U", "Parent" : "0"},
	{"ID" : "638", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.b_pipes_1_5_V_V_U", "Parent" : "0"},
	{"ID" : "639", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.b_pipes_2_5_V_V_U", "Parent" : "0"},
	{"ID" : "640", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.c_pipes_1_5_V_V_U", "Parent" : "0"},
	{"ID" : "641", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.c_pipes_2_5_V_V_U", "Parent" : "0"},
	{"ID" : "642", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.a_pipes_1_5_V_V_U", "Parent" : "0"},
	{"ID" : "643", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.a_pipes_2_5_V_V_U", "Parent" : "0"},
	{"ID" : "644", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.a_pipes_3_5_V_V_U", "Parent" : "0"},
	{"ID" : "645", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.a_pipes_4_5_V_V_U", "Parent" : "0"},
	{"ID" : "646", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_ReadA113128_U0_U", "Parent" : "0"},
	{"ID" : "647", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_ReadA115130_U0_U", "Parent" : "0"},
	{"ID" : "648", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_PE_3_U0_U", "Parent" : "0"},
	{"ID" : "649", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_ReadA117132_U0_U", "Parent" : "0"},
	{"ID" : "650", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_PE_2_U0_U", "Parent" : "0"},
	{"ID" : "651", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_ReadA119134_U0_U", "Parent" : "0"},
	{"ID" : "652", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_PE_1_U0_U", "Parent" : "0"},
	{"ID" : "653", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_ReadA121136_U0_U", "Parent" : "0"},
	{"ID" : "654", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_PE_U0_U", "Parent" : "0"},
	{"ID" : "655", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_ReadA123138_U0_U", "Parent" : "0"},
	{"ID" : "656", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_PE_4_U0_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	TILE125 {
		N_in_V_V2 {Type I LastRead 0 FirstWrite -1}
		b_in_1_V_V {Type I LastRead 2 FirstWrite -1}
		b_in_2_V_V {Type I LastRead 2 FirstWrite -1}
		c_out_1_V_V {Type O LastRead -1 FirstWrite 6}
		c_out_2_V_V7 {Type O LastRead -1 FirstWrite 6}
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
		weights_0_0_31 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_0 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_1 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_2 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_3 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_4 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_5 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_6 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_7 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_8 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_9 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_10 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_11 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_12 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_13 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_14 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_15 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_16 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_17 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_18 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_19 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_20 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_21 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_22 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_23 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_24 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_25 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_26 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_27 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_28 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_29 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_30 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_31 {Type I LastRead -1 FirstWrite -1}
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
		weights_0_2_31 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_0 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_1 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_2 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_3 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_4 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_5 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_6 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_7 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_8 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_9 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_10 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_11 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_12 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_13 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_14 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_15 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_16 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_17 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_18 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_19 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_20 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_21 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_22 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_23 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_24 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_25 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_26 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_27 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_28 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_29 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_30 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_31 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_0 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_1 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_2 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_3 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_4 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_5 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_6 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_7 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_8 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_9 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_10 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_11 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_12 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_13 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_14 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_15 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_16 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_17 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_18 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_19 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_20 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_21 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_22 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_23 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_24 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_25 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_26 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_27 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_28 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_29 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_30 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_31 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_0 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_1 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_2 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_3 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_4 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_5 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_6 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_7 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_8 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_9 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_10 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_11 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_12 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_13 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_14 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_15 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_16 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_17 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_18 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_19 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_20 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_21 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_22 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_23 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_24 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_25 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_26 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_27 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_28 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_29 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_30 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_31 {Type I LastRead -1 FirstWrite -1}}
	ReadN127 {
		N_in_V_V2 {Type I LastRead 0 FirstWrite -1}
		N_pipe_1_V_V {Type O LastRead -1 FirstWrite 0}
		N_pipe_2_V_V {Type O LastRead -1 FirstWrite 0}}
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
		weights_0_0_31 {Type I LastRead -1 FirstWrite -1}}
	PE114129 {
		N_pipe_in_V_V {Type I LastRead 0 FirstWrite -1}
		N_pipe_out_V_V7 {Type O LastRead -1 FirstWrite 0}
		a_in_1_V_V {Type I LastRead 2 FirstWrite -1}
		a_in_2_V_V {Type I LastRead 2 FirstWrite -1}
		a_in_3_V_V {Type I LastRead 2 FirstWrite -1}
		a_in_4_V_V {Type I LastRead 2 FirstWrite -1}
		b_in_1_V_V {Type I LastRead 2 FirstWrite -1}
		b_in_2_V_V {Type I LastRead 2 FirstWrite -1}
		b_out_1_V_V33 {Type O LastRead -1 FirstWrite 2}
		b_out_2_V_V39 {Type O LastRead -1 FirstWrite 2}
		c_out_1_V_V55 {Type O LastRead -1 FirstWrite 6}
		c_out_2_V_V60 {Type O LastRead -1 FirstWrite 6}}
	ReadA115130 {
		N_pipe_in_V_V1 {Type I LastRead 0 FirstWrite -1}
		N_pipe_out_V_V8 {Type O LastRead -1 FirstWrite 0}
		a_pipes_1_V_V13 {Type O LastRead -1 FirstWrite 2}
		a_pipes_2_V_V18 {Type O LastRead -1 FirstWrite 2}
		a_pipes_3_V_V23 {Type O LastRead -1 FirstWrite 2}
		a_pipes_4_V_V28 {Type O LastRead -1 FirstWrite 2}
		weights_0_1_0 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_1 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_2 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_3 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_4 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_5 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_6 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_7 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_8 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_9 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_10 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_11 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_12 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_13 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_14 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_15 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_16 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_17 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_18 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_19 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_20 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_21 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_22 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_23 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_24 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_25 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_26 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_27 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_28 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_29 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_30 {Type I LastRead -1 FirstWrite -1}
		weights_0_1_31 {Type I LastRead -1 FirstWrite -1}}
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
		c_out_2_2_V_V {Type O LastRead -1 FirstWrite 6}}
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
		weights_0_2_31 {Type I LastRead -1 FirstWrite -1}}
	PE_2 {
		N_pipe_in_2_V_V {Type I LastRead 0 FirstWrite -1}
		N_pipe_out_3_V_V {Type O LastRead -1 FirstWrite 0}
		a_in_1_2_V_V {Type I LastRead 2 FirstWrite -1}
		a_in_2_2_V_V {Type I LastRead 2 FirstWrite -1}
		a_in_3_2_V_V {Type I LastRead 2 FirstWrite -1}
		a_in_4_2_V_V {Type I LastRead 2 FirstWrite -1}
		b_in_1_2_V_V {Type I LastRead 2 FirstWrite -1}
		b_in_2_2_V_V {Type I LastRead 2 FirstWrite -1}
		b_out_1_3_V_V {Type O LastRead -1 FirstWrite 2}
		b_out_2_3_V_V {Type O LastRead -1 FirstWrite 2}
		c_in_1_2_V_V {Type I LastRead 5 FirstWrite -1}
		c_in_2_2_V_V {Type I LastRead 5 FirstWrite -1}
		c_out_1_3_V_V {Type O LastRead -1 FirstWrite 6}
		c_out_2_3_V_V {Type O LastRead -1 FirstWrite 6}}
	ReadA119134 {
		N_pipe_in_V_V3 {Type I LastRead 0 FirstWrite -1}
		N_pipe_out_V_V10 {Type O LastRead -1 FirstWrite 0}
		a_pipes_1_V_V15 {Type O LastRead -1 FirstWrite 2}
		a_pipes_2_V_V20 {Type O LastRead -1 FirstWrite 2}
		a_pipes_3_V_V25 {Type O LastRead -1 FirstWrite 2}
		a_pipes_4_V_V30 {Type O LastRead -1 FirstWrite 2}
		weights_0_3_0 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_1 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_2 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_3 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_4 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_5 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_6 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_7 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_8 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_9 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_10 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_11 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_12 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_13 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_14 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_15 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_16 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_17 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_18 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_19 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_20 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_21 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_22 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_23 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_24 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_25 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_26 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_27 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_28 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_29 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_30 {Type I LastRead -1 FirstWrite -1}
		weights_0_3_31 {Type I LastRead -1 FirstWrite -1}}
	PE_1 {
		N_pipe_in_3_V_V {Type I LastRead 0 FirstWrite -1}
		N_pipe_out_4_V_V {Type O LastRead -1 FirstWrite 0}
		a_in_1_3_V_V {Type I LastRead 2 FirstWrite -1}
		a_in_2_3_V_V {Type I LastRead 2 FirstWrite -1}
		a_in_3_3_V_V {Type I LastRead 2 FirstWrite -1}
		a_in_4_3_V_V {Type I LastRead 2 FirstWrite -1}
		b_in_1_3_V_V {Type I LastRead 2 FirstWrite -1}
		b_in_2_3_V_V {Type I LastRead 2 FirstWrite -1}
		b_out_1_4_V_V {Type O LastRead -1 FirstWrite 2}
		b_out_2_4_V_V {Type O LastRead -1 FirstWrite 2}
		c_in_1_3_V_V {Type I LastRead 5 FirstWrite -1}
		c_in_2_3_V_V {Type I LastRead 5 FirstWrite -1}
		c_out_1_4_V_V {Type O LastRead -1 FirstWrite 6}
		c_out_2_4_V_V {Type O LastRead -1 FirstWrite 6}}
	ReadA121136 {
		N_pipe_in_V_V4 {Type I LastRead 0 FirstWrite -1}
		N_pipe_out_V_V11 {Type O LastRead -1 FirstWrite 0}
		a_pipes_1_V_V16 {Type O LastRead -1 FirstWrite 2}
		a_pipes_2_V_V21 {Type O LastRead -1 FirstWrite 2}
		a_pipes_3_V_V26 {Type O LastRead -1 FirstWrite 2}
		a_pipes_4_V_V31 {Type O LastRead -1 FirstWrite 2}
		weights_0_4_0 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_1 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_2 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_3 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_4 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_5 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_6 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_7 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_8 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_9 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_10 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_11 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_12 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_13 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_14 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_15 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_16 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_17 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_18 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_19 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_20 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_21 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_22 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_23 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_24 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_25 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_26 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_27 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_28 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_29 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_30 {Type I LastRead -1 FirstWrite -1}
		weights_0_4_31 {Type I LastRead -1 FirstWrite -1}}
	PE {
		N_pipe_in_4_V_V {Type I LastRead 0 FirstWrite -1}
		N_pipe_out_5_V_V {Type O LastRead -1 FirstWrite 0}
		a_in_1_4_V_V {Type I LastRead 2 FirstWrite -1}
		a_in_2_4_V_V {Type I LastRead 2 FirstWrite -1}
		a_in_3_4_V_V {Type I LastRead 2 FirstWrite -1}
		a_in_4_4_V_V {Type I LastRead 2 FirstWrite -1}
		b_in_1_4_V_V {Type I LastRead 2 FirstWrite -1}
		b_in_2_4_V_V {Type I LastRead 2 FirstWrite -1}
		b_out_1_5_V_V {Type O LastRead -1 FirstWrite 2}
		b_out_2_5_V_V {Type O LastRead -1 FirstWrite 2}
		c_in_1_4_V_V {Type I LastRead 5 FirstWrite -1}
		c_in_2_4_V_V {Type I LastRead 5 FirstWrite -1}
		c_out_1_5_V_V {Type O LastRead -1 FirstWrite 6}
		c_out_2_5_V_V {Type O LastRead -1 FirstWrite 6}}
	ReadA123138 {
		N_pipe_in_V_V5 {Type I LastRead 0 FirstWrite -1}
		a_pipes_1_V_V17 {Type O LastRead -1 FirstWrite 2}
		a_pipes_2_V_V22 {Type O LastRead -1 FirstWrite 2}
		a_pipes_3_V_V27 {Type O LastRead -1 FirstWrite 2}
		a_pipes_4_V_V32 {Type O LastRead -1 FirstWrite 2}
		weights_0_5_0 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_1 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_2 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_3 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_4 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_5 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_6 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_7 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_8 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_9 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_10 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_11 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_12 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_13 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_14 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_15 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_16 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_17 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_18 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_19 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_20 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_21 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_22 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_23 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_24 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_25 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_26 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_27 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_28 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_29 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_30 {Type I LastRead -1 FirstWrite -1}
		weights_0_5_31 {Type I LastRead -1 FirstWrite -1}}
	PE_4 {
		N_pipe_in_5_V_V {Type I LastRead 0 FirstWrite -1}
		a_in_1_5_V_V {Type I LastRead 2 FirstWrite -1}
		a_in_2_5_V_V {Type I LastRead 2 FirstWrite -1}
		a_in_3_5_V_V {Type I LastRead 2 FirstWrite -1}
		a_in_4_5_V_V {Type I LastRead 2 FirstWrite -1}
		b_in_1_5_V_V {Type I LastRead 2 FirstWrite -1}
		b_in_2_5_V_V {Type I LastRead 2 FirstWrite -1}
		c_in_1_5_V_V {Type I LastRead 5 FirstWrite -1}
		c_in_2_5_V_V {Type I LastRead 5 FirstWrite -1}
		c_out_1_V_V {Type O LastRead -1 FirstWrite 6}
		c_out_2_V_V2 {Type O LastRead -1 FirstWrite 6}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "786", "Max" : "3145746"}
	, {"Name" : "Interval", "Min" : "775", "Max" : "3145735"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	N_in_V_V2 { ap_fifo {  { N_in_V_V2_dout fifo_data 0 32 }  { N_in_V_V2_empty_n fifo_status 0 1 }  { N_in_V_V2_read fifo_update 1 1 } } }
	b_in_1_V_V { ap_fifo {  { b_in_1_V_V_dout fifo_data 0 256 }  { b_in_1_V_V_empty_n fifo_status 0 1 }  { b_in_1_V_V_read fifo_update 1 1 } } }
	b_in_2_V_V { ap_fifo {  { b_in_2_V_V_dout fifo_data 0 256 }  { b_in_2_V_V_empty_n fifo_status 0 1 }  { b_in_2_V_V_read fifo_update 1 1 } } }
	c_out_1_V_V { ap_fifo {  { c_out_1_V_V_din fifo_data 1 32 }  { c_out_1_V_V_full_n fifo_status 0 1 }  { c_out_1_V_V_write fifo_update 1 1 } } }
	c_out_2_V_V7 { ap_fifo {  { c_out_2_V_V7_din fifo_data 1 32 }  { c_out_2_V_V7_full_n fifo_status 0 1 }  { c_out_2_V_V7_write fifo_update 1 1 } } }
}
