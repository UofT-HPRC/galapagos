// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2019.1
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#ifndef _ReadA123138_HH_
#define _ReadA123138_HH_

#include "systemc.h"
#include "AESL_pkg.h"

#include "ReadA123138_weights_0_5_0.h"
#include "ReadA123138_weights_0_5_1.h"
#include "ReadA123138_weights_0_5_2.h"
#include "ReadA123138_weights_0_5_3.h"
#include "ReadA123138_weights_0_5_4.h"
#include "ReadA123138_weights_0_5_5.h"
#include "ReadA123138_weights_0_5_6.h"
#include "ReadA123138_weights_0_5_7.h"
#include "ReadA123138_weights_0_5_8.h"
#include "ReadA123138_weights_0_5_9.h"
#include "ReadA123138_weights_0_5_10.h"
#include "ReadA123138_weights_0_5_11.h"
#include "ReadA123138_weights_0_5_12.h"
#include "ReadA123138_weights_0_5_13.h"
#include "ReadA123138_weights_0_5_14.h"
#include "ReadA123138_weights_0_5_15.h"
#include "ReadA123138_weights_0_5_16.h"
#include "ReadA123138_weights_0_5_17.h"
#include "ReadA123138_weights_0_5_18.h"
#include "ReadA123138_weights_0_5_19.h"
#include "ReadA123138_weights_0_5_20.h"
#include "ReadA123138_weights_0_5_21.h"
#include "ReadA123138_weights_0_5_22.h"
#include "ReadA123138_weights_0_5_23.h"
#include "ReadA123138_weights_0_5_24.h"
#include "ReadA123138_weights_0_5_25.h"
#include "ReadA123138_weights_0_5_26.h"
#include "ReadA123138_weights_0_5_27.h"
#include "ReadA123138_weights_0_5_28.h"
#include "ReadA123138_weights_0_5_29.h"
#include "ReadA123138_weights_0_5_30.h"
#include "ReadA123138_weights_0_5_31.h"

namespace ap_rtl {

struct ReadA123138 : public sc_module {
    // Port declarations 22
    sc_in_clk ap_clk;
    sc_in< sc_logic > ap_rst;
    sc_in< sc_logic > ap_start;
    sc_out< sc_logic > ap_done;
    sc_in< sc_logic > ap_continue;
    sc_out< sc_logic > ap_idle;
    sc_out< sc_logic > ap_ready;
    sc_in< sc_lv<32> > N_pipe_in_V_V5_dout;
    sc_in< sc_logic > N_pipe_in_V_V5_empty_n;
    sc_out< sc_logic > N_pipe_in_V_V5_read;
    sc_out< sc_lv<256> > a_pipes_1_V_V17_din;
    sc_in< sc_logic > a_pipes_1_V_V17_full_n;
    sc_out< sc_logic > a_pipes_1_V_V17_write;
    sc_out< sc_lv<256> > a_pipes_2_V_V22_din;
    sc_in< sc_logic > a_pipes_2_V_V22_full_n;
    sc_out< sc_logic > a_pipes_2_V_V22_write;
    sc_out< sc_lv<256> > a_pipes_3_V_V27_din;
    sc_in< sc_logic > a_pipes_3_V_V27_full_n;
    sc_out< sc_logic > a_pipes_3_V_V27_write;
    sc_out< sc_lv<256> > a_pipes_4_V_V32_din;
    sc_in< sc_logic > a_pipes_4_V_V32_full_n;
    sc_out< sc_logic > a_pipes_4_V_V32_write;


    // Module declarations
    ReadA123138(sc_module_name name);
    SC_HAS_PROCESS(ReadA123138);

    ~ReadA123138();

    sc_trace_file* mVcdFile;

    ReadA123138_weights_0_5_0* weights_0_5_0_U;
    ReadA123138_weights_0_5_1* weights_0_5_1_U;
    ReadA123138_weights_0_5_2* weights_0_5_2_U;
    ReadA123138_weights_0_5_3* weights_0_5_3_U;
    ReadA123138_weights_0_5_4* weights_0_5_4_U;
    ReadA123138_weights_0_5_5* weights_0_5_5_U;
    ReadA123138_weights_0_5_6* weights_0_5_6_U;
    ReadA123138_weights_0_5_7* weights_0_5_7_U;
    ReadA123138_weights_0_5_8* weights_0_5_8_U;
    ReadA123138_weights_0_5_9* weights_0_5_9_U;
    ReadA123138_weights_0_5_10* weights_0_5_10_U;
    ReadA123138_weights_0_5_11* weights_0_5_11_U;
    ReadA123138_weights_0_5_12* weights_0_5_12_U;
    ReadA123138_weights_0_5_13* weights_0_5_13_U;
    ReadA123138_weights_0_5_14* weights_0_5_14_U;
    ReadA123138_weights_0_5_15* weights_0_5_15_U;
    ReadA123138_weights_0_5_16* weights_0_5_16_U;
    ReadA123138_weights_0_5_17* weights_0_5_17_U;
    ReadA123138_weights_0_5_18* weights_0_5_18_U;
    ReadA123138_weights_0_5_19* weights_0_5_19_U;
    ReadA123138_weights_0_5_20* weights_0_5_20_U;
    ReadA123138_weights_0_5_21* weights_0_5_21_U;
    ReadA123138_weights_0_5_22* weights_0_5_22_U;
    ReadA123138_weights_0_5_23* weights_0_5_23_U;
    ReadA123138_weights_0_5_24* weights_0_5_24_U;
    ReadA123138_weights_0_5_25* weights_0_5_25_U;
    ReadA123138_weights_0_5_26* weights_0_5_26_U;
    ReadA123138_weights_0_5_27* weights_0_5_27_U;
    ReadA123138_weights_0_5_28* weights_0_5_28_U;
    ReadA123138_weights_0_5_29* weights_0_5_29_U;
    ReadA123138_weights_0_5_30* weights_0_5_30_U;
    ReadA123138_weights_0_5_31* weights_0_5_31_U;
    sc_signal< sc_logic > ap_done_reg;
    sc_signal< sc_lv<3> > ap_CS_fsm;
    sc_signal< sc_logic > ap_CS_fsm_state1;
    sc_signal< sc_lv<10> > weights_0_5_0_address0;
    sc_signal< sc_logic > weights_0_5_0_ce0;
    sc_signal< sc_lv<32> > weights_0_5_0_q0;
    sc_signal< sc_lv<10> > weights_0_5_1_address0;
    sc_signal< sc_logic > weights_0_5_1_ce0;
    sc_signal< sc_lv<32> > weights_0_5_1_q0;
    sc_signal< sc_lv<10> > weights_0_5_2_address0;
    sc_signal< sc_logic > weights_0_5_2_ce0;
    sc_signal< sc_lv<32> > weights_0_5_2_q0;
    sc_signal< sc_lv<10> > weights_0_5_3_address0;
    sc_signal< sc_logic > weights_0_5_3_ce0;
    sc_signal< sc_lv<32> > weights_0_5_3_q0;
    sc_signal< sc_lv<10> > weights_0_5_4_address0;
    sc_signal< sc_logic > weights_0_5_4_ce0;
    sc_signal< sc_lv<32> > weights_0_5_4_q0;
    sc_signal< sc_lv<10> > weights_0_5_5_address0;
    sc_signal< sc_logic > weights_0_5_5_ce0;
    sc_signal< sc_lv<32> > weights_0_5_5_q0;
    sc_signal< sc_lv<10> > weights_0_5_6_address0;
    sc_signal< sc_logic > weights_0_5_6_ce0;
    sc_signal< sc_lv<32> > weights_0_5_6_q0;
    sc_signal< sc_lv<10> > weights_0_5_7_address0;
    sc_signal< sc_logic > weights_0_5_7_ce0;
    sc_signal< sc_lv<32> > weights_0_5_7_q0;
    sc_signal< sc_lv<10> > weights_0_5_8_address0;
    sc_signal< sc_logic > weights_0_5_8_ce0;
    sc_signal< sc_lv<32> > weights_0_5_8_q0;
    sc_signal< sc_lv<10> > weights_0_5_9_address0;
    sc_signal< sc_logic > weights_0_5_9_ce0;
    sc_signal< sc_lv<32> > weights_0_5_9_q0;
    sc_signal< sc_lv<10> > weights_0_5_10_address0;
    sc_signal< sc_logic > weights_0_5_10_ce0;
    sc_signal< sc_lv<32> > weights_0_5_10_q0;
    sc_signal< sc_lv<10> > weights_0_5_11_address0;
    sc_signal< sc_logic > weights_0_5_11_ce0;
    sc_signal< sc_lv<32> > weights_0_5_11_q0;
    sc_signal< sc_lv<10> > weights_0_5_12_address0;
    sc_signal< sc_logic > weights_0_5_12_ce0;
    sc_signal< sc_lv<32> > weights_0_5_12_q0;
    sc_signal< sc_lv<10> > weights_0_5_13_address0;
    sc_signal< sc_logic > weights_0_5_13_ce0;
    sc_signal< sc_lv<32> > weights_0_5_13_q0;
    sc_signal< sc_lv<10> > weights_0_5_14_address0;
    sc_signal< sc_logic > weights_0_5_14_ce0;
    sc_signal< sc_lv<32> > weights_0_5_14_q0;
    sc_signal< sc_lv<10> > weights_0_5_15_address0;
    sc_signal< sc_logic > weights_0_5_15_ce0;
    sc_signal< sc_lv<32> > weights_0_5_15_q0;
    sc_signal< sc_lv<10> > weights_0_5_16_address0;
    sc_signal< sc_logic > weights_0_5_16_ce0;
    sc_signal< sc_lv<32> > weights_0_5_16_q0;
    sc_signal< sc_lv<10> > weights_0_5_17_address0;
    sc_signal< sc_logic > weights_0_5_17_ce0;
    sc_signal< sc_lv<32> > weights_0_5_17_q0;
    sc_signal< sc_lv<10> > weights_0_5_18_address0;
    sc_signal< sc_logic > weights_0_5_18_ce0;
    sc_signal< sc_lv<32> > weights_0_5_18_q0;
    sc_signal< sc_lv<10> > weights_0_5_19_address0;
    sc_signal< sc_logic > weights_0_5_19_ce0;
    sc_signal< sc_lv<32> > weights_0_5_19_q0;
    sc_signal< sc_lv<10> > weights_0_5_20_address0;
    sc_signal< sc_logic > weights_0_5_20_ce0;
    sc_signal< sc_lv<32> > weights_0_5_20_q0;
    sc_signal< sc_lv<10> > weights_0_5_21_address0;
    sc_signal< sc_logic > weights_0_5_21_ce0;
    sc_signal< sc_lv<32> > weights_0_5_21_q0;
    sc_signal< sc_lv<10> > weights_0_5_22_address0;
    sc_signal< sc_logic > weights_0_5_22_ce0;
    sc_signal< sc_lv<32> > weights_0_5_22_q0;
    sc_signal< sc_lv<10> > weights_0_5_23_address0;
    sc_signal< sc_logic > weights_0_5_23_ce0;
    sc_signal< sc_lv<32> > weights_0_5_23_q0;
    sc_signal< sc_lv<10> > weights_0_5_24_address0;
    sc_signal< sc_logic > weights_0_5_24_ce0;
    sc_signal< sc_lv<32> > weights_0_5_24_q0;
    sc_signal< sc_lv<10> > weights_0_5_25_address0;
    sc_signal< sc_logic > weights_0_5_25_ce0;
    sc_signal< sc_lv<32> > weights_0_5_25_q0;
    sc_signal< sc_lv<10> > weights_0_5_26_address0;
    sc_signal< sc_logic > weights_0_5_26_ce0;
    sc_signal< sc_lv<32> > weights_0_5_26_q0;
    sc_signal< sc_lv<10> > weights_0_5_27_address0;
    sc_signal< sc_logic > weights_0_5_27_ce0;
    sc_signal< sc_lv<32> > weights_0_5_27_q0;
    sc_signal< sc_lv<10> > weights_0_5_28_address0;
    sc_signal< sc_logic > weights_0_5_28_ce0;
    sc_signal< sc_lv<32> > weights_0_5_28_q0;
    sc_signal< sc_lv<10> > weights_0_5_29_address0;
    sc_signal< sc_logic > weights_0_5_29_ce0;
    sc_signal< sc_lv<32> > weights_0_5_29_q0;
    sc_signal< sc_lv<10> > weights_0_5_30_address0;
    sc_signal< sc_logic > weights_0_5_30_ce0;
    sc_signal< sc_lv<32> > weights_0_5_30_q0;
    sc_signal< sc_lv<10> > weights_0_5_31_address0;
    sc_signal< sc_logic > weights_0_5_31_ce0;
    sc_signal< sc_lv<32> > weights_0_5_31_q0;
    sc_signal< sc_logic > N_pipe_in_V_V5_blk_n;
    sc_signal< sc_logic > a_pipes_1_V_V17_blk_n;
    sc_signal< sc_logic > ap_CS_fsm_pp0_stage0;
    sc_signal< sc_logic > ap_enable_reg_pp0_iter1;
    sc_signal< bool > ap_block_pp0_stage0;
    sc_signal< sc_lv<1> > icmp_ln25_reg_848;
    sc_signal< sc_logic > a_pipes_2_V_V22_blk_n;
    sc_signal< sc_logic > a_pipes_3_V_V27_blk_n;
    sc_signal< sc_logic > a_pipes_4_V_V32_blk_n;
    sc_signal< sc_lv<42> > indvar_flatten_reg_644;
    sc_signal< sc_lv<10> > n_0_reg_655;
    sc_signal< sc_lv<42> > bound_fu_686_p2;
    sc_signal< sc_lv<42> > bound_reg_843;
    sc_signal< bool > ap_block_state1;
    sc_signal< sc_lv<1> > icmp_ln25_fu_692_p2;
    sc_signal< bool > ap_block_state2_pp0_stage0_iter0;
    sc_signal< bool > ap_block_state3_pp0_stage0_iter1;
    sc_signal< bool > ap_block_pp0_stage0_11001;
    sc_signal< sc_lv<42> > add_ln25_fu_697_p2;
    sc_signal< sc_logic > ap_enable_reg_pp0_iter0;
    sc_signal< sc_lv<10> > n_fu_753_p2;
    sc_signal< bool > ap_block_pp0_stage0_subdone;
    sc_signal< sc_logic > ap_condition_pp0_exit_iter0_state2;
    sc_signal< sc_lv<64> > zext_ln32_fu_717_p1;
    sc_signal< bool > ap_block_pp0_stage0_01001;
    sc_signal< sc_lv<40> > tmp_fu_674_p3;
    sc_signal< sc_lv<42> > p_shl_fu_666_p3;
    sc_signal< sc_lv<42> > p_shl190_fu_682_p1;
    sc_signal< sc_lv<1> > icmp_ln27_fu_703_p2;
    sc_signal< sc_lv<10> > select_ln27_fu_709_p3;
    sc_signal< sc_logic > ap_CS_fsm_state4;
    sc_signal< sc_lv<3> > ap_NS_fsm;
    sc_signal< sc_logic > ap_idle_pp0;
    sc_signal< sc_logic > ap_enable_pp0;
    static const sc_logic ap_const_logic_1;
    static const sc_logic ap_const_logic_0;
    static const sc_lv<3> ap_ST_fsm_state1;
    static const sc_lv<3> ap_ST_fsm_pp0_stage0;
    static const sc_lv<3> ap_ST_fsm_state4;
    static const sc_lv<32> ap_const_lv32_0;
    static const bool ap_const_boolean_1;
    static const sc_lv<32> ap_const_lv32_1;
    static const bool ap_const_boolean_0;
    static const sc_lv<1> ap_const_lv1_0;
    static const sc_lv<1> ap_const_lv1_1;
    static const sc_lv<42> ap_const_lv42_0;
    static const sc_lv<10> ap_const_lv10_0;
    static const sc_lv<8> ap_const_lv8_0;
    static const sc_lv<42> ap_const_lv42_1;
    static const sc_lv<10> ap_const_lv10_300;
    static const sc_lv<10> ap_const_lv10_1;
    static const sc_lv<32> ap_const_lv32_2;
    // Thread declarations
    void thread_ap_clk_no_reset_();
    void thread_N_pipe_in_V_V5_blk_n();
    void thread_N_pipe_in_V_V5_read();
    void thread_a_pipes_1_V_V17_blk_n();
    void thread_a_pipes_1_V_V17_din();
    void thread_a_pipes_1_V_V17_write();
    void thread_a_pipes_2_V_V22_blk_n();
    void thread_a_pipes_2_V_V22_din();
    void thread_a_pipes_2_V_V22_write();
    void thread_a_pipes_3_V_V27_blk_n();
    void thread_a_pipes_3_V_V27_din();
    void thread_a_pipes_3_V_V27_write();
    void thread_a_pipes_4_V_V32_blk_n();
    void thread_a_pipes_4_V_V32_din();
    void thread_a_pipes_4_V_V32_write();
    void thread_add_ln25_fu_697_p2();
    void thread_ap_CS_fsm_pp0_stage0();
    void thread_ap_CS_fsm_state1();
    void thread_ap_CS_fsm_state4();
    void thread_ap_block_pp0_stage0();
    void thread_ap_block_pp0_stage0_01001();
    void thread_ap_block_pp0_stage0_11001();
    void thread_ap_block_pp0_stage0_subdone();
    void thread_ap_block_state1();
    void thread_ap_block_state2_pp0_stage0_iter0();
    void thread_ap_block_state3_pp0_stage0_iter1();
    void thread_ap_condition_pp0_exit_iter0_state2();
    void thread_ap_done();
    void thread_ap_enable_pp0();
    void thread_ap_idle();
    void thread_ap_idle_pp0();
    void thread_ap_ready();
    void thread_bound_fu_686_p2();
    void thread_icmp_ln25_fu_692_p2();
    void thread_icmp_ln27_fu_703_p2();
    void thread_n_fu_753_p2();
    void thread_p_shl190_fu_682_p1();
    void thread_p_shl_fu_666_p3();
    void thread_select_ln27_fu_709_p3();
    void thread_tmp_fu_674_p3();
    void thread_weights_0_5_0_address0();
    void thread_weights_0_5_0_ce0();
    void thread_weights_0_5_10_address0();
    void thread_weights_0_5_10_ce0();
    void thread_weights_0_5_11_address0();
    void thread_weights_0_5_11_ce0();
    void thread_weights_0_5_12_address0();
    void thread_weights_0_5_12_ce0();
    void thread_weights_0_5_13_address0();
    void thread_weights_0_5_13_ce0();
    void thread_weights_0_5_14_address0();
    void thread_weights_0_5_14_ce0();
    void thread_weights_0_5_15_address0();
    void thread_weights_0_5_15_ce0();
    void thread_weights_0_5_16_address0();
    void thread_weights_0_5_16_ce0();
    void thread_weights_0_5_17_address0();
    void thread_weights_0_5_17_ce0();
    void thread_weights_0_5_18_address0();
    void thread_weights_0_5_18_ce0();
    void thread_weights_0_5_19_address0();
    void thread_weights_0_5_19_ce0();
    void thread_weights_0_5_1_address0();
    void thread_weights_0_5_1_ce0();
    void thread_weights_0_5_20_address0();
    void thread_weights_0_5_20_ce0();
    void thread_weights_0_5_21_address0();
    void thread_weights_0_5_21_ce0();
    void thread_weights_0_5_22_address0();
    void thread_weights_0_5_22_ce0();
    void thread_weights_0_5_23_address0();
    void thread_weights_0_5_23_ce0();
    void thread_weights_0_5_24_address0();
    void thread_weights_0_5_24_ce0();
    void thread_weights_0_5_25_address0();
    void thread_weights_0_5_25_ce0();
    void thread_weights_0_5_26_address0();
    void thread_weights_0_5_26_ce0();
    void thread_weights_0_5_27_address0();
    void thread_weights_0_5_27_ce0();
    void thread_weights_0_5_28_address0();
    void thread_weights_0_5_28_ce0();
    void thread_weights_0_5_29_address0();
    void thread_weights_0_5_29_ce0();
    void thread_weights_0_5_2_address0();
    void thread_weights_0_5_2_ce0();
    void thread_weights_0_5_30_address0();
    void thread_weights_0_5_30_ce0();
    void thread_weights_0_5_31_address0();
    void thread_weights_0_5_31_ce0();
    void thread_weights_0_5_3_address0();
    void thread_weights_0_5_3_ce0();
    void thread_weights_0_5_4_address0();
    void thread_weights_0_5_4_ce0();
    void thread_weights_0_5_5_address0();
    void thread_weights_0_5_5_ce0();
    void thread_weights_0_5_6_address0();
    void thread_weights_0_5_6_ce0();
    void thread_weights_0_5_7_address0();
    void thread_weights_0_5_7_ce0();
    void thread_weights_0_5_8_address0();
    void thread_weights_0_5_8_ce0();
    void thread_weights_0_5_9_address0();
    void thread_weights_0_5_9_ce0();
    void thread_zext_ln32_fu_717_p1();
    void thread_ap_NS_fsm();
};

}

using namespace ap_rtl;

#endif