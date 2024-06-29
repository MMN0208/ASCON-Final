// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XASCON128_H
#define XASCON128_H

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
#include "xascon128_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
#ifdef SDT
    char *Name;
#else
    u16 DeviceId;
#endif
    u64 Ascon128_BaseAddress;
} XAscon128_Config;
#endif

typedef struct {
    u64 Ascon128_BaseAddress;
    u32 IsReady;
} XAscon128;

typedef u32 word_type;

typedef struct {
    u32 word_0;
    u32 word_1;
    u32 word_2;
    u32 word_3;
} XAscon128_Key;

typedef struct {
    u32 word_0;
    u32 word_1;
    u32 word_2;
    u32 word_3;
} XAscon128_Nonce;

typedef struct {
    u32 word_0;
    u32 word_1;
    u32 word_2;
    u32 word_3;
} XAscon128_In_tag;

typedef struct {
    u32 word_0;
    u32 word_1;
    u32 word_2;
    u32 word_3;
} XAscon128_Out_tag;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XAscon128_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XAscon128_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XAscon128_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XAscon128_ReadReg(BaseAddress, RegOffset) \
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
#ifdef SDT
int XAscon128_Initialize(XAscon128 *InstancePtr, UINTPTR BaseAddress);
XAscon128_Config* XAscon128_LookupConfig(UINTPTR BaseAddress);
#else
int XAscon128_Initialize(XAscon128 *InstancePtr, u16 DeviceId);
XAscon128_Config* XAscon128_LookupConfig(u16 DeviceId);
#endif
int XAscon128_CfgInitialize(XAscon128 *InstancePtr, XAscon128_Config *ConfigPtr);
#else
int XAscon128_Initialize(XAscon128 *InstancePtr, const char* InstanceName);
int XAscon128_Release(XAscon128 *InstancePtr);
#endif

void XAscon128_Start(XAscon128 *InstancePtr);
u32 XAscon128_IsDone(XAscon128 *InstancePtr);
u32 XAscon128_IsIdle(XAscon128 *InstancePtr);
u32 XAscon128_IsReady(XAscon128 *InstancePtr);
void XAscon128_EnableAutoRestart(XAscon128 *InstancePtr);
void XAscon128_DisableAutoRestart(XAscon128 *InstancePtr);

void XAscon128_Set_key(XAscon128 *InstancePtr, XAscon128_Key Data);
XAscon128_Key XAscon128_Get_key(XAscon128 *InstancePtr);
void XAscon128_Set_nonce(XAscon128 *InstancePtr, XAscon128_Nonce Data);
XAscon128_Nonce XAscon128_Get_nonce(XAscon128 *InstancePtr);
void XAscon128_Set_mode(XAscon128 *InstancePtr, u32 Data);
u32 XAscon128_Get_mode(XAscon128 *InstancePtr);
void XAscon128_Set_skip_asso(XAscon128 *InstancePtr, u32 Data);
u32 XAscon128_Get_skip_asso(XAscon128 *InstancePtr);
void XAscon128_Set_in_tag(XAscon128 *InstancePtr, XAscon128_In_tag Data);
XAscon128_In_tag XAscon128_Get_in_tag(XAscon128 *InstancePtr);
XAscon128_Out_tag XAscon128_Get_out_tag(XAscon128 *InstancePtr);
u32 XAscon128_Get_out_tag_vld(XAscon128 *InstancePtr);
u32 XAscon128_Get_success(XAscon128 *InstancePtr);
u32 XAscon128_Get_success_vld(XAscon128 *InstancePtr);

void XAscon128_InterruptGlobalEnable(XAscon128 *InstancePtr);
void XAscon128_InterruptGlobalDisable(XAscon128 *InstancePtr);
void XAscon128_InterruptEnable(XAscon128 *InstancePtr, u32 Mask);
void XAscon128_InterruptDisable(XAscon128 *InstancePtr, u32 Mask);
void XAscon128_InterruptClear(XAscon128 *InstancePtr, u32 Mask);
u32 XAscon128_InterruptGetEnabled(XAscon128 *InstancePtr);
u32 XAscon128_InterruptGetStatus(XAscon128 *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
