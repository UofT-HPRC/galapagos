// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2019.1
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="lbus_fifo_read,hls_ip_2019_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=1,HLS_INPUT_PART=xcu280-fsvh2892-2L-e,HLS_INPUT_CLOCK=3.103000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=1.409500,HLS_SYN_LAT=0,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=1521,HLS_SYN_LUT=986,HLS_VERSION=2019_1}" *)

module lbus_fifo_read (
        ap_clk,
        ap_rst,
        lbus_fifo,
        lbus_fifo_pkt_end,
        lbus_fifo_empty_V,
        lbus_fifo_pkt_end_empty_V,
        lbus_fifo_valid_V,
        lbus_fifo_pkt_end_valid_V,
        lbus_fifo_re_V,
        lbus_fifo_pkt_end_re_V,
        error_V,
        m_axis_data_V,
        m_axis_keep_V,
        m_axis_last_V,
        m_axis_valid_V
);

parameter    ap_ST_fsm_state1 = 1'd1;

input   ap_clk;
input   ap_rst;
input  [543:0] lbus_fifo;
input  [407:0] lbus_fifo_pkt_end;
input  [0:0] lbus_fifo_empty_V;
input  [0:0] lbus_fifo_pkt_end_empty_V;
input  [0:0] lbus_fifo_valid_V;
input  [0:0] lbus_fifo_pkt_end_valid_V;
output  [0:0] lbus_fifo_re_V;
output  [0:0] lbus_fifo_pkt_end_re_V;
output  [0:0] error_V;
output  [511:0] m_axis_data_V;
output  [63:0] m_axis_keep_V;
output  [0:0] m_axis_last_V;
output  [0:0] m_axis_valid_V;

reg   [511:0] m_axis_databuf_V;
reg   [15:0] m_axis_keepbuf_V_1;
reg   [0:0] keep1mask_V;
reg   [15:0] m_axis_keepbuf_V_2;
reg   [0:0] keep2mask_V;
reg   [15:0] m_axis_keepbuf_V_3;
reg   [0:0] keep3mask_V;
reg   [15:0] m_axis_keepbuf_V_0;
reg   [0:0] m_axis_lastbuf_V;
reg   [0:0] m_axis_validbuf_V;
reg   [127:0] outbuf_data_V_3;
reg   [127:0] outbuf_data_V_2;
reg   [127:0] outbuf_data_V_1;
reg   [127:0] outbuf_data_V_0;
reg   [3:0] outbuf_mty_V_0;
reg   [0:0] outbuf_ena_V_0;
reg   [3:0] outbuf_mty_V_1;
reg   [0:0] outbuf_ena_V_1;
reg   [3:0] outbuf_mty_V_2;
reg   [0:0] outbuf_ena_V_2;
reg   [3:0] outbuf_mty_V_3;
reg   [0:0] outbuf_ena_V_3;
reg   [0:0] outbuf_eop_V_0;
reg   [0:0] outbuf_eop_V_1;
reg   [0:0] outbuf_eop_V_2;
reg   [0:0] outbuf_eop_V_3;
reg   [0:0] output_valid_V;
reg   [0:0] out_pktendbuf_ena_V_s;
reg   [127:0] out_pktendbuf_data_V;
reg   [0:0] out_pktendbuf_eop_V_s;
reg   [3:0] out_pktendbuf_mty_V_s;
reg   [127:0] out_pktendbuf_data_V_1;
reg   [0:0] out_pktendbuf_ena_V_1;
reg   [0:0] out_pktendbuf_eop_V_1;
reg   [3:0] out_pktendbuf_mty_V_1;
reg   [127:0] out_pktendbuf_data_V_2;
reg   [0:0] out_pktendbuf_ena_V_2;
reg   [0:0] out_pktendbuf_eop_V_2;
reg   [3:0] out_pktendbuf_mty_V_2;
wire    call_ret_mty2keep_fu_318_ap_ready;
wire   [15:0] call_ret_mty2keep_fu_318_ap_return;
wire    call_ret1_mty2keep_fu_324_ap_ready;
wire   [15:0] call_ret1_mty2keep_fu_324_ap_return;
wire    call_ret2_mty2keep_fu_330_ap_ready;
wire   [15:0] call_ret2_mty2keep_fu_330_ap_return;
wire    call_ret3_mty2keep_fu_336_ap_ready;
wire   [15:0] call_ret3_mty2keep_fu_336_ap_return;
reg   [0:0] ap_phi_mux_empty_phi_fu_294_p6;
(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [0:0] out_pktendbuf_ena_V_1_load_fu_631_p1;
wire   [0:0] and_ln133_fu_635_p2;
reg   [0:0] ap_phi_mux_storemerge482_phi_fu_307_p6;
wire   [511:0] p_Result_1_fu_463_p5;
wire   [0:0] xor_ln113_fu_549_p2;
wire   [0:0] xor_ln114_fu_571_p2;
wire   [0:0] xor_ln115_fu_593_p2;
wire   [0:0] ret_V_20_fu_609_p2;
wire   [127:0] trunc_ln321_fu_641_p1;
wire   [127:0] trunc_ln321_1_fu_875_p1;
wire   [0:0] xor_ln146_fu_1280_p2;
wire   [15:0] rhs_V_fu_362_p3;
wire   [15:0] rhs_V_14_fu_384_p3;
wire   [15:0] rhs_V_15_fu_406_p3;
wire   [15:0] ret_V_21_fu_370_p2;
wire   [15:0] ret_V_22_fu_392_p2;
wire   [15:0] ret_V_23_fu_414_p2;
wire   [0:0] ret_V_24_fu_565_p2;
wire   [0:0] ret_V_25_fu_587_p2;
wire   [0:0] or_ln146_fu_1268_p2;
wire   [0:0] or_ln146_1_fu_1274_p2;
reg   [0:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 m_axis_databuf_V = 512'd0;
#0 m_axis_keepbuf_V_1 = 16'd0;
#0 keep1mask_V = 1'd0;
#0 m_axis_keepbuf_V_2 = 16'd0;
#0 keep2mask_V = 1'd0;
#0 m_axis_keepbuf_V_3 = 16'd0;
#0 keep3mask_V = 1'd0;
#0 m_axis_keepbuf_V_0 = 16'd0;
#0 m_axis_lastbuf_V = 1'd0;
#0 m_axis_validbuf_V = 1'd0;
#0 outbuf_data_V_3 = 128'd0;
#0 outbuf_data_V_2 = 128'd0;
#0 outbuf_data_V_1 = 128'd0;
#0 outbuf_data_V_0 = 128'd0;
#0 outbuf_mty_V_0 = 4'd0;
#0 outbuf_ena_V_0 = 1'd0;
#0 outbuf_mty_V_1 = 4'd0;
#0 outbuf_ena_V_1 = 1'd0;
#0 outbuf_mty_V_2 = 4'd0;
#0 outbuf_ena_V_2 = 1'd0;
#0 outbuf_mty_V_3 = 4'd0;
#0 outbuf_ena_V_3 = 1'd0;
#0 outbuf_eop_V_0 = 1'd0;
#0 outbuf_eop_V_1 = 1'd0;
#0 outbuf_eop_V_2 = 1'd0;
#0 outbuf_eop_V_3 = 1'd0;
#0 output_valid_V = 1'd0;
#0 out_pktendbuf_ena_V_s = 1'd0;
#0 out_pktendbuf_data_V = 128'd0;
#0 out_pktendbuf_eop_V_s = 1'd0;
#0 out_pktendbuf_mty_V_s = 4'd0;
#0 out_pktendbuf_data_V_1 = 128'd0;
#0 out_pktendbuf_ena_V_1 = 1'd0;
#0 out_pktendbuf_eop_V_1 = 1'd0;
#0 out_pktendbuf_mty_V_1 = 4'd0;
#0 out_pktendbuf_data_V_2 = 128'd0;
#0 out_pktendbuf_ena_V_2 = 1'd0;
#0 out_pktendbuf_eop_V_2 = 1'd0;
#0 out_pktendbuf_mty_V_2 = 4'd0;
#0 ap_CS_fsm = 1'd1;
end

mty2keep call_ret_mty2keep_fu_318(
    .ap_ready(call_ret_mty2keep_fu_318_ap_ready),
    .mty_V(outbuf_mty_V_0),
    .ena_V(outbuf_ena_V_0),
    .ap_return(call_ret_mty2keep_fu_318_ap_return)
);

mty2keep call_ret1_mty2keep_fu_324(
    .ap_ready(call_ret1_mty2keep_fu_324_ap_ready),
    .mty_V(outbuf_mty_V_1),
    .ena_V(outbuf_ena_V_1),
    .ap_return(call_ret1_mty2keep_fu_324_ap_return)
);

mty2keep call_ret2_mty2keep_fu_330(
    .ap_ready(call_ret2_mty2keep_fu_330_ap_ready),
    .mty_V(outbuf_mty_V_2),
    .ena_V(outbuf_ena_V_2),
    .ap_return(call_ret2_mty2keep_fu_330_ap_return)
);

mty2keep call_ret3_mty2keep_fu_336(
    .ap_ready(call_ret3_mty2keep_fu_336_ap_ready),
    .mty_V(outbuf_mty_V_3),
    .ena_V(outbuf_ena_V_3),
    .ap_return(call_ret3_mty2keep_fu_336_ap_return)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        keep1mask_V <= 1'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            keep1mask_V <= xor_ln113_fu_549_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        keep2mask_V <= 1'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            keep2mask_V <= xor_ln114_fu_571_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        keep3mask_V <= 1'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            keep3mask_V <= xor_ln115_fu_593_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        m_axis_databuf_V <= 512'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            m_axis_databuf_V <= p_Result_1_fu_463_p5;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        m_axis_keepbuf_V_0 <= 16'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            m_axis_keepbuf_V_0 <= call_ret_mty2keep_fu_318_ap_return;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        m_axis_keepbuf_V_1 <= 16'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            m_axis_keepbuf_V_1 <= call_ret1_mty2keep_fu_324_ap_return;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        m_axis_keepbuf_V_2 <= 16'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            m_axis_keepbuf_V_2 <= call_ret2_mty2keep_fu_330_ap_return;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        m_axis_keepbuf_V_3 <= 16'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            m_axis_keepbuf_V_3 <= call_ret3_mty2keep_fu_336_ap_return;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        m_axis_lastbuf_V <= 1'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            m_axis_lastbuf_V <= ret_V_20_fu_609_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        m_axis_validbuf_V <= 1'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            m_axis_validbuf_V <= output_valid_V;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        out_pktendbuf_data_V <= 128'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            if ((out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd1)) begin
                out_pktendbuf_data_V <= 128'd0;
            end else if (((1'd1 == and_ln133_fu_635_p2) & (out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd0))) begin
                out_pktendbuf_data_V <= trunc_ln321_1_fu_875_p1;
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        out_pktendbuf_data_V_1 <= 128'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            if ((out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd1)) begin
                out_pktendbuf_data_V_1 <= 128'd0;
            end else if (((1'd1 == and_ln133_fu_635_p2) & (out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd0))) begin
                out_pktendbuf_data_V_1 <= {{lbus_fifo_pkt_end[263:136]}};
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        out_pktendbuf_data_V_2 <= 128'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            if ((out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd1)) begin
                out_pktendbuf_data_V_2 <= 128'd0;
            end else if (((1'd1 == and_ln133_fu_635_p2) & (out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd0))) begin
                out_pktendbuf_data_V_2 <= {{lbus_fifo_pkt_end[399:272]}};
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        out_pktendbuf_ena_V_1 <= 1'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            if ((out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd1)) begin
                out_pktendbuf_ena_V_1 <= 1'd0;
            end else if (((1'd1 == and_ln133_fu_635_p2) & (out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd0))) begin
                out_pktendbuf_ena_V_1 <= lbus_fifo_pkt_end[32'd264];
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        out_pktendbuf_ena_V_2 <= 1'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            if ((out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd1)) begin
                out_pktendbuf_ena_V_2 <= 1'd0;
            end else if (((1'd1 == and_ln133_fu_635_p2) & (out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd0))) begin
                out_pktendbuf_ena_V_2 <= lbus_fifo_pkt_end[32'd400];
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        out_pktendbuf_ena_V_s <= 1'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            if ((out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd1)) begin
                out_pktendbuf_ena_V_s <= 1'd0;
            end else if (((1'd1 == and_ln133_fu_635_p2) & (out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd0))) begin
                out_pktendbuf_ena_V_s <= lbus_fifo_pkt_end[32'd128];
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        out_pktendbuf_eop_V_1 <= 1'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            if ((out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd1)) begin
                out_pktendbuf_eop_V_1 <= 1'd0;
            end else if (((1'd1 == and_ln133_fu_635_p2) & (out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd0))) begin
                out_pktendbuf_eop_V_1 <= lbus_fifo_pkt_end[32'd266];
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        out_pktendbuf_eop_V_2 <= 1'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            if ((out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd1)) begin
                out_pktendbuf_eop_V_2 <= 1'd0;
            end else if (((1'd1 == and_ln133_fu_635_p2) & (out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd0))) begin
                out_pktendbuf_eop_V_2 <= lbus_fifo_pkt_end[32'd402];
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        out_pktendbuf_eop_V_s <= 1'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            if ((out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd1)) begin
                out_pktendbuf_eop_V_s <= 1'd0;
            end else if (((1'd1 == and_ln133_fu_635_p2) & (out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd0))) begin
                out_pktendbuf_eop_V_s <= lbus_fifo_pkt_end[32'd130];
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        out_pktendbuf_mty_V_1 <= 4'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            if ((out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd1)) begin
                out_pktendbuf_mty_V_1 <= 4'd0;
            end else if (((1'd1 == and_ln133_fu_635_p2) & (out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd0))) begin
                out_pktendbuf_mty_V_1 <= {{lbus_fifo_pkt_end[271:268]}};
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        out_pktendbuf_mty_V_2 <= 4'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            if ((out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd1)) begin
                out_pktendbuf_mty_V_2 <= 4'd0;
            end else if (((1'd1 == and_ln133_fu_635_p2) & (out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd0))) begin
                out_pktendbuf_mty_V_2 <= {{lbus_fifo_pkt_end[407:404]}};
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        out_pktendbuf_mty_V_s <= 4'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            if ((out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd1)) begin
                out_pktendbuf_mty_V_s <= 4'd0;
            end else if (((1'd1 == and_ln133_fu_635_p2) & (out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd0))) begin
                out_pktendbuf_mty_V_s <= {{lbus_fifo_pkt_end[135:132]}};
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        outbuf_data_V_0 <= 128'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            if ((out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd1)) begin
                outbuf_data_V_0 <= out_pktendbuf_data_V;
            end else if (((1'd1 == and_ln133_fu_635_p2) & (out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd0))) begin
                outbuf_data_V_0 <= trunc_ln321_fu_641_p1;
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        outbuf_data_V_1 <= 128'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            if ((out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd1)) begin
                outbuf_data_V_1 <= out_pktendbuf_data_V_1;
            end else if (((1'd1 == and_ln133_fu_635_p2) & (out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd0))) begin
                outbuf_data_V_1 <= {{lbus_fifo[263:136]}};
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        outbuf_data_V_2 <= 128'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            if ((out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd1)) begin
                outbuf_data_V_2 <= out_pktendbuf_data_V_2;
            end else if (((1'd1 == and_ln133_fu_635_p2) & (out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd0))) begin
                outbuf_data_V_2 <= {{lbus_fifo[399:272]}};
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        outbuf_data_V_3 <= 128'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            if ((out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd1)) begin
                outbuf_data_V_3 <= 128'd0;
            end else if (((1'd1 == and_ln133_fu_635_p2) & (out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd0))) begin
                outbuf_data_V_3 <= {{lbus_fifo[535:408]}};
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        outbuf_ena_V_0 <= 1'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            if ((out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd1)) begin
                outbuf_ena_V_0 <= 1'd1;
            end else if (((1'd1 == and_ln133_fu_635_p2) & (out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd0))) begin
                outbuf_ena_V_0 <= lbus_fifo[32'd128];
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        outbuf_ena_V_1 <= 1'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            if ((out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd1)) begin
                outbuf_ena_V_1 <= out_pktendbuf_ena_V_1;
            end else if (((1'd1 == and_ln133_fu_635_p2) & (out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd0))) begin
                outbuf_ena_V_1 <= lbus_fifo[32'd264];
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        outbuf_ena_V_2 <= 1'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            if ((out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd1)) begin
                outbuf_ena_V_2 <= out_pktendbuf_ena_V_2;
            end else if (((1'd1 == and_ln133_fu_635_p2) & (out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd0))) begin
                outbuf_ena_V_2 <= lbus_fifo[32'd400];
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        outbuf_ena_V_3 <= 1'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            if ((out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd1)) begin
                outbuf_ena_V_3 <= 1'd0;
            end else if (((1'd1 == and_ln133_fu_635_p2) & (out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd0))) begin
                outbuf_ena_V_3 <= lbus_fifo[32'd536];
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        outbuf_eop_V_0 <= 1'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            if ((out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd1)) begin
                outbuf_eop_V_0 <= out_pktendbuf_eop_V_s;
            end else if (((1'd1 == and_ln133_fu_635_p2) & (out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd0))) begin
                outbuf_eop_V_0 <= lbus_fifo[32'd130];
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        outbuf_eop_V_1 <= 1'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            if ((out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd1)) begin
                outbuf_eop_V_1 <= out_pktendbuf_eop_V_1;
            end else if (((1'd1 == and_ln133_fu_635_p2) & (out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd0))) begin
                outbuf_eop_V_1 <= lbus_fifo[32'd266];
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        outbuf_eop_V_2 <= 1'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            if ((out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd1)) begin
                outbuf_eop_V_2 <= out_pktendbuf_eop_V_2;
            end else if (((1'd1 == and_ln133_fu_635_p2) & (out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd0))) begin
                outbuf_eop_V_2 <= lbus_fifo[32'd402];
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        outbuf_eop_V_3 <= 1'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            if ((out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd1)) begin
                outbuf_eop_V_3 <= 1'd0;
            end else if (((1'd1 == and_ln133_fu_635_p2) & (out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd0))) begin
                outbuf_eop_V_3 <= lbus_fifo[32'd538];
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        outbuf_mty_V_0 <= 4'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            if ((out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd1)) begin
                outbuf_mty_V_0 <= out_pktendbuf_mty_V_s;
            end else if (((1'd1 == and_ln133_fu_635_p2) & (out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd0))) begin
                outbuf_mty_V_0 <= {{lbus_fifo[135:132]}};
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        outbuf_mty_V_1 <= 4'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            if ((out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd1)) begin
                outbuf_mty_V_1 <= out_pktendbuf_mty_V_1;
            end else if (((1'd1 == and_ln133_fu_635_p2) & (out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd0))) begin
                outbuf_mty_V_1 <= {{lbus_fifo[271:268]}};
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        outbuf_mty_V_2 <= 4'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            if ((out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd1)) begin
                outbuf_mty_V_2 <= out_pktendbuf_mty_V_2;
            end else if (((1'd1 == and_ln133_fu_635_p2) & (out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd0))) begin
                outbuf_mty_V_2 <= {{lbus_fifo[407:404]}};
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        outbuf_mty_V_3 <= 4'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            if ((out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd1)) begin
                outbuf_mty_V_3 <= 4'd0;
            end else if (((1'd1 == and_ln133_fu_635_p2) & (out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd0))) begin
                outbuf_mty_V_3 <= {{lbus_fifo[543:540]}};
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        output_valid_V <= 1'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            output_valid_V <= ap_phi_mux_storemerge482_phi_fu_307_p6;
        end
    end
end

always @ (*) begin
    if (((1'd1 == and_ln133_fu_635_p2) & (out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_phi_mux_empty_phi_fu_294_p6 = lbus_fifo_pkt_end[32'd128];
    end else if ((((out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd1) & (1'b1 == ap_CS_fsm_state1)) | ((out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd0) & (1'd0 == and_ln133_fu_635_p2) & (1'b1 == ap_CS_fsm_state1)))) begin
        ap_phi_mux_empty_phi_fu_294_p6 = 1'd0;
    end else begin
        ap_phi_mux_empty_phi_fu_294_p6 = 'bx;
    end
end

always @ (*) begin
    if (((out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd0) & (1'd0 == and_ln133_fu_635_p2) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_phi_mux_storemerge482_phi_fu_307_p6 = 1'd0;
    end else if ((((out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd1) & (1'b1 == ap_CS_fsm_state1)) | ((1'd1 == and_ln133_fu_635_p2) & (out_pktendbuf_ena_V_1_load_fu_631_p1 == 1'd0) & (1'b1 == ap_CS_fsm_state1)))) begin
        ap_phi_mux_storemerge482_phi_fu_307_p6 = 1'd1;
    end else begin
        ap_phi_mux_storemerge482_phi_fu_307_p6 = 'bx;
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

assign and_ln133_fu_635_p2 = (lbus_fifo_valid_V & lbus_fifo_pkt_end_valid_V);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign error_V = (lbus_fifo_pkt_end_empty_V ^ lbus_fifo_empty_V);

assign lbus_fifo_pkt_end_re_V = xor_ln146_fu_1280_p2;

assign lbus_fifo_re_V = xor_ln146_fu_1280_p2;

assign m_axis_data_V = m_axis_databuf_V;

assign m_axis_keep_V = {{{{m_axis_keepbuf_V_0}, {ret_V_21_fu_370_p2}}, {ret_V_22_fu_392_p2}}, {ret_V_23_fu_414_p2}};

assign m_axis_last_V = m_axis_lastbuf_V;

assign m_axis_valid_V = m_axis_validbuf_V;

assign or_ln146_1_fu_1274_p2 = (or_ln146_fu_1268_p2 | lbus_fifo_empty_V);

assign or_ln146_fu_1268_p2 = (lbus_fifo_pkt_end_empty_V | ap_phi_mux_empty_phi_fu_294_p6);

assign out_pktendbuf_ena_V_1_load_fu_631_p1 = out_pktendbuf_ena_V_s;

assign p_Result_1_fu_463_p5 = {{{{outbuf_data_V_0}, {outbuf_data_V_1}}, {outbuf_data_V_2}}, {outbuf_data_V_3}};

assign ret_V_20_fu_609_p2 = (ret_V_25_fu_587_p2 | outbuf_eop_V_3);

assign ret_V_21_fu_370_p2 = (rhs_V_fu_362_p3 & m_axis_keepbuf_V_1);

assign ret_V_22_fu_392_p2 = (rhs_V_14_fu_384_p3 & m_axis_keepbuf_V_2);

assign ret_V_23_fu_414_p2 = (rhs_V_15_fu_406_p3 & m_axis_keepbuf_V_3);

assign ret_V_24_fu_565_p2 = (outbuf_eop_V_1 | outbuf_eop_V_0);

assign ret_V_25_fu_587_p2 = (ret_V_24_fu_565_p2 | outbuf_eop_V_2);

assign rhs_V_14_fu_384_p3 = ((keep2mask_V[0:0] === 1'b1) ? 16'd65535 : 16'd0);

assign rhs_V_15_fu_406_p3 = ((keep3mask_V[0:0] === 1'b1) ? 16'd65535 : 16'd0);

assign rhs_V_fu_362_p3 = ((keep1mask_V[0:0] === 1'b1) ? 16'd65535 : 16'd0);

assign trunc_ln321_1_fu_875_p1 = lbus_fifo_pkt_end[127:0];

assign trunc_ln321_fu_641_p1 = lbus_fifo[127:0];

assign xor_ln113_fu_549_p2 = (outbuf_eop_V_0 ^ 1'd1);

assign xor_ln114_fu_571_p2 = (ret_V_24_fu_565_p2 ^ 1'd1);

assign xor_ln115_fu_593_p2 = (ret_V_25_fu_587_p2 ^ 1'd1);

assign xor_ln146_fu_1280_p2 = (or_ln146_1_fu_1274_p2 ^ 1'd1);

endmodule //lbus_fifo_read