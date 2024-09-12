`timescale 1 ps / 1 ps

module shellTop
   (
    gt_1_ref_clk_n,
    gt_1_ref_clk_p,
    init_clk_n,
    init_clk_p,
    qsfp1_4x_grx_n,
    qsfp1_4x_grx_p,
    qsfp1_4x_gtx_n,
    qsfp1_4x_gtx_p
    );


  input gt_1_ref_clk_n;
  input gt_1_ref_clk_p;
  input [0:0]init_clk_n;
  input [0:0]init_clk_p;
  
  input [3:0]qsfp1_4x_grx_n;
  input [3:0]qsfp1_4x_grx_p;
  output [3:0]qsfp1_4x_gtx_n;
  output [3:0]qsfp1_4x_gtx_p;

  wire rstn;
  wire rstn300;
  wire CLK;
  wire CLK300;

  wire gt_1_ref_clk_n;
  wire gt_1_ref_clk_p;
  wire [0:0]init_clk_n;
  wire [0:0]init_clk_p;
  
  wire [3:0]qsfp1_4x_grx_n;
  wire [3:0]qsfp1_4x_grx_p;
  wire [3:0]qsfp1_4x_gtx_n;
  wire [3:0]qsfp1_4x_gtx_p;

