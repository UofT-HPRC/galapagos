// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2019.1
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#include "mty2keep.h"
#include "AESL_pkg.h"

using namespace std;

namespace ap_rtl {

const sc_logic mty2keep::ap_const_logic_1 = sc_dt::Log_1;
const bool mty2keep::ap_const_boolean_1 = true;
const sc_lv<4> mty2keep::ap_const_lv4_F = "1111";
const sc_lv<4> mty2keep::ap_const_lv4_E = "1110";
const sc_lv<4> mty2keep::ap_const_lv4_D = "1101";
const sc_lv<4> mty2keep::ap_const_lv4_C = "1100";
const sc_lv<4> mty2keep::ap_const_lv4_B = "1011";
const sc_lv<4> mty2keep::ap_const_lv4_A = "1010";
const sc_lv<4> mty2keep::ap_const_lv4_9 = "1001";
const sc_lv<32> mty2keep::ap_const_lv32_3 = "11";
const sc_lv<1> mty2keep::ap_const_lv1_1 = "1";
const sc_lv<4> mty2keep::ap_const_lv4_7 = "111";
const sc_lv<4> mty2keep::ap_const_lv4_6 = "110";
const sc_lv<4> mty2keep::ap_const_lv4_5 = "101";
const sc_lv<32> mty2keep::ap_const_lv32_2 = "10";
const sc_lv<2> mty2keep::ap_const_lv2_0 = "00";
const sc_lv<4> mty2keep::ap_const_lv4_3 = "11";
const sc_lv<32> mty2keep::ap_const_lv32_1 = "1";
const sc_lv<3> mty2keep::ap_const_lv3_0 = "000";
const sc_lv<4> mty2keep::ap_const_lv4_0 = "0000";
const sc_logic mty2keep::ap_const_logic_0 = sc_dt::Log_0;

mty2keep::mty2keep(sc_module_name name) : sc_module(name), mVcdFile(0) {

    SC_METHOD(thread_ap_ready);

    SC_METHOD(thread_ap_return);
    sensitive << ( ena_V );
    sensitive << ( ret_V_fu_70_p2 );
    sensitive << ( ret_V_1_fu_82_p2 );
    sensitive << ( ret_V_2_fu_94_p2 );
    sensitive << ( ret_V_3_fu_106_p2 );
    sensitive << ( ret_V_4_fu_118_p2 );
    sensitive << ( ret_V_5_fu_130_p2 );
    sensitive << ( ret_V_6_fu_142_p2 );
    sensitive << ( ret_V_7_fu_162_p2 );
    sensitive << ( ret_V_8_fu_174_p2 );
    sensitive << ( ret_V_9_fu_186_p2 );
    sensitive << ( ret_V_10_fu_198_p2 );
    sensitive << ( ret_V_11_fu_220_p2 );
    sensitive << ( ret_V_12_fu_232_p2 );
    sensitive << ( ret_V_13_fu_254_p2 );
    sensitive << ( ret_V_14_fu_266_p2 );

    SC_METHOD(thread_ret_V_10_fu_198_p2);
    sensitive << ( ena_V );
    sensitive << ( rhs_V_9_fu_192_p2 );

    SC_METHOD(thread_ret_V_11_fu_220_p2);
    sensitive << ( ena_V );
    sensitive << ( rhs_V_10_fu_214_p2 );

    SC_METHOD(thread_ret_V_12_fu_232_p2);
    sensitive << ( ena_V );
    sensitive << ( rhs_V_11_fu_226_p2 );

    SC_METHOD(thread_ret_V_13_fu_254_p2);
    sensitive << ( ena_V );
    sensitive << ( rhs_V_12_fu_248_p2 );

    SC_METHOD(thread_ret_V_14_fu_266_p2);
    sensitive << ( ena_V );
    sensitive << ( rhs_V_13_fu_260_p2 );

    SC_METHOD(thread_ret_V_1_fu_82_p2);
    sensitive << ( ena_V );
    sensitive << ( rhs_V_1_fu_76_p2 );

    SC_METHOD(thread_ret_V_2_fu_94_p2);
    sensitive << ( ena_V );
    sensitive << ( rhs_V_2_fu_88_p2 );

    SC_METHOD(thread_ret_V_3_fu_106_p2);
    sensitive << ( ena_V );
    sensitive << ( rhs_V_3_fu_100_p2 );

    SC_METHOD(thread_ret_V_4_fu_118_p2);
    sensitive << ( ena_V );
    sensitive << ( rhs_V_4_fu_112_p2 );

    SC_METHOD(thread_ret_V_5_fu_130_p2);
    sensitive << ( ena_V );
    sensitive << ( rhs_V_5_fu_124_p2 );

    SC_METHOD(thread_ret_V_6_fu_142_p2);
    sensitive << ( ena_V );
    sensitive << ( rhs_V_6_fu_136_p2 );

    SC_METHOD(thread_ret_V_7_fu_162_p2);
    sensitive << ( ena_V );
    sensitive << ( xor_ln1355_fu_156_p2 );

    SC_METHOD(thread_ret_V_8_fu_174_p2);
    sensitive << ( ena_V );
    sensitive << ( rhs_V_7_fu_168_p2 );

    SC_METHOD(thread_ret_V_9_fu_186_p2);
    sensitive << ( ena_V );
    sensitive << ( rhs_V_8_fu_180_p2 );

    SC_METHOD(thread_ret_V_fu_70_p2);
    sensitive << ( ena_V );
    sensitive << ( rhs_V_fu_64_p2 );

    SC_METHOD(thread_rhs_V_10_fu_214_p2);
    sensitive << ( tmp_1_fu_204_p4 );

    SC_METHOD(thread_rhs_V_11_fu_226_p2);
    sensitive << ( mty_V );

    SC_METHOD(thread_rhs_V_12_fu_248_p2);
    sensitive << ( tmp_2_fu_238_p4 );

    SC_METHOD(thread_rhs_V_13_fu_260_p2);
    sensitive << ( mty_V );

    SC_METHOD(thread_rhs_V_1_fu_76_p2);
    sensitive << ( mty_V );

    SC_METHOD(thread_rhs_V_2_fu_88_p2);
    sensitive << ( mty_V );

    SC_METHOD(thread_rhs_V_3_fu_100_p2);
    sensitive << ( mty_V );

    SC_METHOD(thread_rhs_V_4_fu_112_p2);
    sensitive << ( mty_V );

    SC_METHOD(thread_rhs_V_5_fu_124_p2);
    sensitive << ( mty_V );

    SC_METHOD(thread_rhs_V_6_fu_136_p2);
    sensitive << ( mty_V );

    SC_METHOD(thread_rhs_V_7_fu_168_p2);
    sensitive << ( mty_V );

    SC_METHOD(thread_rhs_V_8_fu_180_p2);
    sensitive << ( mty_V );

    SC_METHOD(thread_rhs_V_9_fu_192_p2);
    sensitive << ( mty_V );

    SC_METHOD(thread_rhs_V_fu_64_p2);
    sensitive << ( mty_V );

    SC_METHOD(thread_tmp_1_fu_204_p4);
    sensitive << ( mty_V );

    SC_METHOD(thread_tmp_2_fu_238_p4);
    sensitive << ( mty_V );

    SC_METHOD(thread_tmp_fu_148_p3);
    sensitive << ( mty_V );

    SC_METHOD(thread_xor_ln1355_fu_156_p2);
    sensitive << ( tmp_fu_148_p3 );

    static int apTFileNum = 0;
    stringstream apTFilenSS;
    apTFilenSS << "mty2keep_sc_trace_" << apTFileNum ++;
    string apTFn = apTFilenSS.str();
    mVcdFile = sc_create_vcd_trace_file(apTFn.c_str());
    mVcdFile->set_time_unit(1, SC_PS);
    if (1) {
#ifdef __HLS_TRACE_LEVEL_PORT_HIER__
    sc_trace(mVcdFile, ap_ready, "(port)ap_ready");
    sc_trace(mVcdFile, mty_V, "(port)mty_V");
    sc_trace(mVcdFile, ena_V, "(port)ena_V");
    sc_trace(mVcdFile, ap_return, "(port)ap_return");
#endif
#ifdef __HLS_TRACE_LEVEL_INT__
    sc_trace(mVcdFile, rhs_V_fu_64_p2, "rhs_V_fu_64_p2");
    sc_trace(mVcdFile, rhs_V_1_fu_76_p2, "rhs_V_1_fu_76_p2");
    sc_trace(mVcdFile, rhs_V_2_fu_88_p2, "rhs_V_2_fu_88_p2");
    sc_trace(mVcdFile, rhs_V_3_fu_100_p2, "rhs_V_3_fu_100_p2");
    sc_trace(mVcdFile, rhs_V_4_fu_112_p2, "rhs_V_4_fu_112_p2");
    sc_trace(mVcdFile, rhs_V_5_fu_124_p2, "rhs_V_5_fu_124_p2");
    sc_trace(mVcdFile, rhs_V_6_fu_136_p2, "rhs_V_6_fu_136_p2");
    sc_trace(mVcdFile, tmp_fu_148_p3, "tmp_fu_148_p3");
    sc_trace(mVcdFile, xor_ln1355_fu_156_p2, "xor_ln1355_fu_156_p2");
    sc_trace(mVcdFile, rhs_V_7_fu_168_p2, "rhs_V_7_fu_168_p2");
    sc_trace(mVcdFile, rhs_V_8_fu_180_p2, "rhs_V_8_fu_180_p2");
    sc_trace(mVcdFile, rhs_V_9_fu_192_p2, "rhs_V_9_fu_192_p2");
    sc_trace(mVcdFile, tmp_1_fu_204_p4, "tmp_1_fu_204_p4");
    sc_trace(mVcdFile, rhs_V_10_fu_214_p2, "rhs_V_10_fu_214_p2");
    sc_trace(mVcdFile, rhs_V_11_fu_226_p2, "rhs_V_11_fu_226_p2");
    sc_trace(mVcdFile, tmp_2_fu_238_p4, "tmp_2_fu_238_p4");
    sc_trace(mVcdFile, rhs_V_12_fu_248_p2, "rhs_V_12_fu_248_p2");
    sc_trace(mVcdFile, rhs_V_13_fu_260_p2, "rhs_V_13_fu_260_p2");
    sc_trace(mVcdFile, ret_V_fu_70_p2, "ret_V_fu_70_p2");
    sc_trace(mVcdFile, ret_V_1_fu_82_p2, "ret_V_1_fu_82_p2");
    sc_trace(mVcdFile, ret_V_2_fu_94_p2, "ret_V_2_fu_94_p2");
    sc_trace(mVcdFile, ret_V_3_fu_106_p2, "ret_V_3_fu_106_p2");
    sc_trace(mVcdFile, ret_V_4_fu_118_p2, "ret_V_4_fu_118_p2");
    sc_trace(mVcdFile, ret_V_5_fu_130_p2, "ret_V_5_fu_130_p2");
    sc_trace(mVcdFile, ret_V_6_fu_142_p2, "ret_V_6_fu_142_p2");
    sc_trace(mVcdFile, ret_V_7_fu_162_p2, "ret_V_7_fu_162_p2");
    sc_trace(mVcdFile, ret_V_8_fu_174_p2, "ret_V_8_fu_174_p2");
    sc_trace(mVcdFile, ret_V_9_fu_186_p2, "ret_V_9_fu_186_p2");
    sc_trace(mVcdFile, ret_V_10_fu_198_p2, "ret_V_10_fu_198_p2");
    sc_trace(mVcdFile, ret_V_11_fu_220_p2, "ret_V_11_fu_220_p2");
    sc_trace(mVcdFile, ret_V_12_fu_232_p2, "ret_V_12_fu_232_p2");
    sc_trace(mVcdFile, ret_V_13_fu_254_p2, "ret_V_13_fu_254_p2");
    sc_trace(mVcdFile, ret_V_14_fu_266_p2, "ret_V_14_fu_266_p2");
#endif

    }
}

mty2keep::~mty2keep() {
    if (mVcdFile) 
        sc_close_vcd_trace_file(mVcdFile);

}

void mty2keep::thread_ap_ready() {
    ap_ready = ap_const_logic_1;
}

void mty2keep::thread_ap_return() {
    ap_return = esl_concat<15,1>(esl_concat<14,1>(esl_concat<13,1>(esl_concat<12,1>(esl_concat<11,1>(esl_concat<10,1>(esl_concat<9,1>(esl_concat<8,1>(esl_concat<7,1>(esl_concat<6,1>(esl_concat<5,1>(esl_concat<4,1>(esl_concat<3,1>(esl_concat<2,1>(esl_concat<1,1>(ena_V.read(), ret_V_fu_70_p2.read()), ret_V_1_fu_82_p2.read()), ret_V_2_fu_94_p2.read()), ret_V_3_fu_106_p2.read()), ret_V_4_fu_118_p2.read()), ret_V_5_fu_130_p2.read()), ret_V_6_fu_142_p2.read()), ret_V_7_fu_162_p2.read()), ret_V_8_fu_174_p2.read()), ret_V_9_fu_186_p2.read()), ret_V_10_fu_198_p2.read()), ret_V_11_fu_220_p2.read()), ret_V_12_fu_232_p2.read()), ret_V_13_fu_254_p2.read()), ret_V_14_fu_266_p2.read());
}

void mty2keep::thread_ret_V_10_fu_198_p2() {
    ret_V_10_fu_198_p2 = (rhs_V_9_fu_192_p2.read() & ena_V.read());
}

void mty2keep::thread_ret_V_11_fu_220_p2() {
    ret_V_11_fu_220_p2 = (rhs_V_10_fu_214_p2.read() & ena_V.read());
}

void mty2keep::thread_ret_V_12_fu_232_p2() {
    ret_V_12_fu_232_p2 = (rhs_V_11_fu_226_p2.read() & ena_V.read());
}

void mty2keep::thread_ret_V_13_fu_254_p2() {
    ret_V_13_fu_254_p2 = (rhs_V_12_fu_248_p2.read() & ena_V.read());
}

void mty2keep::thread_ret_V_14_fu_266_p2() {
    ret_V_14_fu_266_p2 = (rhs_V_13_fu_260_p2.read() & ena_V.read());
}

void mty2keep::thread_ret_V_1_fu_82_p2() {
    ret_V_1_fu_82_p2 = (rhs_V_1_fu_76_p2.read() & ena_V.read());
}

void mty2keep::thread_ret_V_2_fu_94_p2() {
    ret_V_2_fu_94_p2 = (rhs_V_2_fu_88_p2.read() & ena_V.read());
}

void mty2keep::thread_ret_V_3_fu_106_p2() {
    ret_V_3_fu_106_p2 = (rhs_V_3_fu_100_p2.read() & ena_V.read());
}

void mty2keep::thread_ret_V_4_fu_118_p2() {
    ret_V_4_fu_118_p2 = (rhs_V_4_fu_112_p2.read() & ena_V.read());
}

void mty2keep::thread_ret_V_5_fu_130_p2() {
    ret_V_5_fu_130_p2 = (rhs_V_5_fu_124_p2.read() & ena_V.read());
}

void mty2keep::thread_ret_V_6_fu_142_p2() {
    ret_V_6_fu_142_p2 = (rhs_V_6_fu_136_p2.read() & ena_V.read());
}

void mty2keep::thread_ret_V_7_fu_162_p2() {
    ret_V_7_fu_162_p2 = (ena_V.read() & xor_ln1355_fu_156_p2.read());
}

void mty2keep::thread_ret_V_8_fu_174_p2() {
    ret_V_8_fu_174_p2 = (rhs_V_7_fu_168_p2.read() & ena_V.read());
}

void mty2keep::thread_ret_V_9_fu_186_p2() {
    ret_V_9_fu_186_p2 = (rhs_V_8_fu_180_p2.read() & ena_V.read());
}

void mty2keep::thread_ret_V_fu_70_p2() {
    ret_V_fu_70_p2 = (rhs_V_fu_64_p2.read() & ena_V.read());
}

void mty2keep::thread_rhs_V_10_fu_214_p2() {
    rhs_V_10_fu_214_p2 = (!tmp_1_fu_204_p4.read().is_01() || !ap_const_lv2_0.is_01())? sc_lv<1>(): sc_lv<1>(tmp_1_fu_204_p4.read() == ap_const_lv2_0);
}

void mty2keep::thread_rhs_V_11_fu_226_p2() {
    rhs_V_11_fu_226_p2 = (!mty_V.read().is_01() || !ap_const_lv4_3.is_01())? sc_lv<1>(): (sc_biguint<4>(mty_V.read()) < sc_biguint<4>(ap_const_lv4_3));
}

void mty2keep::thread_rhs_V_12_fu_248_p2() {
    rhs_V_12_fu_248_p2 = (!tmp_2_fu_238_p4.read().is_01() || !ap_const_lv3_0.is_01())? sc_lv<1>(): sc_lv<1>(tmp_2_fu_238_p4.read() == ap_const_lv3_0);
}

void mty2keep::thread_rhs_V_13_fu_260_p2() {
    rhs_V_13_fu_260_p2 = (!mty_V.read().is_01() || !ap_const_lv4_0.is_01())? sc_lv<1>(): sc_lv<1>(mty_V.read() == ap_const_lv4_0);
}

void mty2keep::thread_rhs_V_1_fu_76_p2() {
    rhs_V_1_fu_76_p2 = (!mty_V.read().is_01() || !ap_const_lv4_E.is_01())? sc_lv<1>(): (sc_biguint<4>(mty_V.read()) < sc_biguint<4>(ap_const_lv4_E));
}

void mty2keep::thread_rhs_V_2_fu_88_p2() {
    rhs_V_2_fu_88_p2 = (!mty_V.read().is_01() || !ap_const_lv4_D.is_01())? sc_lv<1>(): (sc_biguint<4>(mty_V.read()) < sc_biguint<4>(ap_const_lv4_D));
}

void mty2keep::thread_rhs_V_3_fu_100_p2() {
    rhs_V_3_fu_100_p2 = (!mty_V.read().is_01() || !ap_const_lv4_C.is_01())? sc_lv<1>(): (sc_biguint<4>(mty_V.read()) < sc_biguint<4>(ap_const_lv4_C));
}

void mty2keep::thread_rhs_V_4_fu_112_p2() {
    rhs_V_4_fu_112_p2 = (!mty_V.read().is_01() || !ap_const_lv4_B.is_01())? sc_lv<1>(): (sc_biguint<4>(mty_V.read()) < sc_biguint<4>(ap_const_lv4_B));
}

void mty2keep::thread_rhs_V_5_fu_124_p2() {
    rhs_V_5_fu_124_p2 = (!mty_V.read().is_01() || !ap_const_lv4_A.is_01())? sc_lv<1>(): (sc_biguint<4>(mty_V.read()) < sc_biguint<4>(ap_const_lv4_A));
}

void mty2keep::thread_rhs_V_6_fu_136_p2() {
    rhs_V_6_fu_136_p2 = (!mty_V.read().is_01() || !ap_const_lv4_9.is_01())? sc_lv<1>(): (sc_biguint<4>(mty_V.read()) < sc_biguint<4>(ap_const_lv4_9));
}

void mty2keep::thread_rhs_V_7_fu_168_p2() {
    rhs_V_7_fu_168_p2 = (!mty_V.read().is_01() || !ap_const_lv4_7.is_01())? sc_lv<1>(): (sc_biguint<4>(mty_V.read()) < sc_biguint<4>(ap_const_lv4_7));
}

void mty2keep::thread_rhs_V_8_fu_180_p2() {
    rhs_V_8_fu_180_p2 = (!mty_V.read().is_01() || !ap_const_lv4_6.is_01())? sc_lv<1>(): (sc_biguint<4>(mty_V.read()) < sc_biguint<4>(ap_const_lv4_6));
}

void mty2keep::thread_rhs_V_9_fu_192_p2() {
    rhs_V_9_fu_192_p2 = (!mty_V.read().is_01() || !ap_const_lv4_5.is_01())? sc_lv<1>(): (sc_biguint<4>(mty_V.read()) < sc_biguint<4>(ap_const_lv4_5));
}

void mty2keep::thread_rhs_V_fu_64_p2() {
    rhs_V_fu_64_p2 = (!mty_V.read().is_01() || !ap_const_lv4_F.is_01())? sc_lv<1>(): sc_lv<1>(mty_V.read() != ap_const_lv4_F);
}

void mty2keep::thread_tmp_1_fu_204_p4() {
    tmp_1_fu_204_p4 = mty_V.read().range(3, 2);
}

void mty2keep::thread_tmp_2_fu_238_p4() {
    tmp_2_fu_238_p4 = mty_V.read().range(3, 1);
}

void mty2keep::thread_tmp_fu_148_p3() {
    tmp_fu_148_p3 = mty_V.read().range(3, 3);
}

void mty2keep::thread_xor_ln1355_fu_156_p2() {
    xor_ln1355_fu_156_p2 = (tmp_fu_148_p3.read() ^ ap_const_lv1_1);
}

}

