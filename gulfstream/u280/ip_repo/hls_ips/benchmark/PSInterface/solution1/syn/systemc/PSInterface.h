// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2019.1
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#ifndef _PSInterface_HH_
#define _PSInterface_HH_

#include "systemc.h"
#include "AESL_pkg.h"

#include "PSInterface_AXILiteS_s_axi.h"

namespace ap_rtl {

template<unsigned int C_S_AXI_AXILITES_ADDR_WIDTH = 8,
         unsigned int C_S_AXI_AXILITES_DATA_WIDTH = 32>
struct PSInterface : public sc_module {
    // Port declarations 32
    sc_out< sc_lv<1> > start_V;
    sc_out< sc_lv<32> > pkt_num_V;
    sc_out< sc_lv<16> > pkt_len_V;
    sc_out< sc_lv<32> > remote_ip_V;
    sc_out< sc_lv<16> > remote_port_V;
    sc_out< sc_lv<16> > local_port_V;
    sc_in< sc_lv<64> > tx_timeElapse_V;
    sc_in< sc_lv<1> > tx_done_V;
    sc_in< sc_lv<64> > latency_sum_V;
    sc_in< sc_lv<64> > rx_timeElapse_V;
    sc_in< sc_lv<32> > rx_cnt_V;
    sc_in< sc_lv<1> > rx_done_V;
    sc_in< sc_lv<1> > rx_error_V;
    sc_in< sc_logic > s_axi_AXILiteS_AWVALID;
    sc_out< sc_logic > s_axi_AXILiteS_AWREADY;
    sc_in< sc_uint<C_S_AXI_AXILITES_ADDR_WIDTH> > s_axi_AXILiteS_AWADDR;
    sc_in< sc_logic > s_axi_AXILiteS_WVALID;
    sc_out< sc_logic > s_axi_AXILiteS_WREADY;
    sc_in< sc_uint<C_S_AXI_AXILITES_DATA_WIDTH> > s_axi_AXILiteS_WDATA;
    sc_in< sc_uint<C_S_AXI_AXILITES_DATA_WIDTH/8> > s_axi_AXILiteS_WSTRB;
    sc_in< sc_logic > s_axi_AXILiteS_ARVALID;
    sc_out< sc_logic > s_axi_AXILiteS_ARREADY;
    sc_in< sc_uint<C_S_AXI_AXILITES_ADDR_WIDTH> > s_axi_AXILiteS_ARADDR;
    sc_out< sc_logic > s_axi_AXILiteS_RVALID;
    sc_in< sc_logic > s_axi_AXILiteS_RREADY;
    sc_out< sc_uint<C_S_AXI_AXILITES_DATA_WIDTH> > s_axi_AXILiteS_RDATA;
    sc_out< sc_lv<2> > s_axi_AXILiteS_RRESP;
    sc_out< sc_logic > s_axi_AXILiteS_BVALID;
    sc_in< sc_logic > s_axi_AXILiteS_BREADY;
    sc_out< sc_lv<2> > s_axi_AXILiteS_BRESP;
    sc_in_clk ap_clk;
    sc_in< sc_logic > ap_rst_n;
    sc_signal< sc_logic > ap_var_for_const0;
    // Port declarations for the virtual clock. 
    sc_in_clk ap_virtual_clock;


    // Module declarations
    PSInterface(sc_module_name name);
    SC_HAS_PROCESS(PSInterface);

    ~PSInterface();

    sc_trace_file* mVcdFile;

    ofstream mHdltvinHandle;
    ofstream mHdltvoutHandle;
    PSInterface_AXILiteS_s_axi<C_S_AXI_AXILITES_ADDR_WIDTH,C_S_AXI_AXILITES_DATA_WIDTH>* PSInterface_AXILiteS_s_axi_U;
    sc_signal< sc_lv<32> > axil_start_V;
    sc_signal< sc_lv<32> > axil_pkt_num_V;
    sc_signal< sc_lv<32> > axil_pkt_len_V;
    sc_signal< sc_lv<32> > axil_remote_ip_V;
    sc_signal< sc_lv<32> > axil_remote_port_V;
    sc_signal< sc_lv<32> > axil_local_port_V;
    sc_signal< sc_lv<32> > axil_tx_timeElapse_high_V;
    sc_signal< sc_logic > axil_tx_timeElapse_high_V_ap_vld;
    sc_signal< sc_lv<32> > axil_tx_timeElapse_low_V;
    sc_signal< sc_logic > axil_tx_timeElapse_low_V_ap_vld;
    sc_signal< sc_lv<32> > axil_tx_done_V;
    sc_signal< sc_logic > axil_tx_done_V_ap_vld;
    sc_signal< sc_lv<32> > axil_latency_sum_high_V;
    sc_signal< sc_logic > axil_latency_sum_high_V_ap_vld;
    sc_signal< sc_lv<32> > axil_latency_sum_low_V;
    sc_signal< sc_logic > axil_latency_sum_low_V_ap_vld;
    sc_signal< sc_lv<32> > axil_rx_timeElaspe_high_V;
    sc_signal< sc_logic > axil_rx_timeElaspe_high_V_ap_vld;
    sc_signal< sc_lv<32> > axil_rx_timeElaspe_low_V;
    sc_signal< sc_logic > axil_rx_timeElaspe_low_V_ap_vld;
    sc_signal< sc_lv<32> > axil_rx_done_V;
    sc_signal< sc_logic > axil_rx_done_V_ap_vld;
    sc_signal< sc_lv<32> > axil_rx_error_V;
    sc_signal< sc_logic > axil_rx_error_V_ap_vld;
    sc_signal< sc_logic > axil_rx_curr_cnt_V_ap_vld;
    sc_signal< sc_logic > ap_rst_n_inv;
    static const int C_S_AXI_DATA_WIDTH;
    static const sc_logic ap_const_logic_1;
    static const bool ap_const_boolean_1;
    static const sc_logic ap_const_logic_0;
    static const sc_lv<32> ap_const_lv32_20;
    static const sc_lv<32> ap_const_lv32_3F;
    // Thread declarations
    void thread_ap_var_for_const0();
    void thread_ap_rst_n_inv();
    void thread_axil_latency_sum_high_V();
    void thread_axil_latency_sum_high_V_ap_vld();
    void thread_axil_latency_sum_low_V();
    void thread_axil_latency_sum_low_V_ap_vld();
    void thread_axil_rx_curr_cnt_V_ap_vld();
    void thread_axil_rx_done_V();
    void thread_axil_rx_done_V_ap_vld();
    void thread_axil_rx_error_V();
    void thread_axil_rx_error_V_ap_vld();
    void thread_axil_rx_timeElaspe_high_V();
    void thread_axil_rx_timeElaspe_high_V_ap_vld();
    void thread_axil_rx_timeElaspe_low_V();
    void thread_axil_rx_timeElaspe_low_V_ap_vld();
    void thread_axil_tx_done_V();
    void thread_axil_tx_done_V_ap_vld();
    void thread_axil_tx_timeElapse_high_V();
    void thread_axil_tx_timeElapse_high_V_ap_vld();
    void thread_axil_tx_timeElapse_low_V();
    void thread_axil_tx_timeElapse_low_V_ap_vld();
    void thread_local_port_V();
    void thread_pkt_len_V();
    void thread_pkt_num_V();
    void thread_remote_ip_V();
    void thread_remote_port_V();
    void thread_start_V();
    void thread_hdltv_gen();
};

}

using namespace ap_rtl;

#endif