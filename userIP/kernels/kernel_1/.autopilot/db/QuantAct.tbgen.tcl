set moduleName QuantAct
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
set C_modelName {QuantAct}
set C_modelType { void 0 }
set C_modelArgList {
	{ in_V_data_V int 512 regular {fifo 0 volatile }  }
	{ in_V_id_V int 8 regular {fifo 0 volatile }  }
	{ in_V_dest_V int 8 regular {fifo 0 volatile }  }
	{ in_V_user_V int 16 regular {fifo 0 volatile }  }
	{ in_V_last_V int 1 regular {fifo 0 volatile }  }
	{ out_V_data_V int 512 regular {axi_s 1 volatile  { out_r Data } }  }
	{ out_V_id_V int 8 regular {axi_s 1 volatile  { out_r ID } }  }
	{ out_V_dest_V int 8 regular {axi_s 1 volatile  { out_r Dest } }  }
	{ out_V_user_V int 16 regular {axi_s 1 volatile  { out_r User } }  }
	{ out_V_last_V int 1 regular {axi_s 1 volatile  { out_r Last } }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "in_V_data_V", "interface" : "fifo", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "in_V_id_V", "interface" : "fifo", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "in_V_dest_V", "interface" : "fifo", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "in_V_user_V", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "in_V_last_V", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "out_V_data_V", "interface" : "axis", "bitwidth" : 512, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_V_id_V", "interface" : "axis", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_V_dest_V", "interface" : "axis", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_V_user_V", "interface" : "axis", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 29
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ in_V_data_V_dout sc_in sc_lv 512 signal 0 } 
	{ in_V_data_V_empty_n sc_in sc_logic 1 signal 0 } 
	{ in_V_data_V_read sc_out sc_logic 1 signal 0 } 
	{ in_V_id_V_dout sc_in sc_lv 8 signal 1 } 
	{ in_V_id_V_empty_n sc_in sc_logic 1 signal 1 } 
	{ in_V_id_V_read sc_out sc_logic 1 signal 1 } 
	{ in_V_dest_V_dout sc_in sc_lv 8 signal 2 } 
	{ in_V_dest_V_empty_n sc_in sc_logic 1 signal 2 } 
	{ in_V_dest_V_read sc_out sc_logic 1 signal 2 } 
	{ in_V_user_V_dout sc_in sc_lv 16 signal 3 } 
	{ in_V_user_V_empty_n sc_in sc_logic 1 signal 3 } 
	{ in_V_user_V_read sc_out sc_logic 1 signal 3 } 
	{ in_V_last_V_dout sc_in sc_lv 1 signal 4 } 
	{ in_V_last_V_empty_n sc_in sc_logic 1 signal 4 } 
	{ in_V_last_V_read sc_out sc_logic 1 signal 4 } 
	{ out_r_TDATA sc_out sc_lv 512 signal 5 } 
	{ out_r_TVALID sc_out sc_logic 1 outvld 9 } 
	{ out_r_TREADY sc_in sc_logic 1 outacc 5 } 
	{ out_r_TID sc_out sc_lv 8 signal 6 } 
	{ out_r_TDEST sc_out sc_lv 8 signal 7 } 
	{ out_r_TUSER sc_out sc_lv 16 signal 8 } 
	{ out_r_TLAST sc_out sc_lv 1 signal 9 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "in_V_data_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "in_V_data_V", "role": "dout" }} , 
 	{ "name": "in_V_data_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_V_data_V", "role": "empty_n" }} , 
 	{ "name": "in_V_data_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_V_data_V", "role": "read" }} , 
 	{ "name": "in_V_id_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "in_V_id_V", "role": "dout" }} , 
 	{ "name": "in_V_id_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_V_id_V", "role": "empty_n" }} , 
 	{ "name": "in_V_id_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_V_id_V", "role": "read" }} , 
 	{ "name": "in_V_dest_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "in_V_dest_V", "role": "dout" }} , 
 	{ "name": "in_V_dest_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_V_dest_V", "role": "empty_n" }} , 
 	{ "name": "in_V_dest_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_V_dest_V", "role": "read" }} , 
 	{ "name": "in_V_user_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "in_V_user_V", "role": "dout" }} , 
 	{ "name": "in_V_user_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_V_user_V", "role": "empty_n" }} , 
 	{ "name": "in_V_user_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_V_user_V", "role": "read" }} , 
 	{ "name": "in_V_last_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_V_last_V", "role": "dout" }} , 
 	{ "name": "in_V_last_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_V_last_V", "role": "empty_n" }} , 
 	{ "name": "in_V_last_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "in_V_last_V", "role": "read" }} , 
 	{ "name": "out_r_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "out_V_data_V", "role": "default" }} , 
 	{ "name": "out_r_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "out_V_last_V", "role": "default" }} , 
 	{ "name": "out_r_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "out_V_data_V", "role": "default" }} , 
 	{ "name": "out_r_TID", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "out_V_id_V", "role": "default" }} , 
 	{ "name": "out_r_TDEST", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "out_V_dest_V", "role": "default" }} , 
 	{ "name": "out_r_TUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "out_V_user_V", "role": "default" }} , 
 	{ "name": "out_r_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_V_last_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32"],
		"CDFG" : "QuantAct",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "55", "EstimateLatencyMax" : "24583",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "in_V_data_V", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "in_V_data_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "in_V_id_V", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "in_V_id_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "in_V_dest_V", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "in_V_dest_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "in_V_user_V", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "in_V_user_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "in_V_last_V", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "in_V_last_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "out_V_data_V", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "out_r_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "out_V_id_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "out_V_dest_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "out_V_user_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "out_V_last_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "m_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "m_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "m_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "m_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "m_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "m_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "m_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "m_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "m_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "m_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "m_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "m_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "m_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "m_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "m_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "m_15", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "e_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "e_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "e_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "e_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "e_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "e_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "e_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "e_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "e_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "e_9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "e_10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "e_11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "e_12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "e_13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "e_14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "e_15", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.m_0_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.m_1_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.m_2_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.m_3_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.m_4_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.m_5_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.m_6_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.m_7_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.m_8_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.m_9_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.m_10_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.m_11_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.m_12_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.m_13_U", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.m_14_U", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.m_15_U", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.e_0_U", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.e_1_U", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.e_2_U", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.e_3_U", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.e_4_U", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.e_5_U", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.e_6_U", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.e_7_U", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.e_8_U", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.e_9_U", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.e_10_U", "Parent" : "0"},
	{"ID" : "28", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.e_11_U", "Parent" : "0"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.e_12_U", "Parent" : "0"},
	{"ID" : "30", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.e_13_U", "Parent" : "0"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.e_14_U", "Parent" : "0"},
	{"ID" : "32", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.e_15_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	QuantAct {
		in_V_data_V {Type I LastRead 3 FirstWrite -1}
		in_V_id_V {Type I LastRead 3 FirstWrite -1}
		in_V_dest_V {Type I LastRead 3 FirstWrite -1}
		in_V_user_V {Type I LastRead 3 FirstWrite -1}
		in_V_last_V {Type I LastRead 3 FirstWrite -1}
		out_V_data_V {Type O LastRead -1 FirstWrite 0}
		out_V_id_V {Type O LastRead -1 FirstWrite 0}
		out_V_dest_V {Type O LastRead -1 FirstWrite 0}
		out_V_user_V {Type O LastRead -1 FirstWrite 0}
		out_V_last_V {Type O LastRead -1 FirstWrite 0}
		m_0 {Type I LastRead -1 FirstWrite -1}
		m_1 {Type I LastRead -1 FirstWrite -1}
		m_2 {Type I LastRead -1 FirstWrite -1}
		m_3 {Type I LastRead -1 FirstWrite -1}
		m_4 {Type I LastRead -1 FirstWrite -1}
		m_5 {Type I LastRead -1 FirstWrite -1}
		m_6 {Type I LastRead -1 FirstWrite -1}
		m_7 {Type I LastRead -1 FirstWrite -1}
		m_8 {Type I LastRead -1 FirstWrite -1}
		m_9 {Type I LastRead -1 FirstWrite -1}
		m_10 {Type I LastRead -1 FirstWrite -1}
		m_11 {Type I LastRead -1 FirstWrite -1}
		m_12 {Type I LastRead -1 FirstWrite -1}
		m_13 {Type I LastRead -1 FirstWrite -1}
		m_14 {Type I LastRead -1 FirstWrite -1}
		m_15 {Type I LastRead -1 FirstWrite -1}
		e_0 {Type I LastRead -1 FirstWrite -1}
		e_1 {Type I LastRead -1 FirstWrite -1}
		e_2 {Type I LastRead -1 FirstWrite -1}
		e_3 {Type I LastRead -1 FirstWrite -1}
		e_4 {Type I LastRead -1 FirstWrite -1}
		e_5 {Type I LastRead -1 FirstWrite -1}
		e_6 {Type I LastRead -1 FirstWrite -1}
		e_7 {Type I LastRead -1 FirstWrite -1}
		e_8 {Type I LastRead -1 FirstWrite -1}
		e_9 {Type I LastRead -1 FirstWrite -1}
		e_10 {Type I LastRead -1 FirstWrite -1}
		e_11 {Type I LastRead -1 FirstWrite -1}
		e_12 {Type I LastRead -1 FirstWrite -1}
		e_13 {Type I LastRead -1 FirstWrite -1}
		e_14 {Type I LastRead -1 FirstWrite -1}
		e_15 {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "55", "Max" : "24583"}
	, {"Name" : "Interval", "Min" : "55", "Max" : "24583"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	in_V_data_V { ap_fifo {  { in_V_data_V_dout fifo_data 0 512 }  { in_V_data_V_empty_n fifo_status 0 1 }  { in_V_data_V_read fifo_update 1 1 } } }
	in_V_id_V { ap_fifo {  { in_V_id_V_dout fifo_data 0 8 }  { in_V_id_V_empty_n fifo_status 0 1 }  { in_V_id_V_read fifo_update 1 1 } } }
	in_V_dest_V { ap_fifo {  { in_V_dest_V_dout fifo_data 0 8 }  { in_V_dest_V_empty_n fifo_status 0 1 }  { in_V_dest_V_read fifo_update 1 1 } } }
	in_V_user_V { ap_fifo {  { in_V_user_V_dout fifo_data 0 16 }  { in_V_user_V_empty_n fifo_status 0 1 }  { in_V_user_V_read fifo_update 1 1 } } }
	in_V_last_V { ap_fifo {  { in_V_last_V_dout fifo_data 0 1 }  { in_V_last_V_empty_n fifo_status 0 1 }  { in_V_last_V_read fifo_update 1 1 } } }
	out_V_data_V { axis {  { out_r_TDATA out_data 1 512 }  { out_r_TREADY out_acc 0 1 } } }
	out_V_id_V { axis {  { out_r_TID out_data 1 8 } } }
	out_V_dest_V { axis {  { out_r_TDEST out_data 1 8 } } }
	out_V_user_V { axis {  { out_r_TUSER out_data 1 16 } } }
	out_V_last_V { axis {  { out_r_TVALID out_vld 1 1 }  { out_r_TLAST out_data 1 1 } } }
}
