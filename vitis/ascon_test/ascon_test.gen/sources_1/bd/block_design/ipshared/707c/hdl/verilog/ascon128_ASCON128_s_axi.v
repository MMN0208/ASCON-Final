// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
`timescale 1ns/1ps
module ascon128_ASCON128_s_axi
#(parameter
    C_S_AXI_ADDR_WIDTH = 8,
    C_S_AXI_DATA_WIDTH = 32
)(
    input  wire                          ACLK,
    input  wire                          ARESET,
    input  wire                          ACLK_EN,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] AWADDR,
    input  wire                          AWVALID,
    output wire                          AWREADY,
    input  wire [C_S_AXI_DATA_WIDTH-1:0] WDATA,
    input  wire [C_S_AXI_DATA_WIDTH/8-1:0] WSTRB,
    input  wire                          WVALID,
    output wire                          WREADY,
    output wire [1:0]                    BRESP,
    output wire                          BVALID,
    input  wire                          BREADY,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] ARADDR,
    input  wire                          ARVALID,
    output wire                          ARREADY,
    output wire [C_S_AXI_DATA_WIDTH-1:0] RDATA,
    output wire [1:0]                    RRESP,
    output wire                          RVALID,
    input  wire                          RREADY,
    output wire                          interrupt,
    output wire [127:0]                  key,
    output wire [127:0]                  nonce,
    output wire [0:0]                    mode,
    output wire [0:0]                    skip_asso,
    output wire [127:0]                  in_tag,
    input  wire [127:0]                  out_tag,
    input  wire                          out_tag_ap_vld,
    input  wire [0:0]                    success,
    input  wire                          success_ap_vld,
    output wire                          ap_start,
    input  wire                          ap_done,
    input  wire                          ap_ready,
    input  wire                          ap_idle
);
//------------------------Address Info-------------------
// Protocol Used: ap_ctrl_hs
//
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

//------------------------Parameter----------------------
localparam
    ADDR_AP_CTRL          = 8'h00,
    ADDR_GIE              = 8'h04,
    ADDR_IER              = 8'h08,
    ADDR_ISR              = 8'h0c,
    ADDR_KEY_DATA_0       = 8'h10,
    ADDR_KEY_DATA_1       = 8'h14,
    ADDR_KEY_DATA_2       = 8'h18,
    ADDR_KEY_DATA_3       = 8'h1c,
    ADDR_KEY_CTRL         = 8'h20,
    ADDR_NONCE_DATA_0     = 8'h24,
    ADDR_NONCE_DATA_1     = 8'h28,
    ADDR_NONCE_DATA_2     = 8'h2c,
    ADDR_NONCE_DATA_3     = 8'h30,
    ADDR_NONCE_CTRL       = 8'h34,
    ADDR_MODE_DATA_0      = 8'h38,
    ADDR_MODE_CTRL        = 8'h3c,
    ADDR_SKIP_ASSO_DATA_0 = 8'h40,
    ADDR_SKIP_ASSO_CTRL   = 8'h44,
    ADDR_IN_TAG_DATA_0    = 8'h48,
    ADDR_IN_TAG_DATA_1    = 8'h4c,
    ADDR_IN_TAG_DATA_2    = 8'h50,
    ADDR_IN_TAG_DATA_3    = 8'h54,
    ADDR_IN_TAG_CTRL      = 8'h58,
    ADDR_OUT_TAG_DATA_0   = 8'h5c,
    ADDR_OUT_TAG_DATA_1   = 8'h60,
    ADDR_OUT_TAG_DATA_2   = 8'h64,
    ADDR_OUT_TAG_DATA_3   = 8'h68,
    ADDR_OUT_TAG_CTRL     = 8'h6c,
    ADDR_SUCCESS_DATA_0   = 8'h84,
    ADDR_SUCCESS_CTRL     = 8'h88,
    WRIDLE                = 2'd0,
    WRDATA                = 2'd1,
    WRRESP                = 2'd2,
    WRRESET               = 2'd3,
    RDIDLE                = 2'd0,
    RDDATA                = 2'd1,
    RDRESET               = 2'd2,
    ADDR_BITS                = 8;

//------------------------Local signal-------------------
    reg  [1:0]                    wstate = WRRESET;
    reg  [1:0]                    wnext;
    reg  [ADDR_BITS-1:0]          waddr;
    wire [C_S_AXI_DATA_WIDTH-1:0] wmask;
    wire                          aw_hs;
    wire                          w_hs;
    reg  [1:0]                    rstate = RDRESET;
    reg  [1:0]                    rnext;
    reg  [C_S_AXI_DATA_WIDTH-1:0] rdata;
    wire                          ar_hs;
    wire [ADDR_BITS-1:0]          raddr;
    // internal registers
    reg                           int_ap_idle;
    reg                           int_ap_ready = 1'b0;
    wire                          task_ap_ready;
    reg                           int_ap_done = 1'b0;
    wire                          task_ap_done;
    reg                           int_task_ap_done = 1'b0;
    reg                           int_ap_start = 1'b0;
    reg                           int_interrupt = 1'b0;
    reg                           int_auto_restart = 1'b0;
    reg                           auto_restart_status = 1'b0;
    wire                          auto_restart_done;
    reg                           int_gie = 1'b0;
    reg  [1:0]                    int_ier = 2'b0;
    reg  [1:0]                    int_isr = 2'b0;
    reg  [127:0]                  int_key = 'b0;
    reg  [127:0]                  int_nonce = 'b0;
    reg  [0:0]                    int_mode = 'b0;
    reg  [0:0]                    int_skip_asso = 'b0;
    reg  [127:0]                  int_in_tag = 'b0;
    reg                           int_out_tag_ap_vld;
    reg  [127:0]                  int_out_tag = 'b0;
    reg                           int_success_ap_vld;
    reg  [0:0]                    int_success = 'b0;

//------------------------Instantiation------------------


//------------------------AXI write fsm------------------
assign AWREADY = (wstate == WRIDLE);
assign WREADY  = (wstate == WRDATA);
assign BRESP   = 2'b00;  // OKAY
assign BVALID  = (wstate == WRRESP);
assign wmask   = { {8{WSTRB[3]}}, {8{WSTRB[2]}}, {8{WSTRB[1]}}, {8{WSTRB[0]}} };
assign aw_hs   = AWVALID & AWREADY;
assign w_hs    = WVALID & WREADY;

// wstate
always @(posedge ACLK) begin
    if (ARESET)
        wstate <= WRRESET;
    else if (ACLK_EN)
        wstate <= wnext;
end

// wnext
always @(*) begin
    case (wstate)
        WRIDLE:
            if (AWVALID)
                wnext = WRDATA;
            else
                wnext = WRIDLE;
        WRDATA:
            if (WVALID)
                wnext = WRRESP;
            else
                wnext = WRDATA;
        WRRESP:
            if (BREADY)
                wnext = WRIDLE;
            else
                wnext = WRRESP;
        default:
            wnext = WRIDLE;
    endcase
end

// waddr
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (aw_hs)
            waddr <= AWADDR[ADDR_BITS-1:0];
    end
end

//------------------------AXI read fsm-------------------
assign ARREADY = (rstate == RDIDLE);
assign RDATA   = rdata;
assign RRESP   = 2'b00;  // OKAY
assign RVALID  = (rstate == RDDATA);
assign ar_hs   = ARVALID & ARREADY;
assign raddr   = ARADDR[ADDR_BITS-1:0];

// rstate
always @(posedge ACLK) begin
    if (ARESET)
        rstate <= RDRESET;
    else if (ACLK_EN)
        rstate <= rnext;
end

// rnext
always @(*) begin
    case (rstate)
        RDIDLE:
            if (ARVALID)
                rnext = RDDATA;
            else
                rnext = RDIDLE;
        RDDATA:
            if (RREADY & RVALID)
                rnext = RDIDLE;
            else
                rnext = RDDATA;
        default:
            rnext = RDIDLE;
    endcase
end

// rdata
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs) begin
            rdata <= 'b0;
            case (raddr)
                ADDR_AP_CTRL: begin
                    rdata[0] <= int_ap_start;
                    rdata[1] <= int_task_ap_done;
                    rdata[2] <= int_ap_idle;
                    rdata[3] <= int_ap_ready;
                    rdata[7] <= int_auto_restart;
                    rdata[9] <= int_interrupt;
                end
                ADDR_GIE: begin
                    rdata <= int_gie;
                end
                ADDR_IER: begin
                    rdata <= int_ier;
                end
                ADDR_ISR: begin
                    rdata <= int_isr;
                end
                ADDR_KEY_DATA_0: begin
                    rdata <= int_key[31:0];
                end
                ADDR_KEY_DATA_1: begin
                    rdata <= int_key[63:32];
                end
                ADDR_KEY_DATA_2: begin
                    rdata <= int_key[95:64];
                end
                ADDR_KEY_DATA_3: begin
                    rdata <= int_key[127:96];
                end
                ADDR_NONCE_DATA_0: begin
                    rdata <= int_nonce[31:0];
                end
                ADDR_NONCE_DATA_1: begin
                    rdata <= int_nonce[63:32];
                end
                ADDR_NONCE_DATA_2: begin
                    rdata <= int_nonce[95:64];
                end
                ADDR_NONCE_DATA_3: begin
                    rdata <= int_nonce[127:96];
                end
                ADDR_MODE_DATA_0: begin
                    rdata <= int_mode[0:0];
                end
                ADDR_SKIP_ASSO_DATA_0: begin
                    rdata <= int_skip_asso[0:0];
                end
                ADDR_IN_TAG_DATA_0: begin
                    rdata <= int_in_tag[31:0];
                end
                ADDR_IN_TAG_DATA_1: begin
                    rdata <= int_in_tag[63:32];
                end
                ADDR_IN_TAG_DATA_2: begin
                    rdata <= int_in_tag[95:64];
                end
                ADDR_IN_TAG_DATA_3: begin
                    rdata <= int_in_tag[127:96];
                end
                ADDR_OUT_TAG_DATA_0: begin
                    rdata <= int_out_tag[31:0];
                end
                ADDR_OUT_TAG_DATA_1: begin
                    rdata <= int_out_tag[63:32];
                end
                ADDR_OUT_TAG_DATA_2: begin
                    rdata <= int_out_tag[95:64];
                end
                ADDR_OUT_TAG_DATA_3: begin
                    rdata <= int_out_tag[127:96];
                end
                ADDR_OUT_TAG_CTRL: begin
                    rdata[0] <= int_out_tag_ap_vld;
                end
                ADDR_SUCCESS_DATA_0: begin
                    rdata <= int_success[0:0];
                end
                ADDR_SUCCESS_CTRL: begin
                    rdata[0] <= int_success_ap_vld;
                end
            endcase
        end
    end
end


//------------------------Register logic-----------------
assign interrupt         = int_interrupt;
assign ap_start          = int_ap_start;
assign task_ap_done      = (ap_done && !auto_restart_status) || auto_restart_done;
assign task_ap_ready     = ap_ready && !int_auto_restart;
assign auto_restart_done = auto_restart_status && (ap_idle && !int_ap_idle);
assign key               = int_key;
assign nonce             = int_nonce;
assign mode              = int_mode;
assign skip_asso         = int_skip_asso;
assign in_tag            = int_in_tag;
// int_interrupt
always @(posedge ACLK) begin
    if (ARESET)
        int_interrupt <= 1'b0;
    else if (ACLK_EN) begin
        if (int_gie && (|int_isr))
            int_interrupt <= 1'b1;
        else
            int_interrupt <= 1'b0;
    end
end

// int_ap_start
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_start <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AP_CTRL && WSTRB[0] && WDATA[0])
            int_ap_start <= 1'b1;
        else if (ap_ready)
            int_ap_start <= int_auto_restart; // clear on handshake/auto restart
    end
end

// int_ap_done
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_done <= 1'b0;
    else if (ACLK_EN) begin
            int_ap_done <= ap_done;
    end
end

// int_task_ap_done
always @(posedge ACLK) begin
    if (ARESET)
        int_task_ap_done <= 1'b0;
    else if (ACLK_EN) begin
        if (task_ap_done)
            int_task_ap_done <= 1'b1;
        else if (ar_hs && raddr == ADDR_AP_CTRL)
            int_task_ap_done <= 1'b0; // clear on read
    end
end

// int_ap_idle
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_idle <= 1'b0;
    else if (ACLK_EN) begin
            int_ap_idle <= ap_idle;
    end
end

// int_ap_ready
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_ready <= 1'b0;
    else if (ACLK_EN) begin
        if (task_ap_ready)
            int_ap_ready <= 1'b1;
        else if (ar_hs && raddr == ADDR_AP_CTRL)
            int_ap_ready <= 1'b0;
    end
end

// int_auto_restart
always @(posedge ACLK) begin
    if (ARESET)
        int_auto_restart <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AP_CTRL && WSTRB[0])
            int_auto_restart <=  WDATA[7];
    end
end

// auto_restart_status
always @(posedge ACLK) begin
    if (ARESET)
        auto_restart_status <= 1'b0;
    else if (ACLK_EN) begin
        if (int_auto_restart)
            auto_restart_status <= 1'b1;
        else if (ap_idle)
            auto_restart_status <= 1'b0;
    end
end

// int_gie
always @(posedge ACLK) begin
    if (ARESET)
        int_gie <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_GIE && WSTRB[0])
            int_gie <= WDATA[0];
    end
end

// int_ier
always @(posedge ACLK) begin
    if (ARESET)
        int_ier <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IER && WSTRB[0])
            int_ier <= WDATA[1:0];
    end
end

// int_isr[0]
always @(posedge ACLK) begin
    if (ARESET)
        int_isr[0] <= 1'b0;
    else if (ACLK_EN) begin
        if (int_ier[0] & ap_done)
            int_isr[0] <= 1'b1;
        else if (w_hs && waddr == ADDR_ISR && WSTRB[0])
            int_isr[0] <= int_isr[0] ^ WDATA[0]; // toggle on write
    end
end

// int_isr[1]
always @(posedge ACLK) begin
    if (ARESET)
        int_isr[1] <= 1'b0;
    else if (ACLK_EN) begin
        if (int_ier[1] & ap_ready)
            int_isr[1] <= 1'b1;
        else if (w_hs && waddr == ADDR_ISR && WSTRB[0])
            int_isr[1] <= int_isr[1] ^ WDATA[1]; // toggle on write
    end
end

// int_key[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_key[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_KEY_DATA_0)
            int_key[31:0] <= (WDATA[31:0] & wmask) | (int_key[31:0] & ~wmask);
    end
end

// int_key[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_key[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_KEY_DATA_1)
            int_key[63:32] <= (WDATA[31:0] & wmask) | (int_key[63:32] & ~wmask);
    end
end

// int_key[95:64]
always @(posedge ACLK) begin
    if (ARESET)
        int_key[95:64] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_KEY_DATA_2)
            int_key[95:64] <= (WDATA[31:0] & wmask) | (int_key[95:64] & ~wmask);
    end
end

// int_key[127:96]
always @(posedge ACLK) begin
    if (ARESET)
        int_key[127:96] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_KEY_DATA_3)
            int_key[127:96] <= (WDATA[31:0] & wmask) | (int_key[127:96] & ~wmask);
    end
end

// int_nonce[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_nonce[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_NONCE_DATA_0)
            int_nonce[31:0] <= (WDATA[31:0] & wmask) | (int_nonce[31:0] & ~wmask);
    end
end

// int_nonce[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_nonce[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_NONCE_DATA_1)
            int_nonce[63:32] <= (WDATA[31:0] & wmask) | (int_nonce[63:32] & ~wmask);
    end
end

// int_nonce[95:64]
always @(posedge ACLK) begin
    if (ARESET)
        int_nonce[95:64] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_NONCE_DATA_2)
            int_nonce[95:64] <= (WDATA[31:0] & wmask) | (int_nonce[95:64] & ~wmask);
    end
end

// int_nonce[127:96]
always @(posedge ACLK) begin
    if (ARESET)
        int_nonce[127:96] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_NONCE_DATA_3)
            int_nonce[127:96] <= (WDATA[31:0] & wmask) | (int_nonce[127:96] & ~wmask);
    end
end

// int_mode[0:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_mode[0:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_MODE_DATA_0)
            int_mode[0:0] <= (WDATA[31:0] & wmask) | (int_mode[0:0] & ~wmask);
    end
end

// int_skip_asso[0:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_skip_asso[0:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_SKIP_ASSO_DATA_0)
            int_skip_asso[0:0] <= (WDATA[31:0] & wmask) | (int_skip_asso[0:0] & ~wmask);
    end
end

// int_in_tag[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_tag[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_TAG_DATA_0)
            int_in_tag[31:0] <= (WDATA[31:0] & wmask) | (int_in_tag[31:0] & ~wmask);
    end
end

// int_in_tag[63:32]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_tag[63:32] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_TAG_DATA_1)
            int_in_tag[63:32] <= (WDATA[31:0] & wmask) | (int_in_tag[63:32] & ~wmask);
    end
end

// int_in_tag[95:64]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_tag[95:64] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_TAG_DATA_2)
            int_in_tag[95:64] <= (WDATA[31:0] & wmask) | (int_in_tag[95:64] & ~wmask);
    end
end

// int_in_tag[127:96]
always @(posedge ACLK) begin
    if (ARESET)
        int_in_tag[127:96] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IN_TAG_DATA_3)
            int_in_tag[127:96] <= (WDATA[31:0] & wmask) | (int_in_tag[127:96] & ~wmask);
    end
end

// int_out_tag
always @(posedge ACLK) begin
    if (ARESET)
        int_out_tag <= 0;
    else if (ACLK_EN) begin
        if (out_tag_ap_vld)
            int_out_tag <= out_tag;
    end
end

// int_out_tag_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_out_tag_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (out_tag_ap_vld)
            int_out_tag_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_OUT_TAG_CTRL)
            int_out_tag_ap_vld <= 1'b0; // clear on read
    end
end

// int_success
always @(posedge ACLK) begin
    if (ARESET)
        int_success <= 0;
    else if (ACLK_EN) begin
        if (success_ap_vld)
            int_success <= success;
    end
end

// int_success_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_success_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (success_ap_vld)
            int_success_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_SUCCESS_CTRL)
            int_success_ap_vld <= 1'b0; // clear on read
    end
end

//synthesis translate_off
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (int_gie & ~int_isr[0] & int_ier[0] & ap_done)
            $display ("// Interrupt Monitor : interrupt for ap_done detected @ \"%0t\"", $time);
        if (int_gie & ~int_isr[1] & int_ier[1] & ap_ready)
            $display ("// Interrupt Monitor : interrupt for ap_ready detected @ \"%0t\"", $time);
    end
end
//synthesis translate_on

//------------------------Memory logic-------------------

endmodule
