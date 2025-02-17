`timescale 1 ps / 1 ps

module shellTop
   (
    gt_1_ref_clk_n,
    gt_1_ref_clk_p,
    init_clk_n,
    init_clk_p,
    ddr_clk_DS_clk_p, 
    ddr_clk_DS_clk_n,
    C0_DDR4_0_act_n,
    C0_DDR4_0_adr,
    C0_DDR4_0_ba,
    C0_DDR4_0_bg,
    C0_DDR4_0_ck_c,
    C0_DDR4_0_ck_t,
    C0_DDR4_0_cke,
    C0_DDR4_0_cs_n,
    C0_DDR4_0_dm_n,
    C0_DDR4_0_dq,
    C0_DDR4_0_dqs_c,
    C0_DDR4_0_dqs_t,
    C0_DDR4_0_odt,
    C0_DDR4_0_reset_n);


  input gt_1_ref_clk_n;
  input gt_1_ref_clk_p;
  input [0:0]init_clk_n;
  input [0:0]init_clk_p;
  input [0:0]ddr_clk_DS_clk_p;
  input [0:0]ddr_clk_DS_clk_n;
  output [0:0] C0_DDR4_0_act_n;
  output [16:0] C0_DDR4_0_adr;
  output [1:0] C0_DDR4_0_ba;
  output [1:0] C0_DDR4_0_bg;
  output [1:0] C0_DDR4_0_ck_c;
  output [1:0] C0_DDR4_0_ck_t;
  output [1:0] C0_DDR4_0_cke;
  output [1:0] C0_DDR4_0_cs_n;
  inout [7:0] C0_DDR4_0_dm_n;
  inout [63:0] C0_DDR4_0_dq;
  inout [7:0] C0_DDR4_0_dqs_c;
  inout [7:0] C0_DDR4_0_dqs_t;
  output [1:0] C0_DDR4_0_odt;
  output [0:0] C0_DDR4_0_reset_n;

  wire rstn;
  wire rstn300;
  wire CLK;
  wire CLK300;

  wire gt_1_ref_clk_n;
  wire gt_1_ref_clk_p;
  wire [0:0]init_clk_n;
  wire [0:0]init_clk_p;
  wire [0:0]ddr_clk_DS_clk_p;
  wire [0:0]ddr_clk_DS_clk_n;
