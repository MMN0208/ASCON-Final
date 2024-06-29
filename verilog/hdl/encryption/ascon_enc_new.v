module Ascon_new #(
    parameter k = 128,            // Key size
    parameter r = 128,            // Rate
    parameter a = 12,             // Initialization round no.
    parameter b = 6,              // Intermediate round no.
    parameter l = 80,            // Length of associated data
    parameter y = 80,             // Length of Plain Text
    parameter TI = 0,              // 1 for Yes; else No
    parameter FP = 0               // 1 for Yes; else No
)(
    input       clk,
    input       rst,
    input [23:0] keyxSI,
    input [23:0] noncexSI,
    input [23:0] associated_dataxSI,
    input [23:0] plain_textxSI,
    input       encryption_startxSI,
    input [55:0] r_64xSI,
    input [7:0] r_128xSI,
    input [7:0] r_ptxSI,

    output reg [7:0] cipher_textxSO,
    output reg [7:0] tagxSO,
    output      encryption_readyxSO //
);
    
    reg     [k-1:0]     key, random_key_1, random_key_2;      
    reg     [127:0]     nonce, random_nonce_1, random_nonce_2;
    reg     [l-1:0]     associated_data, random_ad_1, random_ad_2; 
    reg     [y-1:0]     plain_text, random_pt_1, random_pt_2;
    reg     [63:0]      r0,r1,r2,r3,r4,r5,r6;
    reg     [127:0]     random_fault_1;
    reg     [y-1:0]     random_fault_2;
    reg     [31:0]      i,j;
    wire    [y-1:0]     cipher_text;
    wire    [127:0]     tag;
    wire                ready, encryption_start, encryption_ready;

    // Left shift for Inputs
    always @(posedge clk) begin
        if(rst)
            {key,random_key_1,random_key_2,
            nonce,random_nonce_1,random_nonce_2,
            random_ad_1,random_ad_2,associated_data,
            random_pt_1,random_pt_2,plain_text,
            random_fault_1, random_fault_2,
            i,j} <= 0;

        else begin
            if(i < k) begin
                key <= {key[k-9:0], keyxSI[7:0]}; 
                random_key_1 <= {random_key_1[k-9:0], keyxSI[15:8]};
                random_key_2 <= {random_key_2[k-9:0], keyxSI[23:16]};
            end

            if(i < 128) begin
                nonce <= {nonce[119:0], noncexSI[7:0]};
                random_nonce_1 <= {random_nonce_1[119:0], noncexSI[15:8]};
                random_nonce_2 <= {random_nonce_2[119:0], noncexSI[23:16]};
                random_fault_1 <= {random_fault_1[119:0], r_128xSI};
            end

            if(i < l) begin
                associated_data <= {associated_data[l-9:0], associated_dataxSI[7:0]};
                random_ad_1 <= {random_ad_1[l-9:0], associated_dataxSI[15:8]};
                random_ad_2 <= {random_ad_2[l-9:0], associated_dataxSI[23:16]};
            end

            if(i < y) begin
                plain_text <= {plain_text[y-9:0], plain_textxSI[7:0]};
                random_pt_1 <= {random_pt_1[y-9:0], plain_textxSI[15:8]};
                random_pt_2 <= {random_pt_2[y-9:0], plain_textxSI[23:16]};
                random_fault_2 <= {random_fault_2[y-9:0], r_ptxSI};
            end

            if(i < 64) begin
                r0 <= {r0[55:0],r_64xSI[7:0]};
                r1 <= {r1[55:0],r_64xSI[15:8]};
                r2 <= {r2[55:0],r_64xSI[23:16]};
                r3 <= {r3[55:0],r_64xSI[31:24]};
                r4 <= {r4[55:0],r_64xSI[39:32]};
                r5 <= {r5[55:0],r_64xSI[47:40]};
                r6 <= {r6[55:0],r_64xSI[55:48]};
            end

            i <= i + 32'd8;
        end

        // Right Shift for encryption outputs
        if(encryption_ready) begin
            if(j < y)
                cipher_textxSO <= {cipher_text[j+32'd7], cipher_text[j+32'd6], cipher_text[j+32'd5], cipher_text[j+32'd4], cipher_text[j+32'd3], cipher_text[j+32'd2], cipher_text[j+32'd1], cipher_text[j]};
            
            if(j < 128)
                tagxSO <= {tag[j+32'd7], tag[j+32'd6], tag[j+32'd5], tag[j+32'd4], tag[j+32'd3], tag[j+32'd2], tag[j+32'd1], tag[j]};

            j <= j + 32'd8;
        end
    end

    assign ready = ((i>k) && (i>128) && (i>l) && (i>y))? 1 : 0;
    assign encryption_start = ready & encryption_startxSI;
    assign encryption_readyxSO = encryption_ready;

    // Instantiating Fault Countermeasure module
    FC #(
        k,r,a,b,l,y,TI,FP
    ) f(
        clk,
        rst,
        key, random_key_1, random_key_2,
        nonce, random_nonce_1, random_nonce_2,
        associated_data, random_ad_1, random_ad_2,
        plain_text, random_pt_1, random_pt_2,
        encryption_start,
        r0,r1,r2,r3,r4,r5,r6,
        random_fault_1, random_fault_2, 

        cipher_text,
        tag,           
        encryption_ready
    );
endmodule