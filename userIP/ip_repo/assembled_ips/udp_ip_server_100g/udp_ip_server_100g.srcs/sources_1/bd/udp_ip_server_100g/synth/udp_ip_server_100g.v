//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
//Date        : Wed Aug 18 04:21:21 2021
//Host        : Gaoyu running 64-bit Ubuntu 16.04.7 LTS
//Command     : generate_target udp_ip_server_100g.bd
//Design      : udp_ip_server_100g
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "udp_ip_server_100g,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=udp_ip_server_100g,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=11,numReposBlks=11,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=6,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "udp_ip_server_100g.hwdef" *) 
module udp_ip_server_100g
   (arp_internal_resp_Mac_IP,
    arp_internal_resp_valid,
    arp_status,
    clk,
    dst_mac,
    ip_in_data,
    ip_in_valid,
    local_port_rx,
    local_port_tx,
    myIP,
    myMac,
    packet_out_data,
    packet_out_keep,
    packet_out_last,
    packet_out_ready,
    packet_out_valid,
    payload_in_data,
    payload_in_data_V_1,
    payload_in_keep,
    payload_in_last,
    payload_in_last_V_1,
    payload_in_ready,
    payload_in_valid,
    payload_in_valid_V_1,
    payload_length_data,
    payload_length_valid,
    payload_out_data,
    payload_out_keep,
    payload_out_last,
    payload_out_valid,
    remote_ip_rx,
    remote_ip_tx,
    remote_port_rx,
    remote_port_tx,
    rst);
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ARP_INTERNAL_RESP_MAC_IP DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ARP_INTERNAL_RESP_MAC_IP, LAYERED_METADATA undef" *) output [79:0]arp_internal_resp_Mac_IP;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ARP_INTERNAL_RESP_VALID DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ARP_INTERNAL_RESP_VALID, LAYERED_METADATA undef" *) output [0:0]arp_internal_resp_valid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.ARP_STATUS DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.ARP_STATUS, LAYERED_METADATA undef" *) input [1:0]arp_status;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, ASSOCIATED_RESET rst, CLK_DOMAIN udp_ip_server_100g_ap_clk_0, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.DST_MAC DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.DST_MAC, LAYERED_METADATA undef" *) input [47:0]dst_mac;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.IP_IN_DATA DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.IP_IN_DATA, LAYERED_METADATA undef" *) input [335:0]ip_in_data;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.IP_IN_VALID DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.IP_IN_VALID, LAYERED_METADATA undef" *) input [0:0]ip_in_valid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LOCAL_PORT_RX DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LOCAL_PORT_RX, LAYERED_METADATA undef" *) output [15:0]local_port_rx;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LOCAL_PORT_TX DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LOCAL_PORT_TX, LAYERED_METADATA undef" *) input [15:0]local_port_tx;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.MYIP DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.MYIP, LAYERED_METADATA undef" *) input [31:0]myIP;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.MYMAC DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.MYMAC, LAYERED_METADATA undef" *) input [47:0]myMac;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.PACKET_OUT_DATA DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.PACKET_OUT_DATA, LAYERED_METADATA undef" *) output [511:0]packet_out_data;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.PACKET_OUT_KEEP DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.PACKET_OUT_KEEP, LAYERED_METADATA undef" *) output [63:0]packet_out_keep;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.PACKET_OUT_LAST DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.PACKET_OUT_LAST, LAYERED_METADATA undef" *) output [0:0]packet_out_last;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.PACKET_OUT_READY DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.PACKET_OUT_READY, LAYERED_METADATA undef" *) input [0:0]packet_out_ready;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.PACKET_OUT_VALID DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.PACKET_OUT_VALID, LAYERED_METADATA undef" *) output [0:0]packet_out_valid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.PAYLOAD_IN_DATA DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.PAYLOAD_IN_DATA, LAYERED_METADATA undef" *) input [511:0]payload_in_data;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.PAYLOAD_IN_DATA_V_1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.PAYLOAD_IN_DATA_V_1, LAYERED_METADATA undef" *) input [511:0]payload_in_data_V_1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.PAYLOAD_IN_KEEP DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.PAYLOAD_IN_KEEP, LAYERED_METADATA undef" *) input [63:0]payload_in_keep;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.PAYLOAD_IN_LAST DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.PAYLOAD_IN_LAST, LAYERED_METADATA undef" *) input [0:0]payload_in_last;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.PAYLOAD_IN_LAST_V_1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.PAYLOAD_IN_LAST_V_1, LAYERED_METADATA undef" *) input [0:0]payload_in_last_V_1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.PAYLOAD_IN_READY DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.PAYLOAD_IN_READY, LAYERED_METADATA undef" *) output [0:0]payload_in_ready;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.PAYLOAD_IN_VALID DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.PAYLOAD_IN_VALID, LAYERED_METADATA undef" *) input [0:0]payload_in_valid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.PAYLOAD_IN_VALID_V_1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.PAYLOAD_IN_VALID_V_1, LAYERED_METADATA undef" *) input [0:0]payload_in_valid_V_1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.PAYLOAD_LENGTH_DATA DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.PAYLOAD_LENGTH_DATA, LAYERED_METADATA undef" *) input [15:0]payload_length_data;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.PAYLOAD_LENGTH_VALID DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.PAYLOAD_LENGTH_VALID, LAYERED_METADATA undef" *) input [0:0]payload_length_valid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.PAYLOAD_OUT_DATA DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.PAYLOAD_OUT_DATA, LAYERED_METADATA undef" *) output [511:0]payload_out_data;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.PAYLOAD_OUT_KEEP DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.PAYLOAD_OUT_KEEP, LAYERED_METADATA undef" *) output [63:0]payload_out_keep;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.PAYLOAD_OUT_LAST DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.PAYLOAD_OUT_LAST, LAYERED_METADATA undef" *) output [0:0]payload_out_last;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.PAYLOAD_OUT_VALID DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.PAYLOAD_OUT_VALID, LAYERED_METADATA undef" *) output [0:0]payload_out_valid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.REMOTE_IP_RX DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.REMOTE_IP_RX, LAYERED_METADATA undef" *) output [31:0]remote_ip_rx;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.REMOTE_IP_TX DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.REMOTE_IP_TX, LAYERED_METADATA undef" *) input [31:0]remote_ip_tx;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.REMOTE_PORT_RX DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.REMOTE_PORT_RX, LAYERED_METADATA undef" *) output [15:0]remote_port_rx;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.REMOTE_PORT_TX DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.REMOTE_PORT_TX, LAYERED_METADATA undef" *) input [15:0]remote_port_tx;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RST, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input rst;

  wire [0:0]action_excecutor_0_action_re_V;
  wire [15:0]action_excecutor_0_dst_port_V;
  wire [511:0]action_excecutor_0_payload_out_data_V;
  wire [63:0]action_excecutor_0_payload_out_keep_V;
  wire [0:0]action_excecutor_0_payload_out_last_V;
  wire [0:0]action_excecutor_0_payload_out_valid_V;
  wire [0:0]action_excecutor_0_payload_ready_V;
  wire [31:0]action_excecutor_0_src_ip_V;
  wire [15:0]action_excecutor_0_src_port_V;
  wire [64:0]action_generator_0_action_out;
  wire [0:0]action_generator_0_action_out_valid_V;
  wire ap_clk_0_1;
  wire ap_rst_0_1;
  wire [1:0]arp_status_V_0_1;
  wire [511:0]axis_data_fifo_0_m_axis_tdata;
  wire [63:0]axis_data_fifo_0_m_axis_tkeep;
  wire axis_data_fifo_0_m_axis_tlast;
  wire axis_data_fifo_0_m_axis_tvalid;
  wire [511:0]axis_data_fifo_1_m_axis_tdata;
  wire [63:0]axis_data_fifo_1_m_axis_tkeep;
  wire axis_data_fifo_1_m_axis_tlast;
  wire axis_data_fifo_1_m_axis_tvalid;
  wire axis_data_fifo_1_s_axis_tready;
  wire [31:0]dst_ip_V_0_1;
  wire [47:0]dst_mac_V_0_1;
  wire [15:0]dst_port_V_1_1;
  wire [64:0]fifo_generator_0_dout;
  wire fifo_generator_0_empty;
  wire fifo_generator_0_valid;
  wire [160:0]fifo_generator_1_dout;
  wire fifo_generator_1_empty;
  wire fifo_generator_1_valid;
  wire [335:0]ip_in_data_V_0_1;
  wire [0:0]ip_in_valid_V_0_1;
  wire [31:0]myIP_V_0_1;
  wire [47:0]myMac_V_0_1;
  wire [0:0]packet_out_ready_V_0_1;
  wire [31:0]payload_checksum_0_checksum_data_V;
  wire [0:0]payload_checksum_0_checksum_valid_V;
  wire [511:0]payload_checksum_0_payload_out_data_V;
  wire [63:0]payload_checksum_0_payload_out_keep_V;
  wire [0:0]payload_checksum_0_payload_out_last_V;
  wire [0:0]payload_checksum_0_payload_out_valid_V;
  wire [511:0]payload_in_data_V_0_1;
  wire [511:0]payload_in_data_V_1_1;
  wire [63:0]payload_in_keep_V_0_1;
  wire [0:0]payload_in_last_V_0_1;
  wire [0:0]payload_in_last_V_1_1;
  wire [0:0]payload_in_valid_V_0_1;
  wire [0:0]payload_in_valid_V_1_1;
  wire [15:0]payload_length_data_V_0_1;
  wire [0:0]payload_length_valid_V_0_1;
  wire [15:0]src_port_V_1_1;
  wire [0:0]udp_eth_assemble_0_action_re_V;
  wire [511:0]udp_eth_assemble_0_packet_out_data_V;
  wire [63:0]udp_eth_assemble_0_packet_out_keep_V;
  wire [0:0]udp_eth_assemble_0_packet_out_last_V;
  wire [0:0]udp_eth_assemble_0_packet_out_valid_V;
  wire [0:0]udp_eth_assemble_0_payload_ready_V;
  wire [79:0]udp_ip_receive_0_arp_internal_resp_Mac_IP_V;
  wire [0:0]udp_ip_receive_0_arp_internal_resp_valid_V;
  wire [1:0]udp_ip_receive_0_meta_out_action_V;
  wire [31:0]udp_ip_receive_0_meta_out_checksum_V;
  wire [63:0]udp_ip_receive_0_meta_out_protocol_header_V;
  wire [31:0]udp_ip_receive_0_meta_out_src_ip_V;
  wire [160:0]udp_ip_tx_0_action_out;
  wire [0:0]udp_ip_tx_0_action_out_we_V;
  wire [0:0]udp_ip_tx_0_payload_in_ready_V;
  wire [511:0]udp_ip_tx_0_payload_out_data_V;
  wire [63:0]udp_ip_tx_0_payload_out_keep_V;
  wire [0:0]udp_ip_tx_0_payload_out_last_V;
  wire [0:0]udp_ip_tx_0_payload_out_valid_V;
  wire [0:0]util_vector_logic_0_Res;

  assign ap_clk_0_1 = clk;
  assign ap_rst_0_1 = rst;
  assign arp_internal_resp_Mac_IP[79:0] = udp_ip_receive_0_arp_internal_resp_Mac_IP_V;
  assign arp_internal_resp_valid[0] = udp_ip_receive_0_arp_internal_resp_valid_V;
  assign arp_status_V_0_1 = arp_status[1:0];
  assign dst_ip_V_0_1 = remote_ip_tx[31:0];
  assign dst_mac_V_0_1 = dst_mac[47:0];
  assign dst_port_V_1_1 = remote_port_tx[15:0];
  assign ip_in_data_V_0_1 = ip_in_data[335:0];
  assign ip_in_valid_V_0_1 = ip_in_valid[0];
  assign local_port_rx[15:0] = action_excecutor_0_dst_port_V;
  assign myIP_V_0_1 = myIP[31:0];
  assign myMac_V_0_1 = myMac[47:0];
  assign packet_out_data[511:0] = udp_eth_assemble_0_packet_out_data_V;
  assign packet_out_keep[63:0] = udp_eth_assemble_0_packet_out_keep_V;
  assign packet_out_last[0] = udp_eth_assemble_0_packet_out_last_V;
  assign packet_out_ready_V_0_1 = packet_out_ready[0];
  assign packet_out_valid[0] = udp_eth_assemble_0_packet_out_valid_V;
  assign payload_in_data_V_0_1 = payload_in_data[511:0];
  assign payload_in_data_V_1_1 = payload_in_data_V_1[511:0];
  assign payload_in_keep_V_0_1 = payload_in_keep[63:0];
  assign payload_in_last_V_0_1 = payload_in_last[0];
  assign payload_in_last_V_1_1 = payload_in_last_V_1[0];
  assign payload_in_ready[0] = udp_ip_tx_0_payload_in_ready_V;
  assign payload_in_valid_V_0_1 = payload_in_valid[0];
  assign payload_in_valid_V_1_1 = payload_in_valid_V_1[0];
  assign payload_length_data_V_0_1 = payload_length_data[15:0];
  assign payload_length_valid_V_0_1 = payload_length_valid[0];
  assign payload_out_data[511:0] = action_excecutor_0_payload_out_data_V;
  assign payload_out_keep[63:0] = action_excecutor_0_payload_out_keep_V;
  assign payload_out_last[0] = action_excecutor_0_payload_out_last_V;
  assign payload_out_valid[0] = action_excecutor_0_payload_out_valid_V;
  assign remote_ip_rx[31:0] = action_excecutor_0_src_ip_V;
  assign remote_port_rx[15:0] = action_excecutor_0_src_port_V;
  assign src_port_V_1_1 = local_port_tx[15:0];
  udp_ip_server_100g_action_excecutor_0_0 action_excecutor_0
       (.action(fifo_generator_0_dout),
        .action_empty_V(fifo_generator_0_empty),
        .action_re_V(action_excecutor_0_action_re_V),
        .action_valid_V(fifo_generator_0_valid),
        .ap_clk(ap_clk_0_1),
        .ap_rst(ap_rst_0_1),
        .dst_port_V(action_excecutor_0_dst_port_V),
        .payload_in_data_V(axis_data_fifo_0_m_axis_tdata),
        .payload_in_keep_V(axis_data_fifo_0_m_axis_tkeep),
        .payload_in_last_V(axis_data_fifo_0_m_axis_tlast),
        .payload_in_valid_V(axis_data_fifo_0_m_axis_tvalid),
        .payload_out_data_V(action_excecutor_0_payload_out_data_V),
        .payload_out_keep_V(action_excecutor_0_payload_out_keep_V),
        .payload_out_last_V(action_excecutor_0_payload_out_last_V),
        .payload_out_valid_V(action_excecutor_0_payload_out_valid_V),
        .payload_ready_V(action_excecutor_0_payload_ready_V),
        .src_ip_V(action_excecutor_0_src_ip_V),
        .src_port_V(action_excecutor_0_src_port_V));
  udp_ip_server_100g_action_generator_0_0 action_generator_0
       (.action_out(action_generator_0_action_out),
        .action_out_valid_V(action_generator_0_action_out_valid_V),
        .ap_clk(ap_clk_0_1),
        .ap_rst(ap_rst_0_1),
        .meta_in_action_V(udp_ip_receive_0_meta_out_action_V),
        .meta_in_checksum_V(udp_ip_receive_0_meta_out_checksum_V),
        .meta_in_protocol_header_V(udp_ip_receive_0_meta_out_protocol_header_V),
        .meta_in_src_ip_V(udp_ip_receive_0_meta_out_src_ip_V),
        .payload_cksum_data_V(payload_checksum_0_checksum_data_V),
        .payload_cksum_valid_V(payload_checksum_0_checksum_valid_V));
  udp_ip_server_100g_axis_data_fifo_0_0 axis_data_fifo_0
       (.m_axis_tdata(axis_data_fifo_0_m_axis_tdata),
        .m_axis_tkeep(axis_data_fifo_0_m_axis_tkeep),
        .m_axis_tlast(axis_data_fifo_0_m_axis_tlast),
        .m_axis_tready(action_excecutor_0_payload_ready_V),
        .m_axis_tvalid(axis_data_fifo_0_m_axis_tvalid),
        .s_aclk(ap_clk_0_1),
        .s_aresetn(util_vector_logic_0_Res),
        .s_axis_tdata(payload_checksum_0_payload_out_data_V),
        .s_axis_tkeep(payload_checksum_0_payload_out_keep_V),
        .s_axis_tlast(payload_checksum_0_payload_out_last_V),
        .s_axis_tvalid(payload_checksum_0_payload_out_valid_V));
  udp_ip_server_100g_axis_data_fifo_1_0 axis_data_fifo_1
       (.m_axis_tdata(axis_data_fifo_1_m_axis_tdata),
        .m_axis_tkeep(axis_data_fifo_1_m_axis_tkeep),
        .m_axis_tlast(axis_data_fifo_1_m_axis_tlast),
        .m_axis_tready(udp_eth_assemble_0_payload_ready_V),
        .m_axis_tvalid(axis_data_fifo_1_m_axis_tvalid),
        .s_aclk(ap_clk_0_1),
        .s_aresetn(util_vector_logic_0_Res),
        .s_axis_tdata(udp_ip_tx_0_payload_out_data_V),
        .s_axis_tkeep(udp_ip_tx_0_payload_out_keep_V),
        .s_axis_tlast(udp_ip_tx_0_payload_out_last_V),
        .s_axis_tready(axis_data_fifo_1_s_axis_tready),
        .s_axis_tvalid(udp_ip_tx_0_payload_out_valid_V));
  udp_ip_server_100g_fifo_generator_0_0 fifo_generator_0
       (.clk(ap_clk_0_1),
        .din(action_generator_0_action_out),
        .dout(fifo_generator_0_dout),
        .empty(fifo_generator_0_empty),
        .rd_en(action_excecutor_0_action_re_V),
        .rst(ap_rst_0_1),
        .valid(fifo_generator_0_valid),
        .wr_en(action_generator_0_action_out_valid_V));
  udp_ip_server_100g_fifo_generator_1_0 fifo_generator_1
       (.clk(ap_clk_0_1),
        .din(udp_ip_tx_0_action_out),
        .dout(fifo_generator_1_dout),
        .empty(fifo_generator_1_empty),
        .rd_en(udp_eth_assemble_0_action_re_V),
        .rst(ap_rst_0_1),
        .valid(fifo_generator_1_valid),
        .wr_en(udp_ip_tx_0_action_out_we_V));
  udp_ip_server_100g_payload_checksum_0_0 payload_checksum_0
       (.ap_clk(ap_clk_0_1),
        .ap_rst(ap_rst_0_1),
        .checksum_data_V(payload_checksum_0_checksum_data_V),
        .checksum_valid_V(payload_checksum_0_checksum_valid_V),
        .payload_in_data_V(payload_in_data_V_0_1),
        .payload_in_last_V(payload_in_last_V_0_1),
        .payload_in_valid_V(payload_in_valid_V_0_1),
        .payload_length_data_V(payload_length_data_V_0_1),
        .payload_length_valid_V(payload_length_valid_V_0_1),
        .payload_out_data_V(payload_checksum_0_payload_out_data_V),
        .payload_out_keep_V(payload_checksum_0_payload_out_keep_V),
        .payload_out_last_V(payload_checksum_0_payload_out_last_V),
        .payload_out_valid_V(payload_checksum_0_payload_out_valid_V));
  udp_ip_server_100g_udp_eth_assemble_0_0 udp_eth_assemble_0
       (.action(fifo_generator_1_dout),
        .action_empty_V(fifo_generator_1_empty),
        .action_re_V(udp_eth_assemble_0_action_re_V),
        .action_valid_V(fifo_generator_1_valid),
        .ap_clk(ap_clk_0_1),
        .ap_rst(ap_rst_0_1),
        .myIP_V(myIP_V_0_1),
        .myMac_V(myMac_V_0_1),
        .packet_out_data_V(udp_eth_assemble_0_packet_out_data_V),
        .packet_out_keep_V(udp_eth_assemble_0_packet_out_keep_V),
        .packet_out_last_V(udp_eth_assemble_0_packet_out_last_V),
        .packet_out_ready_V(packet_out_ready_V_0_1),
        .packet_out_valid_V(udp_eth_assemble_0_packet_out_valid_V),
        .payload_in_data_V(axis_data_fifo_1_m_axis_tdata),
        .payload_in_keep_V(axis_data_fifo_1_m_axis_tkeep),
        .payload_in_last_V(axis_data_fifo_1_m_axis_tlast),
        .payload_in_valid_V(axis_data_fifo_1_m_axis_tvalid),
        .payload_ready_V(udp_eth_assemble_0_payload_ready_V));
  udp_ip_server_100g_udp_ip_receive_0_0 udp_ip_receive_0
       (.ap_clk(ap_clk_0_1),
        .ap_rst(ap_rst_0_1),
        .arp_internal_resp_Mac_IP_V(udp_ip_receive_0_arp_internal_resp_Mac_IP_V),
        .arp_internal_resp_valid_V(udp_ip_receive_0_arp_internal_resp_valid_V),
        .ip_in_data_V(ip_in_data_V_0_1),
        .ip_in_valid_V(ip_in_valid_V_0_1),
        .meta_out_action_V(udp_ip_receive_0_meta_out_action_V),
        .meta_out_checksum_V(udp_ip_receive_0_meta_out_checksum_V),
        .meta_out_protocol_header_V(udp_ip_receive_0_meta_out_protocol_header_V),
        .meta_out_src_ip_V(udp_ip_receive_0_meta_out_src_ip_V),
        .myIP_V(myIP_V_0_1));
  udp_ip_server_100g_udp_ip_tx_0_0 udp_ip_tx_0
       (.action_out(udp_ip_tx_0_action_out),
        .action_out_we_V(udp_ip_tx_0_action_out_we_V),
        .ap_clk(ap_clk_0_1),
        .ap_rst(ap_rst_0_1),
        .arp_status_V(arp_status_V_0_1),
        .dst_ip_V(dst_ip_V_0_1),
        .dst_mac_V(dst_mac_V_0_1),
        .dst_port_V(dst_port_V_1_1),
        .myIP_V(myIP_V_0_1),
        .payload_in_data_V(payload_in_data_V_1_1),
        .payload_in_keep_V(payload_in_keep_V_0_1),
        .payload_in_last_V(payload_in_last_V_1_1),
        .payload_in_ready_V(udp_ip_tx_0_payload_in_ready_V),
        .payload_in_valid_V(payload_in_valid_V_1_1),
        .payload_out_data_V(udp_ip_tx_0_payload_out_data_V),
        .payload_out_keep_V(udp_ip_tx_0_payload_out_keep_V),
        .payload_out_last_V(udp_ip_tx_0_payload_out_last_V),
        .payload_out_ready_V(axis_data_fifo_1_s_axis_tready),
        .payload_out_valid_V(udp_ip_tx_0_payload_out_valid_V),
        .src_port_V(src_port_V_1_1));
  udp_ip_server_100g_util_vector_logic_0_0 util_vector_logic_0
       (.Op1(ap_rst_0_1),
        .Res(util_vector_logic_0_Res));
endmodule
