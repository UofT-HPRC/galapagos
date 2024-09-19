// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xpsinterface.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XPsinterface_CfgInitialize(XPsinterface *InstancePtr, XPsinterface_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Axilites_BaseAddress = ConfigPtr->Axilites_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XPsinterface_Set_axil_start_V(XPsinterface *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPsinterface_WriteReg(InstancePtr->Axilites_BaseAddress, XPSINTERFACE_AXILITES_ADDR_AXIL_START_V_DATA, Data);
}

u32 XPsinterface_Get_axil_start_V(XPsinterface *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPsinterface_ReadReg(InstancePtr->Axilites_BaseAddress, XPSINTERFACE_AXILITES_ADDR_AXIL_START_V_DATA);
    return Data;
}

void XPsinterface_Set_axil_pkt_num_V(XPsinterface *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPsinterface_WriteReg(InstancePtr->Axilites_BaseAddress, XPSINTERFACE_AXILITES_ADDR_AXIL_PKT_NUM_V_DATA, Data);
}

u32 XPsinterface_Get_axil_pkt_num_V(XPsinterface *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPsinterface_ReadReg(InstancePtr->Axilites_BaseAddress, XPSINTERFACE_AXILITES_ADDR_AXIL_PKT_NUM_V_DATA);
    return Data;
}

void XPsinterface_Set_axil_pkt_len_V(XPsinterface *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPsinterface_WriteReg(InstancePtr->Axilites_BaseAddress, XPSINTERFACE_AXILITES_ADDR_AXIL_PKT_LEN_V_DATA, Data);
}

u32 XPsinterface_Get_axil_pkt_len_V(XPsinterface *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPsinterface_ReadReg(InstancePtr->Axilites_BaseAddress, XPSINTERFACE_AXILITES_ADDR_AXIL_PKT_LEN_V_DATA);
    return Data;
}

void XPsinterface_Set_axil_remote_ip_V(XPsinterface *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPsinterface_WriteReg(InstancePtr->Axilites_BaseAddress, XPSINTERFACE_AXILITES_ADDR_AXIL_REMOTE_IP_V_DATA, Data);
}

u32 XPsinterface_Get_axil_remote_ip_V(XPsinterface *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPsinterface_ReadReg(InstancePtr->Axilites_BaseAddress, XPSINTERFACE_AXILITES_ADDR_AXIL_REMOTE_IP_V_DATA);
    return Data;
}

void XPsinterface_Set_axil_remote_port_V(XPsinterface *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPsinterface_WriteReg(InstancePtr->Axilites_BaseAddress, XPSINTERFACE_AXILITES_ADDR_AXIL_REMOTE_PORT_V_DATA, Data);
}

u32 XPsinterface_Get_axil_remote_port_V(XPsinterface *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPsinterface_ReadReg(InstancePtr->Axilites_BaseAddress, XPSINTERFACE_AXILITES_ADDR_AXIL_REMOTE_PORT_V_DATA);
    return Data;
}

void XPsinterface_Set_axil_local_port_V(XPsinterface *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XPsinterface_WriteReg(InstancePtr->Axilites_BaseAddress, XPSINTERFACE_AXILITES_ADDR_AXIL_LOCAL_PORT_V_DATA, Data);
}

u32 XPsinterface_Get_axil_local_port_V(XPsinterface *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPsinterface_ReadReg(InstancePtr->Axilites_BaseAddress, XPSINTERFACE_AXILITES_ADDR_AXIL_LOCAL_PORT_V_DATA);
    return Data;
}

u32 XPsinterface_Get_axil_tx_timeElapse_high_V(XPsinterface *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPsinterface_ReadReg(InstancePtr->Axilites_BaseAddress, XPSINTERFACE_AXILITES_ADDR_AXIL_TX_TIMEELAPSE_HIGH_V_DATA);
    return Data;
}

u32 XPsinterface_Get_axil_tx_timeElapse_high_V_vld(XPsinterface *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPsinterface_ReadReg(InstancePtr->Axilites_BaseAddress, XPSINTERFACE_AXILITES_ADDR_AXIL_TX_TIMEELAPSE_HIGH_V_CTRL);
    return Data & 0x1;
}

u32 XPsinterface_Get_axil_tx_timeElapse_low_V(XPsinterface *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPsinterface_ReadReg(InstancePtr->Axilites_BaseAddress, XPSINTERFACE_AXILITES_ADDR_AXIL_TX_TIMEELAPSE_LOW_V_DATA);
    return Data;
}

u32 XPsinterface_Get_axil_tx_timeElapse_low_V_vld(XPsinterface *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPsinterface_ReadReg(InstancePtr->Axilites_BaseAddress, XPSINTERFACE_AXILITES_ADDR_AXIL_TX_TIMEELAPSE_LOW_V_CTRL);
    return Data & 0x1;
}

u32 XPsinterface_Get_axil_tx_done_V(XPsinterface *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPsinterface_ReadReg(InstancePtr->Axilites_BaseAddress, XPSINTERFACE_AXILITES_ADDR_AXIL_TX_DONE_V_DATA);
    return Data;
}

u32 XPsinterface_Get_axil_tx_done_V_vld(XPsinterface *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPsinterface_ReadReg(InstancePtr->Axilites_BaseAddress, XPSINTERFACE_AXILITES_ADDR_AXIL_TX_DONE_V_CTRL);
    return Data & 0x1;
}

u32 XPsinterface_Get_axil_latency_sum_high_V(XPsinterface *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPsinterface_ReadReg(InstancePtr->Axilites_BaseAddress, XPSINTERFACE_AXILITES_ADDR_AXIL_LATENCY_SUM_HIGH_V_DATA);
    return Data;
}

u32 XPsinterface_Get_axil_latency_sum_high_V_vld(XPsinterface *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPsinterface_ReadReg(InstancePtr->Axilites_BaseAddress, XPSINTERFACE_AXILITES_ADDR_AXIL_LATENCY_SUM_HIGH_V_CTRL);
    return Data & 0x1;
}

u32 XPsinterface_Get_axil_latency_sum_low_V(XPsinterface *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPsinterface_ReadReg(InstancePtr->Axilites_BaseAddress, XPSINTERFACE_AXILITES_ADDR_AXIL_LATENCY_SUM_LOW_V_DATA);
    return Data;
}

u32 XPsinterface_Get_axil_latency_sum_low_V_vld(XPsinterface *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPsinterface_ReadReg(InstancePtr->Axilites_BaseAddress, XPSINTERFACE_AXILITES_ADDR_AXIL_LATENCY_SUM_LOW_V_CTRL);
    return Data & 0x1;
}

u32 XPsinterface_Get_axil_rx_timeElaspe_high_V(XPsinterface *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPsinterface_ReadReg(InstancePtr->Axilites_BaseAddress, XPSINTERFACE_AXILITES_ADDR_AXIL_RX_TIMEELASPE_HIGH_V_DATA);
    return Data;
}

u32 XPsinterface_Get_axil_rx_timeElaspe_high_V_vld(XPsinterface *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPsinterface_ReadReg(InstancePtr->Axilites_BaseAddress, XPSINTERFACE_AXILITES_ADDR_AXIL_RX_TIMEELASPE_HIGH_V_CTRL);
    return Data & 0x1;
}

u32 XPsinterface_Get_axil_rx_timeElaspe_low_V(XPsinterface *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPsinterface_ReadReg(InstancePtr->Axilites_BaseAddress, XPSINTERFACE_AXILITES_ADDR_AXIL_RX_TIMEELASPE_LOW_V_DATA);
    return Data;
}

u32 XPsinterface_Get_axil_rx_timeElaspe_low_V_vld(XPsinterface *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPsinterface_ReadReg(InstancePtr->Axilites_BaseAddress, XPSINTERFACE_AXILITES_ADDR_AXIL_RX_TIMEELASPE_LOW_V_CTRL);
    return Data & 0x1;
}

u32 XPsinterface_Get_axil_rx_done_V(XPsinterface *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPsinterface_ReadReg(InstancePtr->Axilites_BaseAddress, XPSINTERFACE_AXILITES_ADDR_AXIL_RX_DONE_V_DATA);
    return Data;
}

u32 XPsinterface_Get_axil_rx_done_V_vld(XPsinterface *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPsinterface_ReadReg(InstancePtr->Axilites_BaseAddress, XPSINTERFACE_AXILITES_ADDR_AXIL_RX_DONE_V_CTRL);
    return Data & 0x1;
}

u32 XPsinterface_Get_axil_rx_error_V(XPsinterface *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPsinterface_ReadReg(InstancePtr->Axilites_BaseAddress, XPSINTERFACE_AXILITES_ADDR_AXIL_RX_ERROR_V_DATA);
    return Data;
}

u32 XPsinterface_Get_axil_rx_error_V_vld(XPsinterface *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPsinterface_ReadReg(InstancePtr->Axilites_BaseAddress, XPSINTERFACE_AXILITES_ADDR_AXIL_RX_ERROR_V_CTRL);
    return Data & 0x1;
}

u32 XPsinterface_Get_axil_rx_curr_cnt_V(XPsinterface *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPsinterface_ReadReg(InstancePtr->Axilites_BaseAddress, XPSINTERFACE_AXILITES_ADDR_AXIL_RX_CURR_CNT_V_DATA);
    return Data;
}

u32 XPsinterface_Get_axil_rx_curr_cnt_V_vld(XPsinterface *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XPsinterface_ReadReg(InstancePtr->Axilites_BaseAddress, XPSINTERFACE_AXILITES_ADDR_AXIL_RX_CURR_CNT_V_CTRL);
    return Data & 0x1;
}

