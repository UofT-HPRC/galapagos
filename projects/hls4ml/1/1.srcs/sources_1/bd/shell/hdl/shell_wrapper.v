//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
//Date        : Mon Apr 22 16:42:00 2019
//Host        : batcomputer.arkham running 64-bit Ubuntu 16.04.2 LTS
//Command     : generate_target shell_wrapper.bd
//Design      : shell_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module shell_wrapper
   (ARESETN,
    CLK_DATA,
    M_AXIS_tdata,
    M_AXIS_tkeep,
    M_AXIS_tlast,
    M_AXIS_tready,
    M_AXIS_tvalid,
    M_AXI_CONTROL_araddr,
    M_AXI_CONTROL_arprot,
    M_AXI_CONTROL_arready,
    M_AXI_CONTROL_arvalid,
    M_AXI_CONTROL_awaddr,
    M_AXI_CONTROL_awprot,
    M_AXI_CONTROL_awready,
    M_AXI_CONTROL_awvalid,
    M_AXI_CONTROL_bready,
    M_AXI_CONTROL_bresp,
    M_AXI_CONTROL_bvalid,
    M_AXI_CONTROL_rdata,
    M_AXI_CONTROL_rready,
    M_AXI_CONTROL_rresp,
    M_AXI_CONTROL_rvalid,
    M_AXI_CONTROL_wdata,
    M_AXI_CONTROL_wready,
    M_AXI_CONTROL_wstrb,
    M_AXI_CONTROL_wvalid,
    S_AXIS_tdata,
    S_AXIS_tkeep,
    S_AXIS_tlast,
    S_AXIS_tready,
    S_AXIS_tvalid,
    S_AXI_MEM_0_araddr,
    S_AXI_MEM_0_arburst,
    S_AXI_MEM_0_arcache,
    S_AXI_MEM_0_arid,
    S_AXI_MEM_0_arlen,
    S_AXI_MEM_0_arlock,
    S_AXI_MEM_0_arprot,
    S_AXI_MEM_0_arqos,
    S_AXI_MEM_0_arready,
    S_AXI_MEM_0_arregion,
    S_AXI_MEM_0_arsize,
    S_AXI_MEM_0_arvalid,
    S_AXI_MEM_0_awaddr,
    S_AXI_MEM_0_awburst,
    S_AXI_MEM_0_awcache,
    S_AXI_MEM_0_awid,
    S_AXI_MEM_0_awlen,
    S_AXI_MEM_0_awlock,
    S_AXI_MEM_0_awprot,
    S_AXI_MEM_0_awqos,
    S_AXI_MEM_0_awready,
    S_AXI_MEM_0_awregion,
    S_AXI_MEM_0_awsize,
    S_AXI_MEM_0_awvalid,
    S_AXI_MEM_0_bid,
    S_AXI_MEM_0_bready,
    S_AXI_MEM_0_bresp,
    S_AXI_MEM_0_bvalid,
    S_AXI_MEM_0_rdata,
    S_AXI_MEM_0_rid,
    S_AXI_MEM_0_rlast,
    S_AXI_MEM_0_rready,
    S_AXI_MEM_0_rresp,
    S_AXI_MEM_0_rvalid,
    S_AXI_MEM_0_wdata,
    S_AXI_MEM_0_wlast,
    S_AXI_MEM_0_wready,
    S_AXI_MEM_0_wstrb,
    S_AXI_MEM_0_wvalid,
    S_AXI_MEM_1_araddr,
    S_AXI_MEM_1_arburst,
    S_AXI_MEM_1_arcache,
    S_AXI_MEM_1_arid,
    S_AXI_MEM_1_arlen,
    S_AXI_MEM_1_arlock,
    S_AXI_MEM_1_arprot,
    S_AXI_MEM_1_arqos,
    S_AXI_MEM_1_arready,
    S_AXI_MEM_1_arregion,
    S_AXI_MEM_1_arsize,
    S_AXI_MEM_1_arvalid,
    S_AXI_MEM_1_awaddr,
    S_AXI_MEM_1_awburst,
    S_AXI_MEM_1_awcache,
    S_AXI_MEM_1_awid,
    S_AXI_MEM_1_awlen,
    S_AXI_MEM_1_awlock,
    S_AXI_MEM_1_awprot,
    S_AXI_MEM_1_awqos,
    S_AXI_MEM_1_awready,
    S_AXI_MEM_1_awregion,
    S_AXI_MEM_1_awsize,
    S_AXI_MEM_1_awvalid,
    S_AXI_MEM_1_bid,
    S_AXI_MEM_1_bready,
    S_AXI_MEM_1_bresp,
    S_AXI_MEM_1_bvalid,
    S_AXI_MEM_1_rdata,
    S_AXI_MEM_1_rid,
    S_AXI_MEM_1_rlast,
    S_AXI_MEM_1_rready,
    S_AXI_MEM_1_rresp,
    S_AXI_MEM_1_rvalid,
    S_AXI_MEM_1_wdata,
    S_AXI_MEM_1_wlast,
    S_AXI_MEM_1_wready,
    S_AXI_MEM_1_wstrb,
    S_AXI_MEM_1_wvalid,
    c0_ddr4_act_n,
    c0_ddr4_adr,
    c0_ddr4_ba,
    c0_ddr4_bg,
    c0_ddr4_ck_c,
    c0_ddr4_ck_t,
    c0_ddr4_cke,
    c0_ddr4_cs_n,
    c0_ddr4_dm_n,
    c0_ddr4_dq,
    c0_ddr4_dqs_c,
    c0_ddr4_dqs_t,
    c0_ddr4_odt,
    c0_ddr4_reset_n,
    c0_sys_clk_clk_n,
    c0_sys_clk_clk_p,
    c1_ddr4_act_n,
    c1_ddr4_adr,
    c1_ddr4_ba,
    c1_ddr4_bg,
    c1_ddr4_ck_c,
    c1_ddr4_ck_t,
    c1_ddr4_cke,
    c1_ddr4_cs_n,
    c1_ddr4_dm_n,
    c1_ddr4_dq,
    c1_ddr4_dqs_c,
    c1_ddr4_dqs_t,
    c1_ddr4_odt,
    c1_ddr4_reset_n,
    c1_sys_clk_clk_n,
    c1_sys_clk_clk_p,
    diff_clock_rtl_clk_n,
    diff_clock_rtl_clk_p,
    pcie_7x_mgt_rtl_rxn,
    pcie_7x_mgt_rtl_rxp,
    pcie_7x_mgt_rtl_txn,
    pcie_7x_mgt_rtl_txp,
    perst_n,
    refclk200,
    refclk_n,
    refclk_p,
    rxn,
    rxp,
    sfp_tx_disable,
    txn,
    txp);
  output [0:0]ARESETN;
  output CLK_DATA;
  output [63:0]M_AXIS_tdata;
  output [7:0]M_AXIS_tkeep;
  output M_AXIS_tlast;
  input M_AXIS_tready;
  output M_AXIS_tvalid;
  output [31:0]M_AXI_CONTROL_araddr;
  output [2:0]M_AXI_CONTROL_arprot;
  input M_AXI_CONTROL_arready;
  output M_AXI_CONTROL_arvalid;
  output [31:0]M_AXI_CONTROL_awaddr;
  output [2:0]M_AXI_CONTROL_awprot;
  input M_AXI_CONTROL_awready;
  output M_AXI_CONTROL_awvalid;
  output M_AXI_CONTROL_bready;
  input [1:0]M_AXI_CONTROL_bresp;
  input M_AXI_CONTROL_bvalid;
  input [31:0]M_AXI_CONTROL_rdata;
  output M_AXI_CONTROL_rready;
  input [1:0]M_AXI_CONTROL_rresp;
  input M_AXI_CONTROL_rvalid;
  output [31:0]M_AXI_CONTROL_wdata;
  input M_AXI_CONTROL_wready;
  output [3:0]M_AXI_CONTROL_wstrb;
  output M_AXI_CONTROL_wvalid;
  input [63:0]S_AXIS_tdata;
  input [7:0]S_AXIS_tkeep;
  input S_AXIS_tlast;
  output S_AXIS_tready;
  input S_AXIS_tvalid;
  input [31:0]S_AXI_MEM_0_araddr;
  input [1:0]S_AXI_MEM_0_arburst;
  input [3:0]S_AXI_MEM_0_arcache;
  input [0:0]S_AXI_MEM_0_arid;
  input [7:0]S_AXI_MEM_0_arlen;
  input [0:0]S_AXI_MEM_0_arlock;
  input [2:0]S_AXI_MEM_0_arprot;
  input [3:0]S_AXI_MEM_0_arqos;
  output S_AXI_MEM_0_arready;
  input [3:0]S_AXI_MEM_0_arregion;
  input [2:0]S_AXI_MEM_0_arsize;
  input S_AXI_MEM_0_arvalid;
  input [31:0]S_AXI_MEM_0_awaddr;
  input [1:0]S_AXI_MEM_0_awburst;
  input [3:0]S_AXI_MEM_0_awcache;
  input [0:0]S_AXI_MEM_0_awid;
  input [7:0]S_AXI_MEM_0_awlen;
  input [0:0]S_AXI_MEM_0_awlock;
  input [2:0]S_AXI_MEM_0_awprot;
  input [3:0]S_AXI_MEM_0_awqos;
  output S_AXI_MEM_0_awready;
  input [3:0]S_AXI_MEM_0_awregion;
  input [2:0]S_AXI_MEM_0_awsize;
  input S_AXI_MEM_0_awvalid;
  output [0:0]S_AXI_MEM_0_bid;
  input S_AXI_MEM_0_bready;
  output [1:0]S_AXI_MEM_0_bresp;
  output S_AXI_MEM_0_bvalid;
  output [511:0]S_AXI_MEM_0_rdata;
  output [0:0]S_AXI_MEM_0_rid;
  output S_AXI_MEM_0_rlast;
  input S_AXI_MEM_0_rready;
  output [1:0]S_AXI_MEM_0_rresp;
  output S_AXI_MEM_0_rvalid;
  input [511:0]S_AXI_MEM_0_wdata;
  input S_AXI_MEM_0_wlast;
  output S_AXI_MEM_0_wready;
  input [63:0]S_AXI_MEM_0_wstrb;
  input S_AXI_MEM_0_wvalid;
  input [31:0]S_AXI_MEM_1_araddr;
  input [1:0]S_AXI_MEM_1_arburst;
  input [3:0]S_AXI_MEM_1_arcache;
  input [0:0]S_AXI_MEM_1_arid;
  input [7:0]S_AXI_MEM_1_arlen;
  input [0:0]S_AXI_MEM_1_arlock;
  input [2:0]S_AXI_MEM_1_arprot;
  input [3:0]S_AXI_MEM_1_arqos;
  output S_AXI_MEM_1_arready;
  input [3:0]S_AXI_MEM_1_arregion;
  input [2:0]S_AXI_MEM_1_arsize;
  input S_AXI_MEM_1_arvalid;
  input [31:0]S_AXI_MEM_1_awaddr;
  input [1:0]S_AXI_MEM_1_awburst;
  input [3:0]S_AXI_MEM_1_awcache;
  input [0:0]S_AXI_MEM_1_awid;
  input [7:0]S_AXI_MEM_1_awlen;
  input [0:0]S_AXI_MEM_1_awlock;
  input [2:0]S_AXI_MEM_1_awprot;
  input [3:0]S_AXI_MEM_1_awqos;
  output S_AXI_MEM_1_awready;
  input [3:0]S_AXI_MEM_1_awregion;
  input [2:0]S_AXI_MEM_1_awsize;
  input S_AXI_MEM_1_awvalid;
  output [0:0]S_AXI_MEM_1_bid;
  input S_AXI_MEM_1_bready;
  output [1:0]S_AXI_MEM_1_bresp;
  output S_AXI_MEM_1_bvalid;
  output [511:0]S_AXI_MEM_1_rdata;
  output [0:0]S_AXI_MEM_1_rid;
  output S_AXI_MEM_1_rlast;
  input S_AXI_MEM_1_rready;
  output [1:0]S_AXI_MEM_1_rresp;
  output S_AXI_MEM_1_rvalid;
  input [511:0]S_AXI_MEM_1_wdata;
  input S_AXI_MEM_1_wlast;
  output S_AXI_MEM_1_wready;
  input [63:0]S_AXI_MEM_1_wstrb;
  input S_AXI_MEM_1_wvalid;
  output c0_ddr4_act_n;
  output [16:0]c0_ddr4_adr;
  output [1:0]c0_ddr4_ba;
  output [1:0]c0_ddr4_bg;
  output [0:0]c0_ddr4_ck_c;
  output [0:0]c0_ddr4_ck_t;
  output [0:0]c0_ddr4_cke;
  output [0:0]c0_ddr4_cs_n;
  inout [7:0]c0_ddr4_dm_n;
  inout [63:0]c0_ddr4_dq;
  inout [7:0]c0_ddr4_dqs_c;
  inout [7:0]c0_ddr4_dqs_t;
  output [0:0]c0_ddr4_odt;
  output c0_ddr4_reset_n;
  input c0_sys_clk_clk_n;
  input c0_sys_clk_clk_p;
  output c1_ddr4_act_n;
  output [16:0]c1_ddr4_adr;
  output [1:0]c1_ddr4_ba;
  output [1:0]c1_ddr4_bg;
  output [0:0]c1_ddr4_ck_c;
  output [0:0]c1_ddr4_ck_t;
  output [0:0]c1_ddr4_cke;
  output [0:0]c1_ddr4_cs_n;
  inout [7:0]c1_ddr4_dm_n;
  inout [63:0]c1_ddr4_dq;
  inout [7:0]c1_ddr4_dqs_c;
  inout [7:0]c1_ddr4_dqs_t;
  output [0:0]c1_ddr4_odt;
  output c1_ddr4_reset_n;
  input c1_sys_clk_clk_n;
  input c1_sys_clk_clk_p;
  input [0:0]diff_clock_rtl_clk_n;
  input [0:0]diff_clock_rtl_clk_p;
  input [7:0]pcie_7x_mgt_rtl_rxn;
  input [7:0]pcie_7x_mgt_rtl_rxp;
  output [7:0]pcie_7x_mgt_rtl_txn;
  output [7:0]pcie_7x_mgt_rtl_txp;
  input perst_n;
  input refclk200;
  input refclk_n;
  input refclk_p;
  input rxn;
  input rxp;
  output [1:0]sfp_tx_disable;
  output txn;
  output txp;

  wire [0:0]ARESETN;
  wire CLK_DATA;
  wire [63:0]M_AXIS_tdata;
  wire [7:0]M_AXIS_tkeep;
  wire M_AXIS_tlast;
  wire M_AXIS_tready;
  wire M_AXIS_tvalid;
  wire [31:0]M_AXI_CONTROL_araddr;
  wire [2:0]M_AXI_CONTROL_arprot;
  wire M_AXI_CONTROL_arready;
  wire M_AXI_CONTROL_arvalid;
  wire [31:0]M_AXI_CONTROL_awaddr;
  wire [2:0]M_AXI_CONTROL_awprot;
  wire M_AXI_CONTROL_awready;
  wire M_AXI_CONTROL_awvalid;
  wire M_AXI_CONTROL_bready;
  wire [1:0]M_AXI_CONTROL_bresp;
  wire M_AXI_CONTROL_bvalid;
  wire [31:0]M_AXI_CONTROL_rdata;
  wire M_AXI_CONTROL_rready;
  wire [1:0]M_AXI_CONTROL_rresp;
  wire M_AXI_CONTROL_rvalid;
  wire [31:0]M_AXI_CONTROL_wdata;
  wire M_AXI_CONTROL_wready;
  wire [3:0]M_AXI_CONTROL_wstrb;
  wire M_AXI_CONTROL_wvalid;
  wire [63:0]S_AXIS_tdata;
  wire [7:0]S_AXIS_tkeep;
  wire S_AXIS_tlast;
  wire S_AXIS_tready;
  wire S_AXIS_tvalid;
  wire [31:0]S_AXI_MEM_0_araddr;
  wire [1:0]S_AXI_MEM_0_arburst;
  wire [3:0]S_AXI_MEM_0_arcache;
  wire [0:0]S_AXI_MEM_0_arid;
  wire [7:0]S_AXI_MEM_0_arlen;
  wire [0:0]S_AXI_MEM_0_arlock;
  wire [2:0]S_AXI_MEM_0_arprot;
  wire [3:0]S_AXI_MEM_0_arqos;
  wire S_AXI_MEM_0_arready;
  wire [3:0]S_AXI_MEM_0_arregion;
  wire [2:0]S_AXI_MEM_0_arsize;
  wire S_AXI_MEM_0_arvalid;
  wire [31:0]S_AXI_MEM_0_awaddr;
  wire [1:0]S_AXI_MEM_0_awburst;
  wire [3:0]S_AXI_MEM_0_awcache;
  wire [0:0]S_AXI_MEM_0_awid;
  wire [7:0]S_AXI_MEM_0_awlen;
  wire [0:0]S_AXI_MEM_0_awlock;
  wire [2:0]S_AXI_MEM_0_awprot;
  wire [3:0]S_AXI_MEM_0_awqos;
  wire S_AXI_MEM_0_awready;
  wire [3:0]S_AXI_MEM_0_awregion;
  wire [2:0]S_AXI_MEM_0_awsize;
  wire S_AXI_MEM_0_awvalid;
  wire [0:0]S_AXI_MEM_0_bid;
  wire S_AXI_MEM_0_bready;
  wire [1:0]S_AXI_MEM_0_bresp;
  wire S_AXI_MEM_0_bvalid;
  wire [511:0]S_AXI_MEM_0_rdata;
  wire [0:0]S_AXI_MEM_0_rid;
  wire S_AXI_MEM_0_rlast;
  wire S_AXI_MEM_0_rready;
  wire [1:0]S_AXI_MEM_0_rresp;
  wire S_AXI_MEM_0_rvalid;
  wire [511:0]S_AXI_MEM_0_wdata;
  wire S_AXI_MEM_0_wlast;
  wire S_AXI_MEM_0_wready;
  wire [63:0]S_AXI_MEM_0_wstrb;
  wire S_AXI_MEM_0_wvalid;
  wire [31:0]S_AXI_MEM_1_araddr;
  wire [1:0]S_AXI_MEM_1_arburst;
  wire [3:0]S_AXI_MEM_1_arcache;
  wire [0:0]S_AXI_MEM_1_arid;
  wire [7:0]S_AXI_MEM_1_arlen;
  wire [0:0]S_AXI_MEM_1_arlock;
  wire [2:0]S_AXI_MEM_1_arprot;
  wire [3:0]S_AXI_MEM_1_arqos;
  wire S_AXI_MEM_1_arready;
  wire [3:0]S_AXI_MEM_1_arregion;
  wire [2:0]S_AXI_MEM_1_arsize;
  wire S_AXI_MEM_1_arvalid;
  wire [31:0]S_AXI_MEM_1_awaddr;
  wire [1:0]S_AXI_MEM_1_awburst;
  wire [3:0]S_AXI_MEM_1_awcache;
  wire [0:0]S_AXI_MEM_1_awid;
  wire [7:0]S_AXI_MEM_1_awlen;
  wire [0:0]S_AXI_MEM_1_awlock;
  wire [2:0]S_AXI_MEM_1_awprot;
  wire [3:0]S_AXI_MEM_1_awqos;
  wire S_AXI_MEM_1_awready;
  wire [3:0]S_AXI_MEM_1_awregion;
  wire [2:0]S_AXI_MEM_1_awsize;
  wire S_AXI_MEM_1_awvalid;
  wire [0:0]S_AXI_MEM_1_bid;
  wire S_AXI_MEM_1_bready;
  wire [1:0]S_AXI_MEM_1_bresp;
  wire S_AXI_MEM_1_bvalid;
  wire [511:0]S_AXI_MEM_1_rdata;
  wire [0:0]S_AXI_MEM_1_rid;
  wire S_AXI_MEM_1_rlast;
  wire S_AXI_MEM_1_rready;
  wire [1:0]S_AXI_MEM_1_rresp;
  wire S_AXI_MEM_1_rvalid;
  wire [511:0]S_AXI_MEM_1_wdata;
  wire S_AXI_MEM_1_wlast;
  wire S_AXI_MEM_1_wready;
  wire [63:0]S_AXI_MEM_1_wstrb;
  wire S_AXI_MEM_1_wvalid;
  wire c0_ddr4_act_n;
  wire [16:0]c0_ddr4_adr;
  wire [1:0]c0_ddr4_ba;
  wire [1:0]c0_ddr4_bg;
  wire [0:0]c0_ddr4_ck_c;
  wire [0:0]c0_ddr4_ck_t;
  wire [0:0]c0_ddr4_cke;
  wire [0:0]c0_ddr4_cs_n;
  wire [7:0]c0_ddr4_dm_n;
  wire [63:0]c0_ddr4_dq;
  wire [7:0]c0_ddr4_dqs_c;
  wire [7:0]c0_ddr4_dqs_t;
  wire [0:0]c0_ddr4_odt;
  wire c0_ddr4_reset_n;
  wire c0_sys_clk_clk_n;
  wire c0_sys_clk_clk_p;
  wire c1_ddr4_act_n;
  wire [16:0]c1_ddr4_adr;
  wire [1:0]c1_ddr4_ba;
  wire [1:0]c1_ddr4_bg;
  wire [0:0]c1_ddr4_ck_c;
  wire [0:0]c1_ddr4_ck_t;
  wire [0:0]c1_ddr4_cke;
  wire [0:0]c1_ddr4_cs_n;
  wire [7:0]c1_ddr4_dm_n;
  wire [63:0]c1_ddr4_dq;
  wire [7:0]c1_ddr4_dqs_c;
  wire [7:0]c1_ddr4_dqs_t;
  wire [0:0]c1_ddr4_odt;
  wire c1_ddr4_reset_n;
  wire c1_sys_clk_clk_n;
  wire c1_sys_clk_clk_p;
  wire [0:0]diff_clock_rtl_clk_n;
  wire [0:0]diff_clock_rtl_clk_p;
  wire [7:0]pcie_7x_mgt_rtl_rxn;
  wire [7:0]pcie_7x_mgt_rtl_rxp;
  wire [7:0]pcie_7x_mgt_rtl_txn;
  wire [7:0]pcie_7x_mgt_rtl_txp;
  wire perst_n;
  wire refclk200;
  wire refclk_n;
  wire refclk_p;
  wire rxn;
  wire rxp;
  wire [1:0]sfp_tx_disable;
  wire txn;
  wire txp;

  shell shell_i
       (.ARESETN(ARESETN),
        .CLK_DATA(CLK_DATA),
        .M_AXIS_tdata(M_AXIS_tdata),
        .M_AXIS_tkeep(M_AXIS_tkeep),
        .M_AXIS_tlast(M_AXIS_tlast),
        .M_AXIS_tready(M_AXIS_tready),
        .M_AXIS_tvalid(M_AXIS_tvalid),
        .M_AXI_CONTROL_araddr(M_AXI_CONTROL_araddr),
        .M_AXI_CONTROL_arprot(M_AXI_CONTROL_arprot),
        .M_AXI_CONTROL_arready(M_AXI_CONTROL_arready),
        .M_AXI_CONTROL_arvalid(M_AXI_CONTROL_arvalid),
        .M_AXI_CONTROL_awaddr(M_AXI_CONTROL_awaddr),
        .M_AXI_CONTROL_awprot(M_AXI_CONTROL_awprot),
        .M_AXI_CONTROL_awready(M_AXI_CONTROL_awready),
        .M_AXI_CONTROL_awvalid(M_AXI_CONTROL_awvalid),
        .M_AXI_CONTROL_bready(M_AXI_CONTROL_bready),
        .M_AXI_CONTROL_bresp(M_AXI_CONTROL_bresp),
        .M_AXI_CONTROL_bvalid(M_AXI_CONTROL_bvalid),
        .M_AXI_CONTROL_rdata(M_AXI_CONTROL_rdata),
        .M_AXI_CONTROL_rready(M_AXI_CONTROL_rready),
        .M_AXI_CONTROL_rresp(M_AXI_CONTROL_rresp),
        .M_AXI_CONTROL_rvalid(M_AXI_CONTROL_rvalid),
        .M_AXI_CONTROL_wdata(M_AXI_CONTROL_wdata),
        .M_AXI_CONTROL_wready(M_AXI_CONTROL_wready),
        .M_AXI_CONTROL_wstrb(M_AXI_CONTROL_wstrb),
        .M_AXI_CONTROL_wvalid(M_AXI_CONTROL_wvalid),
        .S_AXIS_tdata(S_AXIS_tdata),
        .S_AXIS_tkeep(S_AXIS_tkeep),
        .S_AXIS_tlast(S_AXIS_tlast),
        .S_AXIS_tready(S_AXIS_tready),
        .S_AXIS_tvalid(S_AXIS_tvalid),
        .S_AXI_MEM_0_araddr(S_AXI_MEM_0_araddr),
        .S_AXI_MEM_0_arburst(S_AXI_MEM_0_arburst),
        .S_AXI_MEM_0_arcache(S_AXI_MEM_0_arcache),
        .S_AXI_MEM_0_arid(S_AXI_MEM_0_arid),
        .S_AXI_MEM_0_arlen(S_AXI_MEM_0_arlen),
        .S_AXI_MEM_0_arlock(S_AXI_MEM_0_arlock),
        .S_AXI_MEM_0_arprot(S_AXI_MEM_0_arprot),
        .S_AXI_MEM_0_arqos(S_AXI_MEM_0_arqos),
        .S_AXI_MEM_0_arready(S_AXI_MEM_0_arready),
        .S_AXI_MEM_0_arregion(S_AXI_MEM_0_arregion),
        .S_AXI_MEM_0_arsize(S_AXI_MEM_0_arsize),
        .S_AXI_MEM_0_arvalid(S_AXI_MEM_0_arvalid),
        .S_AXI_MEM_0_awaddr(S_AXI_MEM_0_awaddr),
        .S_AXI_MEM_0_awburst(S_AXI_MEM_0_awburst),
        .S_AXI_MEM_0_awcache(S_AXI_MEM_0_awcache),
        .S_AXI_MEM_0_awid(S_AXI_MEM_0_awid),
        .S_AXI_MEM_0_awlen(S_AXI_MEM_0_awlen),
        .S_AXI_MEM_0_awlock(S_AXI_MEM_0_awlock),
        .S_AXI_MEM_0_awprot(S_AXI_MEM_0_awprot),
        .S_AXI_MEM_0_awqos(S_AXI_MEM_0_awqos),
        .S_AXI_MEM_0_awready(S_AXI_MEM_0_awready),
        .S_AXI_MEM_0_awregion(S_AXI_MEM_0_awregion),
        .S_AXI_MEM_0_awsize(S_AXI_MEM_0_awsize),
        .S_AXI_MEM_0_awvalid(S_AXI_MEM_0_awvalid),
        .S_AXI_MEM_0_bid(S_AXI_MEM_0_bid),
        .S_AXI_MEM_0_bready(S_AXI_MEM_0_bready),
        .S_AXI_MEM_0_bresp(S_AXI_MEM_0_bresp),
        .S_AXI_MEM_0_bvalid(S_AXI_MEM_0_bvalid),
        .S_AXI_MEM_0_rdata(S_AXI_MEM_0_rdata),
        .S_AXI_MEM_0_rid(S_AXI_MEM_0_rid),
        .S_AXI_MEM_0_rlast(S_AXI_MEM_0_rlast),
        .S_AXI_MEM_0_rready(S_AXI_MEM_0_rready),
        .S_AXI_MEM_0_rresp(S_AXI_MEM_0_rresp),
        .S_AXI_MEM_0_rvalid(S_AXI_MEM_0_rvalid),
        .S_AXI_MEM_0_wdata(S_AXI_MEM_0_wdata),
        .S_AXI_MEM_0_wlast(S_AXI_MEM_0_wlast),
        .S_AXI_MEM_0_wready(S_AXI_MEM_0_wready),
        .S_AXI_MEM_0_wstrb(S_AXI_MEM_0_wstrb),
        .S_AXI_MEM_0_wvalid(S_AXI_MEM_0_wvalid),
        .S_AXI_MEM_1_araddr(S_AXI_MEM_1_araddr),
        .S_AXI_MEM_1_arburst(S_AXI_MEM_1_arburst),
        .S_AXI_MEM_1_arcache(S_AXI_MEM_1_arcache),
        .S_AXI_MEM_1_arid(S_AXI_MEM_1_arid),
        .S_AXI_MEM_1_arlen(S_AXI_MEM_1_arlen),
        .S_AXI_MEM_1_arlock(S_AXI_MEM_1_arlock),
        .S_AXI_MEM_1_arprot(S_AXI_MEM_1_arprot),
        .S_AXI_MEM_1_arqos(S_AXI_MEM_1_arqos),
        .S_AXI_MEM_1_arready(S_AXI_MEM_1_arready),
        .S_AXI_MEM_1_arregion(S_AXI_MEM_1_arregion),
        .S_AXI_MEM_1_arsize(S_AXI_MEM_1_arsize),
        .S_AXI_MEM_1_arvalid(S_AXI_MEM_1_arvalid),
        .S_AXI_MEM_1_awaddr(S_AXI_MEM_1_awaddr),
        .S_AXI_MEM_1_awburst(S_AXI_MEM_1_awburst),
        .S_AXI_MEM_1_awcache(S_AXI_MEM_1_awcache),
        .S_AXI_MEM_1_awid(S_AXI_MEM_1_awid),
        .S_AXI_MEM_1_awlen(S_AXI_MEM_1_awlen),
        .S_AXI_MEM_1_awlock(S_AXI_MEM_1_awlock),
        .S_AXI_MEM_1_awprot(S_AXI_MEM_1_awprot),
        .S_AXI_MEM_1_awqos(S_AXI_MEM_1_awqos),
        .S_AXI_MEM_1_awready(S_AXI_MEM_1_awready),
        .S_AXI_MEM_1_awregion(S_AXI_MEM_1_awregion),
        .S_AXI_MEM_1_awsize(S_AXI_MEM_1_awsize),
        .S_AXI_MEM_1_awvalid(S_AXI_MEM_1_awvalid),
        .S_AXI_MEM_1_bid(S_AXI_MEM_1_bid),
        .S_AXI_MEM_1_bready(S_AXI_MEM_1_bready),
        .S_AXI_MEM_1_bresp(S_AXI_MEM_1_bresp),
        .S_AXI_MEM_1_bvalid(S_AXI_MEM_1_bvalid),
        .S_AXI_MEM_1_rdata(S_AXI_MEM_1_rdata),
        .S_AXI_MEM_1_rid(S_AXI_MEM_1_rid),
        .S_AXI_MEM_1_rlast(S_AXI_MEM_1_rlast),
        .S_AXI_MEM_1_rready(S_AXI_MEM_1_rready),
        .S_AXI_MEM_1_rresp(S_AXI_MEM_1_rresp),
        .S_AXI_MEM_1_rvalid(S_AXI_MEM_1_rvalid),
        .S_AXI_MEM_1_wdata(S_AXI_MEM_1_wdata),
        .S_AXI_MEM_1_wlast(S_AXI_MEM_1_wlast),
        .S_AXI_MEM_1_wready(S_AXI_MEM_1_wready),
        .S_AXI_MEM_1_wstrb(S_AXI_MEM_1_wstrb),
        .S_AXI_MEM_1_wvalid(S_AXI_MEM_1_wvalid),
        .c0_ddr4_act_n(c0_ddr4_act_n),
        .c0_ddr4_adr(c0_ddr4_adr),
        .c0_ddr4_ba(c0_ddr4_ba),
        .c0_ddr4_bg(c0_ddr4_bg),
        .c0_ddr4_ck_c(c0_ddr4_ck_c),
        .c0_ddr4_ck_t(c0_ddr4_ck_t),
        .c0_ddr4_cke(c0_ddr4_cke),
        .c0_ddr4_cs_n(c0_ddr4_cs_n),
        .c0_ddr4_dm_n(c0_ddr4_dm_n),
        .c0_ddr4_dq(c0_ddr4_dq),
        .c0_ddr4_dqs_c(c0_ddr4_dqs_c),
        .c0_ddr4_dqs_t(c0_ddr4_dqs_t),
        .c0_ddr4_odt(c0_ddr4_odt),
        .c0_ddr4_reset_n(c0_ddr4_reset_n),
        .c0_sys_clk_clk_n(c0_sys_clk_clk_n),
        .c0_sys_clk_clk_p(c0_sys_clk_clk_p),
        .c1_ddr4_act_n(c1_ddr4_act_n),
        .c1_ddr4_adr(c1_ddr4_adr),
        .c1_ddr4_ba(c1_ddr4_ba),
        .c1_ddr4_bg(c1_ddr4_bg),
        .c1_ddr4_ck_c(c1_ddr4_ck_c),
        .c1_ddr4_ck_t(c1_ddr4_ck_t),
        .c1_ddr4_cke(c1_ddr4_cke),
        .c1_ddr4_cs_n(c1_ddr4_cs_n),
        .c1_ddr4_dm_n(c1_ddr4_dm_n),
        .c1_ddr4_dq(c1_ddr4_dq),
        .c1_ddr4_dqs_c(c1_ddr4_dqs_c),
        .c1_ddr4_dqs_t(c1_ddr4_dqs_t),
        .c1_ddr4_odt(c1_ddr4_odt),
        .c1_ddr4_reset_n(c1_ddr4_reset_n),
        .c1_sys_clk_clk_n(c1_sys_clk_clk_n),
        .c1_sys_clk_clk_p(c1_sys_clk_clk_p),
        .diff_clock_rtl_clk_n(diff_clock_rtl_clk_n),
        .diff_clock_rtl_clk_p(diff_clock_rtl_clk_p),
        .pcie_7x_mgt_rtl_rxn(pcie_7x_mgt_rtl_rxn),
        .pcie_7x_mgt_rtl_rxp(pcie_7x_mgt_rtl_rxp),
        .pcie_7x_mgt_rtl_txn(pcie_7x_mgt_rtl_txn),
        .pcie_7x_mgt_rtl_txp(pcie_7x_mgt_rtl_txp),
        .perst_n(perst_n),
        .refclk200(refclk200),
        .refclk_n(refclk_n),
        .refclk_p(refclk_p),
        .rxn(rxn),
        .rxp(rxp),
        .sfp_tx_disable(sfp_tx_disable),
        .txn(txn),
        .txp(txp));
endmodule
