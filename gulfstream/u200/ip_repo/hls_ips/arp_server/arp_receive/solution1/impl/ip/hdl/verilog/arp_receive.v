// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2019.1
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="arp_receive,hls_ip_2019_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=1,HLS_INPUT_PART=xcu200-fsgd2104-2-e,HLS_INPUT_CLOCK=3.103000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=1.846850,HLS_SYN_LAT=0,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=557,HLS_SYN_LUT=276,HLS_VERSION=2019_1}" *)

module arp_receive (
        ap_clk,
        ap_rst,
        myIP_V,
        arp_in_data_V,
        arp_in_valid_V,
        arp_internal_resp_Mac_IP_V,
        arp_internal_resp_valid_V,
        call_for_responce_Mac_IP_V,
        call_for_responce_valid_V,
        arptable_dataout_Mac_IP_V,
        arptable_dataout_valid_V,
        arptable_addrout_V
);

parameter    ap_ST_fsm_state1 = 1'd1;

input   ap_clk;
input   ap_rst;
input  [31:0] myIP_V;
input  [335:0] arp_in_data_V;
input  [0:0] arp_in_valid_V;
input  [79:0] arp_internal_resp_Mac_IP_V;
input  [0:0] arp_internal_resp_valid_V;
output  [79:0] call_for_responce_Mac_IP_V;
output  [0:0] call_for_responce_valid_V;
output  [79:0] arptable_dataout_Mac_IP_V;
output  [0:0] arptable_dataout_valid_V;
output  [7:0] arptable_addrout_V;

reg   [79:0] call_for_responce_re_1;
reg   [0:0] call_for_responce_re;
reg   [79:0] arptable_dataout_reg_1;
reg   [0:0] arptable_dataout_reg;
reg   [7:0] arptable_addrout_reg;
reg   [0:0] arp_in_reg_valid_V;
reg   [47:0] arp_in_reg_fixed_hea;
reg   [31:0] arp_in_reg_dst_ip_V;
reg   [31:0] myIPReg_V;
reg   [15:0] arp_in_reg_opcode_V;
reg   [47:0] arp_in_reg_dst_mac_V;
reg   [31:0] arp_in_reg_src_ip_V;
reg   [0:0] arp_internal_resp_va;
reg   [47:0] arp_in_reg_src_mac_V;
reg   [47:0] eth_src_mac_V;
reg   [79:0] arp_internal_resp_re;
reg   [0:0] ap_phi_mux_lhs_V_phi_fu_194_p8;
(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [0:0] arp_in_reg_valid_V_l_load_fu_238_p1;
wire   [0:0] icmp_ln879_fu_272_p2;
wire   [0:0] icmp_ln879_1_fu_278_p2;
wire   [0:0] and_ln72_1_fu_302_p2;
wire   [79:0] p_Result_s_fu_425_p3;
wire   [0:0] icmp_ln879_5_fu_355_p2;
wire   [0:0] icmp_ln879_6_fu_361_p2;
wire   [0:0] icmp_ln879_2_fu_266_p2;
wire   [0:0] rhs_V_load_fu_315_p1;
wire   [79:0] p_Result_2_fu_397_p3;
wire   [0:0] and_ln79_1_fu_391_p2;
wire   [0:0] icmp_ln879_7_fu_367_p2;
wire   [79:0] p_Result_1_fu_439_p3;
wire   [0:0] ret_V_fu_319_p2;
wire   [7:0] trunc_ln647_fu_345_p1;
wire   [7:0] trunc_ln647_2_fu_411_p1;
wire   [7:0] trunc_ln647_1_fu_453_p1;
wire   [31:0] trunc_ln647_3_fu_577_p1;
wire   [0:0] arp_internal_resp_va_read_fu_126_p2;
wire   [0:0] icmp_ln879_4_fu_290_p2;
wire   [0:0] and_ln72_fu_296_p2;
wire   [0:0] icmp_ln879_3_fu_284_p2;
wire   [0:0] icmp_ln879_9_fu_379_p2;
wire   [0:0] and_ln79_fu_385_p2;
wire   [0:0] icmp_ln879_8_fu_373_p2;
reg   [0:0] ap_NS_fsm;
reg    ap_condition_103;
reg    ap_condition_77;

// power-on initialization
initial begin
#0 call_for_responce_re_1 = 80'd0;
#0 call_for_responce_re = 1'd0;
#0 arptable_dataout_reg_1 = 80'd0;
#0 arptable_dataout_reg = 1'd0;
#0 arptable_addrout_reg = 8'd0;
#0 arp_in_reg_valid_V = 1'd0;
#0 arp_in_reg_fixed_hea = 48'd0;
#0 arp_in_reg_dst_ip_V = 32'd0;
#0 myIPReg_V = 32'd0;
#0 arp_in_reg_opcode_V = 16'd0;
#0 arp_in_reg_dst_mac_V = 48'd0;
#0 arp_in_reg_src_ip_V = 32'd0;
#0 arp_internal_resp_va = 1'd0;
#0 arp_in_reg_src_mac_V = 48'd0;
#0 eth_src_mac_V = 48'd0;
#0 arp_internal_resp_re = 80'd0;
#0 ap_CS_fsm = 1'd1;
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
        arp_in_reg_dst_ip_V <= 32'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            arp_in_reg_dst_ip_V <= trunc_ln647_3_fu_577_p1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        arp_in_reg_dst_mac_V <= 48'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            arp_in_reg_dst_mac_V <= {{arp_in_data_V[79:32]}};
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        arp_in_reg_fixed_hea <= 48'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            arp_in_reg_fixed_hea <= {{arp_in_data_V[223:176]}};
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        arp_in_reg_opcode_V <= 16'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            arp_in_reg_opcode_V <= {{arp_in_data_V[175:160]}};
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        arp_in_reg_src_ip_V <= 32'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            arp_in_reg_src_ip_V <= {{arp_in_data_V[111:80]}};
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        arp_in_reg_src_mac_V <= 48'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            arp_in_reg_src_mac_V <= {{arp_in_data_V[159:112]}};
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        arp_in_reg_valid_V <= 1'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            arp_in_reg_valid_V <= arp_in_valid_V;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        arp_internal_resp_re <= 80'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            arp_internal_resp_re <= arp_internal_resp_Mac_IP_V;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        arp_internal_resp_va <= 1'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            if ((arp_internal_resp_va_read_fu_126_p2 == 1'd1)) begin
                arp_internal_resp_va <= 1'd1;
            end else if (((arp_in_reg_valid_V_l_load_fu_238_p1 == 1'd0) & (arp_internal_resp_va_read_fu_126_p2 == 1'd0))) begin
                arp_internal_resp_va <= 1'd0;
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        arptable_addrout_reg <= 8'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            if ((1'b1 == ap_condition_77)) begin
                arptable_addrout_reg <= trunc_ln647_1_fu_453_p1;
            end else if ((1'b1 == ap_condition_103)) begin
                arptable_addrout_reg <= trunc_ln647_2_fu_411_p1;
            end else if (((rhs_V_load_fu_315_p1 == 1'd1) & (arp_in_reg_valid_V_l_load_fu_238_p1 == 1'd0))) begin
                arptable_addrout_reg <= trunc_ln647_fu_345_p1;
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        arptable_dataout_reg <= 1'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            arptable_dataout_reg <= ret_V_fu_319_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        arptable_dataout_reg_1 <= 80'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            if ((1'b1 == ap_condition_77)) begin
                arptable_dataout_reg_1 <= p_Result_1_fu_439_p3;
            end else if ((1'b1 == ap_condition_103)) begin
                arptable_dataout_reg_1 <= p_Result_2_fu_397_p3;
            end else if (((rhs_V_load_fu_315_p1 == 1'd1) & (arp_in_reg_valid_V_l_load_fu_238_p1 == 1'd0))) begin
                arptable_dataout_reg_1 <= arp_internal_resp_re;
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        call_for_responce_re <= 1'd0;
    end else begin
        if (((icmp_ln879_1_fu_278_p2 == 1'd1) & (icmp_ln879_fu_272_p2 == 1'd1) & (arp_in_reg_valid_V_l_load_fu_238_p1 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
            call_for_responce_re <= icmp_ln879_2_fu_266_p2;
        end else if ((((arp_in_reg_valid_V_l_load_fu_238_p1 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (icmp_ln879_fu_272_p2 == 1'd0)) | ((icmp_ln879_fu_272_p2 == 1'd1) & (arp_in_reg_valid_V_l_load_fu_238_p1 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (icmp_ln879_1_fu_278_p2 == 1'd0)) | ((1'b1 == ap_CS_fsm_state1) & (arp_in_reg_valid_V_l_load_fu_238_p1 == 1'd0)))) begin
            call_for_responce_re <= 1'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        call_for_responce_re_1 <= 80'd0;
    end else begin
        if (((icmp_ln879_2_fu_266_p2 == 1'd1) & (icmp_ln879_6_fu_361_p2 == 1'd1) & (icmp_ln879_5_fu_355_p2 == 1'd1) & (arp_in_reg_valid_V_l_load_fu_238_p1 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
            call_for_responce_re_1 <= p_Result_s_fu_425_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        eth_src_mac_V <= 48'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            eth_src_mac_V <= {{arp_in_data_V[287:240]}};
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        myIPReg_V <= 32'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            myIPReg_V <= myIP_V;
        end
    end
end

always @ (*) begin
    if (((icmp_ln879_fu_272_p2 == 1'd1) & (arp_in_reg_valid_V_l_load_fu_238_p1 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (icmp_ln879_1_fu_278_p2 == 1'd0))) begin
        ap_phi_mux_lhs_V_phi_fu_194_p8 = and_ln72_1_fu_302_p2;
    end else if (((icmp_ln879_1_fu_278_p2 == 1'd1) & (icmp_ln879_fu_272_p2 == 1'd1) & (arp_in_reg_valid_V_l_load_fu_238_p1 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_phi_mux_lhs_V_phi_fu_194_p8 = 1'd1;
    end else if ((((arp_in_reg_valid_V_l_load_fu_238_p1 == 1'd1) & (1'b1 == ap_CS_fsm_state1) & (icmp_ln879_fu_272_p2 == 1'd0)) | ((1'b1 == ap_CS_fsm_state1) & (arp_in_reg_valid_V_l_load_fu_238_p1 == 1'd0)))) begin
        ap_phi_mux_lhs_V_phi_fu_194_p8 = 1'd0;
    end else begin
        ap_phi_mux_lhs_V_phi_fu_194_p8 = 'bx;
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

assign and_ln72_1_fu_302_p2 = (icmp_ln879_3_fu_284_p2 & and_ln72_fu_296_p2);

assign and_ln72_fu_296_p2 = (icmp_ln879_4_fu_290_p2 & icmp_ln879_2_fu_266_p2);

assign and_ln79_1_fu_391_p2 = (icmp_ln879_8_fu_373_p2 & and_ln79_fu_385_p2);

assign and_ln79_fu_385_p2 = (icmp_ln879_9_fu_379_p2 & icmp_ln879_2_fu_266_p2);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

always @ (*) begin
    ap_condition_103 = ((((1'd1 == and_ln79_1_fu_391_p2) & (icmp_ln879_5_fu_355_p2 == 1'd1) & (arp_in_reg_valid_V_l_load_fu_238_p1 == 1'd1) & (icmp_ln879_2_fu_266_p2 == 1'd0)) | ((icmp_ln879_7_fu_367_p2 == 1'd1) & (icmp_ln879_6_fu_361_p2 == 1'd1) & (icmp_ln879_5_fu_355_p2 == 1'd1) & (arp_in_reg_valid_V_l_load_fu_238_p1 == 1'd1) & (icmp_ln879_2_fu_266_p2 == 1'd0))) | ((1'd1 == and_ln79_1_fu_391_p2) & (icmp_ln879_5_fu_355_p2 == 1'd1) & (arp_in_reg_valid_V_l_load_fu_238_p1 == 1'd1) & (icmp_ln879_6_fu_361_p2 == 1'd0)));
end

always @ (*) begin
    ap_condition_77 = ((icmp_ln879_2_fu_266_p2 == 1'd1) & (icmp_ln879_6_fu_361_p2 == 1'd1) & (icmp_ln879_5_fu_355_p2 == 1'd1) & (arp_in_reg_valid_V_l_load_fu_238_p1 == 1'd1));
end

assign arp_in_reg_valid_V_l_load_fu_238_p1 = arp_in_reg_valid_V;

assign arp_internal_resp_va_read_fu_126_p2 = arp_internal_resp_valid_V;

assign arptable_addrout_V = arptable_addrout_reg;

assign arptable_dataout_Mac_IP_V = arptable_dataout_reg_1;

assign arptable_dataout_valid_V = arptable_dataout_reg;

assign call_for_responce_Mac_IP_V = call_for_responce_re_1;

assign call_for_responce_valid_V = call_for_responce_re;

assign icmp_ln879_1_fu_278_p2 = ((arp_in_reg_dst_ip_V == myIPReg_V) ? 1'b1 : 1'b0);

assign icmp_ln879_2_fu_266_p2 = ((arp_in_reg_opcode_V == 16'd1) ? 1'b1 : 1'b0);

assign icmp_ln879_3_fu_284_p2 = ((arp_in_reg_dst_mac_V == 48'd281474976710655) ? 1'b1 : 1'b0);

assign icmp_ln879_4_fu_290_p2 = ((arp_in_reg_src_ip_V == arp_in_reg_dst_ip_V) ? 1'b1 : 1'b0);

assign icmp_ln879_5_fu_355_p2 = ((arp_in_reg_fixed_hea == 48'd4429186564) ? 1'b1 : 1'b0);

assign icmp_ln879_6_fu_361_p2 = ((arp_in_reg_dst_ip_V == myIPReg_V) ? 1'b1 : 1'b0);

assign icmp_ln879_7_fu_367_p2 = ((arp_in_reg_opcode_V == 16'd2) ? 1'b1 : 1'b0);

assign icmp_ln879_8_fu_373_p2 = ((arp_in_reg_dst_mac_V == 48'd281474976710655) ? 1'b1 : 1'b0);

assign icmp_ln879_9_fu_379_p2 = ((arp_in_reg_src_ip_V == arp_in_reg_dst_ip_V) ? 1'b1 : 1'b0);

assign icmp_ln879_fu_272_p2 = ((arp_in_reg_fixed_hea == 48'd4429186564) ? 1'b1 : 1'b0);

assign p_Result_1_fu_439_p3 = {{arp_in_reg_src_mac_V}, {arp_in_reg_src_ip_V}};

assign p_Result_2_fu_397_p3 = {{arp_in_reg_src_mac_V}, {arp_in_reg_src_ip_V}};

assign p_Result_s_fu_425_p3 = {{eth_src_mac_V}, {arp_in_reg_src_ip_V}};

assign ret_V_fu_319_p2 = (arp_internal_resp_va | ap_phi_mux_lhs_V_phi_fu_194_p8);

assign rhs_V_load_fu_315_p1 = arp_internal_resp_va;

assign trunc_ln647_1_fu_453_p1 = arp_in_reg_src_ip_V[7:0];

assign trunc_ln647_2_fu_411_p1 = arp_in_reg_src_ip_V[7:0];

assign trunc_ln647_3_fu_577_p1 = arp_in_data_V[31:0];

assign trunc_ln647_fu_345_p1 = arp_internal_resp_re[7:0];

endmodule //arp_receive
