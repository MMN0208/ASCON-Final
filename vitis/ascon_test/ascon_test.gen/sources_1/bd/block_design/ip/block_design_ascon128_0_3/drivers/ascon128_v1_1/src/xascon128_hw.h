// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
// ASCON128
// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read/COR)
//        bit 7  - auto_restart (Read/Write)
//        bit 9  - interrupt (Read)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0 - enable ap_done interrupt (Read/Write)
//        bit 1 - enable ap_ready interrupt (Read/Write)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0 - ap_done (Read/TOW)
//        bit 1 - ap_ready (Read/TOW)
//        others - reserved
// 0x10 : Data signal of key
//        bit 31~0 - key[31:0] (Read/Write)
// 0x14 : Data signal of key
//        bit 31~0 - key[63:32] (Read/Write)
// 0x18 : Data signal of key
//        bit 31~0 - key[95:64] (Read/Write)
// 0x1c : Data signal of key
//        bit 31~0 - key[127:96] (Read/Write)
// 0x20 : reserved
// 0x24 : Data signal of nonce
//        bit 31~0 - nonce[31:0] (Read/Write)
// 0x28 : Data signal of nonce
//        bit 31~0 - nonce[63:32] (Read/Write)
// 0x2c : Data signal of nonce
//        bit 31~0 - nonce[95:64] (Read/Write)
// 0x30 : Data signal of nonce
//        bit 31~0 - nonce[127:96] (Read/Write)
// 0x34 : reserved
// 0x38 : Data signal of mode
//        bit 0  - mode[0] (Read/Write)
//        others - reserved
// 0x3c : reserved
// 0x40 : Data signal of skip_asso
//        bit 0  - skip_asso[0] (Read/Write)
//        others - reserved
// 0x44 : reserved
// 0x48 : Data signal of in_tag
//        bit 31~0 - in_tag[31:0] (Read/Write)
// 0x4c : Data signal of in_tag
//        bit 31~0 - in_tag[63:32] (Read/Write)
// 0x50 : Data signal of in_tag
//        bit 31~0 - in_tag[95:64] (Read/Write)
// 0x54 : Data signal of in_tag
//        bit 31~0 - in_tag[127:96] (Read/Write)
// 0x58 : reserved
// 0x5c : Data signal of out_tag
//        bit 31~0 - out_tag[31:0] (Read)
// 0x60 : Data signal of out_tag
//        bit 31~0 - out_tag[63:32] (Read)
// 0x64 : Data signal of out_tag
//        bit 31~0 - out_tag[95:64] (Read)
// 0x68 : Data signal of out_tag
//        bit 31~0 - out_tag[127:96] (Read)
// 0x6c : Control signal of out_tag
//        bit 0  - out_tag_ap_vld (Read/COR)
//        others - reserved
// 0x84 : Data signal of success
//        bit 0  - success[0] (Read)
//        others - reserved
// 0x88 : Control signal of success
//        bit 0  - success_ap_vld (Read/COR)
//        others - reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XASCON128_ASCON128_ADDR_AP_CTRL        0x00
#define XASCON128_ASCON128_ADDR_GIE            0x04
#define XASCON128_ASCON128_ADDR_IER            0x08
#define XASCON128_ASCON128_ADDR_ISR            0x0c
#define XASCON128_ASCON128_ADDR_KEY_DATA       0x10
#define XASCON128_ASCON128_BITS_KEY_DATA       128
#define XASCON128_ASCON128_ADDR_NONCE_DATA     0x24
#define XASCON128_ASCON128_BITS_NONCE_DATA     128
#define XASCON128_ASCON128_ADDR_MODE_DATA      0x38
#define XASCON128_ASCON128_BITS_MODE_DATA      1
#define XASCON128_ASCON128_ADDR_SKIP_ASSO_DATA 0x40
#define XASCON128_ASCON128_BITS_SKIP_ASSO_DATA 1
#define XASCON128_ASCON128_ADDR_IN_TAG_DATA    0x48
#define XASCON128_ASCON128_BITS_IN_TAG_DATA    128
#define XASCON128_ASCON128_ADDR_OUT_TAG_DATA   0x5c
#define XASCON128_ASCON128_BITS_OUT_TAG_DATA   128
#define XASCON128_ASCON128_ADDR_OUT_TAG_CTRL   0x6c
#define XASCON128_ASCON128_ADDR_SUCCESS_DATA   0x84
#define XASCON128_ASCON128_BITS_SUCCESS_DATA   1
#define XASCON128_ASCON128_ADDR_SUCCESS_CTRL   0x88

