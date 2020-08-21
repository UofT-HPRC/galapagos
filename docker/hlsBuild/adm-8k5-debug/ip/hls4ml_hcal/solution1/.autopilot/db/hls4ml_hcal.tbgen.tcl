set C_TypeInfoList {{ 
"hls4ml_hcal" : [[], { "return": [[], "void"]} , [{"ExternC" : 0}], [ {"id": [[], {"scalar": "short"}] }, {"in": [[],{ "pointer": "0"}] }, {"out": [[],{ "pointer": "0"}] }],[],""], 
"0": [ "galapagos_interface", {"typedef": [[[],"1"],""]}], 
"1": [ "stream<galapagos::stream_packet<64> >", {"hls_type": {"stream": [[[[],"2"]],"3"]}}], 
"2": [ "stream_packet<64>", {"struct": [[],[{"T":[[], {"scalar": { "int": 64}}]}],[{ "data": [[], "4"]},{ "dest": [[], "5"]},{ "last": [[], "6"]},{ "id": [[], "5"]},{ "keep": [[], "5"]}],"7"]}], 
"4": [ "ap_uint<64>", {"hls_type": {"ap_uint": [[[[], {"scalar": { "int": 64}}]],""]}}], 
"5": [ "ap_uint<8>", {"hls_type": {"ap_uint": [[[[], {"scalar": { "int": 8}}]],""]}}], 
"6": [ "ap_uint<1>", {"hls_type": {"ap_uint": [[[[], {"scalar": { "int": 1}}]],""]}}],
"3": ["hls", ""],
"7": ["galapagos", ""]
}}
set moduleName hls4ml_hcal
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_none
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set C_modelName {hls4ml_hcal}
set C_modelType { void 0 }
set C_modelArgList {
	{ id int 16 regular  }
	{ in_V_data_V int 64 regular {axi_s 0 volatile  { in_r Data } }  }
	{ in_V_dest_V int 8 regular {axi_s 0 volatile  { in_r Dest } }  }
	{ in_V_last_V int 1 regular {axi_s 0 volatile  { in_r Last } }  }
	{ in_V_id_V int 8 regular {axi_s 0 volatile  { in_r ID } }  }
	{ in_V_keep_V int 8 regular {axi_s 0 volatile  { in_r Keep } }  }
	{ out_V_data_V int 64 regular {axi_s 1 volatile  { out_r Data } }  }
	{ out_V_dest_V int 8 regular {axi_s 1 volatile  { out_r Dest } }  }
	{ out_V_last_V int 1 regular {axi_s 1 volatile  { out_r Last } }  }
	{ out_V_id_V int 8 regular {axi_s 1 volatile  { out_r ID } }  }
	{ out_V_keep_V int 8 regular {axi_s 1 volatile  { out_r Keep } }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "id", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "id","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "in_V_data_V", "interface" : "axis", "bitwidth" : 64, "direction" : "READONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "in.V.data.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "in_V_dest_V", "interface" : "axis", "bitwidth" : 8, "direction" : "READONLY", "bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "in.V.dest.V","cData": "uint8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "in_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "in.V.last.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "in_V_id_V", "interface" : "axis", "bitwidth" : 8, "direction" : "READONLY", "bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "in.V.id.V","cData": "uint8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "in_V_keep_V", "interface" : "axis", "bitwidth" : 8, "direction" : "READONLY", "bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "in.V.keep.V","cData": "uint8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "out_V_data_V", "interface" : "axis", "bitwidth" : 64, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "out.V.data.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "out_V_dest_V", "interface" : "axis", "bitwidth" : 8, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "out.V.dest.V","cData": "uint8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "out_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "out.V.last.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "out_V_id_V", "interface" : "axis", "bitwidth" : 8, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "out.V.id.V","cData": "uint8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "out_V_keep_V", "interface" : "axis", "bitwidth" : 8, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "out.V.keep.V","cData": "uint8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} ]}
# RTL Port declarations: 
set portNum 17
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ id sc_in sc_lv 16 signal 0 } 
	{ in_r_TDATA sc_in sc_lv 64 signal 1 } 
	{ in_r_TVALID sc_in sc_logic 1 invld 5 } 
	{ in_r_TREADY sc_out sc_logic 1 inacc 5 } 
	{ in_r_TDEST sc_in sc_lv 8 signal 2 } 
	{ in_r_TLAST sc_in sc_lv 1 signal 3 } 
	{ in_r_TID sc_in sc_lv 8 signal 4 } 
	{ in_r_TKEEP sc_in sc_lv 8 signal 5 } 
	{ out_r_TDATA sc_out sc_lv 64 signal 6 } 
	{ out_r_TVALID sc_out sc_logic 1 outvld 10 } 
	{ out_r_TREADY sc_in sc_logic 1 outacc 10 } 
	{ out_r_TDEST sc_out sc_lv 8 signal 7 } 
	{ out_r_TLAST sc_out sc_lv 1 signal 8 } 
	{ out_r_TID sc_out sc_lv 8 signal 9 } 
	{ out_r_TKEEP sc_out sc_lv 8 signal 10 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "id", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "id", "role": "default" }} , 
 	{ "name": "in_r_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "in_V_data_V", "role": "default" }} , 
 	{ "name": "in_r_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "in_V_keep_V", "role": "default" }} , 
 	{ "name": "in_r_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "in_V_keep_V", "role": "default" }} , 
 	{ "name": "in_r_TDEST", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "in_V_dest_V", "role": "default" }} , 
 	{ "name": "in_r_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_V_last_V", "role": "default" }} , 
 	{ "name": "in_r_TID", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "in_V_id_V", "role": "default" }} , 
 	{ "name": "in_r_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "in_V_keep_V", "role": "default" }} , 
 	{ "name": "out_r_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "out_V_data_V", "role": "default" }} , 
 	{ "name": "out_r_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "out_V_keep_V", "role": "default" }} , 
 	{ "name": "out_r_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "out_V_keep_V", "role": "default" }} , 
 	{ "name": "out_r_TDEST", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "out_V_dest_V", "role": "default" }} , 
 	{ "name": "out_r_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_V_last_V", "role": "default" }} , 
 	{ "name": "out_r_TID", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "out_V_id_V", "role": "default" }} , 
 	{ "name": "out_r_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "out_V_keep_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "302"],
		"CDFG" : "hls4ml_hcal",
		"Protocol" : "ap_ctrl_none",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"InDataflowNetwork" : "0",
		"Port" : [
			{"Name" : "id", "Type" : "None", "Direction" : "I"},
			{"Name" : "in_V_data_V", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "in_r_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "in_V_dest_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "in_V_last_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "in_V_id_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "in_V_keep_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "out_V_data_V", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "out_r_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "out_V_dest_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "out_V_last_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "out_V_id_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "out_V_keep_V", "Type" : "Axis", "Direction" : "O"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_0_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_1_V_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_2_V_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_3_V_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_4_V_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_5_V_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_6_V_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_7_V_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_8_V_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_9_V_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_10_V_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_11_V_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_12_V_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_13_V_U", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_14_V_U", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_15_V_U", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_16_V_U", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_17_V_U", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_18_V_U", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_19_V_U", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_20_V_U", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_21_V_U", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_22_V_U", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_23_V_U", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_24_V_U", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_25_V_U", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_26_V_U", "Parent" : "0"},
	{"ID" : "28", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_27_V_U", "Parent" : "0"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_28_V_U", "Parent" : "0"},
	{"ID" : "30", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_buf_29_V_U", "Parent" : "0"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.out_buf_0_V_U", "Parent" : "0"},
	{"ID" : "32", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.out_buf_1_V_U", "Parent" : "0"},
	{"ID" : "33", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.out_buf_2_V_U", "Parent" : "0"},
	{"ID" : "34", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.out_buf_3_V_U", "Parent" : "0"},
	{"ID" : "35", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.out_buf_4_V_U", "Parent" : "0"},
	{"ID" : "36", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.out_buf_5_V_U", "Parent" : "0"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.out_buf_6_V_U", "Parent" : "0"},
	{"ID" : "38", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.out_buf_7_V_U", "Parent" : "0"},
	{"ID" : "39", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.out_buf_8_V_U", "Parent" : "0"},
	{"ID" : "40", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.out_buf_9_V_U", "Parent" : "0"},
	{"ID" : "41", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.out_buf_10_V_U", "Parent" : "0"},
	{"ID" : "42", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.out_buf_11_V_U", "Parent" : "0"},
	{"ID" : "43", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.out_buf_12_V_U", "Parent" : "0"},
	{"ID" : "44", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.out_buf_13_V_U", "Parent" : "0"},
	{"ID" : "45", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.out_buf_14_V_U", "Parent" : "0"},
	{"ID" : "46", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.out_buf_15_V_U", "Parent" : "0"},
	{"ID" : "47", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.out_buf_16_V_U", "Parent" : "0"},
	{"ID" : "48", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.out_buf_17_V_U", "Parent" : "0"},
	{"ID" : "49", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.out_buf_18_V_U", "Parent" : "0"},
	{"ID" : "50", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.out_buf_19_V_U", "Parent" : "0"},
	{"ID" : "51", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.out_buf_20_V_U", "Parent" : "0"},
	{"ID" : "52", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.out_buf_21_V_U", "Parent" : "0"},
	{"ID" : "53", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.out_buf_22_V_U", "Parent" : "0"},
	{"ID" : "54", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.out_buf_23_V_U", "Parent" : "0"},
	{"ID" : "55", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.out_buf_24_V_U", "Parent" : "0"},
	{"ID" : "56", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.out_buf_25_V_U", "Parent" : "0"},
	{"ID" : "57", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.out_buf_26_V_U", "Parent" : "0"},
	{"ID" : "58", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.out_buf_27_V_U", "Parent" : "0"},
	{"ID" : "59", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.out_buf_28_V_U", "Parent" : "0"},
	{"ID" : "60", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.out_buf_29_V_U", "Parent" : "0"},
	{"ID" : "61", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641", "Parent" : "0", "Child" : ["62", "223", "294", "299", "300", "301"],
		"CDFG" : "ereg_v1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "6",
		"VariableLatency" : "0", "ExactLatency" : "23", "EstimateLatencyMin" : "23", "EstimateLatencyMax" : "23",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"InDataflowNetwork" : "0",
		"Port" : [
			{"Name" : "data_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "62", "SubInstance" : "grp_compute_layer_0_0_0_1_fu_102", "Port" : "data_V"}]},
			{"Name" : "data_V1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "62", "SubInstance" : "grp_compute_layer_0_0_0_1_fu_102", "Port" : "data_V1"}]},
			{"Name" : "data_V2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "62", "SubInstance" : "grp_compute_layer_0_0_0_1_fu_102", "Port" : "data_V2"}]},
			{"Name" : "data_V3", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "62", "SubInstance" : "grp_compute_layer_0_0_0_1_fu_102", "Port" : "data_V3"}]},
			{"Name" : "data_V4", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "62", "SubInstance" : "grp_compute_layer_0_0_0_1_fu_102", "Port" : "data_V4"}]},
			{"Name" : "data_V5", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "62", "SubInstance" : "grp_compute_layer_0_0_0_1_fu_102", "Port" : "data_V5"}]},
			{"Name" : "data_V6", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "62", "SubInstance" : "grp_compute_layer_0_0_0_1_fu_102", "Port" : "data_V6"}]},
			{"Name" : "data_V7", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "62", "SubInstance" : "grp_compute_layer_0_0_0_1_fu_102", "Port" : "data_V7"}]},
			{"Name" : "data_V8", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "62", "SubInstance" : "grp_compute_layer_0_0_0_1_fu_102", "Port" : "data_V8"}]},
			{"Name" : "data_V9", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "62", "SubInstance" : "grp_compute_layer_0_0_0_1_fu_102", "Port" : "data_V9"}]},
			{"Name" : "data_V10", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "62", "SubInstance" : "grp_compute_layer_0_0_0_1_fu_102", "Port" : "data_V10"}]},
			{"Name" : "data_V11", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "62", "SubInstance" : "grp_compute_layer_0_0_0_1_fu_102", "Port" : "data_V11"}]},
			{"Name" : "data_V12", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "62", "SubInstance" : "grp_compute_layer_0_0_0_1_fu_102", "Port" : "data_V12"}]},
			{"Name" : "data_V13", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "62", "SubInstance" : "grp_compute_layer_0_0_0_1_fu_102", "Port" : "data_V13"}]},
			{"Name" : "data_V14", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "62", "SubInstance" : "grp_compute_layer_0_0_0_1_fu_102", "Port" : "data_V14"}]},
			{"Name" : "data_V15", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "62", "SubInstance" : "grp_compute_layer_0_0_0_1_fu_102", "Port" : "data_V15"}]},
			{"Name" : "data_V16", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "62", "SubInstance" : "grp_compute_layer_0_0_0_1_fu_102", "Port" : "data_V16"}]},
			{"Name" : "data_V17", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "62", "SubInstance" : "grp_compute_layer_0_0_0_1_fu_102", "Port" : "data_V17"}]},
			{"Name" : "data_V18", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "62", "SubInstance" : "grp_compute_layer_0_0_0_1_fu_102", "Port" : "data_V18"}]},
			{"Name" : "data_V19", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "62", "SubInstance" : "grp_compute_layer_0_0_0_1_fu_102", "Port" : "data_V19"}]},
			{"Name" : "data_V20", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "62", "SubInstance" : "grp_compute_layer_0_0_0_1_fu_102", "Port" : "data_V20"}]},
			{"Name" : "data_V21", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "62", "SubInstance" : "grp_compute_layer_0_0_0_1_fu_102", "Port" : "data_V21"}]},
			{"Name" : "data_V22", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "62", "SubInstance" : "grp_compute_layer_0_0_0_1_fu_102", "Port" : "data_V22"}]},
			{"Name" : "data_V23", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "62", "SubInstance" : "grp_compute_layer_0_0_0_1_fu_102", "Port" : "data_V23"}]},
			{"Name" : "data_V24", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "62", "SubInstance" : "grp_compute_layer_0_0_0_1_fu_102", "Port" : "data_V24"}]},
			{"Name" : "data_V25", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "62", "SubInstance" : "grp_compute_layer_0_0_0_1_fu_102", "Port" : "data_V25"}]},
			{"Name" : "data_V26", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "62", "SubInstance" : "grp_compute_layer_0_0_0_1_fu_102", "Port" : "data_V26"}]},
			{"Name" : "data_V27", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "62", "SubInstance" : "grp_compute_layer_0_0_0_1_fu_102", "Port" : "data_V27"}]},
			{"Name" : "data_V28", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "62", "SubInstance" : "grp_compute_layer_0_0_0_1_fu_102", "Port" : "data_V28"}]},
			{"Name" : "data_V29", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "62", "SubInstance" : "grp_compute_layer_0_0_0_1_fu_102", "Port" : "data_V29"}]},
			{"Name" : "data_V_offset", "Type" : "None", "Direction" : "I"},
			{"Name" : "data_V_offset1", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "62", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102", "Parent" : "61", "Child" : ["63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100", "101", "102", "103", "104", "105", "106", "107", "108", "109", "110", "111", "112", "113", "114", "115", "116", "117", "118", "119", "120", "121", "122", "123", "124", "125", "126", "127", "128", "129", "130", "131", "132", "133", "134", "135", "136", "137", "138", "139", "140", "141", "142", "143", "144", "145", "146", "147", "148", "149", "150", "151", "152", "153", "154", "155", "156", "157", "158", "159", "160", "161", "162", "163", "164", "165", "166", "167", "168", "169", "170", "171", "172", "173", "174", "175", "176", "177", "178", "179", "180", "181", "182", "183", "184", "185", "186", "187", "188", "189", "190", "191", "192", "193", "194", "195", "196", "197", "198", "199", "200", "201", "202", "203", "204", "205", "206", "207", "208", "209", "210", "211", "212", "213", "214", "215", "216", "217", "218", "219", "220", "221", "222"],
		"CDFG" : "compute_layer_0_0_0_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "6",
		"VariableLatency" : "0", "ExactLatency" : "11", "EstimateLatencyMin" : "11", "EstimateLatencyMax" : "11",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"InDataflowNetwork" : "0",
		"Port" : [
			{"Name" : "data_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "data_V1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "data_V2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "data_V3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "data_V4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "data_V5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "data_V6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "data_V7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "data_V8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "data_V9", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "data_V10", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "data_V11", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "data_V12", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "data_V13", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "data_V14", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "data_V15", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "data_V16", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "data_V17", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "data_V18", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "data_V19", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "data_V20", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "data_V21", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "data_V22", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "data_V23", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "data_V24", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "data_V25", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "data_V26", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "data_V27", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "data_V28", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "data_V29", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "data_V_offset", "Type" : "None", "Direction" : "I"},
			{"Name" : "data_V_offset1", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "63", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1bkb_U1", "Parent" : "62"},
	{"ID" : "64", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_8cud_U2", "Parent" : "62"},
	{"ID" : "65", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1dEe_U3", "Parent" : "62"},
	{"ID" : "66", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1eOg_U4", "Parent" : "62"},
	{"ID" : "67", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1fYi_U5", "Parent" : "62"},
	{"ID" : "68", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1g8j_U6", "Parent" : "62"},
	{"ID" : "69", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_8cud_U7", "Parent" : "62"},
	{"ID" : "70", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1dEe_U8", "Parent" : "62"},
	{"ID" : "71", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_9hbi_U9", "Parent" : "62"},
	{"ID" : "72", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1bkb_U10", "Parent" : "62"},
	{"ID" : "73", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1ibs_U11", "Parent" : "62"},
	{"ID" : "74", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1jbC_U12", "Parent" : "62"},
	{"ID" : "75", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1fYi_U13", "Parent" : "62"},
	{"ID" : "76", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1eOg_U14", "Parent" : "62"},
	{"ID" : "77", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1kbM_U15", "Parent" : "62"},
	{"ID" : "78", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_7lbW_U16", "Parent" : "62"},
	{"ID" : "79", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1fYi_U17", "Parent" : "62"},
	{"ID" : "80", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1fYi_U18", "Parent" : "62"},
	{"ID" : "81", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_8mb6_U19", "Parent" : "62"},
	{"ID" : "82", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1dEe_U20", "Parent" : "62"},
	{"ID" : "83", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1fYi_U21", "Parent" : "62"},
	{"ID" : "84", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1ncg_U22", "Parent" : "62"},
	{"ID" : "85", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1dEe_U23", "Parent" : "62"},
	{"ID" : "86", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1ocq_U24", "Parent" : "62"},
	{"ID" : "87", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1pcA_U25", "Parent" : "62"},
	{"ID" : "88", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_8mb6_U26", "Parent" : "62"},
	{"ID" : "89", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_2qcK_U27", "Parent" : "62"},
	{"ID" : "90", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1dEe_U28", "Parent" : "62"},
	{"ID" : "91", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1dEe_U29", "Parent" : "62"},
	{"ID" : "92", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1rcU_U30", "Parent" : "62"},
	{"ID" : "93", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_9sc4_U31", "Parent" : "62"},
	{"ID" : "94", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1dEe_U32", "Parent" : "62"},
	{"ID" : "95", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1bkb_U33", "Parent" : "62"},
	{"ID" : "96", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1rcU_U34", "Parent" : "62"},
	{"ID" : "97", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1eOg_U35", "Parent" : "62"},
	{"ID" : "98", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1kbM_U36", "Parent" : "62"},
	{"ID" : "99", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1ibs_U37", "Parent" : "62"},
	{"ID" : "100", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1fYi_U38", "Parent" : "62"},
	{"ID" : "101", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1fYi_U39", "Parent" : "62"},
	{"ID" : "102", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1eOg_U40", "Parent" : "62"},
	{"ID" : "103", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_2tde_U41", "Parent" : "62"},
	{"ID" : "104", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1fYi_U42", "Parent" : "62"},
	{"ID" : "105", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1dEe_U43", "Parent" : "62"},
	{"ID" : "106", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1dEe_U44", "Parent" : "62"},
	{"ID" : "107", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1kbM_U45", "Parent" : "62"},
	{"ID" : "108", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1udo_U46", "Parent" : "62"},
	{"ID" : "109", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_9hbi_U47", "Parent" : "62"},
	{"ID" : "110", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1ibs_U48", "Parent" : "62"},
	{"ID" : "111", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1eOg_U49", "Parent" : "62"},
	{"ID" : "112", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1g8j_U50", "Parent" : "62"},
	{"ID" : "113", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1vdy_U51", "Parent" : "62"},
	{"ID" : "114", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1dEe_U52", "Parent" : "62"},
	{"ID" : "115", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_7lbW_U53", "Parent" : "62"},
	{"ID" : "116", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1rcU_U54", "Parent" : "62"},
	{"ID" : "117", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1rcU_U55", "Parent" : "62"},
	{"ID" : "118", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1rcU_U56", "Parent" : "62"},
	{"ID" : "119", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1dEe_U57", "Parent" : "62"},
	{"ID" : "120", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1ibs_U58", "Parent" : "62"},
	{"ID" : "121", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_5wdI_U59", "Parent" : "62"},
	{"ID" : "122", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1fYi_U60", "Parent" : "62"},
	{"ID" : "123", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1g8j_U61", "Parent" : "62"},
	{"ID" : "124", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1g8j_U62", "Parent" : "62"},
	{"ID" : "125", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1rcU_U63", "Parent" : "62"},
	{"ID" : "126", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1bkb_U64", "Parent" : "62"},
	{"ID" : "127", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1jbC_U65", "Parent" : "62"},
	{"ID" : "128", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1xdS_U66", "Parent" : "62"},
	{"ID" : "129", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1xdS_U67", "Parent" : "62"},
	{"ID" : "130", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1ocq_U68", "Parent" : "62"},
	{"ID" : "131", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1bkb_U69", "Parent" : "62"},
	{"ID" : "132", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_2tde_U70", "Parent" : "62"},
	{"ID" : "133", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1xdS_U71", "Parent" : "62"},
	{"ID" : "134", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1dEe_U72", "Parent" : "62"},
	{"ID" : "135", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1bkb_U73", "Parent" : "62"},
	{"ID" : "136", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1g8j_U74", "Parent" : "62"},
	{"ID" : "137", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1g8j_U75", "Parent" : "62"},
	{"ID" : "138", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1bkb_U76", "Parent" : "62"},
	{"ID" : "139", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1yd2_U77", "Parent" : "62"},
	{"ID" : "140", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1vdy_U78", "Parent" : "62"},
	{"ID" : "141", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1jbC_U79", "Parent" : "62"},
	{"ID" : "142", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1dEe_U80", "Parent" : "62"},
	{"ID" : "143", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1ncg_U81", "Parent" : "62"},
	{"ID" : "144", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1yd2_U82", "Parent" : "62"},
	{"ID" : "145", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_2zec_U83", "Parent" : "62"},
	{"ID" : "146", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1ocq_U84", "Parent" : "62"},
	{"ID" : "147", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1ibs_U85", "Parent" : "62"},
	{"ID" : "148", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1pcA_U86", "Parent" : "62"},
	{"ID" : "149", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1g8j_U87", "Parent" : "62"},
	{"ID" : "150", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1rcU_U88", "Parent" : "62"},
	{"ID" : "151", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1rcU_U89", "Parent" : "62"},
	{"ID" : "152", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1Aem_U90", "Parent" : "62"},
	{"ID" : "153", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1kbM_U91", "Parent" : "62"},
	{"ID" : "154", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1fYi_U92", "Parent" : "62"},
	{"ID" : "155", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1rcU_U93", "Parent" : "62"},
	{"ID" : "156", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1ibs_U94", "Parent" : "62"},
	{"ID" : "157", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1dEe_U95", "Parent" : "62"},
	{"ID" : "158", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1rcU_U96", "Parent" : "62"},
	{"ID" : "159", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1rcU_U97", "Parent" : "62"},
	{"ID" : "160", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1g8j_U98", "Parent" : "62"},
	{"ID" : "161", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1fYi_U99", "Parent" : "62"},
	{"ID" : "162", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1rcU_U100", "Parent" : "62"},
	{"ID" : "163", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1eOg_U101", "Parent" : "62"},
	{"ID" : "164", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1g8j_U102", "Parent" : "62"},
	{"ID" : "165", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1dEe_U103", "Parent" : "62"},
	{"ID" : "166", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_9sc4_U104", "Parent" : "62"},
	{"ID" : "167", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1yd2_U105", "Parent" : "62"},
	{"ID" : "168", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1bkb_U106", "Parent" : "62"},
	{"ID" : "169", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1xdS_U107", "Parent" : "62"},
	{"ID" : "170", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1g8j_U108", "Parent" : "62"},
	{"ID" : "171", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1g8j_U109", "Parent" : "62"},
	{"ID" : "172", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1Bew_U110", "Parent" : "62"},
	{"ID" : "173", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_9sc4_U111", "Parent" : "62"},
	{"ID" : "174", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_9sc4_U112", "Parent" : "62"},
	{"ID" : "175", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1ocq_U113", "Parent" : "62"},
	{"ID" : "176", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1ocq_U114", "Parent" : "62"},
	{"ID" : "177", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1vdy_U115", "Parent" : "62"},
	{"ID" : "178", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_9hbi_U116", "Parent" : "62"},
	{"ID" : "179", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_9sc4_U117", "Parent" : "62"},
	{"ID" : "180", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1rcU_U118", "Parent" : "62"},
	{"ID" : "181", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1ncg_U119", "Parent" : "62"},
	{"ID" : "182", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1fYi_U120", "Parent" : "62"},
	{"ID" : "183", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1pcA_U121", "Parent" : "62"},
	{"ID" : "184", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1bkb_U122", "Parent" : "62"},
	{"ID" : "185", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1eOg_U123", "Parent" : "62"},
	{"ID" : "186", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1ocq_U124", "Parent" : "62"},
	{"ID" : "187", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1eOg_U125", "Parent" : "62"},
	{"ID" : "188", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_2CeG_U126", "Parent" : "62"},
	{"ID" : "189", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1ocq_U127", "Parent" : "62"},
	{"ID" : "190", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_2tde_U128", "Parent" : "62"},
	{"ID" : "191", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_2DeQ_U129", "Parent" : "62"},
	{"ID" : "192", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1udo_U130", "Parent" : "62"},
	{"ID" : "193", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1rcU_U131", "Parent" : "62"},
	{"ID" : "194", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1ibs_U132", "Parent" : "62"},
	{"ID" : "195", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1kbM_U133", "Parent" : "62"},
	{"ID" : "196", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1dEe_U134", "Parent" : "62"},
	{"ID" : "197", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1udo_U135", "Parent" : "62"},
	{"ID" : "198", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1rcU_U136", "Parent" : "62"},
	{"ID" : "199", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1fYi_U137", "Parent" : "62"},
	{"ID" : "200", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1jbC_U138", "Parent" : "62"},
	{"ID" : "201", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1rcU_U139", "Parent" : "62"},
	{"ID" : "202", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1eOg_U140", "Parent" : "62"},
	{"ID" : "203", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1pcA_U141", "Parent" : "62"},
	{"ID" : "204", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_8cud_U142", "Parent" : "62"},
	{"ID" : "205", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1g8j_U143", "Parent" : "62"},
	{"ID" : "206", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1eOg_U144", "Parent" : "62"},
	{"ID" : "207", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1bkb_U145", "Parent" : "62"},
	{"ID" : "208", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1rcU_U146", "Parent" : "62"},
	{"ID" : "209", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1rcU_U147", "Parent" : "62"},
	{"ID" : "210", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1ocq_U148", "Parent" : "62"},
	{"ID" : "211", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1ncg_U149", "Parent" : "62"},
	{"ID" : "212", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_9sc4_U150", "Parent" : "62"},
	{"ID" : "213", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_2qcK_U151", "Parent" : "62"},
	{"ID" : "214", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1Bew_U152", "Parent" : "62"},
	{"ID" : "215", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1Ee0_U153", "Parent" : "62"},
	{"ID" : "216", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1kbM_U154", "Parent" : "62"},
	{"ID" : "217", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1ncg_U155", "Parent" : "62"},
	{"ID" : "218", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1jbC_U156", "Parent" : "62"},
	{"ID" : "219", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1bkb_U157", "Parent" : "62"},
	{"ID" : "220", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mul_1bkb_U158", "Parent" : "62"},
	{"ID" : "221", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mux_3Ffa_U159", "Parent" : "62"},
	{"ID" : "222", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_1_fu_102.hls4ml_hcal_mux_3Ffa_U160", "Parent" : "62"},
	{"ID" : "223", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169", "Parent" : "61", "Child" : ["224", "225", "226", "227", "228", "229", "230", "231", "232", "233", "234", "235", "236", "237", "238", "239", "240", "241", "242", "243", "244", "245", "246", "247", "248", "249", "250", "251", "252", "253", "254", "255", "256", "257", "258", "259", "260", "261", "262", "263", "264", "265", "266", "267", "268", "269", "270", "271", "272", "273", "274", "275", "276", "277", "278", "279", "280", "281", "282", "283", "284", "285", "286", "287", "288", "289", "290", "291", "292", "293"],
		"CDFG" : "compute_layer_0_0_0_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "4", "EstimateLatencyMin" : "4", "EstimateLatencyMax" : "4",
		"Combinational" : "0",
		"Datapath" : "1",
		"ClockEnable" : "1",
		"InDataflowNetwork" : "0",
		"Port" : [
			{"Name" : "data_0_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "data_1_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "data_2_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "data_3_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "data_4_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "data_5_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "data_6_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "data_7_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "data_8_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "data_9_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "data_10_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "data_11_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "data_12_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "data_13_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "data_14_V_read", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "224", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3Gfk_U239", "Parent" : "223"},
	{"ID" : "225", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3Hfu_U240", "Parent" : "223"},
	{"ID" : "226", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3IfE_U241", "Parent" : "223"},
	{"ID" : "227", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3JfO_U242", "Parent" : "223"},
	{"ID" : "228", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3KfY_U243", "Parent" : "223"},
	{"ID" : "229", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3Lf8_U244", "Parent" : "223"},
	{"ID" : "230", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3Mgi_U245", "Parent" : "223"},
	{"ID" : "231", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3Ngs_U246", "Parent" : "223"},
	{"ID" : "232", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3OgC_U247", "Parent" : "223"},
	{"ID" : "233", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3PgM_U248", "Parent" : "223"},
	{"ID" : "234", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3QgW_U249", "Parent" : "223"},
	{"ID" : "235", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3KfY_U250", "Parent" : "223"},
	{"ID" : "236", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3Ngs_U251", "Parent" : "223"},
	{"ID" : "237", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3Rg6_U252", "Parent" : "223"},
	{"ID" : "238", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3KfY_U253", "Parent" : "223"},
	{"ID" : "239", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3IfE_U254", "Parent" : "223"},
	{"ID" : "240", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3Mgi_U255", "Parent" : "223"},
	{"ID" : "241", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3Shg_U256", "Parent" : "223"},
	{"ID" : "242", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3Thq_U257", "Parent" : "223"},
	{"ID" : "243", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3KfY_U258", "Parent" : "223"},
	{"ID" : "244", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3IfE_U259", "Parent" : "223"},
	{"ID" : "245", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3PgM_U260", "Parent" : "223"},
	{"ID" : "246", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3IfE_U261", "Parent" : "223"},
	{"ID" : "247", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3Lf8_U262", "Parent" : "223"},
	{"ID" : "248", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3IfE_U263", "Parent" : "223"},
	{"ID" : "249", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3IfE_U264", "Parent" : "223"},
	{"ID" : "250", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3Mgi_U265", "Parent" : "223"},
	{"ID" : "251", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3Thq_U266", "Parent" : "223"},
	{"ID" : "252", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3Gfk_U267", "Parent" : "223"},
	{"ID" : "253", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3IfE_U268", "Parent" : "223"},
	{"ID" : "254", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3UhA_U269", "Parent" : "223"},
	{"ID" : "255", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3Mgi_U270", "Parent" : "223"},
	{"ID" : "256", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3KfY_U271", "Parent" : "223"},
	{"ID" : "257", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3OgC_U272", "Parent" : "223"},
	{"ID" : "258", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3OgC_U273", "Parent" : "223"},
	{"ID" : "259", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3VhK_U274", "Parent" : "223"},
	{"ID" : "260", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3WhU_U275", "Parent" : "223"},
	{"ID" : "261", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3JfO_U276", "Parent" : "223"},
	{"ID" : "262", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3PgM_U277", "Parent" : "223"},
	{"ID" : "263", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3Mgi_U278", "Parent" : "223"},
	{"ID" : "264", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3QgW_U279", "Parent" : "223"},
	{"ID" : "265", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3WhU_U280", "Parent" : "223"},
	{"ID" : "266", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3IfE_U281", "Parent" : "223"},
	{"ID" : "267", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3Mgi_U282", "Parent" : "223"},
	{"ID" : "268", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3Ngs_U283", "Parent" : "223"},
	{"ID" : "269", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3WhU_U284", "Parent" : "223"},
	{"ID" : "270", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3Xh4_U285", "Parent" : "223"},
	{"ID" : "271", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3Lf8_U286", "Parent" : "223"},
	{"ID" : "272", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3Yie_U287", "Parent" : "223"},
	{"ID" : "273", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3IfE_U288", "Parent" : "223"},
	{"ID" : "274", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3Hfu_U289", "Parent" : "223"},
	{"ID" : "275", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3IfE_U290", "Parent" : "223"},
	{"ID" : "276", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3Lf8_U291", "Parent" : "223"},
	{"ID" : "277", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3PgM_U292", "Parent" : "223"},
	{"ID" : "278", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3Lf8_U293", "Parent" : "223"},
	{"ID" : "279", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3IfE_U294", "Parent" : "223"},
	{"ID" : "280", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3WhU_U295", "Parent" : "223"},
	{"ID" : "281", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3IfE_U296", "Parent" : "223"},
	{"ID" : "282", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3Xh4_U297", "Parent" : "223"},
	{"ID" : "283", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3IfE_U298", "Parent" : "223"},
	{"ID" : "284", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3Ngs_U299", "Parent" : "223"},
	{"ID" : "285", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3Xh4_U300", "Parent" : "223"},
	{"ID" : "286", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3Mgi_U301", "Parent" : "223"},
	{"ID" : "287", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3Lf8_U302", "Parent" : "223"},
	{"ID" : "288", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3QgW_U303", "Parent" : "223"},
	{"ID" : "289", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3OgC_U304", "Parent" : "223"},
	{"ID" : "290", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3Thq_U305", "Parent" : "223"},
	{"ID" : "291", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3WhU_U306", "Parent" : "223"},
	{"ID" : "292", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3QgW_U307", "Parent" : "223"},
	{"ID" : "293", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_0_s_fu_169.hls4ml_hcal_mul_3PgM_U308", "Parent" : "223"},
	{"ID" : "294", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_fu_188", "Parent" : "61", "Child" : ["295", "296", "297", "298"],
		"CDFG" : "compute_layer_0_0",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "4", "EstimateLatencyMin" : "4", "EstimateLatencyMax" : "4",
		"Combinational" : "0",
		"Datapath" : "1",
		"ClockEnable" : "1",
		"InDataflowNetwork" : "0",
		"Port" : [
			{"Name" : "data_0_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "data_1_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "data_2_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "data_3_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "data_4_V_read", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "295", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_fu_188.hls4ml_hcal_mul_3Zio_U348", "Parent" : "294"},
	{"ID" : "296", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_fu_188.hls4ml_hcal_mul_3VhK_U349", "Parent" : "294"},
	{"ID" : "297", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_fu_188.hls4ml_hcal_mul_3UhA_U350", "Parent" : "294"},
	{"ID" : "298", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.grp_compute_layer_0_0_fu_188.hls4ml_hcal_mul_3Yie_U351", "Parent" : "294"},
	{"ID" : "299", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.call_ret1_linear_2_fu_197", "Parent" : "61",
		"CDFG" : "linear_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"InDataflowNetwork" : "0",
		"Port" : [
			{"Name" : "data_0_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "data_1_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "data_2_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "data_3_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "data_4_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "data_5_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "data_6_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "data_7_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "data_8_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "data_9_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "data_10_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "data_11_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "data_12_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "data_13_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "data_14_V_read", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "300", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.call_ret3_linear_1_fu_216", "Parent" : "61",
		"CDFG" : "linear_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"InDataflowNetwork" : "0",
		"Port" : [
			{"Name" : "data_0_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "data_1_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "data_2_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "data_3_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "data_4_V_read", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "301", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_ereg_v1_fu_1641.res_V_write_assign_linear_fu_225", "Parent" : "61",
		"CDFG" : "linear",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"InDataflowNetwork" : "0",
		"Port" : [
			{"Name" : "data_V_read", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "302", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.hls4ml_hcal_mux_3Ffa_U391", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	hls4ml_hcal {
		id {Type I LastRead 0 FirstWrite -1}
		in_V_data_V {Type I LastRead 4 FirstWrite -1}
		in_V_dest_V {Type I LastRead 4 FirstWrite -1}
		in_V_last_V {Type I LastRead 4 FirstWrite -1}
		in_V_id_V {Type I LastRead 4 FirstWrite -1}
		in_V_keep_V {Type I LastRead 4 FirstWrite -1}
		out_V_data_V {Type O LastRead -1 FirstWrite 7}
		out_V_dest_V {Type O LastRead -1 FirstWrite 7}
		out_V_last_V {Type O LastRead -1 FirstWrite 7}
		out_V_id_V {Type O LastRead -1 FirstWrite 7}
		out_V_keep_V {Type O LastRead -1 FirstWrite 7}}
	ereg_v1 {
		data_V {Type I LastRead 6 FirstWrite -1}
		data_V1 {Type I LastRead 6 FirstWrite -1}
		data_V2 {Type I LastRead 6 FirstWrite -1}
		data_V3 {Type I LastRead 6 FirstWrite -1}
		data_V4 {Type I LastRead 6 FirstWrite -1}
		data_V5 {Type I LastRead 6 FirstWrite -1}
		data_V6 {Type I LastRead 6 FirstWrite -1}
		data_V7 {Type I LastRead 6 FirstWrite -1}
		data_V8 {Type I LastRead 6 FirstWrite -1}
		data_V9 {Type I LastRead 6 FirstWrite -1}
		data_V10 {Type I LastRead 6 FirstWrite -1}
		data_V11 {Type I LastRead 6 FirstWrite -1}
		data_V12 {Type I LastRead 6 FirstWrite -1}
		data_V13 {Type I LastRead 6 FirstWrite -1}
		data_V14 {Type I LastRead 6 FirstWrite -1}
		data_V15 {Type I LastRead 6 FirstWrite -1}
		data_V16 {Type I LastRead 6 FirstWrite -1}
		data_V17 {Type I LastRead 6 FirstWrite -1}
		data_V18 {Type I LastRead 6 FirstWrite -1}
		data_V19 {Type I LastRead 6 FirstWrite -1}
		data_V20 {Type I LastRead 6 FirstWrite -1}
		data_V21 {Type I LastRead 6 FirstWrite -1}
		data_V22 {Type I LastRead 6 FirstWrite -1}
		data_V23 {Type I LastRead 6 FirstWrite -1}
		data_V24 {Type I LastRead 6 FirstWrite -1}
		data_V25 {Type I LastRead 6 FirstWrite -1}
		data_V26 {Type I LastRead 6 FirstWrite -1}
		data_V27 {Type I LastRead 6 FirstWrite -1}
		data_V28 {Type I LastRead 6 FirstWrite -1}
		data_V29 {Type I LastRead 6 FirstWrite -1}
		data_V_offset {Type I LastRead 0 FirstWrite -1}
		data_V_offset1 {Type I LastRead 0 FirstWrite -1}}
	compute_layer_0_0_0_1 {
		data_V {Type I LastRead 6 FirstWrite -1}
		data_V1 {Type I LastRead 6 FirstWrite -1}
		data_V2 {Type I LastRead 6 FirstWrite -1}
		data_V3 {Type I LastRead 6 FirstWrite -1}
		data_V4 {Type I LastRead 6 FirstWrite -1}
		data_V5 {Type I LastRead 6 FirstWrite -1}
		data_V6 {Type I LastRead 6 FirstWrite -1}
		data_V7 {Type I LastRead 6 FirstWrite -1}
		data_V8 {Type I LastRead 6 FirstWrite -1}
		data_V9 {Type I LastRead 6 FirstWrite -1}
		data_V10 {Type I LastRead 6 FirstWrite -1}
		data_V11 {Type I LastRead 6 FirstWrite -1}
		data_V12 {Type I LastRead 6 FirstWrite -1}
		data_V13 {Type I LastRead 6 FirstWrite -1}
		data_V14 {Type I LastRead 6 FirstWrite -1}
		data_V15 {Type I LastRead 6 FirstWrite -1}
		data_V16 {Type I LastRead 6 FirstWrite -1}
		data_V17 {Type I LastRead 6 FirstWrite -1}
		data_V18 {Type I LastRead 6 FirstWrite -1}
		data_V19 {Type I LastRead 6 FirstWrite -1}
		data_V20 {Type I LastRead 6 FirstWrite -1}
		data_V21 {Type I LastRead 6 FirstWrite -1}
		data_V22 {Type I LastRead 6 FirstWrite -1}
		data_V23 {Type I LastRead 6 FirstWrite -1}
		data_V24 {Type I LastRead 6 FirstWrite -1}
		data_V25 {Type I LastRead 6 FirstWrite -1}
		data_V26 {Type I LastRead 6 FirstWrite -1}
		data_V27 {Type I LastRead 6 FirstWrite -1}
		data_V28 {Type I LastRead 6 FirstWrite -1}
		data_V29 {Type I LastRead 6 FirstWrite -1}
		data_V_offset {Type I LastRead 0 FirstWrite -1}
		data_V_offset1 {Type I LastRead 2 FirstWrite -1}}
	compute_layer_0_0_0_s {
		data_0_V_read {Type I LastRead 0 FirstWrite -1}
		data_1_V_read {Type I LastRead 0 FirstWrite -1}
		data_2_V_read {Type I LastRead 0 FirstWrite -1}
		data_3_V_read {Type I LastRead 0 FirstWrite -1}
		data_4_V_read {Type I LastRead 0 FirstWrite -1}
		data_5_V_read {Type I LastRead 0 FirstWrite -1}
		data_6_V_read {Type I LastRead 0 FirstWrite -1}
		data_7_V_read {Type I LastRead 0 FirstWrite -1}
		data_8_V_read {Type I LastRead 0 FirstWrite -1}
		data_9_V_read {Type I LastRead 0 FirstWrite -1}
		data_10_V_read {Type I LastRead 0 FirstWrite -1}
		data_11_V_read {Type I LastRead 0 FirstWrite -1}
		data_12_V_read {Type I LastRead 0 FirstWrite -1}
		data_13_V_read {Type I LastRead 0 FirstWrite -1}
		data_14_V_read {Type I LastRead 0 FirstWrite -1}}
	compute_layer_0_0 {
		data_0_V_read {Type I LastRead 0 FirstWrite -1}
		data_1_V_read {Type I LastRead 0 FirstWrite -1}
		data_2_V_read {Type I LastRead 0 FirstWrite -1}
		data_3_V_read {Type I LastRead 0 FirstWrite -1}
		data_4_V_read {Type I LastRead 0 FirstWrite -1}}
	linear_2 {
		data_0_V_read {Type I LastRead 0 FirstWrite -1}
		data_1_V_read {Type I LastRead 0 FirstWrite -1}
		data_2_V_read {Type I LastRead 0 FirstWrite -1}
		data_3_V_read {Type I LastRead 0 FirstWrite -1}
		data_4_V_read {Type I LastRead 0 FirstWrite -1}
		data_5_V_read {Type I LastRead 0 FirstWrite -1}
		data_6_V_read {Type I LastRead 0 FirstWrite -1}
		data_7_V_read {Type I LastRead 0 FirstWrite -1}
		data_8_V_read {Type I LastRead 0 FirstWrite -1}
		data_9_V_read {Type I LastRead 0 FirstWrite -1}
		data_10_V_read {Type I LastRead 0 FirstWrite -1}
		data_11_V_read {Type I LastRead 0 FirstWrite -1}
		data_12_V_read {Type I LastRead 0 FirstWrite -1}
		data_13_V_read {Type I LastRead 0 FirstWrite -1}
		data_14_V_read {Type I LastRead 0 FirstWrite -1}}
	linear_1 {
		data_0_V_read {Type I LastRead 0 FirstWrite -1}
		data_1_V_read {Type I LastRead 0 FirstWrite -1}
		data_2_V_read {Type I LastRead 0 FirstWrite -1}
		data_3_V_read {Type I LastRead 0 FirstWrite -1}
		data_4_V_read {Type I LastRead 0 FirstWrite -1}}
	linear {
		data_V_read {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	id { ap_none {  { id in_data 0 16 } } }
	in_V_data_V { axis {  { in_r_TDATA in_data 0 64 } } }
	in_V_dest_V { axis {  { in_r_TDEST in_data 0 8 } } }
	in_V_last_V { axis {  { in_r_TLAST in_data 0 1 } } }
	in_V_id_V { axis {  { in_r_TID in_data 0 8 } } }
	in_V_keep_V { axis {  { in_r_TVALID in_vld 0 1 }  { in_r_TREADY in_acc 1 1 }  { in_r_TKEEP in_data 0 8 } } }
	out_V_data_V { axis {  { out_r_TDATA out_data 1 64 } } }
	out_V_dest_V { axis {  { out_r_TDEST out_data 1 8 } } }
	out_V_last_V { axis {  { out_r_TLAST out_data 1 1 } } }
	out_V_id_V { axis {  { out_r_TID out_data 1 8 } } }
	out_V_keep_V { axis {  { out_r_TVALID out_vld 1 1 }  { out_r_TREADY out_acc 0 1 }  { out_r_TKEEP out_data 1 8 } } }
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
