//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
//Date        : Wed Aug 18 04:22:17 2021
//Host        : Gaoyu running 64-bit Ubuntu 16.04.7 LTS
//Command     : generate_target lbus_axis_converter_wrapper.bd
//Design      : lbus_axis_converter_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module lbus_axis_converter_wrapper
   (axis_ready,
    clk,
    error,
    lbus_0_data_V_0,
    lbus_0_data_V_1,
    lbus_0_ena_V_0,
    lbus_0_ena_V_1,
    lbus_0_eop_V_0,
    lbus_0_eop_V_1,
    lbus_0_err_V_0,
    lbus_0_err_V_1,
    lbus_0_mty_V_0,
    lbus_0_mty_V_1,
    lbus_0_sop_V_0,
    lbus_0_sop_V_1,
    lbus_1_data_V_0,
    lbus_1_data_V_1,
    lbus_1_ena_V_0,
    lbus_1_ena_V_1,
    lbus_1_eop_V_0,
    lbus_1_eop_V_1,
    lbus_1_err_V_0,
    lbus_1_err_V_1,
    lbus_1_mty_V_0,
    lbus_1_mty_V_1,
    lbus_1_sop_V_0,
    lbus_1_sop_V_1,
    lbus_2_data_V_0,
    lbus_2_data_V_1,
    lbus_2_ena_V_0,
    lbus_2_ena_V_1,
    lbus_2_eop_V_0,
    lbus_2_eop_V_1,
    lbus_2_err_V_0,
    lbus_2_err_V_1,
    lbus_2_mty_V_0,
    lbus_2_mty_V_1,
    lbus_2_sop_V_0,
    lbus_2_sop_V_1,
    lbus_3_data_V_0,
    lbus_3_data_V_1,
    lbus_3_ena_V_0,
    lbus_3_ena_V_1,
    lbus_3_eop_V_0,
    lbus_3_eop_V_1,
    lbus_3_err_V_0,
    lbus_3_err_V_1,
    lbus_3_mty_V_0,
    lbus_3_mty_V_1,
    lbus_3_sop_V_0,
    lbus_3_sop_V_1,
    lbus_ready_V_0,
    m_axis_data,
    m_axis_keep,
    m_axis_last,
    m_axis_valid,
    rst,
    s_axis_data,
    s_axis_keep,
    s_axis_last,
    s_axis_valid);
  output [0:0]axis_ready;
  input clk;
  output [0:0]error;
  input [127:0]lbus_0_data_V_0;
  output [127:0]lbus_0_data_V_1;
  input [0:0]lbus_0_ena_V_0;
  output [0:0]lbus_0_ena_V_1;
  input [0:0]lbus_0_eop_V_0;
  output [0:0]lbus_0_eop_V_1;
  input [0:0]lbus_0_err_V_0;
  output [0:0]lbus_0_err_V_1;
  input [3:0]lbus_0_mty_V_0;
  output [3:0]lbus_0_mty_V_1;
  input [0:0]lbus_0_sop_V_0;
  output [0:0]lbus_0_sop_V_1;
  input [127:0]lbus_1_data_V_0;
  output [127:0]lbus_1_data_V_1;
  input [0:0]lbus_1_ena_V_0;
  output [0:0]lbus_1_ena_V_1;
  input [0:0]lbus_1_eop_V_0;
  output [0:0]lbus_1_eop_V_1;
  input [0:0]lbus_1_err_V_0;
  output [0:0]lbus_1_err_V_1;
  input [3:0]lbus_1_mty_V_0;
  output [3:0]lbus_1_mty_V_1;
  input [0:0]lbus_1_sop_V_0;
  output [0:0]lbus_1_sop_V_1;
  input [127:0]lbus_2_data_V_0;
  output [127:0]lbus_2_data_V_1;
  input [0:0]lbus_2_ena_V_0;
  output [0:0]lbus_2_ena_V_1;
  input [0:0]lbus_2_eop_V_0;
  output [0:0]lbus_2_eop_V_1;
  input [0:0]lbus_2_err_V_0;
  output [0:0]lbus_2_err_V_1;
  input [3:0]lbus_2_mty_V_0;
  output [3:0]lbus_2_mty_V_1;
  input [0:0]lbus_2_sop_V_0;
  output [0:0]lbus_2_sop_V_1;
  input [127:0]lbus_3_data_V_0;
  output [127:0]lbus_3_data_V_1;
  input [0:0]lbus_3_ena_V_0;
  output [0:0]lbus_3_ena_V_1;
  input [0:0]lbus_3_eop_V_0;
  output [0:0]lbus_3_eop_V_1;
  input [0:0]lbus_3_err_V_0;
  output [0:0]lbus_3_err_V_1;
  input [3:0]lbus_3_mty_V_0;
  output [3:0]lbus_3_mty_V_1;
  input [0:0]lbus_3_sop_V_0;
  output [0:0]lbus_3_sop_V_1;
  input [0:0]lbus_ready_V_0;
  output [511:0]m_axis_data;
  output [63:0]m_axis_keep;
  output [0:0]m_axis_last;
  output [0:0]m_axis_valid;
  input rst;
  input [511:0]s_axis_data;
  input [63:0]s_axis_keep;
  input [0:0]s_axis_last;
  input [0:0]s_axis_valid;

  wire [0:0]axis_ready;
  wire clk;
  wire [0:0]error;
  wire [127:0]lbus_0_data_V_0;
  wire [127:0]lbus_0_data_V_1;
  wire [0:0]lbus_0_ena_V_0;
  wire [0:0]lbus_0_ena_V_1;
  wire [0:0]lbus_0_eop_V_0;
  wire [0:0]lbus_0_eop_V_1;
  wire [0:0]lbus_0_err_V_0;
  wire [0:0]lbus_0_err_V_1;
  wire [3:0]lbus_0_mty_V_0;
  wire [3:0]lbus_0_mty_V_1;
  wire [0:0]lbus_0_sop_V_0;
  wire [0:0]lbus_0_sop_V_1;
  wire [127:0]lbus_1_data_V_0;
  wire [127:0]lbus_1_data_V_1;
  wire [0:0]lbus_1_ena_V_0;
  wire [0:0]lbus_1_ena_V_1;
  wire [0:0]lbus_1_eop_V_0;
  wire [0:0]lbus_1_eop_V_1;
  wire [0:0]lbus_1_err_V_0;
  wire [0:0]lbus_1_err_V_1;
  wire [3:0]lbus_1_mty_V_0;
  wire [3:0]lbus_1_mty_V_1;
  wire [0:0]lbus_1_sop_V_0;
  wire [0:0]lbus_1_sop_V_1;
  wire [127:0]lbus_2_data_V_0;
  wire [127:0]lbus_2_data_V_1;
  wire [0:0]lbus_2_ena_V_0;
  wire [0:0]lbus_2_ena_V_1;
  wire [0:0]lbus_2_eop_V_0;
  wire [0:0]lbus_2_eop_V_1;
  wire [0:0]lbus_2_err_V_0;
  wire [0:0]lbus_2_err_V_1;
  wire [3:0]lbus_2_mty_V_0;
  wire [3:0]lbus_2_mty_V_1;
  wire [0:0]lbus_2_sop_V_0;
  wire [0:0]lbus_2_sop_V_1;
  wire [127:0]lbus_3_data_V_0;
  wire [127:0]lbus_3_data_V_1;
  wire [0:0]lbus_3_ena_V_0;
  wire [0:0]lbus_3_ena_V_1;
  wire [0:0]lbus_3_eop_V_0;
  wire [0:0]lbus_3_eop_V_1;
  wire [0:0]lbus_3_err_V_0;
  wire [0:0]lbus_3_err_V_1;
  wire [3:0]lbus_3_mty_V_0;
  wire [3:0]lbus_3_mty_V_1;
  wire [0:0]lbus_3_sop_V_0;
  wire [0:0]lbus_3_sop_V_1;
  wire [0:0]lbus_ready_V_0;
  wire [511:0]m_axis_data;
  wire [63:0]m_axis_keep;
  wire [0:0]m_axis_last;
  wire [0:0]m_axis_valid;
  wire rst;
  wire [511:0]s_axis_data;
  wire [63:0]s_axis_keep;
  wire [0:0]s_axis_last;
  wire [0:0]s_axis_valid;

  lbus_axis_converter lbus_axis_converter_i
       (.axis_ready(axis_ready),
        .clk(clk),
        .error(error),
        .lbus_0_data_V_0(lbus_0_data_V_0),
        .lbus_0_data_V_1(lbus_0_data_V_1),
        .lbus_0_ena_V_0(lbus_0_ena_V_0),
        .lbus_0_ena_V_1(lbus_0_ena_V_1),
        .lbus_0_eop_V_0(lbus_0_eop_V_0),
        .lbus_0_eop_V_1(lbus_0_eop_V_1),
        .lbus_0_err_V_0(lbus_0_err_V_0),
        .lbus_0_err_V_1(lbus_0_err_V_1),
        .lbus_0_mty_V_0(lbus_0_mty_V_0),
        .lbus_0_mty_V_1(lbus_0_mty_V_1),
        .lbus_0_sop_V_0(lbus_0_sop_V_0),
        .lbus_0_sop_V_1(lbus_0_sop_V_1),
        .lbus_1_data_V_0(lbus_1_data_V_0),
        .lbus_1_data_V_1(lbus_1_data_V_1),
        .lbus_1_ena_V_0(lbus_1_ena_V_0),
        .lbus_1_ena_V_1(lbus_1_ena_V_1),
        .lbus_1_eop_V_0(lbus_1_eop_V_0),
        .lbus_1_eop_V_1(lbus_1_eop_V_1),
        .lbus_1_err_V_0(lbus_1_err_V_0),
        .lbus_1_err_V_1(lbus_1_err_V_1),
        .lbus_1_mty_V_0(lbus_1_mty_V_0),
        .lbus_1_mty_V_1(lbus_1_mty_V_1),
        .lbus_1_sop_V_0(lbus_1_sop_V_0),
        .lbus_1_sop_V_1(lbus_1_sop_V_1),
        .lbus_2_data_V_0(lbus_2_data_V_0),
        .lbus_2_data_V_1(lbus_2_data_V_1),
        .lbus_2_ena_V_0(lbus_2_ena_V_0),
        .lbus_2_ena_V_1(lbus_2_ena_V_1),
        .lbus_2_eop_V_0(lbus_2_eop_V_0),
        .lbus_2_eop_V_1(lbus_2_eop_V_1),
        .lbus_2_err_V_0(lbus_2_err_V_0),
        .lbus_2_err_V_1(lbus_2_err_V_1),
        .lbus_2_mty_V_0(lbus_2_mty_V_0),
        .lbus_2_mty_V_1(lbus_2_mty_V_1),
        .lbus_2_sop_V_0(lbus_2_sop_V_0),
        .lbus_2_sop_V_1(lbus_2_sop_V_1),
        .lbus_3_data_V_0(lbus_3_data_V_0),
        .lbus_3_data_V_1(lbus_3_data_V_1),
        .lbus_3_ena_V_0(lbus_3_ena_V_0),
        .lbus_3_ena_V_1(lbus_3_ena_V_1),
        .lbus_3_eop_V_0(lbus_3_eop_V_0),
        .lbus_3_eop_V_1(lbus_3_eop_V_1),
        .lbus_3_err_V_0(lbus_3_err_V_0),
        .lbus_3_err_V_1(lbus_3_err_V_1),
        .lbus_3_mty_V_0(lbus_3_mty_V_0),
        .lbus_3_mty_V_1(lbus_3_mty_V_1),
        .lbus_3_sop_V_0(lbus_3_sop_V_0),
        .lbus_3_sop_V_1(lbus_3_sop_V_1),
        .lbus_ready_V_0(lbus_ready_V_0),
        .m_axis_data(m_axis_data),
        .m_axis_keep(m_axis_keep),
        .m_axis_last(m_axis_last),
        .m_axis_valid(m_axis_valid),
        .rst(rst),
        .s_axis_data(s_axis_data),
        .s_axis_keep(s_axis_keep),
        .s_axis_last(s_axis_last),
        .s_axis_valid(s_axis_valid));
endmodule
