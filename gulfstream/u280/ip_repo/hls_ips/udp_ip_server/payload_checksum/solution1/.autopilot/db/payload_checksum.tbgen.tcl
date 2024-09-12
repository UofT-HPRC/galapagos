set moduleName payload_checksum
set isTopModule 1
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isFreeRunPipelineModule 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_none
set isOneStateSeq 1
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {payload_checksum}
set C_modelType { void 0 }
set C_modelArgList {
	{ payload_in_data_V int 512 regular  }
	{ payload_in_valid_V int 1 regular  }
	{ payload_in_last_V int 1 regular  }
	{ payload_length_data_V int 16 regular  }
	{ payload_length_valid_V int 1 regular  }
	{ payload_out_data_V int 512 regular {pointer 1}  }
	{ payload_out_keep_V int 64 regular {pointer 1}  }
	{ payload_out_valid_V int 1 regular {pointer 1}  }
	{ payload_out_last_V int 1 regular {pointer 1}  }
	{ checksum_data_V int 32 regular {pointer 1}  }
	{ checksum_valid_V int 1 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "payload_in_data_V", "interface" : "wire", "bitwidth" : 512, "direction" : "READONLY", "bitSlice":[{"low":0,"up":511,"cElement": [{"cName": "payload_in.data.V","cData": "uint512","bit_use": { "low": 0,"up": 511},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "payload_in_valid_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "payload_in.valid.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "payload_in_last_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "payload_in.last.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "payload_length_data_V", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "payload_length.data.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "payload_length_valid_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "payload_length.valid.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "payload_out_data_V", "interface" : "wire", "bitwidth" : 512, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":511,"cElement": [{"cName": "payload_out.data.V","cData": "uint512","bit_use": { "low": 0,"up": 511},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "payload_out_keep_V", "interface" : "wire", "bitwidth" : 64, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "payload_out.keep.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "payload_out_valid_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "payload_out.valid.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "payload_out_last_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "payload_out.last.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "checksum_data_V", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "checksum.data.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "checksum_valid_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "checksum.valid.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} ]}
# RTL Port declarations: 
set portNum 13
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ payload_in_data_V sc_in sc_lv 512 signal 0 } 
	{ payload_in_valid_V sc_in sc_lv 1 signal 1 } 
	{ payload_in_last_V sc_in sc_lv 1 signal 2 } 
	{ payload_length_data_V sc_in sc_lv 16 signal 3 } 
	{ payload_length_valid_V sc_in sc_lv 1 signal 4 } 
	{ payload_out_data_V sc_out sc_lv 512 signal 5 } 
	{ payload_out_keep_V sc_out sc_lv 64 signal 6 } 
	{ payload_out_valid_V sc_out sc_lv 1 signal 7 } 
	{ payload_out_last_V sc_out sc_lv 1 signal 8 } 
	{ checksum_data_V sc_out sc_lv 32 signal 9 } 
	{ checksum_valid_V sc_out sc_lv 1 signal 10 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "payload_in_data_V", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "payload_in_data_V", "role": "default" }} , 
 	{ "name": "payload_in_valid_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "payload_in_valid_V", "role": "default" }} , 
 	{ "name": "payload_in_last_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "payload_in_last_V", "role": "default" }} , 
 	{ "name": "payload_length_data_V", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "payload_length_data_V", "role": "default" }} , 
 	{ "name": "payload_length_valid_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "payload_length_valid_V", "role": "default" }} , 
 	{ "name": "payload_out_data_V", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "payload_out_data_V", "role": "default" }} , 
 	{ "name": "payload_out_keep_V", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "payload_out_keep_V", "role": "default" }} , 
 	{ "name": "payload_out_valid_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "payload_out_valid_V", "role": "default" }} , 
 	{ "name": "payload_out_last_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "payload_out_last_V", "role": "default" }} , 
 	{ "name": "checksum_data_V", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "checksum_data_V", "role": "default" }} , 
 	{ "name": "checksum_valid_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "checksum_valid_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "payload_checksum",
		"Protocol" : "ap_ctrl_none",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "payload_in_data_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "payload_in_valid_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "payload_in_last_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "payload_length_data_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "payload_length_valid_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "payload_out_data_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "payload_out_keep_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "payload_out_valid_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "payload_out_last_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "checksum_data_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "checksum_valid_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "checksum_reg_data_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "checksum_reg_valid_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "last_l5_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "valid_l5_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_lastCycle_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l5_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l4_V_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l4_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "last_l4_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "valid_l4_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l3_V_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l3_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l3_V_2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l3_V_3", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "last_l3_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "valid_l3_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l2_V_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l2_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l2_V_2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l2_V_3", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l2_V_4", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l2_V_5", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l2_V_6", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l2_V_7", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "last_l2_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "valid_l2_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l1_V_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l1_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l1_V_2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l1_V_3", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l1_V_4", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l1_V_5", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l1_V_6", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l1_V_7", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l1_V_8", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l1_V_9", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l1_V_10", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l1_V_11", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l1_V_12", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l1_V_13", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l1_V_14", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l1_V_15", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "last_l1_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "valid_l1_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_3", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_4", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_5", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_6", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_7", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_8", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_9", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_10", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_11", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_12", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_13", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_14", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_15", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_16", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_17", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_18", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_19", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_20", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_21", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_22", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_23", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_24", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_25", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_26", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_27", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_28", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_29", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_30", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "adderTree_l0_V_31", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "last_l0_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "valid_l0_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "keep_reg_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "data_reg_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "valid_reg_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "last_reg_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "payload_in_reg_data_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "payload_length_reg_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "payload_in_reg_valid", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "payload_in_reg_last_s", "Type" : "OVld", "Direction" : "IO"}]}]}


set ArgLastReadFirstWriteLatency {
	payload_checksum {
		payload_in_data_V {Type I LastRead 0 FirstWrite -1}
		payload_in_valid_V {Type I LastRead 0 FirstWrite -1}
		payload_in_last_V {Type I LastRead 0 FirstWrite -1}
		payload_length_data_V {Type I LastRead 0 FirstWrite -1}
		payload_length_valid_V {Type I LastRead 0 FirstWrite -1}
		payload_out_data_V {Type O LastRead -1 FirstWrite 0}
		payload_out_keep_V {Type O LastRead -1 FirstWrite 0}
		payload_out_valid_V {Type O LastRead -1 FirstWrite 0}
		payload_out_last_V {Type O LastRead -1 FirstWrite 0}
		checksum_data_V {Type O LastRead -1 FirstWrite 0}
		checksum_valid_V {Type O LastRead -1 FirstWrite 0}
		checksum_reg_data_V {Type IO LastRead -1 FirstWrite -1}
		checksum_reg_valid_V {Type IO LastRead -1 FirstWrite -1}
		last_l5_V {Type IO LastRead -1 FirstWrite -1}
		valid_l5_V {Type IO LastRead -1 FirstWrite -1}
		adderTree_lastCycle_s {Type IO LastRead -1 FirstWrite -1}
		adderTree_l5_V {Type IO LastRead -1 FirstWrite -1}
		adderTree_l4_V_0 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l4_V_1 {Type IO LastRead -1 FirstWrite -1}
		last_l4_V {Type IO LastRead -1 FirstWrite -1}
		valid_l4_V {Type IO LastRead -1 FirstWrite -1}
		adderTree_l3_V_0 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l3_V_1 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l3_V_2 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l3_V_3 {Type IO LastRead -1 FirstWrite -1}
		last_l3_V {Type IO LastRead -1 FirstWrite -1}
		valid_l3_V {Type IO LastRead -1 FirstWrite -1}
		adderTree_l2_V_0 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l2_V_1 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l2_V_2 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l2_V_3 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l2_V_4 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l2_V_5 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l2_V_6 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l2_V_7 {Type IO LastRead -1 FirstWrite -1}
		last_l2_V {Type IO LastRead -1 FirstWrite -1}
		valid_l2_V {Type IO LastRead -1 FirstWrite -1}
		adderTree_l1_V_0 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l1_V_1 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l1_V_2 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l1_V_3 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l1_V_4 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l1_V_5 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l1_V_6 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l1_V_7 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l1_V_8 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l1_V_9 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l1_V_10 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l1_V_11 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l1_V_12 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l1_V_13 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l1_V_14 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l1_V_15 {Type IO LastRead -1 FirstWrite -1}
		last_l1_V {Type IO LastRead -1 FirstWrite -1}
		valid_l1_V {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_0 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_1 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_2 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_3 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_4 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_5 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_6 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_7 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_8 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_9 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_10 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_11 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_12 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_13 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_14 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_15 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_16 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_17 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_18 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_19 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_20 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_21 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_22 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_23 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_24 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_25 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_26 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_27 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_28 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_29 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_30 {Type IO LastRead -1 FirstWrite -1}
		adderTree_l0_V_31 {Type IO LastRead -1 FirstWrite -1}
		last_l0_V {Type IO LastRead -1 FirstWrite -1}
		valid_l0_V {Type IO LastRead -1 FirstWrite -1}
		keep_reg_V {Type IO LastRead -1 FirstWrite -1}
		data_reg_V {Type IO LastRead -1 FirstWrite -1}
		valid_reg_V {Type IO LastRead -1 FirstWrite -1}
		last_reg_V {Type IO LastRead -1 FirstWrite -1}
		payload_in_reg_data_s {Type IO LastRead -1 FirstWrite -1}
		payload_length_reg_V {Type IO LastRead -1 FirstWrite -1}
		payload_in_reg_valid {Type IO LastRead -1 FirstWrite -1}
		payload_in_reg_last_s {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "0", "Max" : "0"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	payload_in_data_V { ap_none {  { payload_in_data_V in_data 0 512 } } }
	payload_in_valid_V { ap_none {  { payload_in_valid_V in_data 0 1 } } }
	payload_in_last_V { ap_none {  { payload_in_last_V in_data 0 1 } } }
	payload_length_data_V { ap_none {  { payload_length_data_V in_data 0 16 } } }
	payload_length_valid_V { ap_none {  { payload_length_valid_V in_data 0 1 } } }
	payload_out_data_V { ap_none {  { payload_out_data_V out_data 1 512 } } }
	payload_out_keep_V { ap_none {  { payload_out_keep_V out_data 1 64 } } }
	payload_out_valid_V { ap_none {  { payload_out_valid_V out_data 1 1 } } }
	payload_out_last_V { ap_none {  { payload_out_last_V out_data 1 1 } } }
	checksum_data_V { ap_none {  { checksum_data_V out_data 1 32 } } }
	checksum_valid_V { ap_none {  { checksum_valid_V out_data 1 1 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
