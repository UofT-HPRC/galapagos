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


// IP VLNV: xilinx.com:hls:ethernet_bridge:1.0
// IP Revision: 1904211649

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "HLS" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module pr_network_bridge_inst_1 (
  mac_addr_V,
  observedAddress_out_V,
  observedAddress_out_V_ap_vld,
  mac_table_V_Clk_A,
  mac_table_V_Rst_A,
  mac_table_V_EN_A,
  mac_table_V_WEN_A,
  mac_table_V_Addr_A,
  mac_table_V_Dout_A,
  mac_table_V_Din_A,
  mac_table_V_Clk_B,
  mac_table_V_Rst_B,
  mac_table_V_EN_B,
  mac_table_V_WEN_B,
  mac_table_V_Addr_B,
  mac_table_V_Dout_B,
  mac_table_V_Din_B,
  from_app_V_TVALID,
  from_app_V_TREADY,
  from_app_V_TDATA,
  from_app_V_TLAST,
  from_app_V_TDEST,
  from_app_V_TKEEP,
  from_eth_V_TVALID,
  from_eth_V_TREADY,
  from_eth_V_TDATA,
  from_eth_V_TLAST,
  from_eth_V_TKEEP,
  to_app_V_TVALID,
  to_app_V_TREADY,
  to_app_V_TDATA,
  to_app_V_TLAST,
  to_app_V_TDEST,
  to_app_V_TKEEP,
  to_eth_V_TVALID,
  to_eth_V_TREADY,
  to_eth_V_TDATA,
  to_eth_V_TLAST,
  to_eth_V_TKEEP,
  aclk,
  aresetn
);

input wire [47 : 0] mac_addr_V;
output wire [47 : 0] observedAddress_out_V;
output wire observedAddress_out_V_ap_vld;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 mac_table_V_PORTA CLK" *)
output wire mac_table_V_Clk_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 mac_table_V_PORTA RST" *)
output wire mac_table_V_Rst_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 mac_table_V_PORTA EN" *)
output wire mac_table_V_EN_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 mac_table_V_PORTA WE" *)
output wire [7 : 0] mac_table_V_WEN_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 mac_table_V_PORTA ADDR" *)
output wire [31 : 0] mac_table_V_Addr_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 mac_table_V_PORTA DIN" *)
output wire [63 : 0] mac_table_V_Dout_A;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME mac_table_V_PORTA, MEM_WIDTH 64, MEM_SIZE 2048, MASTER_TYPE BRAM_CTRL, MEM_ECC NONE" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 mac_table_V_PORTA DOUT" *)
input wire [63 : 0] mac_table_V_Din_A;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 mac_table_V_PORTB CLK" *)
output wire mac_table_V_Clk_B;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 mac_table_V_PORTB RST" *)
output wire mac_table_V_Rst_B;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 mac_table_V_PORTB EN" *)
output wire mac_table_V_EN_B;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 mac_table_V_PORTB WE" *)
output wire [7 : 0] mac_table_V_WEN_B;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 mac_table_V_PORTB ADDR" *)
output wire [31 : 0] mac_table_V_Addr_B;
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 mac_table_V_PORTB DIN" *)
output wire [63 : 0] mac_table_V_Dout_B;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME mac_table_V_PORTB, MEM_WIDTH 64, MEM_SIZE 2048, MASTER_TYPE BRAM_CTRL, MEM_ECC NONE" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 mac_table_V_PORTB DOUT" *)
input wire [63 : 0] mac_table_V_Din_B;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 from_app_V TVALID" *)
input wire from_app_V_TVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 from_app_V TREADY" *)
output wire from_app_V_TREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 from_app_V TDATA" *)
input wire [63 : 0] from_app_V_TDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 from_app_V TLAST" *)
input wire [0 : 0] from_app_V_TLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 from_app_V TDEST" *)
input wire [7 : 0] from_app_V_TDEST;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME from_app_V, TDATA_NUM_BYTES 8, TDEST_WIDTH 8, TUSER_WIDTH 0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {TDATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 64} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate d\
ependency {} format bool minimum {} maximum {}} value false}}}} TDATA_WIDTH 64}, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 156250000, PHASE 0.000, CLK_DOMAIN pr_CLK" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 from_app_V TKEEP" *)
input wire [7 : 0] from_app_V_TKEEP;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 from_eth_V TVALID" *)
input wire from_eth_V_TVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 from_eth_V TREADY" *)
output wire from_eth_V_TREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 from_eth_V TDATA" *)
input wire [63 : 0] from_eth_V_TDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 from_eth_V TLAST" *)
input wire [0 : 0] from_eth_V_TLAST;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME from_eth_V, TDATA_NUM_BYTES 8, TUSER_WIDTH 0, LAYERED_METADATA undef, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 156250000, PHASE 0.000, CLK_DOMAIN pr_CLK" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 from_eth_V TKEEP" *)
input wire [7 : 0] from_eth_V_TKEEP;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 to_app_V TVALID" *)
output wire to_app_V_TVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 to_app_V TREADY" *)
input wire to_app_V_TREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 to_app_V TDATA" *)
output wire [63 : 0] to_app_V_TDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 to_app_V TLAST" *)
output wire [0 : 0] to_app_V_TLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 to_app_V TDEST" *)
output wire [7 : 0] to_app_V_TDEST;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME to_app_V, TDATA_NUM_BYTES 8, TDEST_WIDTH 8, TUSER_WIDTH 0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {TDATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 64} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dep\
endency {} format bool minimum {} maximum {}} value true}}}} TDATA_WIDTH 64}, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 156250000, PHASE 0.000, CLK_DOMAIN pr_CLK" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 to_app_V TKEEP" *)
output wire [7 : 0] to_app_V_TKEEP;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 to_eth_V TVALID" *)
output wire to_eth_V_TVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 to_eth_V TREADY" *)
input wire to_eth_V_TREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 to_eth_V TDATA" *)
output wire [63 : 0] to_eth_V_TDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 to_eth_V TLAST" *)
output wire [0 : 0] to_eth_V_TLAST;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME to_eth_V, TDATA_NUM_BYTES 8, TUSER_WIDTH 0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {TDATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 64} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} form\
at bool minimum {} maximum {}} value true}}}} TDATA_WIDTH 64}, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 156250000, PHASE 0.000, CLK_DOMAIN pr_CLK" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 to_eth_V TKEEP" *)
output wire [7 : 0] to_eth_V_TKEEP;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aclk, ASSOCIATED_BUSIF from_app_V:from_eth_V:to_app_V:to_eth_V, ASSOCIATED_RESET aresetn, FREQ_HZ 156250000, PHASE 0.000, CLK_DOMAIN pr_CLK" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 aclk CLK" *)
input wire aclk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aresetn, POLARITY ACTIVE_LOW" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 aresetn RST" *)
input wire aresetn;

  ethernet_bridge_top inst (
    .mac_addr_V(mac_addr_V),
    .observedAddress_out_V(observedAddress_out_V),
    .observedAddress_out_V_ap_vld(observedAddress_out_V_ap_vld),
    .mac_table_V_Clk_A(mac_table_V_Clk_A),
    .mac_table_V_Rst_A(mac_table_V_Rst_A),
    .mac_table_V_EN_A(mac_table_V_EN_A),
    .mac_table_V_WEN_A(mac_table_V_WEN_A),
    .mac_table_V_Addr_A(mac_table_V_Addr_A),
    .mac_table_V_Dout_A(mac_table_V_Dout_A),
    .mac_table_V_Din_A(mac_table_V_Din_A),
    .mac_table_V_Clk_B(mac_table_V_Clk_B),
    .mac_table_V_Rst_B(mac_table_V_Rst_B),
    .mac_table_V_EN_B(mac_table_V_EN_B),
    .mac_table_V_WEN_B(mac_table_V_WEN_B),
    .mac_table_V_Addr_B(mac_table_V_Addr_B),
    .mac_table_V_Dout_B(mac_table_V_Dout_B),
    .mac_table_V_Din_B(mac_table_V_Din_B),
    .from_app_V_TVALID(from_app_V_TVALID),
    .from_app_V_TREADY(from_app_V_TREADY),
    .from_app_V_TDATA(from_app_V_TDATA),
    .from_app_V_TLAST(from_app_V_TLAST),
    .from_app_V_TDEST(from_app_V_TDEST),
    .from_app_V_TKEEP(from_app_V_TKEEP),
    .from_eth_V_TVALID(from_eth_V_TVALID),
    .from_eth_V_TREADY(from_eth_V_TREADY),
    .from_eth_V_TDATA(from_eth_V_TDATA),
    .from_eth_V_TLAST(from_eth_V_TLAST),
    .from_eth_V_TKEEP(from_eth_V_TKEEP),
    .to_app_V_TVALID(to_app_V_TVALID),
    .to_app_V_TREADY(to_app_V_TREADY),
    .to_app_V_TDATA(to_app_V_TDATA),
    .to_app_V_TLAST(to_app_V_TLAST),
    .to_app_V_TDEST(to_app_V_TDEST),
    .to_app_V_TKEEP(to_app_V_TKEEP),
    .to_eth_V_TVALID(to_eth_V_TVALID),
    .to_eth_V_TREADY(to_eth_V_TREADY),
    .to_eth_V_TDATA(to_eth_V_TDATA),
    .to_eth_V_TLAST(to_eth_V_TLAST),
    .to_eth_V_TKEEP(to_eth_V_TKEEP),
    .aclk(aclk),
    .aresetn(aresetn)
  );
endmodule
