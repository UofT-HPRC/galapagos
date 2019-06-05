//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
//Date        : Mon Apr 22 16:50:40 2019
//Host        : batcomputer.arkham running 64-bit Ubuntu 16.04.2 LTS
//Command     : generate_target mem_wrapper.bd
//Design      : mem_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module mem_wrapper
   (S_AXI_MEM_0_araddr,
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
    c0_ddr4_act_n_0,
    c0_ddr4_adr_0,
    c0_ddr4_ba_0,
    c0_ddr4_bg_0,
    c0_ddr4_ck_c_0,
    c0_ddr4_ck_t_0,
    c0_ddr4_cke_0,
    c0_ddr4_cs_n_0,
    c0_ddr4_dg_0,
    c0_ddr4_dm_dbi_n_0,
    c0_ddr4_dqs_c_0,
    c0_ddr4_dqs_t_0,
    c0_ddr4_odt_0,
    c0_ddr4_reset_n_0,
    c0_sys_clk_n,
    c0_sys_clk_p,
    c1_ddr4_act_n,
    c1_ddr4_adr,
    c1_ddr4_ba,
    c1_ddr4_bg,
    c1_ddr4_ck_c,
    c1_ddr4_ck_t,
    c1_ddr4_cke,
    c1_ddr4_cs_n,
    c1_ddr4_dm_dbi_n,
    c1_ddr4_dq,
    c1_ddr4_dqs_c,
    c1_ddr4_dqs_t,
    c1_ddr4_odt,
    c1_ddr4_reset_n,
    c1_sys_clk_n,
    c1_sys_clk_p,
    sys_reset_n,
    user_clk,
    user_resetn);
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
  output c0_ddr4_act_n_0;
  output [16:0]c0_ddr4_adr_0;
  output [1:0]c0_ddr4_ba_0;
  output [1:0]c0_ddr4_bg_0;
  output [0:0]c0_ddr4_ck_c_0;
  output [0:0]c0_ddr4_ck_t_0;
  output [0:0]c0_ddr4_cke_0;
  output [0:0]c0_ddr4_cs_n_0;
  inout [63:0]c0_ddr4_dg_0;
  inout [7:0]c0_ddr4_dm_dbi_n_0;
  inout [7:0]c0_ddr4_dqs_c_0;
  inout [7:0]c0_ddr4_dqs_t_0;
  output [0:0]c0_ddr4_odt_0;
  output c0_ddr4_reset_n_0;
  input c0_sys_clk_n;
  input c0_sys_clk_p;
  output c1_ddr4_act_n;
  output [16:0]c1_ddr4_adr;
  output [1:0]c1_ddr4_ba;
  output [1:0]c1_ddr4_bg;
  output [0:0]c1_ddr4_ck_c;
  output [0:0]c1_ddr4_ck_t;
  output [0:0]c1_ddr4_cke;
  output [0:0]c1_ddr4_cs_n;
  inout [7:0]c1_ddr4_dm_dbi_n;
  inout [63:0]c1_ddr4_dq;
  inout [7:0]c1_ddr4_dqs_c;
  inout [7:0]c1_ddr4_dqs_t;
  output [0:0]c1_ddr4_odt;
  output c1_ddr4_reset_n;
  input c1_sys_clk_n;
  input c1_sys_clk_p;
  input sys_reset_n;
  input user_clk;
  output [0:0]user_resetn;

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
  wire c0_ddr4_act_n_0;
  wire [16:0]c0_ddr4_adr_0;
  wire [1:0]c0_ddr4_ba_0;
  wire [1:0]c0_ddr4_bg_0;
  wire [0:0]c0_ddr4_ck_c_0;
  wire [0:0]c0_ddr4_ck_t_0;
  wire [0:0]c0_ddr4_cke_0;
  wire [0:0]c0_ddr4_cs_n_0;
  wire [63:0]c0_ddr4_dg_0;
  wire [7:0]c0_ddr4_dm_dbi_n_0;
  wire [7:0]c0_ddr4_dqs_c_0;
  wire [7:0]c0_ddr4_dqs_t_0;
  wire [0:0]c0_ddr4_odt_0;
  wire c0_ddr4_reset_n_0;
  wire c0_sys_clk_n;
  wire c0_sys_clk_p;
  wire c1_ddr4_act_n;
  wire [16:0]c1_ddr4_adr;
  wire [1:0]c1_ddr4_ba;
  wire [1:0]c1_ddr4_bg;
  wire [0:0]c1_ddr4_ck_c;
  wire [0:0]c1_ddr4_ck_t;
  wire [0:0]c1_ddr4_cke;
  wire [0:0]c1_ddr4_cs_n;
  wire [7:0]c1_ddr4_dm_dbi_n;
  wire [63:0]c1_ddr4_dq;
  wire [7:0]c1_ddr4_dqs_c;
  wire [7:0]c1_ddr4_dqs_t;
  wire [0:0]c1_ddr4_odt;
  wire c1_ddr4_reset_n;
  wire c1_sys_clk_n;
  wire c1_sys_clk_p;
  wire sys_reset_n;
  wire user_clk;
  wire [0:0]user_resetn;

  mem mem_i
       (.S_AXI_MEM_0_araddr(S_AXI_MEM_0_araddr),
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
        .c0_ddr4_act_n_0(c0_ddr4_act_n_0),
        .c0_ddr4_adr_0(c0_ddr4_adr_0),
        .c0_ddr4_ba_0(c0_ddr4_ba_0),
        .c0_ddr4_bg_0(c0_ddr4_bg_0),
        .c0_ddr4_ck_c_0(c0_ddr4_ck_c_0),
        .c0_ddr4_ck_t_0(c0_ddr4_ck_t_0),
        .c0_ddr4_cke_0(c0_ddr4_cke_0),
        .c0_ddr4_cs_n_0(c0_ddr4_cs_n_0),
        .c0_ddr4_dg_0(c0_ddr4_dg_0),
        .c0_ddr4_dm_dbi_n_0(c0_ddr4_dm_dbi_n_0),
        .c0_ddr4_dqs_c_0(c0_ddr4_dqs_c_0),
        .c0_ddr4_dqs_t_0(c0_ddr4_dqs_t_0),
        .c0_ddr4_odt_0(c0_ddr4_odt_0),
        .c0_ddr4_reset_n_0(c0_ddr4_reset_n_0),
        .c0_sys_clk_n(c0_sys_clk_n),
        .c0_sys_clk_p(c0_sys_clk_p),
        .c1_ddr4_act_n(c1_ddr4_act_n),
        .c1_ddr4_adr(c1_ddr4_adr),
        .c1_ddr4_ba(c1_ddr4_ba),
        .c1_ddr4_bg(c1_ddr4_bg),
        .c1_ddr4_ck_c(c1_ddr4_ck_c),
        .c1_ddr4_ck_t(c1_ddr4_ck_t),
        .c1_ddr4_cke(c1_ddr4_cke),
        .c1_ddr4_cs_n(c1_ddr4_cs_n),
        .c1_ddr4_dm_dbi_n(c1_ddr4_dm_dbi_n),
        .c1_ddr4_dq(c1_ddr4_dq),
        .c1_ddr4_dqs_c(c1_ddr4_dqs_c),
        .c1_ddr4_dqs_t(c1_ddr4_dqs_t),
        .c1_ddr4_odt(c1_ddr4_odt),
        .c1_ddr4_reset_n(c1_ddr4_reset_n),
        .c1_sys_clk_n(c1_sys_clk_n),
        .c1_sys_clk_p(c1_sys_clk_p),
        .sys_reset_n(sys_reset_n),
        .user_clk(user_clk),
        .user_resetn(user_resetn));
endmodule
