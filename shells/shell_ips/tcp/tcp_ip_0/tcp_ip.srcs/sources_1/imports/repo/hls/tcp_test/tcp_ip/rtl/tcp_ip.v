`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.11.2013 10:45:37
// Design Name: 
// Module Name: toe
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tcp_ip(
    // 156.25 MHz clock in
    input                           xphy_refclk_p,
    input                           xphy_refclk_n,
    // Ethernet Tx & Rx Differential Pairs //  
    output                          xphy0_txp,
    output                          xphy0_txn,
    input                           xphy0_rxp,
    input                           xphy0_rxn,
    
    output[1:0]                     sfp_tx_disable,
    output                          sfp_on,
    input                           perst_n,
    
    // Connection to SODIMM-A
    // Inouts
    inout [71:0]                    c0_ddr3_dq,
    inout [8:0]                     c0_ddr3_dqs_n,
    inout [8:0]                     c0_ddr3_dqs_p,
    output [15:0]                   c0_ddr3_addr,
    output [2:0]                    c0_ddr3_ba,
    output                          c0_ddr3_ras_n,
    output                          c0_ddr3_cas_n,
    output                          c0_ddr3_we_n,
    output                          c0_ddr3_reset_n,
    output [1:0]                    c0_ddr3_ck_p,
    output [1:0]                    c0_ddr3_ck_n,
    output [1:0]                    c0_ddr3_cke,
    output [1:0]                    c0_ddr3_cs_n,
    output [1:0]                    c0_ddr3_odt,
    // Differential system clocks
    input                           c0_sys_clk_p,
    input                           c0_sys_clk_n,
    // differential iodelayctrl clk (reference clock)
    input                           clk_ref_p,
    input                           clk_ref_n,
    // Inouts
    inout [71:0]                    c1_ddr3_dq,
    inout [8:0]                     c1_ddr3_dqs_n,
    inout [8:0]                     c1_ddr3_dqs_p,
    output [15:0]                   c1_ddr3_addr,
    output [2:0]                    c1_ddr3_ba,
    output                          c1_ddr3_ras_n,
    output                          c1_ddr3_cas_n,
    output                          c1_ddr3_we_n,
    output                          c1_ddr3_reset_n,
    output [1:0]                    c1_ddr3_ck_p,
    output [1:0]                    c1_ddr3_ck_n,
    output [1:0]                    c1_ddr3_cke,
    output [1:0]                    c1_ddr3_cs_n,
    output [1:0]                    c1_ddr3_odt,
    // Differential system clocks
    input                           c1_sys_clk_p,
    input                           c1_sys_clk_n,             
    input                           pok_dram, //used as reset to ddr
    output[8:0]                     c0_ddr3_dm,
    output[8:0]                     c1_ddr3_dm,
    output[1:0]                     dram_on,
    input                           usr_sw,
    output[5:0]                     usr_led);
    
wire network_init;

wire aresetn;

reg[15:0] wrCmdCounter;
reg[15:0] rdCmdCounter;
reg[15:0] rdAppCounter;

wire          upd_req_TVALID_out;
wire          upd_req_TREADY_out;
wire          upd_req_TDATA_out;
wire          upd_rsp_TVALID_out;
wire          upd_rsp_TREADY_out;
    
//assign aresetn = network_init;
assign sfp_on = 1'b1;
assign dram_on = 2'b11;
assign c0_ddr3_dm = 9'h0;
assign c1_ddr3_dm = 9'h0;
//assign aresetn = init_calib_complete_r; //reset156_25_n;
wire axi_clk;
wire clk_ref_200;

/*
 * Network Signals
 */
wire        AXI_M_Stream_TVALID;
wire        AXI_M_Stream_TREADY;
wire[63:0]  AXI_M_Stream_TDATA;
wire[7:0]   AXI_M_Stream_TKEEP;
wire        AXI_M_Stream_TLAST;

wire        AXI_S_Stream_TVALID;
wire        AXI_S_Stream_TREADY;
wire[63:0]  AXI_S_Stream_TDATA;
wire[7:0]   AXI_S_Stream_TKEEP;
wire        AXI_S_Stream_TLAST;


/*
 * RX Memory Signals
 */
// memory cmd streams
wire        axis_rxread_cmd_TVALID;
wire        axis_rxread_cmd_TREADY;
wire[71:0]  axis_rxread_cmd_TDATA;
wire        axis_rxwrite_cmd_TVALID;
wire        axis_rxwrite_cmd_TREADY;
wire[71:0]  axis_rxwrite_cmd_TDATA;
// memory sts streams
wire        axis_rxread_sts_TVALID;
wire        axis_rxread_sts_TREADY;
wire[7:0]   axis_rxread_sts_TDATA;
wire        axis_rxwrite_sts_TVALID;
wire        axis_rxwrite_sts_TREADY;
wire[7:0]  axis_rxwrite_sts_TDATA;
// memory data streams
wire        axis_rxread_data_TVALID;
wire        axis_rxread_data_TREADY;
wire[63:0]  axis_rxread_data_TDATA;
wire[7:0]   axis_rxread_data_TKEEP;
wire        axis_rxread_data_TLAST;

wire        axis_rxwrite_data_TVALID;
wire        axis_rxwrite_data_TREADY;
wire[63:0]  axis_rxwrite_data_TDATA;
wire[7:0]   axis_rxwrite_data_TKEEP;
wire        axis_rxwrite_data_TLAST;

/*
 * TX Memory Signals
 */
// memory cmd streams
wire        axis_txread_cmd_TVALID;
wire        axis_txread_cmd_TREADY;
wire[71:0]  axis_txread_cmd_TDATA;
wire        axis_txwrite_cmd_TVALID;
wire        axis_txwrite_cmd_TREADY;
wire[71:0]  axis_txwrite_cmd_TDATA;
// memory sts streams
wire        axis_txread_sts_TVALID;
wire        axis_txread_sts_TREADY;
wire[7:0]   axis_txread_sts_TDATA;
wire        axis_txwrite_sts_TVALID;
wire        axis_txwrite_sts_TREADY;
wire[7:0]  axis_txwrite_sts_TDATA;
// memory data streams
wire        axis_txread_data_TVALID;
wire        axis_txread_data_TREADY;
wire[63:0]  axis_txread_data_TDATA;
wire[7:0]   axis_txread_data_TKEEP;
wire        axis_txread_data_TLAST;

wire        axis_txwrite_data_TVALID;
wire        axis_txwrite_data_TREADY;
wire[63:0]  axis_txwrite_data_TDATA;
wire[7:0]   axis_txwrite_data_TKEEP;
wire        axis_txwrite_data_TLAST;

/*
 * Application Signals
 */
 // listen&close port
  // open&close connection
wire        axis_listen_port_TVALID;
wire        axis_listen_port_TREADY;
wire[15:0]  axis_listen_port_TDATA;
wire        axis_listen_port_status_TVALID;
wire        axis_listen_port_status_TREADY;
wire[7:0]   axis_listen_port_status_TDATA;
//wire        axis_close_port_TVALID;
//wire        axis_close_port_TREADY;
//wire[15:0]  axis_close_port_TDATA;
 // notifications and pkg fetching
wire        axis_notifications_TVALID;
wire        axis_notifications_TREADY;
wire[87:0]  axis_notifications_TDATA;
wire        axis_read_package_TVALID;
wire        axis_read_package_TREADY;
wire[31:0]  axis_read_package_TDATA;
// open&close connection
wire        axis_open_connection_TVALID;
wire        axis_open_connection_TREADY;
wire[47:0]  axis_open_connection_TDATA;
wire        axis_open_status_TVALID;
wire        axis_open_status_TREADY;
wire[23:0]  axis_open_status_TDATA;
wire        axis_close_connection_TVALID;
wire        axis_close_connection_TREADY;
wire[15:0]  axis_close_connection_TDATA;
// rx data
wire        axis_rx_metadata_TVALID;
wire        axis_rx_metadata_TREADY;
wire[15:0]  axis_rx_metadata_TDATA;
wire        axis_rx_data_TVALID;
wire        axis_rx_data_TREADY;
wire[63:0]  axis_rx_data_TDATA;
wire[7:0]   axis_rx_data_TKEEP;
wire        axis_rx_data_TLAST;
// tx data
wire        axis_tx_metadata_TVALID;
wire        axis_tx_metadata_TREADY;
wire[15:0]  axis_tx_metadata_TDATA;
wire        axis_tx_data_TVALID;
wire        axis_tx_data_TREADY;
wire[63:0]  axis_tx_data_TDATA;
wire[7:0]   axis_tx_data_TKEEP;
wire        axis_tx_data_TLAST;
wire        axis_tx_status_TVALID;
wire        axis_tx_status_TREADY;
wire[23:0]  axis_tx_status_TDATA;

wire[15:0]  regSessionCount;
wire[15:0]  relSessionCount;
/*
 * 10G Network Interface Module
 */
eth10g_interface n10g_interface_inst (
.reset(~perst_n),
.aresetn(aresetn),
.xphy_refclk_p(xphy_refclk_p),
.xphy_refclk_n(xphy_refclk_n),
.xphy0_txp(xphy0_txp),
.xphy0_txn(xphy0_txn),
.xphy0_rxp(xphy0_rxp),
.xphy0_rxn(xphy0_rxn),
//master
.axis_i_0_tdata(AXI_S_Stream_TDATA),
.axis_i_0_tvalid(AXI_S_Stream_TVALID),
.axis_i_0_tlast(AXI_S_Stream_TLAST),
.axis_i_0_tuser(),
.axis_i_0_tkeep(AXI_S_Stream_TKEEP),
.axis_i_0_tready(AXI_S_Stream_TREADY),
//slave
.axis_o_0_tdata(AXI_M_Stream_TDATA),
.axis_o_0_tvalid(AXI_M_Stream_TVALID),
.axis_o_0_tlast(AXI_M_Stream_TLAST),
.axis_o_0_tuser(0),
.axis_o_0_tkeep(AXI_M_Stream_TKEEP),
.axis_o_0_tready(AXI_M_Stream_TREADY),    
.sfp_tx_disable(sfp_tx_disable),
.clk156_out(axi_clk),
.clk_ref_200_out(clk_ref_200),
.network_reset_done(network_init),
.led());

/*
 * TCP/IP Wrapper Module
 */
wire [15:0] regSessionCount_V;
wire regSessionCount_V_ap_vld;

wire[7:0]   axi_debug1_tkeep;
wire[63:0]  axi_debug1_tdata;
wire        axi_debug1_tvalid;
wire        axi_debug1_tready;
wire        axi_debug1_tlast;

wire[7:0]   axi_debug2_tkeep;
wire[63:0]  axi_debug2_tdata;
wire        axi_debug2_tvalid;
wire        axi_debug2_tready;
wire        axi_debug2_tlast;
/*
ila_0 ila_out (
  .clk(axi_clk),        // input wire clk
  .probe0(axi_debug1_tdata),  // input wire [63 : 0] probe1
  .probe1(axi_debug1_tkeep),  // input wire [7 : 0] probe0
  .probe2(axi_debug1_tvalid),  // input wire [0 : 0] probe2
  .probe3(axi_debug1_tready),  // input wire [0 : 0] probe3
  .probe4(axi_debug1_tlast)  // input wire [0 : 0] probe4
);


ila_0 ila_in (
  .clk(axi_clk),        // input wire clk
  .probe1(axi_debug2_tkeep),  // input wire [7 : 0] probe1
  .probe0(axi_debug2_tdata),  // input wire [63 : 0] probe0
  .probe2(axi_debug2_tvalid),  // input wire [0 : 0] probe2
  .probe3(axi_debug2_tready),  // input wire [0 : 0] probe3
  .probe4(axi_debug2_tlast)  // input wire [0 : 0] probe4
);*/

/*ila_0 ila1 (
  .clk(axi_clk),        // input wire clk
  .probe1(AXI_S_Stream_TKEEP),  // input wire [7 : 0] probe1
  .probe0(AXI_S_Stream_TDATA),  // input wire [63 : 0] probe0
  .probe2(AXI_S_Stream_TVALID),  // input wire [0 : 0] probe2
  .probe3(AXI_S_Stream_TREADY),  // input wire [0 : 0] probe3
  .probe4(AXI_S_Stream_TLAST)  // input wire [0 : 0] probe4
);

ila_0 ila2 (
  .clk(axi_clk),        // input wire clk
  .probe1(AXI_M_Stream_TKEEP),  // input wire [7 : 0] probe1
  .probe0(AXI_M_Stream_TDATA),  // input wire [63 : 0] probe0
  .probe2(AXI_M_Stream_TVALID),  // input wire [0 : 0] probe2
  .probe3(AXI_M_Stream_TREADY),  // input wire [0 : 0] probe3
  .probe4(AXI_M_Stream_TLAST)  // input wire [0 : 0] probe4
);*/
// UDP Loopback App to UDP App Mux wires
wire        shim2mux_requestPortOpenOut_V_TVALID;
wire        shim2mux_requestPortOpenOut_V_TREADY;
wire[15:0]  shim2mux_requestPortOpenOut_V_TDATA;    // Used to request the opening of a port by the App
wire        mux2shim_portOpenReplyIn_V_V_TVALID;
wire        mux2shim_portOpenReplyIn_V_V_TREADY;
wire[7:0]   mux2shim_portOpenReplyIn_V_V_TDATA;     // Reply to the open port request from the UDD Offload Engine
wire        mux2shimRxMetadataIn_V_TVALID;
wire        mux2shimRxMetadataIn_V_TREADY;
wire[95:0]  mux2shimRxMetadataIn_V_TDATA;           // Metadata output from the UDP App Mux
wire        mux2shimRxDataIn_TVALID;
wire        mux2shimRxDataIn_TREADY;
wire[63:0]  mux2shimRxDataIn_TDATA;                 // Packet data output from the UDP App Mux
wire        mux2shimRxDataIn_TLAST;
wire[7:0]   mux2shimRxDataIn_TKEEP;
wire        shim2mux_TVALID;
wire        shim2mux_TREADY;
wire[63:0]  shim2mux_TDATA;
wire[7:0]   shim2mux_TKEEP;
wire        shim2mux_TLAST;
wire        shim2muxTxMetadataOut_V_TVALID;
wire        shim2muxTxMetadataOut_V_TREADY;
wire[95:0]  shim2muxTxMetadataOut_V_TDATA;
wire        shim2muxTxLengthOut_V_V_TVALID;
wire        shim2muxTxLengthOut_V_V_TREADY;
wire[15:0]  shim2muxTxLengthOut_V_V_TDATA;

wire[31:0]  ipAddressOut;

/*ila_0 ipAddressIla (
	.clk(axi_clk), // input wire clk
	.probe0(ipAddressOut) // input wire [31:0] probe0
);*/

// Debug signals //
wire[99:0]  metadataFifo_din;     // [99:0] 
wire        metadataFifo_full;
wire        metadataFifo_write;

wire[15:0]  metadataHandlerFifo_din; // [15:0]
wire        metadataHandlerFifo_full;
wire        metadataHandlerFifo_write;
////////////////////
/*ila_0 mdFifo (
	.clk(axi_clk), // input wire clk
	.probe0(metadataFifo_din), // input wire [99:0]  probe0  
	.probe1(metadataFifo_full), // input wire [0:0]  probe1 
	.probe2(metadataFifo_write) // input wire [0:0]  probe2
);

ila_1 mdHandlerFifo (
	.clk(axi_clk), // input wire clk
	.probe0(metadataHandlerFifo_din), // input wire [15:0]  probe0  
	.probe1(metadataHandlerFifo_full), // input wire [0:0]  probe1 
	.probe2(metadataHandlerFifo_write) // input wire [0:0]  probe2
);*/

tcp_ip_wrapper tcp_ip_inst(
.aclk                           (axi_clk),
.aresetn                        (aresetn),
.myMacAddress			        (48'h7802010A20AC),
.inputIpAddress                 (32'h7802010A),
.dhcpEnable                     (1'b0),
.ipAddressout                   (ipAddressOut),
.regSessionCount                (regSessionCount),
.relSessionCount                (relSessionCount),
//////////////////////////////////////////////////
.upd_req_TVALID_out(upd_req_TVALID_out),
.upd_req_TREADY_out(upd_req_TREADY_out),
.upd_req_TDATA_out(upd_req_TDATA_out),
.upd_rsp_TVALID_out(upd_rsp_TVALID_out),
.upd_rsp_TREADY_out(upd_rsp_TREADY_out),
// Debug streams
.axi_debug1_tkeep               (axi_debug1_tkeep),     // input wire [7 : 0] probe1
.axi_debug1_tdata               (axi_debug1_tdata),     // input wire [63 : 0] probe0
.axi_debug1_tvalid              (axi_debug1_tvalid),    // input wire [0 : 0] probe2
.axi_debug1_tready              (axi_debug1_tready),    // input wire [0 : 0] probe3
.axi_debug1_tlast               (axi_debug1_tlast),     // input wire [0 : 0] probe4
.axi_debug2_tkeep               (axi_debug2_tkeep),     // input wire [7 : 0] probe1
.axi_debug2_tdata               (axi_debug2_tdata),     // input wire [63 : 0] probe0
.axi_debug2_tvalid              (axi_debug2_tvalid),    // input wire [0 : 0] probe2
.axi_debug2_tready              (axi_debug2_tready),    // input wire [0 : 0] probe3
.axi_debug2_tlast               (axi_debug2_tlast),     // input wire [0 : 0] probe4
// Debug signals //
.metadataFifo_din(metadataFifo_din),
.metadataFifo_full(metadataFifo_full),
.metadataFifo_write(metadataFifo_write),
.metadataHandlerFifo_din(metadataHandlerFifo_din),
.metadataHandlerFifo_full(metadataHandlerFifo_full),
.metadataHandlerFifo_write(metadataHandlerFifo_write),
////////////////////
// network interface streams
.AXI_M_Stream_TVALID            (AXI_M_Stream_TVALID),
.AXI_M_Stream_TREADY            (AXI_M_Stream_TREADY),
.AXI_M_Stream_TDATA             (AXI_M_Stream_TDATA),
.AXI_M_Stream_TKEEP             (AXI_M_Stream_TKEEP),
.AXI_M_Stream_TLAST             (AXI_M_Stream_TLAST),

.AXI_S_Stream_TVALID            (AXI_S_Stream_TVALID),
.AXI_S_Stream_TREADY            (AXI_S_Stream_TREADY),
.AXI_S_Stream_TDATA             (AXI_S_Stream_TDATA),
.AXI_S_Stream_TKEEP             (AXI_S_Stream_TKEEP),
.AXI_S_Stream_TLAST             (AXI_S_Stream_TLAST),

// memory rx cmd streams
.m_axis_rxread_cmd_TVALID       (axis_rxread_cmd_TVALID),
.m_axis_rxread_cmd_TREADY       (axis_rxread_cmd_TREADY),
.m_axis_rxread_cmd_TDATA        (axis_rxread_cmd_TDATA),
.m_axis_rxwrite_cmd_TVALID      (axis_rxwrite_cmd_TVALID),
.m_axis_rxwrite_cmd_TREADY      (axis_rxwrite_cmd_TREADY),
.m_axis_rxwrite_cmd_TDATA       (axis_rxwrite_cmd_TDATA),
// memory rx status streams
//.s_axis_rxread_sts_TVALID       (axis_rxread_sts_TVALID),
//.s_axis_rxread_sts_TREADY       (axis_rxread_sts_TREADY),
//.s_axis_rxread_sts_TDATA        (axis_rxread_sts_TDATA),
.s_axis_rxwrite_sts_TVALID      (axis_rxwrite_sts_TVALID),
.s_axis_rxwrite_sts_TREADY      (axis_rxwrite_sts_TREADY),
.s_axis_rxwrite_sts_TDATA       (axis_rxwrite_sts_TDATA),
// memory rx data streams
.s_axis_rxread_data_TVALID      (axis_rxread_data_TVALID),
.s_axis_rxread_data_TREADY      (axis_rxread_data_TREADY),
.s_axis_rxread_data_TDATA       (axis_rxread_data_TDATA),
.s_axis_rxread_data_TKEEP       (axis_rxread_data_TKEEP),
.s_axis_rxread_data_TLAST       (axis_rxread_data_TLAST),
.m_axis_rxwrite_data_TVALID     (axis_rxwrite_data_TVALID),
.m_axis_rxwrite_data_TREADY     (axis_rxwrite_data_TREADY),
.m_axis_rxwrite_data_TDATA      (axis_rxwrite_data_TDATA),
.m_axis_rxwrite_data_TKEEP      (axis_rxwrite_data_TKEEP),
.m_axis_rxwrite_data_TLAST      (axis_rxwrite_data_TLAST),

// memory tx cmd streams
.m_axis_txread_cmd_TVALID       (axis_txread_cmd_TVALID),
.m_axis_txread_cmd_TREADY       (axis_txread_cmd_TREADY),
.m_axis_txread_cmd_TDATA        (axis_txread_cmd_TDATA),
.m_axis_txwrite_cmd_TVALID      (axis_txwrite_cmd_TVALID),
.m_axis_txwrite_cmd_TREADY      (axis_txwrite_cmd_TREADY),
.m_axis_txwrite_cmd_TDATA       (axis_txwrite_cmd_TDATA),
// memory tx status streams
//.s_axis_txread_sts_TVALID       (axis_txread_sts_TVALID),
//.s_axis_txread_sts_TREADY       (axis_txread_sts_TREADY),
//.s_axis_txread_sts_TDATA        (axis_txread_sts_TDATA),
.s_axis_txwrite_sts_TVALID      (axis_txwrite_sts_TVALID),
.s_axis_txwrite_sts_TREADY      (axis_txwrite_sts_TREADY),
.s_axis_txwrite_sts_TDATA       (axis_txwrite_sts_TDATA),
// memory tx data streams
.s_axis_txread_data_TVALID      (axis_txread_data_TVALID),
.s_axis_txread_data_TREADY      (axis_txread_data_TREADY),
.s_axis_txread_data_TDATA       (axis_txread_data_TDATA),
.s_axis_txread_data_TKEEP       (axis_txread_data_TKEEP),
.s_axis_txread_data_TLAST       (axis_txread_data_TLAST),
.m_axis_txwrite_data_TVALID     (axis_txwrite_data_TVALID),
.m_axis_txwrite_data_TREADY     (axis_txwrite_data_TREADY),
.m_axis_txwrite_data_TDATA      (axis_txwrite_data_TDATA),
.m_axis_txwrite_data_TKEEP      (axis_txwrite_data_TKEEP),
.m_axis_txwrite_data_TLAST      (axis_txwrite_data_TLAST),

//application interface streams
.m_axis_listen_port_status_TVALID       (axis_listen_port_status_TVALID),
.m_axis_listen_port_status_TREADY       (axis_listen_port_status_TREADY),
.m_axis_listen_port_status_TDATA        (axis_listen_port_status_TDATA),
.m_axis_notifications_TVALID            (axis_notifications_TVALID),
.m_axis_notifications_TREADY            (axis_notifications_TREADY),
.m_axis_notifications_TDATA             (axis_notifications_TDATA),
.m_axis_open_status_TVALID              (axis_open_status_TVALID),
.m_axis_open_status_TREADY              (axis_open_status_TREADY),
.m_axis_open_status_TDATA               (axis_open_status_TDATA),
.m_axis_rx_data_TVALID                  (axis_rx_data_TVALID),
.m_axis_rx_data_TREADY                  (axis_rx_data_TREADY),
.m_axis_rx_data_TDATA                   (axis_rx_data_TDATA),
.m_axis_rx_data_TKEEP                   (axis_rx_data_TKEEP),
.m_axis_rx_data_TLAST                   (axis_rx_data_TLAST),
.m_axis_rx_metadata_TVALID              (axis_rx_metadata_TVALID),
.m_axis_rx_metadata_TREADY              (axis_rx_metadata_TREADY),
.m_axis_rx_metadata_TDATA               (axis_rx_metadata_TDATA),
.m_axis_tx_status_TVALID                (axis_tx_status_TVALID),
.m_axis_tx_status_TREADY                (axis_tx_status_TREADY),
.m_axis_tx_status_TDATA                 (axis_tx_status_TDATA),
.s_axis_listen_port_TVALID              (axis_listen_port_TVALID),
.s_axis_listen_port_TREADY              (axis_listen_port_TREADY),
.s_axis_listen_port_TDATA               (axis_listen_port_TDATA),
//.s_axis_close_port_TVALID             (axis_close_port_TVALID),
//.s_axis_close_port_TREADY             (axis_close_port_TREADY),
//.s_axis_close_port_TDATA              (axis_close_port_TDATA),
.s_axis_close_connection_TVALID         (axis_close_connection_TVALID),
.s_axis_close_connection_TREADY         (axis_close_connection_TREADY),
.s_axis_close_connection_TDATA          (axis_close_connection_TDATA),
.s_axis_open_connection_TVALID          (axis_open_connection_TVALID),
.s_axis_open_connection_TREADY          (axis_open_connection_TREADY),
.s_axis_open_connection_TDATA           (axis_open_connection_TDATA),
.s_axis_read_package_TVALID             (axis_read_package_TVALID),
.s_axis_read_package_TREADY             (axis_read_package_TREADY),
.s_axis_read_package_TDATA              (axis_read_package_TDATA),
.s_axis_tx_data_TVALID                  (axis_tx_data_TVALID),
.s_axis_tx_data_TREADY                  (axis_tx_data_TREADY),
.s_axis_tx_data_TDATA                   (axis_tx_data_TDATA),
.s_axis_tx_data_TKEEP                   (axis_tx_data_TKEEP),
.s_axis_tx_data_TLAST                   (axis_tx_data_TLAST),
.s_axis_tx_metadata_TVALID              (axis_tx_metadata_TVALID),
.s_axis_tx_metadata_TREADY              (axis_tx_metadata_TREADY),
.s_axis_tx_metadata_TDATA               (axis_tx_metadata_TDATA),
.regSessionCount_V                      (regSessionCount_V),
.regSessionCount_V_ap_vld               (regSessionCount_V_ap_vld),
// UDP User I/F to Loopback module //
.lbPortOpenReplyIn_TVALID               (mux2shim_portOpenReplyIn_V_V_TVALID),         // output wire portOpenReplyIn_TVALID
.lbPortOpenReplyIn_TREADY               (mux2shim_portOpenReplyIn_V_V_TREADY),         // input wire portOpenReplyIn_TREADY
.lbPortOpenReplyIn_TDATA                (mux2shim_portOpenReplyIn_V_V_TDATA),          // output wire [7 : 0] portOpenReplyIn_TDATA
.lbRequestPortOpenOut_TVALID            (shim2mux_requestPortOpenOut_V_TVALID),        // input wire requestPortOpenOut_TVALID
.lbRequestPortOpenOut_TREADY            (shim2mux_requestPortOpenOut_V_TREADY),        // output wire requestPortOpenOut_TREADY
.lbRequestPortOpenOut_TDATA             (shim2mux_requestPortOpenOut_V_TDATA),         // input wire [15 : 0] requestPortOpenOut_TDATA
.lbRxDataIn_TVALID                      (mux2shimRxDataIn_TVALID),                     // output wire rxDataIn_TVALID
.lbRxDataIn_TREADY                      (mux2shimRxDataIn_TREADY),                     // input wire rxDataIn_TREADY
.lbRxDataIn_TDATA                       (mux2shimRxDataIn_TDATA),                      // output wire [63 : 0] rxDataIn_TDATA
.lbRxDataIn_TKEEP                       (mux2shimRxDataIn_TKEEP),                      // output wire [7 : 0] rxDataIn_TKEEP
.lbRxDataIn_TLAST                       (mux2shimRxDataIn_TLAST),                      // output wire [0 : 0] rxDataIn_TLAST
.lbRxMetadataIn_TVALID                  (mux2shimRxMetadataIn_V_TVALID),               // output wire rxMetadataIn_TVALID
.lbRxMetadataIn_TREADY                  (mux2shimRxMetadataIn_V_TREADY),               // input wire rxMetadataIn_TREADY
.lbRxMetadataIn_TDATA                   (mux2shimRxMetadataIn_V_TDATA),                // output wire [95 : 0] rxMetadataIn_TDATA
.lbTxDataOut_TVALID                     (shim2mux_TVALID),                             // input wire txDataOut_TVALID
.lbTxDataOut_TREADY                     (shim2mux_TREADY),                             // output wire txDataOut_TREADY
.lbTxDataOut_TDATA                      (shim2mux_TDATA),                              // input wire [63 : 0] txDataOut_TDATA
.lbTxDataOut_TKEEP                      (shim2mux_TKEEP),                              // input wire [7 : 0] txDataOut_TKEEP
.lbTxDataOut_TLAST                      (shim2mux_TLAST),                              // input wire [0 : 0] txDataOut_TLAST
.lbTxLengthOut_TVALID                   (shim2muxTxLengthOut_V_V_TVALID),              // input wire txLengthOut_TVALID
.lbTxLengthOut_TREADY                   (shim2muxTxLengthOut_V_V_TREADY),              // output wire txLengthOut_TREADY
.lbTxLengthOut_TDATA                    (shim2muxTxLengthOut_V_V_TDATA),               // input wire [15 : 0] txLengthOut_TDATA
.lbTxMetadataOut_TVALID                 (shim2muxTxMetadataOut_V_TVALID),              // input wire txMetadataOut_TVALID
.lbTxMetadataOut_TREADY                 (shim2muxTxMetadataOut_V_TREADY),              // output wire txMetadataOut_TREADY
.lbTxMetadataOut_TDATA                  (shim2muxTxMetadataOut_V_TDATA)                // input wire [95 : 0] txMetadataOut_TDATA
);

reg app_start;
always @(posedge axi_clk)
begin
    if (aresetn == 0) begin
        app_start <= 0;
    end
    else begin
        app_start <= 1;//1;
    end
end

/*
 * Application Module
 */
//echo_server_application_ip echo_server
/*
iperf_ip iperf_server
//iperf_client_ip iperf_client
(
.m_axis_listen_port_TVALID(axis_listen_port_TVALID),
.m_axis_listen_port_TREADY(axis_listen_port_TREADY),
.m_axis_listen_port_TDATA(axis_listen_port_TDATA),
//.m_axis_close_port_TVALID(axis_close_port_TVALID),
//.m_axis_close_port_TREADY(axis_close_port_TREADY),
//.m_axis_close_port_TDATA(axis_close_port_TDATA),
.m_axis_close_connection_TVALID(axis_close_connection_TVALID),
.m_axis_close_connection_TREADY(axis_close_connection_TREADY),
.m_axis_close_connection_TDATA(axis_close_connection_TDATA),
.m_axis_open_connection_TVALID(axis_open_connection_TVALID),
.m_axis_open_connection_TREADY(axis_open_connection_TREADY),
.m_axis_open_connection_TDATA(axis_open_connection_TDATA),
.m_axis_read_package_TVALID(axis_read_package_TVALID),
.m_axis_read_package_TREADY(axis_read_package_TREADY),
.m_axis_read_package_TDATA(axis_read_package_TDATA),
.m_axis_tx_data_TVALID(axis_tx_data_TVALID),
.m_axis_tx_data_TREADY(axis_tx_data_TREADY),
.m_axis_tx_data_TDATA(axis_tx_data_TDATA),
.m_axis_tx_data_TKEEP(axis_tx_data_TKEEP),
.m_axis_tx_data_TLAST(axis_tx_data_TLAST),
.m_axis_tx_metadata_TVALID(axis_tx_metadata_TVALID),
.m_axis_tx_metadata_TREADY(axis_tx_metadata_TREADY),
.m_axis_tx_metadata_TDATA(axis_tx_metadata_TDATA),
.s_axis_listen_port_status_TVALID(axis_listen_port_status_TVALID),
.s_axis_listen_port_status_TREADY(axis_listen_port_status_TREADY),
.s_axis_listen_port_status_TDATA(axis_listen_port_status_TDATA),
.s_axis_notifications_TVALID(axis_notifications_TVALID),
.s_axis_notifications_TREADY(axis_notifications_TREADY),
.s_axis_notifications_TDATA(axis_notifications_TDATA),
.s_axis_open_status_TVALID(axis_open_status_TVALID),
.s_axis_open_status_TREADY(axis_open_status_TREADY),
.s_axis_open_status_TDATA(axis_open_status_TDATA),
.s_axis_rx_data_TVALID(axis_rx_data_TVALID),
.s_axis_rx_data_TREADY(axis_rx_data_TREADY),
.s_axis_rx_data_TDATA(axis_rx_data_TDATA),
.s_axis_rx_data_TKEEP(axis_rx_data_TKEEP),
.s_axis_rx_data_TLAST(axis_rx_data_TLAST),
.s_axis_rx_metadata_TVALID(axis_rx_metadata_TVALID),
.s_axis_rx_metadata_TREADY(axis_rx_metadata_TREADY),
.s_axis_rx_metadata_TDATA(axis_rx_metadata_TDATA),
.s_axis_tx_status_TVALID(axis_tx_status_TVALID),
.s_axis_tx_status_TREADY(axis_tx_status_TREADY),
.s_axis_tx_status_TDATA(axis_tx_status_TDATA),

//Client only
//.runExperiment_V(runExperiment),
//.useConn_V(8'h01),

.aclk(axi_clk), // input aclk
.aresetn(aresetn), // input aresetn
.ap_start(app_start), // input ap_start
.ap_ready(), // output ap_ready
.ap_done(), // output ap_done
.ap_idle() // output ap_idle
);*/

//wire        runExperiment;
//wire        dualMode;
//wire[7:0]   noOfConnections;
//wire[7:0]   pkgWordCount;

reg ap_start;
always@( posedge axi_clk)
begin
    if (aresetn == 0) 
        ap_start = 0;
    else
        ap_start = 1;
end

echo_server_application_ip myEchoServer (
  .ap_start(ap_start),                                                      // input wire ap_start
  .ap_ready(),                                                          // output wire ap_ready
  .ap_done(),                                                           // output wire ap_done
  .ap_idle(),                                                           // output wire ap_idle
  .m_axis_close_connection_TVALID(axis_close_connection_TVALID),      // output wire m_axis_close_connection_TVALID
  .m_axis_close_connection_TREADY(axis_close_connection_TREADY),      // input wire m_axis_close_connection_TREADY
  .m_axis_close_connection_TDATA(axis_close_connection_TDATA),        // output wire [15 : 0] m_axis_close_connection_TDATA
  .m_axis_listen_port_TVALID(axis_listen_port_TVALID),                // output wire m_axis_listen_port_TVALID
  .m_axis_listen_port_TREADY(axis_listen_port_TREADY),                // input wire m_axis_listen_port_TREADY
  .m_axis_listen_port_TDATA(axis_listen_port_TDATA),                  // output wire [15 : 0] m_axis_listen_port_TDATA
  .m_axis_open_connection_TVALID(axis_open_connection_TVALID),        // output wire m_axis_open_connection_TVALID
  .m_axis_open_connection_TREADY(axis_open_connection_TREADY),        // input wire m_axis_open_connection_TREADY
  .m_axis_open_connection_TDATA(axis_open_connection_TDATA),          // output wire [47 : 0] m_axis_open_connection_TDATA
  .m_axis_read_package_TVALID(axis_read_package_TVALID),              // output wire m_axis_read_package_TVALID
  .m_axis_read_package_TREADY(axis_read_package_TREADY),              // input wire m_axis_read_package_TREADY
  .m_axis_read_package_TDATA(axis_read_package_TDATA),                // output wire [31 : 0] m_axis_read_package_TDATA
  .m_axis_tx_data_TVALID(axis_tx_data_TVALID),                        // output wire m_axis_tx_data_TVALID
  .m_axis_tx_data_TREADY(axis_tx_data_TREADY),                        // input wire m_axis_tx_data_TREADY
  .m_axis_tx_data_TDATA(axis_tx_data_TDATA),                          // output wire [63 : 0] m_axis_tx_data_TDATA
  .m_axis_tx_data_TKEEP(axis_tx_data_TKEEP),                          // output wire [7 : 0] m_axis_tx_data_TKEEP
  .m_axis_tx_data_TLAST(axis_tx_data_TLAST),                          // output wire [0 : 0] m_axis_tx_data_TLAST
  .m_axis_tx_metadata_TVALID(axis_tx_metadata_TVALID),                // output wire m_axis_tx_metadata_TVALID
  .m_axis_tx_metadata_TREADY(axis_tx_metadata_TREADY),                // input wire m_axis_tx_metadata_TREADY
  .m_axis_tx_metadata_TDATA(axis_tx_metadata_TDATA),                  // output wire [15 : 0] m_axis_tx_metadata_TDATA
  .s_axis_listen_port_status_TVALID(axis_listen_port_status_TVALID),  // input wire s_axis_listen_port_status_TVALID
  .s_axis_listen_port_status_TREADY(axis_listen_port_status_TREADY),  // output wire s_axis_listen_port_status_TREADY
  .s_axis_listen_port_status_TDATA(axis_listen_port_status_TDATA),    // input wire [7 : 0] s_axis_listen_port_status_TDATA
  .s_axis_notifications_TVALID(axis_notifications_TVALID),            // input wire s_axis_notifications_TVALID
  .s_axis_notifications_TREADY(axis_notifications_TREADY),            // output wire s_axis_notifications_TREADY
  .s_axis_notifications_TDATA(axis_notifications_TDATA),              // input wire [87 : 0] s_axis_notifications_TDATA
  .s_axis_open_status_TVALID(axis_open_status_TVALID),                // input wire s_axis_open_status_TVALID
  .s_axis_open_status_TREADY(axis_open_status_TREADY),                // output wire s_axis_open_status_TREADY
  .s_axis_open_status_TDATA(axis_open_status_TDATA),                  // input wire [23 : 0] s_axis_open_status_TDATA
  .s_axis_rx_data_TVALID(axis_rx_data_TVALID),                        // input wire s_axis_rx_data_TVALID
  .s_axis_rx_data_TREADY(axis_rx_data_TREADY),                        // output wire s_axis_rx_data_TREADY
  .s_axis_rx_data_TDATA(axis_rx_data_TDATA),                          // input wire [63 : 0] s_axis_rx_data_TDATA
  .s_axis_rx_data_TKEEP(axis_rx_data_TKEEP),                          // input wire [7 : 0] s_axis_rx_data_TKEEP
  .s_axis_rx_data_TLAST(axis_rx_data_TLAST),                          // input wire [0 : 0] s_axis_rx_data_TLAST
  .s_axis_rx_metadata_TVALID(axis_rx_metadata_TVALID),                // input wire s_axis_rx_metadata_TVALID
  .s_axis_rx_metadata_TREADY(axis_rx_metadata_TREADY),                // output wire s_axis_rx_metadata_TREADY
  .s_axis_rx_metadata_TDATA(axis_rx_metadata_TDATA),                  // input wire [15 : 0] s_axis_rx_metadata_TDATA
  .s_axis_tx_status_TVALID(axis_tx_status_TVALID),                    // input wire s_axis_tx_status_TVALID
  .s_axis_tx_status_TREADY(axis_tx_status_TREADY),                    // output wire s_axis_tx_status_TREADY
  .s_axis_tx_status_TDATA(axis_tx_status_TDATA),                      // input wire [23 : 0] s_axis_tx_status_TDATA
  .aclk(axi_clk),                                                          // input wire aclk
  .aresetn(aresetn)                                                    // input wire aresetn
);
/*
iperf_client_0 iperf_client_inst (
  .runExperiment_V(runExperiment),                                    // input wire [0 : 0] runExperiment_V
  .dualModeEn_V(dualMode),                                          // input wire [0 : 0] dualModeEn_V
  .useConn_V(noOfConnections),                                                // input wire [7 : 0] useConn_V
  .pkgWordCount_V(pkgWordCount),                                      // input wire [7 : 0] pkgWordCount_V
  .regIpAddress1_V(32'h01010114),                                    // input wire [31 : 0] regIpAddress1_V
  .m_axis_close_connection_TVALID(axis_close_connection_TVALID),      // output wire m_axis_close_connection_TVALID
  .m_axis_close_connection_TREADY(axis_close_connection_TREADY),      // input wire m_axis_close_connection_TREADY
  .m_axis_close_connection_TDATA(axis_close_connection_TDATA),        // output wire [15 : 0] m_axis_close_connection_TDATA
  .m_axis_listen_port_TVALID(axis_listen_port_TVALID),                // output wire m_axis_listen_port_TVALID
  .m_axis_listen_port_TREADY(axis_listen_port_TREADY),                // input wire m_axis_listen_port_TREADY
  .m_axis_listen_port_TDATA(axis_listen_port_TDATA),                  // output wire [15 : 0] m_axis_listen_port_TDATA
  .m_axis_open_connection_TVALID(axis_open_connection_TVALID),        // output wire m_axis_open_connection_TVALID
  .m_axis_open_connection_TREADY(axis_open_connection_TREADY),        // input wire m_axis_open_connection_TREADY
  .m_axis_open_connection_TDATA(axis_open_connection_TDATA),          // output wire [47 : 0] m_axis_open_connection_TDATA
  .m_axis_read_package_TVALID(axis_read_package_TVALID),              // output wire m_axis_read_package_TVALID
  .m_axis_read_package_TREADY(axis_read_package_TREADY),              // input wire m_axis_read_package_TREADY
  .m_axis_read_package_TDATA(axis_read_package_TDATA),                // output wire [31 : 0] m_axis_read_package_TDATA
  .m_axis_tx_data_TVALID(axis_tx_data_TVALID),                        // output wire m_axis_tx_data_TVALID
  .m_axis_tx_data_TREADY(axis_tx_data_TREADY),                        // input wire m_axis_tx_data_TREADY
  .m_axis_tx_data_TDATA(axis_tx_data_TDATA),                          // output wire [63 : 0] m_axis_tx_data_TDATA
  .m_axis_tx_data_TKEEP(axis_tx_data_TKEEP),                          // output wire [7 : 0] m_axis_tx_data_TKEEP
  .m_axis_tx_data_TLAST(axis_tx_data_TLAST),                          // output wire [0 : 0] m_axis_tx_data_TLAST
  .m_axis_tx_metadata_TVALID(axis_tx_metadata_TVALID),                // output wire m_axis_tx_metadata_TVALID
  .m_axis_tx_metadata_TREADY(axis_tx_metadata_TREADY),                // input wire m_axis_tx_metadata_TREADY
  .m_axis_tx_metadata_TDATA(axis_tx_metadata_TDATA),                  // output wire [15 : 0] m_axis_tx_metadata_TDATA
  .s_axis_listen_port_status_TVALID(axis_listen_port_status_TVALID),  // input wire s_axis_listen_port_status_TVALID
  .s_axis_listen_port_status_TREADY(axis_listen_port_status_TREADY),  // output wire s_axis_listen_port_status_TREADY
  .s_axis_listen_port_status_TDATA(axis_listen_port_status_TDATA),    // input wire [7 : 0] s_axis_listen_port_status_TDATA
  .s_axis_notifications_TVALID(axis_notifications_TVALID),            // input wire s_axis_notifications_TVALID
  .s_axis_notifications_TREADY(axis_notifications_TREADY),            // output wire s_axis_notifications_TREADY
  .s_axis_notifications_TDATA(axis_notifications_TDATA),              // input wire [87 : 0] s_axis_notifications_TDATA
  .s_axis_open_status_TVALID(axis_open_status_TVALID),                // input wire s_axis_open_status_TVALID
  .s_axis_open_status_TREADY(axis_open_status_TREADY),                // output wire s_axis_open_status_TREADY
  .s_axis_open_status_TDATA(axis_open_status_TDATA),                  // input wire [23 : 0] s_axis_open_status_TDATA
  .s_axis_rx_data_TVALID(axis_rx_data_TVALID),                        // input wire s_axis_rx_data_TVALID
  .s_axis_rx_data_TREADY(axis_rx_data_TREADY),                        // output wire s_axis_rx_data_TREADY
  .s_axis_rx_data_TDATA(axis_rx_data_TDATA),                          // input wire [63 : 0] s_axis_rx_data_TDATA
  .s_axis_rx_data_TKEEP(axis_rx_data_TKEEP),                          // input wire [7 : 0] s_axis_rx_data_TKEEP
  .s_axis_rx_data_TLAST(axis_rx_data_TLAST),                          // input wire [0 : 0] s_axis_rx_data_TLAST
  .s_axis_rx_metadata_TVALID(axis_rx_metadata_TVALID),                // input wire s_axis_rx_metadata_TVALID
  .s_axis_rx_metadata_TREADY(axis_rx_metadata_TREADY),                // output wire s_axis_rx_metadata_TREADY
  .s_axis_rx_metadata_TDATA(axis_rx_metadata_TDATA),                  // input wire [15 : 0] s_axis_rx_metadata_TDATA
  .s_axis_tx_status_TVALID(axis_tx_status_TVALID),                    // input wire s_axis_tx_status_TVALID
  .s_axis_tx_status_TREADY(axis_tx_status_TREADY),                    // output wire s_axis_tx_status_TREADY
  .s_axis_tx_status_TDATA(axis_tx_status_TDATA),                      // input wire [23 : 0] s_axis_tx_status_TDATA
  .aclk(axi_clk),                                                     // input wire aclk
  .aresetn(aresetn)                                                   // input wire aresetn
);*/
/*
vio_ip myVIO (
  .clk(axi_clk),                    // input wire clk
  .probe_in0(),                     // input wire [0 : 0] probe_in0
  .probe_out0(runExperiment),       // output wire [0 : 0] probe_out0
  .probe_out1(dualMode),            // output wire [0 : 0] probe_out1
  .probe_out2(noOfConnections),     // output wire [7 : 0] probe_out2
  .probe_out3(pkgWordCount)         // output wire [7 : 0] probe_out3
);*/

udpLoopback_0 udpLoopback_inst (
  .lbPortOpenReplyIn_TVALID(mux2shim_portOpenReplyIn_V_V_TVALID),       // input wire portOpenReplyIn_TVALID
  .lbPortOpenReplyIn_TREADY(mux2shim_portOpenReplyIn_V_V_TREADY),       // output wire portOpenReplyIn_TREADY
  .lbPortOpenReplyIn_TDATA(mux2shim_portOpenReplyIn_V_V_TDATA),         // input wire [7 : 0] portOpenReplyIn_TDATA
  .lbRequestPortOpenOut_TVALID(shim2mux_requestPortOpenOut_V_TVALID),   // output wire requestPortOpenOut_TVALID
  .lbRequestPortOpenOut_TREADY(shim2mux_requestPortOpenOut_V_TREADY),   // input wire requestPortOpenOut_TREADY
  .lbRequestPortOpenOut_TDATA(shim2mux_requestPortOpenOut_V_TDATA),     // output wire [15 : 0] requestPortOpenOut_TDATA
  .lbRxDataIn_TVALID(mux2shimRxDataIn_TVALID),                          // input wire rxDataIn_TVALID
  .lbRxDataIn_TREADY(mux2shimRxDataIn_TREADY),                          // output wire rxDataIn_TREADY
  .lbRxDataIn_TDATA(mux2shimRxDataIn_TDATA),                            // input wire [63 : 0] rxDataIn_TDATA
  .lbRxDataIn_TKEEP(mux2shimRxDataIn_TKEEP),                            // input wire [7 : 0] rxDataIn_TKEEP
  .lbRxDataIn_TLAST(mux2shimRxDataIn_TLAST),                            // input wire [0 : 0] rxDataIn_TLAST
  .lbRxMetadataIn_TVALID(mux2shimRxMetadataIn_V_TVALID),                // input wire rxMetadataIn_TVALID
  .lbRxMetadataIn_TREADY(mux2shimRxMetadataIn_V_TREADY),                // output wire rxMetadataIn_TREADY
  .lbRxMetadataIn_TDATA(mux2shimRxMetadataIn_V_TDATA),                  // input wire [95 : 0] rxMetadataIn_TDATA
  .lbTxDataOut_TVALID(shim2mux_TVALID),                                 // output wire txDataOut_TVALID
  .lbTxDataOut_TREADY(shim2mux_TREADY),                                 // input wire txDataOut_TREADY
  .lbTxDataOut_TDATA(shim2mux_TDATA),                                   // output wire [63 : 0] txDataOut_TDATA
  .lbTxDataOut_TKEEP(shim2mux_TKEEP),                                   // output wire [7 : 0] txDataOut_TKEEP
  .lbTxDataOut_TLAST(shim2mux_TLAST),                                   // output wire [0 : 0] txDataOut_TLAST
  .lbTxLengthOut_TVALID(shim2muxTxLengthOut_V_V_TVALID),                // output wire txLengthOut_TVALID
  .lbTxLengthOut_TREADY(shim2muxTxLengthOut_V_V_TREADY),                // input wire txLengthOut_TREADY
  .lbTxLengthOut_TDATA(shim2muxTxLengthOut_V_V_TDATA),                  // output wire [15 : 0] txLengthOut_TDATA
  .lbTxMetadataOut_TVALID(shim2muxTxMetadataOut_V_TVALID),              // output wire txMetadataOut_TVALID
  .lbTxMetadataOut_TREADY(shim2muxTxMetadataOut_V_TREADY),              // input wire txMetadataOut_TREADY
  .lbTxMetadataOut_TDATA(shim2muxTxMetadataOut_V_TDATA),                // output wire [95 : 0] txMetadataOut_TDATA
  .aclk(axi_clk),                                                       // input wire aclk
  .aresetn(aresetn)                                                     // input wire aresetn
);

//DRAM MEM interface

//wire clk156_25;
wire reset156_25_n;
wire clk233;
wire clk200, clk200_i;
wire c0_init_calib_complete;
wire c1_init_calib_complete;

//toe stream interface signals
wire           toeTX_s_axis_read_cmd_tvalid;
wire          toeTX_s_axis_read_cmd_tready;
wire[71:0]     toeTX_s_axis_read_cmd_tdata;
//read status
wire          toeTX_m_axis_read_sts_tvalid;
wire           toeTX_m_axis_read_sts_tready;
wire[7:0]     toeTX_m_axis_read_sts_tdata;
//read stream
wire[63:0]    toeTX_m_axis_read_tdata;
wire[7:0]     toeTX_m_axis_read_tkeep;
wire          toeTX_m_axis_read_tlast;
wire          toeTX_m_axis_read_tvalid;
wire           toeTX_m_axis_read_tready;

//write commands
wire           toeTX_s_axis_write_cmd_tvalid;
wire          toeTX_s_axis_write_cmd_tready;
wire[71:0]     toeTX_s_axis_write_cmd_tdata;
//write status
wire          toeTX_m_axis_write_sts_tvalid;
wire           toeTX_m_axis_write_sts_tready;
wire[31:0]     toeTX_m_axis_write_sts_tdata;
//write stream
wire[63:0]     toeTX_s_axis_write_tdata;
wire[7:0]      toeTX_s_axis_write_tkeep;
wire           toeTX_s_axis_write_tlast;
wire           toeTX_s_axis_write_tvalid;
wire          toeTX_s_axis_write_tready;


wire ddr3_calib_complete, init_calib_complete;
wire toeTX_compare_error, ht_compare_error, upd_compare_error;

reg rst_n_r1, rst_n_r2, rst_n_r3;
reg reset156_25_n_r1, reset156_25_n_r2, reset156_25_n_r3;

//registers for crossing clock domains (from 233MHz to 156.25MHz)
reg c0_init_calib_complete_r1, c0_init_calib_complete_r2;
reg c1_init_calib_complete_r1, c1_init_calib_complete_r2;

//localparam TOE_START_ADDR = 32'd0;
//localparam HT_START_ADDR = 32'd0;
//localparam UPD_START_ADDR = 32'd32;



   
//assign clk156_25 = axi_clk;
//assign clk200 = clk_ref_200;

   always @(posedge axi_clk) begin
        reset156_25_n_r1 <= perst_n & pok_dram & network_init;
        reset156_25_n_r2 <= reset156_25_n_r1;
        reset156_25_n_r3 <= reset156_25_n_r2;
   end
  
   assign reset156_25_n = reset156_25_n_r3;
    assign aresetn = reset156_25_n & network_init;
always @(posedge axi_clk) 
    if (~reset156_25_n) begin
        c0_init_calib_complete_r1 <= 1'b0;
        c0_init_calib_complete_r2 <= 1'b0;
        c1_init_calib_complete_r1 <= 1'b0;
        c1_init_calib_complete_r2 <= 1'b0;
    end
    else begin
        c0_init_calib_complete_r1 <= c0_init_calib_complete;
        c0_init_calib_complete_r2 <= c0_init_calib_complete_r1;
        c1_init_calib_complete_r1 <= c1_init_calib_complete;
        c1_init_calib_complete_r2 <= c1_init_calib_complete_r1;
    end

assign ddr3_calib_complete = c0_init_calib_complete_r2 & c1_init_calib_complete_r2;
assign init_calib_complete = ddr3_calib_complete;
/*
 * TX Memory Signals
 */
// memory cmd streams
assign toeTX_s_axis_read_cmd_tvalid = axis_txread_cmd_TVALID;
assign axis_txread_cmd_TREADY = toeTX_s_axis_read_cmd_tready;
assign toeTX_s_axis_read_cmd_tdata = axis_txread_cmd_TDATA;
assign toeTX_s_axis_write_cmd_tvalid = axis_txwrite_cmd_TVALID;
assign axis_txwrite_cmd_TREADY = toeTX_s_axis_write_cmd_tready;
assign toeTX_s_axis_write_cmd_tdata = axis_txwrite_cmd_TDATA;
// memory sts streams
assign axis_txread_sts_TVALID         = toeTX_m_axis_read_sts_tvalid;
assign toeTX_m_axis_read_sts_tready   = 1'b1;
assign axis_txread_sts_TDATA          = toeTX_m_axis_read_sts_tdata;
assign axis_txwrite_sts_TVALID        = toeTX_m_axis_write_sts_tvalid;
assign toeTX_m_axis_write_sts_tready  = axis_txwrite_sts_TREADY;
assign axis_txwrite_sts_TDATA         = toeTX_m_axis_write_sts_tdata;
// memory data streams
assign axis_txread_data_TVALID = toeTX_m_axis_read_tvalid;
assign toeTX_m_axis_read_tready = axis_txread_data_TREADY;
assign axis_txread_data_TDATA = toeTX_m_axis_read_tdata;
assign axis_txread_data_TKEEP = toeTX_m_axis_read_tkeep;
assign axis_txread_data_TLAST = toeTX_m_axis_read_tlast;

assign toeTX_s_axis_write_tvalid = axis_txwrite_data_TVALID;
assign axis_txwrite_data_TREADY = toeTX_s_axis_write_tready;
assign toeTX_s_axis_write_tdata = axis_txwrite_data_TDATA;
assign toeTX_s_axis_write_tkeep = axis_txwrite_data_TKEEP;
assign toeTX_s_axis_write_tlast = axis_txwrite_data_TLAST;

wire           toeRX_s_axis_read_cmd_tvalid;
wire          toeRX_s_axis_read_cmd_tready;
wire[71:0]     toeRX_s_axis_read_cmd_tdata;
//read status
wire          toeRX_m_axis_read_sts_tvalid;
wire           toeRX_m_axis_read_sts_tready;
wire[7:0]     toeRX_m_axis_read_sts_tdata;
//read stream
wire[63:0]    toeRX_m_axis_read_tdata;
wire[7:0]     toeRX_m_axis_read_tkeep;
wire          toeRX_m_axis_read_tlast;
wire          toeRX_m_axis_read_tvalid;
wire           toeRX_m_axis_read_tready;

//write commands
wire           toeRX_s_axis_write_cmd_tvalid;
wire          toeRX_s_axis_write_cmd_tready;
wire[71:0]     toeRX_s_axis_write_cmd_tdata;
//write status
wire          toeRX_m_axis_write_sts_tvalid;
wire           toeRX_m_axis_write_sts_tready;
wire[7:0]     toeRX_m_axis_write_sts_tdata;
//write stream
wire[63:0]     toeRX_s_axis_write_tdata;
wire[7:0]      toeRX_s_axis_write_tkeep;
wire           toeRX_s_axis_write_tlast;
wire           toeRX_s_axis_write_tvalid;
wire          toeRX_s_axis_write_tready;

wire  toeRX_compare_error;
assign toeRX_compare_error = 1'b0;

/* RX Memory Signals
 */
// memory cmd streams
assign toeRX_s_axis_read_cmd_tvalid = axis_rxread_cmd_TVALID;
assign axis_rxread_cmd_TREADY = toeRX_s_axis_read_cmd_tready;
assign toeRX_s_axis_read_cmd_tdata = axis_rxread_cmd_TDATA;
assign toeRX_s_axis_write_cmd_tvalid = axis_rxwrite_cmd_TVALID;
assign axis_rxwrite_cmd_TREADY = toeRX_s_axis_write_cmd_tready;
assign toeRX_s_axis_write_cmd_tdata = axis_rxwrite_cmd_TDATA;
// memory sts streams
assign axis_rxread_sts_TVALID = toeRX_m_axis_read_sts_tvalid;
assign toeRX_m_axis_read_sts_tready = 1'b1;
assign axis_rxread_sts_TDATA = toeRX_m_axis_read_sts_tdata;
assign axis_rxwrite_sts_TVALID = toeRX_m_axis_write_sts_tvalid;
assign toeRX_m_axis_write_sts_tready = axis_rxwrite_sts_TREADY;
assign axis_rxwrite_sts_TDATA = toeRX_m_axis_write_sts_tdata;
// memory data streams
assign axis_rxread_data_TVALID = toeRX_m_axis_read_tvalid;
assign toeRX_m_axis_read_tready = axis_rxread_data_TREADY;
assign axis_rxread_data_TDATA = toeRX_m_axis_read_tdata;
assign axis_rxread_data_TKEEP = toeRX_m_axis_read_tkeep;
assign axis_rxread_data_TLAST = toeRX_m_axis_read_tlast;

assign toeRX_s_axis_write_tvalid = axis_rxwrite_data_TVALID;
assign axis_rxwrite_data_TREADY = toeRX_s_axis_write_tready;
assign toeRX_s_axis_write_tdata = axis_rxwrite_data_TDATA;
assign toeRX_s_axis_write_tkeep = axis_rxwrite_data_TKEEP;
assign toeRX_s_axis_write_tlast = axis_rxwrite_data_TLAST;

mem_inf  #(
    .C0_SIMULATION("FALSE"),
    .C1_SIMULATION("FALSE"),
    .C0_SIM_BYPASS_INIT_CAL("OFF"),
    .C1_SIM_BYPASS_INIT_CAL("OFF")
)
mem_inf_inst(
.clk156_25(axi_clk),
//.reset233_n(reset233_n), //active low reset signal for 233MHz clock domain
.reset156_25_n(ddr3_calib_complete),
//.clk233(clk233),
//.clk200(clk_ref_200),

//ddr3 pins
//SODIMM 0
// Inouts
.c0_ddr3_dq(c0_ddr3_dq),
.c0_ddr3_dqs_n(c0_ddr3_dqs_n),
.c0_ddr3_dqs_p(c0_ddr3_dqs_p),

// Outputs
.c0_ddr3_addr(c0_ddr3_addr),
.c0_ddr3_ba(c0_ddr3_ba),
.c0_ddr3_ras_n(c0_ddr3_ras_n),
.c0_ddr3_cas_n(c0_ddr3_cas_n),
.c0_ddr3_we_n(c0_ddr3_we_n),
.c0_ddr3_reset_n(c0_ddr3_reset_n),
.c0_ddr3_ck_p(c0_ddr3_ck_p),
.c0_ddr3_ck_n(c0_ddr3_ck_n),
.c0_ddr3_cke(c0_ddr3_cke),
.c0_ddr3_cs_n(c0_ddr3_cs_n),
//.c0_ddr3_dm(c0_ddr3_dm),
.c0_ddr3_odt(c0_ddr3_odt),
.c0_ui_clk(),
.c0_init_calib_complete(c0_init_calib_complete),
  // Differential system clocks
.c0_sys_clk_p(c0_sys_clk_p),
.c0_sys_clk_n(c0_sys_clk_n),
 // differential iodelayctrl clk (reference clock)
.clk_ref_p(clk_ref_p),
.clk_ref_n(clk_ref_n),
.c1_sys_clk_p(c1_sys_clk_p),
.c1_sys_clk_n(c1_sys_clk_n),
.sys_rst(perst_n & pok_dram),
//SODIMM 1
// Inouts
.c1_ddr3_dq(c1_ddr3_dq),
.c1_ddr3_dqs_n(c1_ddr3_dqs_n),
.c1_ddr3_dqs_p(c1_ddr3_dqs_p),

// Outputs
.c1_ddr3_addr(c1_ddr3_addr),
.c1_ddr3_ba(c1_ddr3_ba),
.c1_ddr3_ras_n(c1_ddr3_ras_n),
.c1_ddr3_cas_n(c1_ddr3_cas_n),
.c1_ddr3_we_n(c1_ddr3_we_n),
.c1_ddr3_reset_n(c1_ddr3_reset_n),
.c1_ddr3_ck_p(c1_ddr3_ck_p),
.c1_ddr3_ck_n(c1_ddr3_ck_n),
.c1_ddr3_cke(c1_ddr3_cke),
.c1_ddr3_cs_n(c1_ddr3_cs_n),
//.c1_ddr3_dm(c1_ddr3_dm),
.c1_ddr3_odt(c1_ddr3_odt),
.c1_ui_clk(),
.c1_init_calib_complete(c1_init_calib_complete),

//toe stream interface signals
.toeTX_s_axis_read_cmd_tvalid(toeTX_s_axis_read_cmd_tvalid),
.toeTX_s_axis_read_cmd_tready(toeTX_s_axis_read_cmd_tready),
.toeTX_s_axis_read_cmd_tdata(toeTX_s_axis_read_cmd_tdata),
//read status
.toeTX_m_axis_read_sts_tvalid(toeTX_m_axis_read_sts_tvalid),
.toeTX_m_axis_read_sts_tready(toeTX_m_axis_read_sts_tready),
.toeTX_m_axis_read_sts_tdata(toeTX_m_axis_read_sts_tdata),
//read stream
.toeTX_m_axis_read_tdata(toeTX_m_axis_read_tdata),
.toeTX_m_axis_read_tkeep(toeTX_m_axis_read_tkeep),
.toeTX_m_axis_read_tlast(toeTX_m_axis_read_tlast),
.toeTX_m_axis_read_tvalid(toeTX_m_axis_read_tvalid),
.toeTX_m_axis_read_tready(toeTX_m_axis_read_tready),

//write commands
.toeTX_s_axis_write_cmd_tvalid(toeTX_s_axis_write_cmd_tvalid),
.toeTX_s_axis_write_cmd_tready(toeTX_s_axis_write_cmd_tready),
.toeTX_s_axis_write_cmd_tdata(toeTX_s_axis_write_cmd_tdata),
//write status
.toeTX_m_axis_write_sts_tvalid(toeTX_m_axis_write_sts_tvalid),
.toeTX_m_axis_write_sts_tready(toeTX_m_axis_write_sts_tready),
.toeTX_m_axis_write_sts_tdata(toeTX_m_axis_write_sts_tdata),
//write stream
.toeTX_s_axis_write_tdata(toeTX_s_axis_write_tdata),
.toeTX_s_axis_write_tkeep(toeTX_s_axis_write_tkeep),
.toeTX_s_axis_write_tlast(toeTX_s_axis_write_tlast),
.toeTX_s_axis_write_tvalid(toeTX_s_axis_write_tvalid),
.toeTX_s_axis_write_tready(toeTX_s_axis_write_tready),

.toeRX_s_axis_read_cmd_tvalid(toeRX_s_axis_read_cmd_tvalid),
.toeRX_s_axis_read_cmd_tready(toeRX_s_axis_read_cmd_tready),
.toeRX_s_axis_read_cmd_tdata(toeRX_s_axis_read_cmd_tdata),
//read status
.toeRX_m_axis_read_sts_tvalid(toeRX_m_axis_read_sts_tvalid),
.toeRX_m_axis_read_sts_tready(toeRX_m_axis_read_sts_tready),
.toeRX_m_axis_read_sts_tdata(toeRX_m_axis_read_sts_tdata),
//read stream
.toeRX_m_axis_read_tdata(toeRX_m_axis_read_tdata),
.toeRX_m_axis_read_tkeep(toeRX_m_axis_read_tkeep),
.toeRX_m_axis_read_tlast(toeRX_m_axis_read_tlast),
.toeRX_m_axis_read_tvalid(toeRX_m_axis_read_tvalid),
.toeRX_m_axis_read_tready(toeRX_m_axis_read_tready),

//write commands
.toeRX_s_axis_write_cmd_tvalid(toeRX_s_axis_write_cmd_tvalid),
.toeRX_s_axis_write_cmd_tready(toeRX_s_axis_write_cmd_tready),
.toeRX_s_axis_write_cmd_tdata(toeRX_s_axis_write_cmd_tdata),
//write status
.toeRX_m_axis_write_sts_tvalid(toeRX_m_axis_write_sts_tvalid),
.toeRX_m_axis_write_sts_tready(toeRX_m_axis_write_sts_tready),
.toeRX_m_axis_write_sts_tdata(toeRX_m_axis_write_sts_tdata),
//write stream
.toeRX_s_axis_write_tdata(toeRX_s_axis_write_tdata),
.toeRX_s_axis_write_tkeep(toeRX_s_axis_write_tkeep),
.toeRX_s_axis_write_tlast(toeRX_s_axis_write_tlast),
.toeRX_s_axis_write_tvalid(toeRX_s_axis_write_tvalid),
.toeRX_s_axis_write_tready(toeRX_s_axis_write_tready),

//ht stream interface signals
.ht_s_axis_read_cmd_tvalid(ht_s_axis_read_cmd_tvalid),
.ht_s_axis_read_cmd_tready(ht_s_axis_read_cmd_tready),
.ht_s_axis_read_cmd_tdata(ht_s_axis_read_cmd_tdata),
//read status
.ht_m_axis_read_sts_tvalid(ht_m_axis_read_sts_tvalid),
.ht_m_axis_read_sts_tready(ht_m_axis_read_sts_tready),
.ht_m_axis_read_sts_tdata(ht_m_axis_read_sts_tdata),
//read stream
.ht_m_axis_read_tdata(ht_m_axis_read_tdata),
.ht_m_axis_read_tkeep(ht_m_axis_read_tkeep),
.ht_m_axis_read_tlast(ht_m_axis_read_tlast),
.ht_m_axis_read_tvalid(ht_m_axis_read_tvalid),
.ht_m_axis_read_tready(ht_m_axis_read_tready),

//write commands
.ht_s_axis_write_cmd_tvalid(ht_s_axis_write_cmd_tvalid),
.ht_s_axis_write_cmd_tready(ht_s_axis_write_cmd_tready),
.ht_s_axis_write_cmd_tdata(ht_s_axis_write_cmd_tdata),
//write status
.ht_m_axis_write_sts_tvalid(ht_m_axis_write_sts_tvalid),
.ht_m_axis_write_sts_tready(ht_m_axis_write_sts_tready),
.ht_m_axis_write_sts_tdata(ht_m_axis_write_sts_tdata),
//write stream
.ht_s_axis_write_tdata(ht_s_axis_write_tdata),
.ht_s_axis_write_tkeep(ht_s_axis_write_tkeep),
.ht_s_axis_write_tlast(ht_s_axis_write_tlast),
.ht_s_axis_write_tvalid(ht_s_axis_write_tvalid),
.ht_s_axis_write_tready(ht_s_axis_write_tready),

//upd stream interface signals
.upd_s_axis_read_cmd_tvalid(upd_s_axis_read_cmd_tvalid),
.upd_s_axis_read_cmd_tready(upd_s_axis_read_cmd_tready),
.upd_s_axis_read_cmd_tdata(upd_s_axis_read_cmd_tdata),
//read status
.upd_m_axis_read_sts_tvalid(upd_m_axis_read_sts_tvalid),
.upd_m_axis_read_sts_tready(upd_m_axis_read_sts_tready),
.upd_m_axis_read_sts_tdata(upd_m_axis_read_sts_tdata),
//read stream
.upd_m_axis_read_tdata(upd_m_axis_read_tdata),
.upd_m_axis_read_tkeep(upd_m_axis_read_tkeep),
.upd_m_axis_read_tlast(upd_m_axis_read_tlast),
.upd_m_axis_read_tvalid(upd_m_axis_read_tvalid),
.upd_m_axis_read_tready(upd_m_axis_read_tready),

//write commands
.upd_s_axis_write_cmd_tvalid(upd_s_axis_write_cmd_tvalid),
.upd_s_axis_write_cmd_tready(upd_s_axis_write_cmd_tready),
.upd_s_axis_write_cmd_tdata(upd_s_axis_write_cmd_tdata),
//write status
.upd_m_axis_write_sts_tvalid(upd_m_axis_write_sts_tvalid),
.upd_m_axis_write_sts_tready(upd_m_axis_write_sts_tready),
.upd_m_axis_write_sts_tdata(upd_m_axis_write_sts_tdata),
//write stream
.upd_s_axis_write_tdata(upd_s_axis_write_tdata),
.upd_s_axis_write_tkeep(upd_s_axis_write_tkeep),
.upd_s_axis_write_tlast(upd_s_axis_write_tlast),
.upd_s_axis_write_tvalid(upd_s_axis_write_tvalid),
.upd_s_axis_write_tready(upd_s_axis_write_tready)
);

assign usr_led[0] = init_calib_complete;
assign usr_led[1] = perst_n & pok_dram;
assign usr_led[2] = app_start;
assign usr_led[5:3] = 0;
/*
always@ (posedge axi_clk)
begin
 if (toeRX_s_axis_write_cmd_tvalid == 1)
    wrCmdCounter = wrCmdCounter + 1;

end

always@ (posedge axi_clk)
begin
 if (toeRX_s_axis_read_cmd_tvalid == 1)
    rdCmdCounter = rdCmdCounter + 1;

end

always@ (posedge axi_clk)
begin
 if (axis_read_package_TVALID == 1)
    rdAppCounter = rdAppCounter + 1;

end*/

/*dataIla rxWrIla (
	.clk(axi_clk), // input wire clk
	.probe0(axis_rxwrite_data_TREADY), // input wire [0:0]  probe0  
	.probe1(axis_rxwrite_data_TVALID), // input wire [0:0]  probe1 
	.probe2(axis_rxwrite_data_TLAST), // input wire [0:0]  probe2
	.probe3(wrCmdCounter)
);

cmdIla rxWrCmdIla (
	.clk(axi_clk), // input wire clk
	.probe0(axis_rxwrite_cmd_TDATA), // input wire [71:0]  probe0  
	.probe1(axis_rxwrite_cmd_TVALID), // input wire [0:0]  probe1 
	.probe2(axis_rxwrite_cmd_TREADY), // input wire [0:0]  probe2
	.probe3(wrCmdCounter)
);

stsIla rxWrStatusIla (
	.clk(axi_clk), // input wire clk
	.probe0(axis_rxwrite_sts_TDATA), // input wire [7:0]  probe0  
	.probe1(1'b0), // input wire [0:0]  probe1 
	.probe2(axis_rxwrite_sts_TVALID) // input wire [0:0]  probe2
);*/
/*
sessionIla sessionProbe (
	.clk(axi_clk), // input wire clk
	.probe0(regSessionCount), // input wire [15:0]  probe0  
	.probe1(relSessionCount) // input wire [15:0]  probe1
);

slupIla slupProbe (
	.clk(axi_clk), // input wire clk
	.probe0(upd_req_TVALID_out), // input wire [0:0]  probe0  
	.probe1(upd_req_TREADY_out), // input wire [0:0]  probe1 
	.probe2(upd_req_TDATA_out), // input wire [0:0]  probe2 
	.probe3(upd_rsp_TVALID_out), // input wire [0:0]  probe3 
	.probe4(upd_rsp_TREADY_out) // input wire [0:0]  probe4
);*/
endmodule
