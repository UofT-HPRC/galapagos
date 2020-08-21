set C_TypeInfoList {{ 
"network_bridge_tcp" : [[], { "return": [[], "void"]} , [{"ExternC" : 0}], [ {"rxGalapagosBridge": [[], {"reference": "0"}] }, {"txMetaData": [[], {"reference": "1"}] }, {"openConnection": [[], {"reference": "2"}] }, {"openConStatus": [[], {"reference": "3"}] }, {"txData": [[], {"reference": "0"}] }, {"txStatus": [[], {"reference": "4"}] }, {"listenPort": [[], {"reference": "5"}] }, {"listenPortStatus": [[], {"reference": "6"}] }, {"notifications": [[], {"reference": "7"}] }, {"readRequest": [[], {"reference": "8"}] }, {"rxMetaData": [[], {"reference": "5"}] }, {"rxData": [[], {"reference": "0"}] }, {"txGalapagosBridge": [[], {"reference": "0"}] }, {"state_out": [[],{ "pointer": "9"}] }, {"header_out": [[],{ "pointer": "10"}] }, {"size_out": [[],{ "pointer": "11"}] }, {"sessionID_out": [[],{ "pointer": "11"}] }],["12"],""],
 "12": [ "ip_table", [[], {"array": ["13", [256]]}],""], 
"3": [ "stream<openStatus>", {"hls_type": {"stream": [[[[],"14"]],"15"]}}], 
"4": [ "stream<ap_int<17> >", {"hls_type": {"stream": [[[[],"16"]],"15"]}}], 
"16": [ "ap_int<17>", {"hls_type": {"ap_int": [[[[], {"scalar": { "int": 17}}]],""]}}], 
"14": [ "openStatus", {"struct": [[],[],[{ "sessionID": [[], "11"]},{ "success": [[],  {"scalar": "bool"}]}],""]}], 
"13": [ "ap_uint<32>", {"hls_type": {"ap_uint": [[[[], {"scalar": { "int": 32}}]],""]}}], 
"8": [ "stream<appReadRequest>", {"hls_type": {"stream": [[[[],"17"]],"15"]}}], 
"9": [ "ap_uint<4>", {"hls_type": {"ap_uint": [[[[], {"scalar": { "int": 4}}]],""]}}], 
"17": [ "appReadRequest", {"struct": [[],[],[{ "sessionID": [[], "11"]},{ "length": [[], "11"]}],""]}], 
"11": [ "ap_uint<16>", {"hls_type": {"ap_uint": [[[[], {"scalar": { "int": 16}}]],""]}}], 
"2": [ "stream<ipTuple>", {"hls_type": {"stream": [[[[],"18"]],"15"]}}], 
"18": [ "ipTuple", {"struct": [[],[],[{ "ip_address": [[], "13"]},{ "ip_port": [[], "11"]}],""]}], 
"5": [ "stream<ap_uint<16> >", {"hls_type": {"stream": [[[[],"11"]],"15"]}}], 
"6": [ "stream<bool>", {"hls_type": {"stream": [[[[], {"scalar": "bool"}]],"15"]}}], 
"7": [ "stream<appNotification>", {"hls_type": {"stream": [[[[],"19"]],"15"]}}], 
"19": [ "appNotification", {"struct": [[],[],[{ "sessionID": [[], "11"]},{ "length": [[], "11"]},{ "ipAddress": [[], "13"]},{ "dstPort": [[], "11"]},{ "closed": [[],  {"scalar": "bool"}]}],""]}], 
"1": [ "stream<appTxMeta>", {"hls_type": {"stream": [[[[],"20"]],"15"]}}], 
"20": [ "appTxMeta", {"struct": [[],[],[{ "sessionID": [[], "11"]},{ "length": [[], "11"]}],""]}], 
"0": [ "stream<axiWord>", {"hls_type": {"stream": [[[[],"21"]],"15"]}}], 
"21": [ "axiWord", {"struct": [[],[],[{ "data": [[], "10"]},{ "keep": [[], "22"]},{ "last": [[], "23"]}],""]}], 
"22": [ "ap_uint<8>", {"hls_type": {"ap_uint": [[[[], {"scalar": { "int": 8}}]],""]}}], 
"23": [ "ap_uint<1>", {"hls_type": {"ap_uint": [[[[], {"scalar": { "int": 1}}]],""]}}], 
"10": [ "ap_uint<64>", {"hls_type": {"ap_uint": [[[[], {"scalar": { "int": 64}}]],""]}}],
"15": ["hls", ""]
}}
set moduleName network_bridge_tcp
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type dataflow
set FunctionProtocol ap_ctrl_none
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set C_modelName {network_bridge_tcp}
set C_modelType { void 0 }
set C_modelArgList {
	{ rxGalapagosBridge_V int 73 regular {fifo 0 volatile }  }
	{ txMetaData_V int 32 regular {fifo 1 volatile }  }
	{ openConnection_V int 48 regular {fifo 1 volatile }  }
	{ openConStatus_V int 17 regular {fifo 0 volatile }  }
	{ txData_V int 73 regular {fifo 1 volatile }  }
	{ txStatus_V_V int 17 regular {fifo 0 volatile }  }
	{ listenPort_V_V int 16 regular {fifo 1 volatile }  }
	{ listenPortStatus_V int 1 regular {fifo 0 volatile }  }
	{ notifications_V int 81 regular {fifo 0 volatile }  }
	{ readRequest_V int 32 regular {fifo 1 volatile }  }
	{ rxMetaData_V_V int 16 regular {fifo 0 volatile }  }
	{ rxData_V int 73 regular {fifo 0 volatile }  }
	{ txGalapagosBridge_V int 73 regular {fifo 1 volatile }  }
	{ state_out_V int 4 regular {pointer 1}  }
	{ header_out_V int 64 regular {pointer 1}  }
	{ size_out_V int 16 regular {pointer 1}  }
	{ sessionID_out_V int 16 regular {pointer 1}  }
	{ ip_table_V int 32 regular {array 256 { 1 3 } 1 1 } {global 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "rxGalapagosBridge_V", "interface" : "fifo", "bitwidth" : 73, "direction" : "READONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "rxGalapagosBridge.V.data.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":64,"up":71,"cElement": [{"cName": "rxGalapagosBridge.V.keep.V","cData": "uint8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":72,"up":72,"cElement": [{"cName": "rxGalapagosBridge.V.last.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "txMetaData_V", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "txMetaData.V.sessionID.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":16,"up":31,"cElement": [{"cName": "txMetaData.V.length.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "openConnection_V", "interface" : "fifo", "bitwidth" : 48, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "openConnection.V.ip_address.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":32,"up":47,"cElement": [{"cName": "openConnection.V.ip_port.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "openConStatus_V", "interface" : "fifo", "bitwidth" : 17, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "openConStatus.V.sessionID.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":16,"up":16,"cElement": [{"cName": "openConStatus.V.success","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "txData_V", "interface" : "fifo", "bitwidth" : 73, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "txData.V.data.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":64,"up":71,"cElement": [{"cName": "txData.V.keep.V","cData": "uint8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":72,"up":72,"cElement": [{"cName": "txData.V.last.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "txStatus_V_V", "interface" : "fifo", "bitwidth" : 17, "direction" : "READONLY", "bitSlice":[{"low":0,"up":16,"cElement": [{"cName": "txStatus.V.V","cData": "int17","bit_use": { "low": 0,"up": 16},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "listenPort_V_V", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "listenPort.V.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "listenPortStatus_V", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "listenPortStatus.V","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "notifications_V", "interface" : "fifo", "bitwidth" : 81, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "notifications.V.sessionID.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":16,"up":31,"cElement": [{"cName": "notifications.V.length.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":32,"up":63,"cElement": [{"cName": "notifications.V.ipAddress.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":64,"up":79,"cElement": [{"cName": "notifications.V.dstPort.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":80,"up":80,"cElement": [{"cName": "notifications.V.closed","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "readRequest_V", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "readRequest.V.sessionID.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":16,"up":31,"cElement": [{"cName": "readRequest.V.length.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "rxMetaData_V_V", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "rxMetaData.V.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "rxData_V", "interface" : "fifo", "bitwidth" : 73, "direction" : "READONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "rxData.V.data.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":64,"up":71,"cElement": [{"cName": "rxData.V.keep.V","cData": "uint8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":72,"up":72,"cElement": [{"cName": "rxData.V.last.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "txGalapagosBridge_V", "interface" : "fifo", "bitwidth" : 73, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "txGalapagosBridge.V.data.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":64,"up":71,"cElement": [{"cName": "txGalapagosBridge.V.keep.V","cData": "uint8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]},{"low":72,"up":72,"cElement": [{"cName": "txGalapagosBridge.V.last.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "state_out_V", "interface" : "wire", "bitwidth" : 4, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":3,"cElement": [{"cName": "state_out.V","cData": "uint4","bit_use": { "low": 0,"up": 3},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "header_out_V", "interface" : "wire", "bitwidth" : 64, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":63,"cElement": [{"cName": "header_out.V","cData": "uint64","bit_use": { "low": 0,"up": 63},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "size_out_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "size_out.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "sessionID_out_V", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "sessionID_out.V","cData": "uint16","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "ip_table_V", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "ip_table.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 255,"step" : 1}]}]}], "extern" : 0} ]}
# RTL Port declarations: 
set portNum 59
set portList { 
	{ rxGalapagosBridge_V_dout sc_in sc_lv 73 signal 0 } 
	{ rxGalapagosBridge_V_empty_n sc_in sc_logic 1 signal 0 } 
	{ rxGalapagosBridge_V_read sc_out sc_logic 1 signal 0 } 
	{ txMetaData_V_din sc_out sc_lv 32 signal 1 } 
	{ txMetaData_V_full_n sc_in sc_logic 1 signal 1 } 
	{ txMetaData_V_write sc_out sc_logic 1 signal 1 } 
	{ openConnection_V_din sc_out sc_lv 48 signal 2 } 
	{ openConnection_V_full_n sc_in sc_logic 1 signal 2 } 
	{ openConnection_V_write sc_out sc_logic 1 signal 2 } 
	{ openConStatus_V_dout sc_in sc_lv 17 signal 3 } 
	{ openConStatus_V_empty_n sc_in sc_logic 1 signal 3 } 
	{ openConStatus_V_read sc_out sc_logic 1 signal 3 } 
	{ txData_V_din sc_out sc_lv 73 signal 4 } 
	{ txData_V_full_n sc_in sc_logic 1 signal 4 } 
	{ txData_V_write sc_out sc_logic 1 signal 4 } 
	{ txStatus_V_V_dout sc_in sc_lv 17 signal 5 } 
	{ txStatus_V_V_empty_n sc_in sc_logic 1 signal 5 } 
	{ txStatus_V_V_read sc_out sc_logic 1 signal 5 } 
	{ listenPort_V_V_din sc_out sc_lv 16 signal 6 } 
	{ listenPort_V_V_full_n sc_in sc_logic 1 signal 6 } 
	{ listenPort_V_V_write sc_out sc_logic 1 signal 6 } 
	{ listenPortStatus_V_dout sc_in sc_logic 1 signal 7 } 
	{ listenPortStatus_V_empty_n sc_in sc_logic 1 signal 7 } 
	{ listenPortStatus_V_read sc_out sc_logic 1 signal 7 } 
	{ notifications_V_dout sc_in sc_lv 81 signal 8 } 
	{ notifications_V_empty_n sc_in sc_logic 1 signal 8 } 
	{ notifications_V_read sc_out sc_logic 1 signal 8 } 
	{ readRequest_V_din sc_out sc_lv 32 signal 9 } 
	{ readRequest_V_full_n sc_in sc_logic 1 signal 9 } 
	{ readRequest_V_write sc_out sc_logic 1 signal 9 } 
	{ rxMetaData_V_V_dout sc_in sc_lv 16 signal 10 } 
	{ rxMetaData_V_V_empty_n sc_in sc_logic 1 signal 10 } 
	{ rxMetaData_V_V_read sc_out sc_logic 1 signal 10 } 
	{ rxData_V_dout sc_in sc_lv 73 signal 11 } 
	{ rxData_V_empty_n sc_in sc_logic 1 signal 11 } 
	{ rxData_V_read sc_out sc_logic 1 signal 11 } 
	{ txGalapagosBridge_V_din sc_out sc_lv 73 signal 12 } 
	{ txGalapagosBridge_V_full_n sc_in sc_logic 1 signal 12 } 
	{ txGalapagosBridge_V_write sc_out sc_logic 1 signal 12 } 
	{ state_out_V sc_out sc_lv 4 signal 13 } 
	{ header_out_V sc_out sc_lv 64 signal 14 } 
	{ size_out_V sc_out sc_lv 16 signal 15 } 
	{ sessionID_out_V sc_out sc_lv 16 signal 16 } 
	{ ip_table_V_address0 sc_out sc_lv 8 signal 17 } 
	{ ip_table_V_ce0 sc_out sc_logic 1 signal 17 } 
	{ ip_table_V_d0 sc_out sc_lv 32 signal 17 } 
	{ ip_table_V_q0 sc_in sc_lv 32 signal 17 } 
	{ ip_table_V_we0 sc_out sc_logic 1 signal 17 } 
	{ ip_table_V_address1 sc_out sc_lv 8 signal 17 } 
	{ ip_table_V_ce1 sc_out sc_logic 1 signal 17 } 
	{ ip_table_V_d1 sc_out sc_lv 32 signal 17 } 
	{ ip_table_V_q1 sc_in sc_lv 32 signal 17 } 
	{ ip_table_V_we1 sc_out sc_logic 1 signal 17 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ state_out_V_ap_vld sc_out sc_logic 1 outvld 13 } 
	{ header_out_V_ap_vld sc_out sc_logic 1 outvld 14 } 
	{ size_out_V_ap_vld sc_out sc_logic 1 outvld 15 } 
	{ sessionID_out_V_ap_vld sc_out sc_logic 1 outvld 16 } 
}
set NewPortList {[ 
	{ "name": "rxGalapagosBridge_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":73, "type": "signal", "bundle":{"name": "rxGalapagosBridge_V", "role": "dout" }} , 
 	{ "name": "rxGalapagosBridge_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rxGalapagosBridge_V", "role": "empty_n" }} , 
 	{ "name": "rxGalapagosBridge_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rxGalapagosBridge_V", "role": "read" }} , 
 	{ "name": "txMetaData_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "txMetaData_V", "role": "din" }} , 
 	{ "name": "txMetaData_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txMetaData_V", "role": "full_n" }} , 
 	{ "name": "txMetaData_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txMetaData_V", "role": "write" }} , 
 	{ "name": "openConnection_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":48, "type": "signal", "bundle":{"name": "openConnection_V", "role": "din" }} , 
 	{ "name": "openConnection_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "openConnection_V", "role": "full_n" }} , 
 	{ "name": "openConnection_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "openConnection_V", "role": "write" }} , 
 	{ "name": "openConStatus_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "openConStatus_V", "role": "dout" }} , 
 	{ "name": "openConStatus_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "openConStatus_V", "role": "empty_n" }} , 
 	{ "name": "openConStatus_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "openConStatus_V", "role": "read" }} , 
 	{ "name": "txData_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":73, "type": "signal", "bundle":{"name": "txData_V", "role": "din" }} , 
 	{ "name": "txData_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txData_V", "role": "full_n" }} , 
 	{ "name": "txData_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txData_V", "role": "write" }} , 
 	{ "name": "txStatus_V_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "txStatus_V_V", "role": "dout" }} , 
 	{ "name": "txStatus_V_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txStatus_V_V", "role": "empty_n" }} , 
 	{ "name": "txStatus_V_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txStatus_V_V", "role": "read" }} , 
 	{ "name": "listenPort_V_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "listenPort_V_V", "role": "din" }} , 
 	{ "name": "listenPort_V_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "listenPort_V_V", "role": "full_n" }} , 
 	{ "name": "listenPort_V_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "listenPort_V_V", "role": "write" }} , 
 	{ "name": "listenPortStatus_V_dout", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "listenPortStatus_V", "role": "dout" }} , 
 	{ "name": "listenPortStatus_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "listenPortStatus_V", "role": "empty_n" }} , 
 	{ "name": "listenPortStatus_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "listenPortStatus_V", "role": "read" }} , 
 	{ "name": "notifications_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":81, "type": "signal", "bundle":{"name": "notifications_V", "role": "dout" }} , 
 	{ "name": "notifications_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "notifications_V", "role": "empty_n" }} , 
 	{ "name": "notifications_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "notifications_V", "role": "read" }} , 
 	{ "name": "readRequest_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "readRequest_V", "role": "din" }} , 
 	{ "name": "readRequest_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "readRequest_V", "role": "full_n" }} , 
 	{ "name": "readRequest_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "readRequest_V", "role": "write" }} , 
 	{ "name": "rxMetaData_V_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rxMetaData_V_V", "role": "dout" }} , 
 	{ "name": "rxMetaData_V_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rxMetaData_V_V", "role": "empty_n" }} , 
 	{ "name": "rxMetaData_V_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rxMetaData_V_V", "role": "read" }} , 
 	{ "name": "rxData_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":73, "type": "signal", "bundle":{"name": "rxData_V", "role": "dout" }} , 
 	{ "name": "rxData_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rxData_V", "role": "empty_n" }} , 
 	{ "name": "rxData_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rxData_V", "role": "read" }} , 
 	{ "name": "txGalapagosBridge_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":73, "type": "signal", "bundle":{"name": "txGalapagosBridge_V", "role": "din" }} , 
 	{ "name": "txGalapagosBridge_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txGalapagosBridge_V", "role": "full_n" }} , 
 	{ "name": "txGalapagosBridge_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txGalapagosBridge_V", "role": "write" }} , 
 	{ "name": "state_out_V", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "state_out_V", "role": "default" }} , 
 	{ "name": "header_out_V", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "header_out_V", "role": "default" }} , 
 	{ "name": "size_out_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "size_out_V", "role": "default" }} , 
 	{ "name": "sessionID_out_V", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "sessionID_out_V", "role": "default" }} , 
 	{ "name": "ip_table_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "ip_table_V", "role": "address0" }} , 
 	{ "name": "ip_table_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ip_table_V", "role": "ce0" }} , 
 	{ "name": "ip_table_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ip_table_V", "role": "d0" }} , 
 	{ "name": "ip_table_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ip_table_V", "role": "q0" }} , 
 	{ "name": "ip_table_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ip_table_V", "role": "we0" }} , 
 	{ "name": "ip_table_V_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "ip_table_V", "role": "address1" }} , 
 	{ "name": "ip_table_V_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ip_table_V", "role": "ce1" }} , 
 	{ "name": "ip_table_V_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ip_table_V", "role": "d1" }} , 
 	{ "name": "ip_table_V_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ip_table_V", "role": "q1" }} , 
 	{ "name": "ip_table_V_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ip_table_V", "role": "we1" }} , 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "state_out_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "state_out_V", "role": "ap_vld" }} , 
 	{ "name": "header_out_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "header_out_V", "role": "ap_vld" }} , 
 	{ "name": "size_out_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "size_out_V", "role": "ap_vld" }} , 
 	{ "name": "sessionID_out_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "sessionID_out_V", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17"],
		"CDFG" : "network_bridge_tcp",
		"Protocol" : "ap_ctrl_none",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "8", "EstimateLatencyMax" : "8",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"InDataflowNetwork" : "0",
		"InputProcess" : [
			{"ID" : "1", "Name" : "galapagos_to_tcp_int_U0"},
			{"ID" : "2", "Name" : "open_connections_U0"},
			{"ID" : "3", "Name" : "open_port_U0"},
			{"ID" : "4", "Name" : "tcp_to_galapagos_int_U0"}],
		"OutputProcess" : [
			{"ID" : "1", "Name" : "galapagos_to_tcp_int_U0"},
			{"ID" : "2", "Name" : "open_connections_U0"},
			{"ID" : "3", "Name" : "open_port_U0"},
			{"ID" : "4", "Name" : "tcp_to_galapagos_int_U0"}],
		"Port" : [
			{"Name" : "rxGalapagosBridge_V", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "galapagos_to_tcp_int_U0", "Port" : "rxGalapagosBridge_V"}]},
			{"Name" : "txMetaData_V", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "galapagos_to_tcp_int_U0", "Port" : "txMetaData_V"}]},
			{"Name" : "openConnection_V", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "open_connections_U0", "Port" : "openConnection_V"}]},
			{"Name" : "openConStatus_V", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "open_connections_U0", "Port" : "openConStatus_V"}]},
			{"Name" : "txData_V", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "galapagos_to_tcp_int_U0", "Port" : "txData_V"}]},
			{"Name" : "txStatus_V_V", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "galapagos_to_tcp_int_U0", "Port" : "txStatus_V_V"}]},
			{"Name" : "listenPort_V_V", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "open_port_U0", "Port" : "listenPort_V_V"}]},
			{"Name" : "listenPortStatus_V", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "open_port_U0", "Port" : "listenPortStatus_V"}]},
			{"Name" : "notifications_V", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "open_port_U0", "Port" : "notifications_V"}]},
			{"Name" : "readRequest_V", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "open_port_U0", "Port" : "readRequest_V"}]},
			{"Name" : "rxMetaData_V_V", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "tcp_to_galapagos_int_U0", "Port" : "rxMetaData_V_V"}]},
			{"Name" : "rxData_V", "Type" : "Fifo", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "tcp_to_galapagos_int_U0", "Port" : "rxData_V"}]},
			{"Name" : "txGalapagosBridge_V", "Type" : "Fifo", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "tcp_to_galapagos_int_U0", "Port" : "txGalapagosBridge_V"}]},
			{"Name" : "state_out_V", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "galapagos_to_tcp_int_U0", "Port" : "state_out_V"}]},
			{"Name" : "header_out_V", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "galapagos_to_tcp_int_U0", "Port" : "header_out_V"}]},
			{"Name" : "size_out_V", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "galapagos_to_tcp_int_U0", "Port" : "size_out_V"}]},
			{"Name" : "sessionID_out_V", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "galapagos_to_tcp_int_U0", "Port" : "sessionID_out_V"}]},
			{"Name" : "state_1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "galapagos_to_tcp_int_U0", "Port" : "state_1"}]},
			{"Name" : "header_data_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "galapagos_to_tcp_int_U0", "Port" : "header_data_V"}]},
			{"Name" : "dest_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "galapagos_to_tcp_int_U0", "Port" : "dest_V"}]},
			{"Name" : "sessionID_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "galapagos_to_tcp_int_U0", "Port" : "sessionID_V"}]},
			{"Name" : "header_keep_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "galapagos_to_tcp_int_U0", "Port" : "header_keep_V"}]},
			{"Name" : "header_last_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "galapagos_to_tcp_int_U0", "Port" : "header_last_V"}]},
			{"Name" : "g2t_read_dest_V_V", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "sessionID_table_stea_U0", "Port" : "g2t_read_dest_V_V"},
					{"ID" : "1", "SubInstance" : "galapagos_to_tcp_int_U0", "Port" : "g2t_read_dest_V_V"}]},
			{"Name" : "g2t_read_sid_V_V", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "sessionID_table_stea_U0", "Port" : "g2t_read_sid_V_V"},
					{"ID" : "1", "SubInstance" : "galapagos_to_tcp_int_U0", "Port" : "g2t_read_sid_V_V"}]},
			{"Name" : "ip_table_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "galapagos_to_tcp_int_U0", "Port" : "ip_table_V"}]},
			{"Name" : "ip_fifo_V_V", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "open_connections_U0", "Port" : "ip_fifo_V_V"},
					{"ID" : "1", "SubInstance" : "galapagos_to_tcp_int_U0", "Port" : "ip_fifo_V_V"}]},
			{"Name" : "sessionID_fifo_V_V", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "open_connections_U0", "Port" : "sessionID_fifo_V_V"},
					{"ID" : "1", "SubInstance" : "galapagos_to_tcp_int_U0", "Port" : "sessionID_fifo_V_V"}]},
			{"Name" : "g2t_write_sid_V_V", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "sessionID_table_stea_U0", "Port" : "g2t_write_sid_V_V"},
					{"ID" : "1", "SubInstance" : "galapagos_to_tcp_int_U0", "Port" : "g2t_write_sid_V_V"}]},
			{"Name" : "g2t_write_dest_V_V", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "sessionID_table_stea_U0", "Port" : "g2t_write_dest_V_V"},
					{"ID" : "1", "SubInstance" : "galapagos_to_tcp_int_U0", "Port" : "g2t_write_dest_V_V"}]},
			{"Name" : "wait_for_connection", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "open_connections_U0", "Port" : "wait_for_connection"}]},
			{"Name" : "listenDone", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "open_port_U0", "Port" : "listenDone"}]},
			{"Name" : "waitPortStatus", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "open_port_U0", "Port" : "waitPortStatus"}]},
			{"Name" : "state", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "tcp_to_galapagos_int_U0", "Port" : "state"}]},
			{"Name" : "sessionID_V_1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "tcp_to_galapagos_int_U0", "Port" : "sessionID_V_1"}]},
			{"Name" : "currWord_data_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "tcp_to_galapagos_int_U0", "Port" : "currWord_data_V"}]},
			{"Name" : "currWord_keep_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "tcp_to_galapagos_int_U0", "Port" : "currWord_keep_V"}]},
			{"Name" : "currWord_last_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "tcp_to_galapagos_int_U0", "Port" : "currWord_last_V"}]},
			{"Name" : "src_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "tcp_to_galapagos_int_U0", "Port" : "src_V"}]},
			{"Name" : "t2g_read_dest_V_V", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "tcp_to_galapagos_int_U0", "Port" : "t2g_read_dest_V_V"},
					{"ID" : "5", "SubInstance" : "sessionID_table_stea_U0", "Port" : "t2g_read_dest_V_V"}]},
			{"Name" : "t2g_read_sid_V_V", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "tcp_to_galapagos_int_U0", "Port" : "t2g_read_sid_V_V"},
					{"ID" : "5", "SubInstance" : "sessionID_table_stea_U0", "Port" : "t2g_read_sid_V_V"}]},
			{"Name" : "t2g_write_dest_V_V", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "tcp_to_galapagos_int_U0", "Port" : "t2g_write_dest_V_V"},
					{"ID" : "5", "SubInstance" : "sessionID_table_stea_U0", "Port" : "t2g_write_dest_V_V"}]},
			{"Name" : "t2g_write_sid_V_V", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "4", "SubInstance" : "tcp_to_galapagos_int_U0", "Port" : "t2g_write_sid_V_V"},
					{"ID" : "5", "SubInstance" : "sessionID_table_stea_U0", "Port" : "t2g_write_sid_V_V"}]},
			{"Name" : "sessionID_table_V", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "sessionID_table_stea_U0", "Port" : "sessionID_table_V"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.galapagos_to_tcp_int_U0", "Parent" : "0",
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
			{"Name" : "g2t_read_dest_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "5", "DependentChan" : "7",
				"BlockSignal" : [
					{"Name" : "g2t_read_dest_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "g2t_read_sid_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "5", "DependentChan" : "8",
				"BlockSignal" : [
					{"Name" : "g2t_read_sid_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "ip_table_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ip_fifo_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "2", "DependentChan" : "9",
				"BlockSignal" : [
					{"Name" : "ip_fifo_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "sessionID_fifo_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "2", "DependentChan" : "10",
				"BlockSignal" : [
					{"Name" : "sessionID_fifo_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "g2t_write_sid_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "5", "DependentChan" : "11",
				"BlockSignal" : [
					{"Name" : "g2t_write_sid_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "g2t_write_dest_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "5", "DependentChan" : "12",
				"BlockSignal" : [
					{"Name" : "g2t_write_dest_V_V_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.open_connections_U0", "Parent" : "0",
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
			{"Name" : "ip_fifo_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "1", "DependentChan" : "9",
				"BlockSignal" : [
					{"Name" : "ip_fifo_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "wait_for_connection", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "sessionID_fifo_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "1", "DependentChan" : "10",
				"BlockSignal" : [
					{"Name" : "sessionID_fifo_V_V_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.open_port_U0", "Parent" : "0",
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
			{"Name" : "waitPortStatus", "Type" : "OVld", "Direction" : "IO"}]},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.tcp_to_galapagos_int_U0", "Parent" : "0",
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
			{"Name" : "t2g_read_dest_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "5", "DependentChan" : "13",
				"BlockSignal" : [
					{"Name" : "t2g_read_dest_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "t2g_read_sid_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "5", "DependentChan" : "14",
				"BlockSignal" : [
					{"Name" : "t2g_read_sid_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "t2g_write_dest_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "5", "DependentChan" : "15",
				"BlockSignal" : [
					{"Name" : "t2g_write_dest_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "t2g_write_sid_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "5", "DependentChan" : "16",
				"BlockSignal" : [
					{"Name" : "t2g_write_sid_V_V_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sessionID_table_stea_U0", "Parent" : "0", "Child" : ["6"],
		"CDFG" : "sessionID_table_stea",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "6", "EstimateLatencyMin" : "6", "EstimateLatencyMax" : "6",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"InDataflowNetwork" : "1",
		"StartSource" : "1",
		"StartFifo" : "start_for_sessioncud_U",
		"Port" : [
			{"Name" : "t2g_read_dest_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "4", "DependentChan" : "13",
				"BlockSignal" : [
					{"Name" : "t2g_read_dest_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "sessionID_table_V", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "t2g_read_sid_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "4", "DependentChan" : "14",
				"BlockSignal" : [
					{"Name" : "t2g_read_sid_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "t2g_write_dest_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "4", "DependentChan" : "15",
				"BlockSignal" : [
					{"Name" : "t2g_write_dest_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "t2g_write_sid_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "4", "DependentChan" : "16",
				"BlockSignal" : [
					{"Name" : "t2g_write_sid_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "g2t_read_dest_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "1", "DependentChan" : "7",
				"BlockSignal" : [
					{"Name" : "g2t_read_dest_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "g2t_read_sid_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "1", "DependentChan" : "8",
				"BlockSignal" : [
					{"Name" : "g2t_read_sid_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "g2t_write_dest_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "1", "DependentChan" : "12",
				"BlockSignal" : [
					{"Name" : "g2t_write_dest_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "g2t_write_sid_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "1", "DependentChan" : "11",
				"BlockSignal" : [
					{"Name" : "g2t_write_sid_V_V_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.sessionID_table_stea_U0.sessionID_table_V_U", "Parent" : "5"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.g2t_read_dest_V_V_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.g2t_read_sid_V_V_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ip_fifo_V_V_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sessionID_fifo_V_V_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.g2t_write_sid_V_V_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.g2t_write_dest_V_V_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.t2g_read_dest_V_V_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.t2g_read_sid_V_V_U", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.t2g_write_dest_V_V_U", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.t2g_write_sid_V_V_U", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_sessioncud_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	network_bridge_tcp {
		rxGalapagosBridge_V {Type I LastRead 0 FirstWrite -1}
		txMetaData_V {Type O LastRead -1 FirstWrite 2}
		openConnection_V {Type O LastRead -1 FirstWrite 1}
		openConStatus_V {Type I LastRead 0 FirstWrite -1}
		txData_V {Type O LastRead -1 FirstWrite 2}
		txStatus_V_V {Type I LastRead 0 FirstWrite -1}
		listenPort_V_V {Type O LastRead -1 FirstWrite 1}
		listenPortStatus_V {Type I LastRead 0 FirstWrite -1}
		notifications_V {Type I LastRead 0 FirstWrite -1}
		readRequest_V {Type O LastRead -1 FirstWrite 1}
		rxMetaData_V_V {Type I LastRead 0 FirstWrite -1}
		rxData_V {Type I LastRead 0 FirstWrite -1}
		txGalapagosBridge_V {Type O LastRead -1 FirstWrite 1}
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
		g2t_read_dest_V_V {Type IO LastRead -1 FirstWrite -1}
		g2t_read_sid_V_V {Type IO LastRead -1 FirstWrite -1}
		ip_table_V {Type I LastRead 0 FirstWrite -1}
		ip_fifo_V_V {Type IO LastRead -1 FirstWrite -1}
		sessionID_fifo_V_V {Type IO LastRead -1 FirstWrite -1}
		g2t_write_sid_V_V {Type IO LastRead -1 FirstWrite -1}
		g2t_write_dest_V_V {Type IO LastRead -1 FirstWrite -1}
		wait_for_connection {Type IO LastRead -1 FirstWrite -1}
		listenDone {Type IO LastRead -1 FirstWrite -1}
		waitPortStatus {Type IO LastRead -1 FirstWrite -1}
		state {Type IO LastRead -1 FirstWrite -1}
		sessionID_V_1 {Type IO LastRead -1 FirstWrite -1}
		currWord_data_V {Type IO LastRead -1 FirstWrite -1}
		currWord_keep_V {Type IO LastRead -1 FirstWrite -1}
		currWord_last_V {Type IO LastRead -1 FirstWrite -1}
		src_V {Type IO LastRead -1 FirstWrite -1}
		t2g_read_dest_V_V {Type IO LastRead -1 FirstWrite -1}
		t2g_read_sid_V_V {Type IO LastRead -1 FirstWrite -1}
		t2g_write_dest_V_V {Type IO LastRead -1 FirstWrite -1}
		t2g_write_sid_V_V {Type IO LastRead -1 FirstWrite -1}
		sessionID_table_V {Type IO LastRead -1 FirstWrite -1}}
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
		g2t_write_dest_V_V {Type O LastRead -1 FirstWrite 1}}
	open_connections {
		openConnection_V {Type O LastRead -1 FirstWrite 1}
		openConStatus_V {Type I LastRead 0 FirstWrite -1}
		ip_fifo_V_V {Type I LastRead 0 FirstWrite -1}
		wait_for_connection {Type IO LastRead -1 FirstWrite -1}
		sessionID_fifo_V_V {Type O LastRead -1 FirstWrite 1}}
	open_port {
		listenPort_V_V {Type O LastRead -1 FirstWrite 1}
		listenPortStatus_V {Type I LastRead 0 FirstWrite -1}
		notifications_V {Type I LastRead 0 FirstWrite -1}
		readRequest_V {Type O LastRead -1 FirstWrite 1}
		listenDone {Type IO LastRead -1 FirstWrite -1}
		waitPortStatus {Type IO LastRead -1 FirstWrite -1}}
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
		t2g_write_sid_V_V {Type O LastRead -1 FirstWrite 1}}
	sessionID_table_stea {
		t2g_read_dest_V_V {Type I LastRead 0 FirstWrite -1}
		sessionID_table_V {Type IO LastRead -1 FirstWrite -1}
		t2g_read_sid_V_V {Type O LastRead -1 FirstWrite 6}
		t2g_write_dest_V_V {Type I LastRead 1 FirstWrite -1}
		t2g_write_sid_V_V {Type I LastRead 1 FirstWrite -1}
		g2t_read_dest_V_V {Type I LastRead 2 FirstWrite -1}
		g2t_read_sid_V_V {Type O LastRead -1 FirstWrite 6}
		g2t_write_dest_V_V {Type I LastRead 3 FirstWrite -1}
		g2t_write_sid_V_V {Type I LastRead 3 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "8", "Max" : "8"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	rxGalapagosBridge_V { ap_fifo {  { rxGalapagosBridge_V_dout fifo_data 0 73 }  { rxGalapagosBridge_V_empty_n fifo_status 0 1 }  { rxGalapagosBridge_V_read fifo_update 1 1 } } }
	txMetaData_V { ap_fifo {  { txMetaData_V_din fifo_data 1 32 }  { txMetaData_V_full_n fifo_status 0 1 }  { txMetaData_V_write fifo_update 1 1 } } }
	openConnection_V { ap_fifo {  { openConnection_V_din fifo_data 1 48 }  { openConnection_V_full_n fifo_status 0 1 }  { openConnection_V_write fifo_update 1 1 } } }
	openConStatus_V { ap_fifo {  { openConStatus_V_dout fifo_data 0 17 }  { openConStatus_V_empty_n fifo_status 0 1 }  { openConStatus_V_read fifo_update 1 1 } } }
	txData_V { ap_fifo {  { txData_V_din fifo_data 1 73 }  { txData_V_full_n fifo_status 0 1 }  { txData_V_write fifo_update 1 1 } } }
	txStatus_V_V { ap_fifo {  { txStatus_V_V_dout fifo_data 0 17 }  { txStatus_V_V_empty_n fifo_status 0 1 }  { txStatus_V_V_read fifo_update 1 1 } } }
	listenPort_V_V { ap_fifo {  { listenPort_V_V_din fifo_data 1 16 }  { listenPort_V_V_full_n fifo_status 0 1 }  { listenPort_V_V_write fifo_update 1 1 } } }
	listenPortStatus_V { ap_fifo {  { listenPortStatus_V_dout fifo_data 0 1 }  { listenPortStatus_V_empty_n fifo_status 0 1 }  { listenPortStatus_V_read fifo_update 1 1 } } }
	notifications_V { ap_fifo {  { notifications_V_dout fifo_data 0 81 }  { notifications_V_empty_n fifo_status 0 1 }  { notifications_V_read fifo_update 1 1 } } }
	readRequest_V { ap_fifo {  { readRequest_V_din fifo_data 1 32 }  { readRequest_V_full_n fifo_status 0 1 }  { readRequest_V_write fifo_update 1 1 } } }
	rxMetaData_V_V { ap_fifo {  { rxMetaData_V_V_dout fifo_data 0 16 }  { rxMetaData_V_V_empty_n fifo_status 0 1 }  { rxMetaData_V_V_read fifo_update 1 1 } } }
	rxData_V { ap_fifo {  { rxData_V_dout fifo_data 0 73 }  { rxData_V_empty_n fifo_status 0 1 }  { rxData_V_read fifo_update 1 1 } } }
	txGalapagosBridge_V { ap_fifo {  { txGalapagosBridge_V_din fifo_data 1 73 }  { txGalapagosBridge_V_full_n fifo_status 0 1 }  { txGalapagosBridge_V_write fifo_update 1 1 } } }
	state_out_V { ap_vld {  { state_out_V out_data 1 4 }  { state_out_V_ap_vld out_vld 1 1 } } }
	header_out_V { ap_vld {  { header_out_V out_data 1 64 }  { header_out_V_ap_vld out_vld 1 1 } } }
	size_out_V { ap_vld {  { size_out_V out_data 1 16 }  { size_out_V_ap_vld out_vld 1 1 } } }
	sessionID_out_V { ap_vld {  { sessionID_out_V out_data 1 16 }  { sessionID_out_V_ap_vld out_vld 1 1 } } }
	ip_table_V { ap_memory {  { ip_table_V_address0 mem_address 1 8 }  { ip_table_V_ce0 mem_ce 1 1 }  { ip_table_V_d0 mem_din 1 32 }  { ip_table_V_q0 mem_dout 0 32 }  { ip_table_V_we0 mem_we 1 1 }  { ip_table_V_address1 mem_address 1 8 }  { ip_table_V_ce1 mem_ce 1 1 }  { ip_table_V_d1 mem_din 1 32 }  { ip_table_V_q1 mem_dout 0 32 }  { ip_table_V_we1 mem_we 1 1 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
	rxGalapagosBridge_V { fifo_read 1 no_conditional }
	txMetaData_V { fifo_write 1 no_conditional }
	openConnection_V { fifo_write 1 no_conditional }
	openConStatus_V { fifo_read 1 no_conditional }
	txData_V { fifo_write 1 no_conditional }
	txStatus_V_V { fifo_read 1 no_conditional }
	listenPort_V_V { fifo_write 1 no_conditional }
	listenPortStatus_V { fifo_read 1 no_conditional }
	notifications_V { fifo_read 1 no_conditional }
	readRequest_V { fifo_write 1 no_conditional }
	rxMetaData_V_V { fifo_read 1 no_conditional }
	rxData_V { fifo_read 1 no_conditional }
	txGalapagosBridge_V { fifo_write 1 no_conditional }
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
