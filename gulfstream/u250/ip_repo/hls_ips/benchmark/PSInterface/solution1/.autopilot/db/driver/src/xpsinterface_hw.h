// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
// AXILiteS
// 0x00 : reserved
// 0x04 : reserved
// 0x08 : reserved
// 0x0c : reserved
// 0x10 : Data signal of axil_start_V
//        bit 31~0 - axil_start_V[31:0] (Read/Write)
// 0x14 : reserved
// 0x18 : Data signal of axil_pkt_num_V
//        bit 31~0 - axil_pkt_num_V[31:0] (Read/Write)
// 0x1c : reserved
// 0x20 : Data signal of axil_pkt_len_V
//        bit 31~0 - axil_pkt_len_V[31:0] (Read/Write)
// 0x24 : reserved
// 0x28 : Data signal of axil_remote_ip_V
//        bit 31~0 - axil_remote_ip_V[31:0] (Read/Write)
// 0x2c : reserved
// 0x30 : Data signal of axil_remote_port_V
//        bit 31~0 - axil_remote_port_V[31:0] (Read/Write)
// 0x34 : reserved
// 0x38 : Data signal of axil_local_port_V
//        bit 31~0 - axil_local_port_V[31:0] (Read/Write)
// 0x3c : reserved
// 0x40 : Data signal of axil_tx_timeElapse_high_V
//        bit 31~0 - axil_tx_timeElapse_high_V[31:0] (Read)
// 0x44 : Control signal of axil_tx_timeElapse_high_V
//        bit 0  - axil_tx_timeElapse_high_V_ap_vld (Read/COR)
//        others - reserved
// 0x48 : Data signal of axil_tx_timeElapse_low_V
//        bit 31~0 - axil_tx_timeElapse_low_V[31:0] (Read)
// 0x4c : Control signal of axil_tx_timeElapse_low_V
//        bit 0  - axil_tx_timeElapse_low_V_ap_vld (Read/COR)
//        others - reserved
// 0x50 : Data signal of axil_tx_done_V
//        bit 31~0 - axil_tx_done_V[31:0] (Read)
// 0x54 : Control signal of axil_tx_done_V
//        bit 0  - axil_tx_done_V_ap_vld (Read/COR)
//        others - reserved
// 0x58 : Data signal of axil_latency_sum_high_V
//        bit 31~0 - axil_latency_sum_high_V[31:0] (Read)
// 0x5c : Control signal of axil_latency_sum_high_V
//        bit 0  - axil_latency_sum_high_V_ap_vld (Read/COR)
//        others - reserved
// 0x60 : Data signal of axil_latency_sum_low_V
//        bit 31~0 - axil_latency_sum_low_V[31:0] (Read)
// 0x64 : Control signal of axil_latency_sum_low_V
//        bit 0  - axil_latency_sum_low_V_ap_vld (Read/COR)
//        others - reserved
// 0x68 : Data signal of axil_rx_timeElaspe_high_V
//        bit 31~0 - axil_rx_timeElaspe_high_V[31:0] (Read)
// 0x6c : Control signal of axil_rx_timeElaspe_high_V
//        bit 0  - axil_rx_timeElaspe_high_V_ap_vld (Read/COR)
//        others - reserved
// 0x70 : Data signal of axil_rx_timeElaspe_low_V
//        bit 31~0 - axil_rx_timeElaspe_low_V[31:0] (Read)
// 0x74 : Control signal of axil_rx_timeElaspe_low_V
//        bit 0  - axil_rx_timeElaspe_low_V_ap_vld (Read/COR)
//        others - reserved
// 0x78 : Data signal of axil_rx_done_V
//        bit 31~0 - axil_rx_done_V[31:0] (Read)
// 0x7c : Control signal of axil_rx_done_V
//        bit 0  - axil_rx_done_V_ap_vld (Read/COR)
//        others - reserved
// 0x80 : Data signal of axil_rx_error_V
//        bit 31~0 - axil_rx_error_V[31:0] (Read)
// 0x84 : Control signal of axil_rx_error_V
//        bit 0  - axil_rx_error_V_ap_vld (Read/COR)
//        others - reserved
// 0x88 : Data signal of axil_rx_curr_cnt_V
//        bit 31~0 - axil_rx_curr_cnt_V[31:0] (Read)
// 0x8c : Control signal of axil_rx_curr_cnt_V
//        bit 0  - axil_rx_curr_cnt_V_ap_vld (Read/COR)
//        others - reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XPSINTERFACE_AXILITES_ADDR_AXIL_START_V_DATA              0x10
#define XPSINTERFACE_AXILITES_BITS_AXIL_START_V_DATA              32
#define XPSINTERFACE_AXILITES_ADDR_AXIL_PKT_NUM_V_DATA            0x18
#define XPSINTERFACE_AXILITES_BITS_AXIL_PKT_NUM_V_DATA            32
#define XPSINTERFACE_AXILITES_ADDR_AXIL_PKT_LEN_V_DATA            0x20
#define XPSINTERFACE_AXILITES_BITS_AXIL_PKT_LEN_V_DATA            32
#define XPSINTERFACE_AXILITES_ADDR_AXIL_REMOTE_IP_V_DATA          0x28
#define XPSINTERFACE_AXILITES_BITS_AXIL_REMOTE_IP_V_DATA          32
#define XPSINTERFACE_AXILITES_ADDR_AXIL_REMOTE_PORT_V_DATA        0x30
#define XPSINTERFACE_AXILITES_BITS_AXIL_REMOTE_PORT_V_DATA        32
#define XPSINTERFACE_AXILITES_ADDR_AXIL_LOCAL_PORT_V_DATA         0x38
#define XPSINTERFACE_AXILITES_BITS_AXIL_LOCAL_PORT_V_DATA         32
#define XPSINTERFACE_AXILITES_ADDR_AXIL_TX_TIMEELAPSE_HIGH_V_DATA 0x40
#define XPSINTERFACE_AXILITES_BITS_AXIL_TX_TIMEELAPSE_HIGH_V_DATA 32
#define XPSINTERFACE_AXILITES_ADDR_AXIL_TX_TIMEELAPSE_HIGH_V_CTRL 0x44
#define XPSINTERFACE_AXILITES_ADDR_AXIL_TX_TIMEELAPSE_LOW_V_DATA  0x48
#define XPSINTERFACE_AXILITES_BITS_AXIL_TX_TIMEELAPSE_LOW_V_DATA  32
#define XPSINTERFACE_AXILITES_ADDR_AXIL_TX_TIMEELAPSE_LOW_V_CTRL  0x4c
#define XPSINTERFACE_AXILITES_ADDR_AXIL_TX_DONE_V_DATA            0x50
#define XPSINTERFACE_AXILITES_BITS_AXIL_TX_DONE_V_DATA            32
#define XPSINTERFACE_AXILITES_ADDR_AXIL_TX_DONE_V_CTRL            0x54
#define XPSINTERFACE_AXILITES_ADDR_AXIL_LATENCY_SUM_HIGH_V_DATA   0x58
#define XPSINTERFACE_AXILITES_BITS_AXIL_LATENCY_SUM_HIGH_V_DATA   32
#define XPSINTERFACE_AXILITES_ADDR_AXIL_LATENCY_SUM_HIGH_V_CTRL   0x5c
#define XPSINTERFACE_AXILITES_ADDR_AXIL_LATENCY_SUM_LOW_V_DATA    0x60
#define XPSINTERFACE_AXILITES_BITS_AXIL_LATENCY_SUM_LOW_V_DATA    32
#define XPSINTERFACE_AXILITES_ADDR_AXIL_LATENCY_SUM_LOW_V_CTRL    0x64
#define XPSINTERFACE_AXILITES_ADDR_AXIL_RX_TIMEELASPE_HIGH_V_DATA 0x68
#define XPSINTERFACE_AXILITES_BITS_AXIL_RX_TIMEELASPE_HIGH_V_DATA 32
#define XPSINTERFACE_AXILITES_ADDR_AXIL_RX_TIMEELASPE_HIGH_V_CTRL 0x6c
#define XPSINTERFACE_AXILITES_ADDR_AXIL_RX_TIMEELASPE_LOW_V_DATA  0x70
#define XPSINTERFACE_AXILITES_BITS_AXIL_RX_TIMEELASPE_LOW_V_DATA  32
#define XPSINTERFACE_AXILITES_ADDR_AXIL_RX_TIMEELASPE_LOW_V_CTRL  0x74
#define XPSINTERFACE_AXILITES_ADDR_AXIL_RX_DONE_V_DATA            0x78
#define XPSINTERFACE_AXILITES_BITS_AXIL_RX_DONE_V_DATA            32
#define XPSINTERFACE_AXILITES_ADDR_AXIL_RX_DONE_V_CTRL            0x7c
#define XPSINTERFACE_AXILITES_ADDR_AXIL_RX_ERROR_V_DATA           0x80
#define XPSINTERFACE_AXILITES_BITS_AXIL_RX_ERROR_V_DATA           32
#define XPSINTERFACE_AXILITES_ADDR_AXIL_RX_ERROR_V_CTRL           0x84
#define XPSINTERFACE_AXILITES_ADDR_AXIL_RX_CURR_CNT_V_DATA        0x88
#define XPSINTERFACE_AXILITES_BITS_AXIL_RX_CURR_CNT_V_DATA        32
#define XPSINTERFACE_AXILITES_ADDR_AXIL_RX_CURR_CNT_V_CTRL        0x8c

