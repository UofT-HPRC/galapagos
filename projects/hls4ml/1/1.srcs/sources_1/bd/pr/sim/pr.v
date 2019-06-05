//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
//Date        : Mon Apr 22 21:33:40 2019
//Host        : batcomputer.arkham running 64-bit Ubuntu 16.04.2 LTS
//Command     : generate_target pr.bd
//Design      : pr
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module applicationRegion_imp_1EIFTCH
   (ARESETN,
    CLK,
    S00_AXIS_tdata,
    S00_AXIS_tdest,
    S00_AXIS_tkeep,
    S00_AXIS_tlast,
    S00_AXIS_tready,
    S00_AXIS_tvalid,
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
    S_AXI_MEM_1_wvalid,
    network_addr_V,
    stream_out_network_V_tdata,
    stream_out_network_V_tdest,
    stream_out_network_V_tkeep,
    stream_out_network_V_tlast,
    stream_out_network_V_tready,
    stream_out_network_V_tvalid);
  input ARESETN;
  input CLK;
  input [63:0]S00_AXIS_tdata;
  input [7:0]S00_AXIS_tdest;
  input [7:0]S00_AXIS_tkeep;
  input [0:0]S00_AXIS_tlast;
  output [0:0]S00_AXIS_tready;
  input [0:0]S00_AXIS_tvalid;
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
  input [47:0]network_addr_V;
  output [63:0]stream_out_network_V_tdata;
  output [7:0]stream_out_network_V_tdest;
  output [7:0]stream_out_network_V_tkeep;
  output [0:0]stream_out_network_V_tlast;
  input stream_out_network_V_tready;
  output stream_out_network_V_tvalid;

  wire ARESETN_1;
  wire CLK_1;
  wire [15:0]Conn1_ARADDR;
  wire [2:0]Conn1_ARPROT;
  wire Conn1_ARREADY;
  wire Conn1_ARVALID;
  wire [15:0]Conn1_AWADDR;
  wire [2:0]Conn1_AWPROT;
  wire Conn1_AWREADY;
  wire Conn1_AWVALID;
  wire Conn1_BREADY;
  wire [1:0]Conn1_BRESP;
  wire Conn1_BVALID;
  wire [31:0]Conn1_RDATA;
  wire Conn1_RREADY;
  wire [1:0]Conn1_RRESP;
  wire Conn1_RVALID;
  wire [31:0]Conn1_WDATA;
  wire Conn1_WREADY;
  wire [3:0]Conn1_WSTRB;
  wire Conn1_WVALID;
  wire [31:0]Conn2_ARADDR;
  wire [1:0]Conn2_ARBURST;
  wire [3:0]Conn2_ARCACHE;
  wire [7:0]Conn2_ARLEN;
  wire [0:0]Conn2_ARLOCK;
  wire [2:0]Conn2_ARPROT;
  wire [3:0]Conn2_ARQOS;
  wire Conn2_ARREADY;
  wire [2:0]Conn2_ARSIZE;
  wire [3:0]Conn2_ARUSER;
  wire Conn2_ARVALID;
  wire [31:0]Conn2_AWADDR;
  wire [1:0]Conn2_AWBURST;
  wire [3:0]Conn2_AWCACHE;
  wire [7:0]Conn2_AWLEN;
  wire [0:0]Conn2_AWLOCK;
  wire [2:0]Conn2_AWPROT;
  wire [3:0]Conn2_AWQOS;
  wire Conn2_AWREADY;
  wire [2:0]Conn2_AWSIZE;
  wire [3:0]Conn2_AWUSER;
  wire Conn2_AWVALID;
  wire Conn2_BREADY;
  wire [1:0]Conn2_BRESP;
  wire Conn2_BVALID;
  wire [511:0]Conn2_RDATA;
  wire Conn2_RLAST;
  wire Conn2_RREADY;
  wire [1:0]Conn2_RRESP;
  wire Conn2_RVALID;
  wire [511:0]Conn2_WDATA;
  wire Conn2_WLAST;
  wire Conn2_WREADY;
  wire [63:0]Conn2_WSTRB;
  wire Conn2_WVALID;
  wire [63:0]Conn4_TDATA;
  wire [7:0]Conn4_TDEST;
  wire [7:0]Conn4_TKEEP;
  wire [0:0]Conn4_TLAST;
  wire [0:0]Conn4_TREADY;
  wire [0:0]Conn4_TVALID;
  wire [63:0]Conn5_TDATA;
  wire [7:0]Conn5_TDEST;
  wire [7:0]Conn5_TKEEP;
  wire [0:0]Conn5_TLAST;
  wire Conn5_TREADY;
  wire Conn5_TVALID;
  wire [63:0]axi_datamover_0_M_AXIS_MM2S_TDATA;
  wire axi_datamover_0_M_AXIS_MM2S_TLAST;
  wire axi_datamover_0_M_AXIS_MM2S_TREADY;
  wire axi_datamover_0_M_AXIS_MM2S_TVALID;
  wire [31:0]axi_datamover_0_M_AXI_MM2S_ARADDR;
  wire [1:0]axi_datamover_0_M_AXI_MM2S_ARBURST;
  wire [3:0]axi_datamover_0_M_AXI_MM2S_ARCACHE;
  wire [3:0]axi_datamover_0_M_AXI_MM2S_ARID;
  wire [7:0]axi_datamover_0_M_AXI_MM2S_ARLEN;
  wire [2:0]axi_datamover_0_M_AXI_MM2S_ARPROT;
  wire axi_datamover_0_M_AXI_MM2S_ARREADY;
  wire [2:0]axi_datamover_0_M_AXI_MM2S_ARSIZE;
  wire [3:0]axi_datamover_0_M_AXI_MM2S_ARUSER;
  wire axi_datamover_0_M_AXI_MM2S_ARVALID;
  wire [63:0]axi_datamover_0_M_AXI_MM2S_RDATA;
  wire axi_datamover_0_M_AXI_MM2S_RLAST;
  wire axi_datamover_0_M_AXI_MM2S_RREADY;
  wire [1:0]axi_datamover_0_M_AXI_MM2S_RRESP;
  wire axi_datamover_0_M_AXI_MM2S_RVALID;
  wire [31:0]axi_datamover_0_M_AXI_S2MM_AWADDR;
  wire [1:0]axi_datamover_0_M_AXI_S2MM_AWBURST;
  wire [3:0]axi_datamover_0_M_AXI_S2MM_AWCACHE;
  wire [3:0]axi_datamover_0_M_AXI_S2MM_AWID;
  wire [7:0]axi_datamover_0_M_AXI_S2MM_AWLEN;
  wire [2:0]axi_datamover_0_M_AXI_S2MM_AWPROT;
  wire axi_datamover_0_M_AXI_S2MM_AWREADY;
  wire [2:0]axi_datamover_0_M_AXI_S2MM_AWSIZE;
  wire [3:0]axi_datamover_0_M_AXI_S2MM_AWUSER;
  wire axi_datamover_0_M_AXI_S2MM_AWVALID;
  wire axi_datamover_0_M_AXI_S2MM_BREADY;
  wire [1:0]axi_datamover_0_M_AXI_S2MM_BRESP;
  wire axi_datamover_0_M_AXI_S2MM_BVALID;
  wire [63:0]axi_datamover_0_M_AXI_S2MM_WDATA;
  wire axi_datamover_0_M_AXI_S2MM_WLAST;
  wire axi_datamover_0_M_AXI_S2MM_WREADY;
  wire [7:0]axi_datamover_0_M_AXI_S2MM_WSTRB;
  wire axi_datamover_0_M_AXI_S2MM_WVALID;
  wire [31:0]custom_switch_inst_network_table_V_PORTA_ADDR;
  wire custom_switch_inst_network_table_V_PORTA_CLK;
  wire [63:0]custom_switch_inst_network_table_V_PORTA_DOUT;
  wire custom_switch_inst_network_table_V_PORTA_EN;
  wire custom_switch_inst_network_table_V_PORTA_RST;
  wire [63:0]custom_switch_inst_stream_out_switch_V_TDATA;
  wire [7:0]custom_switch_inst_stream_out_switch_V_TDEST;
  wire [7:0]custom_switch_inst_stream_out_switch_V_TKEEP;
  wire [0:0]custom_switch_inst_stream_out_switch_V_TLAST;
  wire [1:1]custom_switch_inst_stream_out_switch_V_TREADY;
  wire custom_switch_inst_stream_out_switch_V_TVALID;
  wire [71:0]dariusController_raw_0_axis_cmd_mm2s_V_data_V_TDATA;
  wire dariusController_raw_0_axis_cmd_mm2s_V_data_V_TREADY;
  wire dariusController_raw_0_axis_cmd_mm2s_V_data_V_TVALID;
  wire [71:0]dariusController_raw_0_axis_cmd_s2mm_V_data_V_TDATA;
  wire dariusController_raw_0_axis_cmd_s2mm_V_data_V_TREADY;
  wire dariusController_raw_0_axis_cmd_s2mm_V_data_V_TVALID;
  wire [63:0]dariusController_raw_0_axis_s2mm_TDATA;
  wire [0:0]dariusController_raw_0_axis_s2mm_TLAST;
  wire dariusController_raw_0_axis_s2mm_TREADY;
  wire dariusController_raw_0_axis_s2mm_TVALID;
  wire [63:0]input_switch_M00_AXIS_TDATA;
  wire [7:0]input_switch_M00_AXIS_TDEST;
  wire [7:0]input_switch_M00_AXIS_TKEEP;
  wire [0:0]input_switch_M00_AXIS_TLAST;
  wire input_switch_M00_AXIS_TREADY;
  wire [0:0]input_switch_M00_AXIS_TVALID;
  wire [47:0]network_addr_V_1;
  wire [31:0]smartconnect_0_M01_AXI_ARADDR;
  wire [1:0]smartconnect_0_M01_AXI_ARBURST;
  wire [3:0]smartconnect_0_M01_AXI_ARCACHE;
  wire [7:0]smartconnect_0_M01_AXI_ARLEN;
  wire [0:0]smartconnect_0_M01_AXI_ARLOCK;
  wire [2:0]smartconnect_0_M01_AXI_ARPROT;
  wire [3:0]smartconnect_0_M01_AXI_ARQOS;
  wire smartconnect_0_M01_AXI_ARREADY;
  wire [2:0]smartconnect_0_M01_AXI_ARSIZE;
  wire [3:0]smartconnect_0_M01_AXI_ARUSER;
  wire smartconnect_0_M01_AXI_ARVALID;
  wire [31:0]smartconnect_0_M01_AXI_AWADDR;
  wire [1:0]smartconnect_0_M01_AXI_AWBURST;
  wire [3:0]smartconnect_0_M01_AXI_AWCACHE;
  wire [7:0]smartconnect_0_M01_AXI_AWLEN;
  wire [0:0]smartconnect_0_M01_AXI_AWLOCK;
  wire [2:0]smartconnect_0_M01_AXI_AWPROT;
  wire [3:0]smartconnect_0_M01_AXI_AWQOS;
  wire smartconnect_0_M01_AXI_AWREADY;
  wire [2:0]smartconnect_0_M01_AXI_AWSIZE;
  wire [3:0]smartconnect_0_M01_AXI_AWUSER;
  wire smartconnect_0_M01_AXI_AWVALID;
  wire smartconnect_0_M01_AXI_BREADY;
  wire [1:0]smartconnect_0_M01_AXI_BRESP;
  wire smartconnect_0_M01_AXI_BVALID;
  wire [511:0]smartconnect_0_M01_AXI_RDATA;
  wire smartconnect_0_M01_AXI_RLAST;
  wire smartconnect_0_M01_AXI_RREADY;
  wire [1:0]smartconnect_0_M01_AXI_RRESP;
  wire smartconnect_0_M01_AXI_RVALID;
  wire [511:0]smartconnect_0_M01_AXI_WDATA;
  wire smartconnect_0_M01_AXI_WLAST;
  wire smartconnect_0_M01_AXI_WREADY;
  wire [63:0]smartconnect_0_M01_AXI_WSTRB;
  wire smartconnect_0_M01_AXI_WVALID;
  wire [31:0]xlconstant_0_dout;
  wire [0:0]xlconstant_1_dout;

  assign ARESETN_1 = ARESETN;
  assign CLK_1 = CLK;
  assign Conn1_ARADDR = S_AXI_CONTROL_araddr[15:0];
  assign Conn1_ARPROT = S_AXI_CONTROL_arprot[2:0];
  assign Conn1_ARVALID = S_AXI_CONTROL_arvalid;
  assign Conn1_AWADDR = S_AXI_CONTROL_awaddr[15:0];
  assign Conn1_AWPROT = S_AXI_CONTROL_awprot[2:0];
  assign Conn1_AWVALID = S_AXI_CONTROL_awvalid;
  assign Conn1_BREADY = S_AXI_CONTROL_bready;
  assign Conn1_RREADY = S_AXI_CONTROL_rready;
  assign Conn1_WDATA = S_AXI_CONTROL_wdata[31:0];
  assign Conn1_WSTRB = S_AXI_CONTROL_wstrb[3:0];
  assign Conn1_WVALID = S_AXI_CONTROL_wvalid;
  assign Conn2_ARREADY = S_AXI_MEM_0_arready;
  assign Conn2_AWREADY = S_AXI_MEM_0_awready;
  assign Conn2_BRESP = S_AXI_MEM_0_bresp[1:0];
  assign Conn2_BVALID = S_AXI_MEM_0_bvalid;
  assign Conn2_RDATA = S_AXI_MEM_0_rdata[511:0];
  assign Conn2_RLAST = S_AXI_MEM_0_rlast;
  assign Conn2_RRESP = S_AXI_MEM_0_rresp[1:0];
  assign Conn2_RVALID = S_AXI_MEM_0_rvalid;
  assign Conn2_WREADY = S_AXI_MEM_0_wready;
  assign Conn4_TDATA = S00_AXIS_tdata[63:0];
  assign Conn4_TDEST = S00_AXIS_tdest[7:0];
  assign Conn4_TKEEP = S00_AXIS_tkeep[7:0];
  assign Conn4_TLAST = S00_AXIS_tlast[0];
  assign Conn4_TVALID = S00_AXIS_tvalid[0];
  assign Conn5_TREADY = stream_out_network_V_tready;
  assign S00_AXIS_tready[0] = Conn4_TREADY;
  assign S_AXI_CONTROL_arready = Conn1_ARREADY;
  assign S_AXI_CONTROL_awready = Conn1_AWREADY;
  assign S_AXI_CONTROL_bresp[1:0] = Conn1_BRESP;
  assign S_AXI_CONTROL_bvalid = Conn1_BVALID;
  assign S_AXI_CONTROL_rdata[31:0] = Conn1_RDATA;
  assign S_AXI_CONTROL_rresp[1:0] = Conn1_RRESP;
  assign S_AXI_CONTROL_rvalid = Conn1_RVALID;
  assign S_AXI_CONTROL_wready = Conn1_WREADY;
  assign S_AXI_MEM_0_araddr[31:0] = Conn2_ARADDR;
  assign S_AXI_MEM_0_arburst[1:0] = Conn2_ARBURST;
  assign S_AXI_MEM_0_arcache[3:0] = Conn2_ARCACHE;
  assign S_AXI_MEM_0_arlen[7:0] = Conn2_ARLEN;
  assign S_AXI_MEM_0_arlock[0] = Conn2_ARLOCK;
  assign S_AXI_MEM_0_arprot[2:0] = Conn2_ARPROT;
  assign S_AXI_MEM_0_arqos[3:0] = Conn2_ARQOS;
  assign S_AXI_MEM_0_arsize[2:0] = Conn2_ARSIZE;
  assign S_AXI_MEM_0_aruser[3:0] = Conn2_ARUSER;
  assign S_AXI_MEM_0_arvalid = Conn2_ARVALID;
  assign S_AXI_MEM_0_awaddr[31:0] = Conn2_AWADDR;
  assign S_AXI_MEM_0_awburst[1:0] = Conn2_AWBURST;
  assign S_AXI_MEM_0_awcache[3:0] = Conn2_AWCACHE;
  assign S_AXI_MEM_0_awlen[7:0] = Conn2_AWLEN;
  assign S_AXI_MEM_0_awlock[0] = Conn2_AWLOCK;
  assign S_AXI_MEM_0_awprot[2:0] = Conn2_AWPROT;
  assign S_AXI_MEM_0_awqos[3:0] = Conn2_AWQOS;
  assign S_AXI_MEM_0_awsize[2:0] = Conn2_AWSIZE;
  assign S_AXI_MEM_0_awuser[3:0] = Conn2_AWUSER;
  assign S_AXI_MEM_0_awvalid = Conn2_AWVALID;
  assign S_AXI_MEM_0_bready = Conn2_BREADY;
  assign S_AXI_MEM_0_rready = Conn2_RREADY;
  assign S_AXI_MEM_0_wdata[511:0] = Conn2_WDATA;
  assign S_AXI_MEM_0_wlast = Conn2_WLAST;
  assign S_AXI_MEM_0_wstrb[63:0] = Conn2_WSTRB;
  assign S_AXI_MEM_0_wvalid = Conn2_WVALID;
  assign S_AXI_MEM_1_araddr[31:0] = smartconnect_0_M01_AXI_ARADDR;
  assign S_AXI_MEM_1_arburst[1:0] = smartconnect_0_M01_AXI_ARBURST;
  assign S_AXI_MEM_1_arcache[3:0] = smartconnect_0_M01_AXI_ARCACHE;
  assign S_AXI_MEM_1_arlen[7:0] = smartconnect_0_M01_AXI_ARLEN;
  assign S_AXI_MEM_1_arlock[0] = smartconnect_0_M01_AXI_ARLOCK;
  assign S_AXI_MEM_1_arprot[2:0] = smartconnect_0_M01_AXI_ARPROT;
  assign S_AXI_MEM_1_arqos[3:0] = smartconnect_0_M01_AXI_ARQOS;
  assign S_AXI_MEM_1_arsize[2:0] = smartconnect_0_M01_AXI_ARSIZE;
  assign S_AXI_MEM_1_aruser[3:0] = smartconnect_0_M01_AXI_ARUSER;
  assign S_AXI_MEM_1_arvalid = smartconnect_0_M01_AXI_ARVALID;
  assign S_AXI_MEM_1_awaddr[31:0] = smartconnect_0_M01_AXI_AWADDR;
  assign S_AXI_MEM_1_awburst[1:0] = smartconnect_0_M01_AXI_AWBURST;
  assign S_AXI_MEM_1_awcache[3:0] = smartconnect_0_M01_AXI_AWCACHE;
  assign S_AXI_MEM_1_awlen[7:0] = smartconnect_0_M01_AXI_AWLEN;
  assign S_AXI_MEM_1_awlock[0] = smartconnect_0_M01_AXI_AWLOCK;
  assign S_AXI_MEM_1_awprot[2:0] = smartconnect_0_M01_AXI_AWPROT;
  assign S_AXI_MEM_1_awqos[3:0] = smartconnect_0_M01_AXI_AWQOS;
  assign S_AXI_MEM_1_awsize[2:0] = smartconnect_0_M01_AXI_AWSIZE;
  assign S_AXI_MEM_1_awuser[3:0] = smartconnect_0_M01_AXI_AWUSER;
  assign S_AXI_MEM_1_awvalid = smartconnect_0_M01_AXI_AWVALID;
  assign S_AXI_MEM_1_bready = smartconnect_0_M01_AXI_BREADY;
  assign S_AXI_MEM_1_rready = smartconnect_0_M01_AXI_RREADY;
  assign S_AXI_MEM_1_wdata[511:0] = smartconnect_0_M01_AXI_WDATA;
  assign S_AXI_MEM_1_wlast = smartconnect_0_M01_AXI_WLAST;
  assign S_AXI_MEM_1_wstrb[63:0] = smartconnect_0_M01_AXI_WSTRB;
  assign S_AXI_MEM_1_wvalid = smartconnect_0_M01_AXI_WVALID;
  assign network_addr_V_1 = network_addr_V[47:0];
  assign smartconnect_0_M01_AXI_ARREADY = S_AXI_MEM_1_arready;
  assign smartconnect_0_M01_AXI_AWREADY = S_AXI_MEM_1_awready;
  assign smartconnect_0_M01_AXI_BRESP = S_AXI_MEM_1_bresp[1:0];
  assign smartconnect_0_M01_AXI_BVALID = S_AXI_MEM_1_bvalid;
  assign smartconnect_0_M01_AXI_RDATA = S_AXI_MEM_1_rdata[511:0];
  assign smartconnect_0_M01_AXI_RLAST = S_AXI_MEM_1_rlast;
  assign smartconnect_0_M01_AXI_RRESP = S_AXI_MEM_1_rresp[1:0];
  assign smartconnect_0_M01_AXI_RVALID = S_AXI_MEM_1_rvalid;
  assign smartconnect_0_M01_AXI_WREADY = S_AXI_MEM_1_wready;
  assign stream_out_network_V_tdata[63:0] = Conn5_TDATA;
  assign stream_out_network_V_tdest[7:0] = Conn5_TDEST;
  assign stream_out_network_V_tkeep[7:0] = Conn5_TKEEP;
  assign stream_out_network_V_tlast[0] = Conn5_TLAST;
  assign stream_out_network_V_tvalid = Conn5_TVALID;
  pr_axi_datamover_0_1 axi_datamover_0
       (.m_axi_mm2s_aclk(CLK_1),
        .m_axi_mm2s_araddr(axi_datamover_0_M_AXI_MM2S_ARADDR),
        .m_axi_mm2s_arburst(axi_datamover_0_M_AXI_MM2S_ARBURST),
        .m_axi_mm2s_arcache(axi_datamover_0_M_AXI_MM2S_ARCACHE),
        .m_axi_mm2s_aresetn(ARESETN_1),
        .m_axi_mm2s_arid(axi_datamover_0_M_AXI_MM2S_ARID),
        .m_axi_mm2s_arlen(axi_datamover_0_M_AXI_MM2S_ARLEN),
        .m_axi_mm2s_arprot(axi_datamover_0_M_AXI_MM2S_ARPROT),
        .m_axi_mm2s_arready(axi_datamover_0_M_AXI_MM2S_ARREADY),
        .m_axi_mm2s_arsize(axi_datamover_0_M_AXI_MM2S_ARSIZE),
        .m_axi_mm2s_aruser(axi_datamover_0_M_AXI_MM2S_ARUSER),
        .m_axi_mm2s_arvalid(axi_datamover_0_M_AXI_MM2S_ARVALID),
        .m_axi_mm2s_rdata(axi_datamover_0_M_AXI_MM2S_RDATA),
        .m_axi_mm2s_rlast(axi_datamover_0_M_AXI_MM2S_RLAST),
        .m_axi_mm2s_rready(axi_datamover_0_M_AXI_MM2S_RREADY),
        .m_axi_mm2s_rresp(axi_datamover_0_M_AXI_MM2S_RRESP),
        .m_axi_mm2s_rvalid(axi_datamover_0_M_AXI_MM2S_RVALID),
        .m_axi_s2mm_aclk(CLK_1),
        .m_axi_s2mm_aresetn(ARESETN_1),
        .m_axi_s2mm_awaddr(axi_datamover_0_M_AXI_S2MM_AWADDR),
        .m_axi_s2mm_awburst(axi_datamover_0_M_AXI_S2MM_AWBURST),
        .m_axi_s2mm_awcache(axi_datamover_0_M_AXI_S2MM_AWCACHE),
        .m_axi_s2mm_awid(axi_datamover_0_M_AXI_S2MM_AWID),
        .m_axi_s2mm_awlen(axi_datamover_0_M_AXI_S2MM_AWLEN),
        .m_axi_s2mm_awprot(axi_datamover_0_M_AXI_S2MM_AWPROT),
        .m_axi_s2mm_awready(axi_datamover_0_M_AXI_S2MM_AWREADY),
        .m_axi_s2mm_awsize(axi_datamover_0_M_AXI_S2MM_AWSIZE),
        .m_axi_s2mm_awuser(axi_datamover_0_M_AXI_S2MM_AWUSER),
        .m_axi_s2mm_awvalid(axi_datamover_0_M_AXI_S2MM_AWVALID),
        .m_axi_s2mm_bready(axi_datamover_0_M_AXI_S2MM_BREADY),
        .m_axi_s2mm_bresp(axi_datamover_0_M_AXI_S2MM_BRESP),
        .m_axi_s2mm_bvalid(axi_datamover_0_M_AXI_S2MM_BVALID),
        .m_axi_s2mm_wdata(axi_datamover_0_M_AXI_S2MM_WDATA),
        .m_axi_s2mm_wlast(axi_datamover_0_M_AXI_S2MM_WLAST),
        .m_axi_s2mm_wready(axi_datamover_0_M_AXI_S2MM_WREADY),
        .m_axi_s2mm_wstrb(axi_datamover_0_M_AXI_S2MM_WSTRB),
        .m_axi_s2mm_wvalid(axi_datamover_0_M_AXI_S2MM_WVALID),
        .m_axis_mm2s_cmdsts_aclk(CLK_1),
        .m_axis_mm2s_cmdsts_aresetn(ARESETN_1),
        .m_axis_mm2s_sts_tready(1'b1),
        .m_axis_mm2s_tdata(axi_datamover_0_M_AXIS_MM2S_TDATA),
        .m_axis_mm2s_tlast(axi_datamover_0_M_AXIS_MM2S_TLAST),
        .m_axis_mm2s_tready(axi_datamover_0_M_AXIS_MM2S_TREADY),
        .m_axis_mm2s_tvalid(axi_datamover_0_M_AXIS_MM2S_TVALID),
        .m_axis_s2mm_cmdsts_aresetn(ARESETN_1),
        .m_axis_s2mm_cmdsts_awclk(CLK_1),
        .m_axis_s2mm_sts_tready(1'b1),
        .s_axis_mm2s_cmd_tdata(dariusController_raw_0_axis_cmd_mm2s_V_data_V_TDATA),
        .s_axis_mm2s_cmd_tready(dariusController_raw_0_axis_cmd_mm2s_V_data_V_TREADY),
        .s_axis_mm2s_cmd_tvalid(dariusController_raw_0_axis_cmd_mm2s_V_data_V_TVALID),
        .s_axis_s2mm_cmd_tdata(dariusController_raw_0_axis_cmd_s2mm_V_data_V_TDATA),
        .s_axis_s2mm_cmd_tready(dariusController_raw_0_axis_cmd_s2mm_V_data_V_TREADY),
        .s_axis_s2mm_cmd_tvalid(dariusController_raw_0_axis_cmd_s2mm_V_data_V_TVALID),
        .s_axis_s2mm_tdata(dariusController_raw_0_axis_s2mm_TDATA),
        .s_axis_s2mm_tkeep({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .s_axis_s2mm_tlast(dariusController_raw_0_axis_s2mm_TLAST),
        .s_axis_s2mm_tready(dariusController_raw_0_axis_s2mm_TREADY),
        .s_axis_s2mm_tvalid(dariusController_raw_0_axis_s2mm_TVALID));
  pr_axi_vip_ctrl_0 axi_vip_ctrl
       (.aclk(CLK_1),
        .aresetn(ARESETN_1),
        .s_axi_araddr(Conn1_ARADDR),
        .s_axi_arprot(Conn1_ARPROT),
        .s_axi_arready(Conn1_ARREADY),
        .s_axi_arvalid(Conn1_ARVALID),
        .s_axi_awaddr(Conn1_AWADDR),
        .s_axi_awprot(Conn1_AWPROT),
        .s_axi_awready(Conn1_AWREADY),
        .s_axi_awvalid(Conn1_AWVALID),
        .s_axi_bready(Conn1_BREADY),
        .s_axi_bresp(Conn1_BRESP),
        .s_axi_bvalid(Conn1_BVALID),
        .s_axi_rdata(Conn1_RDATA),
        .s_axi_rready(Conn1_RREADY),
        .s_axi_rresp(Conn1_RRESP),
        .s_axi_rvalid(Conn1_RVALID),
        .s_axi_wdata(Conn1_WDATA),
        .s_axi_wready(Conn1_WREADY),
        .s_axi_wstrb(Conn1_WSTRB),
        .s_axi_wvalid(Conn1_WVALID));
  pr_blk_mem_switch_rom_0 blk_mem_switch_rom
       (.addra(custom_switch_inst_network_table_V_PORTA_ADDR),
        .clka(custom_switch_inst_network_table_V_PORTA_CLK),
        .douta(custom_switch_inst_network_table_V_PORTA_DOUT),
        .ena(custom_switch_inst_network_table_V_PORTA_EN),
        .rsta(custom_switch_inst_network_table_V_PORTA_RST));
  pr_custom_switch_inst_0 custom_switch_inst
       (.aclk(CLK_1),
        .aresetn(ARESETN_1),
        .network_addr_V(network_addr_V_1),
        .network_table_V_Addr_A(custom_switch_inst_network_table_V_PORTA_ADDR),
        .network_table_V_Clk_A(custom_switch_inst_network_table_V_PORTA_CLK),
        .network_table_V_Din_A(custom_switch_inst_network_table_V_PORTA_DOUT),
        .network_table_V_EN_A(custom_switch_inst_network_table_V_PORTA_EN),
        .network_table_V_Rst_A(custom_switch_inst_network_table_V_PORTA_RST),
        .stream_in_V_TDATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .stream_in_V_TDEST({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .stream_in_V_TKEEP({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .stream_in_V_TLAST(1'b0),
        .stream_in_V_TVALID(1'b0),
        .stream_out_network_V_TDATA(Conn5_TDATA),
        .stream_out_network_V_TDEST(Conn5_TDEST),
        .stream_out_network_V_TKEEP(Conn5_TKEEP),
        .stream_out_network_V_TLAST(Conn5_TLAST),
        .stream_out_network_V_TREADY(Conn5_TREADY),
        .stream_out_network_V_TVALID(Conn5_TVALID),
        .stream_out_switch_V_TDATA(custom_switch_inst_stream_out_switch_V_TDATA),
        .stream_out_switch_V_TDEST(custom_switch_inst_stream_out_switch_V_TDEST),
        .stream_out_switch_V_TKEEP(custom_switch_inst_stream_out_switch_V_TKEEP),
        .stream_out_switch_V_TLAST(custom_switch_inst_stream_out_switch_V_TLAST),
        .stream_out_switch_V_TREADY(custom_switch_inst_stream_out_switch_V_TREADY),
        .stream_out_switch_V_TVALID(custom_switch_inst_stream_out_switch_V_TVALID));
  pr_dariusController_raw_0_0 dariusController_raw_0
       (.ap_clk(CLK_1),
        .ap_rst_n(ARESETN_1),
        .ap_start(xlconstant_1_dout),
        .axis_cmd_mm2s_V_data_V_TDATA(dariusController_raw_0_axis_cmd_mm2s_V_data_V_TDATA),
        .axis_cmd_mm2s_V_data_V_TREADY(dariusController_raw_0_axis_cmd_mm2s_V_data_V_TREADY),
        .axis_cmd_mm2s_V_data_V_TVALID(dariusController_raw_0_axis_cmd_mm2s_V_data_V_TVALID),
        .axis_cmd_s2mm_V_data_V_TDATA(dariusController_raw_0_axis_cmd_s2mm_V_data_V_TDATA),
        .axis_cmd_s2mm_V_data_V_TREADY(dariusController_raw_0_axis_cmd_s2mm_V_data_V_TREADY),
        .axis_cmd_s2mm_V_data_V_TVALID(dariusController_raw_0_axis_cmd_s2mm_V_data_V_TVALID),
        .axis_mm2s_TDATA(axi_datamover_0_M_AXIS_MM2S_TDATA),
        .axis_mm2s_TLAST(axi_datamover_0_M_AXIS_MM2S_TLAST),
        .axis_mm2s_TREADY(axi_datamover_0_M_AXIS_MM2S_TREADY),
        .axis_mm2s_TVALID(axi_datamover_0_M_AXIS_MM2S_TVALID),
        .axis_s2mm_TDATA(dariusController_raw_0_axis_s2mm_TDATA),
        .axis_s2mm_TLAST(dariusController_raw_0_axis_s2mm_TLAST),
        .axis_s2mm_TREADY(dariusController_raw_0_axis_s2mm_TREADY),
        .axis_s2mm_TVALID(dariusController_raw_0_axis_s2mm_TVALID),
        .m_axi_darius_driver_ARREADY(1'b0),
        .m_axi_darius_driver_AWREADY(1'b0),
        .m_axi_darius_driver_BRESP({1'b0,1'b0}),
        .m_axi_darius_driver_BVALID(1'b0),
        .m_axi_darius_driver_RDATA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_darius_driver_RLAST(1'b0),
        .m_axi_darius_driver_RRESP({1'b0,1'b0}),
        .m_axi_darius_driver_RVALID(1'b0),
        .m_axi_darius_driver_WREADY(1'b0),
        .rank(xlconstant_0_dout),
        .stream_in_TDATA(input_switch_M00_AXIS_TDATA),
        .stream_in_TDEST(input_switch_M00_AXIS_TDEST),
        .stream_in_TKEEP(input_switch_M00_AXIS_TKEEP),
        .stream_in_TLAST(input_switch_M00_AXIS_TLAST),
        .stream_in_TREADY(input_switch_M00_AXIS_TREADY),
        .stream_in_TVALID(input_switch_M00_AXIS_TVALID),
        .stream_out_TREADY(1'b1));
  pr_input_switch_0 input_switch
       (.aclk(CLK_1),
        .aresetn(ARESETN_1),
        .m_axis_tdata(input_switch_M00_AXIS_TDATA),
        .m_axis_tdest(input_switch_M00_AXIS_TDEST),
        .m_axis_tkeep(input_switch_M00_AXIS_TKEEP),
        .m_axis_tlast(input_switch_M00_AXIS_TLAST),
        .m_axis_tready(input_switch_M00_AXIS_TREADY),
        .m_axis_tvalid(input_switch_M00_AXIS_TVALID),
        .s_axis_tdata({custom_switch_inst_stream_out_switch_V_TDATA,Conn4_TDATA}),
        .s_axis_tdest({custom_switch_inst_stream_out_switch_V_TDEST,Conn4_TDEST}),
        .s_axis_tkeep({custom_switch_inst_stream_out_switch_V_TKEEP,Conn4_TKEEP}),
        .s_axis_tlast({custom_switch_inst_stream_out_switch_V_TLAST,Conn4_TLAST}),
        .s_axis_tready({custom_switch_inst_stream_out_switch_V_TREADY,Conn4_TREADY}),
        .s_axis_tvalid({custom_switch_inst_stream_out_switch_V_TVALID,Conn4_TVALID}),
        .s_req_suppress({1'b0,1'b0}));
  pr_smartconnect_0_0 smartconnect_0
       (.M00_AXI_araddr(Conn2_ARADDR),
        .M00_AXI_arburst(Conn2_ARBURST),
        .M00_AXI_arcache(Conn2_ARCACHE),
        .M00_AXI_arlen(Conn2_ARLEN),
        .M00_AXI_arlock(Conn2_ARLOCK),
        .M00_AXI_arprot(Conn2_ARPROT),
        .M00_AXI_arqos(Conn2_ARQOS),
        .M00_AXI_arready(Conn2_ARREADY),
        .M00_AXI_arsize(Conn2_ARSIZE),
        .M00_AXI_aruser(Conn2_ARUSER),
        .M00_AXI_arvalid(Conn2_ARVALID),
        .M00_AXI_awaddr(Conn2_AWADDR),
        .M00_AXI_awburst(Conn2_AWBURST),
        .M00_AXI_awcache(Conn2_AWCACHE),
        .M00_AXI_awlen(Conn2_AWLEN),
        .M00_AXI_awlock(Conn2_AWLOCK),
        .M00_AXI_awprot(Conn2_AWPROT),
        .M00_AXI_awqos(Conn2_AWQOS),
        .M00_AXI_awready(Conn2_AWREADY),
        .M00_AXI_awsize(Conn2_AWSIZE),
        .M00_AXI_awuser(Conn2_AWUSER),
        .M00_AXI_awvalid(Conn2_AWVALID),
        .M00_AXI_bready(Conn2_BREADY),
        .M00_AXI_bresp(Conn2_BRESP),
        .M00_AXI_bvalid(Conn2_BVALID),
        .M00_AXI_rdata(Conn2_RDATA),
        .M00_AXI_rlast(Conn2_RLAST),
        .M00_AXI_rready(Conn2_RREADY),
        .M00_AXI_rresp(Conn2_RRESP),
        .M00_AXI_rvalid(Conn2_RVALID),
        .M00_AXI_wdata(Conn2_WDATA),
        .M00_AXI_wlast(Conn2_WLAST),
        .M00_AXI_wready(Conn2_WREADY),
        .M00_AXI_wstrb(Conn2_WSTRB),
        .M00_AXI_wvalid(Conn2_WVALID),
        .M01_AXI_araddr(smartconnect_0_M01_AXI_ARADDR),
        .M01_AXI_arburst(smartconnect_0_M01_AXI_ARBURST),
        .M01_AXI_arcache(smartconnect_0_M01_AXI_ARCACHE),
        .M01_AXI_arlen(smartconnect_0_M01_AXI_ARLEN),
        .M01_AXI_arlock(smartconnect_0_M01_AXI_ARLOCK),
        .M01_AXI_arprot(smartconnect_0_M01_AXI_ARPROT),
        .M01_AXI_arqos(smartconnect_0_M01_AXI_ARQOS),
        .M01_AXI_arready(smartconnect_0_M01_AXI_ARREADY),
        .M01_AXI_arsize(smartconnect_0_M01_AXI_ARSIZE),
        .M01_AXI_aruser(smartconnect_0_M01_AXI_ARUSER),
        .M01_AXI_arvalid(smartconnect_0_M01_AXI_ARVALID),
        .M01_AXI_awaddr(smartconnect_0_M01_AXI_AWADDR),
        .M01_AXI_awburst(smartconnect_0_M01_AXI_AWBURST),
        .M01_AXI_awcache(smartconnect_0_M01_AXI_AWCACHE),
        .M01_AXI_awlen(smartconnect_0_M01_AXI_AWLEN),
        .M01_AXI_awlock(smartconnect_0_M01_AXI_AWLOCK),
        .M01_AXI_awprot(smartconnect_0_M01_AXI_AWPROT),
        .M01_AXI_awqos(smartconnect_0_M01_AXI_AWQOS),
        .M01_AXI_awready(smartconnect_0_M01_AXI_AWREADY),
        .M01_AXI_awsize(smartconnect_0_M01_AXI_AWSIZE),
        .M01_AXI_awuser(smartconnect_0_M01_AXI_AWUSER),
        .M01_AXI_awvalid(smartconnect_0_M01_AXI_AWVALID),
        .M01_AXI_bready(smartconnect_0_M01_AXI_BREADY),
        .M01_AXI_bresp(smartconnect_0_M01_AXI_BRESP),
        .M01_AXI_bvalid(smartconnect_0_M01_AXI_BVALID),
        .M01_AXI_rdata(smartconnect_0_M01_AXI_RDATA),
        .M01_AXI_rlast(smartconnect_0_M01_AXI_RLAST),
        .M01_AXI_rready(smartconnect_0_M01_AXI_RREADY),
        .M01_AXI_rresp(smartconnect_0_M01_AXI_RRESP),
        .M01_AXI_rvalid(smartconnect_0_M01_AXI_RVALID),
        .M01_AXI_wdata(smartconnect_0_M01_AXI_WDATA),
        .M01_AXI_wlast(smartconnect_0_M01_AXI_WLAST),
        .M01_AXI_wready(smartconnect_0_M01_AXI_WREADY),
        .M01_AXI_wstrb(smartconnect_0_M01_AXI_WSTRB),
        .M01_AXI_wvalid(smartconnect_0_M01_AXI_WVALID),
        .S00_AXI_araddr(axi_datamover_0_M_AXI_MM2S_ARADDR),
        .S00_AXI_arburst(axi_datamover_0_M_AXI_MM2S_ARBURST),
        .S00_AXI_arcache(axi_datamover_0_M_AXI_MM2S_ARCACHE),
        .S00_AXI_arid(axi_datamover_0_M_AXI_MM2S_ARID),
        .S00_AXI_arlen(axi_datamover_0_M_AXI_MM2S_ARLEN),
        .S00_AXI_arlock(1'b0),
        .S00_AXI_arprot(axi_datamover_0_M_AXI_MM2S_ARPROT),
        .S00_AXI_arqos({1'b0,1'b0,1'b0,1'b0}),
        .S00_AXI_arready(axi_datamover_0_M_AXI_MM2S_ARREADY),
        .S00_AXI_arsize(axi_datamover_0_M_AXI_MM2S_ARSIZE),
        .S00_AXI_aruser(axi_datamover_0_M_AXI_MM2S_ARUSER),
        .S00_AXI_arvalid(axi_datamover_0_M_AXI_MM2S_ARVALID),
        .S00_AXI_rdata(axi_datamover_0_M_AXI_MM2S_RDATA),
        .S00_AXI_rlast(axi_datamover_0_M_AXI_MM2S_RLAST),
        .S00_AXI_rready(axi_datamover_0_M_AXI_MM2S_RREADY),
        .S00_AXI_rresp(axi_datamover_0_M_AXI_MM2S_RRESP),
        .S00_AXI_rvalid(axi_datamover_0_M_AXI_MM2S_RVALID),
        .S01_AXI_awaddr(axi_datamover_0_M_AXI_S2MM_AWADDR),
        .S01_AXI_awburst(axi_datamover_0_M_AXI_S2MM_AWBURST),
        .S01_AXI_awcache(axi_datamover_0_M_AXI_S2MM_AWCACHE),
        .S01_AXI_awid(axi_datamover_0_M_AXI_S2MM_AWID),
        .S01_AXI_awlen(axi_datamover_0_M_AXI_S2MM_AWLEN),
        .S01_AXI_awlock(1'b0),
        .S01_AXI_awprot(axi_datamover_0_M_AXI_S2MM_AWPROT),
        .S01_AXI_awqos({1'b0,1'b0,1'b0,1'b0}),
        .S01_AXI_awready(axi_datamover_0_M_AXI_S2MM_AWREADY),
        .S01_AXI_awsize(axi_datamover_0_M_AXI_S2MM_AWSIZE),
        .S01_AXI_awuser(axi_datamover_0_M_AXI_S2MM_AWUSER),
        .S01_AXI_awvalid(axi_datamover_0_M_AXI_S2MM_AWVALID),
        .S01_AXI_bready(axi_datamover_0_M_AXI_S2MM_BREADY),
        .S01_AXI_bresp(axi_datamover_0_M_AXI_S2MM_BRESP),
        .S01_AXI_bvalid(axi_datamover_0_M_AXI_S2MM_BVALID),
        .S01_AXI_wdata(axi_datamover_0_M_AXI_S2MM_WDATA),
        .S01_AXI_wlast(axi_datamover_0_M_AXI_S2MM_WLAST),
        .S01_AXI_wready(axi_datamover_0_M_AXI_S2MM_WREADY),
        .S01_AXI_wstrb(axi_datamover_0_M_AXI_S2MM_WSTRB),
        .S01_AXI_wvalid(axi_datamover_0_M_AXI_S2MM_WVALID),
        .aclk(CLK_1),
        .aresetn(ARESETN_1));
  pr_xlconstant_0_1 xlconstant_0
       (.dout(xlconstant_0_dout));
  pr_xlconstant_0_2 xlconstant_1
       (.dout(xlconstant_1_dout));
endmodule

module network_imp_MCWI7J
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
    from_app_V_tdata,
    from_app_V_tdest,
    from_app_V_tkeep,
    from_app_V_tlast,
    from_app_V_tready,
    from_app_V_tvalid,
    mac_big,
    to_app_V_tdata,
    to_app_V_tdest,
    to_app_V_tkeep,
    to_app_V_tlast,
    to_app_V_tready,
    to_app_V_tvalid);
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
  input [63:0]from_app_V_tdata;
  input [7:0]from_app_V_tdest;
  input [7:0]from_app_V_tkeep;
  input [0:0]from_app_V_tlast;
  output from_app_V_tready;
  input from_app_V_tvalid;
  output [47:0]mac_big;
  output [63:0]to_app_V_tdata;
  output [7:0]to_app_V_tdest;
  output [7:0]to_app_V_tkeep;
  output [0:0]to_app_V_tlast;
  input [0:0]to_app_V_tready;
  output [0:0]to_app_V_tvalid;

  wire ARESETN_1;
  wire CLK_1;
  wire [63:0]Conn1_TDATA;
  wire [7:0]Conn1_TKEEP;
  wire [0:0]Conn1_TLAST;
  wire Conn1_TREADY;
  wire Conn1_TVALID;
  wire [63:0]Conn2_TDATA;
  wire [7:0]Conn2_TKEEP;
  wire [0:0]Conn2_TLAST;
  wire Conn2_TREADY;
  wire Conn2_TVALID;
  wire [63:0]Conn3_TDATA;
  wire [7:0]Conn3_TDEST;
  wire [7:0]Conn3_TKEEP;
  wire [0:0]Conn3_TLAST;
  wire Conn3_TREADY;
  wire Conn3_TVALID;
  wire [63:0]Conn4_TDATA;
  wire [7:0]Conn4_TDEST;
  wire [7:0]Conn4_TKEEP;
  wire [0:0]Conn4_TLAST;
  wire [0:0]Conn4_TREADY;
  wire Conn4_TVALID;
  wire [47:0]ip_constant_block_inst_mac_big;
  wire [31:0]network_bridge_inst_mac_table_V_PORTA_ADDR;
  wire network_bridge_inst_mac_table_V_PORTA_CLK;
  wire [63:0]network_bridge_inst_mac_table_V_PORTA_DOUT;
  wire network_bridge_inst_mac_table_V_PORTA_EN;
  wire network_bridge_inst_mac_table_V_PORTA_RST;
  wire [31:0]network_bridge_inst_mac_table_V_PORTB_ADDR;
  wire network_bridge_inst_mac_table_V_PORTB_CLK;
  wire [63:0]network_bridge_inst_mac_table_V_PORTB_DOUT;
  wire network_bridge_inst_mac_table_V_PORTB_EN;
  wire network_bridge_inst_mac_table_V_PORTB_RST;

  assign ARESETN_1 = ARESETN;
  assign CLK_1 = CLK;
  assign Conn1_TDATA = S_AXIS_tdata[63:0];
  assign Conn1_TKEEP = S_AXIS_tkeep[7:0];
  assign Conn1_TLAST = S_AXIS_tlast[0];
  assign Conn1_TVALID = S_AXIS_tvalid;
  assign Conn2_TREADY = M_AXIS_tready;
  assign Conn3_TDATA = from_app_V_tdata[63:0];
  assign Conn3_TDEST = from_app_V_tdest[7:0];
  assign Conn3_TKEEP = from_app_V_tkeep[7:0];
  assign Conn3_TLAST = from_app_V_tlast[0];
  assign Conn3_TVALID = from_app_V_tvalid;
  assign Conn4_TREADY = to_app_V_tready[0];
  assign M_AXIS_tdata[63:0] = Conn2_TDATA;
  assign M_AXIS_tkeep[7:0] = Conn2_TKEEP;
  assign M_AXIS_tlast[0] = Conn2_TLAST;
  assign M_AXIS_tvalid = Conn2_TVALID;
  assign S_AXIS_tready = Conn1_TREADY;
  assign from_app_V_tready = Conn3_TREADY;
  assign mac_big[47:0] = ip_constant_block_inst_mac_big;
  assign to_app_V_tdata[63:0] = Conn4_TDATA;
  assign to_app_V_tdest[7:0] = Conn4_TDEST;
  assign to_app_V_tkeep[7:0] = Conn4_TKEEP;
  assign to_app_V_tlast[0] = Conn4_TLAST;
  assign to_app_V_tvalid[0] = Conn4_TVALID;
  pr_blk_mem_bridge_rom_1 blk_mem_bridge_rom
       (.addra(network_bridge_inst_mac_table_V_PORTA_ADDR),
        .addrb(network_bridge_inst_mac_table_V_PORTB_ADDR),
        .clka(network_bridge_inst_mac_table_V_PORTA_CLK),
        .clkb(network_bridge_inst_mac_table_V_PORTB_CLK),
        .douta(network_bridge_inst_mac_table_V_PORTA_DOUT),
        .doutb(network_bridge_inst_mac_table_V_PORTB_DOUT),
        .ena(network_bridge_inst_mac_table_V_PORTA_EN),
        .enb(network_bridge_inst_mac_table_V_PORTB_EN),
        .rsta(network_bridge_inst_mac_table_V_PORTA_RST),
        .rstb(network_bridge_inst_mac_table_V_PORTB_RST));
  pr_ip_constant_block_inst_1 ip_constant_block_inst
       (.mac_big(ip_constant_block_inst_mac_big));
  pr_network_bridge_inst_1 network_bridge_inst
       (.aclk(CLK_1),
        .aresetn(ARESETN_1),
        .from_app_V_TDATA(Conn3_TDATA),
        .from_app_V_TDEST(Conn3_TDEST),
        .from_app_V_TKEEP(Conn3_TKEEP),
        .from_app_V_TLAST(Conn3_TLAST),
        .from_app_V_TREADY(Conn3_TREADY),
        .from_app_V_TVALID(Conn3_TVALID),
        .from_eth_V_TDATA(Conn1_TDATA),
        .from_eth_V_TKEEP(Conn1_TKEEP),
        .from_eth_V_TLAST(Conn1_TLAST),
        .from_eth_V_TREADY(Conn1_TREADY),
        .from_eth_V_TVALID(Conn1_TVALID),
        .mac_addr_V(ip_constant_block_inst_mac_big),
        .mac_table_V_Addr_A(network_bridge_inst_mac_table_V_PORTA_ADDR),
        .mac_table_V_Addr_B(network_bridge_inst_mac_table_V_PORTB_ADDR),
        .mac_table_V_Clk_A(network_bridge_inst_mac_table_V_PORTA_CLK),
        .mac_table_V_Clk_B(network_bridge_inst_mac_table_V_PORTB_CLK),
        .mac_table_V_Din_A(network_bridge_inst_mac_table_V_PORTA_DOUT),
        .mac_table_V_Din_B(network_bridge_inst_mac_table_V_PORTB_DOUT),
        .mac_table_V_EN_A(network_bridge_inst_mac_table_V_PORTA_EN),
        .mac_table_V_EN_B(network_bridge_inst_mac_table_V_PORTB_EN),
        .mac_table_V_Rst_A(network_bridge_inst_mac_table_V_PORTA_RST),
        .mac_table_V_Rst_B(network_bridge_inst_mac_table_V_PORTB_RST),
        .to_app_V_TDATA(Conn4_TDATA),
        .to_app_V_TDEST(Conn4_TDEST),
        .to_app_V_TKEEP(Conn4_TKEEP),
        .to_app_V_TLAST(Conn4_TLAST),
        .to_app_V_TREADY(Conn4_TREADY),
        .to_app_V_TVALID(Conn4_TVALID),
        .to_eth_V_TDATA(Conn2_TDATA),
        .to_eth_V_TKEEP(Conn2_TKEEP),
        .to_eth_V_TLAST(Conn2_TLAST),
        .to_eth_V_TREADY(Conn2_TREADY),
        .to_eth_V_TVALID(Conn2_TVALID));
endmodule

(* CORE_GENERATION_INFO = "pr,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=pr,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=14,numReposBlks=12,numNonXlnxBlks=1,numHierBlks=2,maxHierDepth=1,numSysgenBlks=0,numHlsBlks=3,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=1,da_axi4_s2mm_cnt=1,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "pr.hwdef" *) 
module pr
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
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.ARESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.ARESETN, POLARITY ACTIVE_LOW" *) input ARESETN;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, ASSOCIATED_BUSIF S_AXIS:M_AXIS:S_AXI_CONTROL:S_AXI_MEM_0:S_AXI_MEM_1, ASSOCIATED_RESET ARESETN, CLK_DOMAIN pr_CLK, FREQ_HZ 156250000, PHASE 0.000" *) input CLK;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS, CLK_DOMAIN pr_CLK, FREQ_HZ 156250000, HAS_TKEEP 1, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {TDATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 64} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}} TDATA_WIDTH 64}, PHASE 0.000, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) output [63:0]M_AXIS_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TKEEP" *) output [7:0]M_AXIS_tkeep;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TLAST" *) output [0:0]M_AXIS_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TREADY" *) input M_AXIS_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TVALID" *) output M_AXIS_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS, CLK_DOMAIN pr_CLK, FREQ_HZ 156250000, HAS_TKEEP 1, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) input [63:0]S_AXIS_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TKEEP" *) input [7:0]S_AXIS_tkeep;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TLAST" *) input [0:0]S_AXIS_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TREADY" *) output S_AXIS_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TVALID" *) input S_AXIS_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CONTROL ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI_CONTROL, ADDR_WIDTH 16, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN pr_CLK, DATA_WIDTH 32, FREQ_HZ 156250000, HAS_BRESP 1, HAS_BURST 1, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 2, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 2, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) input [15:0]S_AXI_CONTROL_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CONTROL ARPROT" *) input [2:0]S_AXI_CONTROL_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CONTROL ARREADY" *) output S_AXI_CONTROL_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CONTROL ARVALID" *) input S_AXI_CONTROL_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CONTROL AWADDR" *) input [15:0]S_AXI_CONTROL_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CONTROL AWPROT" *) input [2:0]S_AXI_CONTROL_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CONTROL AWREADY" *) output S_AXI_CONTROL_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CONTROL AWVALID" *) input S_AXI_CONTROL_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CONTROL BREADY" *) input S_AXI_CONTROL_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CONTROL BRESP" *) output [1:0]S_AXI_CONTROL_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CONTROL BVALID" *) output S_AXI_CONTROL_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CONTROL RDATA" *) output [31:0]S_AXI_CONTROL_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CONTROL RREADY" *) input S_AXI_CONTROL_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CONTROL RRESP" *) output [1:0]S_AXI_CONTROL_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CONTROL RVALID" *) output S_AXI_CONTROL_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CONTROL WDATA" *) input [31:0]S_AXI_CONTROL_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CONTROL WREADY" *) output S_AXI_CONTROL_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CONTROL WSTRB" *) input [3:0]S_AXI_CONTROL_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_CONTROL WVALID" *) input S_AXI_CONTROL_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI_MEM_0, ADDR_WIDTH 32, ARUSER_WIDTH 4, AWUSER_WIDTH 4, BUSER_WIDTH 0, CLK_DOMAIN pr_CLK, DATA_WIDTH 512, FREQ_HZ 156250000, HAS_BRESP 1, HAS_BURST 1, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, MAX_BURST_LENGTH 2, NUM_READ_OUTSTANDING 2, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 2, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) output [31:0]S_AXI_MEM_0_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 ARBURST" *) output [1:0]S_AXI_MEM_0_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 ARCACHE" *) output [3:0]S_AXI_MEM_0_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 ARLEN" *) output [7:0]S_AXI_MEM_0_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 ARLOCK" *) output [0:0]S_AXI_MEM_0_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 ARPROT" *) output [2:0]S_AXI_MEM_0_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 ARQOS" *) output [3:0]S_AXI_MEM_0_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 ARREADY" *) input S_AXI_MEM_0_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 ARSIZE" *) output [2:0]S_AXI_MEM_0_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 ARUSER" *) output [3:0]S_AXI_MEM_0_aruser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 ARVALID" *) output S_AXI_MEM_0_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 AWADDR" *) output [31:0]S_AXI_MEM_0_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 AWBURST" *) output [1:0]S_AXI_MEM_0_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 AWCACHE" *) output [3:0]S_AXI_MEM_0_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 AWLEN" *) output [7:0]S_AXI_MEM_0_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 AWLOCK" *) output [0:0]S_AXI_MEM_0_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 AWPROT" *) output [2:0]S_AXI_MEM_0_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 AWQOS" *) output [3:0]S_AXI_MEM_0_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 AWREADY" *) input S_AXI_MEM_0_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 AWSIZE" *) output [2:0]S_AXI_MEM_0_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 AWUSER" *) output [3:0]S_AXI_MEM_0_awuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 AWVALID" *) output S_AXI_MEM_0_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 BREADY" *) output S_AXI_MEM_0_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 BRESP" *) input [1:0]S_AXI_MEM_0_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 BVALID" *) input S_AXI_MEM_0_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 RDATA" *) input [511:0]S_AXI_MEM_0_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 RLAST" *) input S_AXI_MEM_0_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 RREADY" *) output S_AXI_MEM_0_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 RRESP" *) input [1:0]S_AXI_MEM_0_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 RVALID" *) input S_AXI_MEM_0_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 WDATA" *) output [511:0]S_AXI_MEM_0_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 WLAST" *) output S_AXI_MEM_0_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 WREADY" *) input S_AXI_MEM_0_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 WSTRB" *) output [63:0]S_AXI_MEM_0_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_0 WVALID" *) output S_AXI_MEM_0_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI_MEM_1, ADDR_WIDTH 32, ARUSER_WIDTH 4, AWUSER_WIDTH 4, BUSER_WIDTH 0, CLK_DOMAIN pr_CLK, DATA_WIDTH 512, FREQ_HZ 156250000, HAS_BRESP 1, HAS_BURST 1, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, MAX_BURST_LENGTH 2, NUM_READ_OUTSTANDING 2, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 2, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) output [31:0]S_AXI_MEM_1_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 ARBURST" *) output [1:0]S_AXI_MEM_1_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 ARCACHE" *) output [3:0]S_AXI_MEM_1_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 ARLEN" *) output [7:0]S_AXI_MEM_1_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 ARLOCK" *) output [0:0]S_AXI_MEM_1_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 ARPROT" *) output [2:0]S_AXI_MEM_1_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 ARQOS" *) output [3:0]S_AXI_MEM_1_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 ARREADY" *) input S_AXI_MEM_1_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 ARSIZE" *) output [2:0]S_AXI_MEM_1_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 ARUSER" *) output [3:0]S_AXI_MEM_1_aruser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 ARVALID" *) output S_AXI_MEM_1_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 AWADDR" *) output [31:0]S_AXI_MEM_1_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 AWBURST" *) output [1:0]S_AXI_MEM_1_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 AWCACHE" *) output [3:0]S_AXI_MEM_1_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 AWLEN" *) output [7:0]S_AXI_MEM_1_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 AWLOCK" *) output [0:0]S_AXI_MEM_1_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 AWPROT" *) output [2:0]S_AXI_MEM_1_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 AWQOS" *) output [3:0]S_AXI_MEM_1_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 AWREADY" *) input S_AXI_MEM_1_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 AWSIZE" *) output [2:0]S_AXI_MEM_1_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 AWUSER" *) output [3:0]S_AXI_MEM_1_awuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 AWVALID" *) output S_AXI_MEM_1_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 BREADY" *) output S_AXI_MEM_1_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 BRESP" *) input [1:0]S_AXI_MEM_1_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 BVALID" *) input S_AXI_MEM_1_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 RDATA" *) input [511:0]S_AXI_MEM_1_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 RLAST" *) input S_AXI_MEM_1_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 RREADY" *) output S_AXI_MEM_1_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 RRESP" *) input [1:0]S_AXI_MEM_1_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 RVALID" *) input S_AXI_MEM_1_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 WDATA" *) output [511:0]S_AXI_MEM_1_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 WLAST" *) output S_AXI_MEM_1_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 WREADY" *) input S_AXI_MEM_1_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 WSTRB" *) output [63:0]S_AXI_MEM_1_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI_MEM_1 WVALID" *) output S_AXI_MEM_1_wvalid;

  wire ARESETN_1;
  wire CLK_1;
  wire [63:0]S_AXIS_1_TDATA;
  wire [7:0]S_AXIS_1_TKEEP;
  wire [0:0]S_AXIS_1_TLAST;
  wire S_AXIS_1_TREADY;
  wire S_AXIS_1_TVALID;
  wire [15:0]S_AXI_CONTROL_1_ARADDR;
  wire [2:0]S_AXI_CONTROL_1_ARPROT;
  wire S_AXI_CONTROL_1_ARREADY;
  wire S_AXI_CONTROL_1_ARVALID;
  wire [15:0]S_AXI_CONTROL_1_AWADDR;
  wire [2:0]S_AXI_CONTROL_1_AWPROT;
  wire S_AXI_CONTROL_1_AWREADY;
  wire S_AXI_CONTROL_1_AWVALID;
  wire S_AXI_CONTROL_1_BREADY;
  wire [1:0]S_AXI_CONTROL_1_BRESP;
  wire S_AXI_CONTROL_1_BVALID;
  wire [31:0]S_AXI_CONTROL_1_RDATA;
  wire S_AXI_CONTROL_1_RREADY;
  wire [1:0]S_AXI_CONTROL_1_RRESP;
  wire S_AXI_CONTROL_1_RVALID;
  wire [31:0]S_AXI_CONTROL_1_WDATA;
  wire S_AXI_CONTROL_1_WREADY;
  wire [3:0]S_AXI_CONTROL_1_WSTRB;
  wire S_AXI_CONTROL_1_WVALID;
  wire [31:0]applicationRegion_S_AXI_MEM_0_ARADDR;
  wire [1:0]applicationRegion_S_AXI_MEM_0_ARBURST;
  wire [3:0]applicationRegion_S_AXI_MEM_0_ARCACHE;
  wire [7:0]applicationRegion_S_AXI_MEM_0_ARLEN;
  wire [0:0]applicationRegion_S_AXI_MEM_0_ARLOCK;
  wire [2:0]applicationRegion_S_AXI_MEM_0_ARPROT;
  wire [3:0]applicationRegion_S_AXI_MEM_0_ARQOS;
  wire applicationRegion_S_AXI_MEM_0_ARREADY;
  wire [2:0]applicationRegion_S_AXI_MEM_0_ARSIZE;
  wire [3:0]applicationRegion_S_AXI_MEM_0_ARUSER;
  wire applicationRegion_S_AXI_MEM_0_ARVALID;
  wire [31:0]applicationRegion_S_AXI_MEM_0_AWADDR;
  wire [1:0]applicationRegion_S_AXI_MEM_0_AWBURST;
  wire [3:0]applicationRegion_S_AXI_MEM_0_AWCACHE;
  wire [7:0]applicationRegion_S_AXI_MEM_0_AWLEN;
  wire [0:0]applicationRegion_S_AXI_MEM_0_AWLOCK;
  wire [2:0]applicationRegion_S_AXI_MEM_0_AWPROT;
  wire [3:0]applicationRegion_S_AXI_MEM_0_AWQOS;
  wire applicationRegion_S_AXI_MEM_0_AWREADY;
  wire [2:0]applicationRegion_S_AXI_MEM_0_AWSIZE;
  wire [3:0]applicationRegion_S_AXI_MEM_0_AWUSER;
  wire applicationRegion_S_AXI_MEM_0_AWVALID;
  wire applicationRegion_S_AXI_MEM_0_BREADY;
  wire [1:0]applicationRegion_S_AXI_MEM_0_BRESP;
  wire applicationRegion_S_AXI_MEM_0_BVALID;
  wire [511:0]applicationRegion_S_AXI_MEM_0_RDATA;
  wire applicationRegion_S_AXI_MEM_0_RLAST;
  wire applicationRegion_S_AXI_MEM_0_RREADY;
  wire [1:0]applicationRegion_S_AXI_MEM_0_RRESP;
  wire applicationRegion_S_AXI_MEM_0_RVALID;
  wire [511:0]applicationRegion_S_AXI_MEM_0_WDATA;
  wire applicationRegion_S_AXI_MEM_0_WLAST;
  wire applicationRegion_S_AXI_MEM_0_WREADY;
  wire [63:0]applicationRegion_S_AXI_MEM_0_WSTRB;
  wire applicationRegion_S_AXI_MEM_0_WVALID;
  wire [31:0]applicationRegion_S_AXI_MEM_1_ARADDR;
  wire [1:0]applicationRegion_S_AXI_MEM_1_ARBURST;
  wire [3:0]applicationRegion_S_AXI_MEM_1_ARCACHE;
  wire [7:0]applicationRegion_S_AXI_MEM_1_ARLEN;
  wire [0:0]applicationRegion_S_AXI_MEM_1_ARLOCK;
  wire [2:0]applicationRegion_S_AXI_MEM_1_ARPROT;
  wire [3:0]applicationRegion_S_AXI_MEM_1_ARQOS;
  wire applicationRegion_S_AXI_MEM_1_ARREADY;
  wire [2:0]applicationRegion_S_AXI_MEM_1_ARSIZE;
  wire [3:0]applicationRegion_S_AXI_MEM_1_ARUSER;
  wire applicationRegion_S_AXI_MEM_1_ARVALID;
  wire [31:0]applicationRegion_S_AXI_MEM_1_AWADDR;
  wire [1:0]applicationRegion_S_AXI_MEM_1_AWBURST;
  wire [3:0]applicationRegion_S_AXI_MEM_1_AWCACHE;
  wire [7:0]applicationRegion_S_AXI_MEM_1_AWLEN;
  wire [0:0]applicationRegion_S_AXI_MEM_1_AWLOCK;
  wire [2:0]applicationRegion_S_AXI_MEM_1_AWPROT;
  wire [3:0]applicationRegion_S_AXI_MEM_1_AWQOS;
  wire applicationRegion_S_AXI_MEM_1_AWREADY;
  wire [2:0]applicationRegion_S_AXI_MEM_1_AWSIZE;
  wire [3:0]applicationRegion_S_AXI_MEM_1_AWUSER;
  wire applicationRegion_S_AXI_MEM_1_AWVALID;
  wire applicationRegion_S_AXI_MEM_1_BREADY;
  wire [1:0]applicationRegion_S_AXI_MEM_1_BRESP;
  wire applicationRegion_S_AXI_MEM_1_BVALID;
  wire [511:0]applicationRegion_S_AXI_MEM_1_RDATA;
  wire applicationRegion_S_AXI_MEM_1_RLAST;
  wire applicationRegion_S_AXI_MEM_1_RREADY;
  wire [1:0]applicationRegion_S_AXI_MEM_1_RRESP;
  wire applicationRegion_S_AXI_MEM_1_RVALID;
  wire [511:0]applicationRegion_S_AXI_MEM_1_WDATA;
  wire applicationRegion_S_AXI_MEM_1_WLAST;
  wire applicationRegion_S_AXI_MEM_1_WREADY;
  wire [63:0]applicationRegion_S_AXI_MEM_1_WSTRB;
  wire applicationRegion_S_AXI_MEM_1_WVALID;
  wire [63:0]applicationRegion_stream_out_network_V_TDATA;
  wire [7:0]applicationRegion_stream_out_network_V_TDEST;
  wire [7:0]applicationRegion_stream_out_network_V_TKEEP;
  wire [0:0]applicationRegion_stream_out_network_V_TLAST;
  wire applicationRegion_stream_out_network_V_TREADY;
  wire applicationRegion_stream_out_network_V_TVALID;
  wire [63:0]network_M_AXIS_TDATA;
  wire [7:0]network_M_AXIS_TKEEP;
  wire [0:0]network_M_AXIS_TLAST;
  wire network_M_AXIS_TREADY;
  wire network_M_AXIS_TVALID;
  wire [47:0]network_mac_big;
  wire [63:0]network_to_app_V_TDATA;
  wire [7:0]network_to_app_V_TDEST;
  wire [7:0]network_to_app_V_TKEEP;
  wire [0:0]network_to_app_V_TLAST;
  wire [0:0]network_to_app_V_TREADY;
  wire [0:0]network_to_app_V_TVALID;

  assign ARESETN_1 = ARESETN;
  assign CLK_1 = CLK;
  assign M_AXIS_tdata[63:0] = network_M_AXIS_TDATA;
  assign M_AXIS_tkeep[7:0] = network_M_AXIS_TKEEP;
  assign M_AXIS_tlast[0] = network_M_AXIS_TLAST;
  assign M_AXIS_tvalid = network_M_AXIS_TVALID;
  assign S_AXIS_1_TDATA = S_AXIS_tdata[63:0];
  assign S_AXIS_1_TKEEP = S_AXIS_tkeep[7:0];
  assign S_AXIS_1_TLAST = S_AXIS_tlast[0];
  assign S_AXIS_1_TVALID = S_AXIS_tvalid;
  assign S_AXIS_tready = S_AXIS_1_TREADY;
  assign S_AXI_CONTROL_1_ARADDR = S_AXI_CONTROL_araddr[15:0];
  assign S_AXI_CONTROL_1_ARPROT = S_AXI_CONTROL_arprot[2:0];
  assign S_AXI_CONTROL_1_ARVALID = S_AXI_CONTROL_arvalid;
  assign S_AXI_CONTROL_1_AWADDR = S_AXI_CONTROL_awaddr[15:0];
  assign S_AXI_CONTROL_1_AWPROT = S_AXI_CONTROL_awprot[2:0];
  assign S_AXI_CONTROL_1_AWVALID = S_AXI_CONTROL_awvalid;
  assign S_AXI_CONTROL_1_BREADY = S_AXI_CONTROL_bready;
  assign S_AXI_CONTROL_1_RREADY = S_AXI_CONTROL_rready;
  assign S_AXI_CONTROL_1_WDATA = S_AXI_CONTROL_wdata[31:0];
  assign S_AXI_CONTROL_1_WSTRB = S_AXI_CONTROL_wstrb[3:0];
  assign S_AXI_CONTROL_1_WVALID = S_AXI_CONTROL_wvalid;
  assign S_AXI_CONTROL_arready = S_AXI_CONTROL_1_ARREADY;
  assign S_AXI_CONTROL_awready = S_AXI_CONTROL_1_AWREADY;
  assign S_AXI_CONTROL_bresp[1:0] = S_AXI_CONTROL_1_BRESP;
  assign S_AXI_CONTROL_bvalid = S_AXI_CONTROL_1_BVALID;
  assign S_AXI_CONTROL_rdata[31:0] = S_AXI_CONTROL_1_RDATA;
  assign S_AXI_CONTROL_rresp[1:0] = S_AXI_CONTROL_1_RRESP;
  assign S_AXI_CONTROL_rvalid = S_AXI_CONTROL_1_RVALID;
  assign S_AXI_CONTROL_wready = S_AXI_CONTROL_1_WREADY;
  assign S_AXI_MEM_0_araddr[31:0] = applicationRegion_S_AXI_MEM_0_ARADDR;
  assign S_AXI_MEM_0_arburst[1:0] = applicationRegion_S_AXI_MEM_0_ARBURST;
  assign S_AXI_MEM_0_arcache[3:0] = applicationRegion_S_AXI_MEM_0_ARCACHE;
  assign S_AXI_MEM_0_arlen[7:0] = applicationRegion_S_AXI_MEM_0_ARLEN;
  assign S_AXI_MEM_0_arlock[0] = applicationRegion_S_AXI_MEM_0_ARLOCK;
  assign S_AXI_MEM_0_arprot[2:0] = applicationRegion_S_AXI_MEM_0_ARPROT;
  assign S_AXI_MEM_0_arqos[3:0] = applicationRegion_S_AXI_MEM_0_ARQOS;
  assign S_AXI_MEM_0_arsize[2:0] = applicationRegion_S_AXI_MEM_0_ARSIZE;
  assign S_AXI_MEM_0_aruser[3:0] = applicationRegion_S_AXI_MEM_0_ARUSER;
  assign S_AXI_MEM_0_arvalid = applicationRegion_S_AXI_MEM_0_ARVALID;
  assign S_AXI_MEM_0_awaddr[31:0] = applicationRegion_S_AXI_MEM_0_AWADDR;
  assign S_AXI_MEM_0_awburst[1:0] = applicationRegion_S_AXI_MEM_0_AWBURST;
  assign S_AXI_MEM_0_awcache[3:0] = applicationRegion_S_AXI_MEM_0_AWCACHE;
  assign S_AXI_MEM_0_awlen[7:0] = applicationRegion_S_AXI_MEM_0_AWLEN;
  assign S_AXI_MEM_0_awlock[0] = applicationRegion_S_AXI_MEM_0_AWLOCK;
  assign S_AXI_MEM_0_awprot[2:0] = applicationRegion_S_AXI_MEM_0_AWPROT;
  assign S_AXI_MEM_0_awqos[3:0] = applicationRegion_S_AXI_MEM_0_AWQOS;
  assign S_AXI_MEM_0_awsize[2:0] = applicationRegion_S_AXI_MEM_0_AWSIZE;
  assign S_AXI_MEM_0_awuser[3:0] = applicationRegion_S_AXI_MEM_0_AWUSER;
  assign S_AXI_MEM_0_awvalid = applicationRegion_S_AXI_MEM_0_AWVALID;
  assign S_AXI_MEM_0_bready = applicationRegion_S_AXI_MEM_0_BREADY;
  assign S_AXI_MEM_0_rready = applicationRegion_S_AXI_MEM_0_RREADY;
  assign S_AXI_MEM_0_wdata[511:0] = applicationRegion_S_AXI_MEM_0_WDATA;
  assign S_AXI_MEM_0_wlast = applicationRegion_S_AXI_MEM_0_WLAST;
  assign S_AXI_MEM_0_wstrb[63:0] = applicationRegion_S_AXI_MEM_0_WSTRB;
  assign S_AXI_MEM_0_wvalid = applicationRegion_S_AXI_MEM_0_WVALID;
  assign S_AXI_MEM_1_araddr[31:0] = applicationRegion_S_AXI_MEM_1_ARADDR;
  assign S_AXI_MEM_1_arburst[1:0] = applicationRegion_S_AXI_MEM_1_ARBURST;
  assign S_AXI_MEM_1_arcache[3:0] = applicationRegion_S_AXI_MEM_1_ARCACHE;
  assign S_AXI_MEM_1_arlen[7:0] = applicationRegion_S_AXI_MEM_1_ARLEN;
  assign S_AXI_MEM_1_arlock[0] = applicationRegion_S_AXI_MEM_1_ARLOCK;
  assign S_AXI_MEM_1_arprot[2:0] = applicationRegion_S_AXI_MEM_1_ARPROT;
  assign S_AXI_MEM_1_arqos[3:0] = applicationRegion_S_AXI_MEM_1_ARQOS;
  assign S_AXI_MEM_1_arsize[2:0] = applicationRegion_S_AXI_MEM_1_ARSIZE;
  assign S_AXI_MEM_1_aruser[3:0] = applicationRegion_S_AXI_MEM_1_ARUSER;
  assign S_AXI_MEM_1_arvalid = applicationRegion_S_AXI_MEM_1_ARVALID;
  assign S_AXI_MEM_1_awaddr[31:0] = applicationRegion_S_AXI_MEM_1_AWADDR;
  assign S_AXI_MEM_1_awburst[1:0] = applicationRegion_S_AXI_MEM_1_AWBURST;
  assign S_AXI_MEM_1_awcache[3:0] = applicationRegion_S_AXI_MEM_1_AWCACHE;
  assign S_AXI_MEM_1_awlen[7:0] = applicationRegion_S_AXI_MEM_1_AWLEN;
  assign S_AXI_MEM_1_awlock[0] = applicationRegion_S_AXI_MEM_1_AWLOCK;
  assign S_AXI_MEM_1_awprot[2:0] = applicationRegion_S_AXI_MEM_1_AWPROT;
  assign S_AXI_MEM_1_awqos[3:0] = applicationRegion_S_AXI_MEM_1_AWQOS;
  assign S_AXI_MEM_1_awsize[2:0] = applicationRegion_S_AXI_MEM_1_AWSIZE;
  assign S_AXI_MEM_1_awuser[3:0] = applicationRegion_S_AXI_MEM_1_AWUSER;
  assign S_AXI_MEM_1_awvalid = applicationRegion_S_AXI_MEM_1_AWVALID;
  assign S_AXI_MEM_1_bready = applicationRegion_S_AXI_MEM_1_BREADY;
  assign S_AXI_MEM_1_rready = applicationRegion_S_AXI_MEM_1_RREADY;
  assign S_AXI_MEM_1_wdata[511:0] = applicationRegion_S_AXI_MEM_1_WDATA;
  assign S_AXI_MEM_1_wlast = applicationRegion_S_AXI_MEM_1_WLAST;
  assign S_AXI_MEM_1_wstrb[63:0] = applicationRegion_S_AXI_MEM_1_WSTRB;
  assign S_AXI_MEM_1_wvalid = applicationRegion_S_AXI_MEM_1_WVALID;
  assign applicationRegion_S_AXI_MEM_0_ARREADY = S_AXI_MEM_0_arready;
  assign applicationRegion_S_AXI_MEM_0_AWREADY = S_AXI_MEM_0_awready;
  assign applicationRegion_S_AXI_MEM_0_BRESP = S_AXI_MEM_0_bresp[1:0];
  assign applicationRegion_S_AXI_MEM_0_BVALID = S_AXI_MEM_0_bvalid;
  assign applicationRegion_S_AXI_MEM_0_RDATA = S_AXI_MEM_0_rdata[511:0];
  assign applicationRegion_S_AXI_MEM_0_RLAST = S_AXI_MEM_0_rlast;
  assign applicationRegion_S_AXI_MEM_0_RRESP = S_AXI_MEM_0_rresp[1:0];
  assign applicationRegion_S_AXI_MEM_0_RVALID = S_AXI_MEM_0_rvalid;
  assign applicationRegion_S_AXI_MEM_0_WREADY = S_AXI_MEM_0_wready;
  assign applicationRegion_S_AXI_MEM_1_ARREADY = S_AXI_MEM_1_arready;
  assign applicationRegion_S_AXI_MEM_1_AWREADY = S_AXI_MEM_1_awready;
  assign applicationRegion_S_AXI_MEM_1_BRESP = S_AXI_MEM_1_bresp[1:0];
  assign applicationRegion_S_AXI_MEM_1_BVALID = S_AXI_MEM_1_bvalid;
  assign applicationRegion_S_AXI_MEM_1_RDATA = S_AXI_MEM_1_rdata[511:0];
  assign applicationRegion_S_AXI_MEM_1_RLAST = S_AXI_MEM_1_rlast;
  assign applicationRegion_S_AXI_MEM_1_RRESP = S_AXI_MEM_1_rresp[1:0];
  assign applicationRegion_S_AXI_MEM_1_RVALID = S_AXI_MEM_1_rvalid;
  assign applicationRegion_S_AXI_MEM_1_WREADY = S_AXI_MEM_1_wready;
  assign network_M_AXIS_TREADY = M_AXIS_tready;
  applicationRegion_imp_1EIFTCH applicationRegion
       (.ARESETN(ARESETN_1),
        .CLK(CLK_1),
        .S00_AXIS_tdata(network_to_app_V_TDATA),
        .S00_AXIS_tdest(network_to_app_V_TDEST),
        .S00_AXIS_tkeep(network_to_app_V_TKEEP),
        .S00_AXIS_tlast(network_to_app_V_TLAST),
        .S00_AXIS_tready(network_to_app_V_TREADY),
        .S00_AXIS_tvalid(network_to_app_V_TVALID),
        .S_AXI_CONTROL_araddr(S_AXI_CONTROL_1_ARADDR),
        .S_AXI_CONTROL_arprot(S_AXI_CONTROL_1_ARPROT),
        .S_AXI_CONTROL_arready(S_AXI_CONTROL_1_ARREADY),
        .S_AXI_CONTROL_arvalid(S_AXI_CONTROL_1_ARVALID),
        .S_AXI_CONTROL_awaddr(S_AXI_CONTROL_1_AWADDR),
        .S_AXI_CONTROL_awprot(S_AXI_CONTROL_1_AWPROT),
        .S_AXI_CONTROL_awready(S_AXI_CONTROL_1_AWREADY),
        .S_AXI_CONTROL_awvalid(S_AXI_CONTROL_1_AWVALID),
        .S_AXI_CONTROL_bready(S_AXI_CONTROL_1_BREADY),
        .S_AXI_CONTROL_bresp(S_AXI_CONTROL_1_BRESP),
        .S_AXI_CONTROL_bvalid(S_AXI_CONTROL_1_BVALID),
        .S_AXI_CONTROL_rdata(S_AXI_CONTROL_1_RDATA),
        .S_AXI_CONTROL_rready(S_AXI_CONTROL_1_RREADY),
        .S_AXI_CONTROL_rresp(S_AXI_CONTROL_1_RRESP),
        .S_AXI_CONTROL_rvalid(S_AXI_CONTROL_1_RVALID),
        .S_AXI_CONTROL_wdata(S_AXI_CONTROL_1_WDATA),
        .S_AXI_CONTROL_wready(S_AXI_CONTROL_1_WREADY),
        .S_AXI_CONTROL_wstrb(S_AXI_CONTROL_1_WSTRB),
        .S_AXI_CONTROL_wvalid(S_AXI_CONTROL_1_WVALID),
        .S_AXI_MEM_0_araddr(applicationRegion_S_AXI_MEM_0_ARADDR),
        .S_AXI_MEM_0_arburst(applicationRegion_S_AXI_MEM_0_ARBURST),
        .S_AXI_MEM_0_arcache(applicationRegion_S_AXI_MEM_0_ARCACHE),
        .S_AXI_MEM_0_arlen(applicationRegion_S_AXI_MEM_0_ARLEN),
        .S_AXI_MEM_0_arlock(applicationRegion_S_AXI_MEM_0_ARLOCK),
        .S_AXI_MEM_0_arprot(applicationRegion_S_AXI_MEM_0_ARPROT),
        .S_AXI_MEM_0_arqos(applicationRegion_S_AXI_MEM_0_ARQOS),
        .S_AXI_MEM_0_arready(applicationRegion_S_AXI_MEM_0_ARREADY),
        .S_AXI_MEM_0_arsize(applicationRegion_S_AXI_MEM_0_ARSIZE),
        .S_AXI_MEM_0_aruser(applicationRegion_S_AXI_MEM_0_ARUSER),
        .S_AXI_MEM_0_arvalid(applicationRegion_S_AXI_MEM_0_ARVALID),
        .S_AXI_MEM_0_awaddr(applicationRegion_S_AXI_MEM_0_AWADDR),
        .S_AXI_MEM_0_awburst(applicationRegion_S_AXI_MEM_0_AWBURST),
        .S_AXI_MEM_0_awcache(applicationRegion_S_AXI_MEM_0_AWCACHE),
        .S_AXI_MEM_0_awlen(applicationRegion_S_AXI_MEM_0_AWLEN),
        .S_AXI_MEM_0_awlock(applicationRegion_S_AXI_MEM_0_AWLOCK),
        .S_AXI_MEM_0_awprot(applicationRegion_S_AXI_MEM_0_AWPROT),
        .S_AXI_MEM_0_awqos(applicationRegion_S_AXI_MEM_0_AWQOS),
        .S_AXI_MEM_0_awready(applicationRegion_S_AXI_MEM_0_AWREADY),
        .S_AXI_MEM_0_awsize(applicationRegion_S_AXI_MEM_0_AWSIZE),
        .S_AXI_MEM_0_awuser(applicationRegion_S_AXI_MEM_0_AWUSER),
        .S_AXI_MEM_0_awvalid(applicationRegion_S_AXI_MEM_0_AWVALID),
        .S_AXI_MEM_0_bready(applicationRegion_S_AXI_MEM_0_BREADY),
        .S_AXI_MEM_0_bresp(applicationRegion_S_AXI_MEM_0_BRESP),
        .S_AXI_MEM_0_bvalid(applicationRegion_S_AXI_MEM_0_BVALID),
        .S_AXI_MEM_0_rdata(applicationRegion_S_AXI_MEM_0_RDATA),
        .S_AXI_MEM_0_rlast(applicationRegion_S_AXI_MEM_0_RLAST),
        .S_AXI_MEM_0_rready(applicationRegion_S_AXI_MEM_0_RREADY),
        .S_AXI_MEM_0_rresp(applicationRegion_S_AXI_MEM_0_RRESP),
        .S_AXI_MEM_0_rvalid(applicationRegion_S_AXI_MEM_0_RVALID),
        .S_AXI_MEM_0_wdata(applicationRegion_S_AXI_MEM_0_WDATA),
        .S_AXI_MEM_0_wlast(applicationRegion_S_AXI_MEM_0_WLAST),
        .S_AXI_MEM_0_wready(applicationRegion_S_AXI_MEM_0_WREADY),
        .S_AXI_MEM_0_wstrb(applicationRegion_S_AXI_MEM_0_WSTRB),
        .S_AXI_MEM_0_wvalid(applicationRegion_S_AXI_MEM_0_WVALID),
        .S_AXI_MEM_1_araddr(applicationRegion_S_AXI_MEM_1_ARADDR),
        .S_AXI_MEM_1_arburst(applicationRegion_S_AXI_MEM_1_ARBURST),
        .S_AXI_MEM_1_arcache(applicationRegion_S_AXI_MEM_1_ARCACHE),
        .S_AXI_MEM_1_arlen(applicationRegion_S_AXI_MEM_1_ARLEN),
        .S_AXI_MEM_1_arlock(applicationRegion_S_AXI_MEM_1_ARLOCK),
        .S_AXI_MEM_1_arprot(applicationRegion_S_AXI_MEM_1_ARPROT),
        .S_AXI_MEM_1_arqos(applicationRegion_S_AXI_MEM_1_ARQOS),
        .S_AXI_MEM_1_arready(applicationRegion_S_AXI_MEM_1_ARREADY),
        .S_AXI_MEM_1_arsize(applicationRegion_S_AXI_MEM_1_ARSIZE),
        .S_AXI_MEM_1_aruser(applicationRegion_S_AXI_MEM_1_ARUSER),
        .S_AXI_MEM_1_arvalid(applicationRegion_S_AXI_MEM_1_ARVALID),
        .S_AXI_MEM_1_awaddr(applicationRegion_S_AXI_MEM_1_AWADDR),
        .S_AXI_MEM_1_awburst(applicationRegion_S_AXI_MEM_1_AWBURST),
        .S_AXI_MEM_1_awcache(applicationRegion_S_AXI_MEM_1_AWCACHE),
        .S_AXI_MEM_1_awlen(applicationRegion_S_AXI_MEM_1_AWLEN),
        .S_AXI_MEM_1_awlock(applicationRegion_S_AXI_MEM_1_AWLOCK),
        .S_AXI_MEM_1_awprot(applicationRegion_S_AXI_MEM_1_AWPROT),
        .S_AXI_MEM_1_awqos(applicationRegion_S_AXI_MEM_1_AWQOS),
        .S_AXI_MEM_1_awready(applicationRegion_S_AXI_MEM_1_AWREADY),
        .S_AXI_MEM_1_awsize(applicationRegion_S_AXI_MEM_1_AWSIZE),
        .S_AXI_MEM_1_awuser(applicationRegion_S_AXI_MEM_1_AWUSER),
        .S_AXI_MEM_1_awvalid(applicationRegion_S_AXI_MEM_1_AWVALID),
        .S_AXI_MEM_1_bready(applicationRegion_S_AXI_MEM_1_BREADY),
        .S_AXI_MEM_1_bresp(applicationRegion_S_AXI_MEM_1_BRESP),
        .S_AXI_MEM_1_bvalid(applicationRegion_S_AXI_MEM_1_BVALID),
        .S_AXI_MEM_1_rdata(applicationRegion_S_AXI_MEM_1_RDATA),
        .S_AXI_MEM_1_rlast(applicationRegion_S_AXI_MEM_1_RLAST),
        .S_AXI_MEM_1_rready(applicationRegion_S_AXI_MEM_1_RREADY),
        .S_AXI_MEM_1_rresp(applicationRegion_S_AXI_MEM_1_RRESP),
        .S_AXI_MEM_1_rvalid(applicationRegion_S_AXI_MEM_1_RVALID),
        .S_AXI_MEM_1_wdata(applicationRegion_S_AXI_MEM_1_WDATA),
        .S_AXI_MEM_1_wlast(applicationRegion_S_AXI_MEM_1_WLAST),
        .S_AXI_MEM_1_wready(applicationRegion_S_AXI_MEM_1_WREADY),
        .S_AXI_MEM_1_wstrb(applicationRegion_S_AXI_MEM_1_WSTRB),
        .S_AXI_MEM_1_wvalid(applicationRegion_S_AXI_MEM_1_WVALID),
        .network_addr_V(network_mac_big),
        .stream_out_network_V_tdata(applicationRegion_stream_out_network_V_TDATA),
        .stream_out_network_V_tdest(applicationRegion_stream_out_network_V_TDEST),
        .stream_out_network_V_tkeep(applicationRegion_stream_out_network_V_TKEEP),
        .stream_out_network_V_tlast(applicationRegion_stream_out_network_V_TLAST),
        .stream_out_network_V_tready(applicationRegion_stream_out_network_V_TREADY),
        .stream_out_network_V_tvalid(applicationRegion_stream_out_network_V_TVALID));
  network_imp_MCWI7J network
       (.ARESETN(ARESETN_1),
        .CLK(CLK_1),
        .M_AXIS_tdata(network_M_AXIS_TDATA),
        .M_AXIS_tkeep(network_M_AXIS_TKEEP),
        .M_AXIS_tlast(network_M_AXIS_TLAST),
        .M_AXIS_tready(network_M_AXIS_TREADY),
        .M_AXIS_tvalid(network_M_AXIS_TVALID),
        .S_AXIS_tdata(S_AXIS_1_TDATA),
        .S_AXIS_tkeep(S_AXIS_1_TKEEP),
        .S_AXIS_tlast(S_AXIS_1_TLAST),
        .S_AXIS_tready(S_AXIS_1_TREADY),
        .S_AXIS_tvalid(S_AXIS_1_TVALID),
        .from_app_V_tdata(applicationRegion_stream_out_network_V_TDATA),
        .from_app_V_tdest(applicationRegion_stream_out_network_V_TDEST),
        .from_app_V_tkeep(applicationRegion_stream_out_network_V_TKEEP),
        .from_app_V_tlast(applicationRegion_stream_out_network_V_TLAST),
        .from_app_V_tready(applicationRegion_stream_out_network_V_TREADY),
        .from_app_V_tvalid(applicationRegion_stream_out_network_V_TVALID),
        .mac_big(network_mac_big),
        .to_app_V_tdata(network_to_app_V_TDATA),
        .to_app_V_tdest(network_to_app_V_TDEST),
        .to_app_V_tkeep(network_to_app_V_TKEEP),
        .to_app_V_tlast(network_to_app_V_TLAST),
        .to_app_V_tready(network_to_app_V_TREADY),
        .to_app_V_tvalid(network_to_app_V_TVALID));
endmodule
