set moduleName axis2lbus
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
set C_modelName {axis2lbus}
set C_modelType { void 0 }
set C_modelArgList {
	{ s_axis_data_V int 512 regular  }
	{ s_axis_keep_V int 64 regular  }
	{ s_axis_last_V int 1 regular  }
	{ s_axis_valid_V int 1 regular  }
	{ lbus_0_data_V int 128 regular {pointer 1}  }
	{ lbus_1_data_V int 128 regular {pointer 1}  }
	{ lbus_2_data_V int 128 regular {pointer 1}  }
	{ lbus_3_data_V int 128 regular {pointer 1}  }
	{ lbus_0_ena_V int 1 regular {pointer 1}  }
	{ lbus_1_ena_V int 1 regular {pointer 1}  }
	{ lbus_2_ena_V int 1 regular {pointer 1}  }
	{ lbus_3_ena_V int 1 regular {pointer 1}  }
	{ lbus_0_sop_V int 1 regular {pointer 1}  }
	{ lbus_1_sop_V int 1 regular {pointer 1}  }
	{ lbus_2_sop_V int 1 regular {pointer 1}  }
	{ lbus_3_sop_V int 1 regular {pointer 1}  }
	{ lbus_0_eop_V int 1 regular {pointer 1}  }
	{ lbus_1_eop_V int 1 regular {pointer 1}  }
	{ lbus_2_eop_V int 1 regular {pointer 1}  }
	{ lbus_3_eop_V int 1 regular {pointer 1}  }
	{ lbus_0_err_V int 1 regular {pointer 1}  }
	{ lbus_1_err_V int 1 regular {pointer 1}  }
	{ lbus_2_err_V int 1 regular {pointer 1}  }
	{ lbus_3_err_V int 1 regular {pointer 1}  }
	{ lbus_0_mty_V int 4 regular {pointer 1}  }
	{ lbus_1_mty_V int 4 regular {pointer 1}  }
	{ lbus_2_mty_V int 4 regular {pointer 1}  }
	{ lbus_3_mty_V int 4 regular {pointer 1}  }
	{ lbus_ready_V int 1 regular  }
	{ axis_ready_V int 1 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "s_axis_data_V", "interface" : "wire", "bitwidth" : 512, "direction" : "READONLY", "bitSlice":[{"low":0,"up":511,"cElement": [{"cName": "s_axis.data.V","cData": "uint512","bit_use": { "low": 0,"up": 511},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "s_axis_keep_V", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "s_axis.keep.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "s_axis_last_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "s_axis.last.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "s_axis_valid_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "s_axis.valid.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "lbus_0_data_V", "interface" : "wire", "bitwidth" : 128, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":127,"cElement": [{"cName": "lbus.data.V","cData": "uint128","bit_use": { "low": 0,"up": 127},"cArray": [{"low" : 0,"up" : 0,"step" : 2}]}]}]} , 
 	{ "Name" : "lbus_1_data_V", "interface" : "wire", "bitwidth" : 128, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":127,"cElement": [{"cName": "lbus.data.V","cData": "uint128","bit_use": { "low": 0,"up": 127},"cArray": [{"low" : 1,"up" : 1,"step" : 2}]}]}]} , 
 	{ "Name" : "lbus_2_data_V", "interface" : "wire", "bitwidth" : 128, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":127,"cElement": [{"cName": "lbus.data.V","cData": "uint128","bit_use": { "low": 0,"up": 127},"cArray": [{"low" : 2,"up" : 2,"step" : 2}]}]}]} , 
 	{ "Name" : "lbus_3_data_V", "interface" : "wire", "bitwidth" : 128, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":127,"cElement": [{"cName": "lbus.data.V","cData": "uint128","bit_use": { "low": 0,"up": 127},"cArray": [{"low" : 3,"up" : 3,"step" : 2}]}]}]} , 
 	{ "Name" : "lbus_0_ena_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "lbus.ena.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 2}]}]}]} , 
 	{ "Name" : "lbus_1_ena_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "lbus.ena.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 1,"up" : 1,"step" : 2}]}]}]} , 
 	{ "Name" : "lbus_2_ena_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "lbus.ena.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 2,"up" : 2,"step" : 2}]}]}]} , 
 	{ "Name" : "lbus_3_ena_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "lbus.ena.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 3,"up" : 3,"step" : 2}]}]}]} , 
 	{ "Name" : "lbus_0_sop_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "lbus.sop.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 2}]}]}]} , 
 	{ "Name" : "lbus_1_sop_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "lbus.sop.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 1,"up" : 1,"step" : 2}]}]}]} , 
 	{ "Name" : "lbus_2_sop_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "lbus.sop.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 2,"up" : 2,"step" : 2}]}]}]} , 
 	{ "Name" : "lbus_3_sop_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "lbus.sop.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 3,"up" : 3,"step" : 2}]}]}]} , 
 	{ "Name" : "lbus_0_eop_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "lbus.eop.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 2}]}]}]} , 
 	{ "Name" : "lbus_1_eop_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "lbus.eop.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 1,"up" : 1,"step" : 2}]}]}]} , 
 	{ "Name" : "lbus_2_eop_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "lbus.eop.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 2,"up" : 2,"step" : 2}]}]}]} , 
 	{ "Name" : "lbus_3_eop_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "lbus.eop.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 3,"up" : 3,"step" : 2}]}]}]} , 
 	{ "Name" : "lbus_0_err_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "lbus.err.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 2}]}]}]} , 
 	{ "Name" : "lbus_1_err_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "lbus.err.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 1,"up" : 1,"step" : 2}]}]}]} , 
 	{ "Name" : "lbus_2_err_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "lbus.err.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 2,"up" : 2,"step" : 2}]}]}]} , 
 	{ "Name" : "lbus_3_err_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "lbus.err.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 3,"up" : 3,"step" : 2}]}]}]} , 
 	{ "Name" : "lbus_0_mty_V", "interface" : "wire", "bitwidth" : 4, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":3,"cElement": [{"cName": "lbus.mty.V","cData": "uint4","bit_use": { "low": 0,"up": 3},"cArray": [{"low" : 0,"up" : 0,"step" : 2}]}]}]} , 
 	{ "Name" : "lbus_1_mty_V", "interface" : "wire", "bitwidth" : 4, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":3,"cElement": [{"cName": "lbus.mty.V","cData": "uint4","bit_use": { "low": 0,"up": 3},"cArray": [{"low" : 1,"up" : 1,"step" : 2}]}]}]} , 
 	{ "Name" : "lbus_2_mty_V", "interface" : "wire", "bitwidth" : 4, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":3,"cElement": [{"cName": "lbus.mty.V","cData": "uint4","bit_use": { "low": 0,"up": 3},"cArray": [{"low" : 2,"up" : 2,"step" : 2}]}]}]} , 
 	{ "Name" : "lbus_3_mty_V", "interface" : "wire", "bitwidth" : 4, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":3,"cElement": [{"cName": "lbus.mty.V","cData": "uint4","bit_use": { "low": 0,"up": 3},"cArray": [{"low" : 3,"up" : 3,"step" : 2}]}]}]} , 
 	{ "Name" : "lbus_ready_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "lbus_ready.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "axis_ready_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "axis_ready.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} ]}
# RTL Port declarations: 
set portNum 32
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ s_axis_data_V sc_in sc_lv 512 signal 0 } 
	{ s_axis_keep_V sc_in sc_lv 64 signal 1 } 
	{ s_axis_last_V sc_in sc_lv 1 signal 2 } 
	{ s_axis_valid_V sc_in sc_lv 1 signal 3 } 
	{ lbus_0_data_V sc_out sc_lv 128 signal 4 } 
	{ lbus_1_data_V sc_out sc_lv 128 signal 5 } 
	{ lbus_2_data_V sc_out sc_lv 128 signal 6 } 
	{ lbus_3_data_V sc_out sc_lv 128 signal 7 } 
	{ lbus_0_ena_V sc_out sc_lv 1 signal 8 } 
	{ lbus_1_ena_V sc_out sc_lv 1 signal 9 } 
	{ lbus_2_ena_V sc_out sc_lv 1 signal 10 } 
	{ lbus_3_ena_V sc_out sc_lv 1 signal 11 } 
	{ lbus_0_sop_V sc_out sc_lv 1 signal 12 } 
	{ lbus_1_sop_V sc_out sc_lv 1 signal 13 } 
	{ lbus_2_sop_V sc_out sc_lv 1 signal 14 } 
	{ lbus_3_sop_V sc_out sc_lv 1 signal 15 } 
	{ lbus_0_eop_V sc_out sc_lv 1 signal 16 } 
	{ lbus_1_eop_V sc_out sc_lv 1 signal 17 } 
	{ lbus_2_eop_V sc_out sc_lv 1 signal 18 } 
	{ lbus_3_eop_V sc_out sc_lv 1 signal 19 } 
	{ lbus_0_err_V sc_out sc_lv 1 signal 20 } 
	{ lbus_1_err_V sc_out sc_lv 1 signal 21 } 
	{ lbus_2_err_V sc_out sc_lv 1 signal 22 } 
	{ lbus_3_err_V sc_out sc_lv 1 signal 23 } 
	{ lbus_0_mty_V sc_out sc_lv 4 signal 24 } 
	{ lbus_1_mty_V sc_out sc_lv 4 signal 25 } 
	{ lbus_2_mty_V sc_out sc_lv 4 signal 26 } 
	{ lbus_3_mty_V sc_out sc_lv 4 signal 27 } 
	{ lbus_ready_V sc_in sc_lv 1 signal 28 } 
	{ axis_ready_V sc_out sc_lv 1 signal 29 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "s_axis_data_V", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "s_axis_data_V", "role": "default" }} , 
 	{ "name": "s_axis_keep_V", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "s_axis_keep_V", "role": "default" }} , 
 	{ "name": "s_axis_last_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_axis_last_V", "role": "default" }} , 
 	{ "name": "s_axis_valid_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_axis_valid_V", "role": "default" }} , 
 	{ "name": "lbus_0_data_V", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "lbus_0_data_V", "role": "default" }} , 
 	{ "name": "lbus_1_data_V", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "lbus_1_data_V", "role": "default" }} , 
 	{ "name": "lbus_2_data_V", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "lbus_2_data_V", "role": "default" }} , 
 	{ "name": "lbus_3_data_V", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "lbus_3_data_V", "role": "default" }} , 
 	{ "name": "lbus_0_ena_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "lbus_0_ena_V", "role": "default" }} , 
 	{ "name": "lbus_1_ena_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "lbus_1_ena_V", "role": "default" }} , 
 	{ "name": "lbus_2_ena_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "lbus_2_ena_V", "role": "default" }} , 
 	{ "name": "lbus_3_ena_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "lbus_3_ena_V", "role": "default" }} , 
 	{ "name": "lbus_0_sop_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "lbus_0_sop_V", "role": "default" }} , 
 	{ "name": "lbus_1_sop_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "lbus_1_sop_V", "role": "default" }} , 
 	{ "name": "lbus_2_sop_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "lbus_2_sop_V", "role": "default" }} , 
 	{ "name": "lbus_3_sop_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "lbus_3_sop_V", "role": "default" }} , 
 	{ "name": "lbus_0_eop_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "lbus_0_eop_V", "role": "default" }} , 
 	{ "name": "lbus_1_eop_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "lbus_1_eop_V", "role": "default" }} , 
 	{ "name": "lbus_2_eop_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "lbus_2_eop_V", "role": "default" }} , 
 	{ "name": "lbus_3_eop_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "lbus_3_eop_V", "role": "default" }} , 
 	{ "name": "lbus_0_err_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "lbus_0_err_V", "role": "default" }} , 
 	{ "name": "lbus_1_err_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "lbus_1_err_V", "role": "default" }} , 
 	{ "name": "lbus_2_err_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "lbus_2_err_V", "role": "default" }} , 
 	{ "name": "lbus_3_err_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "lbus_3_err_V", "role": "default" }} , 
 	{ "name": "lbus_0_mty_V", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "lbus_0_mty_V", "role": "default" }} , 
 	{ "name": "lbus_1_mty_V", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "lbus_1_mty_V", "role": "default" }} , 
 	{ "name": "lbus_2_mty_V", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "lbus_2_mty_V", "role": "default" }} , 
 	{ "name": "lbus_3_mty_V", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "lbus_3_mty_V", "role": "default" }} , 
 	{ "name": "lbus_ready_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "lbus_ready_V", "role": "default" }} , 
 	{ "name": "axis_ready_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "axis_ready_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "axis2lbus",
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
			{"Name" : "s_axis_data_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "s_axis_keep_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "s_axis_last_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "s_axis_valid_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "lbus_0_data_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "lbus_1_data_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "lbus_2_data_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "lbus_3_data_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "lbus_0_ena_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "lbus_1_ena_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "lbus_2_ena_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "lbus_3_ena_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "lbus_0_sop_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "lbus_1_sop_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "lbus_2_sop_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "lbus_3_sop_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "lbus_0_eop_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "lbus_1_eop_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "lbus_2_eop_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "lbus_3_eop_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "lbus_0_err_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "lbus_1_err_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "lbus_2_err_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "lbus_3_err_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "lbus_0_mty_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "lbus_1_mty_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "lbus_2_mty_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "lbus_3_mty_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "lbus_ready_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "axis_ready_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "IN_PACKET_V", "Type" : "OVld", "Direction" : "IO"}]}]}


set ArgLastReadFirstWriteLatency {
	axis2lbus {
		s_axis_data_V {Type I LastRead 0 FirstWrite -1}
		s_axis_keep_V {Type I LastRead 0 FirstWrite -1}
		s_axis_last_V {Type I LastRead 0 FirstWrite -1}
		s_axis_valid_V {Type I LastRead 0 FirstWrite -1}
		lbus_0_data_V {Type O LastRead -1 FirstWrite 0}
		lbus_1_data_V {Type O LastRead -1 FirstWrite 0}
		lbus_2_data_V {Type O LastRead -1 FirstWrite 0}
		lbus_3_data_V {Type O LastRead -1 FirstWrite 0}
		lbus_0_ena_V {Type O LastRead -1 FirstWrite 0}
		lbus_1_ena_V {Type O LastRead -1 FirstWrite 0}
		lbus_2_ena_V {Type O LastRead -1 FirstWrite 0}
		lbus_3_ena_V {Type O LastRead -1 FirstWrite 0}
		lbus_0_sop_V {Type O LastRead -1 FirstWrite 0}
		lbus_1_sop_V {Type O LastRead -1 FirstWrite 0}
		lbus_2_sop_V {Type O LastRead -1 FirstWrite 0}
		lbus_3_sop_V {Type O LastRead -1 FirstWrite 0}
		lbus_0_eop_V {Type O LastRead -1 FirstWrite 0}
		lbus_1_eop_V {Type O LastRead -1 FirstWrite 0}
		lbus_2_eop_V {Type O LastRead -1 FirstWrite 0}
		lbus_3_eop_V {Type O LastRead -1 FirstWrite 0}
		lbus_0_err_V {Type O LastRead -1 FirstWrite 0}
		lbus_1_err_V {Type O LastRead -1 FirstWrite 0}
		lbus_2_err_V {Type O LastRead -1 FirstWrite 0}
		lbus_3_err_V {Type O LastRead -1 FirstWrite 0}
		lbus_0_mty_V {Type O LastRead -1 FirstWrite 0}
		lbus_1_mty_V {Type O LastRead -1 FirstWrite 0}
		lbus_2_mty_V {Type O LastRead -1 FirstWrite 0}
		lbus_3_mty_V {Type O LastRead -1 FirstWrite 0}
		lbus_ready_V {Type I LastRead 0 FirstWrite -1}
		axis_ready_V {Type O LastRead -1 FirstWrite 0}
		IN_PACKET_V {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "0", "Max" : "0"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	s_axis_data_V { ap_none {  { s_axis_data_V in_data 0 512 } } }
	s_axis_keep_V { ap_none {  { s_axis_keep_V in_data 0 64 } } }
	s_axis_last_V { ap_none {  { s_axis_last_V in_data 0 1 } } }
	s_axis_valid_V { ap_none {  { s_axis_valid_V in_data 0 1 } } }
	lbus_0_data_V { ap_none {  { lbus_0_data_V out_data 1 128 } } }
	lbus_1_data_V { ap_none {  { lbus_1_data_V out_data 1 128 } } }
	lbus_2_data_V { ap_none {  { lbus_2_data_V out_data 1 128 } } }
	lbus_3_data_V { ap_none {  { lbus_3_data_V out_data 1 128 } } }
	lbus_0_ena_V { ap_none {  { lbus_0_ena_V out_data 1 1 } } }
	lbus_1_ena_V { ap_none {  { lbus_1_ena_V out_data 1 1 } } }
	lbus_2_ena_V { ap_none {  { lbus_2_ena_V out_data 1 1 } } }
	lbus_3_ena_V { ap_none {  { lbus_3_ena_V out_data 1 1 } } }
	lbus_0_sop_V { ap_none {  { lbus_0_sop_V out_data 1 1 } } }
	lbus_1_sop_V { ap_none {  { lbus_1_sop_V out_data 1 1 } } }
	lbus_2_sop_V { ap_none {  { lbus_2_sop_V out_data 1 1 } } }
	lbus_3_sop_V { ap_none {  { lbus_3_sop_V out_data 1 1 } } }
	lbus_0_eop_V { ap_none {  { lbus_0_eop_V out_data 1 1 } } }
	lbus_1_eop_V { ap_none {  { lbus_1_eop_V out_data 1 1 } } }
	lbus_2_eop_V { ap_none {  { lbus_2_eop_V out_data 1 1 } } }
	lbus_3_eop_V { ap_none {  { lbus_3_eop_V out_data 1 1 } } }
	lbus_0_err_V { ap_none {  { lbus_0_err_V out_data 1 1 } } }
	lbus_1_err_V { ap_none {  { lbus_1_err_V out_data 1 1 } } }
	lbus_2_err_V { ap_none {  { lbus_2_err_V out_data 1 1 } } }
	lbus_3_err_V { ap_none {  { lbus_3_err_V out_data 1 1 } } }
	lbus_0_mty_V { ap_none {  { lbus_0_mty_V out_data 1 4 } } }
	lbus_1_mty_V { ap_none {  { lbus_1_mty_V out_data 1 4 } } }
	lbus_2_mty_V { ap_none {  { lbus_2_mty_V out_data 1 4 } } }
	lbus_3_mty_V { ap_none {  { lbus_3_mty_V out_data 1 4 } } }
	lbus_ready_V { ap_none {  { lbus_ready_V in_data 0 1 } } }
	axis_ready_V { ap_none {  { axis_ready_V out_data 1 1 } } }
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
