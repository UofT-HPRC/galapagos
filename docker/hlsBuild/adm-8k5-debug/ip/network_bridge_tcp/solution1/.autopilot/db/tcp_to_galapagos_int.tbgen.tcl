set moduleName tcp_to_galapagos_int
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type function
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set C_modelName {tcp_to_galapagos_int}
set C_modelType { void 0 }
set C_modelArgList {
	{ rxMetaData_V_V int 16 regular {fifo 0 volatile }  }
	{ rxData_V int 73 regular {fifo 0 volatile }  }
	{ txGalapagosBridge_V int 73 regular {fifo 1 volatile }  }
	{ t2g_read_dest_V_V int 8 regular {fifo 1 volatile } {global 1}  }
	{ t2g_read_sid_V_V int 16 regular {fifo 0 volatile } {global 0}  }
	{ t2g_write_dest_V_V int 8 regular {fifo 1 volatile } {global 1}  }
	{ t2g_write_sid_V_V int 16 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "rxMetaData_V_V", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "rxData_V", "interface" : "fifo", "bitwidth" : 73, "direction" : "READONLY"} , 
 	{ "Name" : "txGalapagosBridge_V", "interface" : "fifo", "bitwidth" : 73, "direction" : "WRITEONLY"} , 
 	{ "Name" : "t2g_read_dest_V_V", "interface" : "fifo", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "t2g_read_sid_V_V", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "t2g_write_dest_V_V", "interface" : "fifo", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "t2g_write_sid_V_V", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} ]}
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
	{ rxData_V_dout sc_in sc_lv 73 signal 1 } 
	{ rxData_V_empty_n sc_in sc_logic 1 signal 1 } 
	{ rxData_V_read sc_out sc_logic 1 signal 1 } 
	{ t2g_read_sid_V_V_dout sc_in sc_lv 16 signal 4 } 
	{ t2g_read_sid_V_V_empty_n sc_in sc_logic 1 signal 4 } 
	{ t2g_read_sid_V_V_read sc_out sc_logic 1 signal 4 } 
	{ rxMetaData_V_V_dout sc_in sc_lv 16 signal 0 } 
	{ rxMetaData_V_V_empty_n sc_in sc_logic 1 signal 0 } 
	{ rxMetaData_V_V_read sc_out sc_logic 1 signal 0 } 
	{ txGalapagosBridge_V_din sc_out sc_lv 73 signal 2 } 
	{ txGalapagosBridge_V_full_n sc_in sc_logic 1 signal 2 } 
	{ txGalapagosBridge_V_write sc_out sc_logic 1 signal 2 } 
	{ t2g_write_dest_V_V_din sc_out sc_lv 8 signal 5 } 
	{ t2g_write_dest_V_V_full_n sc_in sc_logic 1 signal 5 } 
	{ t2g_write_dest_V_V_write sc_out sc_logic 1 signal 5 } 
	{ t2g_write_sid_V_V_din sc_out sc_lv 16 signal 6 } 
	{ t2g_write_sid_V_V_full_n sc_in sc_logic 1 signal 6 } 
	{ t2g_write_sid_V_V_write sc_out sc_logic 1 signal 6 } 
	{ t2g_read_dest_V_V_din sc_out sc_lv 8 signal 3 } 
	{ t2g_read_dest_V_V_full_n sc_in sc_logic 1 signal 3 } 
	{ t2g_read_dest_V_V_write sc_out sc_logic 1 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "rxData_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":73, "type": "signal", "bundle":{"name": "rxData_V", "role": "dout" }} , 
 	{ "name": "rxData_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rxData_V", "role": "empty_n" }} , 
 	{ "name": "rxData_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rxData_V", "role": "read" }} , 
 	{ "name": "t2g_read_sid_V_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "t2g_read_sid_V_V", "role": "dout" }} , 
 	{ "name": "t2g_read_sid_V_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "t2g_read_sid_V_V", "role": "empty_n" }} , 
 	{ "name": "t2g_read_sid_V_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "t2g_read_sid_V_V", "role": "read" }} , 
 	{ "name": "rxMetaData_V_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rxMetaData_V_V", "role": "dout" }} , 
 	{ "name": "rxMetaData_V_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rxMetaData_V_V", "role": "empty_n" }} , 
 	{ "name": "rxMetaData_V_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rxMetaData_V_V", "role": "read" }} , 
 	{ "name": "txGalapagosBridge_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":73, "type": "signal", "bundle":{"name": "txGalapagosBridge_V", "role": "din" }} , 
 	{ "name": "txGalapagosBridge_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txGalapagosBridge_V", "role": "full_n" }} , 
 	{ "name": "txGalapagosBridge_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txGalapagosBridge_V", "role": "write" }} , 
 	{ "name": "t2g_write_dest_V_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "t2g_write_dest_V_V", "role": "din" }} , 
 	{ "name": "t2g_write_dest_V_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "t2g_write_dest_V_V", "role": "full_n" }} , 
 	{ "name": "t2g_write_dest_V_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "t2g_write_dest_V_V", "role": "write" }} , 
 	{ "name": "t2g_write_sid_V_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "t2g_write_sid_V_V", "role": "din" }} , 
 	{ "name": "t2g_write_sid_V_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "t2g_write_sid_V_V", "role": "full_n" }} , 
 	{ "name": "t2g_write_sid_V_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "t2g_write_sid_V_V", "role": "write" }} , 
 	{ "name": "t2g_read_dest_V_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "t2g_read_dest_V_V", "role": "din" }} , 
 	{ "name": "t2g_read_dest_V_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "t2g_read_dest_V_V", "role": "full_n" }} , 
 	{ "name": "t2g_read_dest_V_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "t2g_read_dest_V_V", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "tcp_to_galapagos_int",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"InDataflowNetwork" : "1",
		"Port" : [
			{"Name" : "rxMetaData_V_V", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "rxMetaData_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rxData_V", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "rxData_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "txGalapagosBridge_V", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "txGalapagosBridge_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "state", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "sessionID_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "currWord_data_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "currWord_keep_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "currWord_last_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "src_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "t2g_read_dest_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "t2g_read_dest_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "t2g_read_sid_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "t2g_read_sid_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "t2g_write_dest_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "t2g_write_dest_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "t2g_write_sid_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "t2g_write_sid_V_V_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	tcp_to_galapagos_int {
		rxMetaData_V_V {Type I LastRead 0 FirstWrite -1}
		rxData_V {Type I LastRead 0 FirstWrite -1}
		txGalapagosBridge_V {Type O LastRead -1 FirstWrite 1}
		state {Type IO LastRead -1 FirstWrite -1}
		sessionID_V_1 {Type IO LastRead -1 FirstWrite -1}
		currWord_data_V {Type IO LastRead -1 FirstWrite -1}
		currWord_keep_V {Type IO LastRead -1 FirstWrite -1}
		currWord_last_V {Type IO LastRead -1 FirstWrite -1}
		src_V {Type IO LastRead -1 FirstWrite -1}
		t2g_read_dest_V_V {Type O LastRead -1 FirstWrite 1}
		t2g_read_sid_V_V {Type I LastRead 0 FirstWrite -1}
		t2g_write_dest_V_V {Type O LastRead -1 FirstWrite 1}
		t2g_write_sid_V_V {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	rxMetaData_V_V { ap_fifo {  { rxMetaData_V_V_dout fifo_data 0 16 }  { rxMetaData_V_V_empty_n fifo_status 0 1 }  { rxMetaData_V_V_read fifo_update 1 1 } } }
	rxData_V { ap_fifo {  { rxData_V_dout fifo_data 0 73 }  { rxData_V_empty_n fifo_status 0 1 }  { rxData_V_read fifo_update 1 1 } } }
	txGalapagosBridge_V { ap_fifo {  { txGalapagosBridge_V_din fifo_data 1 73 }  { txGalapagosBridge_V_full_n fifo_status 0 1 }  { txGalapagosBridge_V_write fifo_update 1 1 } } }
	t2g_read_dest_V_V { ap_fifo {  { t2g_read_dest_V_V_din fifo_data 1 8 }  { t2g_read_dest_V_V_full_n fifo_status 0 1 }  { t2g_read_dest_V_V_write fifo_update 1 1 } } }
	t2g_read_sid_V_V { ap_fifo {  { t2g_read_sid_V_V_dout fifo_data 0 16 }  { t2g_read_sid_V_V_empty_n fifo_status 0 1 }  { t2g_read_sid_V_V_read fifo_update 1 1 } } }
	t2g_write_dest_V_V { ap_fifo {  { t2g_write_dest_V_V_din fifo_data 1 8 }  { t2g_write_dest_V_V_full_n fifo_status 0 1 }  { t2g_write_dest_V_V_write fifo_update 1 1 } } }
	t2g_write_sid_V_V { ap_fifo {  { t2g_write_sid_V_V_din fifo_data 1 16 }  { t2g_write_sid_V_V_full_n fifo_status 0 1 }  { t2g_write_sid_V_V_write fifo_update 1 1 } } }
}
