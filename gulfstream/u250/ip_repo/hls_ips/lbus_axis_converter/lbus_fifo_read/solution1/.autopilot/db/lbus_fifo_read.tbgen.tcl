set moduleName lbus_fifo_read
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
set C_modelName {lbus_fifo_read}
set C_modelType { void 0 }
set C_modelArgList {
	{ lbus_fifo int 544 regular  }
	{ lbus_fifo_pkt_end int 408 regular  }
	{ lbus_fifo_empty_V int 1 regular  }
	{ lbus_fifo_pkt_end_empty_V int 1 regular  }
	{ lbus_fifo_valid_V int 1 regular  }
	{ lbus_fifo_pkt_end_valid_V int 1 regular  }
	{ lbus_fifo_re_V int 1 regular {pointer 1}  }
	{ lbus_fifo_pkt_end_re_V int 1 regular {pointer 1}  }
	{ error_V int 1 regular {pointer 1}  }
	{ m_axis_data_V int 512 regular {pointer 1}  }
	{ m_axis_keep_V int 64 regular {pointer 1}  }
	{ m_axis_last_V int 1 regular {pointer 1}  }
	{ m_axis_valid_V int 1 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "lbus_fifo", "interface" : "wire", "bitwidth" : 544, "direction" : "READONLY", "bitSlice":[{"low":0,"up":127,"cElement": [{"cName": "lbus_fifo.lbus0.data.V","cData": "uint128","bit_use": { "low": 0,"up": 127},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]},{"low":128,"up":128,"cElement": [{"cName": "lbus_fifo.lbus0.ena.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]},{"low":129,"up":129,"cElement": [{"cName": "lbus_fifo.lbus0.sop.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]},{"low":130,"up":130,"cElement": [{"cName": "lbus_fifo.lbus0.eop.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]},{"low":131,"up":131,"cElement": [{"cName": "lbus_fifo.lbus0.err.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]},{"low":132,"up":135,"cElement": [{"cName": "lbus_fifo.lbus0.mty.V","cData": "uint4","bit_use": { "low": 0,"up": 3},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]},{"low":136,"up":263,"cElement": [{"cName": "lbus_fifo.lbus1.data.V","cData": "uint128","bit_use": { "low": 0,"up": 127},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]},{"low":264,"up":264,"cElement": [{"cName": "lbus_fifo.lbus1.ena.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]},{"low":265,"up":265,"cElement": [{"cName": "lbus_fifo.lbus1.sop.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]},{"low":266,"up":266,"cElement": [{"cName": "lbus_fifo.lbus1.eop.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]},{"low":267,"up":267,"cElement": [{"cName": "lbus_fifo.lbus1.err.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]},{"low":268,"up":271,"cElement": [{"cName": "lbus_fifo.lbus1.mty.V","cData": "uint4","bit_use": { "low": 0,"up": 3},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]},{"low":272,"up":399,"cElement": [{"cName": "lbus_fifo.lbus2.data.V","cData": "uint128","bit_use": { "low": 0,"up": 127},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]},{"low":400,"up":400,"cElement": [{"cName": "lbus_fifo.lbus2.ena.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]},{"low":401,"up":401,"cElement": [{"cName": "lbus_fifo.lbus2.sop.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]},{"low":402,"up":402,"cElement": [{"cName": "lbus_fifo.lbus2.eop.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]},{"low":403,"up":403,"cElement": [{"cName": "lbus_fifo.lbus2.err.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]},{"low":404,"up":407,"cElement": [{"cName": "lbus_fifo.lbus2.mty.V","cData": "uint4","bit_use": { "low": 0,"up": 3},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]},{"low":408,"up":535,"cElement": [{"cName": "lbus_fifo.lbus3.data.V","cData": "uint128","bit_use": { "low": 0,"up": 127},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]},{"low":536,"up":536,"cElement": [{"cName": "lbus_fifo.lbus3.ena.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]},{"low":537,"up":537,"cElement": [{"cName": "lbus_fifo.lbus3.sop.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]},{"low":538,"up":538,"cElement": [{"cName": "lbus_fifo.lbus3.eop.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]},{"low":539,"up":539,"cElement": [{"cName": "lbus_fifo.lbus3.err.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]},{"low":540,"up":543,"cElement": [{"cName": "lbus_fifo.lbus3.mty.V","cData": "uint4","bit_use": { "low": 0,"up": 3},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "lbus_fifo_pkt_end", "interface" : "wire", "bitwidth" : 408, "direction" : "READONLY", "bitSlice":[{"low":0,"up":127,"cElement": [{"cName": "lbus_fifo_pkt_end.lbus0.data.V","cData": "uint128","bit_use": { "low": 0,"up": 127},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]},{"low":128,"up":128,"cElement": [{"cName": "lbus_fifo_pkt_end.lbus0.ena.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]},{"low":129,"up":129,"cElement": [{"cName": "lbus_fifo_pkt_end.lbus0.sop.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]},{"low":130,"up":130,"cElement": [{"cName": "lbus_fifo_pkt_end.lbus0.eop.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]},{"low":131,"up":131,"cElement": [{"cName": "lbus_fifo_pkt_end.lbus0.err.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]},{"low":132,"up":135,"cElement": [{"cName": "lbus_fifo_pkt_end.lbus0.mty.V","cData": "uint4","bit_use": { "low": 0,"up": 3},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]},{"low":136,"up":263,"cElement": [{"cName": "lbus_fifo_pkt_end.lbus1.data.V","cData": "uint128","bit_use": { "low": 0,"up": 127},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]},{"low":264,"up":264,"cElement": [{"cName": "lbus_fifo_pkt_end.lbus1.ena.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]},{"low":265,"up":265,"cElement": [{"cName": "lbus_fifo_pkt_end.lbus1.sop.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]},{"low":266,"up":266,"cElement": [{"cName": "lbus_fifo_pkt_end.lbus1.eop.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]},{"low":267,"up":267,"cElement": [{"cName": "lbus_fifo_pkt_end.lbus1.err.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]},{"low":268,"up":271,"cElement": [{"cName": "lbus_fifo_pkt_end.lbus1.mty.V","cData": "uint4","bit_use": { "low": 0,"up": 3},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]},{"low":272,"up":399,"cElement": [{"cName": "lbus_fifo_pkt_end.lbus2.data.V","cData": "uint128","bit_use": { "low": 0,"up": 127},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]},{"low":400,"up":400,"cElement": [{"cName": "lbus_fifo_pkt_end.lbus2.ena.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]},{"low":401,"up":401,"cElement": [{"cName": "lbus_fifo_pkt_end.lbus2.sop.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]},{"low":402,"up":402,"cElement": [{"cName": "lbus_fifo_pkt_end.lbus2.eop.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]},{"low":403,"up":403,"cElement": [{"cName": "lbus_fifo_pkt_end.lbus2.err.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]},{"low":404,"up":407,"cElement": [{"cName": "lbus_fifo_pkt_end.lbus2.mty.V","cData": "uint4","bit_use": { "low": 0,"up": 3},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "lbus_fifo_empty_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "lbus_fifo_empty.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "lbus_fifo_pkt_end_empty_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "lbus_fifo_pkt_end_empty.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "lbus_fifo_valid_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "lbus_fifo_valid.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "lbus_fifo_pkt_end_valid_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "lbus_fifo_pkt_end_valid.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "lbus_fifo_re_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "lbus_fifo_re.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "lbus_fifo_pkt_end_re_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "lbus_fifo_pkt_end_re.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "error_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "error.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "m_axis_data_V", "interface" : "wire", "bitwidth" : 512, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":511,"cElement": [{"cName": "m_axis.data.V","cData": "uint512","bit_use": { "low": 0,"up": 511},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "m_axis_keep_V", "interface" : "wire", "bitwidth" : 64, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "m_axis.keep.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "m_axis_last_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "m_axis.last.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "m_axis_valid_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "m_axis.valid.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} ]}
# RTL Port declarations: 
set portNum 15
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ lbus_fifo sc_in sc_lv 544 signal 0 } 
	{ lbus_fifo_pkt_end sc_in sc_lv 408 signal 1 } 
	{ lbus_fifo_empty_V sc_in sc_lv 1 signal 2 } 
	{ lbus_fifo_pkt_end_empty_V sc_in sc_lv 1 signal 3 } 
	{ lbus_fifo_valid_V sc_in sc_lv 1 signal 4 } 
	{ lbus_fifo_pkt_end_valid_V sc_in sc_lv 1 signal 5 } 
	{ lbus_fifo_re_V sc_out sc_lv 1 signal 6 } 
	{ lbus_fifo_pkt_end_re_V sc_out sc_lv 1 signal 7 } 
	{ error_V sc_out sc_lv 1 signal 8 } 
	{ m_axis_data_V sc_out sc_lv 512 signal 9 } 
	{ m_axis_keep_V sc_out sc_lv 64 signal 10 } 
	{ m_axis_last_V sc_out sc_lv 1 signal 11 } 
	{ m_axis_valid_V sc_out sc_lv 1 signal 12 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "lbus_fifo", "direction": "in", "datatype": "sc_lv", "bitwidth":544, "type": "signal", "bundle":{"name": "lbus_fifo", "role": "default" }} , 
 	{ "name": "lbus_fifo_pkt_end", "direction": "in", "datatype": "sc_lv", "bitwidth":408, "type": "signal", "bundle":{"name": "lbus_fifo_pkt_end", "role": "default" }} , 
 	{ "name": "lbus_fifo_empty_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "lbus_fifo_empty_V", "role": "default" }} , 
 	{ "name": "lbus_fifo_pkt_end_empty_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "lbus_fifo_pkt_end_empty_V", "role": "default" }} , 
 	{ "name": "lbus_fifo_valid_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "lbus_fifo_valid_V", "role": "default" }} , 
 	{ "name": "lbus_fifo_pkt_end_valid_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "lbus_fifo_pkt_end_valid_V", "role": "default" }} , 
 	{ "name": "lbus_fifo_re_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "lbus_fifo_re_V", "role": "default" }} , 
 	{ "name": "lbus_fifo_pkt_end_re_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "lbus_fifo_pkt_end_re_V", "role": "default" }} , 
 	{ "name": "error_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "error_V", "role": "default" }} , 
 	{ "name": "m_axis_data_V", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "m_axis_data_V", "role": "default" }} , 
 	{ "name": "m_axis_keep_V", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "m_axis_keep_V", "role": "default" }} , 
 	{ "name": "m_axis_last_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m_axis_last_V", "role": "default" }} , 
 	{ "name": "m_axis_valid_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m_axis_valid_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4"],
		"CDFG" : "lbus_fifo_read",
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
			{"Name" : "lbus_fifo", "Type" : "None", "Direction" : "I"},
			{"Name" : "lbus_fifo_pkt_end", "Type" : "None", "Direction" : "I"},
			{"Name" : "lbus_fifo_empty_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "lbus_fifo_pkt_end_empty_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "lbus_fifo_valid_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "lbus_fifo_pkt_end_valid_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "lbus_fifo_re_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "lbus_fifo_pkt_end_re_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "error_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "m_axis_data_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "m_axis_keep_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "m_axis_last_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "m_axis_valid_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "m_axis_databuf_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "m_axis_keepbuf_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "keep1mask_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "m_axis_keepbuf_V_2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "keep2mask_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "m_axis_keepbuf_V_3", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "keep3mask_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "m_axis_keepbuf_V_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "m_axis_lastbuf_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "m_axis_validbuf_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "outbuf_data_V_3", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "outbuf_data_V_2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "outbuf_data_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "outbuf_data_V_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "outbuf_mty_V_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "outbuf_ena_V_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "outbuf_mty_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "outbuf_ena_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "outbuf_mty_V_2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "outbuf_ena_V_2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "outbuf_mty_V_3", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "outbuf_ena_V_3", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "outbuf_eop_V_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "outbuf_eop_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "outbuf_eop_V_2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "outbuf_eop_V_3", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "output_valid_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "out_pktendbuf_ena_V_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "out_pktendbuf_data_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "out_pktendbuf_eop_V_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "out_pktendbuf_mty_V_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "out_pktendbuf_data_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "out_pktendbuf_ena_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "out_pktendbuf_eop_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "out_pktendbuf_mty_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "out_pktendbuf_data_V_2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "out_pktendbuf_ena_V_2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "out_pktendbuf_eop_V_2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "out_pktendbuf_mty_V_2", "Type" : "OVld", "Direction" : "IO"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.call_ret_mty2keep_fu_318", "Parent" : "0",
		"CDFG" : "mty2keep",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "mty_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "ena_V", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.call_ret1_mty2keep_fu_324", "Parent" : "0",
		"CDFG" : "mty2keep",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "mty_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "ena_V", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.call_ret2_mty2keep_fu_330", "Parent" : "0",
		"CDFG" : "mty2keep",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "mty_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "ena_V", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.call_ret3_mty2keep_fu_336", "Parent" : "0",
		"CDFG" : "mty2keep",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "1", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "1",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "mty_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "ena_V", "Type" : "None", "Direction" : "I"}]}]}


set ArgLastReadFirstWriteLatency {
	lbus_fifo_read {
		lbus_fifo {Type I LastRead 0 FirstWrite -1}
		lbus_fifo_pkt_end {Type I LastRead 0 FirstWrite -1}
		lbus_fifo_empty_V {Type I LastRead 0 FirstWrite -1}
		lbus_fifo_pkt_end_empty_V {Type I LastRead 0 FirstWrite -1}
		lbus_fifo_valid_V {Type I LastRead 0 FirstWrite -1}
		lbus_fifo_pkt_end_valid_V {Type I LastRead 0 FirstWrite -1}
		lbus_fifo_re_V {Type O LastRead -1 FirstWrite 0}
		lbus_fifo_pkt_end_re_V {Type O LastRead -1 FirstWrite 0}
		error_V {Type O LastRead -1 FirstWrite 0}
		m_axis_data_V {Type O LastRead -1 FirstWrite 0}
		m_axis_keep_V {Type O LastRead -1 FirstWrite 0}
		m_axis_last_V {Type O LastRead -1 FirstWrite 0}
		m_axis_valid_V {Type O LastRead -1 FirstWrite 0}
		m_axis_databuf_V {Type IO LastRead -1 FirstWrite -1}
		m_axis_keepbuf_V_1 {Type IO LastRead -1 FirstWrite -1}
		keep1mask_V {Type IO LastRead -1 FirstWrite -1}
		m_axis_keepbuf_V_2 {Type IO LastRead -1 FirstWrite -1}
		keep2mask_V {Type IO LastRead -1 FirstWrite -1}
		m_axis_keepbuf_V_3 {Type IO LastRead -1 FirstWrite -1}
		keep3mask_V {Type IO LastRead -1 FirstWrite -1}
		m_axis_keepbuf_V_0 {Type IO LastRead -1 FirstWrite -1}
		m_axis_lastbuf_V {Type IO LastRead -1 FirstWrite -1}
		m_axis_validbuf_V {Type IO LastRead -1 FirstWrite -1}
		outbuf_data_V_3 {Type IO LastRead -1 FirstWrite -1}
		outbuf_data_V_2 {Type IO LastRead -1 FirstWrite -1}
		outbuf_data_V_1 {Type IO LastRead -1 FirstWrite -1}
		outbuf_data_V_0 {Type IO LastRead -1 FirstWrite -1}
		outbuf_mty_V_0 {Type IO LastRead -1 FirstWrite -1}
		outbuf_ena_V_0 {Type IO LastRead -1 FirstWrite -1}
		outbuf_mty_V_1 {Type IO LastRead -1 FirstWrite -1}
		outbuf_ena_V_1 {Type IO LastRead -1 FirstWrite -1}
		outbuf_mty_V_2 {Type IO LastRead -1 FirstWrite -1}
		outbuf_ena_V_2 {Type IO LastRead -1 FirstWrite -1}
		outbuf_mty_V_3 {Type IO LastRead -1 FirstWrite -1}
		outbuf_ena_V_3 {Type IO LastRead -1 FirstWrite -1}
		outbuf_eop_V_0 {Type IO LastRead -1 FirstWrite -1}
		outbuf_eop_V_1 {Type IO LastRead -1 FirstWrite -1}
		outbuf_eop_V_2 {Type IO LastRead -1 FirstWrite -1}
		outbuf_eop_V_3 {Type IO LastRead -1 FirstWrite -1}
		output_valid_V {Type IO LastRead -1 FirstWrite -1}
		out_pktendbuf_ena_V_s {Type IO LastRead -1 FirstWrite -1}
		out_pktendbuf_data_V {Type IO LastRead -1 FirstWrite -1}
		out_pktendbuf_eop_V_s {Type IO LastRead -1 FirstWrite -1}
		out_pktendbuf_mty_V_s {Type IO LastRead -1 FirstWrite -1}
		out_pktendbuf_data_V_1 {Type IO LastRead -1 FirstWrite -1}
		out_pktendbuf_ena_V_1 {Type IO LastRead -1 FirstWrite -1}
		out_pktendbuf_eop_V_1 {Type IO LastRead -1 FirstWrite -1}
		out_pktendbuf_mty_V_1 {Type IO LastRead -1 FirstWrite -1}
		out_pktendbuf_data_V_2 {Type IO LastRead -1 FirstWrite -1}
		out_pktendbuf_ena_V_2 {Type IO LastRead -1 FirstWrite -1}
		out_pktendbuf_eop_V_2 {Type IO LastRead -1 FirstWrite -1}
		out_pktendbuf_mty_V_2 {Type IO LastRead -1 FirstWrite -1}}
	mty2keep {
		mty_V {Type I LastRead 0 FirstWrite -1}
		ena_V {Type I LastRead 0 FirstWrite -1}}
	mty2keep {
		mty_V {Type I LastRead 0 FirstWrite -1}
		ena_V {Type I LastRead 0 FirstWrite -1}}
	mty2keep {
		mty_V {Type I LastRead 0 FirstWrite -1}
		ena_V {Type I LastRead 0 FirstWrite -1}}
	mty2keep {
		mty_V {Type I LastRead 0 FirstWrite -1}
		ena_V {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "0", "Max" : "0"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	lbus_fifo { ap_none {  { lbus_fifo in_data 0 544 } } }
	lbus_fifo_pkt_end { ap_none {  { lbus_fifo_pkt_end in_data 0 408 } } }
	lbus_fifo_empty_V { ap_none {  { lbus_fifo_empty_V in_data 0 1 } } }
	lbus_fifo_pkt_end_empty_V { ap_none {  { lbus_fifo_pkt_end_empty_V in_data 0 1 } } }
	lbus_fifo_valid_V { ap_none {  { lbus_fifo_valid_V in_data 0 1 } } }
	lbus_fifo_pkt_end_valid_V { ap_none {  { lbus_fifo_pkt_end_valid_V in_data 0 1 } } }
	lbus_fifo_re_V { ap_none {  { lbus_fifo_re_V out_data 1 1 } } }
	lbus_fifo_pkt_end_re_V { ap_none {  { lbus_fifo_pkt_end_re_V out_data 1 1 } } }
	error_V { ap_none {  { error_V out_data 1 1 } } }
	m_axis_data_V { ap_none {  { m_axis_data_V out_data 1 512 } } }
	m_axis_keep_V { ap_none {  { m_axis_keep_V out_data 1 64 } } }
	m_axis_last_V { ap_none {  { m_axis_last_V out_data 1 1 } } }
	m_axis_valid_V { ap_none {  { m_axis_valid_V out_data 1 1 } } }
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
