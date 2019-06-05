//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
//Date        : Mon Apr 22 21:33:41 2019
//Host        : batcomputer.arkham running 64-bit Ubuntu 16.04.2 LTS
//Command     : generate_target pr_wrapper.bd
//Design      : pr_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module pr_wrapper
   (ARESETN,
    CLK,
    M_AXIS_tdata,
    M_AXIS_tkeep,
    M_AXIS_tlast,
    M_AXIS_tready,
    M_AXIS_tvalid,
    S_AXIS_tdata,
    S_AXIS_tkeep,
    S_AXIS_tlast,
    S_AXIS_tready,
    S_AXIS_tvalid,
    S_AXI_CONTROL_araddr,
    S_AXI_CONTROL_arprot,
    S_AXI_CONTROL_arready,
    S_AXI_CONTROL_arvalid,
    S_AXI_CONTROL_awaddr,
    S_AXI_CONTROL_awprot,
    S_AXI_CONTROL_awready,
    S_AXI_CONTROL_awvalid,
    S_AXI_CONTROL_bready,
    S_AXI_CONTROL_bresp,
    S_AXI_CONTROL_bvalid,
    S_AXI_CONTROL_rdata,
    S_AXI_CONTROL_rready,
    S_AXI_CONTROL_rresp,
    S_AXI_CONTROL_rvalid,
    S_AXI_CONTROL_wdata,
    S_AXI_CONTROL_wready,
    S_AXI_CONTROL_wstrb,
    S_AXI_CONTROL_wvalid,
    S_AXI_MEM_0_araddr,
    S_AXI_MEM_0_arburst,
    S_AXI_MEM_0_arcache,
    S_AXI_MEM_0_arlen,
    S_AXI_MEM_0_arlock,
    S_AXI_MEM_0_arprot,
    S_AXI_MEM_0_arqos,
    S_AXI_MEM_0_arready,
    S_AXI_MEM_0_arsize,
    S_AXI_MEM_0_aruser,
    S_AXI_MEM_0_arvalid,
    S_AXI_MEM_0_awaddr,
    S_AXI_MEM_0_awburst,
    S_AXI_MEM_0_awcache,
    S_AXI_MEM_0_awlen,
    S_AXI_MEM_0_awlock,
    S_AXI_MEM_0_awprot,
    S_AXI_MEM_0_awqos,
    S_AXI_MEM_0_awready,
    S_AXI_MEM_0_awsize,
    S_AXI_MEM_0_awuser,
    S_AXI_MEM_0_awvalid,
    S_AXI_MEM_0_bready,
    S_AXI_MEM_0_bresp,
    S_AXI_MEM_0_bvalid,
    S_AXI_MEM_0_rdata,
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
    S_AXI_MEM_1_arlen,
    S_AXI_MEM_1_arlock,
    S_AXI_MEM_1_arprot,
    S_AXI_MEM_1_arqos,
    S_AXI_MEM_1_arready,
    S_AXI_MEM_1_arsize,
    S_AXI_MEM_1_aruser,
    S_AXI_MEM_1_arvalid,
    S_AXI_MEM_1_awaddr,
    S_AXI_MEM_1_awburst,
    S_AXI_MEM_1_awcache,
    S_AXI_MEM_1_awlen,
    S_AXI_MEM_1_awlock,
    S_AXI_MEM_1_awprot,
    S_AXI_MEM_1_awqos,
    S_AXI_MEM_1_awready,
    S_AXI_MEM_1_awsize,
    S_AXI_MEM_1_awuser,
    S_AXI_MEM_1_awvalid,
    S_AXI_MEM_1_bready,
    S_AXI_MEM_1_bresp,
    S_AXI_MEM_1_bvalid,
    S_AXI_MEM_1_rdata,
    S_AXI_MEM_1_rlast,
    S_AXI_MEM_1_rready,
    S_AXI_MEM_1_rresp,
    S_AXI_MEM_1_rvalid,
    S_AXI_MEM_1_wdata,
    S_AXI_MEM_1_wlast,
    S_AXI_MEM_1_wready,
    S_AXI_MEM_1_wstrb,
    S_AXI_MEM_1_wvalid);
  input ARESETN;
  input CLK;
  output [63:0]M_AXIS_tdata;
  output [7:0]M_AXIS_tkeep;
  output [0:0]M_AXIS_tlast;
  input M_AXIS_tready;
  output M_AXIS_tvalid;
  input [63:0]S_AXIS_tdata;
  input [7:0]S_AXIS_tkeep;
  input [0:0]S_AXIS_tlast;
  output S_AXIS_tready;
  input S_AXIS_tvalid;
  input [15:0]S_AXI_CONTROL_araddr;
  input [2:0]S_AXI_CONTROL_arprot;
  output S_AXI_CONTROL_arready;
  input S_AXI_CONTROL_arvalid;
  input [15:0]S_AXI_CONTROL_awaddr;
  input [2:0]S_AXI_CONTROL_awprot;
  output S_AXI_CONTROL_awready;
  input S_AXI_CONTROL_awvalid;
  input S_AXI_CONTROL_bready;
  output [1:0]S_AXI_CONTROL_bresp;
  output S_AXI_CONTROL_bvalid;
  output [31:0]S_AXI_CONTROL_rdata;
  input S_AXI_CONTROL_rready;
  output [1:0]S_AXI_CONTROL_rresp;
  output S_AXI_CONTROL_rvalid;
  input [31:0]S_AXI_CONTROL_wdata;
  output S_AXI_CONTROL_wready;
  input [3:0]S_AXI_CONTROL_wstrb;
  input S_AXI_CONTROL_wvalid;
  output [31:0]S_AXI_MEM_0_araddr;
  output [1:0]S_AXI_MEM_0_arburst;
  output [3:0]S_AXI_MEM_0_arcache;
  output [7:0]S_AXI_MEM_0_arlen;
  output [0:0]S_AXI_MEM_0_arlock;
  output [2:0]S_AXI_MEM_0_arprot;
  output [3:0]S_AXI_MEM_0_arqos;
  input S_AXI_MEM_0_arready;
  output [2:0]S_AXI_MEM_0_arsize;
  output [3:0]S_AXI_MEM_0_aruser;
  output S_AXI_MEM_0_arvalid;
  output [31:0]S_AXI_MEM_0_awaddr;
  output [1:0]S_AXI_MEM_0_awburst;
  output [3:0]S_AXI_MEM_0_awcache;
  output [7:0]S_AXI_MEM_0_awlen;
  output [0:0]S_AXI_MEM_0_awlock;
  output [2:0]S_AXI_MEM_0_awprot;
  output [3:0]S_AXI_MEM_0_awqos;
  input S_AXI_MEM_0_awready;
  output [2:0]S_AXI_MEM_0_awsize;
  output [3:0]S_AXI_MEM_0_awuser;
  output S_AXI_MEM_0_awvalid;
  output S_AXI_MEM_0_bready;
  input [1:0]S_AXI_MEM_0_bresp;
  input S_AXI_MEM_0_bvalid;
  input [511:0]S_AXI_MEM_0_rdata;
  input S_AXI_MEM_0_rlast;
  output S_AXI_MEM_0_rready;
  input [1:0]S_AXI_MEM_0_rresp;
  input S_AXI_MEM_0_rvalid;
  output [511:0]S_AXI_MEM_0_wdata;
  output S_AXI_MEM_0_wlast;
  input S_AXI_MEM_0_wready;
  output [63:0]S_AXI_MEM_0_wstrb;
  output S_AXI_MEM_0_wvalid;
  output [31:0]S_AXI_MEM_1_araddr;
  output [1:0]S_AXI_MEM_1_arburst;
  output [3:0]S_AXI_MEM_1_arcache;
  output [7:0]S_AXI_MEM_1_arlen;
  output [0:0]S_AXI_MEM_1_arlock;
  output [2:0]S_AXI_MEM_1_arprot;
  output [3:0]S_AXI_MEM_1_arqos;
  input S_AXI_MEM_1_arready;
  output [2:0]S_AXI_MEM_1_arsize;
  output [3:0]S_AXI_MEM_1_aruser;
  output S_AXI_MEM_1_arvalid;
  output [31:0]S_AXI_MEM_1_awaddr;
  output [1:0]S_AXI_MEM_1_awburst;
  output [3:0]S_AXI_MEM_1_awcache;
  output [7:0]S_AXI_MEM_1_awlen;
  output [0:0]S_AXI_MEM_1_awlock;
  output [2:0]S_AXI_MEM_1_awprot;
  output [3:0]S_AXI_MEM_1_awqos;
  input S_AXI_MEM_1_awready;
  output [2:0]S_AXI_MEM_1_awsize;
  output [3:0]S_AXI_MEM_1_awuser;
  output S_AXI_MEM_1_awvalid;
  output S_AXI_MEM_1_bready;
  input [1:0]S_AXI_MEM_1_bresp;
  input S_AXI_MEM_1_bvalid;
  input [511:0]S_AXI_MEM_1_rdata;
  input S_AXI_MEM_1_rlast;
  output S_AXI_MEM_1_rready;
  input [1:0]S_AXI_MEM_1_rresp;
  input S_AXI_MEM_1_rvalid;
  output [511:0]S_AXI_MEM_1_wdata;
  output S_AXI_MEM_1_wlast;
  input S_AXI_MEM_1_wready;
  output [63:0]S_AXI_MEM_1_wstrb;
  output S_AXI_MEM_1_wvalid;

  wire ARESETN;
  wire CLK;
  wire [63:0]M_AXIS_tdata;
  wire [7:0]M_AXIS_tkeep;
  wire [0:0]M_AXIS_tlast;
  wire M_AXIS_tready;
  wire M_AXIS_tvalid;
  wire [63:0]S_AXIS_tdata;
  wire [7:0]S_AXIS_tkeep;
  wire [0:0]S_AXIS_tlast;
  wire S_AXIS_tready;
  wire S_AXIS_tvalid;
  wire [15:0]S_AXI_CONTROL_araddr;
  wire [2:0]S_AXI_CONTROL_arprot;
  wire S_AXI_CONTROL_arready;
  wire S_AXI_CONTROL_arvalid;
  wire [15:0]S_AXI_CONTROL_awaddr;
  wire [2:0]S_AXI_CONTROL_awprot;
  wire S_AXI_CONTROL_awready;
  wire S_AXI_CONTROL_awvalid;
  wire S_AXI_CONTROL_bready;
  wire [1:0]S_AXI_CONTROL_bresp;
  wire S_AXI_CONTROL_bvalid;
  wire [31:0]S_AXI_CONTROL_rdata;
  wire S_AXI_CONTROL_rready;
  wire [1:0]S_AXI_CONTROL_rresp;
  wire S_AXI_CONTROL_rvalid;
  wire [31:0]S_AXI_CONTROL_wdata;
  wire S_AXI_CONTROL_wready;
  wire [3:0]S_AXI_CONTROL_wstrb;
  wire S_AXI_CONTROL_wvalid;
  wire [31:0]S_AXI_MEM_0_araddr;
  wire [1:0]S_AXI_MEM_0_arburst;
  wire [3:0]S_AXI_MEM_0_arcache;
  wire [7:0]S_AXI_MEM_0_arlen;
  wire [0:0]S_AXI_MEM_0_arlock;
  wire [2:0]S_AXI_MEM_0_arprot;
  wire [3:0]S_AXI_MEM_0_arqos;
  wire S_AXI_MEM_0_arready;
  wire [2:0]S_AXI_MEM_0_arsize;
  wire [3:0]S_AXI_MEM_0_aruser;
  wire S_AXI_MEM_0_arvalid;
  wire [31:0]S_AXI_MEM_0_awaddr;
  wire [1:0]S_AXI_MEM_0_awburst;
  wire [3:0]S_AXI_MEM_0_awcache;
  wire [7:0]S_AXI_MEM_0_awlen;
  wire [0:0]S_AXI_MEM_0_awlock;
  wire [2:0]S_AXI_MEM_0_awprot;
  wire [3:0]S_AXI_MEM_0_awqos;
  wire S_AXI_MEM_0_awready;
  wire [2:0]S_AXI_MEM_0_awsize;
  wire [3:0]S_AXI_MEM_0_awuser;
  wire S_AXI_MEM_0_awvalid;
  wire S_AXI_MEM_0_bready;
  wire [1:0]S_AXI_MEM_0_bresp;
  wire S_AXI_MEM_0_bvalid;
  wire [511:0]S_AXI_MEM_0_rdata;
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
  wire [7:0]S_AXI_MEM_1_arlen;
  wire [0:0]S_AXI_MEM_1_arlock;
  wire [2:0]S_AXI_MEM_1_arprot;
  wire [3:0]S_AXI_MEM_1_arqos;
  wire S_AXI_MEM_1_arready;
  wire [2:0]S_AXI_MEM_1_arsize;
  wire [3:0]S_AXI_MEM_1_aruser;
  wire S_AXI_MEM_1_arvalid;
  wire [31:0]S_AXI_MEM_1_awaddr;
  wire [1:0]S_AXI_MEM_1_awburst;
  wire [3:0]S_AXI_MEM_1_awcache;
  wire [7:0]S_AXI_MEM_1_awlen;
  wire [0:0]S_AXI_MEM_1_awlock;
  wire [2:0]S_AXI_MEM_1_awprot;
  wire [3:0]S_AXI_MEM_1_awqos;
  wire S_AXI_MEM_1_awready;
  wire [2:0]S_AXI_MEM_1_awsize;
  wire [3:0]S_AXI_MEM_1_awuser;
  wire S_AXI_MEM_1_awvalid;
  wire S_AXI_MEM_1_bready;
  wire [1:0]S_AXI_MEM_1_bresp;
  wire S_AXI_MEM_1_bvalid;
  wire [511:0]S_AXI_MEM_1_rdata;
  wire S_AXI_MEM_1_rlast;
  wire S_AXI_MEM_1_rready;
  wire [1:0]S_AXI_MEM_1_rresp;
  wire S_AXI_MEM_1_rvalid;
  wire [511:0]S_AXI_MEM_1_wdata;
  wire S_AXI_MEM_1_wlast;
  wire S_AXI_MEM_1_wready;
  wire [63:0]S_AXI_MEM_1_wstrb;
  wire S_AXI_MEM_1_wvalid;

  pr pr_i
       (.ARESETN(ARESETN),
        .CLK(CLK),
        .M_AXIS_tdata(M_AXIS_tdata),
        .M_AXIS_tkeep(M_AXIS_tkeep),
        .M_AXIS_tlast(M_AXIS_tlast),
        .M_AXIS_tready(M_AXIS_tready),
        .M_AXIS_tvalid(M_AXIS_tvalid),
        .S_AXIS_tdata(S_AXIS_tdata),
        .S_AXIS_tkeep(S_AXIS_tkeep),
        .S_AXIS_tlast(S_AXIS_tlast),
        .S_AXIS_tready(S_AXIS_tready),
        .S_AXIS_tvalid(S_AXIS_tvalid),
        .S_AXI_CONTROL_araddr(S_AXI_CONTROL_araddr),
        .S_AXI_CONTROL_arprot(S_AXI_CONTROL_arprot),
        .S_AXI_CONTROL_arready(S_AXI_CONTROL_arready),
        .S_AXI_CONTROL_arvalid(S_AXI_CONTROL_arvalid),
        .S_AXI_CONTROL_awaddr(S_AXI_CONTROL_awaddr),
        .S_AXI_CONTROL_awprot(S_AXI_CONTROL_awprot),
        .S_AXI_CONTROL_awready(S_AXI_CONTROL_awready),
        .S_AXI_CONTROL_awvalid(S_AXI_CONTROL_awvalid),
        .S_AXI_CONTROL_bready(S_AXI_CONTROL_bready),
        .S_AXI_CONTROL_bresp(S_AXI_CONTROL_bresp),
        .S_AXI_CONTROL_bvalid(S_AXI_CONTROL_bvalid),
        .S_AXI_CONTROL_rdata(S_AXI_CONTROL_rdata),
        .S_AXI_CONTROL_rready(S_AXI_CONTROL_rready),
        .S_AXI_CONTROL_rresp(S_AXI_CONTROL_rresp),
        .S_AXI_CONTROL_rvalid(S_AXI_CONTROL_rvalid),
        .S_AXI_CONTROL_wdata(S_AXI_CONTROL_wdata),
        .S_AXI_CONTROL_wready(S_AXI_CONTROL_wready),
        .S_AXI_CONTROL_wstrb(S_AXI_CONTROL_wstrb),
        .S_AXI_CONTROL_wvalid(S_AXI_CONTROL_wvalid),
        .S_AXI_MEM_0_araddr(S_AXI_MEM_0_araddr),
        .S_AXI_MEM_0_arburst(S_AXI_MEM_0_arburst),
        .S_AXI_MEM_0_arcache(S_AXI_MEM_0_arcache),
        .S_AXI_MEM_0_arlen(S_AXI_MEM_0_arlen),
        .S_AXI_MEM_0_arlock(S_AXI_MEM_0_arlock),
        .S_AXI_MEM_0_arprot(S_AXI_MEM_0_arprot),
        .S_AXI_MEM_0_arqos(S_AXI_MEM_0_arqos),
        .S_AXI_MEM_0_arready(S_AXI_MEM_0_arready),
        .S_AXI_MEM_0_arsize(S_AXI_MEM_0_arsize),
        .S_AXI_MEM_0_aruser(S_AXI_MEM_0_aruser),
        .S_AXI_MEM_0_arvalid(S_AXI_MEM_0_arvalid),
        .S_AXI_MEM_0_awaddr(S_AXI_MEM_0_awaddr),
        .S_AXI_MEM_0_awburst(S_AXI_MEM_0_awburst),
        .S_AXI_MEM_0_awcache(S_AXI_MEM_0_awcache),
        .S_AXI_MEM_0_awlen(S_AXI_MEM_0_awlen),
        .S_AXI_MEM_0_awlock(S_AXI_MEM_0_awlock),
        .S_AXI_MEM_0_awprot(S_AXI_MEM_0_awprot),
        .S_AXI_MEM_0_awqos(S_AXI_MEM_0_awqos),
        .S_AXI_MEM_0_awready(S_AXI_MEM_0_awready),
        .S_AXI_MEM_0_awsize(S_AXI_MEM_0_awsize),
        .S_AXI_MEM_0_awuser(S_AXI_MEM_0_awuser),
        .S_AXI_MEM_0_awvalid(S_AXI_MEM_0_awvalid),
        .S_AXI_MEM_0_bready(S_AXI_MEM_0_bready),
        .S_AXI_MEM_0_bresp(S_AXI_MEM_0_bresp),
        .S_AXI_MEM_0_bvalid(S_AXI_MEM_0_bvalid),
        .S_AXI_MEM_0_rdata(S_AXI_MEM_0_rdata),
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
        .S_AXI_MEM_1_arlen(S_AXI_MEM_1_arlen),
        .S_AXI_MEM_1_arlock(S_AXI_MEM_1_arlock),
        .S_AXI_MEM_1_arprot(S_AXI_MEM_1_arprot),
        .S_AXI_MEM_1_arqos(S_AXI_MEM_1_arqos),
        .S_AXI_MEM_1_arready(S_AXI_MEM_1_arready),
        .S_AXI_MEM_1_arsize(S_AXI_MEM_1_arsize),
        .S_AXI_MEM_1_aruser(S_AXI_MEM_1_aruser),
        .S_AXI_MEM_1_arvalid(S_AXI_MEM_1_arvalid),
        .S_AXI_MEM_1_awaddr(S_AXI_MEM_1_awaddr),
        .S_AXI_MEM_1_awburst(S_AXI_MEM_1_awburst),
        .S_AXI_MEM_1_awcache(S_AXI_MEM_1_awcache),
        .S_AXI_MEM_1_awlen(S_AXI_MEM_1_awlen),
        .S_AXI_MEM_1_awlock(S_AXI_MEM_1_awlock),
        .S_AXI_MEM_1_awprot(S_AXI_MEM_1_awprot),
        .S_AXI_MEM_1_awqos(S_AXI_MEM_1_awqos),
        .S_AXI_MEM_1_awready(S_AXI_MEM_1_awready),
        .S_AXI_MEM_1_awsize(S_AXI_MEM_1_awsize),
        .S_AXI_MEM_1_awuser(S_AXI_MEM_1_awuser),
        .S_AXI_MEM_1_awvalid(S_AXI_MEM_1_awvalid),
        .S_AXI_MEM_1_bready(S_AXI_MEM_1_bready),
        .S_AXI_MEM_1_bresp(S_AXI_MEM_1_bresp),
        .S_AXI_MEM_1_bvalid(S_AXI_MEM_1_bvalid),
        .S_AXI_MEM_1_rdata(S_AXI_MEM_1_rdata),
        .S_AXI_MEM_1_rlast(S_AXI_MEM_1_rlast),
        .S_AXI_MEM_1_rready(S_AXI_MEM_1_rready),
        .S_AXI_MEM_1_rresp(S_AXI_MEM_1_rresp),
        .S_AXI_MEM_1_rvalid(S_AXI_MEM_1_rvalid),
        .S_AXI_MEM_1_wdata(S_AXI_MEM_1_wdata),
        .S_AXI_MEM_1_wlast(S_AXI_MEM_1_wlast),
        .S_AXI_MEM_1_wready(S_AXI_MEM_1_wready),
        .S_AXI_MEM_1_wstrb(S_AXI_MEM_1_wstrb),
        .S_AXI_MEM_1_wvalid(S_AXI_MEM_1_wvalid));
endmodule
