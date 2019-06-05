//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Command: generate_target bd_6748.bd
//Design : bd_6748
//Purpose: IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "bd_6748,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=bd_6748,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=17,numReposBlks=17,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=SBD,synth_mode=Global}" *) (* HW_HANDOFF = "shell_system_ila_0_0.hwdef" *) 
module bd_6748
   (SLOT_0_AXI_araddr,
    SLOT_0_AXI_arburst,
    SLOT_0_AXI_arcache,
    SLOT_0_AXI_arid,
    SLOT_0_AXI_arlen,
    SLOT_0_AXI_arlock,
    SLOT_0_AXI_arprot,
    SLOT_0_AXI_arqos,
    SLOT_0_AXI_arready,
    SLOT_0_AXI_arregion,
    SLOT_0_AXI_arsize,
    SLOT_0_AXI_arvalid,
    SLOT_0_AXI_awaddr,
    SLOT_0_AXI_awburst,
    SLOT_0_AXI_awcache,
    SLOT_0_AXI_awid,
    SLOT_0_AXI_awlen,
    SLOT_0_AXI_awlock,
    SLOT_0_AXI_awprot,
    SLOT_0_AXI_awqos,
    SLOT_0_AXI_awready,
    SLOT_0_AXI_awregion,
    SLOT_0_AXI_awsize,
    SLOT_0_AXI_awvalid,
    SLOT_0_AXI_bid,
    SLOT_0_AXI_bready,
    SLOT_0_AXI_bresp,
    SLOT_0_AXI_bvalid,
    SLOT_0_AXI_rdata,
    SLOT_0_AXI_rid,
    SLOT_0_AXI_rlast,
    SLOT_0_AXI_rready,
    SLOT_0_AXI_rresp,
    SLOT_0_AXI_rvalid,
    SLOT_0_AXI_wdata,
    SLOT_0_AXI_wlast,
    SLOT_0_AXI_wready,
    SLOT_0_AXI_wstrb,
    SLOT_0_AXI_wvalid,
    SLOT_1_AXI_araddr,
    SLOT_1_AXI_arburst,
    SLOT_1_AXI_arcache,
    SLOT_1_AXI_arid,
    SLOT_1_AXI_arlen,
    SLOT_1_AXI_arlock,
    SLOT_1_AXI_arprot,
    SLOT_1_AXI_arqos,
    SLOT_1_AXI_arready,
    SLOT_1_AXI_arregion,
    SLOT_1_AXI_arsize,
    SLOT_1_AXI_arvalid,
    SLOT_1_AXI_awaddr,
    SLOT_1_AXI_awburst,
    SLOT_1_AXI_awcache,
    SLOT_1_AXI_awid,
    SLOT_1_AXI_awlen,
    SLOT_1_AXI_awlock,
    SLOT_1_AXI_awprot,
    SLOT_1_AXI_awqos,
    SLOT_1_AXI_awready,
    SLOT_1_AXI_awregion,
    SLOT_1_AXI_awsize,
    SLOT_1_AXI_awvalid,
    SLOT_1_AXI_bid,
    SLOT_1_AXI_bready,
    SLOT_1_AXI_bresp,
    SLOT_1_AXI_bvalid,
    SLOT_1_AXI_rdata,
    SLOT_1_AXI_rid,
    SLOT_1_AXI_rlast,
    SLOT_1_AXI_rready,
    SLOT_1_AXI_rresp,
    SLOT_1_AXI_rvalid,
    SLOT_1_AXI_wdata,
    SLOT_1_AXI_wlast,
    SLOT_1_AXI_wready,
    SLOT_1_AXI_wstrb,
    SLOT_1_AXI_wvalid,
    SLOT_2_AXI_araddr,
    SLOT_2_AXI_arprot,
    SLOT_2_AXI_arready,
    SLOT_2_AXI_arvalid,
    SLOT_2_AXI_awaddr,
    SLOT_2_AXI_awprot,
    SLOT_2_AXI_awready,
    SLOT_2_AXI_awvalid,
    SLOT_2_AXI_bready,
    SLOT_2_AXI_bresp,
    SLOT_2_AXI_bvalid,
    SLOT_2_AXI_rdata,
    SLOT_2_AXI_rready,
    SLOT_2_AXI_rresp,
    SLOT_2_AXI_rvalid,
    SLOT_2_AXI_wdata,
    SLOT_2_AXI_wready,
    SLOT_2_AXI_wstrb,
    SLOT_2_AXI_wvalid,
    SLOT_3_AXIS_tdata,
    SLOT_3_AXIS_tkeep,
    SLOT_3_AXIS_tlast,
    SLOT_3_AXIS_tready,
    SLOT_3_AXIS_tvalid,
    SLOT_4_AXIS_tdata,
    SLOT_4_AXIS_tkeep,
    SLOT_4_AXIS_tlast,
    SLOT_4_AXIS_tready,
    SLOT_4_AXIS_tvalid,
    clk,
    resetn);
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SLOT_0_AXI, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN bd_01e2_xpcs_0_txusrclk2_out, DATA_WIDTH 512, FREQ_HZ 156250000, HAS_BRESP 1, HAS_BURST 1, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 1, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 1, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 2, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 2, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 1, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) input [31:0]SLOT_0_AXI_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI ARBURST" *) input [1:0]SLOT_0_AXI_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI ARCACHE" *) input [3:0]SLOT_0_AXI_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI ARID" *) input [0:0]SLOT_0_AXI_arid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI ARLEN" *) input [7:0]SLOT_0_AXI_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI ARLOCK" *) input [0:0]SLOT_0_AXI_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI ARPROT" *) input [2:0]SLOT_0_AXI_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI ARQOS" *) input [3:0]SLOT_0_AXI_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI ARREADY" *) input SLOT_0_AXI_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI ARREGION" *) input [3:0]SLOT_0_AXI_arregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI ARSIZE" *) input [2:0]SLOT_0_AXI_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI ARVALID" *) input SLOT_0_AXI_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI AWADDR" *) input [31:0]SLOT_0_AXI_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI AWBURST" *) input [1:0]SLOT_0_AXI_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI AWCACHE" *) input [3:0]SLOT_0_AXI_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI AWID" *) input [0:0]SLOT_0_AXI_awid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI AWLEN" *) input [7:0]SLOT_0_AXI_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI AWLOCK" *) input [0:0]SLOT_0_AXI_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI AWPROT" *) input [2:0]SLOT_0_AXI_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI AWQOS" *) input [3:0]SLOT_0_AXI_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI AWREADY" *) input SLOT_0_AXI_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI AWREGION" *) input [3:0]SLOT_0_AXI_awregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI AWSIZE" *) input [2:0]SLOT_0_AXI_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI AWVALID" *) input SLOT_0_AXI_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI BID" *) input [0:0]SLOT_0_AXI_bid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI BREADY" *) input SLOT_0_AXI_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI BRESP" *) input [1:0]SLOT_0_AXI_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI BVALID" *) input SLOT_0_AXI_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI RDATA" *) input [511:0]SLOT_0_AXI_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI RID" *) input [0:0]SLOT_0_AXI_rid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI RLAST" *) input SLOT_0_AXI_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI RREADY" *) input SLOT_0_AXI_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI RRESP" *) input [1:0]SLOT_0_AXI_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI RVALID" *) input SLOT_0_AXI_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI WDATA" *) input [511:0]SLOT_0_AXI_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI WLAST" *) input SLOT_0_AXI_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI WREADY" *) input SLOT_0_AXI_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI WSTRB" *) input [63:0]SLOT_0_AXI_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_0_AXI WVALID" *) input SLOT_0_AXI_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SLOT_1_AXI, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN bd_01e2_xpcs_0_txusrclk2_out, DATA_WIDTH 512, FREQ_HZ 156250000, HAS_BRESP 1, HAS_BURST 1, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 1, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 1, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 2, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 2, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 1, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) input [31:0]SLOT_1_AXI_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI ARBURST" *) input [1:0]SLOT_1_AXI_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI ARCACHE" *) input [3:0]SLOT_1_AXI_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI ARID" *) input [0:0]SLOT_1_AXI_arid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI ARLEN" *) input [7:0]SLOT_1_AXI_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI ARLOCK" *) input [0:0]SLOT_1_AXI_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI ARPROT" *) input [2:0]SLOT_1_AXI_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI ARQOS" *) input [3:0]SLOT_1_AXI_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI ARREADY" *) input SLOT_1_AXI_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI ARREGION" *) input [3:0]SLOT_1_AXI_arregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI ARSIZE" *) input [2:0]SLOT_1_AXI_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI ARVALID" *) input SLOT_1_AXI_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI AWADDR" *) input [31:0]SLOT_1_AXI_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI AWBURST" *) input [1:0]SLOT_1_AXI_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI AWCACHE" *) input [3:0]SLOT_1_AXI_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI AWID" *) input [0:0]SLOT_1_AXI_awid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI AWLEN" *) input [7:0]SLOT_1_AXI_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI AWLOCK" *) input [0:0]SLOT_1_AXI_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI AWPROT" *) input [2:0]SLOT_1_AXI_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI AWQOS" *) input [3:0]SLOT_1_AXI_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI AWREADY" *) input SLOT_1_AXI_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI AWREGION" *) input [3:0]SLOT_1_AXI_awregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI AWSIZE" *) input [2:0]SLOT_1_AXI_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI AWVALID" *) input SLOT_1_AXI_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI BID" *) input [0:0]SLOT_1_AXI_bid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI BREADY" *) input SLOT_1_AXI_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI BRESP" *) input [1:0]SLOT_1_AXI_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI BVALID" *) input SLOT_1_AXI_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI RDATA" *) input [511:0]SLOT_1_AXI_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI RID" *) input [0:0]SLOT_1_AXI_rid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI RLAST" *) input SLOT_1_AXI_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI RREADY" *) input SLOT_1_AXI_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI RRESP" *) input [1:0]SLOT_1_AXI_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI RVALID" *) input SLOT_1_AXI_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI WDATA" *) input [511:0]SLOT_1_AXI_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI WLAST" *) input SLOT_1_AXI_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI WREADY" *) input SLOT_1_AXI_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI WSTRB" *) input [63:0]SLOT_1_AXI_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_1_AXI WVALID" *) input SLOT_1_AXI_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SLOT_2_AXI, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN bd_01e2_xpcs_0_txusrclk2_out, DATA_WIDTH 32, FREQ_HZ 156250000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 2, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 2, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) input [31:0]SLOT_2_AXI_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI ARPROT" *) input [2:0]SLOT_2_AXI_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI ARREADY" *) input SLOT_2_AXI_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI ARVALID" *) input SLOT_2_AXI_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI AWADDR" *) input [31:0]SLOT_2_AXI_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI AWPROT" *) input [2:0]SLOT_2_AXI_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI AWREADY" *) input SLOT_2_AXI_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI AWVALID" *) input SLOT_2_AXI_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI BREADY" *) input SLOT_2_AXI_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI BRESP" *) input [1:0]SLOT_2_AXI_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI BVALID" *) input SLOT_2_AXI_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI RDATA" *) input [31:0]SLOT_2_AXI_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI RREADY" *) input SLOT_2_AXI_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI RRESP" *) input [1:0]SLOT_2_AXI_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI RVALID" *) input SLOT_2_AXI_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI WDATA" *) input [31:0]SLOT_2_AXI_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI WREADY" *) input SLOT_2_AXI_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI WSTRB" *) input [3:0]SLOT_2_AXI_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 SLOT_2_AXI WVALID" *) input SLOT_2_AXI_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_3_AXIS TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SLOT_3_AXIS, CLK_DOMAIN bd_01e2_xpcs_0_txusrclk2_out, FREQ_HZ 156250000, HAS_TKEEP 1, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} TDATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 64} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}} TDATA_WIDTH 64}, PHASE 0.000, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) input [63:0]SLOT_3_AXIS_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_3_AXIS TKEEP" *) input [7:0]SLOT_3_AXIS_tkeep;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_3_AXIS TLAST" *) input SLOT_3_AXIS_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_3_AXIS TREADY" *) input SLOT_3_AXIS_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_3_AXIS TVALID" *) input SLOT_3_AXIS_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_4_AXIS TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SLOT_4_AXIS, CLK_DOMAIN bd_01e2_xpcs_0_txusrclk2_out, FREQ_HZ 156250000, HAS_TKEEP 1, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) input [63:0]SLOT_4_AXIS_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_4_AXIS TKEEP" *) input [7:0]SLOT_4_AXIS_tkeep;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_4_AXIS TLAST" *) input SLOT_4_AXIS_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_4_AXIS TREADY" *) input SLOT_4_AXIS_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_4_AXIS TVALID" *) input SLOT_4_AXIS_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, ASSOCIATED_BUSIF SLOT_0_AXI:SLOT_1_AXI:SLOT_2_AXI:SLOT_3_AXIS:SLOT_4_AXIS, ASSOCIATED_RESET resetn, CLK_DOMAIN bd_01e2_xpcs_0_txusrclk2_out, FREQ_HZ 156250000, PHASE 0.000" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESETN, POLARITY ACTIVE_LOW" *) input resetn;

  wire [31:0]Conn1_ARADDR;
  wire [1:0]Conn1_ARBURST;
  wire [3:0]Conn1_ARCACHE;
  wire [0:0]Conn1_ARID;
  wire [7:0]Conn1_ARLEN;
  wire [0:0]Conn1_ARLOCK;
  wire [2:0]Conn1_ARPROT;
  wire [3:0]Conn1_ARQOS;
  wire Conn1_ARREADY;
  wire [3:0]Conn1_ARREGION;
  wire [2:0]Conn1_ARSIZE;
  wire Conn1_ARVALID;
  wire [31:0]Conn1_AWADDR;
  wire [1:0]Conn1_AWBURST;
  wire [3:0]Conn1_AWCACHE;
  wire [0:0]Conn1_AWID;
  wire [7:0]Conn1_AWLEN;
  wire [0:0]Conn1_AWLOCK;
  wire [2:0]Conn1_AWPROT;
  wire [3:0]Conn1_AWQOS;
  wire Conn1_AWREADY;
  wire [3:0]Conn1_AWREGION;
  wire [2:0]Conn1_AWSIZE;
  wire Conn1_AWVALID;
  wire [0:0]Conn1_BID;
  wire Conn1_BREADY;
  wire [1:0]Conn1_BRESP;
  wire Conn1_BVALID;
  wire [511:0]Conn1_RDATA;
  wire [0:0]Conn1_RID;
  wire Conn1_RLAST;
  wire Conn1_RREADY;
  wire [1:0]Conn1_RRESP;
  wire Conn1_RVALID;
  wire [511:0]Conn1_WDATA;
  wire Conn1_WLAST;
  wire Conn1_WREADY;
  wire [63:0]Conn1_WSTRB;
  wire Conn1_WVALID;
  wire [31:0]Conn2_ARADDR;
  wire [2:0]Conn2_ARPROT;
  wire Conn2_ARREADY;
  wire Conn2_ARVALID;
  wire [31:0]Conn2_AWADDR;
  wire [2:0]Conn2_AWPROT;
  wire Conn2_AWREADY;
  wire Conn2_AWVALID;
  wire Conn2_BREADY;
  wire [1:0]Conn2_BRESP;
  wire Conn2_BVALID;
  wire [31:0]Conn2_RDATA;
  wire Conn2_RREADY;
  wire [1:0]Conn2_RRESP;
  wire Conn2_RVALID;
  wire [31:0]Conn2_WDATA;
  wire Conn2_WREADY;
  wire [3:0]Conn2_WSTRB;
  wire Conn2_WVALID;
  wire [63:0]Conn3_TDATA;
  wire [7:0]Conn3_TKEEP;
  wire Conn3_TLAST;
  wire Conn3_TREADY;
  wire Conn3_TVALID;
  wire [63:0]Conn4_TDATA;
  wire [7:0]Conn4_TKEEP;
  wire Conn4_TLAST;
  wire Conn4_TREADY;
  wire Conn4_TVALID;
  wire [31:0]Conn_ARADDR;
  wire [1:0]Conn_ARBURST;
  wire [3:0]Conn_ARCACHE;
  wire [0:0]Conn_ARID;
  wire [7:0]Conn_ARLEN;
  wire [0:0]Conn_ARLOCK;
  wire [2:0]Conn_ARPROT;
  wire [3:0]Conn_ARQOS;
  wire Conn_ARREADY;
  wire [3:0]Conn_ARREGION;
  wire [2:0]Conn_ARSIZE;
  wire Conn_ARVALID;
  wire [31:0]Conn_AWADDR;
  wire [1:0]Conn_AWBURST;
  wire [3:0]Conn_AWCACHE;
  wire [0:0]Conn_AWID;
  wire [7:0]Conn_AWLEN;
  wire [0:0]Conn_AWLOCK;
  wire [2:0]Conn_AWPROT;
  wire [3:0]Conn_AWQOS;
  wire Conn_AWREADY;
  wire [3:0]Conn_AWREGION;
  wire [2:0]Conn_AWSIZE;
  wire Conn_AWVALID;
  wire [0:0]Conn_BID;
  wire Conn_BREADY;
  wire [1:0]Conn_BRESP;
  wire Conn_BVALID;
  wire [511:0]Conn_RDATA;
  wire [0:0]Conn_RID;
  wire Conn_RLAST;
  wire Conn_RREADY;
  wire [1:0]Conn_RRESP;
  wire Conn_RVALID;
  wire [511:0]Conn_WDATA;
  wire Conn_WLAST;
  wire Conn_WREADY;
  wire [63:0]Conn_WSTRB;
  wire Conn_WVALID;
  wire clk_1;
  wire [1:0]net_slot_0_axi_ar_cnt;
  wire [1:0]net_slot_0_axi_ar_ctrl;
  wire [31:0]net_slot_0_axi_araddr;
  wire [1:0]net_slot_0_axi_arburst;
  wire [3:0]net_slot_0_axi_arcache;
  wire [0:0]net_slot_0_axi_arid;
  wire [7:0]net_slot_0_axi_arlen;
  wire [0:0]net_slot_0_axi_arlock;
  wire [2:0]net_slot_0_axi_arprot;
  wire [3:0]net_slot_0_axi_arqos;
  wire net_slot_0_axi_arready;
  wire [3:0]net_slot_0_axi_arregion;
  wire [2:0]net_slot_0_axi_arsize;
  wire net_slot_0_axi_arvalid;
  wire [1:0]net_slot_0_axi_aw_cnt;
  wire [1:0]net_slot_0_axi_aw_ctrl;
  wire [31:0]net_slot_0_axi_awaddr;
  wire [1:0]net_slot_0_axi_awburst;
  wire [3:0]net_slot_0_axi_awcache;
  wire [0:0]net_slot_0_axi_awid;
  wire [7:0]net_slot_0_axi_awlen;
  wire [0:0]net_slot_0_axi_awlock;
  wire [2:0]net_slot_0_axi_awprot;
  wire [3:0]net_slot_0_axi_awqos;
  wire net_slot_0_axi_awready;
  wire [3:0]net_slot_0_axi_awregion;
  wire [2:0]net_slot_0_axi_awsize;
  wire net_slot_0_axi_awvalid;
  wire [1:0]net_slot_0_axi_b_cnt;
  wire [1:0]net_slot_0_axi_b_ctrl;
  wire [0:0]net_slot_0_axi_bid;
  wire net_slot_0_axi_bready;
  wire [1:0]net_slot_0_axi_bresp;
  wire net_slot_0_axi_bvalid;
  wire [1:0]net_slot_0_axi_r_cnt;
  wire [2:0]net_slot_0_axi_r_ctrl;
  wire [511:0]net_slot_0_axi_rdata;
  wire [0:0]net_slot_0_axi_rid;
  wire net_slot_0_axi_rlast;
  wire net_slot_0_axi_rready;
  wire [1:0]net_slot_0_axi_rresp;
  wire net_slot_0_axi_rvalid;
  wire [2:0]net_slot_0_axi_w_ctrl;
  wire [511:0]net_slot_0_axi_wdata;
  wire net_slot_0_axi_wlast;
  wire net_slot_0_axi_wready;
  wire [63:0]net_slot_0_axi_wstrb;
  wire net_slot_0_axi_wvalid;
  wire [1:0]net_slot_1_axi_ar_cnt;
  wire [1:0]net_slot_1_axi_ar_ctrl;
  wire [31:0]net_slot_1_axi_araddr;
  wire [1:0]net_slot_1_axi_arburst;
  wire [3:0]net_slot_1_axi_arcache;
  wire [0:0]net_slot_1_axi_arid;
  wire [7:0]net_slot_1_axi_arlen;
  wire [0:0]net_slot_1_axi_arlock;
  wire [2:0]net_slot_1_axi_arprot;
  wire [3:0]net_slot_1_axi_arqos;
  wire net_slot_1_axi_arready;
  wire [3:0]net_slot_1_axi_arregion;
  wire [2:0]net_slot_1_axi_arsize;
  wire net_slot_1_axi_arvalid;
  wire [1:0]net_slot_1_axi_aw_cnt;
  wire [1:0]net_slot_1_axi_aw_ctrl;
  wire [31:0]net_slot_1_axi_awaddr;
  wire [1:0]net_slot_1_axi_awburst;
  wire [3:0]net_slot_1_axi_awcache;
  wire [0:0]net_slot_1_axi_awid;
  wire [7:0]net_slot_1_axi_awlen;
  wire [0:0]net_slot_1_axi_awlock;
  wire [2:0]net_slot_1_axi_awprot;
  wire [3:0]net_slot_1_axi_awqos;
  wire net_slot_1_axi_awready;
  wire [3:0]net_slot_1_axi_awregion;
  wire [2:0]net_slot_1_axi_awsize;
  wire net_slot_1_axi_awvalid;
  wire [1:0]net_slot_1_axi_b_cnt;
  wire [1:0]net_slot_1_axi_b_ctrl;
  wire [0:0]net_slot_1_axi_bid;
  wire net_slot_1_axi_bready;
  wire [1:0]net_slot_1_axi_bresp;
  wire net_slot_1_axi_bvalid;
  wire [1:0]net_slot_1_axi_r_cnt;
  wire [2:0]net_slot_1_axi_r_ctrl;
  wire [511:0]net_slot_1_axi_rdata;
  wire [0:0]net_slot_1_axi_rid;
  wire net_slot_1_axi_rlast;
  wire net_slot_1_axi_rready;
  wire [1:0]net_slot_1_axi_rresp;
  wire net_slot_1_axi_rvalid;
  wire [2:0]net_slot_1_axi_w_ctrl;
  wire [511:0]net_slot_1_axi_wdata;
  wire net_slot_1_axi_wlast;
  wire net_slot_1_axi_wready;
  wire [63:0]net_slot_1_axi_wstrb;
  wire net_slot_1_axi_wvalid;
  wire [1:0]net_slot_2_axi_ar_cnt;
  wire [1:0]net_slot_2_axi_ar_ctrl;
  wire [31:0]net_slot_2_axi_araddr;
  wire [2:0]net_slot_2_axi_arprot;
  wire net_slot_2_axi_arready;
  wire net_slot_2_axi_arvalid;
  wire [1:0]net_slot_2_axi_aw_cnt;
  wire [1:0]net_slot_2_axi_aw_ctrl;
  wire [31:0]net_slot_2_axi_awaddr;
  wire [2:0]net_slot_2_axi_awprot;
  wire net_slot_2_axi_awready;
  wire net_slot_2_axi_awvalid;
  wire [1:0]net_slot_2_axi_b_cnt;
  wire [1:0]net_slot_2_axi_b_ctrl;
  wire net_slot_2_axi_bready;
  wire [1:0]net_slot_2_axi_bresp;
  wire net_slot_2_axi_bvalid;
  wire [1:0]net_slot_2_axi_r_cnt;
  wire [1:0]net_slot_2_axi_r_ctrl;
  wire [31:0]net_slot_2_axi_rdata;
  wire net_slot_2_axi_rready;
  wire [1:0]net_slot_2_axi_rresp;
  wire net_slot_2_axi_rvalid;
  wire [1:0]net_slot_2_axi_w_ctrl;
  wire [31:0]net_slot_2_axi_wdata;
  wire net_slot_2_axi_wready;
  wire [3:0]net_slot_2_axi_wstrb;
  wire net_slot_2_axi_wvalid;
  wire [63:0]net_slot_3_axis_tdata;
  wire [7:0]net_slot_3_axis_tkeep;
  wire net_slot_3_axis_tlast;
  wire net_slot_3_axis_tready;
  wire net_slot_3_axis_tvalid;
  wire [63:0]net_slot_4_axis_tdata;
  wire [7:0]net_slot_4_axis_tkeep;
  wire net_slot_4_axis_tlast;
  wire net_slot_4_axis_tready;
  wire net_slot_4_axis_tvalid;
  wire resetn_1;

  assign Conn1_ARADDR = SLOT_1_AXI_araddr[31:0];
  assign Conn1_ARBURST = SLOT_1_AXI_arburst[1:0];
  assign Conn1_ARCACHE = SLOT_1_AXI_arcache[3:0];
  assign Conn1_ARID = SLOT_1_AXI_arid[0];
  assign Conn1_ARLEN = SLOT_1_AXI_arlen[7:0];
  assign Conn1_ARLOCK = SLOT_1_AXI_arlock[0];
  assign Conn1_ARPROT = SLOT_1_AXI_arprot[2:0];
  assign Conn1_ARQOS = SLOT_1_AXI_arqos[3:0];
  assign Conn1_ARREADY = SLOT_1_AXI_arready;
  assign Conn1_ARREGION = SLOT_1_AXI_arregion[3:0];
  assign Conn1_ARSIZE = SLOT_1_AXI_arsize[2:0];
  assign Conn1_ARVALID = SLOT_1_AXI_arvalid;
  assign Conn1_AWADDR = SLOT_1_AXI_awaddr[31:0];
  assign Conn1_AWBURST = SLOT_1_AXI_awburst[1:0];
  assign Conn1_AWCACHE = SLOT_1_AXI_awcache[3:0];
  assign Conn1_AWID = SLOT_1_AXI_awid[0];
  assign Conn1_AWLEN = SLOT_1_AXI_awlen[7:0];
  assign Conn1_AWLOCK = SLOT_1_AXI_awlock[0];
  assign Conn1_AWPROT = SLOT_1_AXI_awprot[2:0];
  assign Conn1_AWQOS = SLOT_1_AXI_awqos[3:0];
  assign Conn1_AWREADY = SLOT_1_AXI_awready;
  assign Conn1_AWREGION = SLOT_1_AXI_awregion[3:0];
  assign Conn1_AWSIZE = SLOT_1_AXI_awsize[2:0];
  assign Conn1_AWVALID = SLOT_1_AXI_awvalid;
  assign Conn1_BID = SLOT_1_AXI_bid[0];
  assign Conn1_BREADY = SLOT_1_AXI_bready;
  assign Conn1_BRESP = SLOT_1_AXI_bresp[1:0];
  assign Conn1_BVALID = SLOT_1_AXI_bvalid;
  assign Conn1_RDATA = SLOT_1_AXI_rdata[511:0];
  assign Conn1_RID = SLOT_1_AXI_rid[0];
  assign Conn1_RLAST = SLOT_1_AXI_rlast;
  assign Conn1_RREADY = SLOT_1_AXI_rready;
  assign Conn1_RRESP = SLOT_1_AXI_rresp[1:0];
  assign Conn1_RVALID = SLOT_1_AXI_rvalid;
  assign Conn1_WDATA = SLOT_1_AXI_wdata[511:0];
  assign Conn1_WLAST = SLOT_1_AXI_wlast;
  assign Conn1_WREADY = SLOT_1_AXI_wready;
  assign Conn1_WSTRB = SLOT_1_AXI_wstrb[63:0];
  assign Conn1_WVALID = SLOT_1_AXI_wvalid;
  assign Conn2_ARADDR = SLOT_2_AXI_araddr[31:0];
  assign Conn2_ARPROT = SLOT_2_AXI_arprot[2:0];
  assign Conn2_ARREADY = SLOT_2_AXI_arready;
  assign Conn2_ARVALID = SLOT_2_AXI_arvalid;
  assign Conn2_AWADDR = SLOT_2_AXI_awaddr[31:0];
  assign Conn2_AWPROT = SLOT_2_AXI_awprot[2:0];
  assign Conn2_AWREADY = SLOT_2_AXI_awready;
  assign Conn2_AWVALID = SLOT_2_AXI_awvalid;
  assign Conn2_BREADY = SLOT_2_AXI_bready;
  assign Conn2_BRESP = SLOT_2_AXI_bresp[1:0];
  assign Conn2_BVALID = SLOT_2_AXI_bvalid;
  assign Conn2_RDATA = SLOT_2_AXI_rdata[31:0];
  assign Conn2_RREADY = SLOT_2_AXI_rready;
  assign Conn2_RRESP = SLOT_2_AXI_rresp[1:0];
  assign Conn2_RVALID = SLOT_2_AXI_rvalid;
  assign Conn2_WDATA = SLOT_2_AXI_wdata[31:0];
  assign Conn2_WREADY = SLOT_2_AXI_wready;
  assign Conn2_WSTRB = SLOT_2_AXI_wstrb[3:0];
  assign Conn2_WVALID = SLOT_2_AXI_wvalid;
  assign Conn3_TDATA = SLOT_3_AXIS_tdata[63:0];
  assign Conn3_TKEEP = SLOT_3_AXIS_tkeep[7:0];
  assign Conn3_TLAST = SLOT_3_AXIS_tlast;
  assign Conn3_TREADY = SLOT_3_AXIS_tready;
  assign Conn3_TVALID = SLOT_3_AXIS_tvalid;
  assign Conn4_TDATA = SLOT_4_AXIS_tdata[63:0];
  assign Conn4_TKEEP = SLOT_4_AXIS_tkeep[7:0];
  assign Conn4_TLAST = SLOT_4_AXIS_tlast;
  assign Conn4_TREADY = SLOT_4_AXIS_tready;
  assign Conn4_TVALID = SLOT_4_AXIS_tvalid;
  assign Conn_ARADDR = SLOT_0_AXI_araddr[31:0];
  assign Conn_ARBURST = SLOT_0_AXI_arburst[1:0];
  assign Conn_ARCACHE = SLOT_0_AXI_arcache[3:0];
  assign Conn_ARID = SLOT_0_AXI_arid[0];
  assign Conn_ARLEN = SLOT_0_AXI_arlen[7:0];
  assign Conn_ARLOCK = SLOT_0_AXI_arlock[0];
  assign Conn_ARPROT = SLOT_0_AXI_arprot[2:0];
  assign Conn_ARQOS = SLOT_0_AXI_arqos[3:0];
  assign Conn_ARREADY = SLOT_0_AXI_arready;
  assign Conn_ARREGION = SLOT_0_AXI_arregion[3:0];
  assign Conn_ARSIZE = SLOT_0_AXI_arsize[2:0];
  assign Conn_ARVALID = SLOT_0_AXI_arvalid;
  assign Conn_AWADDR = SLOT_0_AXI_awaddr[31:0];
  assign Conn_AWBURST = SLOT_0_AXI_awburst[1:0];
  assign Conn_AWCACHE = SLOT_0_AXI_awcache[3:0];
  assign Conn_AWID = SLOT_0_AXI_awid[0];
  assign Conn_AWLEN = SLOT_0_AXI_awlen[7:0];
  assign Conn_AWLOCK = SLOT_0_AXI_awlock[0];
  assign Conn_AWPROT = SLOT_0_AXI_awprot[2:0];
  assign Conn_AWQOS = SLOT_0_AXI_awqos[3:0];
  assign Conn_AWREADY = SLOT_0_AXI_awready;
  assign Conn_AWREGION = SLOT_0_AXI_awregion[3:0];
  assign Conn_AWSIZE = SLOT_0_AXI_awsize[2:0];
  assign Conn_AWVALID = SLOT_0_AXI_awvalid;
  assign Conn_BID = SLOT_0_AXI_bid[0];
  assign Conn_BREADY = SLOT_0_AXI_bready;
  assign Conn_BRESP = SLOT_0_AXI_bresp[1:0];
  assign Conn_BVALID = SLOT_0_AXI_bvalid;
  assign Conn_RDATA = SLOT_0_AXI_rdata[511:0];
  assign Conn_RID = SLOT_0_AXI_rid[0];
  assign Conn_RLAST = SLOT_0_AXI_rlast;
  assign Conn_RREADY = SLOT_0_AXI_rready;
  assign Conn_RRESP = SLOT_0_AXI_rresp[1:0];
  assign Conn_RVALID = SLOT_0_AXI_rvalid;
  assign Conn_WDATA = SLOT_0_AXI_wdata[511:0];
  assign Conn_WLAST = SLOT_0_AXI_wlast;
  assign Conn_WREADY = SLOT_0_AXI_wready;
  assign Conn_WSTRB = SLOT_0_AXI_wstrb[63:0];
  assign Conn_WVALID = SLOT_0_AXI_wvalid;
  assign clk_1 = clk;
  assign resetn_1 = resetn;
  bd_6748_g_inst_0 g_inst
       (.aclk(clk_1),
        .aresetn(resetn_1),
        .m_slot_0_axi_ar_cnt(net_slot_0_axi_ar_cnt),
        .m_slot_0_axi_araddr(net_slot_0_axi_araddr),
        .m_slot_0_axi_arburst(net_slot_0_axi_arburst),
        .m_slot_0_axi_arcache(net_slot_0_axi_arcache),
        .m_slot_0_axi_arid(net_slot_0_axi_arid),
        .m_slot_0_axi_arlen(net_slot_0_axi_arlen),
        .m_slot_0_axi_arlock(net_slot_0_axi_arlock),
        .m_slot_0_axi_arprot(net_slot_0_axi_arprot),
        .m_slot_0_axi_arqos(net_slot_0_axi_arqos),
        .m_slot_0_axi_arready(net_slot_0_axi_arready),
        .m_slot_0_axi_arregion(net_slot_0_axi_arregion),
        .m_slot_0_axi_arsize(net_slot_0_axi_arsize),
        .m_slot_0_axi_arvalid(net_slot_0_axi_arvalid),
        .m_slot_0_axi_aw_cnt(net_slot_0_axi_aw_cnt),
        .m_slot_0_axi_awaddr(net_slot_0_axi_awaddr),
        .m_slot_0_axi_awburst(net_slot_0_axi_awburst),
        .m_slot_0_axi_awcache(net_slot_0_axi_awcache),
        .m_slot_0_axi_awid(net_slot_0_axi_awid),
        .m_slot_0_axi_awlen(net_slot_0_axi_awlen),
        .m_slot_0_axi_awlock(net_slot_0_axi_awlock),
        .m_slot_0_axi_awprot(net_slot_0_axi_awprot),
        .m_slot_0_axi_awqos(net_slot_0_axi_awqos),
        .m_slot_0_axi_awready(net_slot_0_axi_awready),
        .m_slot_0_axi_awregion(net_slot_0_axi_awregion),
        .m_slot_0_axi_awsize(net_slot_0_axi_awsize),
        .m_slot_0_axi_awvalid(net_slot_0_axi_awvalid),
        .m_slot_0_axi_b_cnt(net_slot_0_axi_b_cnt),
        .m_slot_0_axi_bid(net_slot_0_axi_bid),
        .m_slot_0_axi_bready(net_slot_0_axi_bready),
        .m_slot_0_axi_bresp(net_slot_0_axi_bresp),
        .m_slot_0_axi_bvalid(net_slot_0_axi_bvalid),
        .m_slot_0_axi_r_cnt(net_slot_0_axi_r_cnt),
        .m_slot_0_axi_rdata(net_slot_0_axi_rdata),
        .m_slot_0_axi_rid(net_slot_0_axi_rid),
        .m_slot_0_axi_rlast(net_slot_0_axi_rlast),
        .m_slot_0_axi_rready(net_slot_0_axi_rready),
        .m_slot_0_axi_rresp(net_slot_0_axi_rresp),
        .m_slot_0_axi_rvalid(net_slot_0_axi_rvalid),
        .m_slot_0_axi_wdata(net_slot_0_axi_wdata),
        .m_slot_0_axi_wlast(net_slot_0_axi_wlast),
        .m_slot_0_axi_wready(net_slot_0_axi_wready),
        .m_slot_0_axi_wstrb(net_slot_0_axi_wstrb),
        .m_slot_0_axi_wvalid(net_slot_0_axi_wvalid),
        .m_slot_1_axi_ar_cnt(net_slot_1_axi_ar_cnt),
        .m_slot_1_axi_araddr(net_slot_1_axi_araddr),
        .m_slot_1_axi_arburst(net_slot_1_axi_arburst),
        .m_slot_1_axi_arcache(net_slot_1_axi_arcache),
        .m_slot_1_axi_arid(net_slot_1_axi_arid),
        .m_slot_1_axi_arlen(net_slot_1_axi_arlen),
        .m_slot_1_axi_arlock(net_slot_1_axi_arlock),
        .m_slot_1_axi_arprot(net_slot_1_axi_arprot),
        .m_slot_1_axi_arqos(net_slot_1_axi_arqos),
        .m_slot_1_axi_arready(net_slot_1_axi_arready),
        .m_slot_1_axi_arregion(net_slot_1_axi_arregion),
        .m_slot_1_axi_arsize(net_slot_1_axi_arsize),
        .m_slot_1_axi_arvalid(net_slot_1_axi_arvalid),
        .m_slot_1_axi_aw_cnt(net_slot_1_axi_aw_cnt),
        .m_slot_1_axi_awaddr(net_slot_1_axi_awaddr),
        .m_slot_1_axi_awburst(net_slot_1_axi_awburst),
        .m_slot_1_axi_awcache(net_slot_1_axi_awcache),
        .m_slot_1_axi_awid(net_slot_1_axi_awid),
        .m_slot_1_axi_awlen(net_slot_1_axi_awlen),
        .m_slot_1_axi_awlock(net_slot_1_axi_awlock),
        .m_slot_1_axi_awprot(net_slot_1_axi_awprot),
        .m_slot_1_axi_awqos(net_slot_1_axi_awqos),
        .m_slot_1_axi_awready(net_slot_1_axi_awready),
        .m_slot_1_axi_awregion(net_slot_1_axi_awregion),
        .m_slot_1_axi_awsize(net_slot_1_axi_awsize),
        .m_slot_1_axi_awvalid(net_slot_1_axi_awvalid),
        .m_slot_1_axi_b_cnt(net_slot_1_axi_b_cnt),
        .m_slot_1_axi_bid(net_slot_1_axi_bid),
        .m_slot_1_axi_bready(net_slot_1_axi_bready),
        .m_slot_1_axi_bresp(net_slot_1_axi_bresp),
        .m_slot_1_axi_bvalid(net_slot_1_axi_bvalid),
        .m_slot_1_axi_r_cnt(net_slot_1_axi_r_cnt),
        .m_slot_1_axi_rdata(net_slot_1_axi_rdata),
        .m_slot_1_axi_rid(net_slot_1_axi_rid),
        .m_slot_1_axi_rlast(net_slot_1_axi_rlast),
        .m_slot_1_axi_rready(net_slot_1_axi_rready),
        .m_slot_1_axi_rresp(net_slot_1_axi_rresp),
        .m_slot_1_axi_rvalid(net_slot_1_axi_rvalid),
        .m_slot_1_axi_wdata(net_slot_1_axi_wdata),
        .m_slot_1_axi_wlast(net_slot_1_axi_wlast),
        .m_slot_1_axi_wready(net_slot_1_axi_wready),
        .m_slot_1_axi_wstrb(net_slot_1_axi_wstrb),
        .m_slot_1_axi_wvalid(net_slot_1_axi_wvalid),
        .m_slot_2_axi_ar_cnt(net_slot_2_axi_ar_cnt),
        .m_slot_2_axi_araddr(net_slot_2_axi_araddr),
        .m_slot_2_axi_arprot(net_slot_2_axi_arprot),
        .m_slot_2_axi_arready(net_slot_2_axi_arready),
        .m_slot_2_axi_arvalid(net_slot_2_axi_arvalid),
        .m_slot_2_axi_aw_cnt(net_slot_2_axi_aw_cnt),
        .m_slot_2_axi_awaddr(net_slot_2_axi_awaddr),
        .m_slot_2_axi_awprot(net_slot_2_axi_awprot),
        .m_slot_2_axi_awready(net_slot_2_axi_awready),
        .m_slot_2_axi_awvalid(net_slot_2_axi_awvalid),
        .m_slot_2_axi_b_cnt(net_slot_2_axi_b_cnt),
        .m_slot_2_axi_bready(net_slot_2_axi_bready),
        .m_slot_2_axi_bresp(net_slot_2_axi_bresp),
        .m_slot_2_axi_bvalid(net_slot_2_axi_bvalid),
        .m_slot_2_axi_r_cnt(net_slot_2_axi_r_cnt),
        .m_slot_2_axi_rdata(net_slot_2_axi_rdata),
        .m_slot_2_axi_rready(net_slot_2_axi_rready),
        .m_slot_2_axi_rresp(net_slot_2_axi_rresp),
        .m_slot_2_axi_rvalid(net_slot_2_axi_rvalid),
        .m_slot_2_axi_wdata(net_slot_2_axi_wdata),
        .m_slot_2_axi_wready(net_slot_2_axi_wready),
        .m_slot_2_axi_wstrb(net_slot_2_axi_wstrb),
        .m_slot_2_axi_wvalid(net_slot_2_axi_wvalid),
        .m_slot_3_axis_tdata(net_slot_3_axis_tdata),
        .m_slot_3_axis_tkeep(net_slot_3_axis_tkeep),
        .m_slot_3_axis_tlast(net_slot_3_axis_tlast),
        .m_slot_3_axis_tready(net_slot_3_axis_tready),
        .m_slot_3_axis_tvalid(net_slot_3_axis_tvalid),
        .m_slot_4_axis_tdata(net_slot_4_axis_tdata),
        .m_slot_4_axis_tkeep(net_slot_4_axis_tkeep),
        .m_slot_4_axis_tlast(net_slot_4_axis_tlast),
        .m_slot_4_axis_tready(net_slot_4_axis_tready),
        .m_slot_4_axis_tvalid(net_slot_4_axis_tvalid),
        .slot_0_axi_araddr(Conn_ARADDR),
        .slot_0_axi_arburst(Conn_ARBURST),
        .slot_0_axi_arcache(Conn_ARCACHE),
        .slot_0_axi_arid(Conn_ARID),
        .slot_0_axi_arlen(Conn_ARLEN),
        .slot_0_axi_arlock(Conn_ARLOCK),
        .slot_0_axi_arprot(Conn_ARPROT),
        .slot_0_axi_arqos(Conn_ARQOS),
        .slot_0_axi_arready(Conn_ARREADY),
        .slot_0_axi_arregion(Conn_ARREGION),
        .slot_0_axi_arsize(Conn_ARSIZE),
        .slot_0_axi_arvalid(Conn_ARVALID),
        .slot_0_axi_awaddr(Conn_AWADDR),
        .slot_0_axi_awburst(Conn_AWBURST),
        .slot_0_axi_awcache(Conn_AWCACHE),
        .slot_0_axi_awid(Conn_AWID),
        .slot_0_axi_awlen(Conn_AWLEN),
        .slot_0_axi_awlock(Conn_AWLOCK),
        .slot_0_axi_awprot(Conn_AWPROT),
        .slot_0_axi_awqos(Conn_AWQOS),
        .slot_0_axi_awready(Conn_AWREADY),
        .slot_0_axi_awregion(Conn_AWREGION),
        .slot_0_axi_awsize(Conn_AWSIZE),
        .slot_0_axi_awvalid(Conn_AWVALID),
        .slot_0_axi_bid(Conn_BID),
        .slot_0_axi_bready(Conn_BREADY),
        .slot_0_axi_bresp(Conn_BRESP),
        .slot_0_axi_bvalid(Conn_BVALID),
        .slot_0_axi_rdata(Conn_RDATA),
        .slot_0_axi_rid(Conn_RID),
        .slot_0_axi_rlast(Conn_RLAST),
        .slot_0_axi_rready(Conn_RREADY),
        .slot_0_axi_rresp(Conn_RRESP),
        .slot_0_axi_rvalid(Conn_RVALID),
        .slot_0_axi_wdata(Conn_WDATA),
        .slot_0_axi_wlast(Conn_WLAST),
        .slot_0_axi_wready(Conn_WREADY),
        .slot_0_axi_wstrb(Conn_WSTRB),
        .slot_0_axi_wvalid(Conn_WVALID),
        .slot_1_axi_araddr(Conn1_ARADDR),
        .slot_1_axi_arburst(Conn1_ARBURST),
        .slot_1_axi_arcache(Conn1_ARCACHE),
        .slot_1_axi_arid(Conn1_ARID),
        .slot_1_axi_arlen(Conn1_ARLEN),
        .slot_1_axi_arlock(Conn1_ARLOCK),
        .slot_1_axi_arprot(Conn1_ARPROT),
        .slot_1_axi_arqos(Conn1_ARQOS),
        .slot_1_axi_arready(Conn1_ARREADY),
        .slot_1_axi_arregion(Conn1_ARREGION),
        .slot_1_axi_arsize(Conn1_ARSIZE),
        .slot_1_axi_arvalid(Conn1_ARVALID),
        .slot_1_axi_awaddr(Conn1_AWADDR),
        .slot_1_axi_awburst(Conn1_AWBURST),
        .slot_1_axi_awcache(Conn1_AWCACHE),
        .slot_1_axi_awid(Conn1_AWID),
        .slot_1_axi_awlen(Conn1_AWLEN),
        .slot_1_axi_awlock(Conn1_AWLOCK),
        .slot_1_axi_awprot(Conn1_AWPROT),
        .slot_1_axi_awqos(Conn1_AWQOS),
        .slot_1_axi_awready(Conn1_AWREADY),
        .slot_1_axi_awregion(Conn1_AWREGION),
        .slot_1_axi_awsize(Conn1_AWSIZE),
        .slot_1_axi_awvalid(Conn1_AWVALID),
        .slot_1_axi_bid(Conn1_BID),
        .slot_1_axi_bready(Conn1_BREADY),
        .slot_1_axi_bresp(Conn1_BRESP),
        .slot_1_axi_bvalid(Conn1_BVALID),
        .slot_1_axi_rdata(Conn1_RDATA),
        .slot_1_axi_rid(Conn1_RID),
        .slot_1_axi_rlast(Conn1_RLAST),
        .slot_1_axi_rready(Conn1_RREADY),
        .slot_1_axi_rresp(Conn1_RRESP),
        .slot_1_axi_rvalid(Conn1_RVALID),
        .slot_1_axi_wdata(Conn1_WDATA),
        .slot_1_axi_wlast(Conn1_WLAST),
        .slot_1_axi_wready(Conn1_WREADY),
        .slot_1_axi_wstrb(Conn1_WSTRB),
        .slot_1_axi_wvalid(Conn1_WVALID),
        .slot_2_axi_araddr(Conn2_ARADDR),
        .slot_2_axi_arprot(Conn2_ARPROT),
        .slot_2_axi_arready(Conn2_ARREADY),
        .slot_2_axi_arvalid(Conn2_ARVALID),
        .slot_2_axi_awaddr(Conn2_AWADDR),
        .slot_2_axi_awprot(Conn2_AWPROT),
        .slot_2_axi_awready(Conn2_AWREADY),
        .slot_2_axi_awvalid(Conn2_AWVALID),
        .slot_2_axi_bready(Conn2_BREADY),
        .slot_2_axi_bresp(Conn2_BRESP),
        .slot_2_axi_bvalid(Conn2_BVALID),
        .slot_2_axi_rdata(Conn2_RDATA),
        .slot_2_axi_rready(Conn2_RREADY),
        .slot_2_axi_rresp(Conn2_RRESP),
        .slot_2_axi_rvalid(Conn2_RVALID),
        .slot_2_axi_wdata(Conn2_WDATA),
        .slot_2_axi_wready(Conn2_WREADY),
        .slot_2_axi_wstrb(Conn2_WSTRB),
        .slot_2_axi_wvalid(Conn2_WVALID),
        .slot_3_axis_tdata(Conn3_TDATA),
        .slot_3_axis_tkeep(Conn3_TKEEP),
        .slot_3_axis_tlast(Conn3_TLAST),
        .slot_3_axis_tready(Conn3_TREADY),
        .slot_3_axis_tvalid(Conn3_TVALID),
        .slot_4_axis_tdata(Conn4_TDATA),
        .slot_4_axis_tkeep(Conn4_TKEEP),
        .slot_4_axis_tlast(Conn4_TLAST),
        .slot_4_axis_tready(Conn4_TREADY),
        .slot_4_axis_tvalid(Conn4_TVALID));
  bd_6748_ila_lib_0 ila_lib
       (.clk(clk_1),
        .probe0(net_slot_0_axi_ar_cnt),
        .probe1(net_slot_0_axi_araddr),
        .probe10(net_slot_0_axi_arsize),
        .probe11(net_slot_0_axi_aw_cnt),
        .probe12(net_slot_0_axi_awaddr),
        .probe13(net_slot_0_axi_awburst),
        .probe14(net_slot_0_axi_awcache),
        .probe15(net_slot_0_axi_awid),
        .probe16(net_slot_0_axi_awlen),
        .probe17(net_slot_0_axi_awlock),
        .probe18(net_slot_0_axi_awprot),
        .probe19(net_slot_0_axi_awqos),
        .probe2(net_slot_0_axi_arburst),
        .probe20(net_slot_0_axi_awregion),
        .probe21(net_slot_0_axi_awsize),
        .probe22(net_slot_0_axi_b_cnt),
        .probe23(net_slot_0_axi_bid),
        .probe24(net_slot_0_axi_bresp),
        .probe25(net_slot_0_axi_r_cnt),
        .probe26(net_slot_0_axi_rdata),
        .probe27(net_slot_0_axi_rid),
        .probe28(net_slot_0_axi_rresp),
        .probe29(net_slot_0_axi_wdata),
        .probe3(net_slot_0_axi_arcache),
        .probe30(net_slot_0_axi_wstrb),
        .probe31(net_slot_0_axi_aw_ctrl),
        .probe32(net_slot_0_axi_w_ctrl),
        .probe33(net_slot_0_axi_b_ctrl),
        .probe34(net_slot_0_axi_ar_ctrl),
        .probe35(net_slot_0_axi_r_ctrl),
        .probe36(net_slot_1_axi_ar_cnt),
        .probe37(net_slot_1_axi_araddr),
        .probe38(net_slot_1_axi_arburst),
        .probe39(net_slot_1_axi_arcache),
        .probe4(net_slot_0_axi_arid),
        .probe40(net_slot_1_axi_arid),
        .probe41(net_slot_1_axi_arlen),
        .probe42(net_slot_1_axi_arlock),
        .probe43(net_slot_1_axi_arprot),
        .probe44(net_slot_1_axi_arqos),
        .probe45(net_slot_1_axi_arregion),
        .probe46(net_slot_1_axi_arsize),
        .probe47(net_slot_1_axi_aw_cnt),
        .probe48(net_slot_1_axi_awaddr),
        .probe49(net_slot_1_axi_awburst),
        .probe5(net_slot_0_axi_arlen),
        .probe50(net_slot_1_axi_awcache),
        .probe51(net_slot_1_axi_awid),
        .probe52(net_slot_1_axi_awlen),
        .probe53(net_slot_1_axi_awlock),
        .probe54(net_slot_1_axi_awprot),
        .probe55(net_slot_1_axi_awqos),
        .probe56(net_slot_1_axi_awregion),
        .probe57(net_slot_1_axi_awsize),
        .probe58(net_slot_1_axi_b_cnt),
        .probe59(net_slot_1_axi_bid),
        .probe6(net_slot_0_axi_arlock),
        .probe60(net_slot_1_axi_bresp),
        .probe61(net_slot_1_axi_r_cnt),
        .probe62(net_slot_1_axi_rdata),
        .probe63(net_slot_1_axi_rid),
        .probe64(net_slot_1_axi_rresp),
        .probe65(net_slot_1_axi_wdata),
        .probe66(net_slot_1_axi_wstrb),
        .probe67(net_slot_1_axi_aw_ctrl),
        .probe68(net_slot_1_axi_w_ctrl),
        .probe69(net_slot_1_axi_b_ctrl),
        .probe7(net_slot_0_axi_arprot),
        .probe70(net_slot_1_axi_ar_ctrl),
        .probe71(net_slot_1_axi_r_ctrl),
        .probe72(net_slot_2_axi_ar_cnt),
        .probe73(net_slot_2_axi_araddr),
        .probe74(net_slot_2_axi_arprot),
        .probe75(net_slot_2_axi_aw_cnt),
        .probe76(net_slot_2_axi_awaddr),
        .probe77(net_slot_2_axi_awprot),
        .probe78(net_slot_2_axi_b_cnt),
        .probe79(net_slot_2_axi_bresp),
        .probe8(net_slot_0_axi_arqos),
        .probe80(net_slot_2_axi_r_cnt),
        .probe81(net_slot_2_axi_rdata),
        .probe82(net_slot_2_axi_rresp),
        .probe83(net_slot_2_axi_wdata),
        .probe84(net_slot_2_axi_wstrb),
        .probe85(net_slot_2_axi_aw_ctrl),
        .probe86(net_slot_2_axi_w_ctrl),
        .probe87(net_slot_2_axi_b_ctrl),
        .probe88(net_slot_2_axi_ar_ctrl),
        .probe89(net_slot_2_axi_r_ctrl),
        .probe9(net_slot_0_axi_arregion),
        .probe90(net_slot_3_axis_tdata),
        .probe91(net_slot_3_axis_tkeep),
        .probe92(net_slot_3_axis_tvalid),
        .probe93(net_slot_3_axis_tready),
        .probe94(net_slot_3_axis_tlast),
        .probe95(net_slot_4_axis_tdata),
        .probe96(net_slot_4_axis_tkeep),
        .probe97(net_slot_4_axis_tvalid),
        .probe98(net_slot_4_axis_tready),
        .probe99(net_slot_4_axis_tlast));
  bd_6748_slot_0_ar_0 slot_0_ar
       (.In0(net_slot_0_axi_arvalid),
        .In1(net_slot_0_axi_arready),
        .dout(net_slot_0_axi_ar_ctrl));
  bd_6748_slot_0_aw_0 slot_0_aw
       (.In0(net_slot_0_axi_awvalid),
        .In1(net_slot_0_axi_awready),
        .dout(net_slot_0_axi_aw_ctrl));
  bd_6748_slot_0_b_0 slot_0_b
       (.In0(net_slot_0_axi_bvalid),
        .In1(net_slot_0_axi_bready),
        .dout(net_slot_0_axi_b_ctrl));
  bd_6748_slot_0_r_0 slot_0_r
       (.In0(net_slot_0_axi_rvalid),
        .In1(net_slot_0_axi_rready),
        .In2(net_slot_0_axi_rlast),
        .dout(net_slot_0_axi_r_ctrl));
  bd_6748_slot_0_w_0 slot_0_w
       (.In0(net_slot_0_axi_wvalid),
        .In1(net_slot_0_axi_wready),
        .In2(net_slot_0_axi_wlast),
        .dout(net_slot_0_axi_w_ctrl));
  bd_6748_slot_1_ar_0 slot_1_ar
       (.In0(net_slot_1_axi_arvalid),
        .In1(net_slot_1_axi_arready),
        .dout(net_slot_1_axi_ar_ctrl));
  bd_6748_slot_1_aw_0 slot_1_aw
       (.In0(net_slot_1_axi_awvalid),
        .In1(net_slot_1_axi_awready),
        .dout(net_slot_1_axi_aw_ctrl));
  bd_6748_slot_1_b_0 slot_1_b
       (.In0(net_slot_1_axi_bvalid),
        .In1(net_slot_1_axi_bready),
        .dout(net_slot_1_axi_b_ctrl));
  bd_6748_slot_1_r_0 slot_1_r
       (.In0(net_slot_1_axi_rvalid),
        .In1(net_slot_1_axi_rready),
        .In2(net_slot_1_axi_rlast),
        .dout(net_slot_1_axi_r_ctrl));
  bd_6748_slot_1_w_0 slot_1_w
       (.In0(net_slot_1_axi_wvalid),
        .In1(net_slot_1_axi_wready),
        .In2(net_slot_1_axi_wlast),
        .dout(net_slot_1_axi_w_ctrl));
  bd_6748_slot_2_ar_0 slot_2_ar
       (.In0(net_slot_2_axi_arvalid),
        .In1(net_slot_2_axi_arready),
        .dout(net_slot_2_axi_ar_ctrl));
  bd_6748_slot_2_aw_0 slot_2_aw
       (.In0(net_slot_2_axi_awvalid),
        .In1(net_slot_2_axi_awready),
        .dout(net_slot_2_axi_aw_ctrl));
  bd_6748_slot_2_b_0 slot_2_b
       (.In0(net_slot_2_axi_bvalid),
        .In1(net_slot_2_axi_bready),
        .dout(net_slot_2_axi_b_ctrl));
  bd_6748_slot_2_r_0 slot_2_r
       (.In0(net_slot_2_axi_rvalid),
        .In1(net_slot_2_axi_rready),
        .dout(net_slot_2_axi_r_ctrl));
  bd_6748_slot_2_w_0 slot_2_w
       (.In0(net_slot_2_axi_wvalid),
        .In1(net_slot_2_axi_wready),
        .dout(net_slot_2_axi_w_ctrl));
endmodule
