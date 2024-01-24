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


// IP VLNV: ethz.systems:hls:arp_server_subnet:1.0
// IP Revision: 1808181523

(* X_CORE_INFO = "arp_server_subnet_top,Vivado 2018.3" *)
(* CHECK_LICENSE_TYPE = "arp_server_subnet_ip,arp_server_subnet_top,{}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module arp_server_subnet_ip (
  myMacAddress_V,
  myIpAddress_V,
  m_axis_TVALID,
  m_axis_TREADY,
  m_axis_TDATA,
  m_axis_TKEEP,
  m_axis_TLAST,
  m_axis_arp_lookup_reply_TVALID,
  m_axis_arp_lookup_reply_TREADY,
  m_axis_arp_lookup_reply_TDATA,
  s_axis_TVALID,
  s_axis_TREADY,
  s_axis_TDATA,
  s_axis_TKEEP,
  s_axis_TLAST,
  s_axis_arp_lookup_request_TVALID,
  s_axis_arp_lookup_request_TREADY,
  s_axis_arp_lookup_request_TDATA,
  s_axis_arp_send_grat_TVALID,
  s_axis_arp_send_grat_TREADY,
  s_axis_arp_send_grat_TDATA,
  aclk,
  aresetn
);

input wire [47 : 0] myMacAddress_V;
input wire [31 : 0] myIpAddress_V;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TVALID" *)
output wire m_axis_TVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TREADY" *)
input wire m_axis_TREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TDATA" *)
output wire [63 : 0] m_axis_TDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TKEEP" *)
output wire [7 : 0] m_axis_TKEEP;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axis, TDATA_NUM_BYTES 8, TUSER_WIDTH 0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {TDATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 64} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format\
 bool minimum {} maximum {}} value false}}}}}, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TLAST" *)
output wire [0 : 0] m_axis_TLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_arp_lookup_reply TVALID" *)
output wire m_axis_arp_lookup_reply_TVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_arp_lookup_reply TREADY" *)
input wire m_axis_arp_lookup_reply_TREADY;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axis_arp_lookup_reply, TDATA_NUM_BYTES 7, TUSER_WIDTH 0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {TDATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 56} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TS\
TRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_arp_lookup_reply TDATA" *)
output wire [55 : 0] m_axis_arp_lookup_reply_TDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TVALID" *)
input wire s_axis_TVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TREADY" *)
output wire s_axis_TREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TDATA" *)
input wire [63 : 0] s_axis_TDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TKEEP" *)
input wire [7 : 0] s_axis_TKEEP;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis, TDATA_NUM_BYTES 8, TUSER_WIDTH 0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {TDATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 64} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format\
 bool minimum {} maximum {}} value false}}}}}, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TLAST" *)
input wire [0 : 0] s_axis_TLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_arp_lookup_request TVALID" *)
input wire s_axis_arp_lookup_request_TVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_arp_lookup_request TREADY" *)
output wire s_axis_arp_lookup_request_TREADY;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis_arp_lookup_request, TDATA_NUM_BYTES 4, TUSER_WIDTH 0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {TDATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate d\
ependency {} format bool minimum {} maximum {}} value false}}}}}, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_arp_lookup_request TDATA" *)
input wire [31 : 0] s_axis_arp_lookup_request_TDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_arp_send_grat TVALID" *)
input wire s_axis_arp_send_grat_TVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_arp_send_grat TREADY" *)
output wire s_axis_arp_send_grat_TREADY;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis_arp_send_grat, TDATA_NUM_BYTES 1, TUSER_WIDTH 0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {TDATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 8} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate depende\
ncy {} format bool minimum {} maximum {}} value false}}}}}, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_arp_send_grat TDATA" *)
input wire [7 : 0] s_axis_arp_send_grat_TDATA;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aclk, ASSOCIATED_BUSIF m_axis:m_axis_arp_lookup_reply:s_axis:s_axis_arp_lookup_request:s_axis_arp_send_grat, ASSOCIATED_RESET aresetn, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 aclk CLK" *)
input wire aclk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 aresetn RST" *)
input wire aresetn;

  arp_server_subnet_top inst (
    .myMacAddress_V(myMacAddress_V),
    .myIpAddress_V(myIpAddress_V),
    .m_axis_TVALID(m_axis_TVALID),
    .m_axis_TREADY(m_axis_TREADY),
    .m_axis_TDATA(m_axis_TDATA),
    .m_axis_TKEEP(m_axis_TKEEP),
    .m_axis_TLAST(m_axis_TLAST),
    .m_axis_arp_lookup_reply_TVALID(m_axis_arp_lookup_reply_TVALID),
    .m_axis_arp_lookup_reply_TREADY(m_axis_arp_lookup_reply_TREADY),
    .m_axis_arp_lookup_reply_TDATA(m_axis_arp_lookup_reply_TDATA),
    .s_axis_TVALID(s_axis_TVALID),
    .s_axis_TREADY(s_axis_TREADY),
    .s_axis_TDATA(s_axis_TDATA),
    .s_axis_TKEEP(s_axis_TKEEP),
    .s_axis_TLAST(s_axis_TLAST),
    .s_axis_arp_lookup_request_TVALID(s_axis_arp_lookup_request_TVALID),
    .s_axis_arp_lookup_request_TREADY(s_axis_arp_lookup_request_TREADY),
    .s_axis_arp_lookup_request_TDATA(s_axis_arp_lookup_request_TDATA),
    .s_axis_arp_send_grat_TVALID(s_axis_arp_send_grat_TVALID),
    .s_axis_arp_send_grat_TREADY(s_axis_arp_send_grat_TREADY),
    .s_axis_arp_send_grat_TDATA(s_axis_arp_send_grat_TDATA),
    .aclk(aclk),
    .aresetn(aresetn)
  );
endmodule
