// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2019.1
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="axis2lbus,hls_ip_2019_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=1,HLS_INPUT_PART=xcu280-fsvh2892-2L-e,HLS_INPUT_CLOCK=3.103000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=0.618500,HLS_SYN_LAT=0,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=2,HLS_SYN_LUT=569,HLS_VERSION=2019_1}" *)

module axis2lbus (
        ap_clk,
        ap_rst,
        s_axis_data_V,
        s_axis_keep_V,
        s_axis_last_V,
        s_axis_valid_V,
        lbus_0_data_V,
        lbus_1_data_V,
        lbus_2_data_V,
        lbus_3_data_V,
        lbus_0_ena_V,
        lbus_1_ena_V,
        lbus_2_ena_V,
        lbus_3_ena_V,
        lbus_0_sop_V,
        lbus_1_sop_V,
        lbus_2_sop_V,
        lbus_3_sop_V,
        lbus_0_eop_V,
        lbus_1_eop_V,
        lbus_2_eop_V,
        lbus_3_eop_V,
        lbus_0_err_V,
        lbus_1_err_V,
        lbus_2_err_V,
        lbus_3_err_V,
        lbus_0_mty_V,
        lbus_1_mty_V,
        lbus_2_mty_V,
        lbus_3_mty_V,
        lbus_ready_V,
        axis_ready_V
);

parameter    ap_ST_fsm_state1 = 1'd1;

input   ap_clk;
input   ap_rst;
input  [511:0] s_axis_data_V;
input  [63:0] s_axis_keep_V;
input  [0:0] s_axis_last_V;
input  [0:0] s_axis_valid_V;
output  [127:0] lbus_0_data_V;
output  [127:0] lbus_1_data_V;
output  [127:0] lbus_2_data_V;
output  [127:0] lbus_3_data_V;
output  [0:0] lbus_0_ena_V;
output  [0:0] lbus_1_ena_V;
output  [0:0] lbus_2_ena_V;
output  [0:0] lbus_3_ena_V;
output  [0:0] lbus_0_sop_V;
output  [0:0] lbus_1_sop_V;
output  [0:0] lbus_2_sop_V;
output  [0:0] lbus_3_sop_V;
output  [0:0] lbus_0_eop_V;
output  [0:0] lbus_1_eop_V;
output  [0:0] lbus_2_eop_V;
output  [0:0] lbus_3_eop_V;
output  [0:0] lbus_0_err_V;
output  [0:0] lbus_1_err_V;
output  [0:0] lbus_2_err_V;
output  [0:0] lbus_3_err_V;
output  [3:0] lbus_0_mty_V;
output  [3:0] lbus_1_mty_V;
output  [3:0] lbus_2_mty_V;
output  [3:0] lbus_3_mty_V;
input  [0:0] lbus_ready_V;
output  [0:0] axis_ready_V;

reg[127:0] lbus_0_data_V;
reg[127:0] lbus_1_data_V;
reg[127:0] lbus_2_data_V;
reg[127:0] lbus_3_data_V;
reg[0:0] lbus_0_ena_V;
reg[0:0] lbus_1_ena_V;
reg[0:0] lbus_2_ena_V;
reg[0:0] lbus_3_ena_V;
reg[0:0] lbus_0_sop_V;
reg[0:0] lbus_0_eop_V;
reg[0:0] lbus_1_eop_V;
reg[0:0] lbus_2_eop_V;
reg[0:0] lbus_3_eop_V;
reg[3:0] lbus_0_mty_V;
reg[3:0] lbus_1_mty_V;
reg[3:0] lbus_2_mty_V;
reg[3:0] lbus_3_mty_V;

reg   [0:0] IN_PACKET_V;
(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [0:0] lbus_ready_V_read_read_fu_192_p2;
wire   [0:0] ret_V_9_fu_687_p2;
wire   [0:0] ret_V_10_fu_583_p2;
wire   [0:0] ret_V_4_fu_576_p2;
wire   [0:0] ret_V_fu_595_p2;
wire   [15:0] p_Result_4_fu_647_p4;
wire   [0:0] ret_V_1_fu_529_p2;
wire   [0:0] ret_V_6_fu_614_p2;
wire   [15:0] p_Result_5_fu_657_p4;
wire   [0:0] ret_V_2_fu_544_p2;
wire   [0:0] ret_V_7_fu_633_p2;
wire   [15:0] p_Result_6_fu_667_p4;
wire   [127:0] trunc_ln647_fu_516_p1;
wire   [0:0] ret_V_3_fu_559_p2;
wire   [0:0] ret_V_8_fu_640_p2;
wire   [15:0] trunc_ln647_1_fu_677_p1;
wire   [0:0] tmp_fu_521_p3;
wire   [0:0] tmp_1_fu_536_p3;
wire   [0:0] tmp_2_fu_551_p3;
wire   [0:0] rhs_V_fu_570_p2;
wire   [0:0] xor_ln1355_fu_589_p2;
wire   [0:0] xor_ln1355_1_fu_602_p2;
wire   [0:0] and_ln1355_fu_608_p2;
wire   [0:0] xor_ln1355_2_fu_621_p2;
wire   [0:0] and_ln1355_2_fu_627_p2;
wire   [0:0] r_V_fu_681_p2;
reg   [0:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 IN_PACKET_V = 1'd0;
#0 ap_CS_fsm = 1'd1;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        IN_PACKET_V <= 1'd0;
    end else begin
        if (((lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
            if ((ret_V_9_fu_687_p2 == 1'd1)) begin
                IN_PACKET_V <= 1'd1;
            end else if (((ret_V_10_fu_583_p2 == 1'd1) & (ret_V_9_fu_687_p2 == 1'd0))) begin
                IN_PACKET_V <= 1'd0;
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        if ((lbus_ready_V_read_read_fu_192_p2 == 1'd1)) begin
            lbus_0_data_V = {{s_axis_data_V[511:384]}};
        end else if ((lbus_ready_V_read_read_fu_192_p2 == 1'd0)) begin
            lbus_0_data_V = 128'd0;
        end else begin
            lbus_0_data_V = 'bx;
        end
    end else begin
        lbus_0_data_V = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        if ((lbus_ready_V_read_read_fu_192_p2 == 1'd1)) begin
            lbus_0_ena_V = s_axis_valid_V;
        end else if ((lbus_ready_V_read_read_fu_192_p2 == 1'd0)) begin
            lbus_0_ena_V = 1'd0;
        end else begin
            lbus_0_ena_V = 'bx;
        end
    end else begin
        lbus_0_ena_V = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        if ((lbus_ready_V_read_read_fu_192_p2 == 1'd1)) begin
            lbus_0_eop_V = ret_V_fu_595_p2;
        end else if ((lbus_ready_V_read_read_fu_192_p2 == 1'd0)) begin
            lbus_0_eop_V = 1'd0;
        end else begin
            lbus_0_eop_V = 'bx;
        end
    end else begin
        lbus_0_eop_V = 'bx;
    end
end

always @ (*) begin
    if (((p_Result_4_fu_647_p4 == 16'd65534) & (lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        lbus_0_mty_V = 4'd1;
    end else if (((p_Result_4_fu_647_p4 == 16'd65532) & (lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        lbus_0_mty_V = 4'd2;
    end else if (((p_Result_4_fu_647_p4 == 16'd65528) & (lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        lbus_0_mty_V = 4'd3;
    end else if (((p_Result_4_fu_647_p4 == 16'd65520) & (lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        lbus_0_mty_V = 4'd4;
    end else if (((p_Result_4_fu_647_p4 == 16'd65504) & (lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        lbus_0_mty_V = 4'd5;
    end else if (((p_Result_4_fu_647_p4 == 16'd65472) & (lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        lbus_0_mty_V = 4'd6;
    end else if (((p_Result_4_fu_647_p4 == 16'd65408) & (lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        lbus_0_mty_V = 4'd7;
    end else if (((p_Result_4_fu_647_p4 == 16'd65280) & (lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        lbus_0_mty_V = 4'd8;
    end else if (((p_Result_4_fu_647_p4 == 16'd65024) & (lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        lbus_0_mty_V = 4'd9;
    end else if (((p_Result_4_fu_647_p4 == 16'd64512) & (lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        lbus_0_mty_V = 4'd10;
    end else if (((p_Result_4_fu_647_p4 == 16'd63488) & (lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        lbus_0_mty_V = 4'd11;
    end else if (((p_Result_4_fu_647_p4 == 16'd61440) & (lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        lbus_0_mty_V = 4'd12;
    end else if (((p_Result_4_fu_647_p4 == 16'd57344) & (lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        lbus_0_mty_V = 4'd13;
    end else if (((p_Result_4_fu_647_p4 == 16'd49152) & (lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        lbus_0_mty_V = 4'd14;
    end else if (((p_Result_4_fu_647_p4 == 16'd32768) & (lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        lbus_0_mty_V = 4'd15;
    end else if ((((lbus_ready_V_read_read_fu_192_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1)) | ((p_Result_4_fu_647_p4 == 16'd65535) & (lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1)))) begin
        lbus_0_mty_V = 4'd0;
    end else begin
        lbus_0_mty_V = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        if ((lbus_ready_V_read_read_fu_192_p2 == 1'd1)) begin
            lbus_0_sop_V = ret_V_4_fu_576_p2;
        end else if ((lbus_ready_V_read_read_fu_192_p2 == 1'd0)) begin
            lbus_0_sop_V = 1'd0;
        end else begin
            lbus_0_sop_V = 'bx;
        end
    end else begin
        lbus_0_sop_V = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        if ((lbus_ready_V_read_read_fu_192_p2 == 1'd1)) begin
            lbus_1_data_V = {{s_axis_data_V[383:256]}};
        end else if ((lbus_ready_V_read_read_fu_192_p2 == 1'd0)) begin
            lbus_1_data_V = 128'd0;
        end else begin
            lbus_1_data_V = 'bx;
        end
    end else begin
        lbus_1_data_V = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        if ((lbus_ready_V_read_read_fu_192_p2 == 1'd1)) begin
            lbus_1_ena_V = ret_V_1_fu_529_p2;
        end else if ((lbus_ready_V_read_read_fu_192_p2 == 1'd0)) begin
            lbus_1_ena_V = 1'd0;
        end else begin
            lbus_1_ena_V = 'bx;
        end
    end else begin
        lbus_1_ena_V = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        if ((lbus_ready_V_read_read_fu_192_p2 == 1'd1)) begin
            lbus_1_eop_V = ret_V_6_fu_614_p2;
        end else if ((lbus_ready_V_read_read_fu_192_p2 == 1'd0)) begin
            lbus_1_eop_V = 1'd0;
        end else begin
            lbus_1_eop_V = 'bx;
        end
    end else begin
        lbus_1_eop_V = 'bx;
    end
end

always @ (*) begin
    if (((lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (p_Result_5_fu_657_p4 == 16'd65534))) begin
        lbus_1_mty_V = 4'd1;
    end else if (((lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (p_Result_5_fu_657_p4 == 16'd65532))) begin
        lbus_1_mty_V = 4'd2;
    end else if (((lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (p_Result_5_fu_657_p4 == 16'd65528))) begin
        lbus_1_mty_V = 4'd3;
    end else if (((lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (p_Result_5_fu_657_p4 == 16'd65520))) begin
        lbus_1_mty_V = 4'd4;
    end else if (((lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (p_Result_5_fu_657_p4 == 16'd65504))) begin
        lbus_1_mty_V = 4'd5;
    end else if (((lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (p_Result_5_fu_657_p4 == 16'd65472))) begin
        lbus_1_mty_V = 4'd6;
    end else if (((lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (p_Result_5_fu_657_p4 == 16'd65408))) begin
        lbus_1_mty_V = 4'd7;
    end else if (((lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (p_Result_5_fu_657_p4 == 16'd65280))) begin
        lbus_1_mty_V = 4'd8;
    end else if (((lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (p_Result_5_fu_657_p4 == 16'd65024))) begin
        lbus_1_mty_V = 4'd9;
    end else if (((lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (p_Result_5_fu_657_p4 == 16'd64512))) begin
        lbus_1_mty_V = 4'd10;
    end else if (((p_Result_5_fu_657_p4 == 16'd63488) & (lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        lbus_1_mty_V = 4'd11;
    end else if (((p_Result_5_fu_657_p4 == 16'd61440) & (lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        lbus_1_mty_V = 4'd12;
    end else if (((p_Result_5_fu_657_p4 == 16'd57344) & (lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        lbus_1_mty_V = 4'd13;
    end else if (((p_Result_5_fu_657_p4 == 16'd49152) & (lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        lbus_1_mty_V = 4'd14;
    end else if (((p_Result_5_fu_657_p4 == 16'd32768) & (lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        lbus_1_mty_V = 4'd15;
    end else if ((((lbus_ready_V_read_read_fu_192_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1)) | ((lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (p_Result_5_fu_657_p4 == 16'd65535)))) begin
        lbus_1_mty_V = 4'd0;
    end else begin
        lbus_1_mty_V = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        if ((lbus_ready_V_read_read_fu_192_p2 == 1'd1)) begin
            lbus_2_data_V = {{s_axis_data_V[255:128]}};
        end else if ((lbus_ready_V_read_read_fu_192_p2 == 1'd0)) begin
            lbus_2_data_V = 128'd0;
        end else begin
            lbus_2_data_V = 'bx;
        end
    end else begin
        lbus_2_data_V = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        if ((lbus_ready_V_read_read_fu_192_p2 == 1'd1)) begin
            lbus_2_ena_V = ret_V_2_fu_544_p2;
        end else if ((lbus_ready_V_read_read_fu_192_p2 == 1'd0)) begin
            lbus_2_ena_V = 1'd0;
        end else begin
            lbus_2_ena_V = 'bx;
        end
    end else begin
        lbus_2_ena_V = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        if ((lbus_ready_V_read_read_fu_192_p2 == 1'd1)) begin
            lbus_2_eop_V = ret_V_7_fu_633_p2;
        end else if ((lbus_ready_V_read_read_fu_192_p2 == 1'd0)) begin
            lbus_2_eop_V = 1'd0;
        end else begin
            lbus_2_eop_V = 'bx;
        end
    end else begin
        lbus_2_eop_V = 'bx;
    end
end

always @ (*) begin
    if (((lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (p_Result_6_fu_667_p4 == 16'd65534))) begin
        lbus_2_mty_V = 4'd1;
    end else if (((lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (p_Result_6_fu_667_p4 == 16'd65532))) begin
        lbus_2_mty_V = 4'd2;
    end else if (((lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (p_Result_6_fu_667_p4 == 16'd65528))) begin
        lbus_2_mty_V = 4'd3;
    end else if (((lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (p_Result_6_fu_667_p4 == 16'd65520))) begin
        lbus_2_mty_V = 4'd4;
    end else if (((lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (p_Result_6_fu_667_p4 == 16'd65504))) begin
        lbus_2_mty_V = 4'd5;
    end else if (((lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (p_Result_6_fu_667_p4 == 16'd65472))) begin
        lbus_2_mty_V = 4'd6;
    end else if (((lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (p_Result_6_fu_667_p4 == 16'd65408))) begin
        lbus_2_mty_V = 4'd7;
    end else if (((lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (p_Result_6_fu_667_p4 == 16'd65280))) begin
        lbus_2_mty_V = 4'd8;
    end else if (((lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (p_Result_6_fu_667_p4 == 16'd65024))) begin
        lbus_2_mty_V = 4'd9;
    end else if (((lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (p_Result_6_fu_667_p4 == 16'd64512))) begin
        lbus_2_mty_V = 4'd10;
    end else if (((p_Result_6_fu_667_p4 == 16'd63488) & (lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        lbus_2_mty_V = 4'd11;
    end else if (((p_Result_6_fu_667_p4 == 16'd61440) & (lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        lbus_2_mty_V = 4'd12;
    end else if (((p_Result_6_fu_667_p4 == 16'd57344) & (lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        lbus_2_mty_V = 4'd13;
    end else if (((p_Result_6_fu_667_p4 == 16'd49152) & (lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        lbus_2_mty_V = 4'd14;
    end else if (((p_Result_6_fu_667_p4 == 16'd32768) & (lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        lbus_2_mty_V = 4'd15;
    end else if ((((lbus_ready_V_read_read_fu_192_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1)) | ((lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (p_Result_6_fu_667_p4 == 16'd65535)))) begin
        lbus_2_mty_V = 4'd0;
    end else begin
        lbus_2_mty_V = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        if ((lbus_ready_V_read_read_fu_192_p2 == 1'd1)) begin
            lbus_3_data_V = trunc_ln647_fu_516_p1;
        end else if ((lbus_ready_V_read_read_fu_192_p2 == 1'd0)) begin
            lbus_3_data_V = 128'd0;
        end else begin
            lbus_3_data_V = 'bx;
        end
    end else begin
        lbus_3_data_V = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        if ((lbus_ready_V_read_read_fu_192_p2 == 1'd1)) begin
            lbus_3_ena_V = ret_V_3_fu_559_p2;
        end else if ((lbus_ready_V_read_read_fu_192_p2 == 1'd0)) begin
            lbus_3_ena_V = 1'd0;
        end else begin
            lbus_3_ena_V = 'bx;
        end
    end else begin
        lbus_3_ena_V = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        if ((lbus_ready_V_read_read_fu_192_p2 == 1'd1)) begin
            lbus_3_eop_V = ret_V_8_fu_640_p2;
        end else if ((lbus_ready_V_read_read_fu_192_p2 == 1'd0)) begin
            lbus_3_eop_V = 1'd0;
        end else begin
            lbus_3_eop_V = 'bx;
        end
    end else begin
        lbus_3_eop_V = 'bx;
    end
end

always @ (*) begin
    if (((lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (trunc_ln647_1_fu_677_p1 == 16'd65534))) begin
        lbus_3_mty_V = 4'd1;
    end else if (((lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (trunc_ln647_1_fu_677_p1 == 16'd65532))) begin
        lbus_3_mty_V = 4'd2;
    end else if (((lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (trunc_ln647_1_fu_677_p1 == 16'd65528))) begin
        lbus_3_mty_V = 4'd3;
    end else if (((lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (trunc_ln647_1_fu_677_p1 == 16'd65520))) begin
        lbus_3_mty_V = 4'd4;
    end else if (((lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (trunc_ln647_1_fu_677_p1 == 16'd65504))) begin
        lbus_3_mty_V = 4'd5;
    end else if (((lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (trunc_ln647_1_fu_677_p1 == 16'd65472))) begin
        lbus_3_mty_V = 4'd6;
    end else if (((lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (trunc_ln647_1_fu_677_p1 == 16'd65408))) begin
        lbus_3_mty_V = 4'd7;
    end else if (((lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (trunc_ln647_1_fu_677_p1 == 16'd65280))) begin
        lbus_3_mty_V = 4'd8;
    end else if (((lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (trunc_ln647_1_fu_677_p1 == 16'd65024))) begin
        lbus_3_mty_V = 4'd9;
    end else if (((lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (trunc_ln647_1_fu_677_p1 == 16'd64512))) begin
        lbus_3_mty_V = 4'd10;
    end else if (((trunc_ln647_1_fu_677_p1 == 16'd63488) & (lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        lbus_3_mty_V = 4'd11;
    end else if (((trunc_ln647_1_fu_677_p1 == 16'd61440) & (lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        lbus_3_mty_V = 4'd12;
    end else if (((trunc_ln647_1_fu_677_p1 == 16'd57344) & (lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        lbus_3_mty_V = 4'd13;
    end else if (((trunc_ln647_1_fu_677_p1 == 16'd49152) & (lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        lbus_3_mty_V = 4'd14;
    end else if (((trunc_ln647_1_fu_677_p1 == 16'd32768) & (lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        lbus_3_mty_V = 4'd15;
    end else if ((((lbus_ready_V_read_read_fu_192_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1)) | ((lbus_ready_V_read_read_fu_192_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (trunc_ln647_1_fu_677_p1 == 16'd65535)))) begin
        lbus_3_mty_V = 4'd0;
    end else begin
        lbus_3_mty_V = 'bx;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign and_ln1355_2_fu_627_p2 = (xor_ln1355_2_fu_621_p2 & tmp_1_fu_536_p3);

assign and_ln1355_fu_608_p2 = (xor_ln1355_1_fu_602_p2 & tmp_fu_521_p3);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign axis_ready_V = lbus_ready_V;

assign lbus_0_err_V = 1'd0;

assign lbus_1_err_V = 1'd0;

assign lbus_1_sop_V = 1'd0;

assign lbus_2_err_V = 1'd0;

assign lbus_2_sop_V = 1'd0;

assign lbus_3_err_V = 1'd0;

assign lbus_3_sop_V = 1'd0;

assign lbus_ready_V_read_read_fu_192_p2 = lbus_ready_V;

assign p_Result_4_fu_647_p4 = {{s_axis_keep_V[63:48]}};

assign p_Result_5_fu_657_p4 = {{s_axis_keep_V[47:32]}};

assign p_Result_6_fu_667_p4 = {{s_axis_keep_V[31:16]}};

assign r_V_fu_681_p2 = (s_axis_last_V ^ 1'd1);

assign ret_V_10_fu_583_p2 = (s_axis_valid_V & s_axis_last_V);

assign ret_V_1_fu_529_p2 = (tmp_fu_521_p3 & s_axis_valid_V);

assign ret_V_2_fu_544_p2 = (tmp_1_fu_536_p3 & s_axis_valid_V);

assign ret_V_3_fu_559_p2 = (tmp_2_fu_551_p3 & s_axis_valid_V);

assign ret_V_4_fu_576_p2 = (s_axis_valid_V & rhs_V_fu_570_p2);

assign ret_V_6_fu_614_p2 = (ret_V_10_fu_583_p2 & and_ln1355_fu_608_p2);

assign ret_V_7_fu_633_p2 = (ret_V_10_fu_583_p2 & and_ln1355_2_fu_627_p2);

assign ret_V_8_fu_640_p2 = (tmp_2_fu_551_p3 & ret_V_10_fu_583_p2);

assign ret_V_9_fu_687_p2 = (s_axis_valid_V & r_V_fu_681_p2);

assign ret_V_fu_595_p2 = (xor_ln1355_fu_589_p2 & ret_V_10_fu_583_p2);

assign rhs_V_fu_570_p2 = (1'd1 ^ IN_PACKET_V);

assign tmp_1_fu_536_p3 = s_axis_keep_V[32'd31];

assign tmp_2_fu_551_p3 = s_axis_keep_V[32'd15];

assign tmp_fu_521_p3 = s_axis_keep_V[32'd47];

assign trunc_ln647_1_fu_677_p1 = s_axis_keep_V[15:0];

assign trunc_ln647_fu_516_p1 = s_axis_data_V[127:0];

assign xor_ln1355_1_fu_602_p2 = (tmp_1_fu_536_p3 ^ 1'd1);

assign xor_ln1355_2_fu_621_p2 = (tmp_2_fu_551_p3 ^ 1'd1);

assign xor_ln1355_fu_589_p2 = (tmp_fu_521_p3 ^ 1'd1);

endmodule //axis2lbus