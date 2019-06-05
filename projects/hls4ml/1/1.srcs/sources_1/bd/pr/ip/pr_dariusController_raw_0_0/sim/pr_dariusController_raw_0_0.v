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


// IP VLNV: xilinx.com:hls:dariusController_raw:1.0
// IP Revision: 1904222130

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "HLS" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module pr_dariusController_raw_0_0 (
  ap_clk,
  ap_rst_n,
  ap_start,
  ap_done,
  ap_idle,
  ap_ready,
  stream_in_TVALID,
  stream_in_TREADY,
  stream_in_TDATA,
  stream_in_TKEEP,
  stream_in_TDEST,
  stream_in_TLAST,
  stream_out_TVALID,
  stream_out_TREADY,
  stream_out_TDATA,
  stream_out_TKEEP,
  stream_out_TDEST,
  stream_out_TLAST,
  axis_cmd_mm2s_V_data_V_TVALID,
  axis_cmd_mm2s_V_data_V_TREADY,
  axis_cmd_mm2s_V_data_V_TDATA,
  axis_cmd_s2mm_V_data_V_TVALID,
  axis_cmd_s2mm_V_data_V_TREADY,
  axis_cmd_s2mm_V_data_V_TDATA,
  axis_mm2s_TVALID,
  axis_mm2s_TREADY,
  axis_mm2s_TDATA,
  axis_mm2s_TLAST,
  axis_s2mm_TVALID,
  axis_s2mm_TREADY,
  axis_s2mm_TDATA,
  axis_s2mm_TLAST,
  m_axi_darius_driver_AWADDR,
  m_axi_darius_driver_AWLEN,
  m_axi_darius_driver_AWSIZE,
  m_axi_darius_driver_AWBURST,
  m_axi_darius_driver_AWLOCK,
  m_axi_darius_driver_AWREGION,
  m_axi_darius_driver_AWCACHE,
  m_axi_darius_driver_AWPROT,
  m_axi_darius_driver_AWQOS,
  m_axi_darius_driver_AWVALID,
  m_axi_darius_driver_AWREADY,
  m_axi_darius_driver_WDATA,
  m_axi_darius_driver_WSTRB,
  m_axi_darius_driver_WLAST,
  m_axi_darius_driver_WVALID,
  m_axi_darius_driver_WREADY,
  m_axi_darius_driver_BRESP,
  m_axi_darius_driver_BVALID,
  m_axi_darius_driver_BREADY,
  m_axi_darius_driver_ARADDR,
  m_axi_darius_driver_ARLEN,
  m_axi_darius_driver_ARSIZE,
  m_axi_darius_driver_ARBURST,
  m_axi_darius_driver_ARLOCK,
  m_axi_darius_driver_ARREGION,
  m_axi_darius_driver_ARCACHE,
  m_axi_darius_driver_ARPROT,
  m_axi_darius_driver_ARQOS,
  m_axi_darius_driver_ARVALID,
  m_axi_darius_driver_ARREADY,
  m_axi_darius_driver_RDATA,
  m_axi_darius_driver_RRESP,
  m_axi_darius_driver_RLAST,
  m_axi_darius_driver_RVALID,
  m_axi_darius_driver_RREADY,
  rank
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF stream_in:stream_out:axis_cmd_mm2s_V_data_V:axis_cmd_s2mm_V_data_V:axis_mm2s:axis_s2mm:m_axi_darius_driver, ASSOCIATED_RESET ap_rst_n, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {\
} format long minimum {} maximum {}} value 0}}}}, FREQ_HZ 156250000, PHASE 0.000, CLK_DOMAIN pr_CLK" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ap_clk CLK" *)
input wire ap_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {RST {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ap_rst_n RST" *)
input wire ap_rst_n;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl start" *)
input wire ap_start;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl done" *)
output wire ap_done;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl idle" *)
output wire ap_idle;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_ctrl, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {start {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} done {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum \
{}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} idle {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long\
 minimum {} maximum {}} value 0}}} ready {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl ready" *)
output wire ap_ready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 stream_in TVALID" *)
input wire stream_in_TVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 stream_in TREADY" *)
output wire stream_in_TREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 stream_in TDATA" *)
input wire [63 : 0] stream_in_TDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 stream_in TKEEP" *)
input wire [7 : 0] stream_in_TKEEP;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 stream_in TDEST" *)
input wire [7 : 0] stream_in_TDEST;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME stream_in, TDATA_NUM_BYTES 8, TDEST_WIDTH 8, TUSER_WIDTH 0, LAYERED_METADATA undef, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 156250000, PHASE 0.000, CLK_DOMAIN pr_CLK" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 stream_in TLAST" *)
input wire [0 : 0] stream_in_TLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 stream_out TVALID" *)
output wire stream_out_TVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 stream_out TREADY" *)
input wire stream_out_TREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 stream_out TDATA" *)
output wire [63 : 0] stream_out_TDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 stream_out TKEEP" *)
output wire [7 : 0] stream_out_TKEEP;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 stream_out TDEST" *)
output wire [7 : 0] stream_out_TDEST;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME stream_out, TDATA_NUM_BYTES 8, TDEST_WIDTH 8, TUSER_WIDTH 0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} TDATA {datatype {name {attribs {resolve_type immedi\
ate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 64} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} TDATA_WIDTH 64}, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 156250000, PHASE 0.000, CLK_DOMAIN pr_CLK" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 stream_out TLAST" *)
output wire [0 : 0] stream_out_TLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_cmd_mm2s_V_data_V TVALID" *)
output wire axis_cmd_mm2s_V_data_V_TVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_cmd_mm2s_V_data_V TREADY" *)
input wire axis_cmd_mm2s_V_data_V_TREADY;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME axis_cmd_mm2s_V_data_V, TDATA_NUM_BYTES 9, TUSER_WIDTH 0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} TDATA {datatype {name {attribs {resolve_type immediate\
 dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 72} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} TDATA_WIDTH 72}, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 156250000, PHASE 0.000, CLK_DOMAIN pr_CLK" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_cmd_mm2s_V_data_V TDATA" *)
output wire [71 : 0] axis_cmd_mm2s_V_data_V_TDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_cmd_s2mm_V_data_V TVALID" *)
output wire axis_cmd_s2mm_V_data_V_TVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_cmd_s2mm_V_data_V TREADY" *)
input wire axis_cmd_s2mm_V_data_V_TREADY;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME axis_cmd_s2mm_V_data_V, TDATA_NUM_BYTES 9, TUSER_WIDTH 0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} TDATA {datatype {name {attribs {resolve_type immediate\
 dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 72} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} TDATA_WIDTH 72}, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 156250000, PHASE 0.000, CLK_DOMAIN pr_CLK" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_cmd_s2mm_V_data_V TDATA" *)
output wire [71 : 0] axis_cmd_s2mm_V_data_V_TDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_mm2s TVALID" *)
input wire axis_mm2s_TVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_mm2s TREADY" *)
output wire axis_mm2s_TREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_mm2s TDATA" *)
input wire [63 : 0] axis_mm2s_TDATA;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME axis_mm2s, TDATA_NUM_BYTES 8, TUSER_WIDTH 0, LAYERED_METADATA undef, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 156250000, PHASE 0.000, CLK_DOMAIN pr_CLK" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_mm2s TLAST" *)
input wire [0 : 0] axis_mm2s_TLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_s2mm TVALID" *)
output wire axis_s2mm_TVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_s2mm TREADY" *)
input wire axis_s2mm_TREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_s2mm TDATA" *)
output wire [63 : 0] axis_s2mm_TDATA;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME axis_s2mm, TDATA_NUM_BYTES 8, TUSER_WIDTH 0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} TDATA {datatype {name {attribs {resolve_type immediate dependency {\
} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 64} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} TDATA_WIDTH 64}, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 156250000, PHASE 0.000, CLK_DOMAIN pr_CLK" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 axis_s2mm TLAST" *)
output wire [0 : 0] axis_s2mm_TLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_darius_driver AWADDR" *)
output wire [31 : 0] m_axi_darius_driver_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_darius_driver AWLEN" *)
output wire [7 : 0] m_axi_darius_driver_AWLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_darius_driver AWSIZE" *)
output wire [2 : 0] m_axi_darius_driver_AWSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_darius_driver AWBURST" *)
output wire [1 : 0] m_axi_darius_driver_AWBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_darius_driver AWLOCK" *)
output wire [1 : 0] m_axi_darius_driver_AWLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_darius_driver AWREGION" *)
output wire [3 : 0] m_axi_darius_driver_AWREGION;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_darius_driver AWCACHE" *)
output wire [3 : 0] m_axi_darius_driver_AWCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_darius_driver AWPROT" *)
output wire [2 : 0] m_axi_darius_driver_AWPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_darius_driver AWQOS" *)
output wire [3 : 0] m_axi_darius_driver_AWQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_darius_driver AWVALID" *)
output wire m_axi_darius_driver_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_darius_driver AWREADY" *)
input wire m_axi_darius_driver_AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_darius_driver WDATA" *)
output wire [31 : 0] m_axi_darius_driver_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_darius_driver WSTRB" *)
output wire [3 : 0] m_axi_darius_driver_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_darius_driver WLAST" *)
output wire m_axi_darius_driver_WLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_darius_driver WVALID" *)
output wire m_axi_darius_driver_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_darius_driver WREADY" *)
input wire m_axi_darius_driver_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_darius_driver BRESP" *)
input wire [1 : 0] m_axi_darius_driver_BRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_darius_driver BVALID" *)
input wire m_axi_darius_driver_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_darius_driver BREADY" *)
output wire m_axi_darius_driver_BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_darius_driver ARADDR" *)
output wire [31 : 0] m_axi_darius_driver_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_darius_driver ARLEN" *)
output wire [7 : 0] m_axi_darius_driver_ARLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_darius_driver ARSIZE" *)
output wire [2 : 0] m_axi_darius_driver_ARSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_darius_driver ARBURST" *)
output wire [1 : 0] m_axi_darius_driver_ARBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_darius_driver ARLOCK" *)
output wire [1 : 0] m_axi_darius_driver_ARLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_darius_driver ARREGION" *)
output wire [3 : 0] m_axi_darius_driver_ARREGION;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_darius_driver ARCACHE" *)
output wire [3 : 0] m_axi_darius_driver_ARCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_darius_driver ARPROT" *)
output wire [2 : 0] m_axi_darius_driver_ARPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_darius_driver ARQOS" *)
output wire [3 : 0] m_axi_darius_driver_ARQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_darius_driver ARVALID" *)
output wire m_axi_darius_driver_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_darius_driver ARREADY" *)
input wire m_axi_darius_driver_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_darius_driver RDATA" *)
input wire [31 : 0] m_axi_darius_driver_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_darius_driver RRESP" *)
input wire [1 : 0] m_axi_darius_driver_RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_darius_driver RLAST" *)
input wire m_axi_darius_driver_RLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_darius_driver RVALID" *)
input wire m_axi_darius_driver_RVALID;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axi_darius_driver, ADDR_WIDTH 32, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 16, NUM_WRITE_OUTSTANDING 16, MAX_READ_BURST_LENGTH 16, MAX_WRITE_BURST_LENGTH 16, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, FREQ_HZ 156250000, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, PHASE 0.000, CL\
K_DOMAIN pr_CLK, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_darius_driver RREADY" *)
output wire m_axi_darius_driver_RREADY;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rank, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 rank DATA" *)
input wire [31 : 0] rank;

  dariusController_raw #(
    .C_M_AXI_DARIUS_DRIVER_ID_WIDTH(1),
    .C_M_AXI_DARIUS_DRIVER_ADDR_WIDTH(32),
    .C_M_AXI_DARIUS_DRIVER_DATA_WIDTH(32),
    .C_M_AXI_DARIUS_DRIVER_AWUSER_WIDTH(1),
    .C_M_AXI_DARIUS_DRIVER_ARUSER_WIDTH(1),
    .C_M_AXI_DARIUS_DRIVER_WUSER_WIDTH(1),
    .C_M_AXI_DARIUS_DRIVER_RUSER_WIDTH(1),
    .C_M_AXI_DARIUS_DRIVER_BUSER_WIDTH(1),
    .C_M_AXI_DARIUS_DRIVER_USER_VALUE('H00000000),
    .C_M_AXI_DARIUS_DRIVER_PROT_VALUE('B000),
    .C_M_AXI_DARIUS_DRIVER_CACHE_VALUE('B0011),
    .C_M_AXI_DARIUS_DRIVER_TARGET_ADDR('H00000000)
  ) inst (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(ap_start),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .ap_ready(ap_ready),
    .stream_in_TVALID(stream_in_TVALID),
    .stream_in_TREADY(stream_in_TREADY),
    .stream_in_TDATA(stream_in_TDATA),
    .stream_in_TKEEP(stream_in_TKEEP),
    .stream_in_TDEST(stream_in_TDEST),
    .stream_in_TLAST(stream_in_TLAST),
    .stream_out_TVALID(stream_out_TVALID),
    .stream_out_TREADY(stream_out_TREADY),
    .stream_out_TDATA(stream_out_TDATA),
    .stream_out_TKEEP(stream_out_TKEEP),
    .stream_out_TDEST(stream_out_TDEST),
    .stream_out_TLAST(stream_out_TLAST),
    .axis_cmd_mm2s_V_data_V_TVALID(axis_cmd_mm2s_V_data_V_TVALID),
    .axis_cmd_mm2s_V_data_V_TREADY(axis_cmd_mm2s_V_data_V_TREADY),
    .axis_cmd_mm2s_V_data_V_TDATA(axis_cmd_mm2s_V_data_V_TDATA),
    .axis_cmd_s2mm_V_data_V_TVALID(axis_cmd_s2mm_V_data_V_TVALID),
    .axis_cmd_s2mm_V_data_V_TREADY(axis_cmd_s2mm_V_data_V_TREADY),
    .axis_cmd_s2mm_V_data_V_TDATA(axis_cmd_s2mm_V_data_V_TDATA),
    .axis_mm2s_TVALID(axis_mm2s_TVALID),
    .axis_mm2s_TREADY(axis_mm2s_TREADY),
    .axis_mm2s_TDATA(axis_mm2s_TDATA),
    .axis_mm2s_TLAST(axis_mm2s_TLAST),
    .axis_s2mm_TVALID(axis_s2mm_TVALID),
    .axis_s2mm_TREADY(axis_s2mm_TREADY),
    .axis_s2mm_TDATA(axis_s2mm_TDATA),
    .axis_s2mm_TLAST(axis_s2mm_TLAST),
    .m_axi_darius_driver_AWID(),
    .m_axi_darius_driver_AWADDR(m_axi_darius_driver_AWADDR),
    .m_axi_darius_driver_AWLEN(m_axi_darius_driver_AWLEN),
    .m_axi_darius_driver_AWSIZE(m_axi_darius_driver_AWSIZE),
    .m_axi_darius_driver_AWBURST(m_axi_darius_driver_AWBURST),
    .m_axi_darius_driver_AWLOCK(m_axi_darius_driver_AWLOCK),
    .m_axi_darius_driver_AWREGION(m_axi_darius_driver_AWREGION),
    .m_axi_darius_driver_AWCACHE(m_axi_darius_driver_AWCACHE),
    .m_axi_darius_driver_AWPROT(m_axi_darius_driver_AWPROT),
    .m_axi_darius_driver_AWQOS(m_axi_darius_driver_AWQOS),
    .m_axi_darius_driver_AWUSER(),
    .m_axi_darius_driver_AWVALID(m_axi_darius_driver_AWVALID),
    .m_axi_darius_driver_AWREADY(m_axi_darius_driver_AWREADY),
    .m_axi_darius_driver_WID(),
    .m_axi_darius_driver_WDATA(m_axi_darius_driver_WDATA),
    .m_axi_darius_driver_WSTRB(m_axi_darius_driver_WSTRB),
    .m_axi_darius_driver_WLAST(m_axi_darius_driver_WLAST),
    .m_axi_darius_driver_WUSER(),
    .m_axi_darius_driver_WVALID(m_axi_darius_driver_WVALID),
    .m_axi_darius_driver_WREADY(m_axi_darius_driver_WREADY),
    .m_axi_darius_driver_BID(1'B0),
    .m_axi_darius_driver_BRESP(m_axi_darius_driver_BRESP),
    .m_axi_darius_driver_BUSER(1'B0),
    .m_axi_darius_driver_BVALID(m_axi_darius_driver_BVALID),
    .m_axi_darius_driver_BREADY(m_axi_darius_driver_BREADY),
    .m_axi_darius_driver_ARID(),
    .m_axi_darius_driver_ARADDR(m_axi_darius_driver_ARADDR),
    .m_axi_darius_driver_ARLEN(m_axi_darius_driver_ARLEN),
    .m_axi_darius_driver_ARSIZE(m_axi_darius_driver_ARSIZE),
    .m_axi_darius_driver_ARBURST(m_axi_darius_driver_ARBURST),
    .m_axi_darius_driver_ARLOCK(m_axi_darius_driver_ARLOCK),
    .m_axi_darius_driver_ARREGION(m_axi_darius_driver_ARREGION),
    .m_axi_darius_driver_ARCACHE(m_axi_darius_driver_ARCACHE),
    .m_axi_darius_driver_ARPROT(m_axi_darius_driver_ARPROT),
    .m_axi_darius_driver_ARQOS(m_axi_darius_driver_ARQOS),
    .m_axi_darius_driver_ARUSER(),
    .m_axi_darius_driver_ARVALID(m_axi_darius_driver_ARVALID),
    .m_axi_darius_driver_ARREADY(m_axi_darius_driver_ARREADY),
    .m_axi_darius_driver_RID(1'B0),
    .m_axi_darius_driver_RDATA(m_axi_darius_driver_RDATA),
    .m_axi_darius_driver_RRESP(m_axi_darius_driver_RRESP),
    .m_axi_darius_driver_RLAST(m_axi_darius_driver_RLAST),
    .m_axi_darius_driver_RUSER(1'B0),
    .m_axi_darius_driver_RVALID(m_axi_darius_driver_RVALID),
    .m_axi_darius_driver_RREADY(m_axi_darius_driver_RREADY),
    .rank(rank)
  );
endmodule
