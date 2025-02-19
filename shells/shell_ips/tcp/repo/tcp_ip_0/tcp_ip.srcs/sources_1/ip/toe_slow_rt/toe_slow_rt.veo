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

// IP VLNV: ethz.systems:hls:tcp_slowrttoe:1.6
// IP Revision: 1903262226

// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
toe_slow_rt your_instance_name (
  .myIpAddress_V(myIpAddress_V),                                            // input wire [31 : 0] myIpAddress_V
  .regSessionCount_V(regSessionCount_V),                                    // output wire [15 : 0] regSessionCount_V
  .regSessionCount_V_ap_vld(regSessionCount_V_ap_vld),                      // output wire regSessionCount_V_ap_vld
  .m_axis_listen_port_rsp_TVALID(m_axis_listen_port_rsp_TVALID),            // output wire m_axis_listen_port_rsp_TVALID
  .m_axis_listen_port_rsp_TREADY(m_axis_listen_port_rsp_TREADY),            // input wire m_axis_listen_port_rsp_TREADY
  .m_axis_listen_port_rsp_TDATA(m_axis_listen_port_rsp_TDATA),              // output wire [7 : 0] m_axis_listen_port_rsp_TDATA
  .m_axis_notification_TVALID(m_axis_notification_TVALID),                  // output wire m_axis_notification_TVALID
  .m_axis_notification_TREADY(m_axis_notification_TREADY),                  // input wire m_axis_notification_TREADY
  .m_axis_notification_TDATA(m_axis_notification_TDATA),                    // output wire [87 : 0] m_axis_notification_TDATA
  .m_axis_open_conn_rsp_TVALID(m_axis_open_conn_rsp_TVALID),                // output wire m_axis_open_conn_rsp_TVALID
  .m_axis_open_conn_rsp_TREADY(m_axis_open_conn_rsp_TREADY),                // input wire m_axis_open_conn_rsp_TREADY
  .m_axis_open_conn_rsp_TDATA(m_axis_open_conn_rsp_TDATA),                  // output wire [23 : 0] m_axis_open_conn_rsp_TDATA
  .m_axis_rx_data_rsp_TVALID(m_axis_rx_data_rsp_TVALID),                    // output wire m_axis_rx_data_rsp_TVALID
  .m_axis_rx_data_rsp_TREADY(m_axis_rx_data_rsp_TREADY),                    // input wire m_axis_rx_data_rsp_TREADY
  .m_axis_rx_data_rsp_TDATA(m_axis_rx_data_rsp_TDATA),                      // output wire [63 : 0] m_axis_rx_data_rsp_TDATA
  .m_axis_rx_data_rsp_TKEEP(m_axis_rx_data_rsp_TKEEP),                      // output wire [7 : 0] m_axis_rx_data_rsp_TKEEP
  .m_axis_rx_data_rsp_TLAST(m_axis_rx_data_rsp_TLAST),                      // output wire [0 : 0] m_axis_rx_data_rsp_TLAST
  .m_axis_rx_data_rsp_metadata_TVALID(m_axis_rx_data_rsp_metadata_TVALID),  // output wire m_axis_rx_data_rsp_metadata_TVALID
  .m_axis_rx_data_rsp_metadata_TREADY(m_axis_rx_data_rsp_metadata_TREADY),  // input wire m_axis_rx_data_rsp_metadata_TREADY
  .m_axis_rx_data_rsp_metadata_TDATA(m_axis_rx_data_rsp_metadata_TDATA),    // output wire [15 : 0] m_axis_rx_data_rsp_metadata_TDATA
  .m_axis_rxread_cmd_TVALID(m_axis_rxread_cmd_TVALID),                      // output wire m_axis_rxread_cmd_TVALID
  .m_axis_rxread_cmd_TREADY(m_axis_rxread_cmd_TREADY),                      // input wire m_axis_rxread_cmd_TREADY
  .m_axis_rxread_cmd_TDATA(m_axis_rxread_cmd_TDATA),                        // output wire [71 : 0] m_axis_rxread_cmd_TDATA
  .m_axis_rxwrite_cmd_TVALID(m_axis_rxwrite_cmd_TVALID),                    // output wire m_axis_rxwrite_cmd_TVALID
  .m_axis_rxwrite_cmd_TREADY(m_axis_rxwrite_cmd_TREADY),                    // input wire m_axis_rxwrite_cmd_TREADY
  .m_axis_rxwrite_cmd_TDATA(m_axis_rxwrite_cmd_TDATA),                      // output wire [71 : 0] m_axis_rxwrite_cmd_TDATA
  .m_axis_rxwrite_data_TVALID(m_axis_rxwrite_data_TVALID),                  // output wire m_axis_rxwrite_data_TVALID
  .m_axis_rxwrite_data_TREADY(m_axis_rxwrite_data_TREADY),                  // input wire m_axis_rxwrite_data_TREADY
  .m_axis_rxwrite_data_TDATA(m_axis_rxwrite_data_TDATA),                    // output wire [63 : 0] m_axis_rxwrite_data_TDATA
  .m_axis_rxwrite_data_TKEEP(m_axis_rxwrite_data_TKEEP),                    // output wire [7 : 0] m_axis_rxwrite_data_TKEEP
  .m_axis_rxwrite_data_TLAST(m_axis_rxwrite_data_TLAST),                    // output wire [0 : 0] m_axis_rxwrite_data_TLAST
  .m_axis_session_lup_req_TVALID(m_axis_session_lup_req_TVALID),            // output wire m_axis_session_lup_req_TVALID
  .m_axis_session_lup_req_TREADY(m_axis_session_lup_req_TREADY),            // input wire m_axis_session_lup_req_TREADY
  .m_axis_session_lup_req_TDATA(m_axis_session_lup_req_TDATA),              // output wire [103 : 0] m_axis_session_lup_req_TDATA
  .m_axis_session_upd_req_TVALID(m_axis_session_upd_req_TVALID),            // output wire m_axis_session_upd_req_TVALID
  .m_axis_session_upd_req_TREADY(m_axis_session_upd_req_TREADY),            // input wire m_axis_session_upd_req_TREADY
  .m_axis_session_upd_req_TDATA(m_axis_session_upd_req_TDATA),              // output wire [111 : 0] m_axis_session_upd_req_TDATA
  .m_axis_tcp_data_TVALID(m_axis_tcp_data_TVALID),                          // output wire m_axis_tcp_data_TVALID
  .m_axis_tcp_data_TREADY(m_axis_tcp_data_TREADY),                          // input wire m_axis_tcp_data_TREADY
  .m_axis_tcp_data_TDATA(m_axis_tcp_data_TDATA),                            // output wire [63 : 0] m_axis_tcp_data_TDATA
  .m_axis_tcp_data_TKEEP(m_axis_tcp_data_TKEEP),                            // output wire [7 : 0] m_axis_tcp_data_TKEEP
  .m_axis_tcp_data_TLAST(m_axis_tcp_data_TLAST),                            // output wire [0 : 0] m_axis_tcp_data_TLAST
  .m_axis_tx_data_rsp_TVALID(m_axis_tx_data_rsp_TVALID),                    // output wire m_axis_tx_data_rsp_TVALID
  .m_axis_tx_data_rsp_TREADY(m_axis_tx_data_rsp_TREADY),                    // input wire m_axis_tx_data_rsp_TREADY
  .m_axis_tx_data_rsp_TDATA(m_axis_tx_data_rsp_TDATA),                      // output wire [23 : 0] m_axis_tx_data_rsp_TDATA
  .m_axis_txread_cmd_TVALID(m_axis_txread_cmd_TVALID),                      // output wire m_axis_txread_cmd_TVALID
  .m_axis_txread_cmd_TREADY(m_axis_txread_cmd_TREADY),                      // input wire m_axis_txread_cmd_TREADY
  .m_axis_txread_cmd_TDATA(m_axis_txread_cmd_TDATA),                        // output wire [71 : 0] m_axis_txread_cmd_TDATA
  .m_axis_txwrite_cmd_TVALID(m_axis_txwrite_cmd_TVALID),                    // output wire m_axis_txwrite_cmd_TVALID
  .m_axis_txwrite_cmd_TREADY(m_axis_txwrite_cmd_TREADY),                    // input wire m_axis_txwrite_cmd_TREADY
  .m_axis_txwrite_cmd_TDATA(m_axis_txwrite_cmd_TDATA),                      // output wire [71 : 0] m_axis_txwrite_cmd_TDATA
  .m_axis_txwrite_data_TVALID(m_axis_txwrite_data_TVALID),                  // output wire m_axis_txwrite_data_TVALID
  .m_axis_txwrite_data_TREADY(m_axis_txwrite_data_TREADY),                  // input wire m_axis_txwrite_data_TREADY
  .m_axis_txwrite_data_TDATA(m_axis_txwrite_data_TDATA),                    // output wire [63 : 0] m_axis_txwrite_data_TDATA
  .m_axis_txwrite_data_TKEEP(m_axis_txwrite_data_TKEEP),                    // output wire [7 : 0] m_axis_txwrite_data_TKEEP
  .m_axis_txwrite_data_TLAST(m_axis_txwrite_data_TLAST),                    // output wire [0 : 0] m_axis_txwrite_data_TLAST
  .s_axis_close_conn_req_TVALID(s_axis_close_conn_req_TVALID),              // input wire s_axis_close_conn_req_TVALID
  .s_axis_close_conn_req_TREADY(s_axis_close_conn_req_TREADY),              // output wire s_axis_close_conn_req_TREADY
  .s_axis_close_conn_req_TDATA(s_axis_close_conn_req_TDATA),                // input wire [15 : 0] s_axis_close_conn_req_TDATA
  .s_axis_listen_port_req_TVALID(s_axis_listen_port_req_TVALID),            // input wire s_axis_listen_port_req_TVALID
  .s_axis_listen_port_req_TREADY(s_axis_listen_port_req_TREADY),            // output wire s_axis_listen_port_req_TREADY
  .s_axis_listen_port_req_TDATA(s_axis_listen_port_req_TDATA),              // input wire [15 : 0] s_axis_listen_port_req_TDATA
  .s_axis_open_conn_req_TVALID(s_axis_open_conn_req_TVALID),                // input wire s_axis_open_conn_req_TVALID
  .s_axis_open_conn_req_TREADY(s_axis_open_conn_req_TREADY),                // output wire s_axis_open_conn_req_TREADY
  .s_axis_open_conn_req_TDATA(s_axis_open_conn_req_TDATA),                  // input wire [47 : 0] s_axis_open_conn_req_TDATA
  .s_axis_rx_data_req_TVALID(s_axis_rx_data_req_TVALID),                    // input wire s_axis_rx_data_req_TVALID
  .s_axis_rx_data_req_TREADY(s_axis_rx_data_req_TREADY),                    // output wire s_axis_rx_data_req_TREADY
  .s_axis_rx_data_req_TDATA(s_axis_rx_data_req_TDATA),                      // input wire [31 : 0] s_axis_rx_data_req_TDATA
  .s_axis_rxread_data_TVALID(s_axis_rxread_data_TVALID),                    // input wire s_axis_rxread_data_TVALID
  .s_axis_rxread_data_TREADY(s_axis_rxread_data_TREADY),                    // output wire s_axis_rxread_data_TREADY
  .s_axis_rxread_data_TDATA(s_axis_rxread_data_TDATA),                      // input wire [63 : 0] s_axis_rxread_data_TDATA
  .s_axis_rxread_data_TKEEP(s_axis_rxread_data_TKEEP),                      // input wire [7 : 0] s_axis_rxread_data_TKEEP
  .s_axis_rxread_data_TLAST(s_axis_rxread_data_TLAST),                      // input wire [0 : 0] s_axis_rxread_data_TLAST
  .s_axis_rxwrite_sts_TVALID(s_axis_rxwrite_sts_TVALID),                    // input wire s_axis_rxwrite_sts_TVALID
  .s_axis_rxwrite_sts_TREADY(s_axis_rxwrite_sts_TREADY),                    // output wire s_axis_rxwrite_sts_TREADY
  .s_axis_rxwrite_sts_TDATA(s_axis_rxwrite_sts_TDATA),                      // input wire [7 : 0] s_axis_rxwrite_sts_TDATA
  .s_axis_session_lup_rsp_TVALID(s_axis_session_lup_rsp_TVALID),            // input wire s_axis_session_lup_rsp_TVALID
  .s_axis_session_lup_rsp_TREADY(s_axis_session_lup_rsp_TREADY),            // output wire s_axis_session_lup_rsp_TREADY
  .s_axis_session_lup_rsp_TDATA(s_axis_session_lup_rsp_TDATA),              // input wire [15 : 0] s_axis_session_lup_rsp_TDATA
  .s_axis_session_upd_rsp_TVALID(s_axis_session_upd_rsp_TVALID),            // input wire s_axis_session_upd_rsp_TVALID
  .s_axis_session_upd_rsp_TREADY(s_axis_session_upd_rsp_TREADY),            // output wire s_axis_session_upd_rsp_TREADY
  .s_axis_session_upd_rsp_TDATA(s_axis_session_upd_rsp_TDATA),              // input wire [15 : 0] s_axis_session_upd_rsp_TDATA
  .s_axis_tcp_data_TVALID(s_axis_tcp_data_TVALID),                          // input wire s_axis_tcp_data_TVALID
  .s_axis_tcp_data_TREADY(s_axis_tcp_data_TREADY),                          // output wire s_axis_tcp_data_TREADY
  .s_axis_tcp_data_TDATA(s_axis_tcp_data_TDATA),                            // input wire [63 : 0] s_axis_tcp_data_TDATA
  .s_axis_tcp_data_TKEEP(s_axis_tcp_data_TKEEP),                            // input wire [7 : 0] s_axis_tcp_data_TKEEP
  .s_axis_tcp_data_TLAST(s_axis_tcp_data_TLAST),                            // input wire [0 : 0] s_axis_tcp_data_TLAST
  .s_axis_tx_data_req_TVALID(s_axis_tx_data_req_TVALID),                    // input wire s_axis_tx_data_req_TVALID
  .s_axis_tx_data_req_TREADY(s_axis_tx_data_req_TREADY),                    // output wire s_axis_tx_data_req_TREADY
  .s_axis_tx_data_req_TDATA(s_axis_tx_data_req_TDATA),                      // input wire [63 : 0] s_axis_tx_data_req_TDATA
  .s_axis_tx_data_req_TKEEP(s_axis_tx_data_req_TKEEP),                      // input wire [7 : 0] s_axis_tx_data_req_TKEEP
  .s_axis_tx_data_req_TLAST(s_axis_tx_data_req_TLAST),                      // input wire [0 : 0] s_axis_tx_data_req_TLAST
  .s_axis_tx_data_req_metadata_TVALID(s_axis_tx_data_req_metadata_TVALID),  // input wire s_axis_tx_data_req_metadata_TVALID
  .s_axis_tx_data_req_metadata_TREADY(s_axis_tx_data_req_metadata_TREADY),  // output wire s_axis_tx_data_req_metadata_TREADY
  .s_axis_tx_data_req_metadata_TDATA(s_axis_tx_data_req_metadata_TDATA),    // input wire [31 : 0] s_axis_tx_data_req_metadata_TDATA
  .s_axis_txread_data_TVALID(s_axis_txread_data_TVALID),                    // input wire s_axis_txread_data_TVALID
  .s_axis_txread_data_TREADY(s_axis_txread_data_TREADY),                    // output wire s_axis_txread_data_TREADY
  .s_axis_txread_data_TDATA(s_axis_txread_data_TDATA),                      // input wire [63 : 0] s_axis_txread_data_TDATA
  .s_axis_txread_data_TKEEP(s_axis_txread_data_TKEEP),                      // input wire [7 : 0] s_axis_txread_data_TKEEP
  .s_axis_txread_data_TLAST(s_axis_txread_data_TLAST),                      // input wire [0 : 0] s_axis_txread_data_TLAST
  .s_axis_txwrite_sts_TVALID(s_axis_txwrite_sts_TVALID),                    // input wire s_axis_txwrite_sts_TVALID
  .s_axis_txwrite_sts_TREADY(s_axis_txwrite_sts_TREADY),                    // output wire s_axis_txwrite_sts_TREADY
  .s_axis_txwrite_sts_TDATA(s_axis_txwrite_sts_TDATA),                      // input wire [7 : 0] s_axis_txwrite_sts_TDATA
  .aclk(aclk),                                                              // input wire aclk
  .aresetn(aresetn)                                                        // input wire aresetn
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

