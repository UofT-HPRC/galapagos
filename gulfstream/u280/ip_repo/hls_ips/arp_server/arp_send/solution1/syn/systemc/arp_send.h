// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2019.1
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#ifndef _arp_send_HH_
#define _arp_send_HH_

#include "systemc.h"
#include "AESL_pkg.h"

#include "arp_send_mux_42_32_1_1.h"

namespace ap_rtl {

struct arp_send : public sc_module {
    // Port declarations 18
    sc_in_clk ap_clk;
    sc_in< sc_logic > ap_rst;
    sc_in< sc_lv<48> > myMac_V;
    sc_in< sc_lv<32> > myIP_V;
    sc_in< sc_lv<32> > gateway_V;
    sc_in< sc_lv<32> > netmask_V;
    sc_out< sc_lv<8> > arptable_addr_V;
    sc_in< sc_lv<80> > arptable_data_V;
    sc_in< sc_lv<80> > call_for_responce_Mac_IP_V;
    sc_in< sc_lv<1> > call_for_responce_valid_V;
    sc_in< sc_lv<32> > lookup_req_V;
    sc_out< sc_lv<48> > lookup_result_V;
    sc_out< sc_lv<2> > arp_status_V;
    sc_out< sc_lv<512> > arp_out_data_V;
    sc_out< sc_lv<64> > arp_out_keep_V;
    sc_out< sc_lv<1> > arp_out_last_V;
    sc_out< sc_lv<1> > arp_out_valid_V;
    sc_in< sc_lv<1> > arp_out_ready_V;


    // Module declarations
    arp_send(sc_module_name name);
    SC_HAS_PROCESS(arp_send);

    ~arp_send();

    sc_trace_file* mVcdFile;

    ofstream mHdltvinHandle;
    ofstream mHdltvoutHandle;
    arp_send_mux_42_32_1_1<1,1,32,32,32,32,2,32>* arp_send_mux_42_32_1_1_U1;
    arp_send_mux_42_32_1_1<1,1,32,32,32,32,2,32>* arp_send_mux_42_32_1_1_U2;
    sc_signal< sc_lv<8> > arptable_addr_reg_V;
    sc_signal< sc_lv<48> > lookup_result_reg_V;
    sc_signal< sc_lv<2> > arp_status_reg_V;
    sc_signal< sc_lv<48> > arp_out_reg_dst_mac_s;
    sc_signal< sc_lv<48> > myMacReg_V;
    sc_signal< sc_lv<34> > arp_out_reg_fixed_he;
    sc_signal< sc_lv<4> > arp_out_reg_opcode_V;
    sc_signal< sc_lv<48> > arp_out_reg_src_mac_s;
    sc_signal< sc_lv<32> > arp_out_reg_src_ip_V;
    sc_signal< sc_lv<32> > arp_out_reg_dst_ip_V;
    sc_signal< sc_lv<1> > arp_out_reg_valid_V;
    sc_signal< sc_lv<2> > send_req_fifo_rdidx_s;
    sc_signal< sc_lv<2> > send_req_fifo_wridx_s;
    sc_signal< sc_lv<32> > myIPReg_V;
    sc_signal< sc_lv<32> > send_req_fifo_V_0;
    sc_signal< sc_lv<32> > send_req_fifo_V_1;
    sc_signal< sc_lv<32> > send_req_fifo_V_2;
    sc_signal< sc_lv<32> > send_req_fifo_V_3;
    sc_signal< sc_lv<2> > send_resp_fifo_wridx;
    sc_signal< sc_lv<32> > send_resp_fifo_ip_V_s;
    sc_signal< sc_lv<32> > send_resp_fifo_ip_V_1;
    sc_signal< sc_lv<32> > send_resp_fifo_ip_V_2;
    sc_signal< sc_lv<32> > send_resp_fifo_ip_V_3;
    sc_signal< sc_lv<2> > send_resp_fifo_rdidx;
    sc_signal< sc_lv<48> > send_resp_fifo_mac_V_3;
    sc_signal< sc_lv<48> > send_resp_fifo_mac_V;
    sc_signal< sc_lv<48> > send_resp_fifo_mac_V_1;
    sc_signal< sc_lv<48> > send_resp_fifo_mac_V_2;
    sc_signal< sc_lv<1> > call_for_responce_re;
    sc_signal< sc_lv<80> > call_for_responce_re_1;
    sc_signal< sc_lv<32> > arp_timeout_cnt_V;
    sc_signal< sc_lv<32> > lookup_req_issued0_V;
    sc_signal< sc_lv<32> > lookup_req_issued1_V;
    sc_signal< sc_lv<1> > lookup_req_valid_reg_2;
    sc_signal< sc_lv<1> > lookup_req_valid_reg;
    sc_signal< sc_lv<1> > lookup_req_valid_reg_1;
    sc_signal< sc_lv<32> > netmaskReg_V;
    sc_signal< sc_lv<32> > gatewayReg_V;
    sc_signal< sc_lv<32> > lookup_req_reg_V;
    sc_signal< sc_lv<32> > lookup_req_issued_V;
    sc_signal< sc_lv<1> > ap_phi_mux_send_req_fifo_V_0_fl_phi_fu_296_p6;
    sc_signal< sc_lv<1> > ap_CS_fsm;
    sc_signal< sc_logic > ap_CS_fsm_state1;
    sc_signal< sc_lv<1> > icmp_ln883_fu_725_p2;
    sc_signal< sc_lv<1> > icmp_ln883_1_fu_832_p2;
    sc_signal< sc_lv<1> > ap_phi_mux_send_resp_fifo_ip_V_5_phi_fu_310_p6;
    sc_signal< sc_lv<1> > or_ln321_fu_970_p2;
    sc_signal< sc_lv<1> > ap_phi_mux_send_resp_fifo_ip_V_6_phi_fu_324_p4;
    sc_signal< sc_lv<1> > call_for_responce_re_2_load_fu_952_p1;
    sc_signal< sc_lv<32> > select_ln321_fu_977_p3;
    sc_signal< sc_lv<32> > ap_phi_mux_send_resp_fifo_ip_V_7_phi_fu_334_p4;
    sc_signal< sc_lv<1> > or_ln321_1_fu_992_p2;
    sc_signal< sc_lv<1> > ap_phi_mux_send_resp_fifo_ip_V_8_phi_fu_343_p4;
    sc_signal< sc_lv<32> > select_ln321_2_fu_1007_p3;
    sc_signal< sc_lv<32> > ap_phi_mux_send_resp_fifo_ip_V_9_phi_fu_353_p4;
    sc_signal< sc_lv<1> > or_ln321_2_fu_1022_p2;
    sc_signal< sc_lv<1> > ap_phi_mux_send_resp_fifo_ip_V_10_phi_fu_362_p4;
    sc_signal< sc_lv<32> > select_ln321_4_fu_1043_p3;
    sc_signal< sc_lv<32> > ap_phi_mux_send_resp_fifo_ip_V_11_phi_fu_372_p4;
    sc_signal< sc_lv<1> > or_ln321_4_fu_1082_p2;
    sc_signal< sc_lv<1> > ap_phi_mux_send_resp_fifo_ip_V_12_phi_fu_381_p4;
    sc_signal< sc_lv<32> > select_ln321_6_fu_1097_p3;
    sc_signal< sc_lv<32> > ap_phi_mux_send_resp_fifo_ip_V_13_phi_fu_391_p4;
    sc_signal< sc_lv<1> > grp_fu_536_p2;
    sc_signal< sc_lv<1> > ap_phi_mux_send_req_fifo_V_0_fl_1_phi_fu_400_p8;
    sc_signal< sc_lv<1> > and_ln142_fu_1164_p2;
    sc_signal< sc_lv<1> > icmp_ln883_4_fu_1293_p2;
    sc_signal< sc_lv<1> > ret_V_fu_1323_p2;
    sc_signal< sc_lv<32> > select_ln321_7_fu_1210_p3;
    sc_signal< sc_lv<32> > ap_phi_mux_send_req_fifo_V_0_ne_phi_fu_415_p8;
    sc_signal< sc_lv<32> > select_ln321_14_fu_1329_p3;
    sc_signal< sc_lv<1> > grp_fu_549_p2;
    sc_signal< sc_lv<1> > ap_phi_mux_send_req_fifo_V_1_fl_phi_fu_428_p8;
    sc_signal< sc_lv<32> > select_ln321_9_fu_1227_p3;
    sc_signal< sc_lv<32> > ap_phi_mux_send_req_fifo_V_1_ne_phi_fu_443_p8;
    sc_signal< sc_lv<32> > select_ln321_16_fu_1346_p3;
    sc_signal< sc_lv<1> > grp_fu_562_p2;
    sc_signal< sc_lv<1> > ap_phi_mux_send_req_fifo_V_2_fl_phi_fu_456_p8;
    sc_signal< sc_lv<32> > select_ln321_11_fu_1244_p3;
    sc_signal< sc_lv<32> > ap_phi_mux_send_req_fifo_V_2_ne_phi_fu_471_p8;
    sc_signal< sc_lv<32> > select_ln321_18_fu_1363_p3;
    sc_signal< sc_lv<1> > or_ln321_9_fu_1265_p2;
    sc_signal< sc_lv<1> > ap_phi_mux_send_req_fifo_V_3_fl_phi_fu_484_p8;
    sc_signal< sc_lv<1> > or_ln321_14_fu_1384_p2;
    sc_signal< sc_lv<32> > select_ln321_13_fu_1280_p3;
    sc_signal< sc_lv<32> > ap_phi_mux_send_req_fifo_V_3_ne_phi_fu_499_p8;
    sc_signal< sc_lv<32> > select_ln321_20_fu_1399_p3;
    sc_signal< sc_lv<8> > select_ln174_fu_1588_p3;
    sc_signal< sc_lv<1> > icmp_ln883_7_fu_1552_p2;
    sc_signal< sc_lv<1> > icmp_ln879_1_fu_1412_p2;
    sc_signal< sc_lv<1> > p_Result_2_fu_1442_p3;
    sc_signal< sc_lv<1> > icmp_ln883_5_fu_1454_p2;
    sc_signal< sc_lv<48> > select_ln9_2_fu_900_p3;
    sc_signal< sc_lv<32> > tmp_1_fu_796_p6;
    sc_signal< sc_lv<32> > tmp_2_fu_914_p6;
    sc_signal< sc_lv<2> > add_ln700_fu_816_p2;
    sc_signal< sc_lv<2> > grp_fu_591_p2;
    sc_signal< sc_lv<2> > add_ln700_2_fu_1140_p2;
    sc_signal< sc_lv<2> > t_V_2_load_fu_760_p1;
    sc_signal< sc_lv<2> > add_ln700_1_fu_934_p2;
    sc_signal< sc_lv<1> > icmp_ln9_fu_860_p2;
    sc_signal< sc_lv<1> > or_ln9_fu_886_p2;
    sc_signal< sc_lv<1> > icmp_ln9_2_fu_872_p2;
    sc_signal< sc_lv<32> > add_ln700_5_fu_1494_p2;
    sc_signal< sc_lv<1> > or_ln161_fu_1478_p2;
    sc_signal< sc_lv<1> > icmp_ln883_6_fu_1488_p2;
    sc_signal< sc_lv<1> > icmp_ln178_fu_1606_p2;
    sc_signal< sc_lv<32> > select_ln181_fu_1624_p3;
    sc_signal< sc_lv<1> > grp_fu_531_p2;
    sc_signal< sc_lv<1> > grp_fu_544_p2;
    sc_signal< sc_lv<1> > grp_fu_557_p2;
    sc_signal< sc_lv<48> > zext_ln215_fu_646_p1;
    sc_signal< sc_lv<16> > zext_ln215_1_fu_654_p1;
    sc_signal< sc_lv<1> > icmp_ln9_1_fu_866_p2;
    sc_signal< sc_lv<48> > select_ln9_fu_878_p3;
    sc_signal< sc_lv<48> > select_ln9_1_fu_892_p3;
    sc_signal< sc_lv<1> > icmp_ln321_fu_964_p2;
    sc_signal< sc_lv<32> > trunc_ln647_fu_960_p1;
    sc_signal< sc_lv<1> > icmp_ln321_1_fu_986_p2;
    sc_signal< sc_lv<32> > select_ln321_1_fu_999_p3;
    sc_signal< sc_lv<1> > icmp_ln321_2_fu_1016_p2;
    sc_signal< sc_lv<1> > or_ln321_3_fu_1029_p2;
    sc_signal< sc_lv<32> > select_ln321_3_fu_1035_p3;
    sc_signal< sc_lv<1> > icmp_ln321_4_fu_1058_p2;
    sc_signal< sc_lv<1> > icmp_ln321_5_fu_1064_p2;
    sc_signal< sc_lv<1> > and_ln321_fu_1070_p2;
    sc_signal< sc_lv<1> > icmp_ln321_3_fu_1052_p2;
    sc_signal< sc_lv<1> > and_ln321_1_fu_1076_p2;
    sc_signal< sc_lv<32> > select_ln321_5_fu_1089_p3;
    sc_signal< sc_lv<1> > icmp_ln883_2_fu_1152_p2;
    sc_signal< sc_lv<1> > icmp_ln883_3_fu_1158_p2;
    sc_signal< sc_lv<32> > select_ln321_8_fu_1219_p3;
    sc_signal< sc_lv<1> > grp_fu_570_p2;
    sc_signal< sc_lv<32> > select_ln321_10_fu_1236_p3;
    sc_signal< sc_lv<1> > grp_fu_581_p2;
    sc_signal< sc_lv<1> > grp_fu_586_p2;
    sc_signal< sc_lv<1> > and_ln321_2_fu_1253_p2;
    sc_signal< sc_lv<1> > grp_fu_576_p2;
    sc_signal< sc_lv<1> > and_ln321_3_fu_1259_p2;
    sc_signal< sc_lv<32> > select_ln321_12_fu_1272_p3;
    sc_signal< sc_lv<32> > trunc_ln647_1_fu_1289_p1;
    sc_signal< sc_lv<29> > trunc_ln647_2_fu_1299_p1;
    sc_signal< sc_lv<1> > icmp_ln879_fu_1303_p2;
    sc_signal< sc_lv<1> > tmp_fu_1309_p3;
    sc_signal< sc_lv<1> > rhs_V_fu_1317_p2;
    sc_signal< sc_lv<32> > select_ln321_15_fu_1338_p3;
    sc_signal< sc_lv<32> > select_ln321_17_fu_1355_p3;
    sc_signal< sc_lv<1> > and_ln321_4_fu_1372_p2;
    sc_signal< sc_lv<1> > and_ln321_5_fu_1378_p2;
    sc_signal< sc_lv<32> > select_ln321_19_fu_1391_p3;
    sc_signal< sc_lv<32> > trunc_ln357_fu_1408_p1;
    sc_signal< sc_lv<8> > trunc_ln647_3_fu_1450_p1;
    sc_signal< sc_lv<8> > trunc_ln647_4_fu_1484_p1;
    sc_signal< sc_lv<8> > trunc_ln647_5_fu_1548_p1;
    sc_signal< sc_lv<32> > xor_ln879_fu_1562_p2;
    sc_signal< sc_lv<32> > and_ln879_fu_1568_p2;
    sc_signal< sc_lv<1> > icmp_ln879_2_fu_1574_p2;
    sc_signal< sc_lv<8> > trunc_ln647_6_fu_1584_p1;
    sc_signal< sc_lv<1> > ap_NS_fsm;
    sc_signal< bool > ap_condition_201;
    static const sc_logic ap_const_logic_1;
    static const sc_lv<1> ap_ST_fsm_state1;
    static const sc_lv<8> ap_const_lv8_0;
    static const sc_lv<48> ap_const_lv48_0;
    static const sc_lv<2> ap_const_lv2_0;
    static const sc_lv<34> ap_const_lv34_0;
    static const sc_lv<4> ap_const_lv4_0;
    static const sc_lv<32> ap_const_lv32_0;
    static const sc_lv<1> ap_const_lv1_0;
    static const sc_lv<80> ap_const_lv80_0;
    static const sc_lv<1> ap_const_lv1_1;
    static const sc_lv<2> ap_const_lv2_1;
    static const sc_lv<2> ap_const_lv2_2;
    static const sc_lv<48> ap_const_lv48_FFFFFFFFFFFF;
    static const sc_lv<34> ap_const_lv34_108000604;
    static const sc_lv<4> ap_const_lv4_1;
    static const sc_lv<4> ap_const_lv4_2;
    static const sc_lv<2> ap_const_lv2_3;
    static const sc_lv<32> ap_const_lv32_20;
    static const sc_lv<32> ap_const_lv32_4F;
    static const sc_lv<16> ap_const_lv16_806;
    static const sc_lv<176> ap_const_lv176_lc_1;
    static const sc_lv<64> ap_const_lv64_FFFFFFFFFFFFFFF0;
    static const sc_lv<64> ap_const_lv64_0;
    static const sc_lv<29> ap_const_lv29_0;
    static const sc_lv<32> ap_const_lv32_1D;
    static const sc_lv<32> ap_const_lv32_1F;
    static const sc_lv<32> ap_const_lv32_1;
    static const sc_logic ap_const_logic_0;
    static const bool ap_const_boolean_1;
    // Thread declarations
    void thread_ap_clk_no_reset_();
    void thread_add_ln700_1_fu_934_p2();
    void thread_add_ln700_2_fu_1140_p2();
    void thread_add_ln700_5_fu_1494_p2();
    void thread_add_ln700_fu_816_p2();
    void thread_and_ln142_fu_1164_p2();
    void thread_and_ln321_1_fu_1076_p2();
    void thread_and_ln321_2_fu_1253_p2();
    void thread_and_ln321_3_fu_1259_p2();
    void thread_and_ln321_4_fu_1372_p2();
    void thread_and_ln321_5_fu_1378_p2();
    void thread_and_ln321_fu_1070_p2();
    void thread_and_ln879_fu_1568_p2();
    void thread_ap_CS_fsm_state1();
    void thread_ap_condition_201();
    void thread_ap_phi_mux_send_req_fifo_V_0_fl_1_phi_fu_400_p8();
    void thread_ap_phi_mux_send_req_fifo_V_0_fl_phi_fu_296_p6();
    void thread_ap_phi_mux_send_req_fifo_V_0_ne_phi_fu_415_p8();
    void thread_ap_phi_mux_send_req_fifo_V_1_fl_phi_fu_428_p8();
    void thread_ap_phi_mux_send_req_fifo_V_1_ne_phi_fu_443_p8();
    void thread_ap_phi_mux_send_req_fifo_V_2_fl_phi_fu_456_p8();
    void thread_ap_phi_mux_send_req_fifo_V_2_ne_phi_fu_471_p8();
    void thread_ap_phi_mux_send_req_fifo_V_3_fl_phi_fu_484_p8();
    void thread_ap_phi_mux_send_req_fifo_V_3_ne_phi_fu_499_p8();
    void thread_ap_phi_mux_send_resp_fifo_ip_V_10_phi_fu_362_p4();
    void thread_ap_phi_mux_send_resp_fifo_ip_V_11_phi_fu_372_p4();
    void thread_ap_phi_mux_send_resp_fifo_ip_V_12_phi_fu_381_p4();
    void thread_ap_phi_mux_send_resp_fifo_ip_V_13_phi_fu_391_p4();
    void thread_ap_phi_mux_send_resp_fifo_ip_V_5_phi_fu_310_p6();
    void thread_ap_phi_mux_send_resp_fifo_ip_V_6_phi_fu_324_p4();
    void thread_ap_phi_mux_send_resp_fifo_ip_V_7_phi_fu_334_p4();
    void thread_ap_phi_mux_send_resp_fifo_ip_V_8_phi_fu_343_p4();
    void thread_ap_phi_mux_send_resp_fifo_ip_V_9_phi_fu_353_p4();
    void thread_arp_out_data_V();
    void thread_arp_out_keep_V();
    void thread_arp_out_last_V();
    void thread_arp_out_valid_V();
    void thread_arp_status_V();
    void thread_arptable_addr_V();
    void thread_call_for_responce_re_2_load_fu_952_p1();
    void thread_grp_fu_531_p2();
    void thread_grp_fu_536_p2();
    void thread_grp_fu_544_p2();
    void thread_grp_fu_549_p2();
    void thread_grp_fu_557_p2();
    void thread_grp_fu_562_p2();
    void thread_grp_fu_570_p2();
    void thread_grp_fu_576_p2();
    void thread_grp_fu_581_p2();
    void thread_grp_fu_586_p2();
    void thread_grp_fu_591_p2();
    void thread_icmp_ln178_fu_1606_p2();
    void thread_icmp_ln321_1_fu_986_p2();
    void thread_icmp_ln321_2_fu_1016_p2();
    void thread_icmp_ln321_3_fu_1052_p2();
    void thread_icmp_ln321_4_fu_1058_p2();
    void thread_icmp_ln321_5_fu_1064_p2();
    void thread_icmp_ln321_fu_964_p2();
    void thread_icmp_ln879_1_fu_1412_p2();
    void thread_icmp_ln879_2_fu_1574_p2();
    void thread_icmp_ln879_fu_1303_p2();
    void thread_icmp_ln883_1_fu_832_p2();
    void thread_icmp_ln883_2_fu_1152_p2();
    void thread_icmp_ln883_3_fu_1158_p2();
    void thread_icmp_ln883_4_fu_1293_p2();
    void thread_icmp_ln883_5_fu_1454_p2();
    void thread_icmp_ln883_6_fu_1488_p2();
    void thread_icmp_ln883_7_fu_1552_p2();
    void thread_icmp_ln883_fu_725_p2();
    void thread_icmp_ln9_1_fu_866_p2();
    void thread_icmp_ln9_2_fu_872_p2();
    void thread_icmp_ln9_fu_860_p2();
    void thread_lookup_result_V();
    void thread_or_ln161_fu_1478_p2();
    void thread_or_ln321_14_fu_1384_p2();
    void thread_or_ln321_1_fu_992_p2();
    void thread_or_ln321_2_fu_1022_p2();
    void thread_or_ln321_3_fu_1029_p2();
    void thread_or_ln321_4_fu_1082_p2();
    void thread_or_ln321_9_fu_1265_p2();
    void thread_or_ln321_fu_970_p2();
    void thread_or_ln9_fu_886_p2();
    void thread_p_Result_2_fu_1442_p3();
    void thread_ret_V_fu_1323_p2();
    void thread_rhs_V_fu_1317_p2();
    void thread_select_ln174_fu_1588_p3();
    void thread_select_ln181_fu_1624_p3();
    void thread_select_ln321_10_fu_1236_p3();
    void thread_select_ln321_11_fu_1244_p3();
    void thread_select_ln321_12_fu_1272_p3();
    void thread_select_ln321_13_fu_1280_p3();
    void thread_select_ln321_14_fu_1329_p3();
    void thread_select_ln321_15_fu_1338_p3();
    void thread_select_ln321_16_fu_1346_p3();
    void thread_select_ln321_17_fu_1355_p3();
    void thread_select_ln321_18_fu_1363_p3();
    void thread_select_ln321_19_fu_1391_p3();
    void thread_select_ln321_1_fu_999_p3();
    void thread_select_ln321_20_fu_1399_p3();
    void thread_select_ln321_2_fu_1007_p3();
    void thread_select_ln321_3_fu_1035_p3();
    void thread_select_ln321_4_fu_1043_p3();
    void thread_select_ln321_5_fu_1089_p3();
    void thread_select_ln321_6_fu_1097_p3();
    void thread_select_ln321_7_fu_1210_p3();
    void thread_select_ln321_8_fu_1219_p3();
    void thread_select_ln321_9_fu_1227_p3();
    void thread_select_ln321_fu_977_p3();
    void thread_select_ln9_1_fu_892_p3();
    void thread_select_ln9_2_fu_900_p3();
    void thread_select_ln9_fu_878_p3();
    void thread_t_V_2_load_fu_760_p1();
    void thread_tmp_fu_1309_p3();
    void thread_trunc_ln357_fu_1408_p1();
    void thread_trunc_ln647_1_fu_1289_p1();
    void thread_trunc_ln647_2_fu_1299_p1();
    void thread_trunc_ln647_3_fu_1450_p1();
    void thread_trunc_ln647_4_fu_1484_p1();
    void thread_trunc_ln647_5_fu_1548_p1();
    void thread_trunc_ln647_6_fu_1584_p1();
    void thread_trunc_ln647_fu_960_p1();
    void thread_xor_ln879_fu_1562_p2();
    void thread_zext_ln215_1_fu_654_p1();
    void thread_zext_ln215_fu_646_p1();
    void thread_ap_NS_fsm();
    void thread_hdltv_gen();
};

}

using namespace ap_rtl;

#endif
