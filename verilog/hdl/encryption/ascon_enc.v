module Ascon #(
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
    input [2:0] keyxSI,
    input [2:0] noncexSI,
    input [2:0] associated_dataxSI,
    input [2:0] plain_textxSI,
    input       encryption_startxSI,
    input [6:0] r_64xSI,
    input       r_128xSI,
    input       r_ptxSI,

    output reg  cipher_textxSO,
    output reg  tagxSO,
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
    wire                permutation_ready, permutation_start;

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
                key <= {key[k-2:0], keyxSI[0]}; 
                random_key_1 <= {random_key_1[k-2:0], keyxSI[1]};
                random_key_2 <= {random_key_2[k-1:0], keyxSI[2]};
            end

            if(i < 128) begin
                nonce <= {nonce[126:0], noncexSI[0]};
                random_nonce_1 <= {random_nonce_1[126:0], noncexSI[1]};
                random_nonce_2 <= {random_nonce_2[126:0], noncexSI[2]};
                random_fault_1 <= {random_fault_1[126:0], r_128xSI};
            end

            if(i < l) begin
                associated_data <= {associated_data[l-2:0], associated_dataxSI[0]};
                random_ad_1 <= {random_ad_1[l-2:0], associated_dataxSI[1]};
                random_ad_2 <= {random_ad_2[l-2:0], associated_dataxSI[2]};
            end

            if(i < y) begin
                plain_text <= {plain_text[y-2:0], plain_textxSI[0]};
                random_pt_1 <= {random_pt_1[y-2:0], plain_textxSI[1]};
                random_pt_2 <= {random_pt_2[y-2:0], plain_textxSI[2]};
                random_fault_2 <= {random_fault_2[y-2:0], r_ptxSI};
            end

            if(i < 64) begin
                r0 <= {r0[62:0],r_64xSI[0]};
                r1 <= {r1[62:0],r_64xSI[1]};
                r2 <= {r2[62:0],r_64xSI[2]};
                r3 <= {r3[62:0],r_64xSI[3]};
                r4 <= {r4[62:0],r_64xSI[4]};
                r5 <= {r5[62:0],r_64xSI[5]};
                r6 <= {r6[62:0],r_64xSI[6]};
            end

            i <= i+1;
        end

        // Right Shift for encryption outputs
        if(encryption_ready) begin
            if(j < y)
                cipher_textxSO <= {cipher_text[j+7], cipher_text[j+6], cipher_text[j+5], cipher_text[j+4], cipher_text[j+3], cipher_text[j+2], cipher_text[j+1], cipher_text[j]};
            
            if(j < 128)
                tagxSO <= {tag[j+7], tag[j+6], tag[j+5], tag[j+4], tag[j+3], tag[j+2], tag[j+1], tag[j]};

            j <= j+1;
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