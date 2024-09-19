// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xpsinterface.h"

extern XPsinterface_Config XPsinterface_ConfigTable[];

XPsinterface_Config *XPsinterface_LookupConfig(u16 DeviceId) {
	XPsinterface_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XPSINTERFACE_NUM_INSTANCES; Index++) {
		if (XPsinterface_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XPsinterface_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XPsinterface_Initialize(XPsinterface *InstancePtr, u16 DeviceId) {
	XPsinterface_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XPsinterface_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XPsinterface_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

