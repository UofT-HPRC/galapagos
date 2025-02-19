// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2019.1
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#include "PSInterface.h"
#include "AESL_pkg.h"

using namespace std;

namespace ap_rtl {

const int PSInterface::C_S_AXI_DATA_WIDTH = "100000";
const sc_logic PSInterface::ap_const_logic_1 = sc_dt::Log_1;
const bool PSInterface::ap_const_boolean_1 = true;
const sc_logic PSInterface::ap_const_logic_0 = sc_dt::Log_0;
const sc_lv<32> PSInterface::ap_const_lv32_20 = "100000";
const sc_lv<32> PSInterface::ap_const_lv32_3F = "111111";

PSInterface::PSInterface(sc_module_name name) : sc_module(name), mVcdFile(0) {
    PSInterface_AXILiteS_s_axi_U = new PSInterface_AXILiteS_s_axi<C_S_AXI_AXILITES_ADDR_WIDTH,C_S_AXI_AXILITES_DATA_WIDTH>("PSInterface_AXILiteS_s_axi_U");
    PSInterface_AXILiteS_s_axi_U->AWVALID(s_axi_AXILiteS_AWVALID);
    PSInterface_AXILiteS_s_axi_U->AWREADY(s_axi_AXILiteS_AWREADY);
    PSInterface_AXILiteS_s_axi_U->AWADDR(s_axi_AXILiteS_AWADDR);
    PSInterface_AXILiteS_s_axi_U->WVALID(s_axi_AXILiteS_WVALID);
    PSInterface_AXILiteS_s_axi_U->WREADY(s_axi_AXILiteS_WREADY);
    PSInterface_AXILiteS_s_axi_U->WDATA(s_axi_AXILiteS_WDATA);
    PSInterface_AXILiteS_s_axi_U->WSTRB(s_axi_AXILiteS_WSTRB);
    PSInterface_AXILiteS_s_axi_U->ARVALID(s_axi_AXILiteS_ARVALID);
    PSInterface_AXILiteS_s_axi_U->ARREADY(s_axi_AXILiteS_ARREADY);
    PSInterface_AXILiteS_s_axi_U->ARADDR(s_axi_AXILiteS_ARADDR);
    PSInterface_AXILiteS_s_axi_U->RVALID(s_axi_AXILiteS_RVALID);
    PSInterface_AXILiteS_s_axi_U->RREADY(s_axi_AXILiteS_RREADY);
    PSInterface_AXILiteS_s_axi_U->RDATA(s_axi_AXILiteS_RDATA);
    PSInterface_AXILiteS_s_axi_U->RRESP(s_axi_AXILiteS_RRESP);
    PSInterface_AXILiteS_s_axi_U->BVALID(s_axi_AXILiteS_BVALID);
    PSInterface_AXILiteS_s_axi_U->BREADY(s_axi_AXILiteS_BREADY);
    PSInterface_AXILiteS_s_axi_U->BRESP(s_axi_AXILiteS_BRESP);
    PSInterface_AXILiteS_s_axi_U->ACLK(ap_clk);
    PSInterface_AXILiteS_s_axi_U->ARESET(ap_rst_n_inv);
    PSInterface_AXILiteS_s_axi_U->ACLK_EN(ap_var_for_const0);
    PSInterface_AXILiteS_s_axi_U->axil_start_V(axil_start_V);
    PSInterface_AXILiteS_s_axi_U->axil_pkt_num_V(axil_pkt_num_V);
    PSInterface_AXILiteS_s_axi_U->axil_pkt_len_V(axil_pkt_len_V);
    PSInterface_AXILiteS_s_axi_U->axil_remote_ip_V(axil_remote_ip_V);
    PSInterface_AXILiteS_s_axi_U->axil_remote_port_V(axil_remote_port_V);
    PSInterface_AXILiteS_s_axi_U->axil_local_port_V(axil_local_port_V);
    PSInterface_AXILiteS_s_axi_U->axil_tx_timeElapse_high_V(axil_tx_timeElapse_high_V);
    PSInterface_AXILiteS_s_axi_U->axil_tx_timeElapse_high_V_ap_vld(axil_tx_timeElapse_high_V_ap_vld);
    PSInterface_AXILiteS_s_axi_U->axil_tx_timeElapse_low_V(axil_tx_timeElapse_low_V);
    PSInterface_AXILiteS_s_axi_U->axil_tx_timeElapse_low_V_ap_vld(axil_tx_timeElapse_low_V_ap_vld);
    PSInterface_AXILiteS_s_axi_U->axil_tx_done_V(axil_tx_done_V);
    PSInterface_AXILiteS_s_axi_U->axil_tx_done_V_ap_vld(axil_tx_done_V_ap_vld);
    PSInterface_AXILiteS_s_axi_U->axil_latency_sum_high_V(axil_latency_sum_high_V);
    PSInterface_AXILiteS_s_axi_U->axil_latency_sum_high_V_ap_vld(axil_latency_sum_high_V_ap_vld);
    PSInterface_AXILiteS_s_axi_U->axil_latency_sum_low_V(axil_latency_sum_low_V);
    PSInterface_AXILiteS_s_axi_U->axil_latency_sum_low_V_ap_vld(axil_latency_sum_low_V_ap_vld);
    PSInterface_AXILiteS_s_axi_U->axil_rx_timeElaspe_high_V(axil_rx_timeElaspe_high_V);
    PSInterface_AXILiteS_s_axi_U->axil_rx_timeElaspe_high_V_ap_vld(axil_rx_timeElaspe_high_V_ap_vld);
    PSInterface_AXILiteS_s_axi_U->axil_rx_timeElaspe_low_V(axil_rx_timeElaspe_low_V);
    PSInterface_AXILiteS_s_axi_U->axil_rx_timeElaspe_low_V_ap_vld(axil_rx_timeElaspe_low_V_ap_vld);
    PSInterface_AXILiteS_s_axi_U->axil_rx_done_V(axil_rx_done_V);
    PSInterface_AXILiteS_s_axi_U->axil_rx_done_V_ap_vld(axil_rx_done_V_ap_vld);
    PSInterface_AXILiteS_s_axi_U->axil_rx_error_V(axil_rx_error_V);
    PSInterface_AXILiteS_s_axi_U->axil_rx_error_V_ap_vld(axil_rx_error_V_ap_vld);
    PSInterface_AXILiteS_s_axi_U->axil_rx_curr_cnt_V(rx_cnt_V);
    PSInterface_AXILiteS_s_axi_U->axil_rx_curr_cnt_V_ap_vld(axil_rx_curr_cnt_V_ap_vld);

    SC_METHOD(thread_ap_rst_n_inv);
    sensitive << ( ap_rst_n );

    SC_METHOD(thread_axil_latency_sum_high_V);
    sensitive << ( latency_sum_V );

    SC_METHOD(thread_axil_latency_sum_high_V_ap_vld);

    SC_METHOD(thread_axil_latency_sum_low_V);
    sensitive << ( latency_sum_V );

    SC_METHOD(thread_axil_latency_sum_low_V_ap_vld);

    SC_METHOD(thread_axil_rx_curr_cnt_V_ap_vld);

    SC_METHOD(thread_axil_rx_done_V);
    sensitive << ( rx_done_V );

    SC_METHOD(thread_axil_rx_done_V_ap_vld);

    SC_METHOD(thread_axil_rx_error_V);
    sensitive << ( rx_error_V );

    SC_METHOD(thread_axil_rx_error_V_ap_vld);

    SC_METHOD(thread_axil_rx_timeElaspe_high_V);
    sensitive << ( rx_timeElapse_V );

    SC_METHOD(thread_axil_rx_timeElaspe_high_V_ap_vld);

    SC_METHOD(thread_axil_rx_timeElaspe_low_V);
    sensitive << ( rx_timeElapse_V );

    SC_METHOD(thread_axil_rx_timeElaspe_low_V_ap_vld);

    SC_METHOD(thread_axil_tx_done_V);
    sensitive << ( tx_done_V );

    SC_METHOD(thread_axil_tx_done_V_ap_vld);

    SC_METHOD(thread_axil_tx_timeElapse_high_V);
    sensitive << ( tx_timeElapse_V );

    SC_METHOD(thread_axil_tx_timeElapse_high_V_ap_vld);

    SC_METHOD(thread_axil_tx_timeElapse_low_V);
    sensitive << ( tx_timeElapse_V );

    SC_METHOD(thread_axil_tx_timeElapse_low_V_ap_vld);

    SC_METHOD(thread_local_port_V);
    sensitive << ( axil_local_port_V );

    SC_METHOD(thread_pkt_len_V);
    sensitive << ( axil_pkt_len_V );

    SC_METHOD(thread_pkt_num_V);
    sensitive << ( axil_pkt_num_V );

    SC_METHOD(thread_remote_ip_V);
    sensitive << ( axil_remote_ip_V );

    SC_METHOD(thread_remote_port_V);
    sensitive << ( axil_remote_port_V );

    SC_METHOD(thread_start_V);
    sensitive << ( axil_start_V );

    SC_THREAD(thread_hdltv_gen);
    sensitive << ( ap_virtual_clock.pos() );

    SC_THREAD(thread_ap_var_for_const0);

    static int apTFileNum = 0;
    stringstream apTFilenSS;
    apTFilenSS << "PSInterface_sc_trace_" << apTFileNum ++;
    string apTFn = apTFilenSS.str();
    mVcdFile = sc_create_vcd_trace_file(apTFn.c_str());
    mVcdFile->set_time_unit(1, SC_PS);
    if (1) {
#ifdef __HLS_TRACE_LEVEL_PORT__
    sc_trace(mVcdFile, start_V, "(port)start_V");
    sc_trace(mVcdFile, pkt_num_V, "(port)pkt_num_V");
    sc_trace(mVcdFile, pkt_len_V, "(port)pkt_len_V");
    sc_trace(mVcdFile, remote_ip_V, "(port)remote_ip_V");
    sc_trace(mVcdFile, remote_port_V, "(port)remote_port_V");
    sc_trace(mVcdFile, local_port_V, "(port)local_port_V");
    sc_trace(mVcdFile, tx_timeElapse_V, "(port)tx_timeElapse_V");
    sc_trace(mVcdFile, tx_done_V, "(port)tx_done_V");
    sc_trace(mVcdFile, latency_sum_V, "(port)latency_sum_V");
    sc_trace(mVcdFile, rx_timeElapse_V, "(port)rx_timeElapse_V");
    sc_trace(mVcdFile, rx_cnt_V, "(port)rx_cnt_V");
    sc_trace(mVcdFile, rx_done_V, "(port)rx_done_V");
    sc_trace(mVcdFile, rx_error_V, "(port)rx_error_V");
    sc_trace(mVcdFile, s_axi_AXILiteS_AWVALID, "(port)s_axi_AXILiteS_AWVALID");
    sc_trace(mVcdFile, s_axi_AXILiteS_AWREADY, "(port)s_axi_AXILiteS_AWREADY");
    sc_trace(mVcdFile, s_axi_AXILiteS_AWADDR, "(port)s_axi_AXILiteS_AWADDR");
    sc_trace(mVcdFile, s_axi_AXILiteS_WVALID, "(port)s_axi_AXILiteS_WVALID");
    sc_trace(mVcdFile, s_axi_AXILiteS_WREADY, "(port)s_axi_AXILiteS_WREADY");
    sc_trace(mVcdFile, s_axi_AXILiteS_WDATA, "(port)s_axi_AXILiteS_WDATA");
    sc_trace(mVcdFile, s_axi_AXILiteS_WSTRB, "(port)s_axi_AXILiteS_WSTRB");
    sc_trace(mVcdFile, s_axi_AXILiteS_ARVALID, "(port)s_axi_AXILiteS_ARVALID");
    sc_trace(mVcdFile, s_axi_AXILiteS_ARREADY, "(port)s_axi_AXILiteS_ARREADY");
    sc_trace(mVcdFile, s_axi_AXILiteS_ARADDR, "(port)s_axi_AXILiteS_ARADDR");
    sc_trace(mVcdFile, s_axi_AXILiteS_RVALID, "(port)s_axi_AXILiteS_RVALID");
    sc_trace(mVcdFile, s_axi_AXILiteS_RREADY, "(port)s_axi_AXILiteS_RREADY");
    sc_trace(mVcdFile, s_axi_AXILiteS_RDATA, "(port)s_axi_AXILiteS_RDATA");
    sc_trace(mVcdFile, s_axi_AXILiteS_RRESP, "(port)s_axi_AXILiteS_RRESP");
    sc_trace(mVcdFile, s_axi_AXILiteS_BVALID, "(port)s_axi_AXILiteS_BVALID");
    sc_trace(mVcdFile, s_axi_AXILiteS_BREADY, "(port)s_axi_AXILiteS_BREADY");
    sc_trace(mVcdFile, s_axi_AXILiteS_BRESP, "(port)s_axi_AXILiteS_BRESP");
    sc_trace(mVcdFile, ap_clk, "(port)ap_clk");
    sc_trace(mVcdFile, ap_rst_n, "(port)ap_rst_n");
#endif
#ifdef __HLS_TRACE_LEVEL_INT__
    sc_trace(mVcdFile, axil_start_V, "axil_start_V");
    sc_trace(mVcdFile, axil_pkt_num_V, "axil_pkt_num_V");
    sc_trace(mVcdFile, axil_pkt_len_V, "axil_pkt_len_V");
    sc_trace(mVcdFile, axil_remote_ip_V, "axil_remote_ip_V");
    sc_trace(mVcdFile, axil_remote_port_V, "axil_remote_port_V");
    sc_trace(mVcdFile, axil_local_port_V, "axil_local_port_V");
    sc_trace(mVcdFile, axil_tx_timeElapse_high_V, "axil_tx_timeElapse_high_V");
    sc_trace(mVcdFile, axil_tx_timeElapse_high_V_ap_vld, "axil_tx_timeElapse_high_V_ap_vld");
    sc_trace(mVcdFile, axil_tx_timeElapse_low_V, "axil_tx_timeElapse_low_V");
    sc_trace(mVcdFile, axil_tx_timeElapse_low_V_ap_vld, "axil_tx_timeElapse_low_V_ap_vld");
    sc_trace(mVcdFile, axil_tx_done_V, "axil_tx_done_V");
    sc_trace(mVcdFile, axil_tx_done_V_ap_vld, "axil_tx_done_V_ap_vld");
    sc_trace(mVcdFile, axil_latency_sum_high_V, "axil_latency_sum_high_V");
    sc_trace(mVcdFile, axil_latency_sum_high_V_ap_vld, "axil_latency_sum_high_V_ap_vld");
    sc_trace(mVcdFile, axil_latency_sum_low_V, "axil_latency_sum_low_V");
    sc_trace(mVcdFile, axil_latency_sum_low_V_ap_vld, "axil_latency_sum_low_V_ap_vld");
    sc_trace(mVcdFile, axil_rx_timeElaspe_high_V, "axil_rx_timeElaspe_high_V");
    sc_trace(mVcdFile, axil_rx_timeElaspe_high_V_ap_vld, "axil_rx_timeElaspe_high_V_ap_vld");
    sc_trace(mVcdFile, axil_rx_timeElaspe_low_V, "axil_rx_timeElaspe_low_V");
    sc_trace(mVcdFile, axil_rx_timeElaspe_low_V_ap_vld, "axil_rx_timeElaspe_low_V_ap_vld");
    sc_trace(mVcdFile, axil_rx_done_V, "axil_rx_done_V");
    sc_trace(mVcdFile, axil_rx_done_V_ap_vld, "axil_rx_done_V_ap_vld");
    sc_trace(mVcdFile, axil_rx_error_V, "axil_rx_error_V");
    sc_trace(mVcdFile, axil_rx_error_V_ap_vld, "axil_rx_error_V_ap_vld");
    sc_trace(mVcdFile, axil_rx_curr_cnt_V_ap_vld, "axil_rx_curr_cnt_V_ap_vld");
    sc_trace(mVcdFile, ap_rst_n_inv, "ap_rst_n_inv");
#endif

    }
    mHdltvinHandle.open("PSInterface.hdltvin.dat");
    mHdltvoutHandle.open("PSInterface.hdltvout.dat");
}

PSInterface::~PSInterface() {
    if (mVcdFile) 
        sc_close_vcd_trace_file(mVcdFile);

    mHdltvinHandle << "] " << endl;
    mHdltvoutHandle << "] " << endl;
    mHdltvinHandle.close();
    mHdltvoutHandle.close();
    delete PSInterface_AXILiteS_s_axi_U;
}

void PSInterface::thread_ap_var_for_const0() {
    ap_var_for_const0 = ap_const_logic_1;
}

void PSInterface::thread_ap_rst_n_inv() {
    ap_rst_n_inv =  (sc_logic) (~ap_rst_n.read());
}

void PSInterface::thread_axil_latency_sum_high_V() {
    axil_latency_sum_high_V = latency_sum_V.read().range(63, 32);
}

void PSInterface::thread_axil_latency_sum_high_V_ap_vld() {
    if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_const_boolean_1)) {
        axil_latency_sum_high_V_ap_vld = ap_const_logic_1;
    } else {
        axil_latency_sum_high_V_ap_vld = ap_const_logic_0;
    }
}

void PSInterface::thread_axil_latency_sum_low_V() {
    axil_latency_sum_low_V = latency_sum_V.read().range(32-1, 0);
}

void PSInterface::thread_axil_latency_sum_low_V_ap_vld() {
    if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_const_boolean_1)) {
        axil_latency_sum_low_V_ap_vld = ap_const_logic_1;
    } else {
        axil_latency_sum_low_V_ap_vld = ap_const_logic_0;
    }
}

void PSInterface::thread_axil_rx_curr_cnt_V_ap_vld() {
    if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_const_boolean_1)) {
        axil_rx_curr_cnt_V_ap_vld = ap_const_logic_1;
    } else {
        axil_rx_curr_cnt_V_ap_vld = ap_const_logic_0;
    }
}

void PSInterface::thread_axil_rx_done_V() {
    axil_rx_done_V = esl_zext<32,1>(rx_done_V.read());
}

void PSInterface::thread_axil_rx_done_V_ap_vld() {
    if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_const_boolean_1)) {
        axil_rx_done_V_ap_vld = ap_const_logic_1;
    } else {
        axil_rx_done_V_ap_vld = ap_const_logic_0;
    }
}

void PSInterface::thread_axil_rx_error_V() {
    axil_rx_error_V = esl_zext<32,1>(rx_error_V.read());
}

void PSInterface::thread_axil_rx_error_V_ap_vld() {
    if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_const_boolean_1)) {
        axil_rx_error_V_ap_vld = ap_const_logic_1;
    } else {
        axil_rx_error_V_ap_vld = ap_const_logic_0;
    }
}

void PSInterface::thread_axil_rx_timeElaspe_high_V() {
    axil_rx_timeElaspe_high_V = rx_timeElapse_V.read().range(63, 32);
}

void PSInterface::thread_axil_rx_timeElaspe_high_V_ap_vld() {
    if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_const_boolean_1)) {
        axil_rx_timeElaspe_high_V_ap_vld = ap_const_logic_1;
    } else {
        axil_rx_timeElaspe_high_V_ap_vld = ap_const_logic_0;
    }
}

void PSInterface::thread_axil_rx_timeElaspe_low_V() {
    axil_rx_timeElaspe_low_V = rx_timeElapse_V.read().range(32-1, 0);
}

void PSInterface::thread_axil_rx_timeElaspe_low_V_ap_vld() {
    if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_const_boolean_1)) {
        axil_rx_timeElaspe_low_V_ap_vld = ap_const_logic_1;
    } else {
        axil_rx_timeElaspe_low_V_ap_vld = ap_const_logic_0;
    }
}

void PSInterface::thread_axil_tx_done_V() {
    axil_tx_done_V = esl_zext<32,1>(tx_done_V.read());
}

void PSInterface::thread_axil_tx_done_V_ap_vld() {
    if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_const_boolean_1)) {
        axil_tx_done_V_ap_vld = ap_const_logic_1;
    } else {
        axil_tx_done_V_ap_vld = ap_const_logic_0;
    }
}

void PSInterface::thread_axil_tx_timeElapse_high_V() {
    axil_tx_timeElapse_high_V = tx_timeElapse_V.read().range(63, 32);
}

void PSInterface::thread_axil_tx_timeElapse_high_V_ap_vld() {
    if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_const_boolean_1)) {
        axil_tx_timeElapse_high_V_ap_vld = ap_const_logic_1;
    } else {
        axil_tx_timeElapse_high_V_ap_vld = ap_const_logic_0;
    }
}

void PSInterface::thread_axil_tx_timeElapse_low_V() {
    axil_tx_timeElapse_low_V = tx_timeElapse_V.read().range(32-1, 0);
}

void PSInterface::thread_axil_tx_timeElapse_low_V_ap_vld() {
    if (esl_seteq<1,1,1>(ap_const_boolean_1, ap_const_boolean_1)) {
        axil_tx_timeElapse_low_V_ap_vld = ap_const_logic_1;
    } else {
        axil_tx_timeElapse_low_V_ap_vld = ap_const_logic_0;
    }
}

void PSInterface::thread_local_port_V() {
    local_port_V = axil_local_port_V.read().range(16-1, 0);
}

void PSInterface::thread_pkt_len_V() {
    pkt_len_V = axil_pkt_len_V.read().range(16-1, 0);
}

void PSInterface::thread_pkt_num_V() {
    pkt_num_V = axil_pkt_num_V.read();
}

void PSInterface::thread_remote_ip_V() {
    remote_ip_V = axil_remote_ip_V.read();
}

void PSInterface::thread_remote_port_V() {
    remote_port_V = axil_remote_port_V.read().range(16-1, 0);
}

void PSInterface::thread_start_V() {
    start_V = axil_start_V.read().range(1-1, 0);
}

void PSInterface::thread_hdltv_gen() {
    const char* dump_tv = std::getenv("AP_WRITE_TV");
    if (!(dump_tv && string(dump_tv) == "on")) return;

    wait();

    mHdltvinHandle << "[ " << endl;
    mHdltvoutHandle << "[ " << endl;
    int ap_cycleNo = 0;
    while (1) {
        wait();
        const char* mComma = ap_cycleNo == 0 ? " " : ", " ;
        mHdltvoutHandle << mComma << "{"  <<  " \"start_V\" :  \"" << start_V.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pkt_num_V\" :  \"" << pkt_num_V.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"pkt_len_V\" :  \"" << pkt_len_V.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"remote_ip_V\" :  \"" << remote_ip_V.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"remote_port_V\" :  \"" << remote_port_V.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"local_port_V\" :  \"" << local_port_V.read() << "\" ";
        mHdltvinHandle << mComma << "{"  <<  " \"tx_timeElapse_V\" :  \"" << tx_timeElapse_V.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"tx_done_V\" :  \"" << tx_done_V.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"latency_sum_V\" :  \"" << latency_sum_V.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"rx_timeElapse_V\" :  \"" << rx_timeElapse_V.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"rx_cnt_V\" :  \"" << rx_cnt_V.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"rx_done_V\" :  \"" << rx_done_V.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"rx_error_V\" :  \"" << rx_error_V.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"s_axi_AXILiteS_AWVALID\" :  \"" << s_axi_AXILiteS_AWVALID.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"s_axi_AXILiteS_AWREADY\" :  \"" << s_axi_AXILiteS_AWREADY.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"s_axi_AXILiteS_AWADDR\" :  \"" << s_axi_AXILiteS_AWADDR.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"s_axi_AXILiteS_WVALID\" :  \"" << s_axi_AXILiteS_WVALID.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"s_axi_AXILiteS_WREADY\" :  \"" << s_axi_AXILiteS_WREADY.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"s_axi_AXILiteS_WDATA\" :  \"" << s_axi_AXILiteS_WDATA.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"s_axi_AXILiteS_WSTRB\" :  \"" << s_axi_AXILiteS_WSTRB.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"s_axi_AXILiteS_ARVALID\" :  \"" << s_axi_AXILiteS_ARVALID.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"s_axi_AXILiteS_ARREADY\" :  \"" << s_axi_AXILiteS_ARREADY.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"s_axi_AXILiteS_ARADDR\" :  \"" << s_axi_AXILiteS_ARADDR.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"s_axi_AXILiteS_RVALID\" :  \"" << s_axi_AXILiteS_RVALID.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"s_axi_AXILiteS_RREADY\" :  \"" << s_axi_AXILiteS_RREADY.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"s_axi_AXILiteS_RDATA\" :  \"" << s_axi_AXILiteS_RDATA.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"s_axi_AXILiteS_RRESP\" :  \"" << s_axi_AXILiteS_RRESP.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"s_axi_AXILiteS_BVALID\" :  \"" << s_axi_AXILiteS_BVALID.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"s_axi_AXILiteS_BREADY\" :  \"" << s_axi_AXILiteS_BREADY.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"s_axi_AXILiteS_BRESP\" :  \"" << s_axi_AXILiteS_BRESP.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"ap_rst_n\" :  \"" << ap_rst_n.read() << "\" ";
        mHdltvinHandle << "}" << std::endl;
        mHdltvoutHandle << "}" << std::endl;
        ap_cycleNo++;
    }
}

}

