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


// IP VLNV: pcgroup:migration:fthfour_tuple_hash:1.0
// IP Revision: 1806231612

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "HLS" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module SmartCamCtl_Custom (
  sessionLookup_req_TVALID,
  sessionLookup_req_TREADY,
  sessionLookup_req_TDATA,
  sessionLookup_rsp_TVALID,
  sessionLookup_rsp_TREADY,
  sessionLookup_rsp_TDATA,
  sessionUpdate_req_TVALID,
  sessionUpdate_req_TREADY,
  sessionUpdate_req_TDATA,
  sessionUpdate_rsp_TVALID,
  sessionUpdate_rsp_TREADY,
  sessionUpdate_rsp_TDATA,
  aclk,
  aresetn
);

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 sessionLookup_req TVALID" *)
input wire sessionLookup_req_TVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 sessionLookup_req TREADY" *)
output wire sessionLookup_req_TREADY;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME sessionLookup_req, TDATA_NUM_BYTES 13, TUSER_WIDTH 0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {TDATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 104} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB \
0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 sessionLookup_req TDATA" *)
input wire [103 : 0] sessionLookup_req_TDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 sessionLookup_rsp TVALID" *)
output wire sessionLookup_rsp_TVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 sessionLookup_rsp TREADY" *)
input wire sessionLookup_rsp_TREADY;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME sessionLookup_rsp, TDATA_NUM_BYTES 2, TUSER_WIDTH 0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {TDATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 16} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0,\
 HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 sessionLookup_rsp TDATA" *)
output wire [15 : 0] sessionLookup_rsp_TDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 sessionUpdate_req TVALID" *)
input wire sessionUpdate_req_TVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 sessionUpdate_req TREADY" *)
output wire sessionUpdate_req_TREADY;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME sessionUpdate_req, TDATA_NUM_BYTES 14, TUSER_WIDTH 0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {TDATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 112} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB \
0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 sessionUpdate_req TDATA" *)
input wire [111 : 0] sessionUpdate_req_TDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 sessionUpdate_rsp TVALID" *)
output wire sessionUpdate_rsp_TVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 sessionUpdate_rsp TREADY" *)
input wire sessionUpdate_rsp_TREADY;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME sessionUpdate_rsp, TDATA_NUM_BYTES 2, TUSER_WIDTH 0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {TDATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 16} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0,\
 HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 sessionUpdate_rsp TDATA" *)
output wire [15 : 0] sessionUpdate_rsp_TDATA;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aclk, ASSOCIATED_BUSIF sessionLookup_req:sessionLookup_rsp:sessionUpdate_req:sessionUpdate_rsp, ASSOCIATED_RESET aresetn, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 aclk CLK" *)
input wire aclk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 aresetn RST" *)
input wire aresetn;

  fthfour_tuple_hash_top inst (
    .sessionLookup_req_TVALID(sessionLookup_req_TVALID),
    .sessionLookup_req_TREADY(sessionLookup_req_TREADY),
    .sessionLookup_req_TDATA(sessionLookup_req_TDATA),
    .sessionLookup_rsp_TVALID(sessionLookup_rsp_TVALID),
    .sessionLookup_rsp_TREADY(sessionLookup_rsp_TREADY),
    .sessionLookup_rsp_TDATA(sessionLookup_rsp_TDATA),
    .sessionUpdate_req_TVALID(sessionUpdate_req_TVALID),
    .sessionUpdate_req_TREADY(sessionUpdate_req_TREADY),
    .sessionUpdate_req_TDATA(sessionUpdate_req_TDATA),
    .sessionUpdate_rsp_TVALID(sessionUpdate_rsp_TVALID),
    .sessionUpdate_rsp_TREADY(sessionUpdate_rsp_TREADY),
    .sessionUpdate_rsp_TDATA(sessionUpdate_rsp_TDATA),
    .aclk(aclk),
    .aresetn(aresetn)
  );
endmodule
