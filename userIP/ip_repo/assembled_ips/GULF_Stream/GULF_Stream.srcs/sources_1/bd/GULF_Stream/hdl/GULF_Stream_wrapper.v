//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
//Date        : Wed Aug 18 04:21:49 2021
//Host        : Gaoyu running 64-bit Ubuntu 16.04.7 LTS
//Command     : generate_target GULF_Stream_wrapper.bd
//Design      : GULF_Stream_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module GULF_Stream_wrapper
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
  input clk;
  output [511:0]eth_out_data_V;
  output [63:0]eth_out_keep_V;
  output [0:0]eth_out_last_V;
  input [0:0]eth_out_ready_V;
  output [0:0]eth_out_valid_V;
  input [31:0]gateway;
  output [15:0]local_port_rx;
  input [15:0]local_port_tx;
  input [31:0]myIP;
  input [47:0]myMac;
  input [31:0]netmask;
  input [511:0]payload_from_user_tdata;
  input [63:0]payload_from_user_tkeep;
  input [0:0]payload_from_user_tlast;
  output [0:0]payload_from_user_tready;
  input [0:0]payload_from_user_tvalid;
  output [511:0]payload_to_user_tdata;
  output [63:0]payload_to_user_tkeep;
  output [0:0]payload_to_user_tlast;
  output [0:0]payload_to_user_tvalid;
  output [31:0]remote_ip_rx;
  input [31:0]remote_ip_tx;
  output [15:0]remote_port_rx;
  input [15:0]remote_port_tx;
  input rst;
  input [511:0]s_axis_data_V;
  input [63:0]s_axis_keep_V;
  input [0:0]s_axis_last_V;
  input [0:0]s_axis_valid_V;

  wire [1:0]arp_status;
  wire clk;
  wire [511:0]eth_out_data_V;
  wire [63:0]eth_out_keep_V;
  wire [0:0]eth_out_last_V;
  wire [0:0]eth_out_ready_V;
  wire [0:0]eth_out_valid_V;
  wire [31:0]gateway;
  wire [15:0]local_port_rx;
  wire [15:0]local_port_tx;
  wire [31:0]myIP;
  wire [47:0]myMac;
  wire [31:0]netmask;
  wire [511:0]payload_from_user_tdata;
  wire [63:0]payload_from_user_tkeep;
  wire [0:0]payload_from_user_tlast;
  wire [0:0]payload_from_user_tready;
  wire [0:0]payload_from_user_tvalid;
  wire [511:0]payload_to_user_tdata;
  wire [63:0]payload_to_user_tkeep;
  wire [0:0]payload_to_user_tlast;
  wire [0:0]payload_to_user_tvalid;
  wire [31:0]remote_ip_rx;
  wire [31:0]remote_ip_tx;
  wire [15:0]remote_port_rx;
  wire [15:0]remote_port_tx;
  wire rst;
  wire [511:0]s_axis_data_V;
  wire [63:0]s_axis_keep_V;
  wire [0:0]s_axis_last_V;
  wire [0:0]s_axis_valid_V;

  GULF_Stream GULF_Stream_i
       (.arp_status(arp_status),
        .clk(clk),
        .eth_out_data_V(eth_out_data_V),
        .eth_out_keep_V(eth_out_keep_V),
        .eth_out_last_V(eth_out_last_V),
        .eth_out_ready_V(eth_out_ready_V),
        .eth_out_valid_V(eth_out_valid_V),
        .gateway(gateway),
        .local_port_rx(local_port_rx),
        .local_port_tx(local_port_tx),
        .myIP(myIP),
        .myMac(myMac),
        .netmask(netmask),
        .payload_from_user_tdata(payload_from_user_tdata),
        .payload_from_user_tkeep(payload_from_user_tkeep),
        .payload_from_user_tlast(payload_from_user_tlast),
        .payload_from_user_tready(payload_from_user_tready),
        .payload_from_user_tvalid(payload_from_user_tvalid),
        .payload_to_user_tdata(payload_to_user_tdata),
        .payload_to_user_tkeep(payload_to_user_tkeep),
        .payload_to_user_tlast(payload_to_user_tlast),
        .payload_to_user_tvalid(payload_to_user_tvalid),
        .remote_ip_rx(remote_ip_rx),
        .remote_ip_tx(remote_ip_tx),
        .remote_port_rx(remote_port_rx),
        .remote_port_tx(remote_port_tx),
        .rst(rst),
        .s_axis_data_V(s_axis_data_V),
        .s_axis_keep_V(s_axis_keep_V),
        .s_axis_last_V(s_axis_last_V),
        .s_axis_valid_V(s_axis_valid_V));
endmodule
