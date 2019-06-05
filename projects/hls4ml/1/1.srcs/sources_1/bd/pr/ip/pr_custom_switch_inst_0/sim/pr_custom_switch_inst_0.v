// (c) Copyright 1995-2019 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:hls:width48router:1.0
// IP Revision: 1904171210

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "HLS" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module pr_custom_switch_inst_0 (
  network_addr_V,
  network_table_V_Clk_A,
  network_table_V_Rst_A,
  network_table_V_EN_A,
  network_table_V_WEN_A,
  network_table_V_Addr_A,
  network_table_V_Dout_A,
  network_table_V_Din_A,
  stream_in_V_TVALID,
  stream_in_V_TREADY,
  stream_in_V_TDATA,
  stream_in_V_TDEST,
  stream_in_V_TLAST,
  stream_in_V_TKEEP,
  stream_out_network_V_TVALID,
  stream_out_network_V_TREADY,
  stream_out_network_V_TDATA,
  stream_out_network_V_TDEST,
  stream_out_network_V_TLAST,
  stream_out_network_V_TKEEP,
  stream_out_switch_V_TVALID,
  stream_out_switch_V_TREADY,
  stream_out_switch_V_TDATA,
  stream_out_switch_V_TDEST,
  stream_out_switch_V_TLAST,
  stream_out_switch_V_TKEEP,
  aclk,
  aresetn
);

input wire [47 : 0] network_addr_V;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 network_table_V_PORTA CLK" *)
output wire network_table_V_Clk_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 network_table_V_PORTA RST" *)
output wire network_table_V_Rst_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 network_table_V_PORTA EN" *)
output wire network_table_V_EN_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 network_table_V_PORTA WE" *)
output wire [7 : 0] network_table_V_WEN_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 network_table_V_PORTA ADDR" *)
output wire [31 : 0] network_table_V_Addr_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 network_table_V_PORTA DIN" *)
output wire [63 : 0] network_table_V_Dout_A;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME network_table_V_PORTA, MEM_WIDTH 64, MEM_SIZE 2048, MASTER_TYPE BRAM_CTRL, MEM_ECC NONE" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 network_table_V_PORTA DOUT" *)
input wire [63 : 0] network_table_V_Din_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 stream_in_V TVALID" *)
input wire stream_in_V_TVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 stream_in_V TREADY" *)
output wire stream_in_V_TREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 stream_in_V TDATA" *)
input wire [63 : 0] stream_in_V_TDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 stream_in_V TDEST" *)
input wire [7 : 0] stream_in_V_TDEST;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 stream_in_V TLAST" *)
input wire [0 : 0] stream_in_V_TLAST;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME stream_in_V, TDATA_NUM_BYTES 8, TDEST_WIDTH 8, TUSER_WIDTH 0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} TDATA {datatype {name {attribs {resolve_type immed\
iate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 64} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} TDATA_WIDTH 64}, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 156250000, PHASE 0.000, CLK_DOMAIN pr_CLK" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 stream_in_V TKEEP" *)
input wire [7 : 0] stream_in_V_TKEEP;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 stream_out_network_V TVALID" *)
output wire stream_out_network_V_TVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 stream_out_network_V TREADY" *)
input wire stream_out_network_V_TREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 stream_out_network_V TDATA" *)
output wire [63 : 0] stream_out_network_V_TDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 stream_out_network_V TDEST" *)
output wire [7 : 0] stream_out_network_V_TDEST;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 stream_out_network_V TLAST" *)
output wire [0 : 0] stream_out_network_V_TLAST;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME stream_out_network_V, TDATA_NUM_BYTES 8, TDEST_WIDTH 8, TUSER_WIDTH 0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {TDATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 64} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type i\
mmediate dependency {} format bool minimum {} maximum {}} value false}}}} TDATA_WIDTH 64}, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 156250000, PHASE 0.000, CLK_DOMAIN pr_CLK" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 stream_out_network_V TKEEP" *)
output wire [7 : 0] stream_out_network_V_TKEEP;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 stream_out_switch_V TVALID" *)
output wire stream_out_switch_V_TVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 stream_out_switch_V TREADY" *)
input wire stream_out_switch_V_TREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 stream_out_switch_V TDATA" *)
output wire [63 : 0] stream_out_switch_V_TDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 stream_out_switch_V TDEST" *)
output wire [7 : 0] stream_out_switch_V_TDEST;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 stream_out_switch_V TLAST" *)
output wire [0 : 0] stream_out_switch_V_TLAST;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME stream_out_switch_V, TDATA_NUM_BYTES 8, TDEST_WIDTH 8, TUSER_WIDTH 0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {TDATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 64} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type im\
mediate dependency {} format bool minimum {} maximum {}} value false}}}} TDATA_WIDTH 64}, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 156250000, PHASE 0.000, CLK_DOMAIN pr_CLK" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 stream_out_switch_V TKEEP" *)
output wire [7 : 0] stream_out_switch_V_TKEEP;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aclk, ASSOCIATED_BUSIF stream_in_V:stream_out_network_V:stream_out_switch_V, ASSOCIATED_RESET aresetn, FREQ_HZ 156250000, PHASE 0.000, CLK_DOMAIN pr_CLK" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 aclk CLK" *)
input wire aclk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aresetn, POLARITY ACTIVE_LOW" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 aresetn RST" *)
input wire aresetn;

  width48router_top inst (
    .network_addr_V(network_addr_V),
    .network_table_V_Clk_A(network_table_V_Clk_A),
    .network_table_V_Rst_A(network_table_V_Rst_A),
    .network_table_V_EN_A(network_table_V_EN_A),
    .network_table_V_WEN_A(network_table_V_WEN_A),
    .network_table_V_Addr_A(network_table_V_Addr_A),
    .network_table_V_Dout_A(network_table_V_Dout_A),
    .network_table_V_Din_A(network_table_V_Din_A),
    .stream_in_V_TVALID(stream_in_V_TVALID),
    .stream_in_V_TREADY(stream_in_V_TREADY),
    .stream_in_V_TDATA(stream_in_V_TDATA),
    .stream_in_V_TDEST(stream_in_V_TDEST),
    .stream_in_V_TLAST(stream_in_V_TLAST),
    .stream_in_V_TKEEP(stream_in_V_TKEEP),
    .stream_out_network_V_TVALID(stream_out_network_V_TVALID),
    .stream_out_network_V_TREADY(stream_out_network_V_TREADY),
    .stream_out_network_V_TDATA(stream_out_network_V_TDATA),
    .stream_out_network_V_TDEST(stream_out_network_V_TDEST),
    .stream_out_network_V_TLAST(stream_out_network_V_TLAST),
    .stream_out_network_V_TKEEP(stream_out_network_V_TKEEP),
    .stream_out_switch_V_TVALID(stream_out_switch_V_TVALID),
    .stream_out_switch_V_TREADY(stream_out_switch_V_TREADY),
    .stream_out_switch_V_TDATA(stream_out_switch_V_TDATA),
    .stream_out_switch_V_TDEST(stream_out_switch_V_TDEST),
    .stream_out_switch_V_TLAST(stream_out_switch_V_TLAST),
    .stream_out_switch_V_TKEEP(stream_out_switch_V_TKEEP),
    .aclk(aclk),
    .aresetn(aresetn)
  );
endmodule
