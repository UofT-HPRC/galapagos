// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XPSINTERFACE_H
#define XPSINTERFACE_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xpsinterface_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
#else
typedef struct {
    u16 DeviceId;
    u32 Axilites_BaseAddress;
} XPsinterface_Config;
#endif

typedef struct {
    u32 Axilites_BaseAddress;
    u32 IsReady;
} XPsinterface;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XPsinterface_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XPsinterface_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XPsinterface_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XPsinterface_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XPsinterface_Initialize(XPsinterface *InstancePtr, u16 DeviceId);
XPsinterface_Config* XPsinterface_LookupConfig(u16 DeviceId);
int XPsinterface_CfgInitialize(XPsinterface *InstancePtr, XPsinterface_Config *ConfigPtr);
#else
int XPsinterface_Initialize(XPsinterface *InstancePtr, const char* InstanceName);
int XPsinterface_Release(XPsinterface *InstancePtr);
#endif


void XPsinterface_Set_axil_start_V(XPsinterface *InstancePtr, u32 Data);
u32 XPsinterface_Get_axil_start_V(XPsinterface *InstancePtr);
void XPsinterface_Set_axil_pkt_num_V(XPsinterface *InstancePtr, u32 Data);
u32 XPsinterface_Get_axil_pkt_num_V(XPsinterface *InstancePtr);
void XPsinterface_Set_axil_pkt_len_V(XPsinterface *InstancePtr, u32 Data);
u32 XPsinterface_Get_axil_pkt_len_V(XPsinterface *InstancePtr);
void XPsinterface_Set_axil_remote_ip_V(XPsinterface *InstancePtr, u32 Data);
u32 XPsinterface_Get_axil_remote_ip_V(XPsinterface *InstancePtr);
void XPsinterface_Set_axil_remote_port_V(XPsinterface *InstancePtr, u32 Data);
u32 XPsinterface_Get_axil_remote_port_V(XPsinterface *InstancePtr);
void XPsinterface_Set_axil_local_port_V(XPsinterface *InstancePtr, u32 Data);
u32 XPsinterface_Get_axil_local_port_V(XPsinterface *InstancePtr);
u32 XPsinterface_Get_axil_tx_timeElapse_high_V(XPsinterface *InstancePtr);
u32 XPsinterface_Get_axil_tx_timeElapse_high_V_vld(XPsinterface *InstancePtr);
u32 XPsinterface_Get_axil_tx_timeElapse_low_V(XPsinterface *InstancePtr);
u32 XPsinterface_Get_axil_tx_timeElapse_low_V_vld(XPsinterface *InstancePtr);
u32 XPsinterface_Get_axil_tx_done_V(XPsinterface *InstancePtr);
u32 XPsinterface_Get_axil_tx_done_V_vld(XPsinterface *InstancePtr);
u32 XPsinterface_Get_axil_latency_sum_high_V(XPsinterface *InstancePtr);
u32 XPsinterface_Get_axil_latency_sum_high_V_vld(XPsinterface *InstancePtr);
u32 XPsinterface_Get_axil_latency_sum_low_V(XPsinterface *InstancePtr);
u32 XPsinterface_Get_axil_latency_sum_low_V_vld(XPsinterface *InstancePtr);
u32 XPsinterface_Get_axil_rx_timeElaspe_high_V(XPsinterface *InstancePtr);
u32 XPsinterface_Get_axil_rx_timeElaspe_high_V_vld(XPsinterface *InstancePtr);
u32 XPsinterface_Get_axil_rx_timeElaspe_low_V(XPsinterface *InstancePtr);
u32 XPsinterface_Get_axil_rx_timeElaspe_low_V_vld(XPsinterface *InstancePtr);
u32 XPsinterface_Get_axil_rx_done_V(XPsinterface *InstancePtr);
u32 XPsinterface_Get_axil_rx_done_V_vld(XPsinterface *InstancePtr);
u32 XPsinterface_Get_axil_rx_error_V(XPsinterface *InstancePtr);
u32 XPsinterface_Get_axil_rx_error_V_vld(XPsinterface *InstancePtr);
u32 XPsinterface_Get_axil_rx_curr_cnt_V(XPsinterface *InstancePtr);
u32 XPsinterface_Get_axil_rx_curr_cnt_V_vld(XPsinterface *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
