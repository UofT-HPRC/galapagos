// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2019.1
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="action_generator,hls_ip_2019_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=1,HLS_INPUT_PART=xcu250-figd2104-2L-e,HLS_INPUT_CLOCK=3.103000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=0.798000,HLS_SYN_LAT=0,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=441,HLS_SYN_LUT=72,HLS_VERSION=2019_1}" *)

module action_generator (
        ap_clk,
        ap_rst,
        meta_in_src_ip_V,
        meta_in_protocol_header_V,
        meta_in_checksum_V,
        meta_in_action_V,
        payload_cksum_data_V,
        payload_cksum_valid_V,
        action_out,
        action_out_valid_V
);

parameter    ap_ST_fsm_state1 = 1'd1;

input   ap_clk;
input   ap_rst;
input  [31:0] meta_in_src_ip_V;
input  [63:0] meta_in_protocol_header_V;
input  [31:0] meta_in_checksum_V;
input  [1:0] meta_in_action_V;
input  [31:0] payload_cksum_data_V;
input  [0:0] payload_cksum_valid_V;
output  [64:0] action_out;
output  [0:0] action_out_valid_V;

reg   [31:0] action_out_reg1_src_1;
reg   [15:0] action_out_reg1_src_s;
reg   [15:0] action_out_reg1_dst_s;
reg   [0:0] ignore_flag1_V;
reg   [15:0] combined_cksum_final;
reg   [0:0] action_out_valid_reg;
reg   [31:0] combined_cksum_V;
reg   [31:0] action_out_reg_src_i;
reg   [15:0] action_out_reg_src_p;
reg   [15:0] action_out_reg_dst_p;
reg   [0:0] action_out_valid_reg_1;
reg   [0:0] ignore_flag_V;
reg   [31:0] meta_in_reg_checksum;
reg   [31:0] meta_in_reg_src_ip_V;
reg   [63:0] meta_in_reg_protocol;
reg   [1:0] meta_in_reg_action_V;
reg   [31:0] meta_in_reg0_src_ip_s;
reg   [63:0] meta_in_reg0_protoco;
reg   [31:0] meta_in_reg0_checksu;
reg   [1:0] meta_in_reg0_action_s;
(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [15:0] add_ln209_fu_224_p2;
wire   [31:0] add_ln209_1_fu_290_p2;
wire   [0:0] icmp_ln879_1_fu_358_p2;
wire   [0:0] icmp_ln879_fu_176_p2;
wire   [0:0] or_ln544_fu_182_p2;
wire   [15:0] p_Result_s_fu_210_p4;
wire   [15:0] trunc_ln357_fu_220_p1;
reg   [0:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 action_out_reg1_src_1 = 32'd0;
#0 action_out_reg1_src_s = 16'd0;
#0 action_out_reg1_dst_s = 16'd0;
#0 ignore_flag1_V = 1'd0;
#0 combined_cksum_final = 16'd0;
#0 action_out_valid_reg = 1'd0;
#0 combined_cksum_V = 32'd0;
#0 action_out_reg_src_i = 32'd0;
#0 action_out_reg_src_p = 16'd0;
#0 action_out_reg_dst_p = 16'd0;
#0 action_out_valid_reg_1 = 1'd0;
#0 ignore_flag_V = 1'd0;
#0 meta_in_reg_checksum = 32'd0;
#0 meta_in_reg_src_ip_V = 32'd0;
#0 meta_in_reg_protocol = 64'd0;
#0 meta_in_reg_action_V = 2'd0;
#0 meta_in_reg0_src_ip_s = 32'd0;
#0 meta_in_reg0_protoco = 64'd0;
#0 meta_in_reg0_checksu = 32'd0;
#0 meta_in_reg0_action_s = 2'd0;
#0 ap_CS_fsm = 1'd1;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        action_out_reg1_dst_s <= 16'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            action_out_reg1_dst_s <= action_out_reg_dst_p;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        action_out_reg1_src_1 <= 32'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            action_out_reg1_src_1 <= action_out_reg_src_i;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        action_out_reg1_src_s <= 16'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            action_out_reg1_src_s <= action_out_reg_src_p;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        action_out_reg_dst_p <= 16'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            action_out_reg_dst_p <= {{meta_in_reg_protocol[47:32]}};
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        action_out_reg_src_i <= 32'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            action_out_reg_src_i <= meta_in_reg_src_ip_V;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        action_out_reg_src_p <= 16'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            action_out_reg_src_p <= {{meta_in_reg_protocol[63:48]}};
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        action_out_valid_reg <= 1'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            action_out_valid_reg <= action_out_valid_reg_1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        action_out_valid_reg_1 <= 1'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            action_out_valid_reg_1 <= payload_cksum_valid_V;
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

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        combined_cksum_V <= 32'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            combined_cksum_V <= add_ln209_1_fu_290_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        combined_cksum_final <= 16'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            combined_cksum_final <= add_ln209_fu_224_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ignore_flag1_V <= 1'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            ignore_flag1_V <= ignore_flag_V;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ignore_flag_V <= 1'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            ignore_flag_V <= icmp_ln879_1_fu_358_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        meta_in_reg0_action_s <= 2'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            meta_in_reg0_action_s <= meta_in_action_V;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        meta_in_reg0_checksu <= 32'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            meta_in_reg0_checksu <= meta_in_checksum_V;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        meta_in_reg0_protoco <= 64'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            meta_in_reg0_protoco <= meta_in_protocol_header_V;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        meta_in_reg0_src_ip_s <= 32'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            meta_in_reg0_src_ip_s <= meta_in_src_ip_V;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        meta_in_reg_action_V <= 2'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            meta_in_reg_action_V <= meta_in_reg0_action_s;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        meta_in_reg_checksum <= 32'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            meta_in_reg_checksum <= meta_in_reg0_checksu;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        meta_in_reg_protocol <= 64'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            meta_in_reg_protocol <= meta_in_reg0_protoco;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        meta_in_reg_src_ip_V <= 32'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            meta_in_reg_src_ip_V <= meta_in_reg0_src_ip_s;
        end
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

assign action_out = {{{{or_ln544_fu_182_p2}, {action_out_reg1_dst_s}}, {action_out_reg1_src_s}}, {action_out_reg1_src_1}};

assign action_out_valid_V = action_out_valid_reg;

assign add_ln209_1_fu_290_p2 = (payload_cksum_data_V + meta_in_reg_checksum);

assign add_ln209_fu_224_p2 = (p_Result_s_fu_210_p4 + trunc_ln357_fu_220_p1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign icmp_ln879_1_fu_358_p2 = ((meta_in_reg_action_V == 2'd2) ? 1'b1 : 1'b0);

assign icmp_ln879_fu_176_p2 = ((combined_cksum_final == 16'd65535) ? 1'b1 : 1'b0);

assign or_ln544_fu_182_p2 = (ignore_flag1_V | icmp_ln879_fu_176_p2);

assign p_Result_s_fu_210_p4 = {{combined_cksum_V[31:16]}};

assign trunc_ln357_fu_220_p1 = combined_cksum_V[15:0];

endmodule //action_generator