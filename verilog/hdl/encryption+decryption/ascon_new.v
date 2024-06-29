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
    input [39:0] keyxSI,
    input [39:0] noncexSI,
    input [39:0] associated_dataxSI,
    input [39:0] plain_textxSI,
    input       encryption_startxSI,
    input       decryption_startxSI,
    input [111:0] r_64xSI,
    input [23:0] r_128xSI,
    input [23:0] r_ptxSI,

    output reg  [7:0] cipher_textxSO,
    output reg  [7:0] plain_textxSO,
    output reg  [7:0] tagxSO, dec_tagxSO,      
    output      encryption_readyxSO,
    output      decryption_readyxSO,     
    output      message_authentication   //
);
    
    reg     [k-1:0]     key,random_key_1,random_key_2, random_key_3, random_key_4;      
    reg     [127:0]     nonce,random_nonce_1,random_nonce_2, random_nonce_3, random_nonce_4;
    reg     [l-1:0]     associated_data, random_ad_1, random_ad_2, random_ad_3, random_ad_4; 
    reg     [y-1:0]     plain_text, random_pt_1, random_pt_2, random_ct_1, random_ct_2;
    reg     [63:0]      r0,r1,r2,r3,r4,r5,r6;
    reg     [63:0]      r7,r8,r9,r10,r11,r12,r13;
    reg     [127:0]     random_fault_1, random_fault_2, random_dec_1;
    reg     [y-1:0]     random_fault_3, random_fault_4, random_dec_2;
    reg     [31:0]      i, j, m;        // Counter registers
    wire    [y-1:0]     dec_plain_text;
    wire    [y-1:0]     cipher_text;
    wire    [127:0]     tag, dec_tag;
    wire                ready, encryption_start;
    wire                permutation_ready, permutation_start;

    // Left shift for Inputs
    always @(posedge clk) begin
        if(rst)
            {key,random_key_1,random_key_2,random_key_3,random_key_4,
            nonce,random_nonce_1,random_nonce_2,random_nonce_3,random_nonce_4,
            random_ad_1,random_ad_2,random_ad_3,random_ad_4,associated_data,
            random_pt_1,random_pt_2,plain_text,
            random_ct_1,random_ct_2,
            i,j,m} <= 0;

        else begin
            if(i < k) begin
                key <= {key[k-9:0], keyxSI[7:0]}; 
                random_key_1 <= {random_key_1[k-9:0], keyxSI[15:8]};
                random_key_2 <= {random_key_2[k-8:0], keyxSI[23:16]};
                random_key_3 <= {random_key_3[k-9:0], keyxSI[31:24]};
                random_key_4 <= {random_key_4[k-8:0], keyxSI[39:32]};
            end

            if(i < 128) begin
                nonce <= {nonce[119:0], noncexSI[7:0]};
                random_nonce_1 <= {random_nonce_1[119:0], noncexSI[15:8]};
                random_nonce_2 <= {random_nonce_2[119:0], noncexSI[23:15]};
                random_nonce_3 <= {random_nonce_3[119:0], noncexSI[31:24]};
                random_nonce_4 <= {random_nonce_4[119:0], noncexSI[39:32]};
                random_fault_1 <= {random_fault_1[119:0], r_128xSI[7:0]};
                random_fault_2 <= {random_fault_2[119:0], r_128xSI[15:8]};
                random_dec_1 <= {random_dec_1[119:0], r_128xSI[23:16]};
            end

            if(i < l) begin
                associated_data <= {associated_data[l-9:0], associated_dataxSI[7:0]};
                random_ad_1 <= {random_ad_1[l-9:0], associated_dataxSI[15:8]};
                random_ad_2 <= {random_ad_2[l-9:0], associated_dataxSI[23:16]};
                random_ad_3 <= {random_ad_3[l-9:0], associated_dataxSI[31:24]};
                random_ad_4 <= {random_ad_4[l-9:0], associated_dataxSI[39:32]};
            end

            if(i < y) begin
                plain_text <= {plain_text[y-9:0], plain_textxSI[7:0]};
                random_pt_1 <= {random_pt_1[y-9:0], plain_textxSI[15:8]};
                random_pt_2 <= {random_pt_2[y-9:0], plain_textxSI[23:16]};
                random_ct_1 <= {random_ct_1[y-9:0], plain_textxSI[31:24]};
                random_ct_2 <= {random_ct_2[y-9:0], plain_textxSI[39:32]};
                random_fault_3 <= {random_fault_3[y-9:0], r_ptxSI[7:0]};
                random_fault_4 <= {random_fault_4[y-9:0], r_ptxSI[15:8]};
                random_dec_2 <= {random_dec_2[y-9:0], r_ptxSI[23:16]};
            end

            if(i < 64) begin
                r0 <= {r0[55:0],r_64xSI[7:0]};
                r1 <= {r1[55:0],r_64xSI[15:8]};
                r2 <= {r2[55:0],r_64xSI[23:16]};
                r3 <= {r3[55:0],r_64xSI[31:24]};
                r4 <= {r4[55:0],r_64xSI[39:32]};
                r5 <= {r5[55:0],r_64xSI[47:40]};
                r6 <= {r6[55:0],r_64xSI[55:48]};
                r7 <= {r7[55:0],r_64xSI[63:56]};
                r8 <= {r8[55:0],r_64xSI[71:64]};
                r9 <= {r9[55:0],r_64xSI[79:72]};
                r10 <= {r10[55:0],r_64xSI[87:80]};
                r11 <= {r11[55:0],r_64xSI[95:88]};
                r12 <= {r12[55:0],r_64xSI[103:96]};
                r13 <= {r13[55:0],r_64xSI[111:104]};
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

        // Right Shift for decryption outputs
        if(decryption_ready) begin
            if(message_authentication) begin
                if(m < y)
                    plain_textxSO <= {dec_plain_text[m+32'd7], dec_plain_text[m+32'd6], dec_plain_text[m+32'd5], dec_plain_text[m+32'd4], dec_plain_text[m+32'd3], dec_plain_text[m+32'd2], dec_plain_text[m+32'd1], dec_plain_text[m]};
            
                if(m < 128)
                    dec_tagxSO <= {dec_tag[m+32'd7], dec_tag[m+32'd6], dec_tag[m+32'd5], dec_tag[m+32'd4], dec_tag[m+32'd3], dec_tag[m+32'd2], dec_tag[m+32'd1], dec_tag[m]};

                m <= m + 32'd8;
            end
            // If message is not authenticated, then a random message is outputted
            else begin
               if(m < y)
                    plain_textxSO <= {random_dec_2[m+32'd7], random_dec_2[m+32'd6], random_dec_2[m+32'd5], random_dec_2[m+32'd4], random_dec_2[m+32'd3], random_dec_2[m+32'd2], random_dec_2[m+32'd1], random_dec_2[m]};
                
                if(m < 128)
                    dec_tagxSO <= {random_dec_1[m+32'd7], random_dec_1[m+32'd6], random_dec_1[m+32'd5], random_dec_1[m+32'd4], random_dec_1[m+32'd3], random_dec_1[m+32'd2], random_dec_1[m+32'd1], random_dec_1[m]};

                m <= m + 32'd8; 
            end
        end
    end

    assign ready = ((i>k) && (i>128) && (i>l) && (i>y))? 1 : 0;
    assign encryption_start = ready & encryption_startxSI;

    assign encryption_readyxSO = encryption_ready;
    assign decryption_readyxSO = decryption_ready;

    // Instantiating Fault Countermeasure module
    FC #(
        k,r,a,b,l,y,TI,FP
    ) f(
        clk,
        rst,
        key, random_key_1, random_key_2, random_key_3, random_key_4,
        nonce, random_nonce_1, random_nonce_2, random_nonce_3, random_nonce_4,
        associated_data, random_ad_1, random_ad_2, random_ad_3, random_ad_4,
        plain_text, random_pt_1, random_pt_2, random_ct_1, random_ct_2,
        encryption_start,
        decryption_startxSI,
        r0,r1,r2,r3,r4,r5,r6,
        r7,r8,r9,r10,r11,r12,r13,
        random_fault_1, random_fault_2,
        random_fault_3, random_fault_4,

        cipher_text,
        dec_plain_text,            
        tag,           
        dec_tag,          
        encryption_ready,
        decryption_ready,
        message_authentication
    );
endmodule