//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
//Date        : Wed Aug 18 04:21:21 2021
//Host        : Gaoyu running 64-bit Ubuntu 16.04.7 LTS
//Command     : generate_target udp_ip_server_100g_wrapper.bd
//Design      : udp_ip_server_100g_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module udp_ip_server_100g_wrapper
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
  output [79:0]arp_internal_resp_Mac_IP;
  output [0:0]arp_internal_resp_valid;
  input [1:0]arp_status;
  input clk;
  input [47:0]dst_mac;
  input [335:0]ip_in_data;
  input [0:0]ip_in_valid;
  output [15:0]local_port_rx;
  input [15:0]local_port_tx;
  input [31:0]myIP;
  input [47:0]myMac;
  output [511:0]packet_out_data;
  output [63:0]packet_out_keep;
  output [0:0]packet_out_last;
  input [0:0]packet_out_ready;
  output [0:0]packet_out_valid;
  input [511:0]payload_in_data;
  input [511:0]payload_in_data_V_1;
  input [63:0]payload_in_keep;
  input [0:0]payload_in_last;
  input [0:0]payload_in_last_V_1;
  output [0:0]payload_in_ready;
  input [0:0]payload_in_valid;
  input [0:0]payload_in_valid_V_1;
  input [15:0]payload_length_data;
  input [0:0]payload_length_valid;
  output [511:0]payload_out_data;
  output [63:0]payload_out_keep;
  output [0:0]payload_out_last;
  output [0:0]payload_out_valid;
  output [31:0]remote_ip_rx;
  input [31:0]remote_ip_tx;
  output [15:0]remote_port_rx;
  input [15:0]remote_port_tx;
  input rst;

  wire [79:0]arp_internal_resp_Mac_IP;
  wire [0:0]arp_internal_resp_valid;
  wire [1:0]arp_status;
  wire clk;
  wire [47:0]dst_mac;
  wire [335:0]ip_in_data;
  wire [0:0]ip_in_valid;
  wire [15:0]local_port_rx;
  wire [15:0]local_port_tx;
  wire [31:0]myIP;
  wire [47:0]myMac;
  wire [511:0]packet_out_data;
  wire [63:0]packet_out_keep;
  wire [0:0]packet_out_last;
  wire [0:0]packet_out_ready;
  wire [0:0]packet_out_valid;
  wire [511:0]payload_in_data;
  wire [511:0]payload_in_data_V_1;
  wire [63:0]payload_in_keep;
  wire [0:0]payload_in_last;
  wire [0:0]payload_in_last_V_1;
  wire [0:0]payload_in_ready;
  wire [0:0]payload_in_valid;
  wire [0:0]payload_in_valid_V_1;
  wire [15:0]payload_length_data;
  wire [0:0]payload_length_valid;
  wire [511:0]payload_out_data;
  wire [63:0]payload_out_keep;
  wire [0:0]payload_out_last;
  wire [0:0]payload_out_valid;
  wire [31:0]remote_ip_rx;
  wire [31:0]remote_ip_tx;
  wire [15:0]remote_port_rx;
  wire [15:0]remote_port_tx;
  wire rst;

  udp_ip_server_100g udp_ip_server_100g_i
       (.arp_internal_resp_Mac_IP(arp_internal_resp_Mac_IP),
        .arp_internal_resp_valid(arp_internal_resp_valid),
        .arp_status(arp_status),
        .clk(clk),
        .dst_mac(dst_mac),
        .ip_in_data(ip_in_data),
        .ip_in_valid(ip_in_valid),
        .local_port_rx(local_port_rx),
        .local_port_tx(local_port_tx),
        .myIP(myIP),
        .myMac(myMac),
        .packet_out_data(packet_out_data),
        .packet_out_keep(packet_out_keep),
        .packet_out_last(packet_out_last),
        .packet_out_ready(packet_out_ready),
        .packet_out_valid(packet_out_valid),
        .payload_in_data(payload_in_data),
        .payload_in_data_V_1(payload_in_data_V_1),
        .payload_in_keep(payload_in_keep),
        .payload_in_last(payload_in_last),
        .payload_in_last_V_1(payload_in_last_V_1),
        .payload_in_ready(payload_in_ready),
        .payload_in_valid(payload_in_valid),
        .payload_in_valid_V_1(payload_in_valid_V_1),
        .payload_length_data(payload_length_data),
        .payload_length_valid(payload_length_valid),
        .payload_out_data(payload_out_data),
        .payload_out_keep(payload_out_keep),
        .payload_out_last(payload_out_last),
        .payload_out_valid(payload_out_valid),
        .remote_ip_rx(remote_ip_rx),
        .remote_ip_tx(remote_ip_tx),
        .remote_port_rx(remote_port_rx),
        .remote_port_tx(remote_port_tx),
        .rst(rst));
endmodule
