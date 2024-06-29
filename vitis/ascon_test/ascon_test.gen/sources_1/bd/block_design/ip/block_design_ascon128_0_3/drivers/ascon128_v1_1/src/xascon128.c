// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xascon128.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XAscon128_CfgInitialize(XAscon128 *InstancePtr, XAscon128_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Ascon128_BaseAddress = ConfigPtr->Ascon128_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XAscon128_Start(XAscon128 *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAscon128_ReadReg(InstancePtr->Ascon128_BaseAddress, XASCON128_ASCON128_ADDR_AP_CTRL) & 0x80;
    XAscon128_WriteReg(InstancePtr->Ascon128_BaseAddress, XASCON128_ASCON128_ADDR_AP_CTRL, Data | 0x01);
}

u32 XAscon128_IsDone(XAscon128 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAscon128_ReadReg(InstancePtr->Ascon128_BaseAddress, XASCON128_ASCON128_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XAscon128_IsIdle(XAscon128 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAscon128_ReadReg(InstancePtr->Ascon128_BaseAddress, XASCON128_ASCON128_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XAscon128_IsReady(XAscon128 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAscon128_ReadReg(InstancePtr->Ascon128_BaseAddress, XASCON128_ASCON128_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XAscon128_EnableAutoRestart(XAscon128 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAscon128_WriteReg(InstancePtr->Ascon128_BaseAddress, XASCON128_ASCON128_ADDR_AP_CTRL, 0x80);
}

void XAscon128_DisableAutoRestart(XAscon128 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAscon128_WriteReg(InstancePtr->Ascon128_BaseAddress, XASCON128_ASCON128_ADDR_AP_CTRL, 0);
}

void XAscon128_Set_key(XAscon128 *InstancePtr, XAscon128_Key Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAscon128_WriteReg(InstancePtr->Ascon128_BaseAddress, XASCON128_ASCON128_ADDR_KEY_DATA + 0, Data.word_0);
    XAscon128_WriteReg(InstancePtr->Ascon128_BaseAddress, XASCON128_ASCON128_ADDR_KEY_DATA + 4, Data.word_1);
    XAscon128_WriteReg(InstancePtr->Ascon128_BaseAddress, XASCON128_ASCON128_ADDR_KEY_DATA + 8, Data.word_2);
    XAscon128_WriteReg(InstancePtr->Ascon128_BaseAddress, XASCON128_ASCON128_ADDR_KEY_DATA + 12, Data.word_3);
}

XAscon128_Key XAscon128_Get_key(XAscon128 *InstancePtr) {
    XAscon128_Key Data;

    Data.word_0 = XAscon128_ReadReg(InstancePtr->Ascon128_BaseAddress, XASCON128_ASCON128_ADDR_KEY_DATA + 0);
    Data.word_1 = XAscon128_ReadReg(InstancePtr->Ascon128_BaseAddress, XASCON128_ASCON128_ADDR_KEY_DATA + 4);
    Data.word_2 = XAscon128_ReadReg(InstancePtr->Ascon128_BaseAddress, XASCON128_ASCON128_ADDR_KEY_DATA + 8);
    Data.word_3 = XAscon128_ReadReg(InstancePtr->Ascon128_BaseAddress, XASCON128_ASCON128_ADDR_KEY_DATA + 12);
    return Data;
}

void XAscon128_Set_nonce(XAscon128 *InstancePtr, XAscon128_Nonce Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAscon128_WriteReg(InstancePtr->Ascon128_BaseAddress, XASCON128_ASCON128_ADDR_NONCE_DATA + 0, Data.word_0);
    XAscon128_WriteReg(InstancePtr->Ascon128_BaseAddress, XASCON128_ASCON128_ADDR_NONCE_DATA + 4, Data.word_1);
    XAscon128_WriteReg(InstancePtr->Ascon128_BaseAddress, XASCON128_ASCON128_ADDR_NONCE_DATA + 8, Data.word_2);
    XAscon128_WriteReg(InstancePtr->Ascon128_BaseAddress, XASCON128_ASCON128_ADDR_NONCE_DATA + 12, Data.word_3);
}

XAscon128_Nonce XAscon128_Get_nonce(XAscon128 *InstancePtr) {
    XAscon128_Nonce Data;

    Data.word_0 = XAscon128_ReadReg(InstancePtr->Ascon128_BaseAddress, XASCON128_ASCON128_ADDR_NONCE_DATA + 0);
    Data.word_1 = XAscon128_ReadReg(InstancePtr->Ascon128_BaseAddress, XASCON128_ASCON128_ADDR_NONCE_DATA + 4);
    Data.word_2 = XAscon128_ReadReg(InstancePtr->Ascon128_BaseAddress, XASCON128_ASCON128_ADDR_NONCE_DATA + 8);
    Data.word_3 = XAscon128_ReadReg(InstancePtr->Ascon128_BaseAddress, XASCON128_ASCON128_ADDR_NONCE_DATA + 12);
    return Data;
}

void XAscon128_Set_mode(XAscon128 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAscon128_WriteReg(InstancePtr->Ascon128_BaseAddress, XASCON128_ASCON128_ADDR_MODE_DATA, Data);
}

u32 XAscon128_Get_mode(XAscon128 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAscon128_ReadReg(InstancePtr->Ascon128_BaseAddress, XASCON128_ASCON128_ADDR_MODE_DATA);
    return Data;
}

void XAscon128_Set_skip_asso(XAscon128 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAscon128_WriteReg(InstancePtr->Ascon128_BaseAddress, XASCON128_ASCON128_ADDR_SKIP_ASSO_DATA, Data);
}

u32 XAscon128_Get_skip_asso(XAscon128 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAscon128_ReadReg(InstancePtr->Ascon128_BaseAddress, XASCON128_ASCON128_ADDR_SKIP_ASSO_DATA);
    return Data;
}

void XAscon128_Set_in_tag(XAscon128 *InstancePtr, XAscon128_In_tag Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAscon128_WriteReg(InstancePtr->Ascon128_BaseAddress, XASCON128_ASCON128_ADDR_IN_TAG_DATA + 0, Data.word_0);
    XAscon128_WriteReg(InstancePtr->Ascon128_BaseAddress, XASCON128_ASCON128_ADDR_IN_TAG_DATA + 4, Data.word_1);
    XAscon128_WriteReg(InstancePtr->Ascon128_BaseAddress, XASCON128_ASCON128_ADDR_IN_TAG_DATA + 8, Data.word_2);
    XAscon128_WriteReg(InstancePtr->Ascon128_BaseAddress, XASCON128_ASCON128_ADDR_IN_TAG_DATA + 12, Data.word_3);
}

XAscon128_In_tag XAscon128_Get_in_tag(XAscon128 *InstancePtr) {
    XAscon128_In_tag Data;

    Data.word_0 = XAscon128_ReadReg(InstancePtr->Ascon128_BaseAddress, XASCON128_ASCON128_ADDR_IN_TAG_DATA + 0);
    Data.word_1 = XAscon128_ReadReg(InstancePtr->Ascon128_BaseAddress, XASCON128_ASCON128_ADDR_IN_TAG_DATA + 4);
    Data.word_2 = XAscon128_ReadReg(InstancePtr->Ascon128_BaseAddress, XASCON128_ASCON128_ADDR_IN_TAG_DATA + 8);
    Data.word_3 = XAscon128_ReadReg(InstancePtr->Ascon128_BaseAddress, XASCON128_ASCON128_ADDR_IN_TAG_DATA + 12);
    return Data;
}

XAscon128_Out_tag XAscon128_Get_out_tag(XAscon128 *InstancePtr) {
    XAscon128_Out_tag Data;

    Data.word_0 = XAscon128_ReadReg(InstancePtr->Ascon128_BaseAddress, XASCON128_ASCON128_ADDR_OUT_TAG_DATA + 0);
    Data.word_1 = XAscon128_ReadReg(InstancePtr->Ascon128_BaseAddress, XASCON128_ASCON128_ADDR_OUT_TAG_DATA + 4);
    Data.word_2 = XAscon128_ReadReg(InstancePtr->Ascon128_BaseAddress, XASCON128_ASCON128_ADDR_OUT_TAG_DATA + 8);
    Data.word_3 = XAscon128_ReadReg(InstancePtr->Ascon128_BaseAddress, XASCON128_ASCON128_ADDR_OUT_TAG_DATA + 12);
    return Data;
}

u32 XAscon128_Get_out_tag_vld(XAscon128 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAscon128_ReadReg(InstancePtr->Ascon128_BaseAddress, XASCON128_ASCON128_ADDR_OUT_TAG_CTRL);
    return Data & 0x1;
}

u32 XAscon128_Get_success(XAscon128 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAscon128_ReadReg(InstancePtr->Ascon128_BaseAddress, XASCON128_ASCON128_ADDR_SUCCESS_DATA);
    return Data;
}

u32 XAscon128_Get_success_vld(XAscon128 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAscon128_ReadReg(InstancePtr->Ascon128_BaseAddress, XASCON128_ASCON128_ADDR_SUCCESS_CTRL);
    return Data & 0x1;
}

void XAscon128_InterruptGlobalEnable(XAscon128 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAscon128_WriteReg(InstancePtr->Ascon128_BaseAddress, XASCON128_ASCON128_ADDR_GIE, 1);
}

void XAscon128_InterruptGlobalDisable(XAscon128 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAscon128_WriteReg(InstancePtr->Ascon128_BaseAddress, XASCON128_ASCON128_ADDR_GIE, 0);
}

void XAscon128_InterruptEnable(XAscon128 *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XAscon128_ReadReg(InstancePtr->Ascon128_BaseAddress, XASCON128_ASCON128_ADDR_IER);
    XAscon128_WriteReg(InstancePtr->Ascon128_BaseAddress, XASCON128_ASCON128_ADDR_IER, Register | Mask);
}

void XAscon128_InterruptDisable(XAscon128 *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XAscon128_ReadReg(InstancePtr->Ascon128_BaseAddress, XASCON128_ASCON128_ADDR_IER);
    XAscon128_WriteReg(InstancePtr->Ascon128_BaseAddress, XASCON128_ASCON128_ADDR_IER, Register & (~Mask));
}

void XAscon128_InterruptClear(XAscon128 *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAscon128_WriteReg(InstancePtr->Ascon128_BaseAddress, XASCON128_ASCON128_ADDR_ISR, Mask);
}

u32 XAscon128_InterruptGetEnabled(XAscon128 *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XAscon128_ReadReg(InstancePtr->Ascon128_BaseAddress, XASCON128_ASCON128_ADDR_IER);
}

u32 XAscon128_InterruptGetStatus(XAscon128 *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XAscon128_ReadReg(InstancePtr->Ascon128_BaseAddress, XASCON128_ASCON128_ADDR_ISR);
}

