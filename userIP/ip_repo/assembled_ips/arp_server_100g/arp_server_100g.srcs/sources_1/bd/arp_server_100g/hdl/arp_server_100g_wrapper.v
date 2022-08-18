//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
//Date        : Wed Aug 18 04:20:52 2021
//Host        : Gaoyu running 64-bit Ubuntu 16.04.7 LTS
//Command     : generate_target arp_server_100g_wrapper.bd
//Design      : arp_server_100g_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module arp_server_100g_wrapper
   (arp_in_data,
    arp_in_valid,
    arp_internal_resp_Mac_IP,
    arp_internal_resp_valid,
    arp_out_data,
    arp_out_keep,
    arp_out_last,
    arp_out_ready,
    arp_out_valid,
    arp_status,
    clk,
    gateway,
    lookup_req,
    lookup_result,
    myIP,
    myMac,
    netmask,
    rst);
  input [335:0]arp_in_data;
  input [0:0]arp_in_valid;
  input [79:0]arp_internal_resp_Mac_IP;
  input [0:0]arp_internal_resp_valid;
  output [511:0]arp_out_data;
  output [63:0]arp_out_keep;
  output [0:0]arp_out_last;
  input [0:0]arp_out_ready;
  output [0:0]arp_out_valid;
  output [1:0]arp_status;
  input clk;
  input [31:0]gateway;
  input [31:0]lookup_req;
  output [47:0]lookup_result;
  input [31:0]myIP;
  input [47:0]myMac;
  input [31:0]netmask;
  input rst;

  wire [335:0]arp_in_data;
  wire [0:0]arp_in_valid;
  wire [79:0]arp_internal_resp_Mac_IP;
  wire [0:0]arp_internal_resp_valid;
  wire [511:0]arp_out_data;
  wire [63:0]arp_out_keep;
  wire [0:0]arp_out_last;
  wire [0:0]arp_out_ready;
  wire [0:0]arp_out_valid;
  wire [1:0]arp_status;
  wire clk;
  wire [31:0]gateway;
  wire [31:0]lookup_req;
  wire [47:0]lookup_result;
  wire [31:0]myIP;
  wire [47:0]myMac;
  wire [31:0]netmask;
  wire rst;

  arp_server_100g arp_server_100g_i
       (.arp_in_data(arp_in_data),
        .arp_in_valid(arp_in_valid),
        .arp_internal_resp_Mac_IP(arp_internal_resp_Mac_IP),
        .arp_internal_resp_valid(arp_internal_resp_valid),
        .arp_out_data(arp_out_data),
        .arp_out_keep(arp_out_keep),
        .arp_out_last(arp_out_last),
        .arp_out_ready(arp_out_ready),
        .arp_out_valid(arp_out_valid),
        .arp_status(arp_status),
        .clk(clk),
        .gateway(gateway),
        .lookup_req(lookup_req),
        .lookup_result(lookup_result),
        .myIP(myIP),
        .myMac(myMac),
        .netmask(netmask),
        .rst(rst));
endmodule
