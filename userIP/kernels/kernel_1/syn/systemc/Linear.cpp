// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2019.1
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#include "Linear.h"
#include "AESL_pkg.h"

using namespace std;

namespace ap_rtl {

const sc_logic Linear::ap_const_logic_0 = sc_dt::Log_0;
const bool Linear::ap_const_boolean_1 = true;
const sc_logic Linear::ap_const_logic_1 = sc_dt::Log_1;
const sc_lv<512> Linear::ap_const_lv512_lc_2 = "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
const sc_lv<8> Linear::ap_const_lv8_0 = "00000000";
const sc_lv<16> Linear::ap_const_lv16_0 = "0000000000000000";
const sc_lv<1> Linear::ap_const_lv1_0 = "0";

Linear::Linear(sc_module_name name) : sc_module(name), mVcdFile(0) {
    MatMul_U0 = new MatMul("MatMul_U0");
    MatMul_U0->ap_start(MatMul_U0_ap_start);
    MatMul_U0->start_full_n(start_for_AddBias_U0_full_n);
    MatMul_U0->start_out(MatMul_U0_start_out);
    MatMul_U0->start_write(MatMul_U0_start_write);
    MatMul_U0->in_r_TDATA(in_r_TDATA);
    MatMul_U0->in_r_TID(in_r_TID);
    MatMul_U0->in_r_TDEST(in_r_TDEST);
    MatMul_U0->in_r_TUSER(in_r_TUSER);
    MatMul_U0->in_r_TLAST(in_r_TLAST);
    MatMul_U0->c_V_data_V_din(MatMul_U0_c_V_data_V_din);
    MatMul_U0->c_V_data_V_full_n(pipe_V_data_V_full_n);
    MatMul_U0->c_V_data_V_write(MatMul_U0_c_V_data_V_write);
    MatMul_U0->c_V_id_V_din(MatMul_U0_c_V_id_V_din);
    MatMul_U0->c_V_id_V_full_n(pipe_V_id_V_full_n);
    MatMul_U0->c_V_id_V_write(MatMul_U0_c_V_id_V_write);
    MatMul_U0->c_V_dest_V_din(MatMul_U0_c_V_dest_V_din);
    MatMul_U0->c_V_dest_V_full_n(pipe_V_dest_V_full_n);
    MatMul_U0->c_V_dest_V_write(MatMul_U0_c_V_dest_V_write);
    MatMul_U0->c_V_user_V_din(MatMul_U0_c_V_user_V_din);
    MatMul_U0->c_V_user_V_full_n(pipe_V_user_V_full_n);
    MatMul_U0->c_V_user_V_write(MatMul_U0_c_V_user_V_write);
    MatMul_U0->c_V_last_V_din(MatMul_U0_c_V_last_V_din);
    MatMul_U0->c_V_last_V_full_n(pipe_V_last_V_full_n);
    MatMul_U0->c_V_last_V_write(MatMul_U0_c_V_last_V_write);
    MatMul_U0->ap_clk(ap_clk);
    MatMul_U0->ap_rst(ap_rst);
    MatMul_U0->in_r_TVALID(in_r_TVALID);
    MatMul_U0->in_r_TREADY(MatMul_U0_in_r_TREADY);
    MatMul_U0->ap_done(MatMul_U0_ap_done);
    MatMul_U0->ap_ready(MatMul_U0_ap_ready);
    MatMul_U0->ap_idle(MatMul_U0_ap_idle);
    MatMul_U0->ap_continue(MatMul_U0_ap_continue);
    AddBias_U0 = new AddBias("AddBias_U0");
    AddBias_U0->ap_clk(ap_clk);
    AddBias_U0->ap_rst(ap_rst);
    AddBias_U0->ap_start(AddBias_U0_ap_start);
    AddBias_U0->ap_done(AddBias_U0_ap_done);
    AddBias_U0->ap_continue(AddBias_U0_ap_continue);
    AddBias_U0->ap_idle(AddBias_U0_ap_idle);
    AddBias_U0->ap_ready(AddBias_U0_ap_ready);
    AddBias_U0->in_V_data_V_dout(pipe_V_data_V_dout);
    AddBias_U0->in_V_data_V_empty_n(pipe_V_data_V_empty_n);
    AddBias_U0->in_V_data_V_read(AddBias_U0_in_V_data_V_read);
    AddBias_U0->in_V_id_V_dout(pipe_V_id_V_dout);
    AddBias_U0->in_V_id_V_empty_n(pipe_V_id_V_empty_n);
    AddBias_U0->in_V_id_V_read(AddBias_U0_in_V_id_V_read);
    AddBias_U0->in_V_dest_V_dout(pipe_V_dest_V_dout);
    AddBias_U0->in_V_dest_V_empty_n(pipe_V_dest_V_empty_n);
    AddBias_U0->in_V_dest_V_read(AddBias_U0_in_V_dest_V_read);
    AddBias_U0->in_V_user_V_dout(pipe_V_user_V_dout);
    AddBias_U0->in_V_user_V_empty_n(pipe_V_user_V_empty_n);
    AddBias_U0->in_V_user_V_read(AddBias_U0_in_V_user_V_read);
    AddBias_U0->in_V_last_V_dout(pipe_V_last_V_dout);
    AddBias_U0->in_V_last_V_empty_n(pipe_V_last_V_empty_n);
    AddBias_U0->in_V_last_V_read(AddBias_U0_in_V_last_V_read);
    AddBias_U0->out_V_data_V_din(AddBias_U0_out_V_data_V_din);
    AddBias_U0->out_V_data_V_full_n(out_V_data_V_full_n);
    AddBias_U0->out_V_data_V_write(AddBias_U0_out_V_data_V_write);
    AddBias_U0->out_V_id_V_din(AddBias_U0_out_V_id_V_din);
    AddBias_U0->out_V_id_V_full_n(out_V_id_V_full_n);
    AddBias_U0->out_V_id_V_write(AddBias_U0_out_V_id_V_write);
    AddBias_U0->out_V_dest_V_din(AddBias_U0_out_V_dest_V_din);
    AddBias_U0->out_V_dest_V_full_n(out_V_dest_V_full_n);
    AddBias_U0->out_V_dest_V_write(AddBias_U0_out_V_dest_V_write);
    AddBias_U0->out_V_user_V_din(AddBias_U0_out_V_user_V_din);
    AddBias_U0->out_V_user_V_full_n(out_V_user_V_full_n);
    AddBias_U0->out_V_user_V_write(AddBias_U0_out_V_user_V_write);
    AddBias_U0->out_V_last_V_din(AddBias_U0_out_V_last_V_din);
    AddBias_U0->out_V_last_V_full_n(out_V_last_V_full_n);
    AddBias_U0->out_V_last_V_write(AddBias_U0_out_V_last_V_write);
    pipe_V_data_V_U = new fifo_w512_d2_A("pipe_V_data_V_U");
    pipe_V_data_V_U->clk(ap_clk);
    pipe_V_data_V_U->reset(ap_rst);
    pipe_V_data_V_U->if_read_ce(ap_var_for_const0);
    pipe_V_data_V_U->if_write_ce(ap_var_for_const0);
    pipe_V_data_V_U->if_din(MatMul_U0_c_V_data_V_din);
    pipe_V_data_V_U->if_full_n(pipe_V_data_V_full_n);
    pipe_V_data_V_U->if_write(MatMul_U0_c_V_data_V_write);
    pipe_V_data_V_U->if_dout(pipe_V_data_V_dout);
    pipe_V_data_V_U->if_empty_n(pipe_V_data_V_empty_n);
    pipe_V_data_V_U->if_read(AddBias_U0_in_V_data_V_read);
    pipe_V_id_V_U = new fifo_w8_d2_A("pipe_V_id_V_U");
    pipe_V_id_V_U->clk(ap_clk);
    pipe_V_id_V_U->reset(ap_rst);
    pipe_V_id_V_U->if_read_ce(ap_var_for_const0);
    pipe_V_id_V_U->if_write_ce(ap_var_for_const0);
    pipe_V_id_V_U->if_din(MatMul_U0_c_V_id_V_din);
    pipe_V_id_V_U->if_full_n(pipe_V_id_V_full_n);
    pipe_V_id_V_U->if_write(MatMul_U0_c_V_id_V_write);
    pipe_V_id_V_U->if_dout(pipe_V_id_V_dout);
    pipe_V_id_V_U->if_empty_n(pipe_V_id_V_empty_n);
    pipe_V_id_V_U->if_read(AddBias_U0_in_V_id_V_read);
    pipe_V_dest_V_U = new fifo_w8_d2_A("pipe_V_dest_V_U");
    pipe_V_dest_V_U->clk(ap_clk);
    pipe_V_dest_V_U->reset(ap_rst);
    pipe_V_dest_V_U->if_read_ce(ap_var_for_const0);
    pipe_V_dest_V_U->if_write_ce(ap_var_for_const0);
    pipe_V_dest_V_U->if_din(MatMul_U0_c_V_dest_V_din);
    pipe_V_dest_V_U->if_full_n(pipe_V_dest_V_full_n);
    pipe_V_dest_V_U->if_write(MatMul_U0_c_V_dest_V_write);
    pipe_V_dest_V_U->if_dout(pipe_V_dest_V_dout);
    pipe_V_dest_V_U->if_empty_n(pipe_V_dest_V_empty_n);
    pipe_V_dest_V_U->if_read(AddBias_U0_in_V_dest_V_read);
    pipe_V_user_V_U = new fifo_w16_d2_A("pipe_V_user_V_U");
    pipe_V_user_V_U->clk(ap_clk);
    pipe_V_user_V_U->reset(ap_rst);
    pipe_V_user_V_U->if_read_ce(ap_var_for_const0);
    pipe_V_user_V_U->if_write_ce(ap_var_for_const0);
    pipe_V_user_V_U->if_din(MatMul_U0_c_V_user_V_din);
    pipe_V_user_V_U->if_full_n(pipe_V_user_V_full_n);
    pipe_V_user_V_U->if_write(MatMul_U0_c_V_user_V_write);
    pipe_V_user_V_U->if_dout(pipe_V_user_V_dout);
    pipe_V_user_V_U->if_empty_n(pipe_V_user_V_empty_n);
    pipe_V_user_V_U->if_read(AddBias_U0_in_V_user_V_read);
    pipe_V_last_V_U = new fifo_w1_d2_A("pipe_V_last_V_U");
    pipe_V_last_V_U->clk(ap_clk);
    pipe_V_last_V_U->reset(ap_rst);
    pipe_V_last_V_U->if_read_ce(ap_var_for_const0);
    pipe_V_last_V_U->if_write_ce(ap_var_for_const0);
    pipe_V_last_V_U->if_din(MatMul_U0_c_V_last_V_din);
    pipe_V_last_V_U->if_full_n(pipe_V_last_V_full_n);
    pipe_V_last_V_U->if_write(MatMul_U0_c_V_last_V_write);
    pipe_V_last_V_U->if_dout(pipe_V_last_V_dout);
    pipe_V_last_V_U->if_empty_n(pipe_V_last_V_empty_n);
    pipe_V_last_V_U->if_read(AddBias_U0_in_V_last_V_read);
    start_for_AddBias_U0_U = new start_for_AddBias_U0("start_for_AddBias_U0_U");
    start_for_AddBias_U0_U->clk(ap_clk);
    start_for_AddBias_U0_U->reset(ap_rst);
    start_for_AddBias_U0_U->if_read_ce(ap_var_for_const0);
    start_for_AddBias_U0_U->if_write_ce(ap_var_for_const0);
    start_for_AddBias_U0_U->if_din(start_for_AddBias_U0_din);
    start_for_AddBias_U0_U->if_full_n(start_for_AddBias_U0_full_n);
    start_for_AddBias_U0_U->if_write(MatMul_U0_start_write);
    start_for_AddBias_U0_U->if_dout(start_for_AddBias_U0_dout);
    start_for_AddBias_U0_U->if_empty_n(start_for_AddBias_U0_empty_n);
    start_for_AddBias_U0_U->if_read(AddBias_U0_ap_ready);

    SC_METHOD(thread_ap_clk_no_reset_);
    dont_initialize();
    sensitive << ( ap_clk.pos() );

    SC_METHOD(thread_AddBias_U0_ap_continue);
    sensitive << ( ap_continue );

    SC_METHOD(thread_AddBias_U0_ap_start);
    sensitive << ( start_for_AddBias_U0_empty_n );

    SC_METHOD(thread_AddBias_U0_start_full_n);

    SC_METHOD(thread_AddBias_U0_start_write);

    SC_METHOD(thread_MatMul_U0_ap_continue);

    SC_METHOD(thread_MatMul_U0_ap_start);
    sensitive << ( real_start );

    SC_METHOD(thread_ap_done);
    sensitive << ( AddBias_U0_ap_done );

    SC_METHOD(thread_ap_idle);
    sensitive << ( MatMul_U0_ap_idle );
    sensitive << ( AddBias_U0_ap_idle );

    SC_METHOD(thread_ap_ready);
    sensitive << ( internal_ap_ready );

    SC_METHOD(thread_ap_sync_continue);
    sensitive << ( ap_continue );

    SC_METHOD(thread_ap_sync_done);
    sensitive << ( AddBias_U0_ap_done );

    SC_METHOD(thread_ap_sync_ready);
    sensitive << ( MatMul_U0_ap_ready );

    SC_METHOD(thread_in_r_TREADY);
    sensitive << ( MatMul_U0_in_r_TREADY );

    SC_METHOD(thread_internal_ap_ready);
    sensitive << ( ap_sync_ready );

    SC_METHOD(thread_out_V_data_V_din);
    sensitive << ( AddBias_U0_out_V_data_V_din );

    SC_METHOD(thread_out_V_data_V_write);
    sensitive << ( AddBias_U0_out_V_data_V_write );

    SC_METHOD(thread_out_V_dest_V_din);
    sensitive << ( AddBias_U0_out_V_dest_V_din );

    SC_METHOD(thread_out_V_dest_V_write);
    sensitive << ( AddBias_U0_out_V_dest_V_write );

    SC_METHOD(thread_out_V_id_V_din);
    sensitive << ( AddBias_U0_out_V_id_V_din );

    SC_METHOD(thread_out_V_id_V_write);
    sensitive << ( AddBias_U0_out_V_id_V_write );

    SC_METHOD(thread_out_V_last_V_din);
    sensitive << ( AddBias_U0_out_V_last_V_din );

    SC_METHOD(thread_out_V_last_V_write);
    sensitive << ( AddBias_U0_out_V_last_V_write );

    SC_METHOD(thread_out_V_user_V_din);
    sensitive << ( AddBias_U0_out_V_user_V_din );

    SC_METHOD(thread_out_V_user_V_write);
    sensitive << ( AddBias_U0_out_V_user_V_write );

    SC_METHOD(thread_real_start);
    sensitive << ( ap_start );
    sensitive << ( start_full_n );
    sensitive << ( start_once_reg );

    SC_METHOD(thread_start_for_AddBias_U0_din);

    SC_METHOD(thread_start_out);
    sensitive << ( real_start );

    SC_METHOD(thread_start_write);
    sensitive << ( real_start );
    sensitive << ( start_once_reg );

    SC_THREAD(thread_ap_var_for_const0);

    start_once_reg = SC_LOGIC_0;
    static int apTFileNum = 0;
    stringstream apTFilenSS;
    apTFilenSS << "Linear_sc_trace_" << apTFileNum ++;
    string apTFn = apTFilenSS.str();
    mVcdFile = sc_create_vcd_trace_file(apTFn.c_str());
    mVcdFile->set_time_unit(1, SC_PS);
    if (1) {
#ifdef __HLS_TRACE_LEVEL_PORT_HIER__
    sc_trace(mVcdFile, ap_start, "(port)ap_start");
    sc_trace(mVcdFile, start_full_n, "(port)start_full_n");
    sc_trace(mVcdFile, start_out, "(port)start_out");
    sc_trace(mVcdFile, start_write, "(port)start_write");
    sc_trace(mVcdFile, in_r_TDATA, "(port)in_r_TDATA");
    sc_trace(mVcdFile, in_r_TID, "(port)in_r_TID");
    sc_trace(mVcdFile, in_r_TDEST, "(port)in_r_TDEST");
    sc_trace(mVcdFile, in_r_TUSER, "(port)in_r_TUSER");
    sc_trace(mVcdFile, in_r_TLAST, "(port)in_r_TLAST");
    sc_trace(mVcdFile, out_V_data_V_din, "(port)out_V_data_V_din");
    sc_trace(mVcdFile, out_V_data_V_full_n, "(port)out_V_data_V_full_n");
    sc_trace(mVcdFile, out_V_data_V_write, "(port)out_V_data_V_write");
    sc_trace(mVcdFile, out_V_id_V_din, "(port)out_V_id_V_din");
    sc_trace(mVcdFile, out_V_id_V_full_n, "(port)out_V_id_V_full_n");
    sc_trace(mVcdFile, out_V_id_V_write, "(port)out_V_id_V_write");
    sc_trace(mVcdFile, out_V_dest_V_din, "(port)out_V_dest_V_din");
    sc_trace(mVcdFile, out_V_dest_V_full_n, "(port)out_V_dest_V_full_n");
    sc_trace(mVcdFile, out_V_dest_V_write, "(port)out_V_dest_V_write");
    sc_trace(mVcdFile, out_V_user_V_din, "(port)out_V_user_V_din");
    sc_trace(mVcdFile, out_V_user_V_full_n, "(port)out_V_user_V_full_n");
    sc_trace(mVcdFile, out_V_user_V_write, "(port)out_V_user_V_write");
    sc_trace(mVcdFile, out_V_last_V_din, "(port)out_V_last_V_din");
    sc_trace(mVcdFile, out_V_last_V_full_n, "(port)out_V_last_V_full_n");
    sc_trace(mVcdFile, out_V_last_V_write, "(port)out_V_last_V_write");
    sc_trace(mVcdFile, ap_clk, "(port)ap_clk");
    sc_trace(mVcdFile, ap_rst, "(port)ap_rst");
    sc_trace(mVcdFile, in_r_TVALID, "(port)in_r_TVALID");
    sc_trace(mVcdFile, in_r_TREADY, "(port)in_r_TREADY");
    sc_trace(mVcdFile, ap_done, "(port)ap_done");
    sc_trace(mVcdFile, ap_ready, "(port)ap_ready");
    sc_trace(mVcdFile, ap_idle, "(port)ap_idle");
    sc_trace(mVcdFile, ap_continue, "(port)ap_continue");
#endif
#ifdef __HLS_TRACE_LEVEL_INT__
    sc_trace(mVcdFile, real_start, "real_start");
    sc_trace(mVcdFile, start_once_reg, "start_once_reg");
    sc_trace(mVcdFile, internal_ap_ready, "internal_ap_ready");
    sc_trace(mVcdFile, MatMul_U0_ap_start, "MatMul_U0_ap_start");
    sc_trace(mVcdFile, MatMul_U0_start_out, "MatMul_U0_start_out");
    sc_trace(mVcdFile, MatMul_U0_start_write, "MatMul_U0_start_write");
    sc_trace(mVcdFile, MatMul_U0_c_V_data_V_din, "MatMul_U0_c_V_data_V_din");
    sc_trace(mVcdFile, MatMul_U0_c_V_data_V_write, "MatMul_U0_c_V_data_V_write");
    sc_trace(mVcdFile, MatMul_U0_c_V_id_V_din, "MatMul_U0_c_V_id_V_din");
    sc_trace(mVcdFile, MatMul_U0_c_V_id_V_write, "MatMul_U0_c_V_id_V_write");
    sc_trace(mVcdFile, MatMul_U0_c_V_dest_V_din, "MatMul_U0_c_V_dest_V_din");
    sc_trace(mVcdFile, MatMul_U0_c_V_dest_V_write, "MatMul_U0_c_V_dest_V_write");
    sc_trace(mVcdFile, MatMul_U0_c_V_user_V_din, "MatMul_U0_c_V_user_V_din");
    sc_trace(mVcdFile, MatMul_U0_c_V_user_V_write, "MatMul_U0_c_V_user_V_write");
    sc_trace(mVcdFile, MatMul_U0_c_V_last_V_din, "MatMul_U0_c_V_last_V_din");
    sc_trace(mVcdFile, MatMul_U0_c_V_last_V_write, "MatMul_U0_c_V_last_V_write");
    sc_trace(mVcdFile, MatMul_U0_in_r_TREADY, "MatMul_U0_in_r_TREADY");
    sc_trace(mVcdFile, MatMul_U0_ap_done, "MatMul_U0_ap_done");
    sc_trace(mVcdFile, MatMul_U0_ap_ready, "MatMul_U0_ap_ready");
    sc_trace(mVcdFile, MatMul_U0_ap_idle, "MatMul_U0_ap_idle");
    sc_trace(mVcdFile, MatMul_U0_ap_continue, "MatMul_U0_ap_continue");
    sc_trace(mVcdFile, AddBias_U0_ap_start, "AddBias_U0_ap_start");
    sc_trace(mVcdFile, AddBias_U0_ap_done, "AddBias_U0_ap_done");
    sc_trace(mVcdFile, AddBias_U0_ap_continue, "AddBias_U0_ap_continue");
    sc_trace(mVcdFile, AddBias_U0_ap_idle, "AddBias_U0_ap_idle");
    sc_trace(mVcdFile, AddBias_U0_ap_ready, "AddBias_U0_ap_ready");
    sc_trace(mVcdFile, AddBias_U0_in_V_data_V_read, "AddBias_U0_in_V_data_V_read");
    sc_trace(mVcdFile, AddBias_U0_in_V_id_V_read, "AddBias_U0_in_V_id_V_read");
    sc_trace(mVcdFile, AddBias_U0_in_V_dest_V_read, "AddBias_U0_in_V_dest_V_read");
    sc_trace(mVcdFile, AddBias_U0_in_V_user_V_read, "AddBias_U0_in_V_user_V_read");
    sc_trace(mVcdFile, AddBias_U0_in_V_last_V_read, "AddBias_U0_in_V_last_V_read");
    sc_trace(mVcdFile, AddBias_U0_out_V_data_V_din, "AddBias_U0_out_V_data_V_din");
    sc_trace(mVcdFile, AddBias_U0_out_V_data_V_write, "AddBias_U0_out_V_data_V_write");
    sc_trace(mVcdFile, AddBias_U0_out_V_id_V_din, "AddBias_U0_out_V_id_V_din");
    sc_trace(mVcdFile, AddBias_U0_out_V_id_V_write, "AddBias_U0_out_V_id_V_write");
    sc_trace(mVcdFile, AddBias_U0_out_V_dest_V_din, "AddBias_U0_out_V_dest_V_din");
    sc_trace(mVcdFile, AddBias_U0_out_V_dest_V_write, "AddBias_U0_out_V_dest_V_write");
    sc_trace(mVcdFile, AddBias_U0_out_V_user_V_din, "AddBias_U0_out_V_user_V_din");
    sc_trace(mVcdFile, AddBias_U0_out_V_user_V_write, "AddBias_U0_out_V_user_V_write");
    sc_trace(mVcdFile, AddBias_U0_out_V_last_V_din, "AddBias_U0_out_V_last_V_din");
    sc_trace(mVcdFile, AddBias_U0_out_V_last_V_write, "AddBias_U0_out_V_last_V_write");
    sc_trace(mVcdFile, ap_sync_continue, "ap_sync_continue");
    sc_trace(mVcdFile, pipe_V_data_V_full_n, "pipe_V_data_V_full_n");
    sc_trace(mVcdFile, pipe_V_data_V_dout, "pipe_V_data_V_dout");
    sc_trace(mVcdFile, pipe_V_data_V_empty_n, "pipe_V_data_V_empty_n");
    sc_trace(mVcdFile, pipe_V_id_V_full_n, "pipe_V_id_V_full_n");
    sc_trace(mVcdFile, pipe_V_id_V_dout, "pipe_V_id_V_dout");
    sc_trace(mVcdFile, pipe_V_id_V_empty_n, "pipe_V_id_V_empty_n");
    sc_trace(mVcdFile, pipe_V_dest_V_full_n, "pipe_V_dest_V_full_n");
    sc_trace(mVcdFile, pipe_V_dest_V_dout, "pipe_V_dest_V_dout");
    sc_trace(mVcdFile, pipe_V_dest_V_empty_n, "pipe_V_dest_V_empty_n");
    sc_trace(mVcdFile, pipe_V_user_V_full_n, "pipe_V_user_V_full_n");
    sc_trace(mVcdFile, pipe_V_user_V_dout, "pipe_V_user_V_dout");
    sc_trace(mVcdFile, pipe_V_user_V_empty_n, "pipe_V_user_V_empty_n");
    sc_trace(mVcdFile, pipe_V_last_V_full_n, "pipe_V_last_V_full_n");
    sc_trace(mVcdFile, pipe_V_last_V_dout, "pipe_V_last_V_dout");
    sc_trace(mVcdFile, pipe_V_last_V_empty_n, "pipe_V_last_V_empty_n");
    sc_trace(mVcdFile, ap_sync_done, "ap_sync_done");
    sc_trace(mVcdFile, ap_sync_ready, "ap_sync_ready");
    sc_trace(mVcdFile, start_for_AddBias_U0_din, "start_for_AddBias_U0_din");
    sc_trace(mVcdFile, start_for_AddBias_U0_full_n, "start_for_AddBias_U0_full_n");
    sc_trace(mVcdFile, start_for_AddBias_U0_dout, "start_for_AddBias_U0_dout");
    sc_trace(mVcdFile, start_for_AddBias_U0_empty_n, "start_for_AddBias_U0_empty_n");
    sc_trace(mVcdFile, AddBias_U0_start_full_n, "AddBias_U0_start_full_n");
    sc_trace(mVcdFile, AddBias_U0_start_write, "AddBias_U0_start_write");
#endif

    }
}

Linear::~Linear() {
    if (mVcdFile) 
        sc_close_vcd_trace_file(mVcdFile);

    delete MatMul_U0;
    delete AddBias_U0;
    delete pipe_V_data_V_U;
    delete pipe_V_id_V_U;
    delete pipe_V_dest_V_U;
    delete pipe_V_user_V_U;
    delete pipe_V_last_V_U;
    delete start_for_AddBias_U0_U;
}

void Linear::thread_ap_var_for_const0() {
    ap_var_for_const0 = ap_const_logic_1;
}

void Linear::thread_ap_clk_no_reset_() {
    if ( ap_rst.read() == ap_const_logic_1) {
        start_once_reg = ap_const_logic_0;
    } else {
        if ((esl_seteq<1,1,1>(real_start.read(), ap_const_logic_1) && 
             esl_seteq<1,1,1>(ap_const_logic_0, internal_ap_ready.read()))) {
            start_once_reg = ap_const_logic_1;
        } else if (esl_seteq<1,1,1>(internal_ap_ready.read(), ap_const_logic_1)) {
            start_once_reg = ap_const_logic_0;
        }
    }
}

void Linear::thread_AddBias_U0_ap_continue() {
    AddBias_U0_ap_continue = ap_continue.read();
}

void Linear::thread_AddBias_U0_ap_start() {
    AddBias_U0_ap_start = start_for_AddBias_U0_empty_n.read();
}

void Linear::thread_AddBias_U0_start_full_n() {
    AddBias_U0_start_full_n = ap_const_logic_1;
}

void Linear::thread_AddBias_U0_start_write() {
    AddBias_U0_start_write = ap_const_logic_0;
}

void Linear::thread_MatMul_U0_ap_continue() {
    MatMul_U0_ap_continue = ap_const_logic_1;
}

void Linear::thread_MatMul_U0_ap_start() {
    MatMul_U0_ap_start = real_start.read();
}

void Linear::thread_ap_done() {
    ap_done = AddBias_U0_ap_done.read();
}

void Linear::thread_ap_idle() {
    ap_idle = (MatMul_U0_ap_idle.read() & AddBias_U0_ap_idle.read());
}

void Linear::thread_ap_ready() {
    ap_ready = internal_ap_ready.read();
}

void Linear::thread_ap_sync_continue() {
    ap_sync_continue = ap_continue.read();
}

void Linear::thread_ap_sync_done() {
    ap_sync_done = AddBias_U0_ap_done.read();
}

void Linear::thread_ap_sync_ready() {
    ap_sync_ready = MatMul_U0_ap_ready.read();
}

void Linear::thread_in_r_TREADY() {
    in_r_TREADY = MatMul_U0_in_r_TREADY.read();
}

void Linear::thread_internal_ap_ready() {
    internal_ap_ready = ap_sync_ready.read();
}

void Linear::thread_out_V_data_V_din() {
    out_V_data_V_din = AddBias_U0_out_V_data_V_din.read();
}

void Linear::thread_out_V_data_V_write() {
    out_V_data_V_write = AddBias_U0_out_V_data_V_write.read();
}

void Linear::thread_out_V_dest_V_din() {
    out_V_dest_V_din = AddBias_U0_out_V_dest_V_din.read();
}

void Linear::thread_out_V_dest_V_write() {
    out_V_dest_V_write = AddBias_U0_out_V_dest_V_write.read();
}

void Linear::thread_out_V_id_V_din() {
    out_V_id_V_din = AddBias_U0_out_V_id_V_din.read();
}

void Linear::thread_out_V_id_V_write() {
    out_V_id_V_write = AddBias_U0_out_V_id_V_write.read();
}

void Linear::thread_out_V_last_V_din() {
    out_V_last_V_din = AddBias_U0_out_V_last_V_din.read();
}

void Linear::thread_out_V_last_V_write() {
    out_V_last_V_write = AddBias_U0_out_V_last_V_write.read();
}

void Linear::thread_out_V_user_V_din() {
    out_V_user_V_din = AddBias_U0_out_V_user_V_din.read();
}

void Linear::thread_out_V_user_V_write() {
    out_V_user_V_write = AddBias_U0_out_V_user_V_write.read();
}

void Linear::thread_real_start() {
    if ((esl_seteq<1,1,1>(start_full_n.read(), ap_const_logic_0) && 
         esl_seteq<1,1,1>(ap_const_logic_0, start_once_reg.read()))) {
        real_start = ap_const_logic_0;
    } else {
        real_start = ap_start.read();
    }
}

void Linear::thread_start_for_AddBias_U0_din() {
    start_for_AddBias_U0_din =  (sc_lv<1>) (ap_const_logic_1);
}

void Linear::thread_start_out() {
    start_out = real_start.read();
}

void Linear::thread_start_write() {
    if ((esl_seteq<1,1,1>(ap_const_logic_0, start_once_reg.read()) && 
         esl_seteq<1,1,1>(real_start.read(), ap_const_logic_1))) {
        start_write = ap_const_logic_1;
    } else {
        start_write = ap_const_logic_0;
    }
}

}
