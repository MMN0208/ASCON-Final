`timescale 1ns/1ns
module tb_encryption;

    // parameter k = 128;            // Key size
    // parameter r = 64;            // Rate
    // parameter a = 12;             // Initialization round no.
    // parameter b = 6;              // Intermediate round no.
    // parameter l = 40;             // Length of associated data
    // parameter y = 40;             // Length of Plain Text
    // parameter TI = 1;
    // parameter FP = 1;

    parameter PERIOD = 20;          // Clock frequency

    parameter max = (`k>=`y && `k>=`l)? `k: ((`y>=`l)? `y: `l);

    reg       clk = 0;
    reg       rst;
    reg [23:0] keyxSI;
    reg [23:0] noncexSI;
    reg [23:0] associated_dataxSI;
    reg [23:0] plain_textxSI;
    reg       encryption_startxSI;
    reg [55:0] r_64xSI;
    reg [7:0] r_128xSI;
    reg [7:0] r_ptxSI;
    integer ctr = 0;
    reg [`y-1:0] cipher_text;
    reg [127:0] tag;

    wire [7:0] cipher_textxSO;
    wire [7:0] tagxSO;
    wire  encryption_readyxSO;
    integer check_time;

    // parameter KEY = 'h2db083053e848cefa30007336c47a5a1;
    // parameter NONCE = 'h3f3607dbce3503ba84f5843d623de056;
    // parameter AD = 'h4153434f4e;
    // parameter PT = 'h6173636f6e;

    Ascon_new #(
        `k,`r,`a,`b,`l,`y,`TI,`FP
    ) uut (
        clk,
        rst,
        keyxSI,
        noncexSI,
        associated_dataxSI,
        plain_textxSI,
        encryption_startxSI,
        r_64xSI,
        r_128xSI,
        r_ptxSI,
        cipher_textxSO,
        tagxSO,
        encryption_readyxSO
    );

    // Clock Generator of 10ns
    always #(PERIOD) clk = ~clk;

    task write;
    input [max-1:0] rd, i, key, nonce, ass_data, pt; 
    begin
        @(posedge clk);
        {r_128xSI, r_ptxSI, r_64xSI, keyxSI[23:8], associated_dataxSI[23:8], plain_textxSI[23:8], noncexSI[23:8]} = rd;
        keyxSI[7:0] = {key[`k-1-i], key[`k-2-i],key[`k-3-i], key[`k-4-i], key[`k-5-i], key[`k-6-i], key[`k-7-i], key[`k-8-i]};
        noncexSI[7:0] = {nonce[127-i], nonce[126-i], nonce[125-i], nonce[124-i], nonce[123-i], nonce[122-i], nonce[121-i], nonce[120-i]};
        plain_textxSI[7:0] = {pt[`y-1-i], pt[`y-2-i], pt[`y-3-i], pt[`y-4-i], pt[`y-5-i], pt[`y-6-i], pt[`y-7-i], pt[`y-8-i]};
        associated_dataxSI[7:0] = {ass_data[`l-1-i], ass_data[`l-2-i], ass_data[`l-3-i], ass_data[`l-4-i], ass_data[`l-5-i], ass_data[`l-6-i], ass_data[`l-7-i], ass_data[`l-8-i]};
    end
    endtask

    task read;
    input integer i;
    begin
        @(posedge clk);
        {cipher_text[i+7], cipher_text[i+6], cipher_text[i+5], cipher_text[i+4], cipher_text[i+3], cipher_text[i+2], cipher_text[i+1], cipher_text[i]} = cipher_textxSO;
        {tag[i+7], tag[i+6], tag[i+5], tag[i+4], tag[i+3], tag[i+2], tag[i+1], tag[i]} = tagxSO;
    end
    endtask

    initial begin
        $dumpfile("test.vcd");
        $dumpvars;
        $display("Start!");
        rst = 1;
        #(1.5*PERIOD)
        rst = 0;
        ctr = 0;
        check_time = $time;
        repeat(max / 8) begin
            write($random, ctr, `KEY, `NONCE, `AD, `PT);
            ctr = ctr + 8;
        end
        check_time = $time - check_time;
        $display("Write Done! It took%d clock cycles", check_time/(2*PERIOD));
        ctr = 0;
        encryption_startxSI = 1;
        check_time = $time;
        #(0.5*PERIOD)
        $display("Key:\t%h", uut.key);
        $display("Nonce:\t%h", uut.nonce);
        $display("AD:\t%h", uut.associated_data);
        $display("PT:\t%s", uut.plain_text);
        #(4.5*PERIOD)
        encryption_startxSI = 0;
    end

    always @(*) begin
        if(encryption_readyxSO) begin
            check_time = $time - check_time;
            $display("Encryption Done! It took%d clock cycles", check_time/(2*PERIOD));
            #(4*PERIOD)
            check_time = $time;
            repeat(max / 8) begin
                read(ctr);
                ctr = ctr + 8;
            end
            check_time = $time - check_time;
            $display("Read Done! It took%d clock cycles", check_time/(2*PERIOD));
            $display("CT:\t%h", cipher_text);
            $display("Tag:\t%h\n", tag);
            $finish;
        end
    end
endmodule