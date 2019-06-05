//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
//Date        : Mon Apr 22 16:50:39 2019
//Host        : batcomputer.arkham running 64-bit Ubuntu 16.04.2 LTS
//Command     : generate_target mem.bd
//Design      : mem
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "mem,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=mem,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=15,numReposBlks=10,numNonXlnxBlks=0,numHierBlks=5,maxHierDepth=1,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "mem.hwdef" *) 
module mem
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
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI_MEM_0, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN mem_user_clk, DATA_WIDTH 512, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 1, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 1, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 1, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 2, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 2, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 1, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) input [31:0]S_AXI_MEM_0_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 ARBURST" *) input [1:0]S_AXI_MEM_0_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 ARCACHE" *) input [3:0]S_AXI_MEM_0_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 ARID" *) input [0:0]S_AXI_MEM_0_arid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 ARLEN" *) input [7:0]S_AXI_MEM_0_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 ARLOCK" *) input [0:0]S_AXI_MEM_0_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 ARPROT" *) input [2:0]S_AXI_MEM_0_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 ARQOS" *) input [3:0]S_AXI_MEM_0_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 ARREADY" *) output S_AXI_MEM_0_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 ARREGION" *) input [3:0]S_AXI_MEM_0_arregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 ARSIZE" *) input [2:0]S_AXI_MEM_0_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 ARVALID" *) input S_AXI_MEM_0_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 AWADDR" *) input [31:0]S_AXI_MEM_0_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 AWBURST" *) input [1:0]S_AXI_MEM_0_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 AWCACHE" *) input [3:0]S_AXI_MEM_0_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 AWID" *) input [0:0]S_AXI_MEM_0_awid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 AWLEN" *) input [7:0]S_AXI_MEM_0_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 AWLOCK" *) input [0:0]S_AXI_MEM_0_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 AWPROT" *) input [2:0]S_AXI_MEM_0_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 AWQOS" *) input [3:0]S_AXI_MEM_0_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 AWREADY" *) output S_AXI_MEM_0_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 AWREGION" *) input [3:0]S_AXI_MEM_0_awregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 AWSIZE" *) input [2:0]S_AXI_MEM_0_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 AWVALID" *) input S_AXI_MEM_0_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 BID" *) output [0:0]S_AXI_MEM_0_bid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 BREADY" *) input S_AXI_MEM_0_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 BRESP" *) output [1:0]S_AXI_MEM_0_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 BVALID" *) output S_AXI_MEM_0_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 RDATA" *) output [511:0]S_AXI_MEM_0_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 RID" *) output [0:0]S_AXI_MEM_0_rid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 RLAST" *) output S_AXI_MEM_0_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 RREADY" *) input S_AXI_MEM_0_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 RRESP" *) output [1:0]S_AXI_MEM_0_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 RVALID" *) output S_AXI_MEM_0_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 WDATA" *) input [511:0]S_AXI_MEM_0_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 WLAST" *) input S_AXI_MEM_0_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 WREADY" *) output S_AXI_MEM_0_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 WSTRB" *) input [63:0]S_AXI_MEM_0_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 WVALID" *) input S_AXI_MEM_0_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI_MEM_1, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN mem_user_clk, DATA_WIDTH 512, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 1, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 1, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 1, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 2, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 2, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 1, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) input [31:0]S_AXI_MEM_1_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 ARBURST" *) input [1:0]S_AXI_MEM_1_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 ARCACHE" *) input [3:0]S_AXI_MEM_1_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 ARID" *) input [0:0]S_AXI_MEM_1_arid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 ARLEN" *) input [7:0]S_AXI_MEM_1_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 ARLOCK" *) input [0:0]S_AXI_MEM_1_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 ARPROT" *) input [2:0]S_AXI_MEM_1_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 ARQOS" *) input [3:0]S_AXI_MEM_1_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 ARREADY" *) output S_AXI_MEM_1_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 ARREGION" *) input [3:0]S_AXI_MEM_1_arregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 ARSIZE" *) input [2:0]S_AXI_MEM_1_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 ARVALID" *) input S_AXI_MEM_1_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 AWADDR" *) input [31:0]S_AXI_MEM_1_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 AWBURST" *) input [1:0]S_AXI_MEM_1_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 AWCACHE" *) input [3:0]S_AXI_MEM_1_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 AWID" *) input [0:0]S_AXI_MEM_1_awid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 AWLEN" *) input [7:0]S_AXI_MEM_1_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 AWLOCK" *) input [0:0]S_AXI_MEM_1_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 AWPROT" *) input [2:0]S_AXI_MEM_1_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 AWQOS" *) input [3:0]S_AXI_MEM_1_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 AWREADY" *) output S_AXI_MEM_1_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 AWREGION" *) input [3:0]S_AXI_MEM_1_awregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 AWSIZE" *) input [2:0]S_AXI_MEM_1_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 AWVALID" *) input S_AXI_MEM_1_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 BID" *) output [0:0]S_AXI_MEM_1_bid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 BREADY" *) input S_AXI_MEM_1_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 BRESP" *) output [1:0]S_AXI_MEM_1_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 BVALID" *) output S_AXI_MEM_1_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 RDATA" *) output [511:0]S_AXI_MEM_1_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 RID" *) output [0:0]S_AXI_MEM_1_rid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 RLAST" *) output S_AXI_MEM_1_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 RREADY" *) input S_AXI_MEM_1_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 RRESP" *) output [1:0]S_AXI_MEM_1_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 RVALID" *) output S_AXI_MEM_1_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 WDATA" *) input [511:0]S_AXI_MEM_1_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 WLAST" *) input S_AXI_MEM_1_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 WREADY" *) output S_AXI_MEM_1_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 WSTRB" *) input [63:0]S_AXI_MEM_1_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 WVALID" *) input S_AXI_MEM_1_wvalid;
  output c0_ddr4_act_n_0;
  output [16:0]c0_ddr4_adr_0;
  output [1:0]c0_ddr4_ba_0;
  output [1:0]c0_ddr4_bg_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.C0_DDR4_CK_C_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.C0_DDR4_CK_C_0, FREQ_HZ 100000000, PHASE 0.000" *) output [0:0]c0_ddr4_ck_c_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.C0_DDR4_CK_T_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.C0_DDR4_CK_T_0, FREQ_HZ 100000000, PHASE 0.000" *) output [0:0]c0_ddr4_ck_t_0;
  output [0:0]c0_ddr4_cke_0;
  output [0:0]c0_ddr4_cs_n_0;
  inout [63:0]c0_ddr4_dg_0;
  inout [7:0]c0_ddr4_dm_dbi_n_0;
  inout [7:0]c0_ddr4_dqs_c_0;
  inout [7:0]c0_ddr4_dqs_t_0;
  output [0:0]c0_ddr4_odt_0;
  output c0_ddr4_reset_n_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.C0_SYS_CLK_N CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.C0_SYS_CLK_N, CLK_DOMAIN mem_c0_sys_clk_n, FREQ_HZ 300000000, PHASE 0.000" *) input c0_sys_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.C0_SYS_CLK_P CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.C0_SYS_CLK_P, CLK_DOMAIN mem_c0_sys_clk_p, FREQ_HZ 300000000, PHASE 0.000" *) input c0_sys_clk_p;
  output c1_ddr4_act_n;
  output [16:0]c1_ddr4_adr;
  output [1:0]c1_ddr4_ba;
  output [1:0]c1_ddr4_bg;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.C1_DDR4_CK_C CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.C1_DDR4_CK_C, FREQ_HZ 100000000, PHASE 0.000" *) output [0:0]c1_ddr4_ck_c;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.C1_DDR4_CK_T CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.C1_DDR4_CK_T, FREQ_HZ 100000000, PHASE 0.000" *) output [0:0]c1_ddr4_ck_t;
  output [0:0]c1_ddr4_cke;
  output [0:0]c1_ddr4_cs_n;
  inout [7:0]c1_ddr4_dm_dbi_n;
  inout [63:0]c1_ddr4_dq;
  inout [7:0]c1_ddr4_dqs_c;
  inout [7:0]c1_ddr4_dqs_t;
  output [0:0]c1_ddr4_odt;
  output c1_ddr4_reset_n;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.C1_SYS_CLK_N CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.C1_SYS_CLK_N, CLK_DOMAIN mem_c1_sys_clk_n, FREQ_HZ 300000000, PHASE 0.000" *) input c1_sys_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.C1_SYS_CLK_P CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.C1_SYS_CLK_P, CLK_DOMAIN mem_c1_sys_clk_p, FREQ_HZ 300000000, PHASE 0.000" *) input c1_sys_clk_p;
  input sys_reset_n;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.USER_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.USER_CLK, ASSOCIATED_BUSIF S_AXI_MEM_0:S_AXI_MEM_1, CLK_DOMAIN mem_user_clk, FREQ_HZ 100000000, PHASE 0.000" *) input user_clk;
  output [0:0]user_resetn;

  wire [63:0]Net;
  wire [7:0]Net1;
  wire [7:0]Net2;
  wire [7:0]Net3;
  wire [7:0]Net4;
  wire [7:0]Net5;
  wire [7:0]Net6;
  wire [63:0]Net7;
  wire [31:0]S_AXI_MEM_1_1_ARADDR;
  wire [1:0]S_AXI_MEM_1_1_ARBURST;
  wire [3:0]S_AXI_MEM_1_1_ARCACHE;
  wire [0:0]S_AXI_MEM_1_1_ARID;
  wire [7:0]S_AXI_MEM_1_1_ARLEN;
  wire [0:0]S_AXI_MEM_1_1_ARLOCK;
  wire [2:0]S_AXI_MEM_1_1_ARPROT;
  wire [3:0]S_AXI_MEM_1_1_ARQOS;
  wire S_AXI_MEM_1_1_ARREADY;
  wire [3:0]S_AXI_MEM_1_1_ARREGION;
  wire [2:0]S_AXI_MEM_1_1_ARSIZE;
  wire S_AXI_MEM_1_1_ARVALID;
  wire [31:0]S_AXI_MEM_1_1_AWADDR;
  wire [1:0]S_AXI_MEM_1_1_AWBURST;
  wire [3:0]S_AXI_MEM_1_1_AWCACHE;
  wire [0:0]S_AXI_MEM_1_1_AWID;
  wire [7:0]S_AXI_MEM_1_1_AWLEN;
  wire [0:0]S_AXI_MEM_1_1_AWLOCK;
  wire [2:0]S_AXI_MEM_1_1_AWPROT;
  wire [3:0]S_AXI_MEM_1_1_AWQOS;
  wire S_AXI_MEM_1_1_AWREADY;
  wire [3:0]S_AXI_MEM_1_1_AWREGION;
  wire [2:0]S_AXI_MEM_1_1_AWSIZE;
  wire S_AXI_MEM_1_1_AWVALID;
  wire [0:0]S_AXI_MEM_1_1_BID;
  wire S_AXI_MEM_1_1_BREADY;
  wire [1:0]S_AXI_MEM_1_1_BRESP;
  wire S_AXI_MEM_1_1_BVALID;
  wire [511:0]S_AXI_MEM_1_1_RDATA;
  wire [0:0]S_AXI_MEM_1_1_RID;
  wire S_AXI_MEM_1_1_RLAST;
  wire S_AXI_MEM_1_1_RREADY;
  wire [1:0]S_AXI_MEM_1_1_RRESP;
  wire S_AXI_MEM_1_1_RVALID;
  wire [511:0]S_AXI_MEM_1_1_WDATA;
  wire S_AXI_MEM_1_1_WLAST;
  wire S_AXI_MEM_1_1_WREADY;
  wire [63:0]S_AXI_MEM_1_1_WSTRB;
  wire S_AXI_MEM_1_1_WVALID;
  wire [31:0]S_AXI_MEM_1_ARADDR;
  wire [1:0]S_AXI_MEM_1_ARBURST;
  wire [3:0]S_AXI_MEM_1_ARCACHE;
  wire [0:0]S_AXI_MEM_1_ARID;
  wire [7:0]S_AXI_MEM_1_ARLEN;
  wire [0:0]S_AXI_MEM_1_ARLOCK;
  wire [2:0]S_AXI_MEM_1_ARPROT;
  wire [3:0]S_AXI_MEM_1_ARQOS;
  wire S_AXI_MEM_1_ARREADY;
  wire [3:0]S_AXI_MEM_1_ARREGION;
  wire [2:0]S_AXI_MEM_1_ARSIZE;
  wire S_AXI_MEM_1_ARVALID;
  wire [31:0]S_AXI_MEM_1_AWADDR;
  wire [1:0]S_AXI_MEM_1_AWBURST;
  wire [3:0]S_AXI_MEM_1_AWCACHE;
  wire [0:0]S_AXI_MEM_1_AWID;
  wire [7:0]S_AXI_MEM_1_AWLEN;
  wire [0:0]S_AXI_MEM_1_AWLOCK;
  wire [2:0]S_AXI_MEM_1_AWPROT;
  wire [3:0]S_AXI_MEM_1_AWQOS;
  wire S_AXI_MEM_1_AWREADY;
  wire [3:0]S_AXI_MEM_1_AWREGION;
  wire [2:0]S_AXI_MEM_1_AWSIZE;
  wire S_AXI_MEM_1_AWVALID;
  wire [0:0]S_AXI_MEM_1_BID;
  wire S_AXI_MEM_1_BREADY;
  wire [1:0]S_AXI_MEM_1_BRESP;
  wire S_AXI_MEM_1_BVALID;
  wire [511:0]S_AXI_MEM_1_RDATA;
  wire [0:0]S_AXI_MEM_1_RID;
  wire S_AXI_MEM_1_RLAST;
  wire S_AXI_MEM_1_RREADY;
  wire [1:0]S_AXI_MEM_1_RRESP;
  wire S_AXI_MEM_1_RVALID;
  wire [511:0]S_AXI_MEM_1_WDATA;
  wire S_AXI_MEM_1_WLAST;
  wire S_AXI_MEM_1_WREADY;
  wire [63:0]S_AXI_MEM_1_WSTRB;
  wire S_AXI_MEM_1_WVALID;
  wire c0_sys_clk_n_0_1;
  wire c0_sys_clk_p_0_1;
  wire c1_sys_clk_n_1;
  wire c1_sys_clk_p_1;
  wire clk156_25_0_1;
  wire [0:0]mem_interface_ARESETN;
  wire mem_interface_c0_ddr4_act_n;
  wire [16:0]mem_interface_c0_ddr4_adr;
  wire [1:0]mem_interface_c0_ddr4_ba;
  wire [1:0]mem_interface_c0_ddr4_bg;
  wire [0:0]mem_interface_c0_ddr4_ck_c;
  wire [0:0]mem_interface_c0_ddr4_ck_t;
  wire [0:0]mem_interface_c0_ddr4_cke;
  wire [0:0]mem_interface_c0_ddr4_cs_n;
  wire [0:0]mem_interface_c0_ddr4_odt;
  wire mem_interface_c0_ddr4_reset_n;
  wire mem_interface_c1_ddr4_act_n;
  wire [16:0]mem_interface_c1_ddr4_adr;
  wire [1:0]mem_interface_c1_ddr4_ba;
  wire [1:0]mem_interface_c1_ddr4_bg;
  wire [0:0]mem_interface_c1_ddr4_ck_c;
  wire [0:0]mem_interface_c1_ddr4_ck_t;
  wire [0:0]mem_interface_c1_ddr4_cke;
  wire [0:0]mem_interface_c1_ddr4_cs_n;
  wire [0:0]mem_interface_c1_ddr4_odt;
  wire mem_interface_c1_ddr4_reset_n;
  wire sys_reset_n_1;
  wire [0:0]sys_rst_1;

  assign S_AXI_MEM_0_arready = S_AXI_MEM_1_ARREADY;
  assign S_AXI_MEM_0_awready = S_AXI_MEM_1_AWREADY;
  assign S_AXI_MEM_0_bid[0] = S_AXI_MEM_1_BID;
  assign S_AXI_MEM_0_bresp[1:0] = S_AXI_MEM_1_BRESP;
  assign S_AXI_MEM_0_bvalid = S_AXI_MEM_1_BVALID;
  assign S_AXI_MEM_0_rdata[511:0] = S_AXI_MEM_1_RDATA;
  assign S_AXI_MEM_0_rid[0] = S_AXI_MEM_1_RID;
  assign S_AXI_MEM_0_rlast = S_AXI_MEM_1_RLAST;
  assign S_AXI_MEM_0_rresp[1:0] = S_AXI_MEM_1_RRESP;
  assign S_AXI_MEM_0_rvalid = S_AXI_MEM_1_RVALID;
  assign S_AXI_MEM_0_wready = S_AXI_MEM_1_WREADY;
  assign S_AXI_MEM_1_1_ARADDR = S_AXI_MEM_1_araddr[31:0];
  assign S_AXI_MEM_1_1_ARBURST = S_AXI_MEM_1_arburst[1:0];
  assign S_AXI_MEM_1_1_ARCACHE = S_AXI_MEM_1_arcache[3:0];
  assign S_AXI_MEM_1_1_ARID = S_AXI_MEM_1_arid[0];
  assign S_AXI_MEM_1_1_ARLEN = S_AXI_MEM_1_arlen[7:0];
  assign S_AXI_MEM_1_1_ARLOCK = S_AXI_MEM_1_arlock[0];
  assign S_AXI_MEM_1_1_ARPROT = S_AXI_MEM_1_arprot[2:0];
  assign S_AXI_MEM_1_1_ARQOS = S_AXI_MEM_1_arqos[3:0];
  assign S_AXI_MEM_1_1_ARREGION = S_AXI_MEM_1_arregion[3:0];
  assign S_AXI_MEM_1_1_ARSIZE = S_AXI_MEM_1_arsize[2:0];
  assign S_AXI_MEM_1_1_ARVALID = S_AXI_MEM_1_arvalid;
  assign S_AXI_MEM_1_1_AWADDR = S_AXI_MEM_1_awaddr[31:0];
  assign S_AXI_MEM_1_1_AWBURST = S_AXI_MEM_1_awburst[1:0];
  assign S_AXI_MEM_1_1_AWCACHE = S_AXI_MEM_1_awcache[3:0];
  assign S_AXI_MEM_1_1_AWID = S_AXI_MEM_1_awid[0];
  assign S_AXI_MEM_1_1_AWLEN = S_AXI_MEM_1_awlen[7:0];
  assign S_AXI_MEM_1_1_AWLOCK = S_AXI_MEM_1_awlock[0];
  assign S_AXI_MEM_1_1_AWPROT = S_AXI_MEM_1_awprot[2:0];
  assign S_AXI_MEM_1_1_AWQOS = S_AXI_MEM_1_awqos[3:0];
  assign S_AXI_MEM_1_1_AWREGION = S_AXI_MEM_1_awregion[3:0];
  assign S_AXI_MEM_1_1_AWSIZE = S_AXI_MEM_1_awsize[2:0];
  assign S_AXI_MEM_1_1_AWVALID = S_AXI_MEM_1_awvalid;
  assign S_AXI_MEM_1_1_BREADY = S_AXI_MEM_1_bready;
  assign S_AXI_MEM_1_1_RREADY = S_AXI_MEM_1_rready;
  assign S_AXI_MEM_1_1_WDATA = S_AXI_MEM_1_wdata[511:0];
  assign S_AXI_MEM_1_1_WLAST = S_AXI_MEM_1_wlast;
  assign S_AXI_MEM_1_1_WSTRB = S_AXI_MEM_1_wstrb[63:0];
  assign S_AXI_MEM_1_1_WVALID = S_AXI_MEM_1_wvalid;
  assign S_AXI_MEM_1_ARADDR = S_AXI_MEM_0_araddr[31:0];
  assign S_AXI_MEM_1_ARBURST = S_AXI_MEM_0_arburst[1:0];
  assign S_AXI_MEM_1_ARCACHE = S_AXI_MEM_0_arcache[3:0];
  assign S_AXI_MEM_1_ARID = S_AXI_MEM_0_arid[0];
  assign S_AXI_MEM_1_ARLEN = S_AXI_MEM_0_arlen[7:0];
  assign S_AXI_MEM_1_ARLOCK = S_AXI_MEM_0_arlock[0];
  assign S_AXI_MEM_1_ARPROT = S_AXI_MEM_0_arprot[2:0];
  assign S_AXI_MEM_1_ARQOS = S_AXI_MEM_0_arqos[3:0];
  assign S_AXI_MEM_1_ARREGION = S_AXI_MEM_0_arregion[3:0];
  assign S_AXI_MEM_1_ARSIZE = S_AXI_MEM_0_arsize[2:0];
  assign S_AXI_MEM_1_ARVALID = S_AXI_MEM_0_arvalid;
  assign S_AXI_MEM_1_AWADDR = S_AXI_MEM_0_awaddr[31:0];
  assign S_AXI_MEM_1_AWBURST = S_AXI_MEM_0_awburst[1:0];
  assign S_AXI_MEM_1_AWCACHE = S_AXI_MEM_0_awcache[3:0];
  assign S_AXI_MEM_1_AWID = S_AXI_MEM_0_awid[0];
  assign S_AXI_MEM_1_AWLEN = S_AXI_MEM_0_awlen[7:0];
  assign S_AXI_MEM_1_AWLOCK = S_AXI_MEM_0_awlock[0];
  assign S_AXI_MEM_1_AWPROT = S_AXI_MEM_0_awprot[2:0];
  assign S_AXI_MEM_1_AWQOS = S_AXI_MEM_0_awqos[3:0];
  assign S_AXI_MEM_1_AWREGION = S_AXI_MEM_0_awregion[3:0];
  assign S_AXI_MEM_1_AWSIZE = S_AXI_MEM_0_awsize[2:0];
  assign S_AXI_MEM_1_AWVALID = S_AXI_MEM_0_awvalid;
  assign S_AXI_MEM_1_BREADY = S_AXI_MEM_0_bready;
  assign S_AXI_MEM_1_RREADY = S_AXI_MEM_0_rready;
  assign S_AXI_MEM_1_WDATA = S_AXI_MEM_0_wdata[511:0];
  assign S_AXI_MEM_1_WLAST = S_AXI_MEM_0_wlast;
  assign S_AXI_MEM_1_WSTRB = S_AXI_MEM_0_wstrb[63:0];
  assign S_AXI_MEM_1_WVALID = S_AXI_MEM_0_wvalid;
  assign S_AXI_MEM_1_arready = S_AXI_MEM_1_1_ARREADY;
  assign S_AXI_MEM_1_awready = S_AXI_MEM_1_1_AWREADY;
  assign S_AXI_MEM_1_bid[0] = S_AXI_MEM_1_1_BID;
  assign S_AXI_MEM_1_bresp[1:0] = S_AXI_MEM_1_1_BRESP;
  assign S_AXI_MEM_1_bvalid = S_AXI_MEM_1_1_BVALID;
  assign S_AXI_MEM_1_rdata[511:0] = S_AXI_MEM_1_1_RDATA;
  assign S_AXI_MEM_1_rid[0] = S_AXI_MEM_1_1_RID;
  assign S_AXI_MEM_1_rlast = S_AXI_MEM_1_1_RLAST;
  assign S_AXI_MEM_1_rresp[1:0] = S_AXI_MEM_1_1_RRESP;
  assign S_AXI_MEM_1_rvalid = S_AXI_MEM_1_1_RVALID;
  assign S_AXI_MEM_1_wready = S_AXI_MEM_1_1_WREADY;
  assign c0_ddr4_act_n_0 = mem_interface_c0_ddr4_act_n;
  assign c0_ddr4_adr_0[16:0] = mem_interface_c0_ddr4_adr;
  assign c0_ddr4_ba_0[1:0] = mem_interface_c0_ddr4_ba;
  assign c0_ddr4_bg_0[1:0] = mem_interface_c0_ddr4_bg;
  assign c0_ddr4_ck_c_0[0] = mem_interface_c0_ddr4_ck_c;
  assign c0_ddr4_ck_t_0[0] = mem_interface_c0_ddr4_ck_t;
  assign c0_ddr4_cke_0[0] = mem_interface_c0_ddr4_cke;
  assign c0_ddr4_cs_n_0[0] = mem_interface_c0_ddr4_cs_n;
  assign c0_ddr4_odt_0[0] = mem_interface_c0_ddr4_odt;
  assign c0_ddr4_reset_n_0 = mem_interface_c0_ddr4_reset_n;
  assign c0_sys_clk_n_0_1 = c0_sys_clk_n;
  assign c0_sys_clk_p_0_1 = c0_sys_clk_p;
  assign c1_ddr4_act_n = mem_interface_c1_ddr4_act_n;
  assign c1_ddr4_adr[16:0] = mem_interface_c1_ddr4_adr;
  assign c1_ddr4_ba[1:0] = mem_interface_c1_ddr4_ba;
  assign c1_ddr4_bg[1:0] = mem_interface_c1_ddr4_bg;
  assign c1_ddr4_ck_c[0] = mem_interface_c1_ddr4_ck_c;
  assign c1_ddr4_ck_t[0] = mem_interface_c1_ddr4_ck_t;
  assign c1_ddr4_cke[0] = mem_interface_c1_ddr4_cke;
  assign c1_ddr4_cs_n[0] = mem_interface_c1_ddr4_cs_n;
  assign c1_ddr4_odt[0] = mem_interface_c1_ddr4_odt;
  assign c1_ddr4_reset_n = mem_interface_c1_ddr4_reset_n;
  assign c1_sys_clk_n_1 = c1_sys_clk_n;
  assign c1_sys_clk_p_1 = c1_sys_clk_p;
  assign clk156_25_0_1 = user_clk;
  assign sys_reset_n_1 = sys_reset_n;
  assign user_resetn[0] = mem_interface_ARESETN;
  mem_interface_imp_OEQPBD mem_interface
       (.ARESETN(mem_interface_ARESETN),
        .MEM_AXI_0_araddr(S_AXI_MEM_1_ARADDR),
        .MEM_AXI_0_arburst(S_AXI_MEM_1_ARBURST),
        .MEM_AXI_0_arcache(S_AXI_MEM_1_ARCACHE),
        .MEM_AXI_0_arid(S_AXI_MEM_1_ARID),
        .MEM_AXI_0_arlen(S_AXI_MEM_1_ARLEN),
        .MEM_AXI_0_arlock(S_AXI_MEM_1_ARLOCK),
        .MEM_AXI_0_arprot(S_AXI_MEM_1_ARPROT),
        .MEM_AXI_0_arqos(S_AXI_MEM_1_ARQOS),
        .MEM_AXI_0_arready(S_AXI_MEM_1_ARREADY),
        .MEM_AXI_0_arregion(S_AXI_MEM_1_ARREGION),
        .MEM_AXI_0_arsize(S_AXI_MEM_1_ARSIZE),
        .MEM_AXI_0_arvalid(S_AXI_MEM_1_ARVALID),
        .MEM_AXI_0_awaddr(S_AXI_MEM_1_AWADDR),
        .MEM_AXI_0_awburst(S_AXI_MEM_1_AWBURST),
        .MEM_AXI_0_awcache(S_AXI_MEM_1_AWCACHE),
        .MEM_AXI_0_awid(S_AXI_MEM_1_AWID),
        .MEM_AXI_0_awlen(S_AXI_MEM_1_AWLEN),
        .MEM_AXI_0_awlock(S_AXI_MEM_1_AWLOCK),
        .MEM_AXI_0_awprot(S_AXI_MEM_1_AWPROT),
        .MEM_AXI_0_awqos(S_AXI_MEM_1_AWQOS),
        .MEM_AXI_0_awready(S_AXI_MEM_1_AWREADY),
        .MEM_AXI_0_awregion(S_AXI_MEM_1_AWREGION),
        .MEM_AXI_0_awsize(S_AXI_MEM_1_AWSIZE),
        .MEM_AXI_0_awvalid(S_AXI_MEM_1_AWVALID),
        .MEM_AXI_0_bid(S_AXI_MEM_1_BID),
        .MEM_AXI_0_bready(S_AXI_MEM_1_BREADY),
        .MEM_AXI_0_bresp(S_AXI_MEM_1_BRESP),
        .MEM_AXI_0_bvalid(S_AXI_MEM_1_BVALID),
        .MEM_AXI_0_rdata(S_AXI_MEM_1_RDATA),
        .MEM_AXI_0_rid(S_AXI_MEM_1_RID),
        .MEM_AXI_0_rlast(S_AXI_MEM_1_RLAST),
        .MEM_AXI_0_rready(S_AXI_MEM_1_RREADY),
        .MEM_AXI_0_rresp(S_AXI_MEM_1_RRESP),
        .MEM_AXI_0_rvalid(S_AXI_MEM_1_RVALID),
        .MEM_AXI_0_wdata(S_AXI_MEM_1_WDATA),
        .MEM_AXI_0_wlast(S_AXI_MEM_1_WLAST),
        .MEM_AXI_0_wready(S_AXI_MEM_1_WREADY),
        .MEM_AXI_0_wstrb(S_AXI_MEM_1_WSTRB),
        .MEM_AXI_0_wvalid(S_AXI_MEM_1_WVALID),
        .MEM_AXI_1_araddr(S_AXI_MEM_1_1_ARADDR),
        .MEM_AXI_1_arburst(S_AXI_MEM_1_1_ARBURST),
        .MEM_AXI_1_arcache(S_AXI_MEM_1_1_ARCACHE),
        .MEM_AXI_1_arid(S_AXI_MEM_1_1_ARID),
        .MEM_AXI_1_arlen(S_AXI_MEM_1_1_ARLEN),
        .MEM_AXI_1_arlock(S_AXI_MEM_1_1_ARLOCK),
        .MEM_AXI_1_arprot(S_AXI_MEM_1_1_ARPROT),
        .MEM_AXI_1_arqos(S_AXI_MEM_1_1_ARQOS),
        .MEM_AXI_1_arready(S_AXI_MEM_1_1_ARREADY),
        .MEM_AXI_1_arregion(S_AXI_MEM_1_1_ARREGION),
        .MEM_AXI_1_arsize(S_AXI_MEM_1_1_ARSIZE),
        .MEM_AXI_1_arvalid(S_AXI_MEM_1_1_ARVALID),
        .MEM_AXI_1_awaddr(S_AXI_MEM_1_1_AWADDR),
        .MEM_AXI_1_awburst(S_AXI_MEM_1_1_AWBURST),
        .MEM_AXI_1_awcache(S_AXI_MEM_1_1_AWCACHE),
        .MEM_AXI_1_awid(S_AXI_MEM_1_1_AWID),
        .MEM_AXI_1_awlen(S_AXI_MEM_1_1_AWLEN),
        .MEM_AXI_1_awlock(S_AXI_MEM_1_1_AWLOCK),
        .MEM_AXI_1_awprot(S_AXI_MEM_1_1_AWPROT),
        .MEM_AXI_1_awqos(S_AXI_MEM_1_1_AWQOS),
        .MEM_AXI_1_awready(S_AXI_MEM_1_1_AWREADY),
        .MEM_AXI_1_awregion(S_AXI_MEM_1_1_AWREGION),
        .MEM_AXI_1_awsize(S_AXI_MEM_1_1_AWSIZE),
        .MEM_AXI_1_awvalid(S_AXI_MEM_1_1_AWVALID),
        .MEM_AXI_1_bid(S_AXI_MEM_1_1_BID),
        .MEM_AXI_1_bready(S_AXI_MEM_1_1_BREADY),
        .MEM_AXI_1_bresp(S_AXI_MEM_1_1_BRESP),
        .MEM_AXI_1_bvalid(S_AXI_MEM_1_1_BVALID),
        .MEM_AXI_1_rdata(S_AXI_MEM_1_1_RDATA),
        .MEM_AXI_1_rid(S_AXI_MEM_1_1_RID),
        .MEM_AXI_1_rlast(S_AXI_MEM_1_1_RLAST),
        .MEM_AXI_1_rready(S_AXI_MEM_1_1_RREADY),
        .MEM_AXI_1_rresp(S_AXI_MEM_1_1_RRESP),
        .MEM_AXI_1_rvalid(S_AXI_MEM_1_1_RVALID),
        .MEM_AXI_1_wdata(S_AXI_MEM_1_1_WDATA),
        .MEM_AXI_1_wlast(S_AXI_MEM_1_1_WLAST),
        .MEM_AXI_1_wready(S_AXI_MEM_1_1_WREADY),
        .MEM_AXI_1_wstrb(S_AXI_MEM_1_1_WSTRB),
        .MEM_AXI_1_wvalid(S_AXI_MEM_1_1_WVALID),
        .S_ARESETN(sys_reset_n_1),
        .c0_ddr4_act_n(mem_interface_c0_ddr4_act_n),
        .c0_ddr4_adr(mem_interface_c0_ddr4_adr),
        .c0_ddr4_ba(mem_interface_c0_ddr4_ba),
        .c0_ddr4_bg(mem_interface_c0_ddr4_bg),
        .c0_ddr4_ck_c(mem_interface_c0_ddr4_ck_c),
        .c0_ddr4_ck_t(mem_interface_c0_ddr4_ck_t),
        .c0_ddr4_cke(mem_interface_c0_ddr4_cke),
        .c0_ddr4_cs_n(mem_interface_c0_ddr4_cs_n),
        .c0_ddr4_dg(c0_ddr4_dg_0[63:0]),
        .c0_ddr4_dm_dbi_n(c0_ddr4_dm_dbi_n_0[7:0]),
        .c0_ddr4_dqs_c(c0_ddr4_dqs_c_0[7:0]),
        .c0_ddr4_dqs_t(c0_ddr4_dqs_t_0[7:0]),
        .c0_ddr4_odt(mem_interface_c0_ddr4_odt),
        .c0_ddr4_reset_n(mem_interface_c0_ddr4_reset_n),
        .c0_sys_clk_n(c0_sys_clk_n_0_1),
        .c0_sys_clk_p(c0_sys_clk_p_0_1),
        .c1_ddr4_act_n(mem_interface_c1_ddr4_act_n),
        .c1_ddr4_adr(mem_interface_c1_ddr4_adr),
        .c1_ddr4_ba(mem_interface_c1_ddr4_ba),
        .c1_ddr4_bg(mem_interface_c1_ddr4_bg),
        .c1_ddr4_ck_c(mem_interface_c1_ddr4_ck_c),
        .c1_ddr4_ck_t(mem_interface_c1_ddr4_ck_t),
        .c1_ddr4_cke(mem_interface_c1_ddr4_cke),
        .c1_ddr4_cs_n(mem_interface_c1_ddr4_cs_n),
        .c1_ddr4_dm_dbi_n(c1_ddr4_dm_dbi_n[7:0]),
        .c1_ddr4_dq(c1_ddr4_dq[63:0]),
        .c1_ddr4_dqs_c(c1_ddr4_dqs_c[7:0]),
        .c1_ddr4_dqs_t(c1_ddr4_dqs_t[7:0]),
        .c1_ddr4_odt(mem_interface_c1_ddr4_odt),
        .c1_ddr4_reset_n(mem_interface_c1_ddr4_reset_n),
        .c1_sys_clk_n(c1_sys_clk_n_1),
        .c1_sys_clk_p(c1_sys_clk_p_1),
        .clk156_25(clk156_25_0_1),
        .sys_rst(sys_rst_1));
  mem_util_vector_logic_3_0 util_vector_logic_3
       (.Op1(sys_reset_n_1),
        .Res(sys_rst_1));
endmodule

module mem_interface_imp_OEQPBD
   (ARESETN,
    MEM_AXI_0_araddr,
    MEM_AXI_0_arburst,
    MEM_AXI_0_arcache,
    MEM_AXI_0_arid,
    MEM_AXI_0_arlen,
    MEM_AXI_0_arlock,
    MEM_AXI_0_arprot,
    MEM_AXI_0_arqos,
    MEM_AXI_0_arready,
    MEM_AXI_0_arregion,
    MEM_AXI_0_arsize,
    MEM_AXI_0_arvalid,
    MEM_AXI_0_awaddr,
    MEM_AXI_0_awburst,
    MEM_AXI_0_awcache,
    MEM_AXI_0_awid,
    MEM_AXI_0_awlen,
    MEM_AXI_0_awlock,
    MEM_AXI_0_awprot,
    MEM_AXI_0_awqos,
    MEM_AXI_0_awready,
    MEM_AXI_0_awregion,
    MEM_AXI_0_awsize,
    MEM_AXI_0_awvalid,
    MEM_AXI_0_bid,
    MEM_AXI_0_bready,
    MEM_AXI_0_bresp,
    MEM_AXI_0_bvalid,
    MEM_AXI_0_rdata,
    MEM_AXI_0_rid,
    MEM_AXI_0_rlast,
    MEM_AXI_0_rready,
    MEM_AXI_0_rresp,
    MEM_AXI_0_rvalid,
    MEM_AXI_0_wdata,
    MEM_AXI_0_wlast,
    MEM_AXI_0_wready,
    MEM_AXI_0_wstrb,
    MEM_AXI_0_wvalid,
    MEM_AXI_1_araddr,
    MEM_AXI_1_arburst,
    MEM_AXI_1_arcache,
    MEM_AXI_1_arid,
    MEM_AXI_1_arlen,
    MEM_AXI_1_arlock,
    MEM_AXI_1_arprot,
    MEM_AXI_1_arqos,
    MEM_AXI_1_arready,
    MEM_AXI_1_arregion,
    MEM_AXI_1_arsize,
    MEM_AXI_1_arvalid,
    MEM_AXI_1_awaddr,
    MEM_AXI_1_awburst,
    MEM_AXI_1_awcache,
    MEM_AXI_1_awid,
    MEM_AXI_1_awlen,
    MEM_AXI_1_awlock,
    MEM_AXI_1_awprot,
    MEM_AXI_1_awqos,
    MEM_AXI_1_awready,
    MEM_AXI_1_awregion,
    MEM_AXI_1_awsize,
    MEM_AXI_1_awvalid,
    MEM_AXI_1_bid,
    MEM_AXI_1_bready,
    MEM_AXI_1_bresp,
    MEM_AXI_1_bvalid,
    MEM_AXI_1_rdata,
    MEM_AXI_1_rid,
    MEM_AXI_1_rlast,
    MEM_AXI_1_rready,
    MEM_AXI_1_rresp,
    MEM_AXI_1_rvalid,
    MEM_AXI_1_wdata,
    MEM_AXI_1_wlast,
    MEM_AXI_1_wready,
    MEM_AXI_1_wstrb,
    MEM_AXI_1_wvalid,
    S_ARESETN,
    c0_ddr4_act_n,
    c0_ddr4_adr,
    c0_ddr4_ba,
    c0_ddr4_bg,
    c0_ddr4_ck_c,
    c0_ddr4_ck_t,
    c0_ddr4_cke,
    c0_ddr4_cs_n,
    c0_ddr4_dg,
    c0_ddr4_dm_dbi_n,
    c0_ddr4_dqs_c,
    c0_ddr4_dqs_t,
    c0_ddr4_odt,
    c0_ddr4_reset_n,
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
    clk156_25,
    sys_rst);
  output [0:0]ARESETN;
  input [31:0]MEM_AXI_0_araddr;
  input [1:0]MEM_AXI_0_arburst;
  input [3:0]MEM_AXI_0_arcache;
  input [0:0]MEM_AXI_0_arid;
  input [7:0]MEM_AXI_0_arlen;
  input [0:0]MEM_AXI_0_arlock;
  input [2:0]MEM_AXI_0_arprot;
  input [3:0]MEM_AXI_0_arqos;
  output MEM_AXI_0_arready;
  input [3:0]MEM_AXI_0_arregion;
  input [2:0]MEM_AXI_0_arsize;
  input MEM_AXI_0_arvalid;
  input [31:0]MEM_AXI_0_awaddr;
  input [1:0]MEM_AXI_0_awburst;
  input [3:0]MEM_AXI_0_awcache;
  input [0:0]MEM_AXI_0_awid;
  input [7:0]MEM_AXI_0_awlen;
  input [0:0]MEM_AXI_0_awlock;
  input [2:0]MEM_AXI_0_awprot;
  input [3:0]MEM_AXI_0_awqos;
  output MEM_AXI_0_awready;
  input [3:0]MEM_AXI_0_awregion;
  input [2:0]MEM_AXI_0_awsize;
  input MEM_AXI_0_awvalid;
  output [0:0]MEM_AXI_0_bid;
  input MEM_AXI_0_bready;
  output [1:0]MEM_AXI_0_bresp;
  output MEM_AXI_0_bvalid;
  output [511:0]MEM_AXI_0_rdata;
  output [0:0]MEM_AXI_0_rid;
  output MEM_AXI_0_rlast;
  input MEM_AXI_0_rready;
  output [1:0]MEM_AXI_0_rresp;
  output MEM_AXI_0_rvalid;
  input [511:0]MEM_AXI_0_wdata;
  input MEM_AXI_0_wlast;
  output MEM_AXI_0_wready;
  input [63:0]MEM_AXI_0_wstrb;
  input MEM_AXI_0_wvalid;
  input [31:0]MEM_AXI_1_araddr;
  input [1:0]MEM_AXI_1_arburst;
  input [3:0]MEM_AXI_1_arcache;
  input [0:0]MEM_AXI_1_arid;
  input [7:0]MEM_AXI_1_arlen;
  input [0:0]MEM_AXI_1_arlock;
  input [2:0]MEM_AXI_1_arprot;
  input [3:0]MEM_AXI_1_arqos;
  output MEM_AXI_1_arready;
  input [3:0]MEM_AXI_1_arregion;
  input [2:0]MEM_AXI_1_arsize;
  input MEM_AXI_1_arvalid;
  input [31:0]MEM_AXI_1_awaddr;
  input [1:0]MEM_AXI_1_awburst;
  input [3:0]MEM_AXI_1_awcache;
  input [0:0]MEM_AXI_1_awid;
  input [7:0]MEM_AXI_1_awlen;
  input [0:0]MEM_AXI_1_awlock;
  input [2:0]MEM_AXI_1_awprot;
  input [3:0]MEM_AXI_1_awqos;
  output MEM_AXI_1_awready;
  input [3:0]MEM_AXI_1_awregion;
  input [2:0]MEM_AXI_1_awsize;
  input MEM_AXI_1_awvalid;
  output [0:0]MEM_AXI_1_bid;
  input MEM_AXI_1_bready;
  output [1:0]MEM_AXI_1_bresp;
  output MEM_AXI_1_bvalid;
  output [511:0]MEM_AXI_1_rdata;
  output [0:0]MEM_AXI_1_rid;
  output MEM_AXI_1_rlast;
  input MEM_AXI_1_rready;
  output [1:0]MEM_AXI_1_rresp;
  output MEM_AXI_1_rvalid;
  input [511:0]MEM_AXI_1_wdata;
  input MEM_AXI_1_wlast;
  output MEM_AXI_1_wready;
  input [63:0]MEM_AXI_1_wstrb;
  input MEM_AXI_1_wvalid;
  input S_ARESETN;
  output c0_ddr4_act_n;
  output [16:0]c0_ddr4_adr;
  output [1:0]c0_ddr4_ba;
  output [1:0]c0_ddr4_bg;
  output [0:0]c0_ddr4_ck_c;
  output [0:0]c0_ddr4_ck_t;
  output [0:0]c0_ddr4_cke;
  output [0:0]c0_ddr4_cs_n;
  inout [63:0]c0_ddr4_dg;
  inout [7:0]c0_ddr4_dm_dbi_n;
  inout [7:0]c0_ddr4_dqs_c;
  inout [7:0]c0_ddr4_dqs_t;
  output [0:0]c0_ddr4_odt;
  output c0_ddr4_reset_n;
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
  input clk156_25;
  input [0:0]sys_rst;

  wire [0:0]M00_ARESETN_1;
  wire [31:0]MEM_AXI_0_1_ARADDR;
  wire [1:0]MEM_AXI_0_1_ARBURST;
  wire [3:0]MEM_AXI_0_1_ARCACHE;
  wire [0:0]MEM_AXI_0_1_ARID;
  wire [7:0]MEM_AXI_0_1_ARLEN;
  wire [0:0]MEM_AXI_0_1_ARLOCK;
  wire [2:0]MEM_AXI_0_1_ARPROT;
  wire [3:0]MEM_AXI_0_1_ARQOS;
  wire MEM_AXI_0_1_ARREADY;
  wire [3:0]MEM_AXI_0_1_ARREGION;
  wire [2:0]MEM_AXI_0_1_ARSIZE;
  wire MEM_AXI_0_1_ARVALID;
  wire [31:0]MEM_AXI_0_1_AWADDR;
  wire [1:0]MEM_AXI_0_1_AWBURST;
  wire [3:0]MEM_AXI_0_1_AWCACHE;
  wire [0:0]MEM_AXI_0_1_AWID;
  wire [7:0]MEM_AXI_0_1_AWLEN;
  wire [0:0]MEM_AXI_0_1_AWLOCK;
  wire [2:0]MEM_AXI_0_1_AWPROT;
  wire [3:0]MEM_AXI_0_1_AWQOS;
  wire MEM_AXI_0_1_AWREADY;
  wire [3:0]MEM_AXI_0_1_AWREGION;
  wire [2:0]MEM_AXI_0_1_AWSIZE;
  wire MEM_AXI_0_1_AWVALID;
  wire [0:0]MEM_AXI_0_1_BID;
  wire MEM_AXI_0_1_BREADY;
  wire [1:0]MEM_AXI_0_1_BRESP;
  wire MEM_AXI_0_1_BVALID;
  wire [511:0]MEM_AXI_0_1_RDATA;
  wire [0:0]MEM_AXI_0_1_RID;
  wire MEM_AXI_0_1_RLAST;
  wire MEM_AXI_0_1_RREADY;
  wire [1:0]MEM_AXI_0_1_RRESP;
  wire MEM_AXI_0_1_RVALID;
  wire [511:0]MEM_AXI_0_1_WDATA;
  wire MEM_AXI_0_1_WLAST;
  wire MEM_AXI_0_1_WREADY;
  wire [63:0]MEM_AXI_0_1_WSTRB;
  wire MEM_AXI_0_1_WVALID;
  wire [31:0]MEM_AXI_1_1_ARADDR;
  wire [1:0]MEM_AXI_1_1_ARBURST;
  wire [3:0]MEM_AXI_1_1_ARCACHE;
  wire [0:0]MEM_AXI_1_1_ARID;
  wire [7:0]MEM_AXI_1_1_ARLEN;
  wire [0:0]MEM_AXI_1_1_ARLOCK;
  wire [2:0]MEM_AXI_1_1_ARPROT;
  wire [3:0]MEM_AXI_1_1_ARQOS;
  wire MEM_AXI_1_1_ARREADY;
  wire [3:0]MEM_AXI_1_1_ARREGION;
  wire [2:0]MEM_AXI_1_1_ARSIZE;
  wire MEM_AXI_1_1_ARVALID;
  wire [31:0]MEM_AXI_1_1_AWADDR;
  wire [1:0]MEM_AXI_1_1_AWBURST;
  wire [3:0]MEM_AXI_1_1_AWCACHE;
  wire [0:0]MEM_AXI_1_1_AWID;
  wire [7:0]MEM_AXI_1_1_AWLEN;
  wire [0:0]MEM_AXI_1_1_AWLOCK;
  wire [2:0]MEM_AXI_1_1_AWPROT;
  wire [3:0]MEM_AXI_1_1_AWQOS;
  wire MEM_AXI_1_1_AWREADY;
  wire [3:0]MEM_AXI_1_1_AWREGION;
  wire [2:0]MEM_AXI_1_1_AWSIZE;
  wire MEM_AXI_1_1_AWVALID;
  wire [0:0]MEM_AXI_1_1_BID;
  wire MEM_AXI_1_1_BREADY;
  wire [1:0]MEM_AXI_1_1_BRESP;
  wire MEM_AXI_1_1_BVALID;
  wire [511:0]MEM_AXI_1_1_RDATA;
  wire [0:0]MEM_AXI_1_1_RID;
  wire MEM_AXI_1_1_RLAST;
  wire MEM_AXI_1_1_RREADY;
  wire [1:0]MEM_AXI_1_1_RRESP;
  wire MEM_AXI_1_1_RVALID;
  wire [511:0]MEM_AXI_1_1_WDATA;
  wire MEM_AXI_1_1_WLAST;
  wire MEM_AXI_1_1_WREADY;
  wire [63:0]MEM_AXI_1_1_WSTRB;
  wire MEM_AXI_1_1_WVALID;
  wire [7:0]Net;
  wire [7:0]Net1;
  wire [7:0]Net2;
  wire [63:0]Net3;
  wire [7:0]Net4;
  wire [7:0]Net5;
  wire [7:0]Net6;
  wire [63:0]Net7;
  wire S01_ARESETN_1;
  wire c1_sys_clk_n_1;
  wire c1_sys_clk_n_2;
  wire c1_sys_clk_p_1;
  wire c1_sys_clk_p_2;
  wire ddr4_0_c0_ddr4_ui_clk_sync_rst;
  wire [0:0]ddr4_0_c0_init_calib_complete;
  wire ddr4_0_c0_init_calib_complete1;
  wire ddr4_1_c0_ddr4_act_n;
  wire ddr4_1_c0_ddr4_act_n1;
  wire [16:0]ddr4_1_c0_ddr4_adr;
  wire [16:0]ddr4_1_c0_ddr4_adr1;
  wire [1:0]ddr4_1_c0_ddr4_ba;
  wire [1:0]ddr4_1_c0_ddr4_ba1;
  wire [1:0]ddr4_1_c0_ddr4_bg;
  wire [1:0]ddr4_1_c0_ddr4_bg1;
  wire [0:0]ddr4_1_c0_ddr4_ck_c;
  wire [0:0]ddr4_1_c0_ddr4_ck_c1;
  wire [0:0]ddr4_1_c0_ddr4_ck_t;
  wire [0:0]ddr4_1_c0_ddr4_ck_t1;
  wire [0:0]ddr4_1_c0_ddr4_cke;
  wire [0:0]ddr4_1_c0_ddr4_cke1;
  wire [0:0]ddr4_1_c0_ddr4_cs_n;
  wire [0:0]ddr4_1_c0_ddr4_cs_n1;
  wire [0:0]ddr4_1_c0_ddr4_odt;
  wire [0:0]ddr4_1_c0_ddr4_odt1;
  wire ddr4_1_c0_ddr4_reset_n;
  wire ddr4_1_c0_ddr4_reset_n1;
  wire ddr4_1_c0_ddr4_ui_clk;
  wire ddr4_1_c0_ddr4_ui_clk1;
  wire ddr4_1_c0_ddr4_ui_clk_sync_rst;
  wire ddr4_1_c0_init_calib_complete;
  wire m_axi_mm2s_aclk_1;
  wire [31:0]mem_interconnect_1_M00_AXI_ARADDR;
  wire [1:0]mem_interconnect_1_M00_AXI_ARBURST;
  wire [3:0]mem_interconnect_1_M00_AXI_ARCACHE;
  wire [0:0]mem_interconnect_1_M00_AXI_ARID;
  wire [7:0]mem_interconnect_1_M00_AXI_ARLEN;
  wire [0:0]mem_interconnect_1_M00_AXI_ARLOCK;
  wire [2:0]mem_interconnect_1_M00_AXI_ARPROT;
  wire [3:0]mem_interconnect_1_M00_AXI_ARQOS;
  wire mem_interconnect_1_M00_AXI_ARREADY;
  wire [2:0]mem_interconnect_1_M00_AXI_ARSIZE;
  wire mem_interconnect_1_M00_AXI_ARVALID;
  wire [31:0]mem_interconnect_1_M00_AXI_AWADDR;
  wire [1:0]mem_interconnect_1_M00_AXI_AWBURST;
  wire [3:0]mem_interconnect_1_M00_AXI_AWCACHE;
  wire [0:0]mem_interconnect_1_M00_AXI_AWID;
  wire [7:0]mem_interconnect_1_M00_AXI_AWLEN;
  wire [0:0]mem_interconnect_1_M00_AXI_AWLOCK;
  wire [2:0]mem_interconnect_1_M00_AXI_AWPROT;
  wire [3:0]mem_interconnect_1_M00_AXI_AWQOS;
  wire mem_interconnect_1_M00_AXI_AWREADY;
  wire [2:0]mem_interconnect_1_M00_AXI_AWSIZE;
  wire mem_interconnect_1_M00_AXI_AWVALID;
  wire [0:0]mem_interconnect_1_M00_AXI_BID;
  wire mem_interconnect_1_M00_AXI_BREADY;
  wire [1:0]mem_interconnect_1_M00_AXI_BRESP;
  wire mem_interconnect_1_M00_AXI_BVALID;
  wire [511:0]mem_interconnect_1_M00_AXI_RDATA;
  wire [0:0]mem_interconnect_1_M00_AXI_RID;
  wire mem_interconnect_1_M00_AXI_RLAST;
  wire mem_interconnect_1_M00_AXI_RREADY;
  wire [1:0]mem_interconnect_1_M00_AXI_RRESP;
  wire mem_interconnect_1_M00_AXI_RVALID;
  wire [511:0]mem_interconnect_1_M00_AXI_WDATA;
  wire mem_interconnect_1_M00_AXI_WLAST;
  wire mem_interconnect_1_M00_AXI_WREADY;
  wire [63:0]mem_interconnect_1_M00_AXI_WSTRB;
  wire mem_interconnect_1_M00_AXI_WVALID;
  wire [31:0]pcie_interconnect_M00_AXI_ARADDR;
  wire [1:0]pcie_interconnect_M00_AXI_ARBURST;
  wire [3:0]pcie_interconnect_M00_AXI_ARCACHE;
  wire [0:0]pcie_interconnect_M00_AXI_ARID;
  wire [7:0]pcie_interconnect_M00_AXI_ARLEN;
  wire [0:0]pcie_interconnect_M00_AXI_ARLOCK;
  wire [2:0]pcie_interconnect_M00_AXI_ARPROT;
  wire [3:0]pcie_interconnect_M00_AXI_ARQOS;
  wire pcie_interconnect_M00_AXI_ARREADY;
  wire [2:0]pcie_interconnect_M00_AXI_ARSIZE;
  wire pcie_interconnect_M00_AXI_ARVALID;
  wire [31:0]pcie_interconnect_M00_AXI_AWADDR;
  wire [1:0]pcie_interconnect_M00_AXI_AWBURST;
  wire [3:0]pcie_interconnect_M00_AXI_AWCACHE;
  wire [0:0]pcie_interconnect_M00_AXI_AWID;
  wire [7:0]pcie_interconnect_M00_AXI_AWLEN;
  wire [0:0]pcie_interconnect_M00_AXI_AWLOCK;
  wire [2:0]pcie_interconnect_M00_AXI_AWPROT;
  wire [3:0]pcie_interconnect_M00_AXI_AWQOS;
  wire pcie_interconnect_M00_AXI_AWREADY;
  wire [2:0]pcie_interconnect_M00_AXI_AWSIZE;
  wire pcie_interconnect_M00_AXI_AWVALID;
  wire [0:0]pcie_interconnect_M00_AXI_BID;
  wire pcie_interconnect_M00_AXI_BREADY;
  wire [1:0]pcie_interconnect_M00_AXI_BRESP;
  wire pcie_interconnect_M00_AXI_BVALID;
  wire [511:0]pcie_interconnect_M00_AXI_RDATA;
  wire [0:0]pcie_interconnect_M00_AXI_RID;
  wire pcie_interconnect_M00_AXI_RLAST;
  wire pcie_interconnect_M00_AXI_RREADY;
  wire [1:0]pcie_interconnect_M00_AXI_RRESP;
  wire pcie_interconnect_M00_AXI_RVALID;
  wire [511:0]pcie_interconnect_M00_AXI_WDATA;
  wire pcie_interconnect_M00_AXI_WLAST;
  wire pcie_interconnect_M00_AXI_WREADY;
  wire [63:0]pcie_interconnect_M00_AXI_WSTRB;
  wire pcie_interconnect_M00_AXI_WVALID;
  wire [0:0]proc_sys_reset_1_interconnect_aresetn;
  wire [0:0]sys_rst_1;
  wire [0:0]util_vector_logic_4_Res;

  assign ARESETN[0] = ddr4_0_c0_init_calib_complete;
  assign MEM_AXI_0_1_ARADDR = MEM_AXI_0_araddr[31:0];
  assign MEM_AXI_0_1_ARBURST = MEM_AXI_0_arburst[1:0];
  assign MEM_AXI_0_1_ARCACHE = MEM_AXI_0_arcache[3:0];
  assign MEM_AXI_0_1_ARID = MEM_AXI_0_arid[0];
  assign MEM_AXI_0_1_ARLEN = MEM_AXI_0_arlen[7:0];
  assign MEM_AXI_0_1_ARLOCK = MEM_AXI_0_arlock[0];
  assign MEM_AXI_0_1_ARPROT = MEM_AXI_0_arprot[2:0];
  assign MEM_AXI_0_1_ARQOS = MEM_AXI_0_arqos[3:0];
  assign MEM_AXI_0_1_ARREGION = MEM_AXI_0_arregion[3:0];
  assign MEM_AXI_0_1_ARSIZE = MEM_AXI_0_arsize[2:0];
  assign MEM_AXI_0_1_ARVALID = MEM_AXI_0_arvalid;
  assign MEM_AXI_0_1_AWADDR = MEM_AXI_0_awaddr[31:0];
  assign MEM_AXI_0_1_AWBURST = MEM_AXI_0_awburst[1:0];
  assign MEM_AXI_0_1_AWCACHE = MEM_AXI_0_awcache[3:0];
  assign MEM_AXI_0_1_AWID = MEM_AXI_0_awid[0];
  assign MEM_AXI_0_1_AWLEN = MEM_AXI_0_awlen[7:0];
  assign MEM_AXI_0_1_AWLOCK = MEM_AXI_0_awlock[0];
  assign MEM_AXI_0_1_AWPROT = MEM_AXI_0_awprot[2:0];
  assign MEM_AXI_0_1_AWQOS = MEM_AXI_0_awqos[3:0];
  assign MEM_AXI_0_1_AWREGION = MEM_AXI_0_awregion[3:0];
  assign MEM_AXI_0_1_AWSIZE = MEM_AXI_0_awsize[2:0];
  assign MEM_AXI_0_1_AWVALID = MEM_AXI_0_awvalid;
  assign MEM_AXI_0_1_BREADY = MEM_AXI_0_bready;
  assign MEM_AXI_0_1_RREADY = MEM_AXI_0_rready;
  assign MEM_AXI_0_1_WDATA = MEM_AXI_0_wdata[511:0];
  assign MEM_AXI_0_1_WLAST = MEM_AXI_0_wlast;
  assign MEM_AXI_0_1_WSTRB = MEM_AXI_0_wstrb[63:0];
  assign MEM_AXI_0_1_WVALID = MEM_AXI_0_wvalid;
  assign MEM_AXI_0_arready = MEM_AXI_0_1_ARREADY;
  assign MEM_AXI_0_awready = MEM_AXI_0_1_AWREADY;
  assign MEM_AXI_0_bid[0] = MEM_AXI_0_1_BID;
  assign MEM_AXI_0_bresp[1:0] = MEM_AXI_0_1_BRESP;
  assign MEM_AXI_0_bvalid = MEM_AXI_0_1_BVALID;
  assign MEM_AXI_0_rdata[511:0] = MEM_AXI_0_1_RDATA;
  assign MEM_AXI_0_rid[0] = MEM_AXI_0_1_RID;
  assign MEM_AXI_0_rlast = MEM_AXI_0_1_RLAST;
  assign MEM_AXI_0_rresp[1:0] = MEM_AXI_0_1_RRESP;
  assign MEM_AXI_0_rvalid = MEM_AXI_0_1_RVALID;
  assign MEM_AXI_0_wready = MEM_AXI_0_1_WREADY;
  assign MEM_AXI_1_1_ARADDR = MEM_AXI_1_araddr[31:0];
  assign MEM_AXI_1_1_ARBURST = MEM_AXI_1_arburst[1:0];
  assign MEM_AXI_1_1_ARCACHE = MEM_AXI_1_arcache[3:0];
  assign MEM_AXI_1_1_ARID = MEM_AXI_1_arid[0];
  assign MEM_AXI_1_1_ARLEN = MEM_AXI_1_arlen[7:0];
  assign MEM_AXI_1_1_ARLOCK = MEM_AXI_1_arlock[0];
  assign MEM_AXI_1_1_ARPROT = MEM_AXI_1_arprot[2:0];
  assign MEM_AXI_1_1_ARQOS = MEM_AXI_1_arqos[3:0];
  assign MEM_AXI_1_1_ARREGION = MEM_AXI_1_arregion[3:0];
  assign MEM_AXI_1_1_ARSIZE = MEM_AXI_1_arsize[2:0];
  assign MEM_AXI_1_1_ARVALID = MEM_AXI_1_arvalid;
  assign MEM_AXI_1_1_AWADDR = MEM_AXI_1_awaddr[31:0];
  assign MEM_AXI_1_1_AWBURST = MEM_AXI_1_awburst[1:0];
  assign MEM_AXI_1_1_AWCACHE = MEM_AXI_1_awcache[3:0];
  assign MEM_AXI_1_1_AWID = MEM_AXI_1_awid[0];
  assign MEM_AXI_1_1_AWLEN = MEM_AXI_1_awlen[7:0];
  assign MEM_AXI_1_1_AWLOCK = MEM_AXI_1_awlock[0];
  assign MEM_AXI_1_1_AWPROT = MEM_AXI_1_awprot[2:0];
  assign MEM_AXI_1_1_AWQOS = MEM_AXI_1_awqos[3:0];
  assign MEM_AXI_1_1_AWREGION = MEM_AXI_1_awregion[3:0];
  assign MEM_AXI_1_1_AWSIZE = MEM_AXI_1_awsize[2:0];
  assign MEM_AXI_1_1_AWVALID = MEM_AXI_1_awvalid;
  assign MEM_AXI_1_1_BREADY = MEM_AXI_1_bready;
  assign MEM_AXI_1_1_RREADY = MEM_AXI_1_rready;
  assign MEM_AXI_1_1_WDATA = MEM_AXI_1_wdata[511:0];
  assign MEM_AXI_1_1_WLAST = MEM_AXI_1_wlast;
  assign MEM_AXI_1_1_WSTRB = MEM_AXI_1_wstrb[63:0];
  assign MEM_AXI_1_1_WVALID = MEM_AXI_1_wvalid;
  assign MEM_AXI_1_arready = MEM_AXI_1_1_ARREADY;
  assign MEM_AXI_1_awready = MEM_AXI_1_1_AWREADY;
  assign MEM_AXI_1_bid[0] = MEM_AXI_1_1_BID;
  assign MEM_AXI_1_bresp[1:0] = MEM_AXI_1_1_BRESP;
  assign MEM_AXI_1_bvalid = MEM_AXI_1_1_BVALID;
  assign MEM_AXI_1_rdata[511:0] = MEM_AXI_1_1_RDATA;
  assign MEM_AXI_1_rid[0] = MEM_AXI_1_1_RID;
  assign MEM_AXI_1_rlast = MEM_AXI_1_1_RLAST;
  assign MEM_AXI_1_rresp[1:0] = MEM_AXI_1_1_RRESP;
  assign MEM_AXI_1_rvalid = MEM_AXI_1_1_RVALID;
  assign MEM_AXI_1_wready = MEM_AXI_1_1_WREADY;
  assign S01_ARESETN_1 = S_ARESETN;
  assign c0_ddr4_act_n = ddr4_1_c0_ddr4_act_n;
  assign c0_ddr4_adr[16:0] = ddr4_1_c0_ddr4_adr;
  assign c0_ddr4_ba[1:0] = ddr4_1_c0_ddr4_ba;
  assign c0_ddr4_bg[1:0] = ddr4_1_c0_ddr4_bg;
  assign c0_ddr4_ck_c[0] = ddr4_1_c0_ddr4_ck_c;
  assign c0_ddr4_ck_t[0] = ddr4_1_c0_ddr4_ck_t;
  assign c0_ddr4_cke[0] = ddr4_1_c0_ddr4_cke;
  assign c0_ddr4_cs_n[0] = ddr4_1_c0_ddr4_cs_n;
  assign c0_ddr4_odt[0] = ddr4_1_c0_ddr4_odt;
  assign c0_ddr4_reset_n = ddr4_1_c0_ddr4_reset_n;
  assign c1_ddr4_act_n = ddr4_1_c0_ddr4_act_n1;
  assign c1_ddr4_adr[16:0] = ddr4_1_c0_ddr4_adr1;
  assign c1_ddr4_ba[1:0] = ddr4_1_c0_ddr4_ba1;
  assign c1_ddr4_bg[1:0] = ddr4_1_c0_ddr4_bg1;
  assign c1_ddr4_ck_c[0] = ddr4_1_c0_ddr4_ck_c1;
  assign c1_ddr4_ck_t[0] = ddr4_1_c0_ddr4_ck_t1;
  assign c1_ddr4_cke[0] = ddr4_1_c0_ddr4_cke1;
  assign c1_ddr4_cs_n[0] = ddr4_1_c0_ddr4_cs_n1;
  assign c1_ddr4_odt[0] = ddr4_1_c0_ddr4_odt1;
  assign c1_ddr4_reset_n = ddr4_1_c0_ddr4_reset_n1;
  assign c1_sys_clk_n_1 = c0_sys_clk_n;
  assign c1_sys_clk_n_2 = c1_sys_clk_n;
  assign c1_sys_clk_p_1 = c0_sys_clk_p;
  assign c1_sys_clk_p_2 = c1_sys_clk_p;
  assign m_axi_mm2s_aclk_1 = clk156_25;
  assign sys_rst_1 = sys_rst[0];
  mem_ddr4_0_0 ddr4_0
       (.c0_ddr4_act_n(ddr4_1_c0_ddr4_act_n),
        .c0_ddr4_adr(ddr4_1_c0_ddr4_adr),
        .c0_ddr4_aresetn(M00_ARESETN_1),
        .c0_ddr4_ba(ddr4_1_c0_ddr4_ba),
        .c0_ddr4_bg(ddr4_1_c0_ddr4_bg),
        .c0_ddr4_ck_c(ddr4_1_c0_ddr4_ck_c),
        .c0_ddr4_ck_t(ddr4_1_c0_ddr4_ck_t),
        .c0_ddr4_cke(ddr4_1_c0_ddr4_cke),
        .c0_ddr4_cs_n(ddr4_1_c0_ddr4_cs_n),
        .c0_ddr4_dm_dbi_n(c0_ddr4_dm_dbi_n[7:0]),
        .c0_ddr4_dq(c0_ddr4_dg[63:0]),
        .c0_ddr4_dqs_c(c0_ddr4_dqs_c[7:0]),
        .c0_ddr4_dqs_t(c0_ddr4_dqs_t[7:0]),
        .c0_ddr4_odt(ddr4_1_c0_ddr4_odt),
        .c0_ddr4_reset_n(ddr4_1_c0_ddr4_reset_n),
        .c0_ddr4_s_axi_araddr(pcie_interconnect_M00_AXI_ARADDR),
        .c0_ddr4_s_axi_arburst(pcie_interconnect_M00_AXI_ARBURST),
        .c0_ddr4_s_axi_arcache(pcie_interconnect_M00_AXI_ARCACHE),
        .c0_ddr4_s_axi_arid(pcie_interconnect_M00_AXI_ARID),
        .c0_ddr4_s_axi_arlen(pcie_interconnect_M00_AXI_ARLEN),
        .c0_ddr4_s_axi_arlock(pcie_interconnect_M00_AXI_ARLOCK),
        .c0_ddr4_s_axi_arprot(pcie_interconnect_M00_AXI_ARPROT),
        .c0_ddr4_s_axi_arqos(pcie_interconnect_M00_AXI_ARQOS),
        .c0_ddr4_s_axi_arready(pcie_interconnect_M00_AXI_ARREADY),
        .c0_ddr4_s_axi_arsize(pcie_interconnect_M00_AXI_ARSIZE),
        .c0_ddr4_s_axi_arvalid(pcie_interconnect_M00_AXI_ARVALID),
        .c0_ddr4_s_axi_awaddr(pcie_interconnect_M00_AXI_AWADDR),
        .c0_ddr4_s_axi_awburst(pcie_interconnect_M00_AXI_AWBURST),
        .c0_ddr4_s_axi_awcache(pcie_interconnect_M00_AXI_AWCACHE),
        .c0_ddr4_s_axi_awid(pcie_interconnect_M00_AXI_AWID),
        .c0_ddr4_s_axi_awlen(pcie_interconnect_M00_AXI_AWLEN),
        .c0_ddr4_s_axi_awlock(pcie_interconnect_M00_AXI_AWLOCK),
        .c0_ddr4_s_axi_awprot(pcie_interconnect_M00_AXI_AWPROT),
        .c0_ddr4_s_axi_awqos(pcie_interconnect_M00_AXI_AWQOS),
        .c0_ddr4_s_axi_awready(pcie_interconnect_M00_AXI_AWREADY),
        .c0_ddr4_s_axi_awsize(pcie_interconnect_M00_AXI_AWSIZE),
        .c0_ddr4_s_axi_awvalid(pcie_interconnect_M00_AXI_AWVALID),
        .c0_ddr4_s_axi_bid(pcie_interconnect_M00_AXI_BID),
        .c0_ddr4_s_axi_bready(pcie_interconnect_M00_AXI_BREADY),
        .c0_ddr4_s_axi_bresp(pcie_interconnect_M00_AXI_BRESP),
        .c0_ddr4_s_axi_bvalid(pcie_interconnect_M00_AXI_BVALID),
        .c0_ddr4_s_axi_rdata(pcie_interconnect_M00_AXI_RDATA),
        .c0_ddr4_s_axi_rid(pcie_interconnect_M00_AXI_RID),
        .c0_ddr4_s_axi_rlast(pcie_interconnect_M00_AXI_RLAST),
        .c0_ddr4_s_axi_rready(pcie_interconnect_M00_AXI_RREADY),
        .c0_ddr4_s_axi_rresp(pcie_interconnect_M00_AXI_RRESP),
        .c0_ddr4_s_axi_rvalid(pcie_interconnect_M00_AXI_RVALID),
        .c0_ddr4_s_axi_wdata(pcie_interconnect_M00_AXI_WDATA),
        .c0_ddr4_s_axi_wlast(pcie_interconnect_M00_AXI_WLAST),
        .c0_ddr4_s_axi_wready(pcie_interconnect_M00_AXI_WREADY),
        .c0_ddr4_s_axi_wstrb(pcie_interconnect_M00_AXI_WSTRB),
        .c0_ddr4_s_axi_wvalid(pcie_interconnect_M00_AXI_WVALID),
        .c0_ddr4_ui_clk(ddr4_1_c0_ddr4_ui_clk),
        .c0_ddr4_ui_clk_sync_rst(ddr4_0_c0_ddr4_ui_clk_sync_rst),
        .c0_init_calib_complete(ddr4_0_c0_init_calib_complete1),
        .c0_sys_clk_n(c1_sys_clk_n_1),
        .c0_sys_clk_p(c1_sys_clk_p_1),
        .sys_rst(sys_rst_1));
  mem_ddr4_1_0 ddr4_1
       (.c0_ddr4_act_n(ddr4_1_c0_ddr4_act_n1),
        .c0_ddr4_adr(ddr4_1_c0_ddr4_adr1),
        .c0_ddr4_aresetn(M00_ARESETN_1),
        .c0_ddr4_ba(ddr4_1_c0_ddr4_ba1),
        .c0_ddr4_bg(ddr4_1_c0_ddr4_bg1),
        .c0_ddr4_ck_c(ddr4_1_c0_ddr4_ck_c1),
        .c0_ddr4_ck_t(ddr4_1_c0_ddr4_ck_t1),
        .c0_ddr4_cke(ddr4_1_c0_ddr4_cke1),
        .c0_ddr4_cs_n(ddr4_1_c0_ddr4_cs_n1),
        .c0_ddr4_dm_dbi_n(c1_ddr4_dm_dbi_n[7:0]),
        .c0_ddr4_dq(c1_ddr4_dq[63:0]),
        .c0_ddr4_dqs_c(c1_ddr4_dqs_c[7:0]),
        .c0_ddr4_dqs_t(c1_ddr4_dqs_t[7:0]),
        .c0_ddr4_odt(ddr4_1_c0_ddr4_odt1),
        .c0_ddr4_reset_n(ddr4_1_c0_ddr4_reset_n1),
        .c0_ddr4_s_axi_araddr(mem_interconnect_1_M00_AXI_ARADDR),
        .c0_ddr4_s_axi_arburst(mem_interconnect_1_M00_AXI_ARBURST),
        .c0_ddr4_s_axi_arcache(mem_interconnect_1_M00_AXI_ARCACHE),
        .c0_ddr4_s_axi_arid(mem_interconnect_1_M00_AXI_ARID),
        .c0_ddr4_s_axi_arlen(mem_interconnect_1_M00_AXI_ARLEN),
        .c0_ddr4_s_axi_arlock(mem_interconnect_1_M00_AXI_ARLOCK),
        .c0_ddr4_s_axi_arprot(mem_interconnect_1_M00_AXI_ARPROT),
        .c0_ddr4_s_axi_arqos(mem_interconnect_1_M00_AXI_ARQOS),
        .c0_ddr4_s_axi_arready(mem_interconnect_1_M00_AXI_ARREADY),
        .c0_ddr4_s_axi_arsize(mem_interconnect_1_M00_AXI_ARSIZE),
        .c0_ddr4_s_axi_arvalid(mem_interconnect_1_M00_AXI_ARVALID),
        .c0_ddr4_s_axi_awaddr(mem_interconnect_1_M00_AXI_AWADDR),
        .c0_ddr4_s_axi_awburst(mem_interconnect_1_M00_AXI_AWBURST),
        .c0_ddr4_s_axi_awcache(mem_interconnect_1_M00_AXI_AWCACHE),
        .c0_ddr4_s_axi_awid(mem_interconnect_1_M00_AXI_AWID),
        .c0_ddr4_s_axi_awlen(mem_interconnect_1_M00_AXI_AWLEN),
        .c0_ddr4_s_axi_awlock(mem_interconnect_1_M00_AXI_AWLOCK),
        .c0_ddr4_s_axi_awprot(mem_interconnect_1_M00_AXI_AWPROT),
        .c0_ddr4_s_axi_awqos(mem_interconnect_1_M00_AXI_AWQOS),
        .c0_ddr4_s_axi_awready(mem_interconnect_1_M00_AXI_AWREADY),
        .c0_ddr4_s_axi_awsize(mem_interconnect_1_M00_AXI_AWSIZE),
        .c0_ddr4_s_axi_awvalid(mem_interconnect_1_M00_AXI_AWVALID),
        .c0_ddr4_s_axi_bid(mem_interconnect_1_M00_AXI_BID),
        .c0_ddr4_s_axi_bready(mem_interconnect_1_M00_AXI_BREADY),
        .c0_ddr4_s_axi_bresp(mem_interconnect_1_M00_AXI_BRESP),
        .c0_ddr4_s_axi_bvalid(mem_interconnect_1_M00_AXI_BVALID),
        .c0_ddr4_s_axi_rdata(mem_interconnect_1_M00_AXI_RDATA),
        .c0_ddr4_s_axi_rid(mem_interconnect_1_M00_AXI_RID),
        .c0_ddr4_s_axi_rlast(mem_interconnect_1_M00_AXI_RLAST),
        .c0_ddr4_s_axi_rready(mem_interconnect_1_M00_AXI_RREADY),
        .c0_ddr4_s_axi_rresp(mem_interconnect_1_M00_AXI_RRESP),
        .c0_ddr4_s_axi_rvalid(mem_interconnect_1_M00_AXI_RVALID),
        .c0_ddr4_s_axi_wdata(mem_interconnect_1_M00_AXI_WDATA),
        .c0_ddr4_s_axi_wlast(mem_interconnect_1_M00_AXI_WLAST),
        .c0_ddr4_s_axi_wready(mem_interconnect_1_M00_AXI_WREADY),
        .c0_ddr4_s_axi_wstrb(mem_interconnect_1_M00_AXI_WSTRB),
        .c0_ddr4_s_axi_wvalid(mem_interconnect_1_M00_AXI_WVALID),
        .c0_ddr4_ui_clk(ddr4_1_c0_ddr4_ui_clk1),
        .c0_ddr4_ui_clk_sync_rst(ddr4_1_c0_ddr4_ui_clk_sync_rst),
        .c0_init_calib_complete(ddr4_1_c0_init_calib_complete),
        .c0_sys_clk_n(c1_sys_clk_n_2),
        .c0_sys_clk_p(c1_sys_clk_p_2),
        .sys_rst(sys_rst_1));
  mem_mem_interconnect_0 mem_interconnect
       (.ACLK(ddr4_1_c0_ddr4_ui_clk),
        .ARESETN(proc_sys_reset_1_interconnect_aresetn),
        .M00_ACLK(ddr4_1_c0_ddr4_ui_clk),
        .M00_ARESETN(M00_ARESETN_1),
        .M00_AXI_araddr(pcie_interconnect_M00_AXI_ARADDR),
        .M00_AXI_arburst(pcie_interconnect_M00_AXI_ARBURST),
        .M00_AXI_arcache(pcie_interconnect_M00_AXI_ARCACHE),
        .M00_AXI_arid(pcie_interconnect_M00_AXI_ARID),
        .M00_AXI_arlen(pcie_interconnect_M00_AXI_ARLEN),
        .M00_AXI_arlock(pcie_interconnect_M00_AXI_ARLOCK),
        .M00_AXI_arprot(pcie_interconnect_M00_AXI_ARPROT),
        .M00_AXI_arqos(pcie_interconnect_M00_AXI_ARQOS),
        .M00_AXI_arready(pcie_interconnect_M00_AXI_ARREADY),
        .M00_AXI_arsize(pcie_interconnect_M00_AXI_ARSIZE),
        .M00_AXI_arvalid(pcie_interconnect_M00_AXI_ARVALID),
        .M00_AXI_awaddr(pcie_interconnect_M00_AXI_AWADDR),
        .M00_AXI_awburst(pcie_interconnect_M00_AXI_AWBURST),
        .M00_AXI_awcache(pcie_interconnect_M00_AXI_AWCACHE),
        .M00_AXI_awid(pcie_interconnect_M00_AXI_AWID),
        .M00_AXI_awlen(pcie_interconnect_M00_AXI_AWLEN),
        .M00_AXI_awlock(pcie_interconnect_M00_AXI_AWLOCK),
        .M00_AXI_awprot(pcie_interconnect_M00_AXI_AWPROT),
        .M00_AXI_awqos(pcie_interconnect_M00_AXI_AWQOS),
        .M00_AXI_awready(pcie_interconnect_M00_AXI_AWREADY),
        .M00_AXI_awsize(pcie_interconnect_M00_AXI_AWSIZE),
        .M00_AXI_awvalid(pcie_interconnect_M00_AXI_AWVALID),
        .M00_AXI_bid(pcie_interconnect_M00_AXI_BID),
        .M00_AXI_bready(pcie_interconnect_M00_AXI_BREADY),
        .M00_AXI_bresp(pcie_interconnect_M00_AXI_BRESP),
        .M00_AXI_bvalid(pcie_interconnect_M00_AXI_BVALID),
        .M00_AXI_rdata(pcie_interconnect_M00_AXI_RDATA),
        .M00_AXI_rid(pcie_interconnect_M00_AXI_RID),
        .M00_AXI_rlast(pcie_interconnect_M00_AXI_RLAST),
        .M00_AXI_rready(pcie_interconnect_M00_AXI_RREADY),
        .M00_AXI_rresp(pcie_interconnect_M00_AXI_RRESP),
        .M00_AXI_rvalid(pcie_interconnect_M00_AXI_RVALID),
        .M00_AXI_wdata(pcie_interconnect_M00_AXI_WDATA),
        .M00_AXI_wlast(pcie_interconnect_M00_AXI_WLAST),
        .M00_AXI_wready(pcie_interconnect_M00_AXI_WREADY),
        .M00_AXI_wstrb(pcie_interconnect_M00_AXI_WSTRB),
        .M00_AXI_wvalid(pcie_interconnect_M00_AXI_WVALID),
        .S00_ACLK(m_axi_mm2s_aclk_1),
        .S00_ARESETN(S01_ARESETN_1),
        .S00_AXI_araddr(MEM_AXI_0_1_ARADDR),
        .S00_AXI_arburst(MEM_AXI_0_1_ARBURST),
        .S00_AXI_arcache(MEM_AXI_0_1_ARCACHE),
        .S00_AXI_arid(MEM_AXI_0_1_ARID),
        .S00_AXI_arlen(MEM_AXI_0_1_ARLEN),
        .S00_AXI_arlock(MEM_AXI_0_1_ARLOCK),
        .S00_AXI_arprot(MEM_AXI_0_1_ARPROT),
        .S00_AXI_arqos(MEM_AXI_0_1_ARQOS),
        .S00_AXI_arready(MEM_AXI_0_1_ARREADY),
        .S00_AXI_arregion(MEM_AXI_0_1_ARREGION),
        .S00_AXI_arsize(MEM_AXI_0_1_ARSIZE),
        .S00_AXI_arvalid(MEM_AXI_0_1_ARVALID),
        .S00_AXI_awaddr(MEM_AXI_0_1_AWADDR),
        .S00_AXI_awburst(MEM_AXI_0_1_AWBURST),
        .S00_AXI_awcache(MEM_AXI_0_1_AWCACHE),
        .S00_AXI_awid(MEM_AXI_0_1_AWID),
        .S00_AXI_awlen(MEM_AXI_0_1_AWLEN),
        .S00_AXI_awlock(MEM_AXI_0_1_AWLOCK),
        .S00_AXI_awprot(MEM_AXI_0_1_AWPROT),
        .S00_AXI_awqos(MEM_AXI_0_1_AWQOS),
        .S00_AXI_awready(MEM_AXI_0_1_AWREADY),
        .S00_AXI_awregion(MEM_AXI_0_1_AWREGION),
        .S00_AXI_awsize(MEM_AXI_0_1_AWSIZE),
        .S00_AXI_awvalid(MEM_AXI_0_1_AWVALID),
        .S00_AXI_bid(MEM_AXI_0_1_BID),
        .S00_AXI_bready(MEM_AXI_0_1_BREADY),
        .S00_AXI_bresp(MEM_AXI_0_1_BRESP),
        .S00_AXI_bvalid(MEM_AXI_0_1_BVALID),
        .S00_AXI_rdata(MEM_AXI_0_1_RDATA),
        .S00_AXI_rid(MEM_AXI_0_1_RID),
        .S00_AXI_rlast(MEM_AXI_0_1_RLAST),
        .S00_AXI_rready(MEM_AXI_0_1_RREADY),
        .S00_AXI_rresp(MEM_AXI_0_1_RRESP),
        .S00_AXI_rvalid(MEM_AXI_0_1_RVALID),
        .S00_AXI_wdata(MEM_AXI_0_1_WDATA),
        .S00_AXI_wlast(MEM_AXI_0_1_WLAST),
        .S00_AXI_wready(MEM_AXI_0_1_WREADY),
        .S00_AXI_wstrb(MEM_AXI_0_1_WSTRB),
        .S00_AXI_wvalid(MEM_AXI_0_1_WVALID));
  mem_mem_interconnect_1_0 mem_interconnect_1
       (.ACLK(ddr4_1_c0_ddr4_ui_clk1),
        .ARESETN(proc_sys_reset_1_interconnect_aresetn),
        .M00_ACLK(ddr4_1_c0_ddr4_ui_clk1),
        .M00_ARESETN(M00_ARESETN_1),
        .M00_AXI_araddr(mem_interconnect_1_M00_AXI_ARADDR),
        .M00_AXI_arburst(mem_interconnect_1_M00_AXI_ARBURST),
        .M00_AXI_arcache(mem_interconnect_1_M00_AXI_ARCACHE),
        .M00_AXI_arid(mem_interconnect_1_M00_AXI_ARID),
        .M00_AXI_arlen(mem_interconnect_1_M00_AXI_ARLEN),
        .M00_AXI_arlock(mem_interconnect_1_M00_AXI_ARLOCK),
        .M00_AXI_arprot(mem_interconnect_1_M00_AXI_ARPROT),
        .M00_AXI_arqos(mem_interconnect_1_M00_AXI_ARQOS),
        .M00_AXI_arready(mem_interconnect_1_M00_AXI_ARREADY),
        .M00_AXI_arsize(mem_interconnect_1_M00_AXI_ARSIZE),
        .M00_AXI_arvalid(mem_interconnect_1_M00_AXI_ARVALID),
        .M00_AXI_awaddr(mem_interconnect_1_M00_AXI_AWADDR),
        .M00_AXI_awburst(mem_interconnect_1_M00_AXI_AWBURST),
        .M00_AXI_awcache(mem_interconnect_1_M00_AXI_AWCACHE),
        .M00_AXI_awid(mem_interconnect_1_M00_AXI_AWID),
        .M00_AXI_awlen(mem_interconnect_1_M00_AXI_AWLEN),
        .M00_AXI_awlock(mem_interconnect_1_M00_AXI_AWLOCK),
        .M00_AXI_awprot(mem_interconnect_1_M00_AXI_AWPROT),
        .M00_AXI_awqos(mem_interconnect_1_M00_AXI_AWQOS),
        .M00_AXI_awready(mem_interconnect_1_M00_AXI_AWREADY),
        .M00_AXI_awsize(mem_interconnect_1_M00_AXI_AWSIZE),
        .M00_AXI_awvalid(mem_interconnect_1_M00_AXI_AWVALID),
        .M00_AXI_bid(mem_interconnect_1_M00_AXI_BID),
        .M00_AXI_bready(mem_interconnect_1_M00_AXI_BREADY),
        .M00_AXI_bresp(mem_interconnect_1_M00_AXI_BRESP),
        .M00_AXI_bvalid(mem_interconnect_1_M00_AXI_BVALID),
        .M00_AXI_rdata(mem_interconnect_1_M00_AXI_RDATA),
        .M00_AXI_rid(mem_interconnect_1_M00_AXI_RID),
        .M00_AXI_rlast(mem_interconnect_1_M00_AXI_RLAST),
        .M00_AXI_rready(mem_interconnect_1_M00_AXI_RREADY),
        .M00_AXI_rresp(mem_interconnect_1_M00_AXI_RRESP),
        .M00_AXI_rvalid(mem_interconnect_1_M00_AXI_RVALID),
        .M00_AXI_wdata(mem_interconnect_1_M00_AXI_WDATA),
        .M00_AXI_wlast(mem_interconnect_1_M00_AXI_WLAST),
        .M00_AXI_wready(mem_interconnect_1_M00_AXI_WREADY),
        .M00_AXI_wstrb(mem_interconnect_1_M00_AXI_WSTRB),
        .M00_AXI_wvalid(mem_interconnect_1_M00_AXI_WVALID),
        .S00_ACLK(m_axi_mm2s_aclk_1),
        .S00_ARESETN(S01_ARESETN_1),
        .S00_AXI_araddr(MEM_AXI_1_1_ARADDR),
        .S00_AXI_arburst(MEM_AXI_1_1_ARBURST),
        .S00_AXI_arcache(MEM_AXI_1_1_ARCACHE),
        .S00_AXI_arid(MEM_AXI_1_1_ARID),
        .S00_AXI_arlen(MEM_AXI_1_1_ARLEN),
        .S00_AXI_arlock(MEM_AXI_1_1_ARLOCK),
        .S00_AXI_arprot(MEM_AXI_1_1_ARPROT),
        .S00_AXI_arqos(MEM_AXI_1_1_ARQOS),
        .S00_AXI_arready(MEM_AXI_1_1_ARREADY),
        .S00_AXI_arregion(MEM_AXI_1_1_ARREGION),
        .S00_AXI_arsize(MEM_AXI_1_1_ARSIZE),
        .S00_AXI_arvalid(MEM_AXI_1_1_ARVALID),
        .S00_AXI_awaddr(MEM_AXI_1_1_AWADDR),
        .S00_AXI_awburst(MEM_AXI_1_1_AWBURST),
        .S00_AXI_awcache(MEM_AXI_1_1_AWCACHE),
        .S00_AXI_awid(MEM_AXI_1_1_AWID),
        .S00_AXI_awlen(MEM_AXI_1_1_AWLEN),
        .S00_AXI_awlock(MEM_AXI_1_1_AWLOCK),
        .S00_AXI_awprot(MEM_AXI_1_1_AWPROT),
        .S00_AXI_awqos(MEM_AXI_1_1_AWQOS),
        .S00_AXI_awready(MEM_AXI_1_1_AWREADY),
        .S00_AXI_awregion(MEM_AXI_1_1_AWREGION),
        .S00_AXI_awsize(MEM_AXI_1_1_AWSIZE),
        .S00_AXI_awvalid(MEM_AXI_1_1_AWVALID),
        .S00_AXI_bid(MEM_AXI_1_1_BID),
        .S00_AXI_bready(MEM_AXI_1_1_BREADY),
        .S00_AXI_bresp(MEM_AXI_1_1_BRESP),
        .S00_AXI_bvalid(MEM_AXI_1_1_BVALID),
        .S00_AXI_rdata(MEM_AXI_1_1_RDATA),
        .S00_AXI_rid(MEM_AXI_1_1_RID),
        .S00_AXI_rlast(MEM_AXI_1_1_RLAST),
        .S00_AXI_rready(MEM_AXI_1_1_RREADY),
        .S00_AXI_rresp(MEM_AXI_1_1_RRESP),
        .S00_AXI_rvalid(MEM_AXI_1_1_RVALID),
        .S00_AXI_wdata(MEM_AXI_1_1_WDATA),
        .S00_AXI_wlast(MEM_AXI_1_1_WLAST),
        .S00_AXI_wready(MEM_AXI_1_1_WREADY),
        .S00_AXI_wstrb(MEM_AXI_1_1_WSTRB),
        .S00_AXI_wvalid(MEM_AXI_1_1_WVALID));
  mem_proc_sys_reset_1_0 proc_sys_reset_1
       (.aux_reset_in(util_vector_logic_4_Res),
        .dcm_locked(1'b1),
        .ext_reset_in(ddr4_0_c0_init_calib_complete),
        .interconnect_aresetn(proc_sys_reset_1_interconnect_aresetn),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(M00_ARESETN_1),
        .slowest_sync_clk(ddr4_1_c0_ddr4_ui_clk));
  mem_util_vector_logic_4_0 util_vector_logic_4
       (.Op1(ddr4_0_c0_ddr4_ui_clk_sync_rst),
        .Op2(ddr4_1_c0_ddr4_ui_clk_sync_rst),
        .Res(util_vector_logic_4_Res));
  mem_util_vector_logic_5_0 util_vector_logic_5
       (.Op1(ddr4_0_c0_init_calib_complete1),
        .Op2(ddr4_1_c0_init_calib_complete),
        .Res(ddr4_0_c0_init_calib_complete));
endmodule

module mem_mem_interconnect_0
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arburst,
    M00_AXI_arcache,
    M00_AXI_arid,
    M00_AXI_arlen,
    M00_AXI_arlock,
    M00_AXI_arprot,
    M00_AXI_arqos,
    M00_AXI_arready,
    M00_AXI_arsize,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awburst,
    M00_AXI_awcache,
    M00_AXI_awid,
    M00_AXI_awlen,
    M00_AXI_awlock,
    M00_AXI_awprot,
    M00_AXI_awqos,
    M00_AXI_awready,
    M00_AXI_awsize,
    M00_AXI_awvalid,
    M00_AXI_bid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rid,
    M00_AXI_rlast,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wlast,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_araddr,
    S00_AXI_arburst,
    S00_AXI_arcache,
    S00_AXI_arid,
    S00_AXI_arlen,
    S00_AXI_arlock,
    S00_AXI_arprot,
    S00_AXI_arqos,
    S00_AXI_arready,
    S00_AXI_arregion,
    S00_AXI_arsize,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awburst,
    S00_AXI_awcache,
    S00_AXI_awid,
    S00_AXI_awlen,
    S00_AXI_awlock,
    S00_AXI_awprot,
    S00_AXI_awqos,
    S00_AXI_awready,
    S00_AXI_awregion,
    S00_AXI_awsize,
    S00_AXI_awvalid,
    S00_AXI_bid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rid,
    S00_AXI_rlast,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wlast,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid);
  input ACLK;
  input ARESETN;
  input M00_ACLK;
  input M00_ARESETN;
  output [31:0]M00_AXI_araddr;
  output [1:0]M00_AXI_arburst;
  output [3:0]M00_AXI_arcache;
  output [0:0]M00_AXI_arid;
  output [7:0]M00_AXI_arlen;
  output [0:0]M00_AXI_arlock;
  output [2:0]M00_AXI_arprot;
  output [3:0]M00_AXI_arqos;
  input M00_AXI_arready;
  output [2:0]M00_AXI_arsize;
  output M00_AXI_arvalid;
  output [31:0]M00_AXI_awaddr;
  output [1:0]M00_AXI_awburst;
  output [3:0]M00_AXI_awcache;
  output [0:0]M00_AXI_awid;
  output [7:0]M00_AXI_awlen;
  output [0:0]M00_AXI_awlock;
  output [2:0]M00_AXI_awprot;
  output [3:0]M00_AXI_awqos;
  input M00_AXI_awready;
  output [2:0]M00_AXI_awsize;
  output M00_AXI_awvalid;
  input [0:0]M00_AXI_bid;
  output M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input M00_AXI_bvalid;
  input [511:0]M00_AXI_rdata;
  input [0:0]M00_AXI_rid;
  input M00_AXI_rlast;
  output M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rvalid;
  output [511:0]M00_AXI_wdata;
  output M00_AXI_wlast;
  input M00_AXI_wready;
  output [63:0]M00_AXI_wstrb;
  output M00_AXI_wvalid;
  input S00_ACLK;
  input S00_ARESETN;
  input [31:0]S00_AXI_araddr;
  input [1:0]S00_AXI_arburst;
  input [3:0]S00_AXI_arcache;
  input [0:0]S00_AXI_arid;
  input [7:0]S00_AXI_arlen;
  input [0:0]S00_AXI_arlock;
  input [2:0]S00_AXI_arprot;
  input [3:0]S00_AXI_arqos;
  output S00_AXI_arready;
  input [3:0]S00_AXI_arregion;
  input [2:0]S00_AXI_arsize;
  input S00_AXI_arvalid;
  input [31:0]S00_AXI_awaddr;
  input [1:0]S00_AXI_awburst;
  input [3:0]S00_AXI_awcache;
  input [0:0]S00_AXI_awid;
  input [7:0]S00_AXI_awlen;
  input [0:0]S00_AXI_awlock;
  input [2:0]S00_AXI_awprot;
  input [3:0]S00_AXI_awqos;
  output S00_AXI_awready;
  input [3:0]S00_AXI_awregion;
  input [2:0]S00_AXI_awsize;
  input S00_AXI_awvalid;
  output [0:0]S00_AXI_bid;
  input S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output S00_AXI_bvalid;
  output [511:0]S00_AXI_rdata;
  output [0:0]S00_AXI_rid;
  output S00_AXI_rlast;
  input S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output S00_AXI_rvalid;
  input [511:0]S00_AXI_wdata;
  input S00_AXI_wlast;
  output S00_AXI_wready;
  input [63:0]S00_AXI_wstrb;
  input S00_AXI_wvalid;

  wire S00_ACLK_1;
  wire S00_ARESETN_1;
  wire mem_interconnect_ACLK_net;
  wire mem_interconnect_ARESETN_net;
  wire [31:0]mem_interconnect_to_s00_couplers_ARADDR;
  wire [1:0]mem_interconnect_to_s00_couplers_ARBURST;
  wire [3:0]mem_interconnect_to_s00_couplers_ARCACHE;
  wire [0:0]mem_interconnect_to_s00_couplers_ARID;
  wire [7:0]mem_interconnect_to_s00_couplers_ARLEN;
  wire [0:0]mem_interconnect_to_s00_couplers_ARLOCK;
  wire [2:0]mem_interconnect_to_s00_couplers_ARPROT;
  wire [3:0]mem_interconnect_to_s00_couplers_ARQOS;
  wire mem_interconnect_to_s00_couplers_ARREADY;
  wire [3:0]mem_interconnect_to_s00_couplers_ARREGION;
  wire [2:0]mem_interconnect_to_s00_couplers_ARSIZE;
  wire mem_interconnect_to_s00_couplers_ARVALID;
  wire [31:0]mem_interconnect_to_s00_couplers_AWADDR;
  wire [1:0]mem_interconnect_to_s00_couplers_AWBURST;
  wire [3:0]mem_interconnect_to_s00_couplers_AWCACHE;
  wire [0:0]mem_interconnect_to_s00_couplers_AWID;
  wire [7:0]mem_interconnect_to_s00_couplers_AWLEN;
  wire [0:0]mem_interconnect_to_s00_couplers_AWLOCK;
  wire [2:0]mem_interconnect_to_s00_couplers_AWPROT;
  wire [3:0]mem_interconnect_to_s00_couplers_AWQOS;
  wire mem_interconnect_to_s00_couplers_AWREADY;
  wire [3:0]mem_interconnect_to_s00_couplers_AWREGION;
  wire [2:0]mem_interconnect_to_s00_couplers_AWSIZE;
  wire mem_interconnect_to_s00_couplers_AWVALID;
  wire [0:0]mem_interconnect_to_s00_couplers_BID;
  wire mem_interconnect_to_s00_couplers_BREADY;
  wire [1:0]mem_interconnect_to_s00_couplers_BRESP;
  wire mem_interconnect_to_s00_couplers_BVALID;
  wire [511:0]mem_interconnect_to_s00_couplers_RDATA;
  wire [0:0]mem_interconnect_to_s00_couplers_RID;
  wire mem_interconnect_to_s00_couplers_RLAST;
  wire mem_interconnect_to_s00_couplers_RREADY;
  wire [1:0]mem_interconnect_to_s00_couplers_RRESP;
  wire mem_interconnect_to_s00_couplers_RVALID;
  wire [511:0]mem_interconnect_to_s00_couplers_WDATA;
  wire mem_interconnect_to_s00_couplers_WLAST;
  wire mem_interconnect_to_s00_couplers_WREADY;
  wire [63:0]mem_interconnect_to_s00_couplers_WSTRB;
  wire mem_interconnect_to_s00_couplers_WVALID;
  wire [31:0]s00_couplers_to_mem_interconnect_ARADDR;
  wire [1:0]s00_couplers_to_mem_interconnect_ARBURST;
  wire [3:0]s00_couplers_to_mem_interconnect_ARCACHE;
  wire [0:0]s00_couplers_to_mem_interconnect_ARID;
  wire [7:0]s00_couplers_to_mem_interconnect_ARLEN;
  wire [0:0]s00_couplers_to_mem_interconnect_ARLOCK;
  wire [2:0]s00_couplers_to_mem_interconnect_ARPROT;
  wire [3:0]s00_couplers_to_mem_interconnect_ARQOS;
  wire s00_couplers_to_mem_interconnect_ARREADY;
  wire [2:0]s00_couplers_to_mem_interconnect_ARSIZE;
  wire s00_couplers_to_mem_interconnect_ARVALID;
  wire [31:0]s00_couplers_to_mem_interconnect_AWADDR;
  wire [1:0]s00_couplers_to_mem_interconnect_AWBURST;
  wire [3:0]s00_couplers_to_mem_interconnect_AWCACHE;
  wire [0:0]s00_couplers_to_mem_interconnect_AWID;
  wire [7:0]s00_couplers_to_mem_interconnect_AWLEN;
  wire [0:0]s00_couplers_to_mem_interconnect_AWLOCK;
  wire [2:0]s00_couplers_to_mem_interconnect_AWPROT;
  wire [3:0]s00_couplers_to_mem_interconnect_AWQOS;
  wire s00_couplers_to_mem_interconnect_AWREADY;
  wire [2:0]s00_couplers_to_mem_interconnect_AWSIZE;
  wire s00_couplers_to_mem_interconnect_AWVALID;
  wire [0:0]s00_couplers_to_mem_interconnect_BID;
  wire s00_couplers_to_mem_interconnect_BREADY;
  wire [1:0]s00_couplers_to_mem_interconnect_BRESP;
  wire s00_couplers_to_mem_interconnect_BVALID;
  wire [511:0]s00_couplers_to_mem_interconnect_RDATA;
  wire [0:0]s00_couplers_to_mem_interconnect_RID;
  wire s00_couplers_to_mem_interconnect_RLAST;
  wire s00_couplers_to_mem_interconnect_RREADY;
  wire [1:0]s00_couplers_to_mem_interconnect_RRESP;
  wire s00_couplers_to_mem_interconnect_RVALID;
  wire [511:0]s00_couplers_to_mem_interconnect_WDATA;
  wire s00_couplers_to_mem_interconnect_WLAST;
  wire s00_couplers_to_mem_interconnect_WREADY;
  wire [63:0]s00_couplers_to_mem_interconnect_WSTRB;
  wire s00_couplers_to_mem_interconnect_WVALID;

  assign M00_AXI_araddr[31:0] = s00_couplers_to_mem_interconnect_ARADDR;
  assign M00_AXI_arburst[1:0] = s00_couplers_to_mem_interconnect_ARBURST;
  assign M00_AXI_arcache[3:0] = s00_couplers_to_mem_interconnect_ARCACHE;
  assign M00_AXI_arid[0] = s00_couplers_to_mem_interconnect_ARID;
  assign M00_AXI_arlen[7:0] = s00_couplers_to_mem_interconnect_ARLEN;
  assign M00_AXI_arlock[0] = s00_couplers_to_mem_interconnect_ARLOCK;
  assign M00_AXI_arprot[2:0] = s00_couplers_to_mem_interconnect_ARPROT;
  assign M00_AXI_arqos[3:0] = s00_couplers_to_mem_interconnect_ARQOS;
  assign M00_AXI_arsize[2:0] = s00_couplers_to_mem_interconnect_ARSIZE;
  assign M00_AXI_arvalid = s00_couplers_to_mem_interconnect_ARVALID;
  assign M00_AXI_awaddr[31:0] = s00_couplers_to_mem_interconnect_AWADDR;
  assign M00_AXI_awburst[1:0] = s00_couplers_to_mem_interconnect_AWBURST;
  assign M00_AXI_awcache[3:0] = s00_couplers_to_mem_interconnect_AWCACHE;
  assign M00_AXI_awid[0] = s00_couplers_to_mem_interconnect_AWID;
  assign M00_AXI_awlen[7:0] = s00_couplers_to_mem_interconnect_AWLEN;
  assign M00_AXI_awlock[0] = s00_couplers_to_mem_interconnect_AWLOCK;
  assign M00_AXI_awprot[2:0] = s00_couplers_to_mem_interconnect_AWPROT;
  assign M00_AXI_awqos[3:0] = s00_couplers_to_mem_interconnect_AWQOS;
  assign M00_AXI_awsize[2:0] = s00_couplers_to_mem_interconnect_AWSIZE;
  assign M00_AXI_awvalid = s00_couplers_to_mem_interconnect_AWVALID;
  assign M00_AXI_bready = s00_couplers_to_mem_interconnect_BREADY;
  assign M00_AXI_rready = s00_couplers_to_mem_interconnect_RREADY;
  assign M00_AXI_wdata[511:0] = s00_couplers_to_mem_interconnect_WDATA;
  assign M00_AXI_wlast = s00_couplers_to_mem_interconnect_WLAST;
  assign M00_AXI_wstrb[63:0] = s00_couplers_to_mem_interconnect_WSTRB;
  assign M00_AXI_wvalid = s00_couplers_to_mem_interconnect_WVALID;
  assign S00_ACLK_1 = S00_ACLK;
  assign S00_ARESETN_1 = S00_ARESETN;
  assign S00_AXI_arready = mem_interconnect_to_s00_couplers_ARREADY;
  assign S00_AXI_awready = mem_interconnect_to_s00_couplers_AWREADY;
  assign S00_AXI_bid[0] = mem_interconnect_to_s00_couplers_BID;
  assign S00_AXI_bresp[1:0] = mem_interconnect_to_s00_couplers_BRESP;
  assign S00_AXI_bvalid = mem_interconnect_to_s00_couplers_BVALID;
  assign S00_AXI_rdata[511:0] = mem_interconnect_to_s00_couplers_RDATA;
  assign S00_AXI_rid[0] = mem_interconnect_to_s00_couplers_RID;
  assign S00_AXI_rlast = mem_interconnect_to_s00_couplers_RLAST;
  assign S00_AXI_rresp[1:0] = mem_interconnect_to_s00_couplers_RRESP;
  assign S00_AXI_rvalid = mem_interconnect_to_s00_couplers_RVALID;
  assign S00_AXI_wready = mem_interconnect_to_s00_couplers_WREADY;
  assign mem_interconnect_ACLK_net = M00_ACLK;
  assign mem_interconnect_ARESETN_net = M00_ARESETN;
  assign mem_interconnect_to_s00_couplers_ARADDR = S00_AXI_araddr[31:0];
  assign mem_interconnect_to_s00_couplers_ARBURST = S00_AXI_arburst[1:0];
  assign mem_interconnect_to_s00_couplers_ARCACHE = S00_AXI_arcache[3:0];
  assign mem_interconnect_to_s00_couplers_ARID = S00_AXI_arid[0];
  assign mem_interconnect_to_s00_couplers_ARLEN = S00_AXI_arlen[7:0];
  assign mem_interconnect_to_s00_couplers_ARLOCK = S00_AXI_arlock[0];
  assign mem_interconnect_to_s00_couplers_ARPROT = S00_AXI_arprot[2:0];
  assign mem_interconnect_to_s00_couplers_ARQOS = S00_AXI_arqos[3:0];
  assign mem_interconnect_to_s00_couplers_ARREGION = S00_AXI_arregion[3:0];
  assign mem_interconnect_to_s00_couplers_ARSIZE = S00_AXI_arsize[2:0];
  assign mem_interconnect_to_s00_couplers_ARVALID = S00_AXI_arvalid;
  assign mem_interconnect_to_s00_couplers_AWADDR = S00_AXI_awaddr[31:0];
  assign mem_interconnect_to_s00_couplers_AWBURST = S00_AXI_awburst[1:0];
  assign mem_interconnect_to_s00_couplers_AWCACHE = S00_AXI_awcache[3:0];
  assign mem_interconnect_to_s00_couplers_AWID = S00_AXI_awid[0];
  assign mem_interconnect_to_s00_couplers_AWLEN = S00_AXI_awlen[7:0];
  assign mem_interconnect_to_s00_couplers_AWLOCK = S00_AXI_awlock[0];
  assign mem_interconnect_to_s00_couplers_AWPROT = S00_AXI_awprot[2:0];
  assign mem_interconnect_to_s00_couplers_AWQOS = S00_AXI_awqos[3:0];
  assign mem_interconnect_to_s00_couplers_AWREGION = S00_AXI_awregion[3:0];
  assign mem_interconnect_to_s00_couplers_AWSIZE = S00_AXI_awsize[2:0];
  assign mem_interconnect_to_s00_couplers_AWVALID = S00_AXI_awvalid;
  assign mem_interconnect_to_s00_couplers_BREADY = S00_AXI_bready;
  assign mem_interconnect_to_s00_couplers_RREADY = S00_AXI_rready;
  assign mem_interconnect_to_s00_couplers_WDATA = S00_AXI_wdata[511:0];
  assign mem_interconnect_to_s00_couplers_WLAST = S00_AXI_wlast;
  assign mem_interconnect_to_s00_couplers_WSTRB = S00_AXI_wstrb[63:0];
  assign mem_interconnect_to_s00_couplers_WVALID = S00_AXI_wvalid;
  assign s00_couplers_to_mem_interconnect_ARREADY = M00_AXI_arready;
  assign s00_couplers_to_mem_interconnect_AWREADY = M00_AXI_awready;
  assign s00_couplers_to_mem_interconnect_BID = M00_AXI_bid[0];
  assign s00_couplers_to_mem_interconnect_BRESP = M00_AXI_bresp[1:0];
  assign s00_couplers_to_mem_interconnect_BVALID = M00_AXI_bvalid;
  assign s00_couplers_to_mem_interconnect_RDATA = M00_AXI_rdata[511:0];
  assign s00_couplers_to_mem_interconnect_RID = M00_AXI_rid[0];
  assign s00_couplers_to_mem_interconnect_RLAST = M00_AXI_rlast;
  assign s00_couplers_to_mem_interconnect_RRESP = M00_AXI_rresp[1:0];
  assign s00_couplers_to_mem_interconnect_RVALID = M00_AXI_rvalid;
  assign s00_couplers_to_mem_interconnect_WREADY = M00_AXI_wready;
  s00_couplers_imp_NACBYP s00_couplers
       (.M_ACLK(mem_interconnect_ACLK_net),
        .M_ARESETN(mem_interconnect_ARESETN_net),
        .M_AXI_araddr(s00_couplers_to_mem_interconnect_ARADDR),
        .M_AXI_arburst(s00_couplers_to_mem_interconnect_ARBURST),
        .M_AXI_arcache(s00_couplers_to_mem_interconnect_ARCACHE),
        .M_AXI_arid(s00_couplers_to_mem_interconnect_ARID),
        .M_AXI_arlen(s00_couplers_to_mem_interconnect_ARLEN),
        .M_AXI_arlock(s00_couplers_to_mem_interconnect_ARLOCK),
        .M_AXI_arprot(s00_couplers_to_mem_interconnect_ARPROT),
        .M_AXI_arqos(s00_couplers_to_mem_interconnect_ARQOS),
        .M_AXI_arready(s00_couplers_to_mem_interconnect_ARREADY),
        .M_AXI_arsize(s00_couplers_to_mem_interconnect_ARSIZE),
        .M_AXI_arvalid(s00_couplers_to_mem_interconnect_ARVALID),
        .M_AXI_awaddr(s00_couplers_to_mem_interconnect_AWADDR),
        .M_AXI_awburst(s00_couplers_to_mem_interconnect_AWBURST),
        .M_AXI_awcache(s00_couplers_to_mem_interconnect_AWCACHE),
        .M_AXI_awid(s00_couplers_to_mem_interconnect_AWID),
        .M_AXI_awlen(s00_couplers_to_mem_interconnect_AWLEN),
        .M_AXI_awlock(s00_couplers_to_mem_interconnect_AWLOCK),
        .M_AXI_awprot(s00_couplers_to_mem_interconnect_AWPROT),
        .M_AXI_awqos(s00_couplers_to_mem_interconnect_AWQOS),
        .M_AXI_awready(s00_couplers_to_mem_interconnect_AWREADY),
        .M_AXI_awsize(s00_couplers_to_mem_interconnect_AWSIZE),
        .M_AXI_awvalid(s00_couplers_to_mem_interconnect_AWVALID),
        .M_AXI_bid(s00_couplers_to_mem_interconnect_BID),
        .M_AXI_bready(s00_couplers_to_mem_interconnect_BREADY),
        .M_AXI_bresp(s00_couplers_to_mem_interconnect_BRESP),
        .M_AXI_bvalid(s00_couplers_to_mem_interconnect_BVALID),
        .M_AXI_rdata(s00_couplers_to_mem_interconnect_RDATA),
        .M_AXI_rid(s00_couplers_to_mem_interconnect_RID),
        .M_AXI_rlast(s00_couplers_to_mem_interconnect_RLAST),
        .M_AXI_rready(s00_couplers_to_mem_interconnect_RREADY),
        .M_AXI_rresp(s00_couplers_to_mem_interconnect_RRESP),
        .M_AXI_rvalid(s00_couplers_to_mem_interconnect_RVALID),
        .M_AXI_wdata(s00_couplers_to_mem_interconnect_WDATA),
        .M_AXI_wlast(s00_couplers_to_mem_interconnect_WLAST),
        .M_AXI_wready(s00_couplers_to_mem_interconnect_WREADY),
        .M_AXI_wstrb(s00_couplers_to_mem_interconnect_WSTRB),
        .M_AXI_wvalid(s00_couplers_to_mem_interconnect_WVALID),
        .S_ACLK(S00_ACLK_1),
        .S_ARESETN(S00_ARESETN_1),
        .S_AXI_araddr(mem_interconnect_to_s00_couplers_ARADDR),
        .S_AXI_arburst(mem_interconnect_to_s00_couplers_ARBURST),
        .S_AXI_arcache(mem_interconnect_to_s00_couplers_ARCACHE),
        .S_AXI_arid(mem_interconnect_to_s00_couplers_ARID),
        .S_AXI_arlen(mem_interconnect_to_s00_couplers_ARLEN),
        .S_AXI_arlock(mem_interconnect_to_s00_couplers_ARLOCK),
        .S_AXI_arprot(mem_interconnect_to_s00_couplers_ARPROT),
        .S_AXI_arqos(mem_interconnect_to_s00_couplers_ARQOS),
        .S_AXI_arready(mem_interconnect_to_s00_couplers_ARREADY),
        .S_AXI_arregion(mem_interconnect_to_s00_couplers_ARREGION),
        .S_AXI_arsize(mem_interconnect_to_s00_couplers_ARSIZE),
        .S_AXI_arvalid(mem_interconnect_to_s00_couplers_ARVALID),
        .S_AXI_awaddr(mem_interconnect_to_s00_couplers_AWADDR),
        .S_AXI_awburst(mem_interconnect_to_s00_couplers_AWBURST),
        .S_AXI_awcache(mem_interconnect_to_s00_couplers_AWCACHE),
        .S_AXI_awid(mem_interconnect_to_s00_couplers_AWID),
        .S_AXI_awlen(mem_interconnect_to_s00_couplers_AWLEN),
        .S_AXI_awlock(mem_interconnect_to_s00_couplers_AWLOCK),
        .S_AXI_awprot(mem_interconnect_to_s00_couplers_AWPROT),
        .S_AXI_awqos(mem_interconnect_to_s00_couplers_AWQOS),
        .S_AXI_awready(mem_interconnect_to_s00_couplers_AWREADY),
        .S_AXI_awregion(mem_interconnect_to_s00_couplers_AWREGION),
        .S_AXI_awsize(mem_interconnect_to_s00_couplers_AWSIZE),
        .S_AXI_awvalid(mem_interconnect_to_s00_couplers_AWVALID),
        .S_AXI_bid(mem_interconnect_to_s00_couplers_BID),
        .S_AXI_bready(mem_interconnect_to_s00_couplers_BREADY),
        .S_AXI_bresp(mem_interconnect_to_s00_couplers_BRESP),
        .S_AXI_bvalid(mem_interconnect_to_s00_couplers_BVALID),
        .S_AXI_rdata(mem_interconnect_to_s00_couplers_RDATA),
        .S_AXI_rid(mem_interconnect_to_s00_couplers_RID),
        .S_AXI_rlast(mem_interconnect_to_s00_couplers_RLAST),
        .S_AXI_rready(mem_interconnect_to_s00_couplers_RREADY),
        .S_AXI_rresp(mem_interconnect_to_s00_couplers_RRESP),
        .S_AXI_rvalid(mem_interconnect_to_s00_couplers_RVALID),
        .S_AXI_wdata(mem_interconnect_to_s00_couplers_WDATA),
        .S_AXI_wlast(mem_interconnect_to_s00_couplers_WLAST),
        .S_AXI_wready(mem_interconnect_to_s00_couplers_WREADY),
        .S_AXI_wstrb(mem_interconnect_to_s00_couplers_WSTRB),
        .S_AXI_wvalid(mem_interconnect_to_s00_couplers_WVALID));
endmodule

module mem_mem_interconnect_1_0
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arburst,
    M00_AXI_arcache,
    M00_AXI_arid,
    M00_AXI_arlen,
    M00_AXI_arlock,
    M00_AXI_arprot,
    M00_AXI_arqos,
    M00_AXI_arready,
    M00_AXI_arsize,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awburst,
    M00_AXI_awcache,
    M00_AXI_awid,
    M00_AXI_awlen,
    M00_AXI_awlock,
    M00_AXI_awprot,
    M00_AXI_awqos,
    M00_AXI_awready,
    M00_AXI_awsize,
    M00_AXI_awvalid,
    M00_AXI_bid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rid,
    M00_AXI_rlast,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wlast,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_araddr,
    S00_AXI_arburst,
    S00_AXI_arcache,
    S00_AXI_arid,
    S00_AXI_arlen,
    S00_AXI_arlock,
    S00_AXI_arprot,
    S00_AXI_arqos,
    S00_AXI_arready,
    S00_AXI_arregion,
    S00_AXI_arsize,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awburst,
    S00_AXI_awcache,
    S00_AXI_awid,
    S00_AXI_awlen,
    S00_AXI_awlock,
    S00_AXI_awprot,
    S00_AXI_awqos,
    S00_AXI_awready,
    S00_AXI_awregion,
    S00_AXI_awsize,
    S00_AXI_awvalid,
    S00_AXI_bid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rid,
    S00_AXI_rlast,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wlast,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid);
  input ACLK;
  input ARESETN;
  input M00_ACLK;
  input M00_ARESETN;
  output [31:0]M00_AXI_araddr;
  output [1:0]M00_AXI_arburst;
  output [3:0]M00_AXI_arcache;
  output [0:0]M00_AXI_arid;
  output [7:0]M00_AXI_arlen;
  output [0:0]M00_AXI_arlock;
  output [2:0]M00_AXI_arprot;
  output [3:0]M00_AXI_arqos;
  input M00_AXI_arready;
  output [2:0]M00_AXI_arsize;
  output M00_AXI_arvalid;
  output [31:0]M00_AXI_awaddr;
  output [1:0]M00_AXI_awburst;
  output [3:0]M00_AXI_awcache;
  output [0:0]M00_AXI_awid;
  output [7:0]M00_AXI_awlen;
  output [0:0]M00_AXI_awlock;
  output [2:0]M00_AXI_awprot;
  output [3:0]M00_AXI_awqos;
  input M00_AXI_awready;
  output [2:0]M00_AXI_awsize;
  output M00_AXI_awvalid;
  input [0:0]M00_AXI_bid;
  output M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input M00_AXI_bvalid;
  input [511:0]M00_AXI_rdata;
  input [0:0]M00_AXI_rid;
  input M00_AXI_rlast;
  output M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rvalid;
  output [511:0]M00_AXI_wdata;
  output M00_AXI_wlast;
  input M00_AXI_wready;
  output [63:0]M00_AXI_wstrb;
  output M00_AXI_wvalid;
  input S00_ACLK;
  input S00_ARESETN;
  input [31:0]S00_AXI_araddr;
  input [1:0]S00_AXI_arburst;
  input [3:0]S00_AXI_arcache;
  input [0:0]S00_AXI_arid;
  input [7:0]S00_AXI_arlen;
  input [0:0]S00_AXI_arlock;
  input [2:0]S00_AXI_arprot;
  input [3:0]S00_AXI_arqos;
  output S00_AXI_arready;
  input [3:0]S00_AXI_arregion;
  input [2:0]S00_AXI_arsize;
  input S00_AXI_arvalid;
  input [31:0]S00_AXI_awaddr;
  input [1:0]S00_AXI_awburst;
  input [3:0]S00_AXI_awcache;
  input [0:0]S00_AXI_awid;
  input [7:0]S00_AXI_awlen;
  input [0:0]S00_AXI_awlock;
  input [2:0]S00_AXI_awprot;
  input [3:0]S00_AXI_awqos;
  output S00_AXI_awready;
  input [3:0]S00_AXI_awregion;
  input [2:0]S00_AXI_awsize;
  input S00_AXI_awvalid;
  output [0:0]S00_AXI_bid;
  input S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output S00_AXI_bvalid;
  output [511:0]S00_AXI_rdata;
  output [0:0]S00_AXI_rid;
  output S00_AXI_rlast;
  input S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output S00_AXI_rvalid;
  input [511:0]S00_AXI_wdata;
  input S00_AXI_wlast;
  output S00_AXI_wready;
  input [63:0]S00_AXI_wstrb;
  input S00_AXI_wvalid;

  wire S00_ACLK_1;
  wire S00_ARESETN_1;
  wire mem_interconnect_1_ACLK_net;
  wire mem_interconnect_1_ARESETN_net;
  wire [31:0]mem_interconnect_1_to_s00_couplers_ARADDR;
  wire [1:0]mem_interconnect_1_to_s00_couplers_ARBURST;
  wire [3:0]mem_interconnect_1_to_s00_couplers_ARCACHE;
  wire [0:0]mem_interconnect_1_to_s00_couplers_ARID;
  wire [7:0]mem_interconnect_1_to_s00_couplers_ARLEN;
  wire [0:0]mem_interconnect_1_to_s00_couplers_ARLOCK;
  wire [2:0]mem_interconnect_1_to_s00_couplers_ARPROT;
  wire [3:0]mem_interconnect_1_to_s00_couplers_ARQOS;
  wire mem_interconnect_1_to_s00_couplers_ARREADY;
  wire [3:0]mem_interconnect_1_to_s00_couplers_ARREGION;
  wire [2:0]mem_interconnect_1_to_s00_couplers_ARSIZE;
  wire mem_interconnect_1_to_s00_couplers_ARVALID;
  wire [31:0]mem_interconnect_1_to_s00_couplers_AWADDR;
  wire [1:0]mem_interconnect_1_to_s00_couplers_AWBURST;
  wire [3:0]mem_interconnect_1_to_s00_couplers_AWCACHE;
  wire [0:0]mem_interconnect_1_to_s00_couplers_AWID;
  wire [7:0]mem_interconnect_1_to_s00_couplers_AWLEN;
  wire [0:0]mem_interconnect_1_to_s00_couplers_AWLOCK;
  wire [2:0]mem_interconnect_1_to_s00_couplers_AWPROT;
  wire [3:0]mem_interconnect_1_to_s00_couplers_AWQOS;
  wire mem_interconnect_1_to_s00_couplers_AWREADY;
  wire [3:0]mem_interconnect_1_to_s00_couplers_AWREGION;
  wire [2:0]mem_interconnect_1_to_s00_couplers_AWSIZE;
  wire mem_interconnect_1_to_s00_couplers_AWVALID;
  wire [0:0]mem_interconnect_1_to_s00_couplers_BID;
  wire mem_interconnect_1_to_s00_couplers_BREADY;
  wire [1:0]mem_interconnect_1_to_s00_couplers_BRESP;
  wire mem_interconnect_1_to_s00_couplers_BVALID;
  wire [511:0]mem_interconnect_1_to_s00_couplers_RDATA;
  wire [0:0]mem_interconnect_1_to_s00_couplers_RID;
  wire mem_interconnect_1_to_s00_couplers_RLAST;
  wire mem_interconnect_1_to_s00_couplers_RREADY;
  wire [1:0]mem_interconnect_1_to_s00_couplers_RRESP;
  wire mem_interconnect_1_to_s00_couplers_RVALID;
  wire [511:0]mem_interconnect_1_to_s00_couplers_WDATA;
  wire mem_interconnect_1_to_s00_couplers_WLAST;
  wire mem_interconnect_1_to_s00_couplers_WREADY;
  wire [63:0]mem_interconnect_1_to_s00_couplers_WSTRB;
  wire mem_interconnect_1_to_s00_couplers_WVALID;
  wire [31:0]s00_couplers_to_mem_interconnect_1_ARADDR;
  wire [1:0]s00_couplers_to_mem_interconnect_1_ARBURST;
  wire [3:0]s00_couplers_to_mem_interconnect_1_ARCACHE;
  wire [0:0]s00_couplers_to_mem_interconnect_1_ARID;
  wire [7:0]s00_couplers_to_mem_interconnect_1_ARLEN;
  wire [0:0]s00_couplers_to_mem_interconnect_1_ARLOCK;
  wire [2:0]s00_couplers_to_mem_interconnect_1_ARPROT;
  wire [3:0]s00_couplers_to_mem_interconnect_1_ARQOS;
  wire s00_couplers_to_mem_interconnect_1_ARREADY;
  wire [2:0]s00_couplers_to_mem_interconnect_1_ARSIZE;
  wire s00_couplers_to_mem_interconnect_1_ARVALID;
  wire [31:0]s00_couplers_to_mem_interconnect_1_AWADDR;
  wire [1:0]s00_couplers_to_mem_interconnect_1_AWBURST;
  wire [3:0]s00_couplers_to_mem_interconnect_1_AWCACHE;
  wire [0:0]s00_couplers_to_mem_interconnect_1_AWID;
  wire [7:0]s00_couplers_to_mem_interconnect_1_AWLEN;
  wire [0:0]s00_couplers_to_mem_interconnect_1_AWLOCK;
  wire [2:0]s00_couplers_to_mem_interconnect_1_AWPROT;
  wire [3:0]s00_couplers_to_mem_interconnect_1_AWQOS;
  wire s00_couplers_to_mem_interconnect_1_AWREADY;
  wire [2:0]s00_couplers_to_mem_interconnect_1_AWSIZE;
  wire s00_couplers_to_mem_interconnect_1_AWVALID;
  wire [0:0]s00_couplers_to_mem_interconnect_1_BID;
  wire s00_couplers_to_mem_interconnect_1_BREADY;
  wire [1:0]s00_couplers_to_mem_interconnect_1_BRESP;
  wire s00_couplers_to_mem_interconnect_1_BVALID;
  wire [511:0]s00_couplers_to_mem_interconnect_1_RDATA;
  wire [0:0]s00_couplers_to_mem_interconnect_1_RID;
  wire s00_couplers_to_mem_interconnect_1_RLAST;
  wire s00_couplers_to_mem_interconnect_1_RREADY;
  wire [1:0]s00_couplers_to_mem_interconnect_1_RRESP;
  wire s00_couplers_to_mem_interconnect_1_RVALID;
  wire [511:0]s00_couplers_to_mem_interconnect_1_WDATA;
  wire s00_couplers_to_mem_interconnect_1_WLAST;
  wire s00_couplers_to_mem_interconnect_1_WREADY;
  wire [63:0]s00_couplers_to_mem_interconnect_1_WSTRB;
  wire s00_couplers_to_mem_interconnect_1_WVALID;

  assign M00_AXI_araddr[31:0] = s00_couplers_to_mem_interconnect_1_ARADDR;
  assign M00_AXI_arburst[1:0] = s00_couplers_to_mem_interconnect_1_ARBURST;
  assign M00_AXI_arcache[3:0] = s00_couplers_to_mem_interconnect_1_ARCACHE;
  assign M00_AXI_arid[0] = s00_couplers_to_mem_interconnect_1_ARID;
  assign M00_AXI_arlen[7:0] = s00_couplers_to_mem_interconnect_1_ARLEN;
  assign M00_AXI_arlock[0] = s00_couplers_to_mem_interconnect_1_ARLOCK;
  assign M00_AXI_arprot[2:0] = s00_couplers_to_mem_interconnect_1_ARPROT;
  assign M00_AXI_arqos[3:0] = s00_couplers_to_mem_interconnect_1_ARQOS;
  assign M00_AXI_arsize[2:0] = s00_couplers_to_mem_interconnect_1_ARSIZE;
  assign M00_AXI_arvalid = s00_couplers_to_mem_interconnect_1_ARVALID;
  assign M00_AXI_awaddr[31:0] = s00_couplers_to_mem_interconnect_1_AWADDR;
  assign M00_AXI_awburst[1:0] = s00_couplers_to_mem_interconnect_1_AWBURST;
  assign M00_AXI_awcache[3:0] = s00_couplers_to_mem_interconnect_1_AWCACHE;
  assign M00_AXI_awid[0] = s00_couplers_to_mem_interconnect_1_AWID;
  assign M00_AXI_awlen[7:0] = s00_couplers_to_mem_interconnect_1_AWLEN;
  assign M00_AXI_awlock[0] = s00_couplers_to_mem_interconnect_1_AWLOCK;
  assign M00_AXI_awprot[2:0] = s00_couplers_to_mem_interconnect_1_AWPROT;
  assign M00_AXI_awqos[3:0] = s00_couplers_to_mem_interconnect_1_AWQOS;
  assign M00_AXI_awsize[2:0] = s00_couplers_to_mem_interconnect_1_AWSIZE;
  assign M00_AXI_awvalid = s00_couplers_to_mem_interconnect_1_AWVALID;
  assign M00_AXI_bready = s00_couplers_to_mem_interconnect_1_BREADY;
  assign M00_AXI_rready = s00_couplers_to_mem_interconnect_1_RREADY;
  assign M00_AXI_wdata[511:0] = s00_couplers_to_mem_interconnect_1_WDATA;
  assign M00_AXI_wlast = s00_couplers_to_mem_interconnect_1_WLAST;
  assign M00_AXI_wstrb[63:0] = s00_couplers_to_mem_interconnect_1_WSTRB;
  assign M00_AXI_wvalid = s00_couplers_to_mem_interconnect_1_WVALID;
  assign S00_ACLK_1 = S00_ACLK;
  assign S00_ARESETN_1 = S00_ARESETN;
  assign S00_AXI_arready = mem_interconnect_1_to_s00_couplers_ARREADY;
  assign S00_AXI_awready = mem_interconnect_1_to_s00_couplers_AWREADY;
  assign S00_AXI_bid[0] = mem_interconnect_1_to_s00_couplers_BID;
  assign S00_AXI_bresp[1:0] = mem_interconnect_1_to_s00_couplers_BRESP;
  assign S00_AXI_bvalid = mem_interconnect_1_to_s00_couplers_BVALID;
  assign S00_AXI_rdata[511:0] = mem_interconnect_1_to_s00_couplers_RDATA;
  assign S00_AXI_rid[0] = mem_interconnect_1_to_s00_couplers_RID;
  assign S00_AXI_rlast = mem_interconnect_1_to_s00_couplers_RLAST;
  assign S00_AXI_rresp[1:0] = mem_interconnect_1_to_s00_couplers_RRESP;
  assign S00_AXI_rvalid = mem_interconnect_1_to_s00_couplers_RVALID;
  assign S00_AXI_wready = mem_interconnect_1_to_s00_couplers_WREADY;
  assign mem_interconnect_1_ACLK_net = M00_ACLK;
  assign mem_interconnect_1_ARESETN_net = M00_ARESETN;
  assign mem_interconnect_1_to_s00_couplers_ARADDR = S00_AXI_araddr[31:0];
  assign mem_interconnect_1_to_s00_couplers_ARBURST = S00_AXI_arburst[1:0];
  assign mem_interconnect_1_to_s00_couplers_ARCACHE = S00_AXI_arcache[3:0];
  assign mem_interconnect_1_to_s00_couplers_ARID = S00_AXI_arid[0];
  assign mem_interconnect_1_to_s00_couplers_ARLEN = S00_AXI_arlen[7:0];
  assign mem_interconnect_1_to_s00_couplers_ARLOCK = S00_AXI_arlock[0];
  assign mem_interconnect_1_to_s00_couplers_ARPROT = S00_AXI_arprot[2:0];
  assign mem_interconnect_1_to_s00_couplers_ARQOS = S00_AXI_arqos[3:0];
  assign mem_interconnect_1_to_s00_couplers_ARREGION = S00_AXI_arregion[3:0];
  assign mem_interconnect_1_to_s00_couplers_ARSIZE = S00_AXI_arsize[2:0];
  assign mem_interconnect_1_to_s00_couplers_ARVALID = S00_AXI_arvalid;
  assign mem_interconnect_1_to_s00_couplers_AWADDR = S00_AXI_awaddr[31:0];
  assign mem_interconnect_1_to_s00_couplers_AWBURST = S00_AXI_awburst[1:0];
  assign mem_interconnect_1_to_s00_couplers_AWCACHE = S00_AXI_awcache[3:0];
  assign mem_interconnect_1_to_s00_couplers_AWID = S00_AXI_awid[0];
  assign mem_interconnect_1_to_s00_couplers_AWLEN = S00_AXI_awlen[7:0];
  assign mem_interconnect_1_to_s00_couplers_AWLOCK = S00_AXI_awlock[0];
  assign mem_interconnect_1_to_s00_couplers_AWPROT = S00_AXI_awprot[2:0];
  assign mem_interconnect_1_to_s00_couplers_AWQOS = S00_AXI_awqos[3:0];
  assign mem_interconnect_1_to_s00_couplers_AWREGION = S00_AXI_awregion[3:0];
  assign mem_interconnect_1_to_s00_couplers_AWSIZE = S00_AXI_awsize[2:0];
  assign mem_interconnect_1_to_s00_couplers_AWVALID = S00_AXI_awvalid;
  assign mem_interconnect_1_to_s00_couplers_BREADY = S00_AXI_bready;
  assign mem_interconnect_1_to_s00_couplers_RREADY = S00_AXI_rready;
  assign mem_interconnect_1_to_s00_couplers_WDATA = S00_AXI_wdata[511:0];
  assign mem_interconnect_1_to_s00_couplers_WLAST = S00_AXI_wlast;
  assign mem_interconnect_1_to_s00_couplers_WSTRB = S00_AXI_wstrb[63:0];
  assign mem_interconnect_1_to_s00_couplers_WVALID = S00_AXI_wvalid;
  assign s00_couplers_to_mem_interconnect_1_ARREADY = M00_AXI_arready;
  assign s00_couplers_to_mem_interconnect_1_AWREADY = M00_AXI_awready;
  assign s00_couplers_to_mem_interconnect_1_BID = M00_AXI_bid[0];
  assign s00_couplers_to_mem_interconnect_1_BRESP = M00_AXI_bresp[1:0];
  assign s00_couplers_to_mem_interconnect_1_BVALID = M00_AXI_bvalid;
  assign s00_couplers_to_mem_interconnect_1_RDATA = M00_AXI_rdata[511:0];
  assign s00_couplers_to_mem_interconnect_1_RID = M00_AXI_rid[0];
  assign s00_couplers_to_mem_interconnect_1_RLAST = M00_AXI_rlast;
  assign s00_couplers_to_mem_interconnect_1_RRESP = M00_AXI_rresp[1:0];
  assign s00_couplers_to_mem_interconnect_1_RVALID = M00_AXI_rvalid;
  assign s00_couplers_to_mem_interconnect_1_WREADY = M00_AXI_wready;
  s00_couplers_imp_1H855RL s00_couplers
       (.M_ACLK(mem_interconnect_1_ACLK_net),
        .M_ARESETN(mem_interconnect_1_ARESETN_net),
        .M_AXI_araddr(s00_couplers_to_mem_interconnect_1_ARADDR),
        .M_AXI_arburst(s00_couplers_to_mem_interconnect_1_ARBURST),
        .M_AXI_arcache(s00_couplers_to_mem_interconnect_1_ARCACHE),
        .M_AXI_arid(s00_couplers_to_mem_interconnect_1_ARID),
        .M_AXI_arlen(s00_couplers_to_mem_interconnect_1_ARLEN),
        .M_AXI_arlock(s00_couplers_to_mem_interconnect_1_ARLOCK),
        .M_AXI_arprot(s00_couplers_to_mem_interconnect_1_ARPROT),
        .M_AXI_arqos(s00_couplers_to_mem_interconnect_1_ARQOS),
        .M_AXI_arready(s00_couplers_to_mem_interconnect_1_ARREADY),
        .M_AXI_arsize(s00_couplers_to_mem_interconnect_1_ARSIZE),
        .M_AXI_arvalid(s00_couplers_to_mem_interconnect_1_ARVALID),
        .M_AXI_awaddr(s00_couplers_to_mem_interconnect_1_AWADDR),
        .M_AXI_awburst(s00_couplers_to_mem_interconnect_1_AWBURST),
        .M_AXI_awcache(s00_couplers_to_mem_interconnect_1_AWCACHE),
        .M_AXI_awid(s00_couplers_to_mem_interconnect_1_AWID),
        .M_AXI_awlen(s00_couplers_to_mem_interconnect_1_AWLEN),
        .M_AXI_awlock(s00_couplers_to_mem_interconnect_1_AWLOCK),
        .M_AXI_awprot(s00_couplers_to_mem_interconnect_1_AWPROT),
        .M_AXI_awqos(s00_couplers_to_mem_interconnect_1_AWQOS),
        .M_AXI_awready(s00_couplers_to_mem_interconnect_1_AWREADY),
        .M_AXI_awsize(s00_couplers_to_mem_interconnect_1_AWSIZE),
        .M_AXI_awvalid(s00_couplers_to_mem_interconnect_1_AWVALID),
        .M_AXI_bid(s00_couplers_to_mem_interconnect_1_BID),
        .M_AXI_bready(s00_couplers_to_mem_interconnect_1_BREADY),
        .M_AXI_bresp(s00_couplers_to_mem_interconnect_1_BRESP),
        .M_AXI_bvalid(s00_couplers_to_mem_interconnect_1_BVALID),
        .M_AXI_rdata(s00_couplers_to_mem_interconnect_1_RDATA),
        .M_AXI_rid(s00_couplers_to_mem_interconnect_1_RID),
        .M_AXI_rlast(s00_couplers_to_mem_interconnect_1_RLAST),
        .M_AXI_rready(s00_couplers_to_mem_interconnect_1_RREADY),
        .M_AXI_rresp(s00_couplers_to_mem_interconnect_1_RRESP),
        .M_AXI_rvalid(s00_couplers_to_mem_interconnect_1_RVALID),
        .M_AXI_wdata(s00_couplers_to_mem_interconnect_1_WDATA),
        .M_AXI_wlast(s00_couplers_to_mem_interconnect_1_WLAST),
        .M_AXI_wready(s00_couplers_to_mem_interconnect_1_WREADY),
        .M_AXI_wstrb(s00_couplers_to_mem_interconnect_1_WSTRB),
        .M_AXI_wvalid(s00_couplers_to_mem_interconnect_1_WVALID),
        .S_ACLK(S00_ACLK_1),
        .S_ARESETN(S00_ARESETN_1),
        .S_AXI_araddr(mem_interconnect_1_to_s00_couplers_ARADDR),
        .S_AXI_arburst(mem_interconnect_1_to_s00_couplers_ARBURST),
        .S_AXI_arcache(mem_interconnect_1_to_s00_couplers_ARCACHE),
        .S_AXI_arid(mem_interconnect_1_to_s00_couplers_ARID),
        .S_AXI_arlen(mem_interconnect_1_to_s00_couplers_ARLEN),
        .S_AXI_arlock(mem_interconnect_1_to_s00_couplers_ARLOCK),
        .S_AXI_arprot(mem_interconnect_1_to_s00_couplers_ARPROT),
        .S_AXI_arqos(mem_interconnect_1_to_s00_couplers_ARQOS),
        .S_AXI_arready(mem_interconnect_1_to_s00_couplers_ARREADY),
        .S_AXI_arregion(mem_interconnect_1_to_s00_couplers_ARREGION),
        .S_AXI_arsize(mem_interconnect_1_to_s00_couplers_ARSIZE),
        .S_AXI_arvalid(mem_interconnect_1_to_s00_couplers_ARVALID),
        .S_AXI_awaddr(mem_interconnect_1_to_s00_couplers_AWADDR),
        .S_AXI_awburst(mem_interconnect_1_to_s00_couplers_AWBURST),
        .S_AXI_awcache(mem_interconnect_1_to_s00_couplers_AWCACHE),
        .S_AXI_awid(mem_interconnect_1_to_s00_couplers_AWID),
        .S_AXI_awlen(mem_interconnect_1_to_s00_couplers_AWLEN),
        .S_AXI_awlock(mem_interconnect_1_to_s00_couplers_AWLOCK),
        .S_AXI_awprot(mem_interconnect_1_to_s00_couplers_AWPROT),
        .S_AXI_awqos(mem_interconnect_1_to_s00_couplers_AWQOS),
        .S_AXI_awready(mem_interconnect_1_to_s00_couplers_AWREADY),
        .S_AXI_awregion(mem_interconnect_1_to_s00_couplers_AWREGION),
        .S_AXI_awsize(mem_interconnect_1_to_s00_couplers_AWSIZE),
        .S_AXI_awvalid(mem_interconnect_1_to_s00_couplers_AWVALID),
        .S_AXI_bid(mem_interconnect_1_to_s00_couplers_BID),
        .S_AXI_bready(mem_interconnect_1_to_s00_couplers_BREADY),
        .S_AXI_bresp(mem_interconnect_1_to_s00_couplers_BRESP),
        .S_AXI_bvalid(mem_interconnect_1_to_s00_couplers_BVALID),
        .S_AXI_rdata(mem_interconnect_1_to_s00_couplers_RDATA),
        .S_AXI_rid(mem_interconnect_1_to_s00_couplers_RID),
        .S_AXI_rlast(mem_interconnect_1_to_s00_couplers_RLAST),
        .S_AXI_rready(mem_interconnect_1_to_s00_couplers_RREADY),
        .S_AXI_rresp(mem_interconnect_1_to_s00_couplers_RRESP),
        .S_AXI_rvalid(mem_interconnect_1_to_s00_couplers_RVALID),
        .S_AXI_wdata(mem_interconnect_1_to_s00_couplers_WDATA),
        .S_AXI_wlast(mem_interconnect_1_to_s00_couplers_WLAST),
        .S_AXI_wready(mem_interconnect_1_to_s00_couplers_WREADY),
        .S_AXI_wstrb(mem_interconnect_1_to_s00_couplers_WSTRB),
        .S_AXI_wvalid(mem_interconnect_1_to_s00_couplers_WVALID));
endmodule

module s00_couplers_imp_1H855RL
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arid,
    M_AXI_arlen,
    M_AXI_arlock,
    M_AXI_arprot,
    M_AXI_arqos,
    M_AXI_arready,
    M_AXI_arsize,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awid,
    M_AXI_awlen,
    M_AXI_awlock,
    M_AXI_awprot,
    M_AXI_awqos,
    M_AXI_awready,
    M_AXI_awsize,
    M_AXI_awvalid,
    M_AXI_bid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rid,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arregion,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awregion,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [1:0]M_AXI_arburst;
  output [3:0]M_AXI_arcache;
  output [0:0]M_AXI_arid;
  output [7:0]M_AXI_arlen;
  output [0:0]M_AXI_arlock;
  output [2:0]M_AXI_arprot;
  output [3:0]M_AXI_arqos;
  input M_AXI_arready;
  output [2:0]M_AXI_arsize;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [1:0]M_AXI_awburst;
  output [3:0]M_AXI_awcache;
  output [0:0]M_AXI_awid;
  output [7:0]M_AXI_awlen;
  output [0:0]M_AXI_awlock;
  output [2:0]M_AXI_awprot;
  output [3:0]M_AXI_awqos;
  input M_AXI_awready;
  output [2:0]M_AXI_awsize;
  output M_AXI_awvalid;
  input [0:0]M_AXI_bid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [511:0]M_AXI_rdata;
  input [0:0]M_AXI_rid;
  input M_AXI_rlast;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [511:0]M_AXI_wdata;
  output M_AXI_wlast;
  input M_AXI_wready;
  output [63:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [0:0]S_AXI_arid;
  input [7:0]S_AXI_arlen;
  input [0:0]S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output S_AXI_arready;
  input [3:0]S_AXI_arregion;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [0:0]S_AXI_awid;
  input [7:0]S_AXI_awlen;
  input [0:0]S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  input [3:0]S_AXI_awqos;
  output S_AXI_awready;
  input [3:0]S_AXI_awregion;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  output [0:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [511:0]S_AXI_rdata;
  output [0:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [511:0]S_AXI_wdata;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [63:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire M_ACLK_1;
  wire M_ARESETN_1;
  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [31:0]auto_cc_to_s00_data_fifo_ARADDR;
  wire [1:0]auto_cc_to_s00_data_fifo_ARBURST;
  wire [3:0]auto_cc_to_s00_data_fifo_ARCACHE;
  wire [0:0]auto_cc_to_s00_data_fifo_ARID;
  wire [7:0]auto_cc_to_s00_data_fifo_ARLEN;
  wire [0:0]auto_cc_to_s00_data_fifo_ARLOCK;
  wire [2:0]auto_cc_to_s00_data_fifo_ARPROT;
  wire [3:0]auto_cc_to_s00_data_fifo_ARQOS;
  wire auto_cc_to_s00_data_fifo_ARREADY;
  wire [3:0]auto_cc_to_s00_data_fifo_ARREGION;
  wire [2:0]auto_cc_to_s00_data_fifo_ARSIZE;
  wire auto_cc_to_s00_data_fifo_ARVALID;
  wire [31:0]auto_cc_to_s00_data_fifo_AWADDR;
  wire [1:0]auto_cc_to_s00_data_fifo_AWBURST;
  wire [3:0]auto_cc_to_s00_data_fifo_AWCACHE;
  wire [0:0]auto_cc_to_s00_data_fifo_AWID;
  wire [7:0]auto_cc_to_s00_data_fifo_AWLEN;
  wire [0:0]auto_cc_to_s00_data_fifo_AWLOCK;
  wire [2:0]auto_cc_to_s00_data_fifo_AWPROT;
  wire [3:0]auto_cc_to_s00_data_fifo_AWQOS;
  wire auto_cc_to_s00_data_fifo_AWREADY;
  wire [3:0]auto_cc_to_s00_data_fifo_AWREGION;
  wire [2:0]auto_cc_to_s00_data_fifo_AWSIZE;
  wire auto_cc_to_s00_data_fifo_AWVALID;
  wire [0:0]auto_cc_to_s00_data_fifo_BID;
  wire auto_cc_to_s00_data_fifo_BREADY;
  wire [1:0]auto_cc_to_s00_data_fifo_BRESP;
  wire auto_cc_to_s00_data_fifo_BVALID;
  wire [511:0]auto_cc_to_s00_data_fifo_RDATA;
  wire [0:0]auto_cc_to_s00_data_fifo_RID;
  wire auto_cc_to_s00_data_fifo_RLAST;
  wire auto_cc_to_s00_data_fifo_RREADY;
  wire [1:0]auto_cc_to_s00_data_fifo_RRESP;
  wire auto_cc_to_s00_data_fifo_RVALID;
  wire [511:0]auto_cc_to_s00_data_fifo_WDATA;
  wire auto_cc_to_s00_data_fifo_WLAST;
  wire auto_cc_to_s00_data_fifo_WREADY;
  wire [63:0]auto_cc_to_s00_data_fifo_WSTRB;
  wire auto_cc_to_s00_data_fifo_WVALID;
  wire [31:0]s00_couplers_to_auto_cc_ARADDR;
  wire [1:0]s00_couplers_to_auto_cc_ARBURST;
  wire [3:0]s00_couplers_to_auto_cc_ARCACHE;
  wire [0:0]s00_couplers_to_auto_cc_ARID;
  wire [7:0]s00_couplers_to_auto_cc_ARLEN;
  wire [0:0]s00_couplers_to_auto_cc_ARLOCK;
  wire [2:0]s00_couplers_to_auto_cc_ARPROT;
  wire [3:0]s00_couplers_to_auto_cc_ARQOS;
  wire s00_couplers_to_auto_cc_ARREADY;
  wire [3:0]s00_couplers_to_auto_cc_ARREGION;
  wire [2:0]s00_couplers_to_auto_cc_ARSIZE;
  wire s00_couplers_to_auto_cc_ARVALID;
  wire [31:0]s00_couplers_to_auto_cc_AWADDR;
  wire [1:0]s00_couplers_to_auto_cc_AWBURST;
  wire [3:0]s00_couplers_to_auto_cc_AWCACHE;
  wire [0:0]s00_couplers_to_auto_cc_AWID;
  wire [7:0]s00_couplers_to_auto_cc_AWLEN;
  wire [0:0]s00_couplers_to_auto_cc_AWLOCK;
  wire [2:0]s00_couplers_to_auto_cc_AWPROT;
  wire [3:0]s00_couplers_to_auto_cc_AWQOS;
  wire s00_couplers_to_auto_cc_AWREADY;
  wire [3:0]s00_couplers_to_auto_cc_AWREGION;
  wire [2:0]s00_couplers_to_auto_cc_AWSIZE;
  wire s00_couplers_to_auto_cc_AWVALID;
  wire [0:0]s00_couplers_to_auto_cc_BID;
  wire s00_couplers_to_auto_cc_BREADY;
  wire [1:0]s00_couplers_to_auto_cc_BRESP;
  wire s00_couplers_to_auto_cc_BVALID;
  wire [511:0]s00_couplers_to_auto_cc_RDATA;
  wire [0:0]s00_couplers_to_auto_cc_RID;
  wire s00_couplers_to_auto_cc_RLAST;
  wire s00_couplers_to_auto_cc_RREADY;
  wire [1:0]s00_couplers_to_auto_cc_RRESP;
  wire s00_couplers_to_auto_cc_RVALID;
  wire [511:0]s00_couplers_to_auto_cc_WDATA;
  wire s00_couplers_to_auto_cc_WLAST;
  wire s00_couplers_to_auto_cc_WREADY;
  wire [63:0]s00_couplers_to_auto_cc_WSTRB;
  wire s00_couplers_to_auto_cc_WVALID;
  wire [31:0]s00_data_fifo_to_s00_couplers_ARADDR;
  wire [1:0]s00_data_fifo_to_s00_couplers_ARBURST;
  wire [3:0]s00_data_fifo_to_s00_couplers_ARCACHE;
  wire [0:0]s00_data_fifo_to_s00_couplers_ARID;
  wire [7:0]s00_data_fifo_to_s00_couplers_ARLEN;
  wire [0:0]s00_data_fifo_to_s00_couplers_ARLOCK;
  wire [2:0]s00_data_fifo_to_s00_couplers_ARPROT;
  wire [3:0]s00_data_fifo_to_s00_couplers_ARQOS;
  wire s00_data_fifo_to_s00_couplers_ARREADY;
  wire [2:0]s00_data_fifo_to_s00_couplers_ARSIZE;
  wire s00_data_fifo_to_s00_couplers_ARVALID;
  wire [31:0]s00_data_fifo_to_s00_couplers_AWADDR;
  wire [1:0]s00_data_fifo_to_s00_couplers_AWBURST;
  wire [3:0]s00_data_fifo_to_s00_couplers_AWCACHE;
  wire [0:0]s00_data_fifo_to_s00_couplers_AWID;
  wire [7:0]s00_data_fifo_to_s00_couplers_AWLEN;
  wire [0:0]s00_data_fifo_to_s00_couplers_AWLOCK;
  wire [2:0]s00_data_fifo_to_s00_couplers_AWPROT;
  wire [3:0]s00_data_fifo_to_s00_couplers_AWQOS;
  wire s00_data_fifo_to_s00_couplers_AWREADY;
  wire [2:0]s00_data_fifo_to_s00_couplers_AWSIZE;
  wire s00_data_fifo_to_s00_couplers_AWVALID;
  wire [0:0]s00_data_fifo_to_s00_couplers_BID;
  wire s00_data_fifo_to_s00_couplers_BREADY;
  wire [1:0]s00_data_fifo_to_s00_couplers_BRESP;
  wire s00_data_fifo_to_s00_couplers_BVALID;
  wire [511:0]s00_data_fifo_to_s00_couplers_RDATA;
  wire [0:0]s00_data_fifo_to_s00_couplers_RID;
  wire s00_data_fifo_to_s00_couplers_RLAST;
  wire s00_data_fifo_to_s00_couplers_RREADY;
  wire [1:0]s00_data_fifo_to_s00_couplers_RRESP;
  wire s00_data_fifo_to_s00_couplers_RVALID;
  wire [511:0]s00_data_fifo_to_s00_couplers_WDATA;
  wire s00_data_fifo_to_s00_couplers_WLAST;
  wire s00_data_fifo_to_s00_couplers_WREADY;
  wire [63:0]s00_data_fifo_to_s00_couplers_WSTRB;
  wire s00_data_fifo_to_s00_couplers_WVALID;

  assign M_ACLK_1 = M_ACLK;
  assign M_ARESETN_1 = M_ARESETN;
  assign M_AXI_araddr[31:0] = s00_data_fifo_to_s00_couplers_ARADDR;
  assign M_AXI_arburst[1:0] = s00_data_fifo_to_s00_couplers_ARBURST;
  assign M_AXI_arcache[3:0] = s00_data_fifo_to_s00_couplers_ARCACHE;
  assign M_AXI_arid[0] = s00_data_fifo_to_s00_couplers_ARID;
  assign M_AXI_arlen[7:0] = s00_data_fifo_to_s00_couplers_ARLEN;
  assign M_AXI_arlock[0] = s00_data_fifo_to_s00_couplers_ARLOCK;
  assign M_AXI_arprot[2:0] = s00_data_fifo_to_s00_couplers_ARPROT;
  assign M_AXI_arqos[3:0] = s00_data_fifo_to_s00_couplers_ARQOS;
  assign M_AXI_arsize[2:0] = s00_data_fifo_to_s00_couplers_ARSIZE;
  assign M_AXI_arvalid = s00_data_fifo_to_s00_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = s00_data_fifo_to_s00_couplers_AWADDR;
  assign M_AXI_awburst[1:0] = s00_data_fifo_to_s00_couplers_AWBURST;
  assign M_AXI_awcache[3:0] = s00_data_fifo_to_s00_couplers_AWCACHE;
  assign M_AXI_awid[0] = s00_data_fifo_to_s00_couplers_AWID;
  assign M_AXI_awlen[7:0] = s00_data_fifo_to_s00_couplers_AWLEN;
  assign M_AXI_awlock[0] = s00_data_fifo_to_s00_couplers_AWLOCK;
  assign M_AXI_awprot[2:0] = s00_data_fifo_to_s00_couplers_AWPROT;
  assign M_AXI_awqos[3:0] = s00_data_fifo_to_s00_couplers_AWQOS;
  assign M_AXI_awsize[2:0] = s00_data_fifo_to_s00_couplers_AWSIZE;
  assign M_AXI_awvalid = s00_data_fifo_to_s00_couplers_AWVALID;
  assign M_AXI_bready = s00_data_fifo_to_s00_couplers_BREADY;
  assign M_AXI_rready = s00_data_fifo_to_s00_couplers_RREADY;
  assign M_AXI_wdata[511:0] = s00_data_fifo_to_s00_couplers_WDATA;
  assign M_AXI_wlast = s00_data_fifo_to_s00_couplers_WLAST;
  assign M_AXI_wstrb[63:0] = s00_data_fifo_to_s00_couplers_WSTRB;
  assign M_AXI_wvalid = s00_data_fifo_to_s00_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = s00_couplers_to_auto_cc_ARREADY;
  assign S_AXI_awready = s00_couplers_to_auto_cc_AWREADY;
  assign S_AXI_bid[0] = s00_couplers_to_auto_cc_BID;
  assign S_AXI_bresp[1:0] = s00_couplers_to_auto_cc_BRESP;
  assign S_AXI_bvalid = s00_couplers_to_auto_cc_BVALID;
  assign S_AXI_rdata[511:0] = s00_couplers_to_auto_cc_RDATA;
  assign S_AXI_rid[0] = s00_couplers_to_auto_cc_RID;
  assign S_AXI_rlast = s00_couplers_to_auto_cc_RLAST;
  assign S_AXI_rresp[1:0] = s00_couplers_to_auto_cc_RRESP;
  assign S_AXI_rvalid = s00_couplers_to_auto_cc_RVALID;
  assign S_AXI_wready = s00_couplers_to_auto_cc_WREADY;
  assign s00_couplers_to_auto_cc_ARADDR = S_AXI_araddr[31:0];
  assign s00_couplers_to_auto_cc_ARBURST = S_AXI_arburst[1:0];
  assign s00_couplers_to_auto_cc_ARCACHE = S_AXI_arcache[3:0];
  assign s00_couplers_to_auto_cc_ARID = S_AXI_arid[0];
  assign s00_couplers_to_auto_cc_ARLEN = S_AXI_arlen[7:0];
  assign s00_couplers_to_auto_cc_ARLOCK = S_AXI_arlock[0];
  assign s00_couplers_to_auto_cc_ARPROT = S_AXI_arprot[2:0];
  assign s00_couplers_to_auto_cc_ARQOS = S_AXI_arqos[3:0];
  assign s00_couplers_to_auto_cc_ARREGION = S_AXI_arregion[3:0];
  assign s00_couplers_to_auto_cc_ARSIZE = S_AXI_arsize[2:0];
  assign s00_couplers_to_auto_cc_ARVALID = S_AXI_arvalid;
  assign s00_couplers_to_auto_cc_AWADDR = S_AXI_awaddr[31:0];
  assign s00_couplers_to_auto_cc_AWBURST = S_AXI_awburst[1:0];
  assign s00_couplers_to_auto_cc_AWCACHE = S_AXI_awcache[3:0];
  assign s00_couplers_to_auto_cc_AWID = S_AXI_awid[0];
  assign s00_couplers_to_auto_cc_AWLEN = S_AXI_awlen[7:0];
  assign s00_couplers_to_auto_cc_AWLOCK = S_AXI_awlock[0];
  assign s00_couplers_to_auto_cc_AWPROT = S_AXI_awprot[2:0];
  assign s00_couplers_to_auto_cc_AWQOS = S_AXI_awqos[3:0];
  assign s00_couplers_to_auto_cc_AWREGION = S_AXI_awregion[3:0];
  assign s00_couplers_to_auto_cc_AWSIZE = S_AXI_awsize[2:0];
  assign s00_couplers_to_auto_cc_AWVALID = S_AXI_awvalid;
  assign s00_couplers_to_auto_cc_BREADY = S_AXI_bready;
  assign s00_couplers_to_auto_cc_RREADY = S_AXI_rready;
  assign s00_couplers_to_auto_cc_WDATA = S_AXI_wdata[511:0];
  assign s00_couplers_to_auto_cc_WLAST = S_AXI_wlast;
  assign s00_couplers_to_auto_cc_WSTRB = S_AXI_wstrb[63:0];
  assign s00_couplers_to_auto_cc_WVALID = S_AXI_wvalid;
  assign s00_data_fifo_to_s00_couplers_ARREADY = M_AXI_arready;
  assign s00_data_fifo_to_s00_couplers_AWREADY = M_AXI_awready;
  assign s00_data_fifo_to_s00_couplers_BID = M_AXI_bid[0];
  assign s00_data_fifo_to_s00_couplers_BRESP = M_AXI_bresp[1:0];
  assign s00_data_fifo_to_s00_couplers_BVALID = M_AXI_bvalid;
  assign s00_data_fifo_to_s00_couplers_RDATA = M_AXI_rdata[511:0];
  assign s00_data_fifo_to_s00_couplers_RID = M_AXI_rid[0];
  assign s00_data_fifo_to_s00_couplers_RLAST = M_AXI_rlast;
  assign s00_data_fifo_to_s00_couplers_RRESP = M_AXI_rresp[1:0];
  assign s00_data_fifo_to_s00_couplers_RVALID = M_AXI_rvalid;
  assign s00_data_fifo_to_s00_couplers_WREADY = M_AXI_wready;
  mem_auto_cc_1 auto_cc
       (.m_axi_aclk(M_ACLK_1),
        .m_axi_araddr(auto_cc_to_s00_data_fifo_ARADDR),
        .m_axi_arburst(auto_cc_to_s00_data_fifo_ARBURST),
        .m_axi_arcache(auto_cc_to_s00_data_fifo_ARCACHE),
        .m_axi_aresetn(M_ARESETN_1),
        .m_axi_arid(auto_cc_to_s00_data_fifo_ARID),
        .m_axi_arlen(auto_cc_to_s00_data_fifo_ARLEN),
        .m_axi_arlock(auto_cc_to_s00_data_fifo_ARLOCK),
        .m_axi_arprot(auto_cc_to_s00_data_fifo_ARPROT),
        .m_axi_arqos(auto_cc_to_s00_data_fifo_ARQOS),
        .m_axi_arready(auto_cc_to_s00_data_fifo_ARREADY),
        .m_axi_arregion(auto_cc_to_s00_data_fifo_ARREGION),
        .m_axi_arsize(auto_cc_to_s00_data_fifo_ARSIZE),
        .m_axi_arvalid(auto_cc_to_s00_data_fifo_ARVALID),
        .m_axi_awaddr(auto_cc_to_s00_data_fifo_AWADDR),
        .m_axi_awburst(auto_cc_to_s00_data_fifo_AWBURST),
        .m_axi_awcache(auto_cc_to_s00_data_fifo_AWCACHE),
        .m_axi_awid(auto_cc_to_s00_data_fifo_AWID),
        .m_axi_awlen(auto_cc_to_s00_data_fifo_AWLEN),
        .m_axi_awlock(auto_cc_to_s00_data_fifo_AWLOCK),
        .m_axi_awprot(auto_cc_to_s00_data_fifo_AWPROT),
        .m_axi_awqos(auto_cc_to_s00_data_fifo_AWQOS),
        .m_axi_awready(auto_cc_to_s00_data_fifo_AWREADY),
        .m_axi_awregion(auto_cc_to_s00_data_fifo_AWREGION),
        .m_axi_awsize(auto_cc_to_s00_data_fifo_AWSIZE),
        .m_axi_awvalid(auto_cc_to_s00_data_fifo_AWVALID),
        .m_axi_bid(auto_cc_to_s00_data_fifo_BID),
        .m_axi_bready(auto_cc_to_s00_data_fifo_BREADY),
        .m_axi_bresp(auto_cc_to_s00_data_fifo_BRESP),
        .m_axi_bvalid(auto_cc_to_s00_data_fifo_BVALID),
        .m_axi_rdata(auto_cc_to_s00_data_fifo_RDATA),
        .m_axi_rid(auto_cc_to_s00_data_fifo_RID),
        .m_axi_rlast(auto_cc_to_s00_data_fifo_RLAST),
        .m_axi_rready(auto_cc_to_s00_data_fifo_RREADY),
        .m_axi_rresp(auto_cc_to_s00_data_fifo_RRESP),
        .m_axi_rvalid(auto_cc_to_s00_data_fifo_RVALID),
        .m_axi_wdata(auto_cc_to_s00_data_fifo_WDATA),
        .m_axi_wlast(auto_cc_to_s00_data_fifo_WLAST),
        .m_axi_wready(auto_cc_to_s00_data_fifo_WREADY),
        .m_axi_wstrb(auto_cc_to_s00_data_fifo_WSTRB),
        .m_axi_wvalid(auto_cc_to_s00_data_fifo_WVALID),
        .s_axi_aclk(S_ACLK_1),
        .s_axi_araddr(s00_couplers_to_auto_cc_ARADDR),
        .s_axi_arburst(s00_couplers_to_auto_cc_ARBURST),
        .s_axi_arcache(s00_couplers_to_auto_cc_ARCACHE),
        .s_axi_aresetn(S_ARESETN_1),
        .s_axi_arid(s00_couplers_to_auto_cc_ARID),
        .s_axi_arlen(s00_couplers_to_auto_cc_ARLEN),
        .s_axi_arlock(s00_couplers_to_auto_cc_ARLOCK),
        .s_axi_arprot(s00_couplers_to_auto_cc_ARPROT),
        .s_axi_arqos(s00_couplers_to_auto_cc_ARQOS),
        .s_axi_arready(s00_couplers_to_auto_cc_ARREADY),
        .s_axi_arregion(s00_couplers_to_auto_cc_ARREGION),
        .s_axi_arsize(s00_couplers_to_auto_cc_ARSIZE),
        .s_axi_arvalid(s00_couplers_to_auto_cc_ARVALID),
        .s_axi_awaddr(s00_couplers_to_auto_cc_AWADDR),
        .s_axi_awburst(s00_couplers_to_auto_cc_AWBURST),
        .s_axi_awcache(s00_couplers_to_auto_cc_AWCACHE),
        .s_axi_awid(s00_couplers_to_auto_cc_AWID),
        .s_axi_awlen(s00_couplers_to_auto_cc_AWLEN),
        .s_axi_awlock(s00_couplers_to_auto_cc_AWLOCK),
        .s_axi_awprot(s00_couplers_to_auto_cc_AWPROT),
        .s_axi_awqos(s00_couplers_to_auto_cc_AWQOS),
        .s_axi_awready(s00_couplers_to_auto_cc_AWREADY),
        .s_axi_awregion(s00_couplers_to_auto_cc_AWREGION),
        .s_axi_awsize(s00_couplers_to_auto_cc_AWSIZE),
        .s_axi_awvalid(s00_couplers_to_auto_cc_AWVALID),
        .s_axi_bid(s00_couplers_to_auto_cc_BID),
        .s_axi_bready(s00_couplers_to_auto_cc_BREADY),
        .s_axi_bresp(s00_couplers_to_auto_cc_BRESP),
        .s_axi_bvalid(s00_couplers_to_auto_cc_BVALID),
        .s_axi_rdata(s00_couplers_to_auto_cc_RDATA),
        .s_axi_rid(s00_couplers_to_auto_cc_RID),
        .s_axi_rlast(s00_couplers_to_auto_cc_RLAST),
        .s_axi_rready(s00_couplers_to_auto_cc_RREADY),
        .s_axi_rresp(s00_couplers_to_auto_cc_RRESP),
        .s_axi_rvalid(s00_couplers_to_auto_cc_RVALID),
        .s_axi_wdata(s00_couplers_to_auto_cc_WDATA),
        .s_axi_wlast(s00_couplers_to_auto_cc_WLAST),
        .s_axi_wready(s00_couplers_to_auto_cc_WREADY),
        .s_axi_wstrb(s00_couplers_to_auto_cc_WSTRB),
        .s_axi_wvalid(s00_couplers_to_auto_cc_WVALID));
  mem_s00_data_fifo_1 s00_data_fifo
       (.aclk(M_ACLK_1),
        .aresetn(M_ARESETN_1),
        .m_axi_araddr(s00_data_fifo_to_s00_couplers_ARADDR),
        .m_axi_arburst(s00_data_fifo_to_s00_couplers_ARBURST),
        .m_axi_arcache(s00_data_fifo_to_s00_couplers_ARCACHE),
        .m_axi_arid(s00_data_fifo_to_s00_couplers_ARID),
        .m_axi_arlen(s00_data_fifo_to_s00_couplers_ARLEN),
        .m_axi_arlock(s00_data_fifo_to_s00_couplers_ARLOCK),
        .m_axi_arprot(s00_data_fifo_to_s00_couplers_ARPROT),
        .m_axi_arqos(s00_data_fifo_to_s00_couplers_ARQOS),
        .m_axi_arready(s00_data_fifo_to_s00_couplers_ARREADY),
        .m_axi_arsize(s00_data_fifo_to_s00_couplers_ARSIZE),
        .m_axi_arvalid(s00_data_fifo_to_s00_couplers_ARVALID),
        .m_axi_awaddr(s00_data_fifo_to_s00_couplers_AWADDR),
        .m_axi_awburst(s00_data_fifo_to_s00_couplers_AWBURST),
        .m_axi_awcache(s00_data_fifo_to_s00_couplers_AWCACHE),
        .m_axi_awid(s00_data_fifo_to_s00_couplers_AWID),
        .m_axi_awlen(s00_data_fifo_to_s00_couplers_AWLEN),
        .m_axi_awlock(s00_data_fifo_to_s00_couplers_AWLOCK),
        .m_axi_awprot(s00_data_fifo_to_s00_couplers_AWPROT),
        .m_axi_awqos(s00_data_fifo_to_s00_couplers_AWQOS),
        .m_axi_awready(s00_data_fifo_to_s00_couplers_AWREADY),
        .m_axi_awsize(s00_data_fifo_to_s00_couplers_AWSIZE),
        .m_axi_awvalid(s00_data_fifo_to_s00_couplers_AWVALID),
        .m_axi_bid(s00_data_fifo_to_s00_couplers_BID),
        .m_axi_bready(s00_data_fifo_to_s00_couplers_BREADY),
        .m_axi_bresp(s00_data_fifo_to_s00_couplers_BRESP),
        .m_axi_bvalid(s00_data_fifo_to_s00_couplers_BVALID),
        .m_axi_rdata(s00_data_fifo_to_s00_couplers_RDATA),
        .m_axi_rid(s00_data_fifo_to_s00_couplers_RID),
        .m_axi_rlast(s00_data_fifo_to_s00_couplers_RLAST),
        .m_axi_rready(s00_data_fifo_to_s00_couplers_RREADY),
        .m_axi_rresp(s00_data_fifo_to_s00_couplers_RRESP),
        .m_axi_rvalid(s00_data_fifo_to_s00_couplers_RVALID),
        .m_axi_wdata(s00_data_fifo_to_s00_couplers_WDATA),
        .m_axi_wlast(s00_data_fifo_to_s00_couplers_WLAST),
        .m_axi_wready(s00_data_fifo_to_s00_couplers_WREADY),
        .m_axi_wstrb(s00_data_fifo_to_s00_couplers_WSTRB),
        .m_axi_wvalid(s00_data_fifo_to_s00_couplers_WVALID),
        .s_axi_araddr(auto_cc_to_s00_data_fifo_ARADDR),
        .s_axi_arburst(auto_cc_to_s00_data_fifo_ARBURST),
        .s_axi_arcache(auto_cc_to_s00_data_fifo_ARCACHE),
        .s_axi_arid(auto_cc_to_s00_data_fifo_ARID),
        .s_axi_arlen(auto_cc_to_s00_data_fifo_ARLEN),
        .s_axi_arlock(auto_cc_to_s00_data_fifo_ARLOCK),
        .s_axi_arprot(auto_cc_to_s00_data_fifo_ARPROT),
        .s_axi_arqos(auto_cc_to_s00_data_fifo_ARQOS),
        .s_axi_arready(auto_cc_to_s00_data_fifo_ARREADY),
        .s_axi_arregion(auto_cc_to_s00_data_fifo_ARREGION),
        .s_axi_arsize(auto_cc_to_s00_data_fifo_ARSIZE),
        .s_axi_arvalid(auto_cc_to_s00_data_fifo_ARVALID),
        .s_axi_awaddr(auto_cc_to_s00_data_fifo_AWADDR),
        .s_axi_awburst(auto_cc_to_s00_data_fifo_AWBURST),
        .s_axi_awcache(auto_cc_to_s00_data_fifo_AWCACHE),
        .s_axi_awid(auto_cc_to_s00_data_fifo_AWID),
        .s_axi_awlen(auto_cc_to_s00_data_fifo_AWLEN),
        .s_axi_awlock(auto_cc_to_s00_data_fifo_AWLOCK),
        .s_axi_awprot(auto_cc_to_s00_data_fifo_AWPROT),
        .s_axi_awqos(auto_cc_to_s00_data_fifo_AWQOS),
        .s_axi_awready(auto_cc_to_s00_data_fifo_AWREADY),
        .s_axi_awregion(auto_cc_to_s00_data_fifo_AWREGION),
        .s_axi_awsize(auto_cc_to_s00_data_fifo_AWSIZE),
        .s_axi_awvalid(auto_cc_to_s00_data_fifo_AWVALID),
        .s_axi_bid(auto_cc_to_s00_data_fifo_BID),
        .s_axi_bready(auto_cc_to_s00_data_fifo_BREADY),
        .s_axi_bresp(auto_cc_to_s00_data_fifo_BRESP),
        .s_axi_bvalid(auto_cc_to_s00_data_fifo_BVALID),
        .s_axi_rdata(auto_cc_to_s00_data_fifo_RDATA),
        .s_axi_rid(auto_cc_to_s00_data_fifo_RID),
        .s_axi_rlast(auto_cc_to_s00_data_fifo_RLAST),
        .s_axi_rready(auto_cc_to_s00_data_fifo_RREADY),
        .s_axi_rresp(auto_cc_to_s00_data_fifo_RRESP),
        .s_axi_rvalid(auto_cc_to_s00_data_fifo_RVALID),
        .s_axi_wdata(auto_cc_to_s00_data_fifo_WDATA),
        .s_axi_wlast(auto_cc_to_s00_data_fifo_WLAST),
        .s_axi_wready(auto_cc_to_s00_data_fifo_WREADY),
        .s_axi_wstrb(auto_cc_to_s00_data_fifo_WSTRB),
        .s_axi_wvalid(auto_cc_to_s00_data_fifo_WVALID));
endmodule

module s00_couplers_imp_NACBYP
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arid,
    M_AXI_arlen,
    M_AXI_arlock,
    M_AXI_arprot,
    M_AXI_arqos,
    M_AXI_arready,
    M_AXI_arsize,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awid,
    M_AXI_awlen,
    M_AXI_awlock,
    M_AXI_awprot,
    M_AXI_awqos,
    M_AXI_awready,
    M_AXI_awsize,
    M_AXI_awvalid,
    M_AXI_bid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rid,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arregion,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awregion,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [1:0]M_AXI_arburst;
  output [3:0]M_AXI_arcache;
  output [0:0]M_AXI_arid;
  output [7:0]M_AXI_arlen;
  output [0:0]M_AXI_arlock;
  output [2:0]M_AXI_arprot;
  output [3:0]M_AXI_arqos;
  input M_AXI_arready;
  output [2:0]M_AXI_arsize;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [1:0]M_AXI_awburst;
  output [3:0]M_AXI_awcache;
  output [0:0]M_AXI_awid;
  output [7:0]M_AXI_awlen;
  output [0:0]M_AXI_awlock;
  output [2:0]M_AXI_awprot;
  output [3:0]M_AXI_awqos;
  input M_AXI_awready;
  output [2:0]M_AXI_awsize;
  output M_AXI_awvalid;
  input [0:0]M_AXI_bid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [511:0]M_AXI_rdata;
  input [0:0]M_AXI_rid;
  input M_AXI_rlast;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [511:0]M_AXI_wdata;
  output M_AXI_wlast;
  input M_AXI_wready;
  output [63:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [0:0]S_AXI_arid;
  input [7:0]S_AXI_arlen;
  input [0:0]S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output S_AXI_arready;
  input [3:0]S_AXI_arregion;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [0:0]S_AXI_awid;
  input [7:0]S_AXI_awlen;
  input [0:0]S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  input [3:0]S_AXI_awqos;
  output S_AXI_awready;
  input [3:0]S_AXI_awregion;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  output [0:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [511:0]S_AXI_rdata;
  output [0:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [511:0]S_AXI_wdata;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [63:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire M_ACLK_1;
  wire M_ARESETN_1;
  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [31:0]auto_cc_to_s00_data_fifo_ARADDR;
  wire [1:0]auto_cc_to_s00_data_fifo_ARBURST;
  wire [3:0]auto_cc_to_s00_data_fifo_ARCACHE;
  wire [0:0]auto_cc_to_s00_data_fifo_ARID;
  wire [7:0]auto_cc_to_s00_data_fifo_ARLEN;
  wire [0:0]auto_cc_to_s00_data_fifo_ARLOCK;
  wire [2:0]auto_cc_to_s00_data_fifo_ARPROT;
  wire [3:0]auto_cc_to_s00_data_fifo_ARQOS;
  wire auto_cc_to_s00_data_fifo_ARREADY;
  wire [3:0]auto_cc_to_s00_data_fifo_ARREGION;
  wire [2:0]auto_cc_to_s00_data_fifo_ARSIZE;
  wire auto_cc_to_s00_data_fifo_ARVALID;
  wire [31:0]auto_cc_to_s00_data_fifo_AWADDR;
  wire [1:0]auto_cc_to_s00_data_fifo_AWBURST;
  wire [3:0]auto_cc_to_s00_data_fifo_AWCACHE;
  wire [0:0]auto_cc_to_s00_data_fifo_AWID;
  wire [7:0]auto_cc_to_s00_data_fifo_AWLEN;
  wire [0:0]auto_cc_to_s00_data_fifo_AWLOCK;
  wire [2:0]auto_cc_to_s00_data_fifo_AWPROT;
  wire [3:0]auto_cc_to_s00_data_fifo_AWQOS;
  wire auto_cc_to_s00_data_fifo_AWREADY;
  wire [3:0]auto_cc_to_s00_data_fifo_AWREGION;
  wire [2:0]auto_cc_to_s00_data_fifo_AWSIZE;
  wire auto_cc_to_s00_data_fifo_AWVALID;
  wire [0:0]auto_cc_to_s00_data_fifo_BID;
  wire auto_cc_to_s00_data_fifo_BREADY;
  wire [1:0]auto_cc_to_s00_data_fifo_BRESP;
  wire auto_cc_to_s00_data_fifo_BVALID;
  wire [511:0]auto_cc_to_s00_data_fifo_RDATA;
  wire [0:0]auto_cc_to_s00_data_fifo_RID;
  wire auto_cc_to_s00_data_fifo_RLAST;
  wire auto_cc_to_s00_data_fifo_RREADY;
  wire [1:0]auto_cc_to_s00_data_fifo_RRESP;
  wire auto_cc_to_s00_data_fifo_RVALID;
  wire [511:0]auto_cc_to_s00_data_fifo_WDATA;
  wire auto_cc_to_s00_data_fifo_WLAST;
  wire auto_cc_to_s00_data_fifo_WREADY;
  wire [63:0]auto_cc_to_s00_data_fifo_WSTRB;
  wire auto_cc_to_s00_data_fifo_WVALID;
  wire [31:0]s00_couplers_to_auto_cc_ARADDR;
  wire [1:0]s00_couplers_to_auto_cc_ARBURST;
  wire [3:0]s00_couplers_to_auto_cc_ARCACHE;
  wire [0:0]s00_couplers_to_auto_cc_ARID;
  wire [7:0]s00_couplers_to_auto_cc_ARLEN;
  wire [0:0]s00_couplers_to_auto_cc_ARLOCK;
  wire [2:0]s00_couplers_to_auto_cc_ARPROT;
  wire [3:0]s00_couplers_to_auto_cc_ARQOS;
  wire s00_couplers_to_auto_cc_ARREADY;
  wire [3:0]s00_couplers_to_auto_cc_ARREGION;
  wire [2:0]s00_couplers_to_auto_cc_ARSIZE;
  wire s00_couplers_to_auto_cc_ARVALID;
  wire [31:0]s00_couplers_to_auto_cc_AWADDR;
  wire [1:0]s00_couplers_to_auto_cc_AWBURST;
  wire [3:0]s00_couplers_to_auto_cc_AWCACHE;
  wire [0:0]s00_couplers_to_auto_cc_AWID;
  wire [7:0]s00_couplers_to_auto_cc_AWLEN;
  wire [0:0]s00_couplers_to_auto_cc_AWLOCK;
  wire [2:0]s00_couplers_to_auto_cc_AWPROT;
  wire [3:0]s00_couplers_to_auto_cc_AWQOS;
  wire s00_couplers_to_auto_cc_AWREADY;
  wire [3:0]s00_couplers_to_auto_cc_AWREGION;
  wire [2:0]s00_couplers_to_auto_cc_AWSIZE;
  wire s00_couplers_to_auto_cc_AWVALID;
  wire [0:0]s00_couplers_to_auto_cc_BID;
  wire s00_couplers_to_auto_cc_BREADY;
  wire [1:0]s00_couplers_to_auto_cc_BRESP;
  wire s00_couplers_to_auto_cc_BVALID;
  wire [511:0]s00_couplers_to_auto_cc_RDATA;
  wire [0:0]s00_couplers_to_auto_cc_RID;
  wire s00_couplers_to_auto_cc_RLAST;
  wire s00_couplers_to_auto_cc_RREADY;
  wire [1:0]s00_couplers_to_auto_cc_RRESP;
  wire s00_couplers_to_auto_cc_RVALID;
  wire [511:0]s00_couplers_to_auto_cc_WDATA;
  wire s00_couplers_to_auto_cc_WLAST;
  wire s00_couplers_to_auto_cc_WREADY;
  wire [63:0]s00_couplers_to_auto_cc_WSTRB;
  wire s00_couplers_to_auto_cc_WVALID;
  wire [31:0]s00_data_fifo_to_s00_couplers_ARADDR;
  wire [1:0]s00_data_fifo_to_s00_couplers_ARBURST;
  wire [3:0]s00_data_fifo_to_s00_couplers_ARCACHE;
  wire [0:0]s00_data_fifo_to_s00_couplers_ARID;
  wire [7:0]s00_data_fifo_to_s00_couplers_ARLEN;
  wire [0:0]s00_data_fifo_to_s00_couplers_ARLOCK;
  wire [2:0]s00_data_fifo_to_s00_couplers_ARPROT;
  wire [3:0]s00_data_fifo_to_s00_couplers_ARQOS;
  wire s00_data_fifo_to_s00_couplers_ARREADY;
  wire [2:0]s00_data_fifo_to_s00_couplers_ARSIZE;
  wire s00_data_fifo_to_s00_couplers_ARVALID;
  wire [31:0]s00_data_fifo_to_s00_couplers_AWADDR;
  wire [1:0]s00_data_fifo_to_s00_couplers_AWBURST;
  wire [3:0]s00_data_fifo_to_s00_couplers_AWCACHE;
  wire [0:0]s00_data_fifo_to_s00_couplers_AWID;
  wire [7:0]s00_data_fifo_to_s00_couplers_AWLEN;
  wire [0:0]s00_data_fifo_to_s00_couplers_AWLOCK;
  wire [2:0]s00_data_fifo_to_s00_couplers_AWPROT;
  wire [3:0]s00_data_fifo_to_s00_couplers_AWQOS;
  wire s00_data_fifo_to_s00_couplers_AWREADY;
  wire [2:0]s00_data_fifo_to_s00_couplers_AWSIZE;
  wire s00_data_fifo_to_s00_couplers_AWVALID;
  wire [0:0]s00_data_fifo_to_s00_couplers_BID;
  wire s00_data_fifo_to_s00_couplers_BREADY;
  wire [1:0]s00_data_fifo_to_s00_couplers_BRESP;
  wire s00_data_fifo_to_s00_couplers_BVALID;
  wire [511:0]s00_data_fifo_to_s00_couplers_RDATA;
  wire [0:0]s00_data_fifo_to_s00_couplers_RID;
  wire s00_data_fifo_to_s00_couplers_RLAST;
  wire s00_data_fifo_to_s00_couplers_RREADY;
  wire [1:0]s00_data_fifo_to_s00_couplers_RRESP;
  wire s00_data_fifo_to_s00_couplers_RVALID;
  wire [511:0]s00_data_fifo_to_s00_couplers_WDATA;
  wire s00_data_fifo_to_s00_couplers_WLAST;
  wire s00_data_fifo_to_s00_couplers_WREADY;
  wire [63:0]s00_data_fifo_to_s00_couplers_WSTRB;
  wire s00_data_fifo_to_s00_couplers_WVALID;

  assign M_ACLK_1 = M_ACLK;
  assign M_ARESETN_1 = M_ARESETN;
  assign M_AXI_araddr[31:0] = s00_data_fifo_to_s00_couplers_ARADDR;
  assign M_AXI_arburst[1:0] = s00_data_fifo_to_s00_couplers_ARBURST;
  assign M_AXI_arcache[3:0] = s00_data_fifo_to_s00_couplers_ARCACHE;
  assign M_AXI_arid[0] = s00_data_fifo_to_s00_couplers_ARID;
  assign M_AXI_arlen[7:0] = s00_data_fifo_to_s00_couplers_ARLEN;
  assign M_AXI_arlock[0] = s00_data_fifo_to_s00_couplers_ARLOCK;
  assign M_AXI_arprot[2:0] = s00_data_fifo_to_s00_couplers_ARPROT;
  assign M_AXI_arqos[3:0] = s00_data_fifo_to_s00_couplers_ARQOS;
  assign M_AXI_arsize[2:0] = s00_data_fifo_to_s00_couplers_ARSIZE;
  assign M_AXI_arvalid = s00_data_fifo_to_s00_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = s00_data_fifo_to_s00_couplers_AWADDR;
  assign M_AXI_awburst[1:0] = s00_data_fifo_to_s00_couplers_AWBURST;
  assign M_AXI_awcache[3:0] = s00_data_fifo_to_s00_couplers_AWCACHE;
  assign M_AXI_awid[0] = s00_data_fifo_to_s00_couplers_AWID;
  assign M_AXI_awlen[7:0] = s00_data_fifo_to_s00_couplers_AWLEN;
  assign M_AXI_awlock[0] = s00_data_fifo_to_s00_couplers_AWLOCK;
  assign M_AXI_awprot[2:0] = s00_data_fifo_to_s00_couplers_AWPROT;
  assign M_AXI_awqos[3:0] = s00_data_fifo_to_s00_couplers_AWQOS;
  assign M_AXI_awsize[2:0] = s00_data_fifo_to_s00_couplers_AWSIZE;
  assign M_AXI_awvalid = s00_data_fifo_to_s00_couplers_AWVALID;
  assign M_AXI_bready = s00_data_fifo_to_s00_couplers_BREADY;
  assign M_AXI_rready = s00_data_fifo_to_s00_couplers_RREADY;
  assign M_AXI_wdata[511:0] = s00_data_fifo_to_s00_couplers_WDATA;
  assign M_AXI_wlast = s00_data_fifo_to_s00_couplers_WLAST;
  assign M_AXI_wstrb[63:0] = s00_data_fifo_to_s00_couplers_WSTRB;
  assign M_AXI_wvalid = s00_data_fifo_to_s00_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = s00_couplers_to_auto_cc_ARREADY;
  assign S_AXI_awready = s00_couplers_to_auto_cc_AWREADY;
  assign S_AXI_bid[0] = s00_couplers_to_auto_cc_BID;
  assign S_AXI_bresp[1:0] = s00_couplers_to_auto_cc_BRESP;
  assign S_AXI_bvalid = s00_couplers_to_auto_cc_BVALID;
  assign S_AXI_rdata[511:0] = s00_couplers_to_auto_cc_RDATA;
  assign S_AXI_rid[0] = s00_couplers_to_auto_cc_RID;
  assign S_AXI_rlast = s00_couplers_to_auto_cc_RLAST;
  assign S_AXI_rresp[1:0] = s00_couplers_to_auto_cc_RRESP;
  assign S_AXI_rvalid = s00_couplers_to_auto_cc_RVALID;
  assign S_AXI_wready = s00_couplers_to_auto_cc_WREADY;
  assign s00_couplers_to_auto_cc_ARADDR = S_AXI_araddr[31:0];
  assign s00_couplers_to_auto_cc_ARBURST = S_AXI_arburst[1:0];
  assign s00_couplers_to_auto_cc_ARCACHE = S_AXI_arcache[3:0];
  assign s00_couplers_to_auto_cc_ARID = S_AXI_arid[0];
  assign s00_couplers_to_auto_cc_ARLEN = S_AXI_arlen[7:0];
  assign s00_couplers_to_auto_cc_ARLOCK = S_AXI_arlock[0];
  assign s00_couplers_to_auto_cc_ARPROT = S_AXI_arprot[2:0];
  assign s00_couplers_to_auto_cc_ARQOS = S_AXI_arqos[3:0];
  assign s00_couplers_to_auto_cc_ARREGION = S_AXI_arregion[3:0];
  assign s00_couplers_to_auto_cc_ARSIZE = S_AXI_arsize[2:0];
  assign s00_couplers_to_auto_cc_ARVALID = S_AXI_arvalid;
  assign s00_couplers_to_auto_cc_AWADDR = S_AXI_awaddr[31:0];
  assign s00_couplers_to_auto_cc_AWBURST = S_AXI_awburst[1:0];
  assign s00_couplers_to_auto_cc_AWCACHE = S_AXI_awcache[3:0];
  assign s00_couplers_to_auto_cc_AWID = S_AXI_awid[0];
  assign s00_couplers_to_auto_cc_AWLEN = S_AXI_awlen[7:0];
  assign s00_couplers_to_auto_cc_AWLOCK = S_AXI_awlock[0];
  assign s00_couplers_to_auto_cc_AWPROT = S_AXI_awprot[2:0];
  assign s00_couplers_to_auto_cc_AWQOS = S_AXI_awqos[3:0];
  assign s00_couplers_to_auto_cc_AWREGION = S_AXI_awregion[3:0];
  assign s00_couplers_to_auto_cc_AWSIZE = S_AXI_awsize[2:0];
  assign s00_couplers_to_auto_cc_AWVALID = S_AXI_awvalid;
  assign s00_couplers_to_auto_cc_BREADY = S_AXI_bready;
  assign s00_couplers_to_auto_cc_RREADY = S_AXI_rready;
  assign s00_couplers_to_auto_cc_WDATA = S_AXI_wdata[511:0];
  assign s00_couplers_to_auto_cc_WLAST = S_AXI_wlast;
  assign s00_couplers_to_auto_cc_WSTRB = S_AXI_wstrb[63:0];
  assign s00_couplers_to_auto_cc_WVALID = S_AXI_wvalid;
  assign s00_data_fifo_to_s00_couplers_ARREADY = M_AXI_arready;
  assign s00_data_fifo_to_s00_couplers_AWREADY = M_AXI_awready;
  assign s00_data_fifo_to_s00_couplers_BID = M_AXI_bid[0];
  assign s00_data_fifo_to_s00_couplers_BRESP = M_AXI_bresp[1:0];
  assign s00_data_fifo_to_s00_couplers_BVALID = M_AXI_bvalid;
  assign s00_data_fifo_to_s00_couplers_RDATA = M_AXI_rdata[511:0];
  assign s00_data_fifo_to_s00_couplers_RID = M_AXI_rid[0];
  assign s00_data_fifo_to_s00_couplers_RLAST = M_AXI_rlast;
  assign s00_data_fifo_to_s00_couplers_RRESP = M_AXI_rresp[1:0];
  assign s00_data_fifo_to_s00_couplers_RVALID = M_AXI_rvalid;
  assign s00_data_fifo_to_s00_couplers_WREADY = M_AXI_wready;
  mem_auto_cc_0 auto_cc
       (.m_axi_aclk(M_ACLK_1),
        .m_axi_araddr(auto_cc_to_s00_data_fifo_ARADDR),
        .m_axi_arburst(auto_cc_to_s00_data_fifo_ARBURST),
        .m_axi_arcache(auto_cc_to_s00_data_fifo_ARCACHE),
        .m_axi_aresetn(M_ARESETN_1),
        .m_axi_arid(auto_cc_to_s00_data_fifo_ARID),
        .m_axi_arlen(auto_cc_to_s00_data_fifo_ARLEN),
        .m_axi_arlock(auto_cc_to_s00_data_fifo_ARLOCK),
        .m_axi_arprot(auto_cc_to_s00_data_fifo_ARPROT),
        .m_axi_arqos(auto_cc_to_s00_data_fifo_ARQOS),
        .m_axi_arready(auto_cc_to_s00_data_fifo_ARREADY),
        .m_axi_arregion(auto_cc_to_s00_data_fifo_ARREGION),
        .m_axi_arsize(auto_cc_to_s00_data_fifo_ARSIZE),
        .m_axi_arvalid(auto_cc_to_s00_data_fifo_ARVALID),
        .m_axi_awaddr(auto_cc_to_s00_data_fifo_AWADDR),
        .m_axi_awburst(auto_cc_to_s00_data_fifo_AWBURST),
        .m_axi_awcache(auto_cc_to_s00_data_fifo_AWCACHE),
        .m_axi_awid(auto_cc_to_s00_data_fifo_AWID),
        .m_axi_awlen(auto_cc_to_s00_data_fifo_AWLEN),
        .m_axi_awlock(auto_cc_to_s00_data_fifo_AWLOCK),
        .m_axi_awprot(auto_cc_to_s00_data_fifo_AWPROT),
        .m_axi_awqos(auto_cc_to_s00_data_fifo_AWQOS),
        .m_axi_awready(auto_cc_to_s00_data_fifo_AWREADY),
        .m_axi_awregion(auto_cc_to_s00_data_fifo_AWREGION),
        .m_axi_awsize(auto_cc_to_s00_data_fifo_AWSIZE),
        .m_axi_awvalid(auto_cc_to_s00_data_fifo_AWVALID),
        .m_axi_bid(auto_cc_to_s00_data_fifo_BID),
        .m_axi_bready(auto_cc_to_s00_data_fifo_BREADY),
        .m_axi_bresp(auto_cc_to_s00_data_fifo_BRESP),
        .m_axi_bvalid(auto_cc_to_s00_data_fifo_BVALID),
        .m_axi_rdata(auto_cc_to_s00_data_fifo_RDATA),
        .m_axi_rid(auto_cc_to_s00_data_fifo_RID),
        .m_axi_rlast(auto_cc_to_s00_data_fifo_RLAST),
        .m_axi_rready(auto_cc_to_s00_data_fifo_RREADY),
        .m_axi_rresp(auto_cc_to_s00_data_fifo_RRESP),
        .m_axi_rvalid(auto_cc_to_s00_data_fifo_RVALID),
        .m_axi_wdata(auto_cc_to_s00_data_fifo_WDATA),
        .m_axi_wlast(auto_cc_to_s00_data_fifo_WLAST),
        .m_axi_wready(auto_cc_to_s00_data_fifo_WREADY),
        .m_axi_wstrb(auto_cc_to_s00_data_fifo_WSTRB),
        .m_axi_wvalid(auto_cc_to_s00_data_fifo_WVALID),
        .s_axi_aclk(S_ACLK_1),
        .s_axi_araddr(s00_couplers_to_auto_cc_ARADDR),
        .s_axi_arburst(s00_couplers_to_auto_cc_ARBURST),
        .s_axi_arcache(s00_couplers_to_auto_cc_ARCACHE),
        .s_axi_aresetn(S_ARESETN_1),
        .s_axi_arid(s00_couplers_to_auto_cc_ARID),
        .s_axi_arlen(s00_couplers_to_auto_cc_ARLEN),
        .s_axi_arlock(s00_couplers_to_auto_cc_ARLOCK),
        .s_axi_arprot(s00_couplers_to_auto_cc_ARPROT),
        .s_axi_arqos(s00_couplers_to_auto_cc_ARQOS),
        .s_axi_arready(s00_couplers_to_auto_cc_ARREADY),
        .s_axi_arregion(s00_couplers_to_auto_cc_ARREGION),
        .s_axi_arsize(s00_couplers_to_auto_cc_ARSIZE),
        .s_axi_arvalid(s00_couplers_to_auto_cc_ARVALID),
        .s_axi_awaddr(s00_couplers_to_auto_cc_AWADDR),
        .s_axi_awburst(s00_couplers_to_auto_cc_AWBURST),
        .s_axi_awcache(s00_couplers_to_auto_cc_AWCACHE),
        .s_axi_awid(s00_couplers_to_auto_cc_AWID),
        .s_axi_awlen(s00_couplers_to_auto_cc_AWLEN),
        .s_axi_awlock(s00_couplers_to_auto_cc_AWLOCK),
        .s_axi_awprot(s00_couplers_to_auto_cc_AWPROT),
        .s_axi_awqos(s00_couplers_to_auto_cc_AWQOS),
        .s_axi_awready(s00_couplers_to_auto_cc_AWREADY),
        .s_axi_awregion(s00_couplers_to_auto_cc_AWREGION),
        .s_axi_awsize(s00_couplers_to_auto_cc_AWSIZE),
        .s_axi_awvalid(s00_couplers_to_auto_cc_AWVALID),
        .s_axi_bid(s00_couplers_to_auto_cc_BID),
        .s_axi_bready(s00_couplers_to_auto_cc_BREADY),
        .s_axi_bresp(s00_couplers_to_auto_cc_BRESP),
        .s_axi_bvalid(s00_couplers_to_auto_cc_BVALID),
        .s_axi_rdata(s00_couplers_to_auto_cc_RDATA),
        .s_axi_rid(s00_couplers_to_auto_cc_RID),
        .s_axi_rlast(s00_couplers_to_auto_cc_RLAST),
        .s_axi_rready(s00_couplers_to_auto_cc_RREADY),
        .s_axi_rresp(s00_couplers_to_auto_cc_RRESP),
        .s_axi_rvalid(s00_couplers_to_auto_cc_RVALID),
        .s_axi_wdata(s00_couplers_to_auto_cc_WDATA),
        .s_axi_wlast(s00_couplers_to_auto_cc_WLAST),
        .s_axi_wready(s00_couplers_to_auto_cc_WREADY),
        .s_axi_wstrb(s00_couplers_to_auto_cc_WSTRB),
        .s_axi_wvalid(s00_couplers_to_auto_cc_WVALID));
  mem_s00_data_fifo_0 s00_data_fifo
       (.aclk(M_ACLK_1),
        .aresetn(M_ARESETN_1),
        .m_axi_araddr(s00_data_fifo_to_s00_couplers_ARADDR),
        .m_axi_arburst(s00_data_fifo_to_s00_couplers_ARBURST),
        .m_axi_arcache(s00_data_fifo_to_s00_couplers_ARCACHE),
        .m_axi_arid(s00_data_fifo_to_s00_couplers_ARID),
        .m_axi_arlen(s00_data_fifo_to_s00_couplers_ARLEN),
        .m_axi_arlock(s00_data_fifo_to_s00_couplers_ARLOCK),
        .m_axi_arprot(s00_data_fifo_to_s00_couplers_ARPROT),
        .m_axi_arqos(s00_data_fifo_to_s00_couplers_ARQOS),
        .m_axi_arready(s00_data_fifo_to_s00_couplers_ARREADY),
        .m_axi_arsize(s00_data_fifo_to_s00_couplers_ARSIZE),
        .m_axi_arvalid(s00_data_fifo_to_s00_couplers_ARVALID),
        .m_axi_awaddr(s00_data_fifo_to_s00_couplers_AWADDR),
        .m_axi_awburst(s00_data_fifo_to_s00_couplers_AWBURST),
        .m_axi_awcache(s00_data_fifo_to_s00_couplers_AWCACHE),
        .m_axi_awid(s00_data_fifo_to_s00_couplers_AWID),
        .m_axi_awlen(s00_data_fifo_to_s00_couplers_AWLEN),
        .m_axi_awlock(s00_data_fifo_to_s00_couplers_AWLOCK),
        .m_axi_awprot(s00_data_fifo_to_s00_couplers_AWPROT),
        .m_axi_awqos(s00_data_fifo_to_s00_couplers_AWQOS),
        .m_axi_awready(s00_data_fifo_to_s00_couplers_AWREADY),
        .m_axi_awsize(s00_data_fifo_to_s00_couplers_AWSIZE),
        .m_axi_awvalid(s00_data_fifo_to_s00_couplers_AWVALID),
        .m_axi_bid(s00_data_fifo_to_s00_couplers_BID),
        .m_axi_bready(s00_data_fifo_to_s00_couplers_BREADY),
        .m_axi_bresp(s00_data_fifo_to_s00_couplers_BRESP),
        .m_axi_bvalid(s00_data_fifo_to_s00_couplers_BVALID),
        .m_axi_rdata(s00_data_fifo_to_s00_couplers_RDATA),
        .m_axi_rid(s00_data_fifo_to_s00_couplers_RID),
        .m_axi_rlast(s00_data_fifo_to_s00_couplers_RLAST),
        .m_axi_rready(s00_data_fifo_to_s00_couplers_RREADY),
        .m_axi_rresp(s00_data_fifo_to_s00_couplers_RRESP),
        .m_axi_rvalid(s00_data_fifo_to_s00_couplers_RVALID),
        .m_axi_wdata(s00_data_fifo_to_s00_couplers_WDATA),
        .m_axi_wlast(s00_data_fifo_to_s00_couplers_WLAST),
        .m_axi_wready(s00_data_fifo_to_s00_couplers_WREADY),
        .m_axi_wstrb(s00_data_fifo_to_s00_couplers_WSTRB),
        .m_axi_wvalid(s00_data_fifo_to_s00_couplers_WVALID),
        .s_axi_araddr(auto_cc_to_s00_data_fifo_ARADDR),
        .s_axi_arburst(auto_cc_to_s00_data_fifo_ARBURST),
        .s_axi_arcache(auto_cc_to_s00_data_fifo_ARCACHE),
        .s_axi_arid(auto_cc_to_s00_data_fifo_ARID),
        .s_axi_arlen(auto_cc_to_s00_data_fifo_ARLEN),
        .s_axi_arlock(auto_cc_to_s00_data_fifo_ARLOCK),
        .s_axi_arprot(auto_cc_to_s00_data_fifo_ARPROT),
        .s_axi_arqos(auto_cc_to_s00_data_fifo_ARQOS),
        .s_axi_arready(auto_cc_to_s00_data_fifo_ARREADY),
        .s_axi_arregion(auto_cc_to_s00_data_fifo_ARREGION),
        .s_axi_arsize(auto_cc_to_s00_data_fifo_ARSIZE),
        .s_axi_arvalid(auto_cc_to_s00_data_fifo_ARVALID),
        .s_axi_awaddr(auto_cc_to_s00_data_fifo_AWADDR),
        .s_axi_awburst(auto_cc_to_s00_data_fifo_AWBURST),
        .s_axi_awcache(auto_cc_to_s00_data_fifo_AWCACHE),
        .s_axi_awid(auto_cc_to_s00_data_fifo_AWID),
        .s_axi_awlen(auto_cc_to_s00_data_fifo_AWLEN),
        .s_axi_awlock(auto_cc_to_s00_data_fifo_AWLOCK),
        .s_axi_awprot(auto_cc_to_s00_data_fifo_AWPROT),
        .s_axi_awqos(auto_cc_to_s00_data_fifo_AWQOS),
        .s_axi_awready(auto_cc_to_s00_data_fifo_AWREADY),
        .s_axi_awregion(auto_cc_to_s00_data_fifo_AWREGION),
        .s_axi_awsize(auto_cc_to_s00_data_fifo_AWSIZE),
        .s_axi_awvalid(auto_cc_to_s00_data_fifo_AWVALID),
        .s_axi_bid(auto_cc_to_s00_data_fifo_BID),
        .s_axi_bready(auto_cc_to_s00_data_fifo_BREADY),
        .s_axi_bresp(auto_cc_to_s00_data_fifo_BRESP),
        .s_axi_bvalid(auto_cc_to_s00_data_fifo_BVALID),
        .s_axi_rdata(auto_cc_to_s00_data_fifo_RDATA),
        .s_axi_rid(auto_cc_to_s00_data_fifo_RID),
        .s_axi_rlast(auto_cc_to_s00_data_fifo_RLAST),
        .s_axi_rready(auto_cc_to_s00_data_fifo_RREADY),
        .s_axi_rresp(auto_cc_to_s00_data_fifo_RRESP),
        .s_axi_rvalid(auto_cc_to_s00_data_fifo_RVALID),
        .s_axi_wdata(auto_cc_to_s00_data_fifo_WDATA),
        .s_axi_wlast(auto_cc_to_s00_data_fifo_WLAST),
        .s_axi_wready(auto_cc_to_s00_data_fifo_WREADY),
        .s_axi_wstrb(auto_cc_to_s00_data_fifo_WSTRB),
        .s_axi_wvalid(auto_cc_to_s00_data_fifo_WVALID));
endmodule
