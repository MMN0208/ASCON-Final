// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#ifdef SDT
#include "xparameters.h"
#endif
#include "xascon128.h"

extern XAscon128_Config XAscon128_ConfigTable[];

#ifdef SDT
XAscon128_Config *XAscon128_LookupConfig(UINTPTR BaseAddress) {
	XAscon128_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XAscon128_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XAscon128_ConfigTable[Index].Ascon128_BaseAddress == BaseAddress) {
			ConfigPtr = &XAscon128_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XAscon128_Initialize(XAscon128 *InstancePtr, UINTPTR BaseAddress) {
	XAscon128_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XAscon128_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XAscon128_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XAscon128_Config *XAscon128_LookupConfig(u16 DeviceId) {
	XAscon128_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XASCON128_NUM_INSTANCES; Index++) {
		if (XAscon128_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XAscon128_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XAscon128_Initialize(XAscon128 *InstancePtr, u16 DeviceId) {
	XAscon128_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XAscon128_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XAscon128_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

