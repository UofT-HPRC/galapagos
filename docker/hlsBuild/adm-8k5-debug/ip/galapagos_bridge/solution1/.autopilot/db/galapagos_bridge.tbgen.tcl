set C_TypeInfoList {{ 
"galapagos_bridge" : [[], { "return": [[], "void"]} , [{"ExternC" : 0}], [ {"g2N_input": [[],{ "pointer": "0"}] }, {"g2N_output": [[],{ "pointer": "1"}] }, {"buffer_storage_A": [[], {"array": ["2", [512]]}] }, {"buffer_storage_B": [[], {"array": ["2", [512]]}] }, {"n2G_input": [[],{ "pointer": "1"}] }, {"n2G_output": [[],{ "pointer": "0"}] }],[],""], 
"0": [ "galapagos_interface", {"typedef": [[[],"3"],""]}], 
"3": [ "stream<galapagos::stream_packet<64> >", {"hls_type": {"stream": [[[[],"4"]],"5"]}}], 
"4": [ "stream_packet<64>", {"struct": [[],[{"T":[[], {"scalar": { "int": 64}}]}],[{ "data": [[], "2"]},{ "dest": [[], "6"]},{ "last": [[], "7"]},{ "id": [[], "6"]},{ "keep": [[], "6"]}],"8"]}], 
"1": [ "stream<ap_axis_net<64> >", {"hls_type": {"stream": [[[[],"9"]],"5"]}}], 
"9": [ "ap_axis_net<64>", {"struct": [[],[{"D":[[], {"scalar": { "int": 64}}]}],[{ "data": [[], "2"]},{ "keep": [[], "6"]},{ "last": [[], "7"]}],""]}], 
"2": [ "ap_uint<64>", {"hls_type": {"ap_uint": [[[[], {"scalar": { "int": 64}}]],""]}}], 
"6": [ "ap_uint<8>", {"hls_type": {"ap_uint": [[[[], {"scalar": { "int": 8}}]],""]}}], 
"7": [ "ap_uint<1>", {"hls_type": {"ap_uint": [[[[], {"scalar": { "int": 1}}]],""]}}],
"5": ["hls", ""],
"8": ["galapagos", ""]
}}
set moduleName galapagos_bridge
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type dataflow
set FunctionProtocol ap_ctrl_none
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set C_modelName {galapagos_bridge}
set C_modelType { void 0 }
set C_modelArgList {
	{ g2N_input_V int 89 regular {fifo 0 volatile }  }
	{ g2N_output_V int 73 regular {fifo 1 volatile }  }
	{ buffer_storage_A_V int 64 regular {array 512 { 0 } 0 1 }  }
	{ buffer_storage_B_V int 64 regular {array 512 { 1 } 1 1 }  }
	{ n2G_input_V int 73 regular {fifo 0 volatile }  }
	{ n2G_output_V int 89 regular {fifo 1 volatile }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "g2N_input_V", "interface" : "fifo", "bitwidth" : 89, "direction" : "READONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "g2N_input.V.data.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":64,"up":71,"cElement": [{"cName": "g2N_input.V.dest.V","cData": "uint8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":72,"up":72,"cElement": [{"cName": "g2N_input.V.last.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":73,"up":80,"cElement": [{"cName": "g2N_input.V.id.V","cData": "uint8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":81,"up":88,"cElement": [{"cName": "g2N_input.V.keep.V","cData": "uint8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "g2N_output_V", "interface" : "fifo", "bitwidth" : 73, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "g2N_output.V.data.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":64,"up":71,"cElement": [{"cName": "g2N_output.V.keep.V","cData": "uint8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":72,"up":72,"cElement": [{"cName": "g2N_output.V.last.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "buffer_storage_A_V", "interface" : "memory", "bitwidth" : 64, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "buffer_storage_A.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 511,"step" : 1}]}]}]} , 
 	{ "Name" : "buffer_storage_B_V", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "buffer_storage_B.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 511,"step" : 1}]}]}]} , 
 	{ "Name" : "n2G_input_V", "interface" : "fifo", "bitwidth" : 73, "direction" : "READONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "n2G_input.V.data.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":64,"up":71,"cElement": [{"cName": "n2G_input.V.keep.V","cData": "uint8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":72,"up":72,"cElement": [{"cName": "n2G_input.V.last.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "n2G_output_V", "interface" : "fifo", "bitwidth" : 89, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "n2G_output.V.data.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":64,"up":71,"cElement": [{"cName": "n2G_output.V.dest.V","cData": "uint8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":72,"up":72,"cElement": [{"cName": "n2G_output.V.last.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":73,"up":80,"cElement": [{"cName": "n2G_output.V.id.V","cData": "uint8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":81,"up":88,"cElement": [{"cName": "n2G_output.V.keep.V","cData": "uint8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} ]}
# RTL Port declarations: 
set portNum 24
set portList { 
	{ g2N_input_V_dout sc_in sc_lv 89 signal 0 } 
	{ g2N_input_V_empty_n sc_in sc_logic 1 signal 0 } 
	{ g2N_input_V_read sc_out sc_logic 1 signal 0 } 
	{ g2N_output_V_din sc_out sc_lv 73 signal 1 } 
	{ g2N_output_V_full_n sc_in sc_logic 1 signal 1 } 
	{ g2N_output_V_write sc_out sc_logic 1 signal 1 } 
	{ buffer_storage_A_V_address0 sc_out sc_lv 9 signal 2 } 
	{ buffer_storage_A_V_ce0 sc_out sc_logic 1 signal 2 } 
	{ buffer_storage_A_V_d0 sc_out sc_lv 64 signal 2 } 
	{ buffer_storage_A_V_q0 sc_in sc_lv 64 signal 2 } 
	{ buffer_storage_A_V_we0 sc_out sc_logic 1 signal 2 } 
	{ buffer_storage_B_V_address0 sc_out sc_lv 9 signal 3 } 
	{ buffer_storage_B_V_ce0 sc_out sc_logic 1 signal 3 } 
	{ buffer_storage_B_V_d0 sc_out sc_lv 64 signal 3 } 
	{ buffer_storage_B_V_q0 sc_in sc_lv 64 signal 3 } 
	{ buffer_storage_B_V_we0 sc_out sc_logic 1 signal 3 } 
	{ n2G_input_V_dout sc_in sc_lv 73 signal 4 } 
	{ n2G_input_V_empty_n sc_in sc_logic 1 signal 4 } 
	{ n2G_input_V_read sc_out sc_logic 1 signal 4 } 
	{ n2G_output_V_din sc_out sc_lv 89 signal 5 } 
	{ n2G_output_V_full_n sc_in sc_logic 1 signal 5 } 
	{ n2G_output_V_write sc_out sc_logic 1 signal 5 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
}
set NewPortList {[ 
	{ "name": "g2N_input_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":89, "type": "signal", "bundle":{"name": "g2N_input_V", "role": "dout" }} , 
 	{ "name": "g2N_input_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "g2N_input_V", "role": "empty_n" }} , 
 	{ "name": "g2N_input_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "g2N_input_V", "role": "read" }} , 
 	{ "name": "g2N_output_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":73, "type": "signal", "bundle":{"name": "g2N_output_V", "role": "din" }} , 
 	{ "name": "g2N_output_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "g2N_output_V", "role": "full_n" }} , 
 	{ "name": "g2N_output_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "g2N_output_V", "role": "write" }} , 
 	{ "name": "buffer_storage_A_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "buffer_storage_A_V", "role": "address0" }} , 
 	{ "name": "buffer_storage_A_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "buffer_storage_A_V", "role": "ce0" }} , 
 	{ "name": "buffer_storage_A_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "buffer_storage_A_V", "role": "d0" }} , 
 	{ "name": "buffer_storage_A_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "buffer_storage_A_V", "role": "q0" }} , 
 	{ "name": "buffer_storage_A_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "buffer_storage_A_V", "role": "we0" }} , 
 	{ "name": "buffer_storage_B_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "buffer_storage_B_V", "role": "address0" }} , 
 	{ "name": "buffer_storage_B_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "buffer_storage_B_V", "role": "ce0" }} , 
 	{ "name": "buffer_storage_B_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "buffer_storage_B_V", "role": "d0" }} , 
 	{ "name": "buffer_storage_B_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "buffer_storage_B_V", "role": "q0" }} , 
 	{ "name": "buffer_storage_B_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "buffer_storage_B_V", "role": "we0" }} , 
 	{ "name": "n2G_input_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":73, "type": "signal", "bundle":{"name": "n2G_input_V", "role": "dout" }} , 
 	{ "name": "n2G_input_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "n2G_input_V", "role": "empty_n" }} , 
 	{ "name": "n2G_input_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "n2G_input_V", "role": "read" }} , 
 	{ "name": "n2G_output_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":89, "type": "signal", "bundle":{"name": "n2G_output_V", "role": "din" }} , 
 	{ "name": "n2G_output_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "n2G_output_V", "role": "full_n" }} , 
 	{ "name": "n2G_output_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "n2G_output_V", "role": "write" }} , 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6"],
		"CDFG" : "galapagos_bridge",
		"Protocol" : "ap_ctrl_none",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "6", "EstimateLatencyMax" : "65541",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"InDataflowNetwork" : "0",
		"InputProcess" : [
			{"ID" : "1", "Name" : "g2N_ingress_U0"},
			{"ID" : "2", "Name" : "g2N_egress_U0"},
			{"ID" : "3", "Name" : "n2G_U0"}],
		"OutputProcess" : [
			{"ID" : "2", "Name" : "g2N_egress_U0"},
			{"ID" : "1", "Name" : "g2N_ingress_U0"},
			{"ID" : "3", "Name" : "n2G_U0"}],
		"Port" : [
			{"Name" : "g2N_input_V", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "g2N_ingress_U0", "Port" : "input_V"}]},
			{"Name" : "g2N_output_V", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "g2N_egress_U0", "Port" : "output_V"}]},
			{"Name" : "buffer_storage_A_V", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "g2N_ingress_U0", "Port" : "buffer_storage_V"}]},
			{"Name" : "buffer_storage_B_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "g2N_egress_U0", "Port" : "buffer_storage_V"}]},
			{"Name" : "n2G_input_V", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "n2G_U0", "Port" : "input_V"}]},
			{"Name" : "n2G_output_V", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "n2G_U0", "Port" : "output_V"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.g2N_ingress_U0", "Parent" : "0",
		"CDFG" : "g2N_ingress",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "3", "EstimateLatencyMax" : "514",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"InDataflowNetwork" : "1",
		"Port" : [
			{"Name" : "input_V", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "input_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "buffer_storage_V", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "length_stream_V_V", "Type" : "Vld", "Direction" : "O", "DependentProc" : "2", "DependentChan" : "4"},
			{"Name" : "dest_stream_V_V", "Type" : "Vld", "Direction" : "O", "DependentProc" : "2", "DependentChan" : "5"},
			{"Name" : "src_stream_V_V", "Type" : "Vld", "Direction" : "O", "DependentProc" : "2", "DependentChan" : "6"}]},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.g2N_egress_U0", "Parent" : "0",
		"CDFG" : "g2N_egress",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2", "EstimateLatencyMax" : "65537",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"InDataflowNetwork" : "1",
		"Port" : [
			{"Name" : "output_V", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "output_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "buffer_storage_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "length_stream_V_V", "Type" : "None", "Direction" : "I", "DependentProc" : "1", "DependentChan" : "4"},
			{"Name" : "dest_stream_V_V", "Type" : "None", "Direction" : "I", "DependentProc" : "1", "DependentChan" : "5"},
			{"Name" : "src_stream_V_V", "Type" : "None", "Direction" : "I", "DependentProc" : "1", "DependentChan" : "6"}]},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.n2G_U0", "Parent" : "0",
		"CDFG" : "n2G",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "4", "EstimateLatencyMax" : "515",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"InDataflowNetwork" : "1",
		"Port" : [
			{"Name" : "input_V", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "input_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "output_V", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "output_V_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.length_stream_V_V_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dest_stream_V_V_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.src_stream_V_V_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	galapagos_bridge {
		g2N_input_V {Type I LastRead 1 FirstWrite -1}
		g2N_output_V {Type O LastRead -1 FirstWrite 0}
		buffer_storage_A_V {Type O LastRead -1 FirstWrite 1}
		buffer_storage_B_V {Type I LastRead 1 FirstWrite -1}
		n2G_input_V {Type I LastRead 1 FirstWrite -1}
		n2G_output_V {Type O LastRead -1 FirstWrite 2}}
	g2N_ingress {
		input_V {Type I LastRead 1 FirstWrite -1}
		buffer_storage_V {Type O LastRead -1 FirstWrite 1}
		length_stream_V_V {Type O LastRead -1 FirstWrite 2}
		dest_stream_V_V {Type O LastRead -1 FirstWrite 2}
		src_stream_V_V {Type O LastRead -1 FirstWrite 2}}
	g2N_egress {
		output_V {Type O LastRead -1 FirstWrite 0}
		buffer_storage_V {Type I LastRead 1 FirstWrite -1}
		length_stream_V_V {Type I LastRead 0 FirstWrite -1}
		dest_stream_V_V {Type I LastRead 0 FirstWrite -1}
		src_stream_V_V {Type I LastRead 0 FirstWrite -1}}
	n2G {
		input_V {Type I LastRead 1 FirstWrite -1}
		output_V {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "6", "Max" : "65541"}
	, {"Name" : "Interval", "Min" : "5", "Max" : "65538"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	g2N_input_V { ap_fifo {  { g2N_input_V_dout fifo_data 0 89 }  { g2N_input_V_empty_n fifo_status 0 1 }  { g2N_input_V_read fifo_update 1 1 } } }
	g2N_output_V { ap_fifo {  { g2N_output_V_din fifo_data 1 73 }  { g2N_output_V_full_n fifo_status 0 1 }  { g2N_output_V_write fifo_update 1 1 } } }
	buffer_storage_A_V { ap_memory {  { buffer_storage_A_V_address0 mem_address 1 9 }  { buffer_storage_A_V_ce0 mem_ce 1 1 }  { buffer_storage_A_V_d0 mem_din 1 64 }  { buffer_storage_A_V_q0 mem_dout 0 64 }  { buffer_storage_A_V_we0 mem_we 1 1 } } }
	buffer_storage_B_V { ap_memory {  { buffer_storage_B_V_address0 mem_address 1 9 }  { buffer_storage_B_V_ce0 mem_ce 1 1 }  { buffer_storage_B_V_d0 mem_din 1 64 }  { buffer_storage_B_V_q0 mem_dout 0 64 }  { buffer_storage_B_V_we0 mem_we 1 1 } } }
	n2G_input_V { ap_fifo {  { n2G_input_V_dout fifo_data 0 73 }  { n2G_input_V_empty_n fifo_status 0 1 }  { n2G_input_V_read fifo_update 1 1 } } }
	n2G_output_V { ap_fifo {  { n2G_output_V_din fifo_data 1 89 }  { n2G_output_V_full_n fifo_status 0 1 }  { n2G_output_V_write fifo_update 1 1 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
	g2N_input_V { fifo_read 1 no_conditional }
	g2N_output_V { fifo_write 1 no_conditional }
	n2G_input_V { fifo_read 1 no_conditional }
	n2G_output_V { fifo_write 1 no_conditional }
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
