//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
//Date        : Wed Aug 18 04:22:16 2021
//Host        : Gaoyu running 64-bit Ubuntu 16.04.7 LTS
//Command     : generate_target lbus_axis_converter.bd
//Design      : lbus_axis_converter
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "lbus_axis_converter,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=lbus_axis_converter,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=6,numReposBlks=6,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=3,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "lbus_axis_converter.hwdef" *) 
module lbus_axis_converter
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
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.AXIS_READY DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.AXIS_READY, LAYERED_METADATA undef" *) output [0:0]axis_ready;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, ASSOCIATED_RESET rst, CLK_DOMAIN lbus_axis_converter_ap_clk_0, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000" *) input clk;
  output [0:0]error;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LBUS_0_DATA_V_0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LBUS_0_DATA_V_0, LAYERED_METADATA undef" *) input [127:0]lbus_0_data_V_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LBUS_0_DATA_V_1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LBUS_0_DATA_V_1, LAYERED_METADATA undef" *) output [127:0]lbus_0_data_V_1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LBUS_0_ENA_V_0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LBUS_0_ENA_V_0, LAYERED_METADATA undef" *) input [0:0]lbus_0_ena_V_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LBUS_0_ENA_V_1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LBUS_0_ENA_V_1, LAYERED_METADATA undef" *) output [0:0]lbus_0_ena_V_1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LBUS_0_EOP_V_0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LBUS_0_EOP_V_0, LAYERED_METADATA undef" *) input [0:0]lbus_0_eop_V_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LBUS_0_EOP_V_1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LBUS_0_EOP_V_1, LAYERED_METADATA undef" *) output [0:0]lbus_0_eop_V_1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LBUS_0_ERR_V_0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LBUS_0_ERR_V_0, LAYERED_METADATA undef" *) input [0:0]lbus_0_err_V_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LBUS_0_ERR_V_1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LBUS_0_ERR_V_1, LAYERED_METADATA undef" *) output [0:0]lbus_0_err_V_1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LBUS_0_MTY_V_0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LBUS_0_MTY_V_0, LAYERED_METADATA undef" *) input [3:0]lbus_0_mty_V_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LBUS_0_MTY_V_1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LBUS_0_MTY_V_1, LAYERED_METADATA undef" *) output [3:0]lbus_0_mty_V_1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LBUS_0_SOP_V_0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LBUS_0_SOP_V_0, LAYERED_METADATA undef" *) input [0:0]lbus_0_sop_V_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LBUS_0_SOP_V_1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LBUS_0_SOP_V_1, LAYERED_METADATA undef" *) output [0:0]lbus_0_sop_V_1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LBUS_1_DATA_V_0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LBUS_1_DATA_V_0, LAYERED_METADATA undef" *) input [127:0]lbus_1_data_V_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LBUS_1_DATA_V_1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LBUS_1_DATA_V_1, LAYERED_METADATA undef" *) output [127:0]lbus_1_data_V_1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LBUS_1_ENA_V_0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LBUS_1_ENA_V_0, LAYERED_METADATA undef" *) input [0:0]lbus_1_ena_V_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LBUS_1_ENA_V_1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LBUS_1_ENA_V_1, LAYERED_METADATA undef" *) output [0:0]lbus_1_ena_V_1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LBUS_1_EOP_V_0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LBUS_1_EOP_V_0, LAYERED_METADATA undef" *) input [0:0]lbus_1_eop_V_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LBUS_1_EOP_V_1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LBUS_1_EOP_V_1, LAYERED_METADATA undef" *) output [0:0]lbus_1_eop_V_1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LBUS_1_ERR_V_0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LBUS_1_ERR_V_0, LAYERED_METADATA undef" *) input [0:0]lbus_1_err_V_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LBUS_1_ERR_V_1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LBUS_1_ERR_V_1, LAYERED_METADATA undef" *) output [0:0]lbus_1_err_V_1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LBUS_1_MTY_V_0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LBUS_1_MTY_V_0, LAYERED_METADATA undef" *) input [3:0]lbus_1_mty_V_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LBUS_1_MTY_V_1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LBUS_1_MTY_V_1, LAYERED_METADATA undef" *) output [3:0]lbus_1_mty_V_1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LBUS_1_SOP_V_0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LBUS_1_SOP_V_0, LAYERED_METADATA undef" *) input [0:0]lbus_1_sop_V_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LBUS_1_SOP_V_1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LBUS_1_SOP_V_1, LAYERED_METADATA undef" *) output [0:0]lbus_1_sop_V_1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LBUS_2_DATA_V_0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LBUS_2_DATA_V_0, LAYERED_METADATA undef" *) input [127:0]lbus_2_data_V_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LBUS_2_DATA_V_1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LBUS_2_DATA_V_1, LAYERED_METADATA undef" *) output [127:0]lbus_2_data_V_1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LBUS_2_ENA_V_0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LBUS_2_ENA_V_0, LAYERED_METADATA undef" *) input [0:0]lbus_2_ena_V_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LBUS_2_ENA_V_1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LBUS_2_ENA_V_1, LAYERED_METADATA undef" *) output [0:0]lbus_2_ena_V_1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LBUS_2_EOP_V_0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LBUS_2_EOP_V_0, LAYERED_METADATA undef" *) input [0:0]lbus_2_eop_V_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LBUS_2_EOP_V_1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LBUS_2_EOP_V_1, LAYERED_METADATA undef" *) output [0:0]lbus_2_eop_V_1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LBUS_2_ERR_V_0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LBUS_2_ERR_V_0, LAYERED_METADATA undef" *) input [0:0]lbus_2_err_V_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LBUS_2_ERR_V_1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LBUS_2_ERR_V_1, LAYERED_METADATA undef" *) output [0:0]lbus_2_err_V_1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LBUS_2_MTY_V_0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LBUS_2_MTY_V_0, LAYERED_METADATA undef" *) input [3:0]lbus_2_mty_V_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LBUS_2_MTY_V_1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LBUS_2_MTY_V_1, LAYERED_METADATA undef" *) output [3:0]lbus_2_mty_V_1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LBUS_2_SOP_V_0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LBUS_2_SOP_V_0, LAYERED_METADATA undef" *) input [0:0]lbus_2_sop_V_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LBUS_2_SOP_V_1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LBUS_2_SOP_V_1, LAYERED_METADATA undef" *) output [0:0]lbus_2_sop_V_1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LBUS_3_DATA_V_0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LBUS_3_DATA_V_0, LAYERED_METADATA undef" *) input [127:0]lbus_3_data_V_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LBUS_3_DATA_V_1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LBUS_3_DATA_V_1, LAYERED_METADATA undef" *) output [127:0]lbus_3_data_V_1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LBUS_3_ENA_V_0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LBUS_3_ENA_V_0, LAYERED_METADATA undef" *) input [0:0]lbus_3_ena_V_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LBUS_3_ENA_V_1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LBUS_3_ENA_V_1, LAYERED_METADATA undef" *) output [0:0]lbus_3_ena_V_1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LBUS_3_EOP_V_0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LBUS_3_EOP_V_0, LAYERED_METADATA undef" *) input [0:0]lbus_3_eop_V_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LBUS_3_EOP_V_1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LBUS_3_EOP_V_1, LAYERED_METADATA undef" *) output [0:0]lbus_3_eop_V_1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LBUS_3_ERR_V_0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LBUS_3_ERR_V_0, LAYERED_METADATA undef" *) input [0:0]lbus_3_err_V_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LBUS_3_ERR_V_1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LBUS_3_ERR_V_1, LAYERED_METADATA undef" *) output [0:0]lbus_3_err_V_1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LBUS_3_MTY_V_0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LBUS_3_MTY_V_0, LAYERED_METADATA undef" *) input [3:0]lbus_3_mty_V_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LBUS_3_MTY_V_1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LBUS_3_MTY_V_1, LAYERED_METADATA undef" *) output [3:0]lbus_3_mty_V_1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LBUS_3_SOP_V_0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LBUS_3_SOP_V_0, LAYERED_METADATA undef" *) input [0:0]lbus_3_sop_V_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LBUS_3_SOP_V_1 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LBUS_3_SOP_V_1, LAYERED_METADATA undef" *) output [0:0]lbus_3_sop_V_1;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.LBUS_READY_V_0 DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.LBUS_READY_V_0, LAYERED_METADATA undef" *) input [0:0]lbus_ready_V_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.M_AXIS_DATA DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.M_AXIS_DATA, LAYERED_METADATA undef" *) output [511:0]m_axis_data;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.M_AXIS_KEEP DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.M_AXIS_KEEP, LAYERED_METADATA undef" *) output [63:0]m_axis_keep;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.M_AXIS_LAST DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.M_AXIS_LAST, LAYERED_METADATA undef" *) output [0:0]m_axis_last;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.M_AXIS_VALID DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.M_AXIS_VALID, LAYERED_METADATA undef" *) output [0:0]m_axis_valid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RST, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input rst;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.S_AXIS_DATA DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.S_AXIS_DATA, LAYERED_METADATA undef" *) input [511:0]s_axis_data;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.S_AXIS_KEEP DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.S_AXIS_KEEP, LAYERED_METADATA undef" *) input [63:0]s_axis_keep;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.S_AXIS_LAST DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.S_AXIS_LAST, LAYERED_METADATA undef" *) input [0:0]s_axis_last;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.S_AXIS_VALID DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.S_AXIS_VALID, LAYERED_METADATA undef" *) input [0:0]s_axis_valid;

  wire ap_clk_0_1;
  wire ap_rst_0_1;
  wire [0:0]axis2lbus_0_axis_ready_V;
  wire [127:0]axis2lbus_0_lbus_0_data_V;
  wire [0:0]axis2lbus_0_lbus_0_ena_V;
  wire [0:0]axis2lbus_0_lbus_0_eop_V;
  wire [0:0]axis2lbus_0_lbus_0_err_V;
  wire [3:0]axis2lbus_0_lbus_0_mty_V;
  wire [0:0]axis2lbus_0_lbus_0_sop_V;
  wire [127:0]axis2lbus_0_lbus_1_data_V;
  wire [0:0]axis2lbus_0_lbus_1_ena_V;
  wire [0:0]axis2lbus_0_lbus_1_eop_V;
  wire [0:0]axis2lbus_0_lbus_1_err_V;
  wire [3:0]axis2lbus_0_lbus_1_mty_V;
  wire [0:0]axis2lbus_0_lbus_1_sop_V;
  wire [127:0]axis2lbus_0_lbus_2_data_V;
  wire [0:0]axis2lbus_0_lbus_2_ena_V;
  wire [0:0]axis2lbus_0_lbus_2_eop_V;
  wire [0:0]axis2lbus_0_lbus_2_err_V;
  wire [3:0]axis2lbus_0_lbus_2_mty_V;
  wire [0:0]axis2lbus_0_lbus_2_sop_V;
  wire [127:0]axis2lbus_0_lbus_3_data_V;
  wire [0:0]axis2lbus_0_lbus_3_ena_V;
  wire [0:0]axis2lbus_0_lbus_3_eop_V;
  wire [0:0]axis2lbus_0_lbus_3_err_V;
  wire [3:0]axis2lbus_0_lbus_3_mty_V;
  wire [0:0]axis2lbus_0_lbus_3_sop_V;
  wire [543:0]fifo_generator_0_dout;
  wire fifo_generator_0_empty;
  wire fifo_generator_0_valid;
  wire [407:0]fifo_generator_1_dout;
  wire fifo_generator_1_empty;
  wire fifo_generator_1_valid;
  wire [127:0]lbus_0_data_V_0_1;
  wire [0:0]lbus_0_ena_V_0_1;
  wire [0:0]lbus_0_eop_V_0_1;
  wire [0:0]lbus_0_err_V_0_1;
  wire [3:0]lbus_0_mty_V_0_1;
  wire [0:0]lbus_0_sop_V_0_1;
  wire [127:0]lbus_1_data_V_0_1;
  wire [0:0]lbus_1_ena_V_0_1;
  wire [0:0]lbus_1_eop_V_0_1;
  wire [0:0]lbus_1_err_V_0_1;
  wire [3:0]lbus_1_mty_V_0_1;
  wire [0:0]lbus_1_sop_V_0_1;
  wire [127:0]lbus_2_data_V_0_1;
  wire [0:0]lbus_2_ena_V_0_1;
  wire [0:0]lbus_2_eop_V_0_1;
  wire [0:0]lbus_2_err_V_0_1;
  wire [3:0]lbus_2_mty_V_0_1;
  wire [0:0]lbus_2_sop_V_0_1;
  wire [127:0]lbus_3_data_V_0_1;
  wire [0:0]lbus_3_ena_V_0_1;
  wire [0:0]lbus_3_eop_V_0_1;
  wire [0:0]lbus_3_err_V_0_1;
  wire [3:0]lbus_3_mty_V_0_1;
  wire [0:0]lbus_3_sop_V_0_1;
  wire [0:0]lbus_fifo_read_0_error_V;
  wire [0:0]lbus_fifo_read_0_lbus_fifo_pkt_end_re_V;
  wire [0:0]lbus_fifo_read_0_lbus_fifo_re_V;
  wire [511:0]lbus_fifo_read_0_m_axis_data_V;
  wire [63:0]lbus_fifo_read_0_m_axis_keep_V;
  wire [0:0]lbus_fifo_read_0_m_axis_last_V;
  wire [0:0]lbus_fifo_read_0_m_axis_valid_V;
  wire [0:0]lbus_fifo_write_0_error_V;
  wire [543:0]lbus_fifo_write_0_lbus_fifo;
  wire [407:0]lbus_fifo_write_0_lbus_fifo_pkt_end;
  wire [0:0]lbus_fifo_write_0_lbus_fifo_pkt_end_we_V;
  wire [0:0]lbus_fifo_write_0_lbus_fifo_we_V;
  wire [0:0]lbus_ready_V_0_1;
  wire [511:0]s_axis_data_V_0_1;
  wire [63:0]s_axis_keep_V_0_1;
  wire [0:0]s_axis_last_V_0_1;
  wire [0:0]s_axis_valid_V_0_1;
  wire [0:0]util_vector_logic_0_Res;

  assign ap_clk_0_1 = clk;
  assign ap_rst_0_1 = rst;
  assign axis_ready[0] = axis2lbus_0_axis_ready_V;
  assign error[0] = util_vector_logic_0_Res;
  assign lbus_0_data_V_0_1 = lbus_0_data_V_0[127:0];
  assign lbus_0_data_V_1[127:0] = axis2lbus_0_lbus_0_data_V;
  assign lbus_0_ena_V_0_1 = lbus_0_ena_V_0[0];
  assign lbus_0_ena_V_1[0] = axis2lbus_0_lbus_0_ena_V;
  assign lbus_0_eop_V_0_1 = lbus_0_eop_V_0[0];
  assign lbus_0_eop_V_1[0] = axis2lbus_0_lbus_0_eop_V;
  assign lbus_0_err_V_0_1 = lbus_0_err_V_0[0];
  assign lbus_0_err_V_1[0] = axis2lbus_0_lbus_0_err_V;
  assign lbus_0_mty_V_0_1 = lbus_0_mty_V_0[3:0];
  assign lbus_0_mty_V_1[3:0] = axis2lbus_0_lbus_0_mty_V;
  assign lbus_0_sop_V_0_1 = lbus_0_sop_V_0[0];
  assign lbus_0_sop_V_1[0] = axis2lbus_0_lbus_0_sop_V;
  assign lbus_1_data_V_0_1 = lbus_1_data_V_0[127:0];
  assign lbus_1_data_V_1[127:0] = axis2lbus_0_lbus_1_data_V;
  assign lbus_1_ena_V_0_1 = lbus_1_ena_V_0[0];
  assign lbus_1_ena_V_1[0] = axis2lbus_0_lbus_1_ena_V;
  assign lbus_1_eop_V_0_1 = lbus_1_eop_V_0[0];
  assign lbus_1_eop_V_1[0] = axis2lbus_0_lbus_1_eop_V;
  assign lbus_1_err_V_0_1 = lbus_1_err_V_0[0];
  assign lbus_1_err_V_1[0] = axis2lbus_0_lbus_1_err_V;
  assign lbus_1_mty_V_0_1 = lbus_1_mty_V_0[3:0];
  assign lbus_1_mty_V_1[3:0] = axis2lbus_0_lbus_1_mty_V;
  assign lbus_1_sop_V_0_1 = lbus_1_sop_V_0[0];
  assign lbus_1_sop_V_1[0] = axis2lbus_0_lbus_1_sop_V;
  assign lbus_2_data_V_0_1 = lbus_2_data_V_0[127:0];
  assign lbus_2_data_V_1[127:0] = axis2lbus_0_lbus_2_data_V;
  assign lbus_2_ena_V_0_1 = lbus_2_ena_V_0[0];
  assign lbus_2_ena_V_1[0] = axis2lbus_0_lbus_2_ena_V;
  assign lbus_2_eop_V_0_1 = lbus_2_eop_V_0[0];
  assign lbus_2_eop_V_1[0] = axis2lbus_0_lbus_2_eop_V;
  assign lbus_2_err_V_0_1 = lbus_2_err_V_0[0];
  assign lbus_2_err_V_1[0] = axis2lbus_0_lbus_2_err_V;
  assign lbus_2_mty_V_0_1 = lbus_2_mty_V_0[3:0];
  assign lbus_2_mty_V_1[3:0] = axis2lbus_0_lbus_2_mty_V;
  assign lbus_2_sop_V_0_1 = lbus_2_sop_V_0[0];
  assign lbus_2_sop_V_1[0] = axis2lbus_0_lbus_2_sop_V;
  assign lbus_3_data_V_0_1 = lbus_3_data_V_0[127:0];
  assign lbus_3_data_V_1[127:0] = axis2lbus_0_lbus_3_data_V;
  assign lbus_3_ena_V_0_1 = lbus_3_ena_V_0[0];
  assign lbus_3_ena_V_1[0] = axis2lbus_0_lbus_3_ena_V;
  assign lbus_3_eop_V_0_1 = lbus_3_eop_V_0[0];
  assign lbus_3_eop_V_1[0] = axis2lbus_0_lbus_3_eop_V;
  assign lbus_3_err_V_0_1 = lbus_3_err_V_0[0];
  assign lbus_3_err_V_1[0] = axis2lbus_0_lbus_3_err_V;
  assign lbus_3_mty_V_0_1 = lbus_3_mty_V_0[3:0];
  assign lbus_3_mty_V_1[3:0] = axis2lbus_0_lbus_3_mty_V;
  assign lbus_3_sop_V_0_1 = lbus_3_sop_V_0[0];
  assign lbus_3_sop_V_1[0] = axis2lbus_0_lbus_3_sop_V;
  assign lbus_ready_V_0_1 = lbus_ready_V_0[0];
  assign m_axis_data[511:0] = lbus_fifo_read_0_m_axis_data_V;
  assign m_axis_keep[63:0] = lbus_fifo_read_0_m_axis_keep_V;
  assign m_axis_last[0] = lbus_fifo_read_0_m_axis_last_V;
  assign m_axis_valid[0] = lbus_fifo_read_0_m_axis_valid_V;
  assign s_axis_data_V_0_1 = s_axis_data[511:0];
  assign s_axis_keep_V_0_1 = s_axis_keep[63:0];
  assign s_axis_last_V_0_1 = s_axis_last[0];
  assign s_axis_valid_V_0_1 = s_axis_valid[0];
  lbus_axis_converter_axis2lbus_0_0 axis2lbus_0
       (.ap_clk(ap_clk_0_1),
        .ap_rst(ap_rst_0_1),
        .axis_ready_V(axis2lbus_0_axis_ready_V),
        .lbus_0_data_V(axis2lbus_0_lbus_0_data_V),
        .lbus_0_ena_V(axis2lbus_0_lbus_0_ena_V),
        .lbus_0_eop_V(axis2lbus_0_lbus_0_eop_V),
        .lbus_0_err_V(axis2lbus_0_lbus_0_err_V),
        .lbus_0_mty_V(axis2lbus_0_lbus_0_mty_V),
        .lbus_0_sop_V(axis2lbus_0_lbus_0_sop_V),
        .lbus_1_data_V(axis2lbus_0_lbus_1_data_V),
        .lbus_1_ena_V(axis2lbus_0_lbus_1_ena_V),
        .lbus_1_eop_V(axis2lbus_0_lbus_1_eop_V),
        .lbus_1_err_V(axis2lbus_0_lbus_1_err_V),
        .lbus_1_mty_V(axis2lbus_0_lbus_1_mty_V),
        .lbus_1_sop_V(axis2lbus_0_lbus_1_sop_V),
        .lbus_2_data_V(axis2lbus_0_lbus_2_data_V),
        .lbus_2_ena_V(axis2lbus_0_lbus_2_ena_V),
        .lbus_2_eop_V(axis2lbus_0_lbus_2_eop_V),
        .lbus_2_err_V(axis2lbus_0_lbus_2_err_V),
        .lbus_2_mty_V(axis2lbus_0_lbus_2_mty_V),
        .lbus_2_sop_V(axis2lbus_0_lbus_2_sop_V),
        .lbus_3_data_V(axis2lbus_0_lbus_3_data_V),
        .lbus_3_ena_V(axis2lbus_0_lbus_3_ena_V),
        .lbus_3_eop_V(axis2lbus_0_lbus_3_eop_V),
        .lbus_3_err_V(axis2lbus_0_lbus_3_err_V),
        .lbus_3_mty_V(axis2lbus_0_lbus_3_mty_V),
        .lbus_3_sop_V(axis2lbus_0_lbus_3_sop_V),
        .lbus_ready_V(lbus_ready_V_0_1),
        .s_axis_data_V(s_axis_data_V_0_1),
        .s_axis_keep_V(s_axis_keep_V_0_1),
        .s_axis_last_V(s_axis_last_V_0_1),
        .s_axis_valid_V(s_axis_valid_V_0_1));
  lbus_axis_converter_fifo_generator_0_0 fifo_generator_0
       (.clk(ap_clk_0_1),
        .din(lbus_fifo_write_0_lbus_fifo),
        .dout(fifo_generator_0_dout),
        .empty(fifo_generator_0_empty),
        .rd_en(lbus_fifo_read_0_lbus_fifo_re_V),
        .rst(ap_rst_0_1),
        .valid(fifo_generator_0_valid),
        .wr_en(lbus_fifo_write_0_lbus_fifo_we_V));
  lbus_axis_converter_fifo_generator_1_0 fifo_generator_1
       (.clk(ap_clk_0_1),
        .din(lbus_fifo_write_0_lbus_fifo_pkt_end),
        .dout(fifo_generator_1_dout),
        .empty(fifo_generator_1_empty),
        .rd_en(lbus_fifo_read_0_lbus_fifo_pkt_end_re_V),
        .rst(ap_rst_0_1),
        .valid(fifo_generator_1_valid),
        .wr_en(lbus_fifo_write_0_lbus_fifo_pkt_end_we_V));
  lbus_axis_converter_lbus_fifo_read_0_0 lbus_fifo_read_0
       (.ap_clk(ap_clk_0_1),
        .ap_rst(ap_rst_0_1),
        .error_V(lbus_fifo_read_0_error_V),
        .lbus_fifo(fifo_generator_0_dout),
        .lbus_fifo_empty_V(fifo_generator_0_empty),
        .lbus_fifo_pkt_end(fifo_generator_1_dout),
        .lbus_fifo_pkt_end_empty_V(fifo_generator_1_empty),
        .lbus_fifo_pkt_end_re_V(lbus_fifo_read_0_lbus_fifo_pkt_end_re_V),
        .lbus_fifo_pkt_end_valid_V(fifo_generator_1_valid),
        .lbus_fifo_re_V(lbus_fifo_read_0_lbus_fifo_re_V),
        .lbus_fifo_valid_V(fifo_generator_0_valid),
        .m_axis_data_V(lbus_fifo_read_0_m_axis_data_V),
        .m_axis_keep_V(lbus_fifo_read_0_m_axis_keep_V),
        .m_axis_last_V(lbus_fifo_read_0_m_axis_last_V),
        .m_axis_valid_V(lbus_fifo_read_0_m_axis_valid_V));
  lbus_axis_converter_lbus_fifo_write_0_0 lbus_fifo_write_0
       (.ap_clk(ap_clk_0_1),
        .ap_rst(ap_rst_0_1),
        .error_V(lbus_fifo_write_0_error_V),
        .lbus_0_data_V(lbus_0_data_V_0_1),
        .lbus_0_ena_V(lbus_0_ena_V_0_1),
        .lbus_0_eop_V(lbus_0_eop_V_0_1),
        .lbus_0_err_V(lbus_0_err_V_0_1),
        .lbus_0_mty_V(lbus_0_mty_V_0_1),
        .lbus_0_sop_V(lbus_0_sop_V_0_1),
        .lbus_1_data_V(lbus_1_data_V_0_1),
        .lbus_1_ena_V(lbus_1_ena_V_0_1),
        .lbus_1_eop_V(lbus_1_eop_V_0_1),
        .lbus_1_err_V(lbus_1_err_V_0_1),
        .lbus_1_mty_V(lbus_1_mty_V_0_1),
        .lbus_1_sop_V(lbus_1_sop_V_0_1),
        .lbus_2_data_V(lbus_2_data_V_0_1),
        .lbus_2_ena_V(lbus_2_ena_V_0_1),
        .lbus_2_eop_V(lbus_2_eop_V_0_1),
        .lbus_2_err_V(lbus_2_err_V_0_1),
        .lbus_2_mty_V(lbus_2_mty_V_0_1),
        .lbus_2_sop_V(lbus_2_sop_V_0_1),
        .lbus_3_data_V(lbus_3_data_V_0_1),
        .lbus_3_ena_V(lbus_3_ena_V_0_1),
        .lbus_3_eop_V(lbus_3_eop_V_0_1),
        .lbus_3_err_V(lbus_3_err_V_0_1),
        .lbus_3_mty_V(lbus_3_mty_V_0_1),
        .lbus_3_sop_V(lbus_3_sop_V_0_1),
        .lbus_fifo(lbus_fifo_write_0_lbus_fifo),
        .lbus_fifo_pkt_end(lbus_fifo_write_0_lbus_fifo_pkt_end),
        .lbus_fifo_pkt_end_we_V(lbus_fifo_write_0_lbus_fifo_pkt_end_we_V),
        .lbus_fifo_we_V(lbus_fifo_write_0_lbus_fifo_we_V));
  lbus_axis_converter_util_vector_logic_0_0 util_vector_logic_0
       (.Op1(lbus_fifo_write_0_error_V),
        .Op2(lbus_fifo_read_0_error_V),
        .Res(util_vector_logic_0_Res));
endmodule
