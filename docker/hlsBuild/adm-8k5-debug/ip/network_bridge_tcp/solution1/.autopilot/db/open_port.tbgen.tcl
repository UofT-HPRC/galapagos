set moduleName open_port
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type function
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set C_modelName {open_port}
set C_modelType { void 0 }
set C_modelArgList {
	{ listenPort_V_V int 16 regular {fifo 1 volatile }  }
	{ listenPortStatus_V int 1 regular {fifo 0 volatile }  }
	{ notifications_V int 81 regular {fifo 0 volatile }  }
	{ readRequest_V int 32 regular {fifo 1 volatile }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "listenPort_V_V", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "listenPortStatus_V", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "notifications_V", "interface" : "fifo", "bitwidth" : 81, "direction" : "READONLY"} , 
 	{ "Name" : "readRequest_V", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 19
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ listenPortStatus_V_dout sc_in sc_logic 1 signal 1 } 
	{ listenPortStatus_V_empty_n sc_in sc_logic 1 signal 1 } 
	{ listenPortStatus_V_read sc_out sc_logic 1 signal 1 } 
	{ notifications_V_dout sc_in sc_lv 81 signal 2 } 
	{ notifications_V_empty_n sc_in sc_logic 1 signal 2 } 
	{ notifications_V_read sc_out sc_logic 1 signal 2 } 
	{ listenPort_V_V_din sc_out sc_lv 16 signal 0 } 
	{ listenPort_V_V_full_n sc_in sc_logic 1 signal 0 } 
	{ listenPort_V_V_write sc_out sc_logic 1 signal 0 } 
	{ readRequest_V_din sc_out sc_lv 32 signal 3 } 
	{ readRequest_V_full_n sc_in sc_logic 1 signal 3 } 
	{ readRequest_V_write sc_out sc_logic 1 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "listenPortStatus_V_dout", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "listenPortStatus_V", "role": "dout" }} , 
 	{ "name": "listenPortStatus_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "listenPortStatus_V", "role": "empty_n" }} , 
 	{ "name": "listenPortStatus_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "listenPortStatus_V", "role": "read" }} , 
 	{ "name": "notifications_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":81, "type": "signal", "bundle":{"name": "notifications_V", "role": "dout" }} , 
 	{ "name": "notifications_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "notifications_V", "role": "empty_n" }} , 
 	{ "name": "notifications_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "notifications_V", "role": "read" }} , 
 	{ "name": "listenPort_V_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "listenPort_V_V", "role": "din" }} , 
 	{ "name": "listenPort_V_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "listenPort_V_V", "role": "full_n" }} , 
 	{ "name": "listenPort_V_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "listenPort_V_V", "role": "write" }} , 
 	{ "name": "readRequest_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "readRequest_V", "role": "din" }} , 
 	{ "name": "readRequest_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "readRequest_V", "role": "full_n" }} , 
 	{ "name": "readRequest_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "readRequest_V", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "open_port",
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
			{"Name" : "listenPort_V_V", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "listenPort_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "listenPortStatus_V", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "listenPortStatus_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "notifications_V", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "notifications_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "readRequest_V", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "readRequest_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "listenDone", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "waitPortStatus", "Type" : "OVld", "Direction" : "IO"}]}]}


set ArgLastReadFirstWriteLatency {
	open_port {
		listenPort_V_V {Type O LastRead -1 FirstWrite 1}
		listenPortStatus_V {Type I LastRead 0 FirstWrite -1}
		notifications_V {Type I LastRead 0 FirstWrite -1}
		readRequest_V {Type O LastRead -1 FirstWrite 1}
		listenDone {Type IO LastRead -1 FirstWrite -1}
		waitPortStatus {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	listenPort_V_V { ap_fifo {  { listenPort_V_V_din fifo_data 1 16 }  { listenPort_V_V_full_n fifo_status 0 1 }  { listenPort_V_V_write fifo_update 1 1 } } }
	listenPortStatus_V { ap_fifo {  { listenPortStatus_V_dout fifo_data 0 1 }  { listenPortStatus_V_empty_n fifo_status 0 1 }  { listenPortStatus_V_read fifo_update 1 1 } } }
	notifications_V { ap_fifo {  { notifications_V_dout fifo_data 0 81 }  { notifications_V_empty_n fifo_status 0 1 }  { notifications_V_read fifo_update 1 1 } } }
	readRequest_V { ap_fifo {  { readRequest_V_din fifo_data 1 32 }  { readRequest_V_full_n fifo_status 0 1 }  { readRequest_V_write fifo_update 1 1 } } }
}
