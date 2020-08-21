set moduleName open_connections
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type function
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set C_modelName {open_connections}
set C_modelType { void 0 }
set C_modelArgList {
	{ openConnection_V int 48 regular {fifo 1 volatile }  }
	{ openConStatus_V int 17 regular {fifo 0 volatile }  }
	{ ip_fifo_V_V int 32 regular {fifo 0 volatile } {global 0}  }
	{ sessionID_fifo_V_V int 16 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "openConnection_V", "interface" : "fifo", "bitwidth" : 48, "direction" : "WRITEONLY"} , 
 	{ "Name" : "openConStatus_V", "interface" : "fifo", "bitwidth" : 17, "direction" : "READONLY"} , 
 	{ "Name" : "ip_fifo_V_V", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "sessionID_fifo_V_V", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} ]}
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
	{ ip_fifo_V_V_dout sc_in sc_lv 32 signal 2 } 
	{ ip_fifo_V_V_empty_n sc_in sc_logic 1 signal 2 } 
	{ ip_fifo_V_V_read sc_out sc_logic 1 signal 2 } 
	{ openConStatus_V_dout sc_in sc_lv 17 signal 1 } 
	{ openConStatus_V_empty_n sc_in sc_logic 1 signal 1 } 
	{ openConStatus_V_read sc_out sc_logic 1 signal 1 } 
	{ openConnection_V_din sc_out sc_lv 48 signal 0 } 
	{ openConnection_V_full_n sc_in sc_logic 1 signal 0 } 
	{ openConnection_V_write sc_out sc_logic 1 signal 0 } 
	{ sessionID_fifo_V_V_din sc_out sc_lv 16 signal 3 } 
	{ sessionID_fifo_V_V_full_n sc_in sc_logic 1 signal 3 } 
	{ sessionID_fifo_V_V_write sc_out sc_logic 1 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "ip_fifo_V_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ip_fifo_V_V", "role": "dout" }} , 
 	{ "name": "ip_fifo_V_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ip_fifo_V_V", "role": "empty_n" }} , 
 	{ "name": "ip_fifo_V_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ip_fifo_V_V", "role": "read" }} , 
 	{ "name": "openConStatus_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "openConStatus_V", "role": "dout" }} , 
 	{ "name": "openConStatus_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "openConStatus_V", "role": "empty_n" }} , 
 	{ "name": "openConStatus_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "openConStatus_V", "role": "read" }} , 
 	{ "name": "openConnection_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":48, "type": "signal", "bundle":{"name": "openConnection_V", "role": "din" }} , 
 	{ "name": "openConnection_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "openConnection_V", "role": "full_n" }} , 
 	{ "name": "openConnection_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "openConnection_V", "role": "write" }} , 
 	{ "name": "sessionID_fifo_V_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sessionID_fifo_V_V", "role": "din" }} , 
 	{ "name": "sessionID_fifo_V_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sessionID_fifo_V_V", "role": "full_n" }} , 
 	{ "name": "sessionID_fifo_V_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sessionID_fifo_V_V", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "open_connections",
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
			{"Name" : "openConnection_V", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "openConnection_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "openConStatus_V", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "openConStatus_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "ip_fifo_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "ip_fifo_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "wait_for_connection", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "sessionID_fifo_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "sessionID_fifo_V_V_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	open_connections {
		openConnection_V {Type O LastRead -1 FirstWrite 1}
		openConStatus_V {Type I LastRead 0 FirstWrite -1}
		ip_fifo_V_V {Type I LastRead 0 FirstWrite -1}
		wait_for_connection {Type IO LastRead -1 FirstWrite -1}
		sessionID_fifo_V_V {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	openConnection_V { ap_fifo {  { openConnection_V_din fifo_data 1 48 }  { openConnection_V_full_n fifo_status 0 1 }  { openConnection_V_write fifo_update 1 1 } } }
	openConStatus_V { ap_fifo {  { openConStatus_V_dout fifo_data 0 17 }  { openConStatus_V_empty_n fifo_status 0 1 }  { openConStatus_V_read fifo_update 1 1 } } }
	ip_fifo_V_V { ap_fifo {  { ip_fifo_V_V_dout fifo_data 0 32 }  { ip_fifo_V_V_empty_n fifo_status 0 1 }  { ip_fifo_V_V_read fifo_update 1 1 } } }
	sessionID_fifo_V_V { ap_fifo {  { sessionID_fifo_V_V_din fifo_data 1 16 }  { sessionID_fifo_V_V_full_n fifo_status 0 1 }  { sessionID_fifo_V_V_write fifo_update 1 1 } } }
}
