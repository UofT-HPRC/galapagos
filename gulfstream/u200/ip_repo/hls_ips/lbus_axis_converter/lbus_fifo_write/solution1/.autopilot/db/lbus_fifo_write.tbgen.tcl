set moduleName lbus_fifo_write
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
set C_modelName {lbus_fifo_write}
set C_modelType { void 0 }
set C_modelArgList {
	{ lbus_0_data_V int 128 regular {pointer 0}  }
	{ lbus_1_data_V int 128 regular {pointer 0}  }
	{ lbus_2_data_V int 128 regular {pointer 0}  }
	{ lbus_3_data_V int 128 regular {pointer 0}  }
	{ lbus_0_ena_V int 1 regular {pointer 0}  }
	{ lbus_1_ena_V int 1 regular {pointer 0}  }
	{ lbus_2_ena_V int 1 regular {pointer 0}  }
	{ lbus_3_ena_V int 1 regular {pointer 0}  }
	{ lbus_0_sop_V int 1 regular {pointer 0}  }
	{ lbus_1_sop_V int 1 regular {pointer 0}  }
	{ lbus_2_sop_V int 1 regular {pointer 0}  }
	{ lbus_3_sop_V int 1 regular {pointer 0}  }
	{ lbus_0_eop_V int 1 regular {pointer 0}  }
	{ lbus_1_eop_V int 1 regular {pointer 0}  }
	{ lbus_2_eop_V int 1 regular {pointer 0}  }
	{ lbus_3_eop_V int 1 regular {pointer 0}  }
	{ lbus_0_err_V int 1 regular {pointer 0}  }
	{ lbus_1_err_V int 1 regular {pointer 0}  }
	{ lbus_2_err_V int 1 regular {pointer 0}  }
	{ lbus_3_err_V int 1 regular {pointer 0}  }
	{ lbus_0_mty_V int 4 regular {pointer 0}  }
	{ lbus_1_mty_V int 4 regular {pointer 0}  }
	{ lbus_2_mty_V int 4 regular {pointer 0}  }
	{ lbus_3_mty_V int 4 regular {pointer 0}  }
	{ lbus_fifo int 544 regular {pointer 1}  }
	{ lbus_fifo_we_V int 1 regular {pointer 1}  }
	{ lbus_fifo_pkt_end int 408 regular {pointer 1}  }
	{ lbus_fifo_pkt_end_we_V int 1 regular {pointer 1}  }
	{ error_V int 1 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "lbus_0_data_V", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY", "bitSlice":[{"low":0,"up":127,"cElement": [{"cName": "lbus.data.V","cData": "uint128","bit_use": { "low": 0,"up": 127},"cArray": [{"low" : 0,"up" : 0,"step" : 2}]}]}]} , 
 	{ "Name" : "lbus_1_data_V", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY", "bitSlice":[{"low":0,"up":127,"cElement": [{"cName": "lbus.data.V","cData": "uint128","bit_use": { "low": 0,"up": 127},"cArray": [{"low" : 1,"up" : 1,"step" : 2}]}]}]} , 
 	{ "Name" : "lbus_2_data_V", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY", "bitSlice":[{"low":0,"up":127,"cElement": [{"cName": "lbus.data.V","cData": "uint128","bit_use": { "low": 0,"up": 127},"cArray": [{"low" : 2,"up" : 2,"step" : 2}]}]}]} , 
 	{ "Name" : "lbus_3_data_V", "interface" : "wire", "bitwidth" : 128, "direction" : "READONLY", "bitSlice":[{"low":0,"up":127,"cElement": [{"cName": "lbus.data.V","cData": "uint128","bit_use": { "low": 0,"up": 127},"cArray": [{"low" : 3,"up" : 3,"step" : 2}]}]}]} , 
 	{ "Name" : "lbus_0_ena_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "lbus.ena.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 2}]}]}]} , 
 	{ "Name" : "lbus_1_ena_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "lbus.ena.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 1,"up" : 1,"step" : 2}]}]}]} , 
 	{ "Name" : "lbus_2_ena_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "lbus.ena.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 2,"up" : 2,"step" : 2}]}]}]} , 
 	{ "Name" : "lbus_3_ena_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "lbus.ena.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 3,"up" : 3,"step" : 2}]}]}]} , 
 	{ "Name" : "lbus_0_sop_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "lbus.sop.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 2}]}]}]} , 
 	{ "Name" : "lbus_1_sop_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "lbus.sop.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 1,"up" : 1,"step" : 2}]}]}]} , 
 	{ "Name" : "lbus_2_sop_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "lbus.sop.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 2,"up" : 2,"step" : 2}]}]}]} , 
 	{ "Name" : "lbus_3_sop_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "lbus.sop.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 3,"up" : 3,"step" : 2}]}]}]} , 
 	{ "Name" : "lbus_0_eop_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "lbus.eop.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 2}]}]}]} , 
 	{ "Name" : "lbus_1_eop_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "lbus.eop.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 1,"up" : 1,"step" : 2}]}]}]} , 
 	{ "Name" : "lbus_2_eop_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "lbus.eop.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 2,"up" : 2,"step" : 2}]}]}]} , 
 	{ "Name" : "lbus_3_eop_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "lbus.eop.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 3,"up" : 3,"step" : 2}]}]}]} , 
 	{ "Name" : "lbus_0_err_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "lbus.err.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 2}]}]}]} , 
 	{ "Name" : "lbus_1_err_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "lbus.err.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 1,"up" : 1,"step" : 2}]}]}]} , 
 	{ "Name" : "lbus_2_err_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "lbus.err.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 2,"up" : 2,"step" : 2}]}]}]} , 
 	{ "Name" : "lbus_3_err_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "lbus.err.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 3,"up" : 3,"step" : 2}]}]}]} , 
 	{ "Name" : "lbus_0_mty_V", "interface" : "wire", "bitwidth" : 4, "direction" : "READONLY", "bitSlice":[{"low":0,"up":3,"cElement": [{"cName": "lbus.mty.V","cData": "uint4","bit_use": { "low": 0,"up": 3},"cArray": [{"low" : 0,"up" : 0,"step" : 2}]}]}]} , 
 	{ "Name" : "lbus_1_mty_V", "interface" : "wire", "bitwidth" : 4, "direction" : "READONLY", "bitSlice":[{"low":0,"up":3,"cElement": [{"cName": "lbus.mty.V","cData": "uint4","bit_use": { "low": 0,"up": 3},"cArray": [{"low" : 1,"up" : 1,"step" : 2}]}]}]} , 
 	{ "Name" : "lbus_2_mty_V", "interface" : "wire", "bitwidth" : 4, "direction" : "READONLY", "bitSlice":[{"low":0,"up":3,"cElement": [{"cName": "lbus.mty.V","cData": "uint4","bit_use": { "low": 0,"up": 3},"cArray": [{"low" : 2,"up" : 2,"step" : 2}]}]}]} , 
 	{ "Name" : "lbus_3_mty_V", "interface" : "wire", "bitwidth" : 4, "direction" : "READONLY", "bitSlice":[{"low":0,"up":3,"cElement": [{"cName": "lbus.mty.V","cData": "uint4","bit_use": { "low": 0,"up": 3},"cArray": [{"low" : 3,"up" : 3,"step" : 2}]}]}]} , 
 	{ "Name" : "lbus_fifo", "interface" : "wire", "bitwidth" : 544, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":127,"cElement": [{"cName": "lbus_fifo.lbus0.data.V","cData": "uint128","bit_use": { "low": 0,"up": 127},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":128,"up":128,"cElement": [{"cName": "lbus_fifo.lbus0.ena.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":129,"up":129,"cElement": [{"cName": "lbus_fifo.lbus0.sop.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":130,"up":130,"cElement": [{"cName": "lbus_fifo.lbus0.eop.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":131,"up":131,"cElement": [{"cName": "lbus_fifo.lbus0.err.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":132,"up":135,"cElement": [{"cName": "lbus_fifo.lbus0.mty.V","cData": "uint4","bit_use": { "low": 0,"up": 3},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":136,"up":263,"cElement": [{"cName": "lbus_fifo.lbus1.data.V","cData": "uint128","bit_use": { "low": 0,"up": 127},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":264,"up":264,"cElement": [{"cName": "lbus_fifo.lbus1.ena.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":265,"up":265,"cElement": [{"cName": "lbus_fifo.lbus1.sop.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":266,"up":266,"cElement": [{"cName": "lbus_fifo.lbus1.eop.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":267,"up":267,"cElement": [{"cName": "lbus_fifo.lbus1.err.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":268,"up":271,"cElement": [{"cName": "lbus_fifo.lbus1.mty.V","cData": "uint4","bit_use": { "low": 0,"up": 3},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":272,"up":399,"cElement": [{"cName": "lbus_fifo.lbus2.data.V","cData": "uint128","bit_use": { "low": 0,"up": 127},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":400,"up":400,"cElement": [{"cName": "lbus_fifo.lbus2.ena.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":401,"up":401,"cElement": [{"cName": "lbus_fifo.lbus2.sop.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":402,"up":402,"cElement": [{"cName": "lbus_fifo.lbus2.eop.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":403,"up":403,"cElement": [{"cName": "lbus_fifo.lbus2.err.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":404,"up":407,"cElement": [{"cName": "lbus_fifo.lbus2.mty.V","cData": "uint4","bit_use": { "low": 0,"up": 3},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":408,"up":535,"cElement": [{"cName": "lbus_fifo.lbus3.data.V","cData": "uint128","bit_use": { "low": 0,"up": 127},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":536,"up":536,"cElement": [{"cName": "lbus_fifo.lbus3.ena.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":537,"up":537,"cElement": [{"cName": "lbus_fifo.lbus3.sop.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":538,"up":538,"cElement": [{"cName": "lbus_fifo.lbus3.eop.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":539,"up":539,"cElement": [{"cName": "lbus_fifo.lbus3.err.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":540,"up":543,"cElement": [{"cName": "lbus_fifo.lbus3.mty.V","cData": "uint4","bit_use": { "low": 0,"up": 3},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "lbus_fifo_we_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "lbus_fifo_we.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "lbus_fifo_pkt_end", "interface" : "wire", "bitwidth" : 408, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":127,"cElement": [{"cName": "lbus_fifo_pkt_end.lbus0.data.V","cData": "uint128","bit_use": { "low": 0,"up": 127},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":128,"up":128,"cElement": [{"cName": "lbus_fifo_pkt_end.lbus0.ena.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":129,"up":129,"cElement": [{"cName": "lbus_fifo_pkt_end.lbus0.sop.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":130,"up":130,"cElement": [{"cName": "lbus_fifo_pkt_end.lbus0.eop.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":131,"up":131,"cElement": [{"cName": "lbus_fifo_pkt_end.lbus0.err.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":132,"up":135,"cElement": [{"cName": "lbus_fifo_pkt_end.lbus0.mty.V","cData": "uint4","bit_use": { "low": 0,"up": 3},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":136,"up":263,"cElement": [{"cName": "lbus_fifo_pkt_end.lbus1.data.V","cData": "uint128","bit_use": { "low": 0,"up": 127},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":264,"up":264,"cElement": [{"cName": "lbus_fifo_pkt_end.lbus1.ena.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":265,"up":265,"cElement": [{"cName": "lbus_fifo_pkt_end.lbus1.sop.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":266,"up":266,"cElement": [{"cName": "lbus_fifo_pkt_end.lbus1.eop.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":267,"up":267,"cElement": [{"cName": "lbus_fifo_pkt_end.lbus1.err.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":268,"up":271,"cElement": [{"cName": "lbus_fifo_pkt_end.lbus1.mty.V","cData": "uint4","bit_use": { "low": 0,"up": 3},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":272,"up":399,"cElement": [{"cName": "lbus_fifo_pkt_end.lbus2.data.V","cData": "uint128","bit_use": { "low": 0,"up": 127},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":400,"up":400,"cElement": [{"cName": "lbus_fifo_pkt_end.lbus2.ena.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":401,"up":401,"cElement": [{"cName": "lbus_fifo_pkt_end.lbus2.sop.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":402,"up":402,"cElement": [{"cName": "lbus_fifo_pkt_end.lbus2.eop.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":403,"up":403,"cElement": [{"cName": "lbus_fifo_pkt_end.lbus2.err.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":404,"up":407,"cElement": [{"cName": "lbus_fifo_pkt_end.lbus2.mty.V","cData": "uint4","bit_use": { "low": 0,"up": 3},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "lbus_fifo_pkt_end_we_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "lbus_fifo_pkt_end_we.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "error_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "error.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} ]}
# RTL Port declarations: 
set portNum 31
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ lbus_0_data_V sc_in sc_lv 128 signal 0 } 
	{ lbus_1_data_V sc_in sc_lv 128 signal 1 } 
	{ lbus_2_data_V sc_in sc_lv 128 signal 2 } 
	{ lbus_3_data_V sc_in sc_lv 128 signal 3 } 
	{ lbus_0_ena_V sc_in sc_lv 1 signal 4 } 
	{ lbus_1_ena_V sc_in sc_lv 1 signal 5 } 
	{ lbus_2_ena_V sc_in sc_lv 1 signal 6 } 
	{ lbus_3_ena_V sc_in sc_lv 1 signal 7 } 
	{ lbus_0_sop_V sc_in sc_lv 1 signal 8 } 
	{ lbus_1_sop_V sc_in sc_lv 1 signal 9 } 
	{ lbus_2_sop_V sc_in sc_lv 1 signal 10 } 
	{ lbus_3_sop_V sc_in sc_lv 1 signal 11 } 
	{ lbus_0_eop_V sc_in sc_lv 1 signal 12 } 
	{ lbus_1_eop_V sc_in sc_lv 1 signal 13 } 
	{ lbus_2_eop_V sc_in sc_lv 1 signal 14 } 
	{ lbus_3_eop_V sc_in sc_lv 1 signal 15 } 
	{ lbus_0_err_V sc_in sc_lv 1 signal 16 } 
	{ lbus_1_err_V sc_in sc_lv 1 signal 17 } 
	{ lbus_2_err_V sc_in sc_lv 1 signal 18 } 
	{ lbus_3_err_V sc_in sc_lv 1 signal 19 } 
	{ lbus_0_mty_V sc_in sc_lv 4 signal 20 } 
	{ lbus_1_mty_V sc_in sc_lv 4 signal 21 } 
	{ lbus_2_mty_V sc_in sc_lv 4 signal 22 } 
	{ lbus_3_mty_V sc_in sc_lv 4 signal 23 } 
	{ lbus_fifo sc_out sc_lv 544 signal 24 } 
	{ lbus_fifo_we_V sc_out sc_lv 1 signal 25 } 
	{ lbus_fifo_pkt_end sc_out sc_lv 408 signal 26 } 
	{ lbus_fifo_pkt_end_we_V sc_out sc_lv 1 signal 27 } 
	{ error_V sc_out sc_lv 1 signal 28 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "lbus_0_data_V", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "lbus_0_data_V", "role": "default" }} , 
 	{ "name": "lbus_1_data_V", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "lbus_1_data_V", "role": "default" }} , 
 	{ "name": "lbus_2_data_V", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "lbus_2_data_V", "role": "default" }} , 
 	{ "name": "lbus_3_data_V", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "lbus_3_data_V", "role": "default" }} , 
 	{ "name": "lbus_0_ena_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "lbus_0_ena_V", "role": "default" }} , 
 	{ "name": "lbus_1_ena_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "lbus_1_ena_V", "role": "default" }} , 
 	{ "name": "lbus_2_ena_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "lbus_2_ena_V", "role": "default" }} , 
 	{ "name": "lbus_3_ena_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "lbus_3_ena_V", "role": "default" }} , 
 	{ "name": "lbus_0_sop_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "lbus_0_sop_V", "role": "default" }} , 
 	{ "name": "lbus_1_sop_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "lbus_1_sop_V", "role": "default" }} , 
 	{ "name": "lbus_2_sop_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "lbus_2_sop_V", "role": "default" }} , 
 	{ "name": "lbus_3_sop_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "lbus_3_sop_V", "role": "default" }} , 
 	{ "name": "lbus_0_eop_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "lbus_0_eop_V", "role": "default" }} , 
 	{ "name": "lbus_1_eop_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "lbus_1_eop_V", "role": "default" }} , 
 	{ "name": "lbus_2_eop_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "lbus_2_eop_V", "role": "default" }} , 
 	{ "name": "lbus_3_eop_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "lbus_3_eop_V", "role": "default" }} , 
 	{ "name": "lbus_0_err_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "lbus_0_err_V", "role": "default" }} , 
 	{ "name": "lbus_1_err_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "lbus_1_err_V", "role": "default" }} , 
 	{ "name": "lbus_2_err_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "lbus_2_err_V", "role": "default" }} , 
 	{ "name": "lbus_3_err_V", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "lbus_3_err_V", "role": "default" }} , 
 	{ "name": "lbus_0_mty_V", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "lbus_0_mty_V", "role": "default" }} , 
 	{ "name": "lbus_1_mty_V", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "lbus_1_mty_V", "role": "default" }} , 
 	{ "name": "lbus_2_mty_V", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "lbus_2_mty_V", "role": "default" }} , 
 	{ "name": "lbus_3_mty_V", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "lbus_3_mty_V", "role": "default" }} , 
 	{ "name": "lbus_fifo", "direction": "out", "datatype": "sc_lv", "bitwidth":544, "type": "signal", "bundle":{"name": "lbus_fifo", "role": "default" }} , 
 	{ "name": "lbus_fifo_we_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "lbus_fifo_we_V", "role": "default" }} , 
 	{ "name": "lbus_fifo_pkt_end", "direction": "out", "datatype": "sc_lv", "bitwidth":408, "type": "signal", "bundle":{"name": "lbus_fifo_pkt_end", "role": "default" }} , 
 	{ "name": "lbus_fifo_pkt_end_we_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "lbus_fifo_pkt_end_we_V", "role": "default" }} , 
 	{ "name": "error_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "error_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "lbus_fifo_write",
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
			{"Name" : "lbus_0_data_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "lbus_1_data_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "lbus_2_data_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "lbus_3_data_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "lbus_0_ena_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "lbus_1_ena_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "lbus_2_ena_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "lbus_3_ena_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "lbus_0_sop_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "lbus_1_sop_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "lbus_2_sop_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "lbus_3_sop_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "lbus_0_eop_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "lbus_1_eop_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "lbus_2_eop_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "lbus_3_eop_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "lbus_0_err_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "lbus_1_err_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "lbus_2_err_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "lbus_3_err_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "lbus_0_mty_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "lbus_1_mty_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "lbus_2_mty_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "lbus_3_mty_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "lbus_fifo", "Type" : "None", "Direction" : "O"},
			{"Name" : "lbus_fifo_we_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "lbus_fifo_pkt_end", "Type" : "None", "Direction" : "O"},
			{"Name" : "lbus_fifo_pkt_end_we_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "error_V", "Type" : "None", "Direction" : "O"},
			{"Name" : "fifo_write_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_output_reg0_dat", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_output_reg0_ena", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_output_reg0_sop", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_output_reg0_eop", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_output_reg0_err", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_output_reg0_mty", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_output_reg1_dat", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_output_reg1_ena", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_output_reg1_sop", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_output_reg1_eop", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_output_reg1_err", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_output_reg1_mty", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_output_reg2_dat", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_output_reg2_ena", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_output_reg2_sop", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_output_reg2_eop", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_output_reg2_err", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_output_reg2_mty", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_output_reg3_dat", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_output_reg3_ena", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_output_reg3_sop", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_output_reg3_eop", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_output_reg3_err", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_output_reg3_mty", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_endpkt_reg0_dat", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_endpkt_reg0_ena", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_endpkt_reg0_sop", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_endpkt_reg0_eop", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_endpkt_reg0_err", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_endpkt_reg0_mty", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_endpkt_reg1_dat", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_endpkt_reg1_ena", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_endpkt_reg1_sop", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_endpkt_reg1_eop", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_endpkt_reg1_err", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_endpkt_reg1_mty", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_endpkt_reg2_dat", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_endpkt_reg2_ena", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_endpkt_reg2_sop", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_endpkt_reg2_eop", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_endpkt_reg2_err", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_endpkt_reg2_mty", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_input_reg0_ena_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "input_reg_eop_zero_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_input_reg1_data", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_input_reg1_ena_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_input_reg1_sop_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_input_reg1_eop_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_input_reg1_err_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_input_reg1_mty_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_input_reg2_data", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_input_reg2_ena_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_input_reg2_sop_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_input_reg2_eop_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_input_reg2_err_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_input_reg2_mty_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_input_reg3_data", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_input_reg3_ena_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_input_reg3_sop_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_input_reg3_eop_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_input_reg3_err_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_input_reg3_mty_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "start_position_reg_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "outputreg_partial_lo", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "outputreg_eop_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_input_reg0_data", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_input_reg0_sop_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_input_reg0_eop_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_input_reg0_err_s", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "lbus_input_reg0_mty_s", "Type" : "OVld", "Direction" : "IO"}]}]}


set ArgLastReadFirstWriteLatency {
	lbus_fifo_write {
		lbus_0_data_V {Type I LastRead 0 FirstWrite -1}
		lbus_1_data_V {Type I LastRead 0 FirstWrite -1}
		lbus_2_data_V {Type I LastRead 0 FirstWrite -1}
		lbus_3_data_V {Type I LastRead 0 FirstWrite -1}
		lbus_0_ena_V {Type I LastRead 0 FirstWrite -1}
		lbus_1_ena_V {Type I LastRead 0 FirstWrite -1}
		lbus_2_ena_V {Type I LastRead 0 FirstWrite -1}
		lbus_3_ena_V {Type I LastRead 0 FirstWrite -1}
		lbus_0_sop_V {Type I LastRead 0 FirstWrite -1}
		lbus_1_sop_V {Type I LastRead 0 FirstWrite -1}
		lbus_2_sop_V {Type I LastRead 0 FirstWrite -1}
		lbus_3_sop_V {Type I LastRead 0 FirstWrite -1}
		lbus_0_eop_V {Type I LastRead 0 FirstWrite -1}
		lbus_1_eop_V {Type I LastRead 0 FirstWrite -1}
		lbus_2_eop_V {Type I LastRead 0 FirstWrite -1}
		lbus_3_eop_V {Type I LastRead 0 FirstWrite -1}
		lbus_0_err_V {Type I LastRead 0 FirstWrite -1}
		lbus_1_err_V {Type I LastRead 0 FirstWrite -1}
		lbus_2_err_V {Type I LastRead 0 FirstWrite -1}
		lbus_3_err_V {Type I LastRead 0 FirstWrite -1}
		lbus_0_mty_V {Type I LastRead 0 FirstWrite -1}
		lbus_1_mty_V {Type I LastRead 0 FirstWrite -1}
		lbus_2_mty_V {Type I LastRead 0 FirstWrite -1}
		lbus_3_mty_V {Type I LastRead 0 FirstWrite -1}
		lbus_fifo {Type O LastRead -1 FirstWrite 0}
		lbus_fifo_we_V {Type O LastRead -1 FirstWrite 0}
		lbus_fifo_pkt_end {Type O LastRead -1 FirstWrite 0}
		lbus_fifo_pkt_end_we_V {Type O LastRead -1 FirstWrite 0}
		error_V {Type O LastRead -1 FirstWrite 0}
		fifo_write_V {Type IO LastRead -1 FirstWrite -1}
		lbus_output_reg0_dat {Type IO LastRead -1 FirstWrite -1}
		lbus_output_reg0_ena {Type IO LastRead -1 FirstWrite -1}
		lbus_output_reg0_sop {Type IO LastRead -1 FirstWrite -1}
		lbus_output_reg0_eop {Type IO LastRead -1 FirstWrite -1}
		lbus_output_reg0_err {Type IO LastRead -1 FirstWrite -1}
		lbus_output_reg0_mty {Type IO LastRead -1 FirstWrite -1}
		lbus_output_reg1_dat {Type IO LastRead -1 FirstWrite -1}
		lbus_output_reg1_ena {Type IO LastRead -1 FirstWrite -1}
		lbus_output_reg1_sop {Type IO LastRead -1 FirstWrite -1}
		lbus_output_reg1_eop {Type IO LastRead -1 FirstWrite -1}
		lbus_output_reg1_err {Type IO LastRead -1 FirstWrite -1}
		lbus_output_reg1_mty {Type IO LastRead -1 FirstWrite -1}
		lbus_output_reg2_dat {Type IO LastRead -1 FirstWrite -1}
		lbus_output_reg2_ena {Type IO LastRead -1 FirstWrite -1}
		lbus_output_reg2_sop {Type IO LastRead -1 FirstWrite -1}
		lbus_output_reg2_eop {Type IO LastRead -1 FirstWrite -1}
		lbus_output_reg2_err {Type IO LastRead -1 FirstWrite -1}
		lbus_output_reg2_mty {Type IO LastRead -1 FirstWrite -1}
		lbus_output_reg3_dat {Type IO LastRead -1 FirstWrite -1}
		lbus_output_reg3_ena {Type IO LastRead -1 FirstWrite -1}
		lbus_output_reg3_sop {Type IO LastRead -1 FirstWrite -1}
		lbus_output_reg3_eop {Type IO LastRead -1 FirstWrite -1}
		lbus_output_reg3_err {Type IO LastRead -1 FirstWrite -1}
		lbus_output_reg3_mty {Type IO LastRead -1 FirstWrite -1}
		lbus_endpkt_reg0_dat {Type IO LastRead -1 FirstWrite -1}
		lbus_endpkt_reg0_ena {Type IO LastRead -1 FirstWrite -1}
		lbus_endpkt_reg0_sop {Type IO LastRead -1 FirstWrite -1}
		lbus_endpkt_reg0_eop {Type IO LastRead -1 FirstWrite -1}
		lbus_endpkt_reg0_err {Type IO LastRead -1 FirstWrite -1}
		lbus_endpkt_reg0_mty {Type IO LastRead -1 FirstWrite -1}
		lbus_endpkt_reg1_dat {Type IO LastRead -1 FirstWrite -1}
		lbus_endpkt_reg1_ena {Type IO LastRead -1 FirstWrite -1}
		lbus_endpkt_reg1_sop {Type IO LastRead -1 FirstWrite -1}
		lbus_endpkt_reg1_eop {Type IO LastRead -1 FirstWrite -1}
		lbus_endpkt_reg1_err {Type IO LastRead -1 FirstWrite -1}
		lbus_endpkt_reg1_mty {Type IO LastRead -1 FirstWrite -1}
		lbus_endpkt_reg2_dat {Type IO LastRead -1 FirstWrite -1}
		lbus_endpkt_reg2_ena {Type IO LastRead -1 FirstWrite -1}
		lbus_endpkt_reg2_sop {Type IO LastRead -1 FirstWrite -1}
		lbus_endpkt_reg2_eop {Type IO LastRead -1 FirstWrite -1}
		lbus_endpkt_reg2_err {Type IO LastRead -1 FirstWrite -1}
		lbus_endpkt_reg2_mty {Type IO LastRead -1 FirstWrite -1}
		lbus_input_reg0_ena_s {Type IO LastRead -1 FirstWrite -1}
		input_reg_eop_zero_V {Type IO LastRead -1 FirstWrite -1}
		lbus_input_reg1_data {Type IO LastRead -1 FirstWrite -1}
		lbus_input_reg1_ena_s {Type IO LastRead -1 FirstWrite -1}
		lbus_input_reg1_sop_s {Type IO LastRead -1 FirstWrite -1}
		lbus_input_reg1_eop_s {Type IO LastRead -1 FirstWrite -1}
		lbus_input_reg1_err_s {Type IO LastRead -1 FirstWrite -1}
		lbus_input_reg1_mty_s {Type IO LastRead -1 FirstWrite -1}
		lbus_input_reg2_data {Type IO LastRead -1 FirstWrite -1}
		lbus_input_reg2_ena_s {Type IO LastRead -1 FirstWrite -1}
		lbus_input_reg2_sop_s {Type IO LastRead -1 FirstWrite -1}
		lbus_input_reg2_eop_s {Type IO LastRead -1 FirstWrite -1}
		lbus_input_reg2_err_s {Type IO LastRead -1 FirstWrite -1}
		lbus_input_reg2_mty_s {Type IO LastRead -1 FirstWrite -1}
		lbus_input_reg3_data {Type IO LastRead -1 FirstWrite -1}
		lbus_input_reg3_ena_s {Type IO LastRead -1 FirstWrite -1}
		lbus_input_reg3_sop_s {Type IO LastRead -1 FirstWrite -1}
		lbus_input_reg3_eop_s {Type IO LastRead -1 FirstWrite -1}
		lbus_input_reg3_err_s {Type IO LastRead -1 FirstWrite -1}
		lbus_input_reg3_mty_s {Type IO LastRead -1 FirstWrite -1}
		start_position_reg_V {Type IO LastRead -1 FirstWrite -1}
		outputreg_partial_lo {Type IO LastRead -1 FirstWrite -1}
		outputreg_eop_V {Type IO LastRead -1 FirstWrite -1}
		lbus_input_reg0_data {Type IO LastRead -1 FirstWrite -1}
		lbus_input_reg0_sop_s {Type IO LastRead -1 FirstWrite -1}
		lbus_input_reg0_eop_s {Type IO LastRead -1 FirstWrite -1}
		lbus_input_reg0_err_s {Type IO LastRead -1 FirstWrite -1}
		lbus_input_reg0_mty_s {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "0", "Max" : "0"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	lbus_0_data_V { ap_none {  { lbus_0_data_V in_data 0 128 } } }
	lbus_1_data_V { ap_none {  { lbus_1_data_V in_data 0 128 } } }
	lbus_2_data_V { ap_none {  { lbus_2_data_V in_data 0 128 } } }
	lbus_3_data_V { ap_none {  { lbus_3_data_V in_data 0 128 } } }
	lbus_0_ena_V { ap_none {  { lbus_0_ena_V in_data 0 1 } } }
	lbus_1_ena_V { ap_none {  { lbus_1_ena_V in_data 0 1 } } }
	lbus_2_ena_V { ap_none {  { lbus_2_ena_V in_data 0 1 } } }
	lbus_3_ena_V { ap_none {  { lbus_3_ena_V in_data 0 1 } } }
	lbus_0_sop_V { ap_none {  { lbus_0_sop_V in_data 0 1 } } }
	lbus_1_sop_V { ap_none {  { lbus_1_sop_V in_data 0 1 } } }
	lbus_2_sop_V { ap_none {  { lbus_2_sop_V in_data 0 1 } } }
	lbus_3_sop_V { ap_none {  { lbus_3_sop_V in_data 0 1 } } }
	lbus_0_eop_V { ap_none {  { lbus_0_eop_V in_data 0 1 } } }
	lbus_1_eop_V { ap_none {  { lbus_1_eop_V in_data 0 1 } } }
	lbus_2_eop_V { ap_none {  { lbus_2_eop_V in_data 0 1 } } }
	lbus_3_eop_V { ap_none {  { lbus_3_eop_V in_data 0 1 } } }
	lbus_0_err_V { ap_none {  { lbus_0_err_V in_data 0 1 } } }
	lbus_1_err_V { ap_none {  { lbus_1_err_V in_data 0 1 } } }
	lbus_2_err_V { ap_none {  { lbus_2_err_V in_data 0 1 } } }
	lbus_3_err_V { ap_none {  { lbus_3_err_V in_data 0 1 } } }
	lbus_0_mty_V { ap_none {  { lbus_0_mty_V in_data 0 4 } } }
	lbus_1_mty_V { ap_none {  { lbus_1_mty_V in_data 0 4 } } }
	lbus_2_mty_V { ap_none {  { lbus_2_mty_V in_data 0 4 } } }
	lbus_3_mty_V { ap_none {  { lbus_3_mty_V in_data 0 4 } } }
	lbus_fifo { ap_none {  { lbus_fifo out_data 1 544 } } }
	lbus_fifo_we_V { ap_none {  { lbus_fifo_we_V out_data 1 1 } } }
	lbus_fifo_pkt_end { ap_none {  { lbus_fifo_pkt_end out_data 1 408 } } }
	lbus_fifo_pkt_end_we_V { ap_none {  { lbus_fifo_pkt_end_we_V out_data 1 1 } } }
	error_V { ap_none {  { error_V out_data 1 1 } } }
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
