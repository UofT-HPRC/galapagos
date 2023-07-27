//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
//Date        : Wed Aug 18 04:21:49 2021
//Host        : Gaoyu running 64-bit Ubuntu 16.04.7 LTS
//Command     : generate_target GULF_Stream.bd
//Design      : GULF_Stream
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "GULF_Stream,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=GULF_Stream,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=7,numReposBlks=7,numNonXlnxBlks=2,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=2,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "GULF_Stream.hwdef" *) 
module GULF_Stream
   (arp_status,
    clk,
    eth_out_data_V,
    eth_out_keep_V,
    eth_out_last_V,
    eth_out_ready_V,
    eth_out_valid_V,
    gateway,
    local_port_rx,
    local_port_tx,
    myIP,
    myMac,
    netmask,
    payload_from_user_tdata,
    payload_from_user_tkeep,
    payload_from_user_tlast,
    payload_from_user_tready,
    payload_from_user_tvalid,
    payload_to_user_tdata,
    payload_to_user_tkeep,
    payload_to_user_tlast,
    payload_to_user_tvalid,
    remote_ip_rx,
    remote_ip_tx,
    remote_port_rx,
    remote_port_tx,
    rst,
    s_axis_data_V,
    s_axis_keep_V,
    s_axis_last_V,
    s_axis_valid_V);
  output [1:0]arp_status;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, ASSOCIATED_BUSIF payload_to_user:payload_from_user, ASSOCIATED_RESET rst, CLK_DOMAIN GULF_Stream_clk_0, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ETH_OUT_DATA_V DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ETH_OUT_DATA_V, LAYERED_METADATA undef" *) output [511:0]eth_out_data_V;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ETH_OUT_KEEP_V DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ETH_OUT_KEEP_V, LAYERED_METADATA undef" *) output [63:0]eth_out_keep_V;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ETH_OUT_LAST_V DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ETH_OUT_LAST_V, LAYERED_METADATA undef" *) output [0:0]eth_out_last_V;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ETH_OUT_READY_V DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ETH_OUT_READY_V, LAYERED_METADATA undef" *) input [0:0]eth_out_ready_V;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ETH_OUT_VALID_V DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ETH_OUT_VALID_V, LAYERED_METADATA undef" *) output [0:0]eth_out_valid_V;
  input [31:0]gateway;
  output [15:0]local_port_rx;
  input [15:0]local_port_tx;
  input [31:0]myIP;
  input [47:0]myMac;
  input [31:0]netmask;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 payload_from_user " *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME payload_from_user, CLK_DOMAIN GULF_Stream_clk_0, FREQ_HZ 100000000, HAS_TKEEP 1, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 64, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) input [511:0]payload_from_user_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 payload_from_user " *) input [63:0]payload_from_user_tkeep;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 payload_from_user " *) input [0:0]payload_from_user_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 payload_from_user " *) output [0:0]payload_from_user_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 payload_from_user " *) input [0:0]payload_from_user_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 payload_to_user " *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME payload_to_user, CLK_DOMAIN GULF_Stream_clk_0, FREQ_HZ 100000000, HAS_TKEEP 1, HAS_TLAST 1, HAS_TREADY 0, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 64, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) output [511:0]payload_to_user_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 payload_to_user " *) output [63:0]payload_to_user_tkeep;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 payload_to_user " *) output [0:0]payload_to_user_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 payload_to_user " *) output [0:0]payload_to_user_tvalid;
  output [31:0]remote_ip_rx;
  input [31:0]remote_ip_tx;
  output [15:0]remote_port_rx;
  input [15:0]remote_port_tx;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RST, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input rst;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.S_AXIS_DATA_V DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.S_AXIS_DATA_V, LAYERED_METADATA undef" *) input [511:0]s_axis_data_V;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.S_AXIS_KEEP_V DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.S_AXIS_KEEP_V, LAYERED_METADATA undef" *) input [63:0]s_axis_keep_V;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.S_AXIS_LAST_V DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.S_AXIS_LAST_V, LAYERED_METADATA undef" *) input [0:0]s_axis_last_V;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.S_AXIS_VALID_V DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.S_AXIS_VALID_V, LAYERED_METADATA undef" *) input [0:0]s_axis_valid_V;

  wire [511:0]arp_server_100g_0_arp_out_TDATA;
  wire [63:0]arp_server_100g_0_arp_out_TKEEP;
  wire [0:0]arp_server_100g_0_arp_out_TLAST;
  wire arp_server_100g_0_arp_out_TREADY;
  wire [0:0]arp_server_100g_0_arp_out_TVALID;
  wire [1:0]arp_server_100g_0_arp_status;
  wire [47:0]arp_server_100g_0_lookup_result;
  wire [511:0]axis_data_fifo_0_m_axis_tdata;
  wire [63:0]axis_data_fifo_0_m_axis_tkeep;
  wire axis_data_fifo_0_m_axis_tlast;
  wire axis_data_fifo_0_m_axis_tvalid;
  wire [511:0]axis_data_fifo_1_m_axis_tdata;
  wire [63:0]axis_data_fifo_1_m_axis_tkeep;
  wire axis_data_fifo_1_m_axis_tlast;
  wire axis_data_fifo_1_m_axis_tvalid;
  wire clk_0_1;
  wire [0:0]eth_out_ready_V_0_1;
  wire [0:0]ether_protocol_assembler_0_arp_ready_V;
  wire [511:0]ether_protocol_assembler_0_eth_out_data_V;
  wire [63:0]ether_protocol_assembler_0_eth_out_keep_V;
  wire [0:0]ether_protocol_assembler_0_eth_out_last_V;
  wire [0:0]ether_protocol_assembler_0_eth_out_valid_V;
  wire [0:0]ether_protocol_assembler_0_ip_ready_V;
  wire [335:0]ether_protocol_spliter_0_arp_data_V;
  wire [0:0]ether_protocol_spliter_0_arp_valid_V;
  wire [335:0]ether_protocol_spliter_0_ip_data_V;
  wire [0:0]ether_protocol_spliter_0_ip_valid_V;
  wire [511:0]ether_protocol_spliter_0_payload_data_V;
  wire [0:0]ether_protocol_spliter_0_payload_last_V;
  wire [15:0]ether_protocol_spliter_0_payload_len_data_V;
  wire [0:0]ether_protocol_spliter_0_payload_len_valid_V;
  wire [0:0]ether_protocol_spliter_0_payload_valid_V;
  wire [31:0]gateway_0_1;
  wire [15:0]local_port_tx_0_1;
  wire [31:0]myIP_0_1;
  wire [47:0]myMac_0_1;
  wire [31:0]netmask_0_1;
  wire [511:0]payload_from_user_0_1_TDATA;
  wire [63:0]payload_from_user_0_1_TKEEP;
  wire [0:0]payload_from_user_0_1_TLAST;
  wire [0:0]payload_from_user_0_1_TREADY;
  wire [0:0]payload_from_user_0_1_TVALID;
  wire [31:0]remote_ip_tx_0_1;
  wire [15:0]remote_port_tx_0_1;
  wire rst_0_1;
  wire [511:0]s_axis_data_V_0_1;
  wire [63:0]s_axis_keep_V_0_1;
  wire [0:0]s_axis_last_V_0_1;
  wire [0:0]s_axis_valid_V_0_1;
  wire [79:0]udp_ip_server_100g_0_arp_internal_resp_TDATA;
  wire [0:0]udp_ip_server_100g_0_arp_internal_resp_TVALID;
  wire [15:0]udp_ip_server_100g_0_local_port_rx;
  wire [511:0]udp_ip_server_100g_0_packet_m_axis_TDATA;
  wire [63:0]udp_ip_server_100g_0_packet_m_axis_TKEEP;
  wire [0:0]udp_ip_server_100g_0_packet_m_axis_TLAST;
  wire udp_ip_server_100g_0_packet_m_axis_TREADY;
  wire [0:0]udp_ip_server_100g_0_packet_m_axis_TVALID;
  wire [511:0]udp_ip_server_100g_0_payload_to_user_TDATA;
  wire [63:0]udp_ip_server_100g_0_payload_to_user_TKEEP;
  wire [0:0]udp_ip_server_100g_0_payload_to_user_TLAST;
  wire [0:0]udp_ip_server_100g_0_payload_to_user_TVALID;
  wire [31:0]udp_ip_server_100g_0_remote_ip_rx;
  wire [15:0]udp_ip_server_100g_0_remote_port_rx;
  wire [0:0]util_vector_logic_0_Res;

  assign arp_status[1:0] = arp_server_100g_0_arp_status;
  assign clk_0_1 = clk;
  assign eth_out_data_V[511:0] = ether_protocol_assembler_0_eth_out_data_V;
  assign eth_out_keep_V[63:0] = ether_protocol_assembler_0_eth_out_keep_V;
  assign eth_out_last_V[0] = ether_protocol_assembler_0_eth_out_last_V;
  assign eth_out_ready_V_0_1 = eth_out_ready_V[0];
  assign eth_out_valid_V[0] = ether_protocol_assembler_0_eth_out_valid_V;
  assign gateway_0_1 = gateway[31:0];
  assign local_port_rx[15:0] = udp_ip_server_100g_0_local_port_rx;
  assign local_port_tx_0_1 = local_port_tx[15:0];
  assign myIP_0_1 = myIP[31:0];
  assign myMac_0_1 = myMac[47:0];
  assign netmask_0_1 = netmask[31:0];
  assign payload_from_user_0_1_TDATA = payload_from_user_tdata[511:0];
  assign payload_from_user_0_1_TKEEP = payload_from_user_tkeep[63:0];
  assign payload_from_user_0_1_TLAST = payload_from_user_tlast[0];
  assign payload_from_user_0_1_TVALID = payload_from_user_tvalid[0];
  assign payload_from_user_tready[0] = payload_from_user_0_1_TREADY;
  assign payload_to_user_tdata[511:0] = udp_ip_server_100g_0_payload_to_user_TDATA;
  assign payload_to_user_tkeep[63:0] = udp_ip_server_100g_0_payload_to_user_TKEEP;
  assign payload_to_user_tlast[0] = udp_ip_server_100g_0_payload_to_user_TLAST;
  assign payload_to_user_tvalid[0] = udp_ip_server_100g_0_payload_to_user_TVALID;
  assign remote_ip_rx[31:0] = udp_ip_server_100g_0_remote_ip_rx;
  assign remote_ip_tx_0_1 = remote_ip_tx[31:0];
  assign remote_port_rx[15:0] = udp_ip_server_100g_0_remote_port_rx;
  assign remote_port_tx_0_1 = remote_port_tx[15:0];
  assign rst_0_1 = rst;
  assign s_axis_data_V_0_1 = s_axis_data_V[511:0];
  assign s_axis_keep_V_0_1 = s_axis_keep_V[63:0];
  assign s_axis_last_V_0_1 = s_axis_last_V[0];
  assign s_axis_valid_V_0_1 = s_axis_valid_V[0];
  GULF_Stream_arp_server_100g_0_0 arp_server_100g_0
       (.arp_in_data(ether_protocol_spliter_0_arp_data_V),
        .arp_in_valid(ether_protocol_spliter_0_arp_valid_V),
        .arp_internal_resp_Mac_IP(udp_ip_server_100g_0_arp_internal_resp_TDATA),
        .arp_internal_resp_valid(udp_ip_server_100g_0_arp_internal_resp_TVALID),
        .arp_out_data(arp_server_100g_0_arp_out_TDATA),
        .arp_out_keep(arp_server_100g_0_arp_out_TKEEP),
        .arp_out_last(arp_server_100g_0_arp_out_TLAST),
        .arp_out_ready(arp_server_100g_0_arp_out_TREADY),
        .arp_out_valid(arp_server_100g_0_arp_out_TVALID),
        .arp_status(arp_server_100g_0_arp_status),
        .clk(clk_0_1),
        .gateway(gateway_0_1),
        .lookup_req(remote_ip_tx_0_1),
        .lookup_result(arp_server_100g_0_lookup_result),
        .myIP(myIP_0_1),
        .myMac(myMac_0_1),
        .netmask(netmask_0_1),
        .rst(rst_0_1));
  GULF_Stream_axis_data_fifo_0_0 axis_data_fifo_0
       (.m_axis_tdata(axis_data_fifo_0_m_axis_tdata),
        .m_axis_tkeep(axis_data_fifo_0_m_axis_tkeep),
        .m_axis_tlast(axis_data_fifo_0_m_axis_tlast),
        .m_axis_tready(ether_protocol_assembler_0_arp_ready_V),
        .m_axis_tvalid(axis_data_fifo_0_m_axis_tvalid),
        .s_aclk(clk_0_1),
        .s_aresetn(util_vector_logic_0_Res),
        .s_axis_tdata(arp_server_100g_0_arp_out_TDATA),
        .s_axis_tkeep(arp_server_100g_0_arp_out_TKEEP),
        .s_axis_tlast(arp_server_100g_0_arp_out_TLAST),
        .s_axis_tready(arp_server_100g_0_arp_out_TREADY),
        .s_axis_tvalid(arp_server_100g_0_arp_out_TVALID));
  GULF_Stream_axis_data_fifo_1_0 axis_data_fifo_1
       (.m_axis_tdata(axis_data_fifo_1_m_axis_tdata),
        .m_axis_tkeep(axis_data_fifo_1_m_axis_tkeep),
        .m_axis_tlast(axis_data_fifo_1_m_axis_tlast),
        .m_axis_tready(ether_protocol_assembler_0_ip_ready_V),
        .m_axis_tvalid(axis_data_fifo_1_m_axis_tvalid),
        .s_aclk(clk_0_1),
        .s_aresetn(util_vector_logic_0_Res),
        .s_axis_tdata(udp_ip_server_100g_0_packet_m_axis_TDATA),
        .s_axis_tkeep(udp_ip_server_100g_0_packet_m_axis_TKEEP),
        .s_axis_tlast(udp_ip_server_100g_0_packet_m_axis_TLAST),
        .s_axis_tready(udp_ip_server_100g_0_packet_m_axis_TREADY),
        .s_axis_tvalid(udp_ip_server_100g_0_packet_m_axis_TVALID));
  GULF_Stream_ether_protocol_assembler_0_0 ether_protocol_assembler_0
       (.ap_clk(clk_0_1),
        .ap_rst(rst_0_1),
        .arp_ready_V(ether_protocol_assembler_0_arp_ready_V),
        .eth_arp_in_data_V(axis_data_fifo_0_m_axis_tdata),
        .eth_arp_in_keep_V(axis_data_fifo_0_m_axis_tkeep),
        .eth_arp_in_last_V(axis_data_fifo_0_m_axis_tlast),
        .eth_arp_in_valid_V(axis_data_fifo_0_m_axis_tvalid),
        .eth_ip_in_data_V(axis_data_fifo_1_m_axis_tdata),
        .eth_ip_in_keep_V(axis_data_fifo_1_m_axis_tkeep),
        .eth_ip_in_last_V(axis_data_fifo_1_m_axis_tlast),
        .eth_ip_in_valid_V(axis_data_fifo_1_m_axis_tvalid),
        .eth_out_data_V(ether_protocol_assembler_0_eth_out_data_V),
        .eth_out_keep_V(ether_protocol_assembler_0_eth_out_keep_V),
        .eth_out_last_V(ether_protocol_assembler_0_eth_out_last_V),
        .eth_out_ready_V(eth_out_ready_V_0_1),
        .eth_out_valid_V(ether_protocol_assembler_0_eth_out_valid_V),
        .ip_ready_V(ether_protocol_assembler_0_ip_ready_V));
  GULF_Stream_ether_protocol_spliter_0_0 ether_protocol_spliter_0
       (.ap_clk(clk_0_1),
        .ap_rst(rst_0_1),
        .arp_data_V(ether_protocol_spliter_0_arp_data_V),
        .arp_valid_V(ether_protocol_spliter_0_arp_valid_V),
        .ip_data_V(ether_protocol_spliter_0_ip_data_V),
        .ip_valid_V(ether_protocol_spliter_0_ip_valid_V),
        .myMacAddr_V(myMac_0_1),
        .payload_data_V(ether_protocol_spliter_0_payload_data_V),
        .payload_last_V(ether_protocol_spliter_0_payload_last_V),
        .payload_len_data_V(ether_protocol_spliter_0_payload_len_data_V),
        .payload_len_valid_V(ether_protocol_spliter_0_payload_len_valid_V),
        .payload_valid_V(ether_protocol_spliter_0_payload_valid_V),
        .s_axis_data_V(s_axis_data_V_0_1),
        .s_axis_keep_V(s_axis_keep_V_0_1),
        .s_axis_last_V(s_axis_last_V_0_1),
        .s_axis_valid_V(s_axis_valid_V_0_1));
  GULF_Stream_udp_ip_server_100g_0_0 udp_ip_server_100g_0
       (.arp_internal_resp_Mac_IP(udp_ip_server_100g_0_arp_internal_resp_TDATA),
        .arp_internal_resp_valid(udp_ip_server_100g_0_arp_internal_resp_TVALID),
        .arp_status(arp_server_100g_0_arp_status),
        .clk(clk_0_1),
        .dst_mac(arp_server_100g_0_lookup_result),
        .ip_in_data(ether_protocol_spliter_0_ip_data_V),
        .ip_in_valid(ether_protocol_spliter_0_ip_valid_V),
        .local_port_rx(udp_ip_server_100g_0_local_port_rx),
        .local_port_tx(local_port_tx_0_1),
        .myIP(myIP_0_1),
        .myMac(myMac_0_1),
        .packet_out_data(udp_ip_server_100g_0_packet_m_axis_TDATA),
        .packet_out_keep(udp_ip_server_100g_0_packet_m_axis_TKEEP),
        .packet_out_last(udp_ip_server_100g_0_packet_m_axis_TLAST),
        .packet_out_ready(udp_ip_server_100g_0_packet_m_axis_TREADY),
        .packet_out_valid(udp_ip_server_100g_0_packet_m_axis_TVALID),
        .payload_in_data(ether_protocol_spliter_0_payload_data_V),
        .payload_in_data_V_1(payload_from_user_0_1_TDATA),
        .payload_in_keep(payload_from_user_0_1_TKEEP),
        .payload_in_last(ether_protocol_spliter_0_payload_last_V),
        .payload_in_last_V_1(payload_from_user_0_1_TLAST),
        .payload_in_ready(payload_from_user_0_1_TREADY),
        .payload_in_valid(ether_protocol_spliter_0_payload_valid_V),
        .payload_in_valid_V_1(payload_from_user_0_1_TVALID),
        .payload_length_data(ether_protocol_spliter_0_payload_len_data_V),
        .payload_length_valid(ether_protocol_spliter_0_payload_len_valid_V),
        .payload_out_data(udp_ip_server_100g_0_payload_to_user_TDATA),
        .payload_out_keep(udp_ip_server_100g_0_payload_to_user_TKEEP),
        .payload_out_last(udp_ip_server_100g_0_payload_to_user_TLAST),
        .payload_out_valid(udp_ip_server_100g_0_payload_to_user_TVALID),
        .remote_ip_rx(udp_ip_server_100g_0_remote_ip_rx),
        .remote_ip_tx(remote_ip_tx_0_1),
        .remote_port_rx(udp_ip_server_100g_0_remote_port_rx),
        .remote_port_tx(remote_port_tx_0_1),
        .rst(rst_0_1));
  GULF_Stream_util_vector_logic_0_0 util_vector_logic_0
       (.Op1(rst_0_1),
        .Res(util_vector_logic_0_Res));
endmodule
