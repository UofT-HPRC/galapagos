// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2019.1
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#ifndef _lbus_fifo_read_HH_
#define _lbus_fifo_read_HH_

#include "systemc.h"
#include "AESL_pkg.h"

#include "mty2keep.h"

namespace ap_rtl {

struct lbus_fifo_read : public sc_module {
    // Port declarations 15
    sc_in_clk ap_clk;
    sc_in< sc_logic > ap_rst;
    sc_in< sc_lv<544> > lbus_fifo;
    sc_in< sc_lv<408> > lbus_fifo_pkt_end;
    sc_in< sc_lv<1> > lbus_fifo_empty_V;
    sc_in< sc_lv<1> > lbus_fifo_pkt_end_empty_V;
    sc_in< sc_lv<1> > lbus_fifo_valid_V;
    sc_in< sc_lv<1> > lbus_fifo_pkt_end_valid_V;
    sc_out< sc_lv<1> > lbus_fifo_re_V;
    sc_out< sc_lv<1> > lbus_fifo_pkt_end_re_V;
    sc_out< sc_lv<1> > error_V;
    sc_out< sc_lv<512> > m_axis_data_V;
    sc_out< sc_lv<64> > m_axis_keep_V;
    sc_out< sc_lv<1> > m_axis_last_V;
    sc_out< sc_lv<1> > m_axis_valid_V;


    // Module declarations
    lbus_fifo_read(sc_module_name name);
    SC_HAS_PROCESS(lbus_fifo_read);

    ~lbus_fifo_read();

    sc_trace_file* mVcdFile;

    ofstream mHdltvinHandle;
    ofstream mHdltvoutHandle;
    mty2keep* call_ret_mty2keep_fu_318;
    mty2keep* call_ret1_mty2keep_fu_324;
    mty2keep* call_ret2_mty2keep_fu_330;
    mty2keep* call_ret3_mty2keep_fu_336;
    sc_signal< sc_lv<512> > m_axis_databuf_V;
    sc_signal< sc_lv<16> > m_axis_keepbuf_V_1;
    sc_signal< sc_lv<1> > keep1mask_V;
    sc_signal< sc_lv<16> > m_axis_keepbuf_V_2;
    sc_signal< sc_lv<1> > keep2mask_V;
    sc_signal< sc_lv<16> > m_axis_keepbuf_V_3;
    sc_signal< sc_lv<1> > keep3mask_V;
    sc_signal< sc_lv<16> > m_axis_keepbuf_V_0;
    sc_signal< sc_lv<1> > m_axis_lastbuf_V;
    sc_signal< sc_lv<1> > m_axis_validbuf_V;
    sc_signal< sc_lv<128> > outbuf_data_V_3;
    sc_signal< sc_lv<128> > outbuf_data_V_2;
    sc_signal< sc_lv<128> > outbuf_data_V_1;
    sc_signal< sc_lv<128> > outbuf_data_V_0;
    sc_signal< sc_lv<4> > outbuf_mty_V_0;
    sc_signal< sc_lv<1> > outbuf_ena_V_0;
    sc_signal< sc_lv<4> > outbuf_mty_V_1;
    sc_signal< sc_lv<1> > outbuf_ena_V_1;
    sc_signal< sc_lv<4> > outbuf_mty_V_2;
    sc_signal< sc_lv<1> > outbuf_ena_V_2;
    sc_signal< sc_lv<4> > outbuf_mty_V_3;
    sc_signal< sc_lv<1> > outbuf_ena_V_3;
    sc_signal< sc_lv<1> > outbuf_eop_V_0;
    sc_signal< sc_lv<1> > outbuf_eop_V_1;
    sc_signal< sc_lv<1> > outbuf_eop_V_2;
    sc_signal< sc_lv<1> > outbuf_eop_V_3;
    sc_signal< sc_lv<1> > output_valid_V;
    sc_signal< sc_lv<1> > out_pktendbuf_ena_V_s;
    sc_signal< sc_lv<128> > out_pktendbuf_data_V;
    sc_signal< sc_lv<1> > out_pktendbuf_eop_V_s;
    sc_signal< sc_lv<4> > out_pktendbuf_mty_V_s;
    sc_signal< sc_lv<128> > out_pktendbuf_data_V_1;
    sc_signal< sc_lv<1> > out_pktendbuf_ena_V_1;
    sc_signal< sc_lv<1> > out_pktendbuf_eop_V_1;
    sc_signal< sc_lv<4> > out_pktendbuf_mty_V_1;
    sc_signal< sc_lv<128> > out_pktendbuf_data_V_2;
    sc_signal< sc_lv<1> > out_pktendbuf_ena_V_2;
    sc_signal< sc_lv<1> > out_pktendbuf_eop_V_2;
    sc_signal< sc_lv<4> > out_pktendbuf_mty_V_2;
    sc_signal< sc_logic > call_ret_mty2keep_fu_318_ap_ready;
    sc_signal< sc_lv<16> > call_ret_mty2keep_fu_318_ap_return;
    sc_signal< sc_logic > call_ret1_mty2keep_fu_324_ap_ready;
    sc_signal< sc_lv<16> > call_ret1_mty2keep_fu_324_ap_return;
    sc_signal< sc_logic > call_ret2_mty2keep_fu_330_ap_ready;
    sc_signal< sc_lv<16> > call_ret2_mty2keep_fu_330_ap_return;
    sc_signal< sc_logic > call_ret3_mty2keep_fu_336_ap_ready;
    sc_signal< sc_lv<16> > call_ret3_mty2keep_fu_336_ap_return;
    sc_signal< sc_lv<1> > ap_phi_mux_empty_phi_fu_294_p6;
    sc_signal< sc_lv<1> > ap_CS_fsm;
    sc_signal< sc_logic > ap_CS_fsm_state1;
    sc_signal< sc_lv<1> > out_pktendbuf_ena_V_1_load_fu_631_p1;
    sc_signal< sc_lv<1> > and_ln133_fu_635_p2;
    sc_signal< sc_lv<1> > ap_phi_mux_storemerge482_phi_fu_307_p6;
    sc_signal< sc_lv<512> > p_Result_1_fu_463_p5;
    sc_signal< sc_lv<1> > xor_ln113_fu_549_p2;
    sc_signal< sc_lv<1> > xor_ln114_fu_571_p2;
    sc_signal< sc_lv<1> > xor_ln115_fu_593_p2;
    sc_signal< sc_lv<1> > ret_V_20_fu_609_p2;
    sc_signal< sc_lv<128> > trunc_ln321_fu_641_p1;
    sc_signal< sc_lv<128> > trunc_ln321_1_fu_875_p1;
    sc_signal< sc_lv<1> > xor_ln146_fu_1280_p2;
    sc_signal< sc_lv<16> > rhs_V_fu_362_p3;
    sc_signal< sc_lv<16> > rhs_V_14_fu_384_p3;
    sc_signal< sc_lv<16> > rhs_V_15_fu_406_p3;
    sc_signal< sc_lv<16> > ret_V_21_fu_370_p2;
    sc_signal< sc_lv<16> > ret_V_22_fu_392_p2;
    sc_signal< sc_lv<16> > ret_V_23_fu_414_p2;
    sc_signal< sc_lv<1> > ret_V_24_fu_565_p2;
    sc_signal< sc_lv<1> > ret_V_25_fu_587_p2;
    sc_signal< sc_lv<1> > or_ln146_fu_1268_p2;
    sc_signal< sc_lv<1> > or_ln146_1_fu_1274_p2;
    sc_signal< sc_lv<1> > ap_NS_fsm;
    static const sc_logic ap_const_logic_1;
    static const sc_lv<1> ap_ST_fsm_state1;
    static const sc_lv<512> ap_const_lv512_lc_1;
    static const sc_lv<16> ap_const_lv16_0;
    static const sc_lv<1> ap_const_lv1_0;
    static const sc_lv<128> ap_const_lv128_lc_1;
    static const sc_lv<4> ap_const_lv4_0;
    static const sc_lv<32> ap_const_lv32_0;
    static const sc_lv<1> ap_const_lv1_1;
    static const sc_lv<16> ap_const_lv16_FFFF;
    static const sc_lv<32> ap_const_lv32_80;
    static const sc_lv<32> ap_const_lv32_82;
    static const sc_lv<32> ap_const_lv32_84;
    static const sc_lv<32> ap_const_lv32_87;
    static const sc_lv<32> ap_const_lv32_88;
    static const sc_lv<32> ap_const_lv32_107;
    static const sc_lv<32> ap_const_lv32_108;
    static const sc_lv<32> ap_const_lv32_10A;
    static const sc_lv<32> ap_const_lv32_10C;
    static const sc_lv<32> ap_const_lv32_10F;
    static const sc_lv<32> ap_const_lv32_110;
    static const sc_lv<32> ap_const_lv32_18F;
    static const sc_lv<32> ap_const_lv32_190;
    static const sc_lv<32> ap_const_lv32_192;
    static const sc_lv<32> ap_const_lv32_194;
    static const sc_lv<32> ap_const_lv32_197;
    static const sc_lv<32> ap_const_lv32_198;
    static const sc_lv<32> ap_const_lv32_217;
    static const sc_lv<32> ap_const_lv32_218;
    static const sc_lv<32> ap_const_lv32_21A;
    static const sc_lv<32> ap_const_lv32_21C;
    static const sc_lv<32> ap_const_lv32_21F;
    static const sc_logic ap_const_logic_0;
    static const bool ap_const_boolean_1;
    // Thread declarations
    void thread_ap_clk_no_reset_();
    void thread_and_ln133_fu_635_p2();
    void thread_ap_CS_fsm_state1();
    void thread_ap_phi_mux_empty_phi_fu_294_p6();
    void thread_ap_phi_mux_storemerge482_phi_fu_307_p6();
    void thread_error_V();
    void thread_lbus_fifo_pkt_end_re_V();
    void thread_lbus_fifo_re_V();
    void thread_m_axis_data_V();
    void thread_m_axis_keep_V();
    void thread_m_axis_last_V();
    void thread_m_axis_valid_V();
    void thread_or_ln146_1_fu_1274_p2();
    void thread_or_ln146_fu_1268_p2();
    void thread_out_pktendbuf_ena_V_1_load_fu_631_p1();
    void thread_p_Result_1_fu_463_p5();
    void thread_ret_V_20_fu_609_p2();
    void thread_ret_V_21_fu_370_p2();
    void thread_ret_V_22_fu_392_p2();
    void thread_ret_V_23_fu_414_p2();
    void thread_ret_V_24_fu_565_p2();
    void thread_ret_V_25_fu_587_p2();
    void thread_rhs_V_14_fu_384_p3();
    void thread_rhs_V_15_fu_406_p3();
    void thread_rhs_V_fu_362_p3();
    void thread_trunc_ln321_1_fu_875_p1();
    void thread_trunc_ln321_fu_641_p1();
    void thread_xor_ln113_fu_549_p2();
    void thread_xor_ln114_fu_571_p2();
    void thread_xor_ln115_fu_593_p2();
    void thread_xor_ln146_fu_1280_p2();
    void thread_ap_NS_fsm();
    void thread_hdltv_gen();
};

}

using namespace ap_rtl;

#endif