set moduleName galapagos_to_tcp_int
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type function
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set C_modelName {galapagos_to_tcp_int}
set C_modelType { void 0 }
set C_modelArgList {
	{ rxGalapagosBridge_V int 73 regular {fifo 0 volatile }  }
	{ txStatus_V_V int 17 regular {fifo 0 volatile }  }
	{ txMetaData_V int 32 regular {fifo 1 volatile }  }
	{ txData_V int 73 regular {fifo 1 volatile }  }
	{ state_out_V int 4 regular {pointer 1}  }
	{ header_out_V int 64 regular {pointer 1}  }
	{ size_out_V int 16 regular {pointer 1}  }
	{ sessionID_out_V int 16 regular {pointer 1}  }
	{ g2t_read_dest_V_V int 8 regular {fifo 1 volatile } {global 1}  }
	{ g2t_read_sid_V_V int 16 regular {fifo 0 volatile } {global 0}  }
	{ ip_table_V int 32 regular {array 256 { 1 3 } 1 1 } {global 0}  }
	{ ip_fifo_V_V int 32 regular {fifo 1 volatile } {global 1}  }
	{ sessionID_fifo_V_V int 16 regular {fifo 0 volatile } {global 0}  }
	{ g2t_write_sid_V_V int 16 regular {fifo 1 volatile } {global 1}  }
	{ g2t_write_dest_V_V int 8 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "rxGalapagosBridge_V", "interface" : "fifo", "bitwidth" : 73, "direction" : "READONLY"} , 
 	{ "Name" : "txStatus_V_V", "interface" : "fifo", "bitwidth" : 17, "direction" : "READONLY"} , 
 	{ "Name" : "txMetaData_V", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "txData_V", "interface" : "fifo", "bitwidth" : 73, "direction" : "WRITEONLY"} , 
 	{ "Name" : "state_out_V", "interface" : "wire", "bitwidth" : 4, "direction" : "WRITEONLY"} , 
 	{ "Name" : "header_out_V", "interface" : "wire", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "size_out_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "sessionID_out_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "g2t_read_dest_V_V", "interface" : "fifo", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "g2t_read_sid_V_V", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "ip_table_V", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "ip_table.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 255,"step" : 1}]}]}], "extern" : 0} , 
 	{ "Name" : "ip_fifo_V_V", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "sessionID_fifo_V_V", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "g2t_write_sid_V_V", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "g2t_write_dest_V_V", "interface" : "fifo", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 51
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ start_full_n sc_in sc_logic 1 signal -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ rxGalapagosBridge_V_dout sc_in sc_lv 73 signal 0 } 
	{ rxGalapagosBridge_V_empty_n sc_in sc_logic 1 signal 0 } 
	{ rxGalapagosBridge_V_read sc_out sc_logic 1 signal 0 } 
	{ txStatus_V_V_dout sc_in sc_lv 17 signal 1 } 
	{ txStatus_V_V_empty_n sc_in sc_logic 1 signal 1 } 
	{ txStatus_V_V_read sc_out sc_logic 1 signal 1 } 
	{ sessionID_fifo_V_V_dout sc_in sc_lv 16 signal 12 } 
	{ sessionID_fifo_V_V_empty_n sc_in sc_logic 1 signal 12 } 
	{ sessionID_fifo_V_V_read sc_out sc_logic 1 signal 12 } 
	{ g2t_read_sid_V_V_dout sc_in sc_lv 16 signal 9 } 
	{ g2t_read_sid_V_V_empty_n sc_in sc_logic 1 signal 9 } 
	{ g2t_read_sid_V_V_read sc_out sc_logic 1 signal 9 } 
	{ g2t_write_sid_V_V_din sc_out sc_lv 16 signal 13 } 
	{ g2t_write_sid_V_V_full_n sc_in sc_logic 1 signal 13 } 
	{ g2t_write_sid_V_V_write sc_out sc_logic 1 signal 13 } 
	{ g2t_write_dest_V_V_din sc_out sc_lv 8 signal 14 } 
	{ g2t_write_dest_V_V_full_n sc_in sc_logic 1 signal 14 } 
	{ g2t_write_dest_V_V_write sc_out sc_logic 1 signal 14 } 
	{ g2t_read_dest_V_V_din sc_out sc_lv 8 signal 8 } 
	{ g2t_read_dest_V_V_full_n sc_in sc_logic 1 signal 8 } 
	{ g2t_read_dest_V_V_write sc_out sc_logic 1 signal 8 } 
	{ txData_V_din sc_out sc_lv 73 signal 3 } 
	{ txData_V_full_n sc_in sc_logic 1 signal 3 } 
	{ txData_V_write sc_out sc_logic 1 signal 3 } 
	{ txMetaData_V_din sc_out sc_lv 32 signal 2 } 
	{ txMetaData_V_full_n sc_in sc_logic 1 signal 2 } 
	{ txMetaData_V_write sc_out sc_logic 1 signal 2 } 
	{ ip_fifo_V_V_din sc_out sc_lv 32 signal 11 } 
	{ ip_fifo_V_V_full_n sc_in sc_logic 1 signal 11 } 
	{ ip_fifo_V_V_write sc_out sc_logic 1 signal 11 } 
	{ start_out sc_out sc_logic 1 signal -1 } 
	{ start_write sc_out sc_logic 1 signal -1 } 
	{ state_out_V sc_out sc_lv 4 signal 4 } 
	{ state_out_V_ap_vld sc_out sc_logic 1 outvld 4 } 
	{ header_out_V sc_out sc_lv 64 signal 5 } 
	{ header_out_V_ap_vld sc_out sc_logic 1 outvld 5 } 
	{ size_out_V sc_out sc_lv 16 signal 6 } 
	{ size_out_V_ap_vld sc_out sc_logic 1 outvld 6 } 
	{ sessionID_out_V sc_out sc_lv 16 signal 7 } 
	{ sessionID_out_V_ap_vld sc_out sc_logic 1 outvld 7 } 
	{ ip_table_V_address0 sc_out sc_lv 8 signal 10 } 
	{ ip_table_V_ce0 sc_out sc_logic 1 signal 10 } 
	{ ip_table_V_q0 sc_in sc_lv 32 signal 10 } 
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
 	{ "name": "rxGalapagosBridge_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":73, "type": "signal", "bundle":{"name": "rxGalapagosBridge_V", "role": "dout" }} , 
 	{ "name": "rxGalapagosBridge_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rxGalapagosBridge_V", "role": "empty_n" }} , 
 	{ "name": "rxGalapagosBridge_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rxGalapagosBridge_V", "role": "read" }} , 
 	{ "name": "txStatus_V_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "txStatus_V_V", "role": "dout" }} , 
 	{ "name": "txStatus_V_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txStatus_V_V", "role": "empty_n" }} , 
 	{ "name": "txStatus_V_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txStatus_V_V", "role": "read" }} , 
 	{ "name": "sessionID_fifo_V_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sessionID_fifo_V_V", "role": "dout" }} , 
 	{ "name": "sessionID_fifo_V_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sessionID_fifo_V_V", "role": "empty_n" }} , 
 	{ "name": "sessionID_fifo_V_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "sessionID_fifo_V_V", "role": "read" }} , 
 	{ "name": "g2t_read_sid_V_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "g2t_read_sid_V_V", "role": "dout" }} , 
 	{ "name": "g2t_read_sid_V_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "g2t_read_sid_V_V", "role": "empty_n" }} , 
 	{ "name": "g2t_read_sid_V_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "g2t_read_sid_V_V", "role": "read" }} , 
 	{ "name": "g2t_write_sid_V_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "g2t_write_sid_V_V", "role": "din" }} , 
 	{ "name": "g2t_write_sid_V_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "g2t_write_sid_V_V", "role": "full_n" }} , 
 	{ "name": "g2t_write_sid_V_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "g2t_write_sid_V_V", "role": "write" }} , 
 	{ "name": "g2t_write_dest_V_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "g2t_write_dest_V_V", "role": "din" }} , 
 	{ "name": "g2t_write_dest_V_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "g2t_write_dest_V_V", "role": "full_n" }} , 
 	{ "name": "g2t_write_dest_V_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "g2t_write_dest_V_V", "role": "write" }} , 
 	{ "name": "g2t_read_dest_V_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "g2t_read_dest_V_V", "role": "din" }} , 
 	{ "name": "g2t_read_dest_V_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "g2t_read_dest_V_V", "role": "full_n" }} , 
 	{ "name": "g2t_read_dest_V_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "g2t_read_dest_V_V", "role": "write" }} , 
 	{ "name": "txData_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":73, "type": "signal", "bundle":{"name": "txData_V", "role": "din" }} , 
 	{ "name": "txData_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txData_V", "role": "full_n" }} , 
 	{ "name": "txData_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txData_V", "role": "write" }} , 
 	{ "name": "txMetaData_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "txMetaData_V", "role": "din" }} , 
 	{ "name": "txMetaData_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txMetaData_V", "role": "full_n" }} , 
 	{ "name": "txMetaData_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txMetaData_V", "role": "write" }} , 
 	{ "name": "ip_fifo_V_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ip_fifo_V_V", "role": "din" }} , 
 	{ "name": "ip_fifo_V_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ip_fifo_V_V", "role": "full_n" }} , 
 	{ "name": "ip_fifo_V_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ip_fifo_V_V", "role": "write" }} , 
 	{ "name": "start_out", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_out", "role": "default" }} , 
 	{ "name": "start_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_write", "role": "default" }} , 
 	{ "name": "state_out_V", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "state_out_V", "role": "default" }} , 
 	{ "name": "state_out_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "state_out_V", "role": "ap_vld" }} , 
 	{ "name": "header_out_V", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "header_out_V", "role": "default" }} , 
 	{ "name": "header_out_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "header_out_V", "role": "ap_vld" }} , 
 	{ "name": "size_out_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "size_out_V", "role": "default" }} , 
 	{ "name": "size_out_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "size_out_V", "role": "ap_vld" }} , 
 	{ "name": "sessionID_out_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sessionID_out_V", "role": "default" }} , 
 	{ "name": "sessionID_out_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "sessionID_out_V", "role": "ap_vld" }} , 
 	{ "name": "ip_table_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "ip_table_V", "role": "address0" }} , 
 	{ "name": "ip_table_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ip_table_V", "role": "ce0" }} , 
 	{ "name": "ip_table_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ip_table_V", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "galapagos_to_tcp_int",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "2", "EstimateLatencyMin" : "2", "EstimateLatencyMax" : "2",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"InDataflowNetwork" : "1",
		"Port" : [
			{"Name" : "rxGalapagosBridge_V", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "rxGalapagosBridge_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "txStatus_V_V", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "txStatus_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "txMetaData_V", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "txMetaData_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "txData_V", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "txData_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "state_out_V", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "header_out_V", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "size_out_V", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "sessionID_out_V", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "state_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "header_data_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dest_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "sessionID_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "header_keep_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "header_last_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "g2t_read_dest_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "g2t_read_dest_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "g2t_read_sid_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "g2t_read_sid_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "ip_table_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ip_fifo_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "ip_fifo_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "sessionID_fifo_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "sessionID_fifo_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "g2t_write_sid_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "g2t_write_sid_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "g2t_write_dest_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "g2t_write_dest_V_V_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	galapagos_to_tcp_int {
		rxGalapagosBridge_V {Type I LastRead 0 FirstWrite -1}
		txStatus_V_V {Type I LastRead 0 FirstWrite -1}
		txMetaData_V {Type O LastRead -1 FirstWrite 2}
		txData_V {Type O LastRead -1 FirstWrite 2}
		state_out_V {Type O LastRead -1 FirstWrite 0}
		header_out_V {Type O LastRead -1 FirstWrite 2}
		size_out_V {Type O LastRead -1 FirstWrite 2}
		sessionID_out_V {Type O LastRead -1 FirstWrite 2}
		state_1 {Type IO LastRead -1 FirstWrite -1}
		header_data_V {Type IO LastRead -1 FirstWrite -1}
		dest_V {Type IO LastRead -1 FirstWrite -1}
		sessionID_V {Type IO LastRead -1 FirstWrite -1}
		header_keep_V {Type IO LastRead -1 FirstWrite -1}
		header_last_V {Type IO LastRead -1 FirstWrite -1}
		g2t_read_dest_V_V {Type O LastRead -1 FirstWrite 1}
		g2t_read_sid_V_V {Type I LastRead 0 FirstWrite -1}
		ip_table_V {Type I LastRead 0 FirstWrite -1}
		ip_fifo_V_V {Type O LastRead -1 FirstWrite 2}
		sessionID_fifo_V_V {Type I LastRead 0 FirstWrite -1}
		g2t_write_sid_V_V {Type O LastRead -1 FirstWrite 1}
		g2t_write_dest_V_V {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "2"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	rxGalapagosBridge_V { ap_fifo {  { rxGalapagosBridge_V_dout fifo_data 0 73 }  { rxGalapagosBridge_V_empty_n fifo_status 0 1 }  { rxGalapagosBridge_V_read fifo_update 1 1 } } }
	txStatus_V_V { ap_fifo {  { txStatus_V_V_dout fifo_data 0 17 }  { txStatus_V_V_empty_n fifo_status 0 1 }  { txStatus_V_V_read fifo_update 1 1 } } }
	txMetaData_V { ap_fifo {  { txMetaData_V_din fifo_data 1 32 }  { txMetaData_V_full_n fifo_status 0 1 }  { txMetaData_V_write fifo_update 1 1 } } }
	txData_V { ap_fifo {  { txData_V_din fifo_data 1 73 }  { txData_V_full_n fifo_status 0 1 }  { txData_V_write fifo_update 1 1 } } }
	state_out_V { ap_vld {  { state_out_V out_data 1 4 }  { state_out_V_ap_vld out_vld 1 1 } } }
	header_out_V { ap_vld {  { header_out_V out_data 1 64 }  { header_out_V_ap_vld out_vld 1 1 } } }
	size_out_V { ap_vld {  { size_out_V out_data 1 16 }  { size_out_V_ap_vld out_vld 1 1 } } }
	sessionID_out_V { ap_vld {  { sessionID_out_V out_data 1 16 }  { sessionID_out_V_ap_vld out_vld 1 1 } } }
	g2t_read_dest_V_V { ap_fifo {  { g2t_read_dest_V_V_din fifo_data 1 8 }  { g2t_read_dest_V_V_full_n fifo_status 0 1 }  { g2t_read_dest_V_V_write fifo_update 1 1 } } }
	g2t_read_sid_V_V { ap_fifo {  { g2t_read_sid_V_V_dout fifo_data 0 16 }  { g2t_read_sid_V_V_empty_n fifo_status 0 1 }  { g2t_read_sid_V_V_read fifo_update 1 1 } } }
	ip_table_V { ap_memory {  { ip_table_V_address0 mem_address 1 8 }  { ip_table_V_ce0 mem_ce 1 1 }  { ip_table_V_q0 mem_dout 0 32 } } }
	ip_fifo_V_V { ap_fifo {  { ip_fifo_V_V_din fifo_data 1 32 }  { ip_fifo_V_V_full_n fifo_status 0 1 }  { ip_fifo_V_V_write fifo_update 1 1 } } }
	sessionID_fifo_V_V { ap_fifo {  { sessionID_fifo_V_V_dout fifo_data 0 16 }  { sessionID_fifo_V_V_empty_n fifo_status 0 1 }  { sessionID_fifo_V_V_read fifo_update 1 1 } } }
	g2t_write_sid_V_V { ap_fifo {  { g2t_write_sid_V_V_din fifo_data 1 16 }  { g2t_write_sid_V_V_full_n fifo_status 0 1 }  { g2t_write_sid_V_V_write fifo_update 1 1 } } }
	g2t_write_dest_V_V { ap_fifo {  { g2t_write_dest_V_V_din fifo_data 1 8 }  { g2t_write_dest_V_V_full_n fifo_status 0 1 }  { g2t_write_dest_V_V_write fifo_update 1 1 } } }
}
