
=
Command: %s
53*	vivadotcl2

opt_designZ4-113h px� 

@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
Implementation2	
xczu3egZ17-347h px� 
o
0Got license for feature '%s' and/or device '%s'
310*common2
Implementation2	
xczu3egZ17-349h px� 
\
,Running DRC as a precondition to command %s
22*	vivadotcl2

opt_designZ4-22h px� 
@

Starting %s Task
103*constraints2
DRCZ18-103h px� 
>
Running DRC with %s threads
24*drc2
2Z23-27h px� 
C
DRC finished with %s
272*project2

0 ErrorsZ1-461h px� 
d
BPlease refer to the DRC report (report_drc) for more information.
274*projectZ1-462h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:00 ; elapsed = 00:00:01 . Memory (MB): peak = 1981.340 ; gain = 0.000h px� 
U

Starting %s Task
103*constraints2
Cache Timing InformationZ18-103h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
V
%s*common2=
;Ending Cache Timing Information Task | Checksum: 16d5928d1
h px� 
�

%s
*constraints2a
_Time (s): cpu = 00:00:01 ; elapsed = 00:00:00.523 . Memory (MB): peak = 1981.340 ; gain = 0.000h px� 
O

Starting %s Task
103*constraints2
Logic OptimizationZ18-103h px� 
K

Phase %s%s
101*constraints2
1 2
InitializationZ18-101h px� 
_

Phase %s%s
101*constraints2
1.1 2"
 Core Generation And Design SetupZ18-101h px� 
\
%s*common2C
APhase 1.1 Core Generation And Design Setup | Checksum: 16d5928d1
h px� 
�

%s
*constraints2a
_Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.003 . Memory (MB): peak = 2310.844 ; gain = 0.000h px� 
a

Phase %s%s
101*constraints2
1.2 2$
"Setup Constraints And Sort NetlistZ18-101h px� 
^
%s*common2E
CPhase 1.2 Setup Constraints And Sort Netlist | Checksum: 16d5928d1
h px� 
�

%s
*constraints2a
_Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.012 . Memory (MB): peak = 2310.844 ; gain = 0.000h px� 
H
%s*common2/
-Phase 1 Initialization | Checksum: 16d5928d1
h px� 
�

%s
*constraints2a
_Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.013 . Memory (MB): peak = 2310.844 ; gain = 0.000h px� 
d

Phase %s%s
101*constraints2
2 2)
'Timer Update And Timing Data CollectionZ18-101h px� 
K

Phase %s%s
101*constraints2
2.1 2
Timer UpdateZ18-101h px� 
H
%s*common2/
-Phase 2.1 Timer Update | Checksum: 16d5928d1
h px� 
�

%s
*constraints2a
_Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.264 . Memory (MB): peak = 2310.844 ; gain = 0.000h px� 
U

Phase %s%s
101*constraints2
2.2 2
Timing Data CollectionZ18-101h px� 
R
%s*common29
7Phase 2.2 Timing Data Collection | Checksum: 16d5928d1
h px� 
�

%s
*constraints2a
_Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.294 . Memory (MB): peak = 2310.844 ; gain = 0.000h px� 
a
%s*common2H
FPhase 2 Timer Update And Timing Data Collection | Checksum: 16d5928d1
h px� 
�

%s
*constraints2a
_Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.295 . Memory (MB): peak = 2310.844 ; gain = 0.000h px� 
E

Phase %s%s
101*constraints2
3 2

RetargetZ18-101h px� 
d
9Pulled %s inverters resulting in an inversion of %s pins
779*opt2
42
34Z31-1566h px� 
U
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
462
2326Z31-138h px� 
9
Retargeted %s cell(s).
49*opt2
0Z31-49h px� 
B
%s*common2)
'Phase 3 Retarget | Checksum: 116164693
h px� 
�

%s
*constraints2a
_Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.793 . Memory (MB): peak = 2310.844 ; gain = 0.000h px� 
4
Retarget | Checksum: 116164693
*commonh px� 
f
.Phase %s created %s cells and removed %s cells267*opt2

Retarget2
702
450Z31-389h px� 
�
�In phase %s, %s netlist objects are constrained preventing optimization. Please run opt_design with -debug_log to get more detail. 510*opt2

Retarget2
75Z31-1021h px� 
Q

Phase %s%s
101*constraints2
4 2
Constant propagationZ18-101h px� 
Q
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02
0Z31-138h px� 
M
%s*common24
2Phase 4 Constant propagation | Checksum: 42635b09
h px� 
�

%s
*constraints2a
_Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.876 . Memory (MB): peak = 2310.844 ; gain = 0.000h px� 
?
*Constant propagation | Checksum: 42635b09
*commonh px� 
q
.Phase %s created %s cells and removed %s cells267*opt2
Constant propagation2
222
37Z31-389h px� 
�
�In phase %s, %s netlist objects are constrained preventing optimization. Please run opt_design with -debug_log to get more detail. 510*opt2
Constant propagation2
75Z31-1021h px� 
B

Phase %s%s
101*constraints2
5 2
SweepZ18-101h px� 
>
%s*common2%
#Phase 5 Sweep | Checksum: 2c8de8ce
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:01 ; elapsed = 00:00:01 . Memory (MB): peak = 2310.844 ; gain = 0.000h px� 
0
Sweep | Checksum: 2c8de8ce
*commonh px� 
a
.Phase %s created %s cells and removed %s cells267*opt2
Sweep2
02
38Z31-389h px� 
�
�In phase %s, %s netlist objects are constrained preventing optimization. Please run opt_design with -debug_log to get more detail. 510*opt2
Sweep2
219Z31-1021h px� 
N

Phase %s%s
101*constraints2
6 2
BUFG optimizationZ18-101h px� 
u
PPhase BUFG optimization inserted %s global clock buffer(s) for CLOCK_LOW_FANOUT.553*opt2
0Z31-1077h px� 
J
%s*common21
/Phase 6 BUFG optimization | Checksum: 2c8de8ce
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:01 ; elapsed = 00:00:02 . Memory (MB): peak = 2310.844 ; gain = 0.000h px� 
<
'BUFG optimization | Checksum: 2c8de8ce
*commonh px� 
�
EPhase %s created %s cells of which %s are BUFGs and removed %s cells.395*opt2
BUFG optimization2
02
02
0Z31-662h px� 
X

Phase %s%s
101*constraints2
7 2
Shift Register OptimizationZ18-101h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s00_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][0]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s00_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][10]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s00_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][11]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s00_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][12]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s00_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][13]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s00_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][14]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s00_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][15]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s00_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][16]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s00_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][17]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s00_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][18]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s00_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][19]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s00_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][1]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s00_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][20]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s00_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][21]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s00_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][22]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s00_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][23]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s00_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][24]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s00_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][25]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s00_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][26]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s00_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][27]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s00_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][28]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s00_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][29]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s00_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][2]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s00_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][30]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s00_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][31]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s00_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][32]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s00_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][33]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s00_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][3]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s00_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][4]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s00_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][5]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s00_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][6]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s00_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][7]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s00_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][8]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s00_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][9]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s00_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31][0]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s00_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][0]_srl42
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s00_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][1]_srl42
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s00_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][2]_srl42
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s00_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][3]_srl42
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s00_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][4]_srl42
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s00_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][5]_srl42
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s00_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][6]_srl42
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s00_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][7]_srl42
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s00_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bresp_fifo_0/memory_reg[3][0]_srl42
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s00_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bresp_fifo_0/memory_reg[3][1]_srl42
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s01_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][0]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s01_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][10]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s01_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][11]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s01_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][12]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s01_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][13]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s01_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][14]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s01_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][15]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s01_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][16]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s01_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][17]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s01_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][18]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s01_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][19]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s01_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][1]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s01_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][20]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s01_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][21]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s01_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][22]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s01_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][23]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s01_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][24]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s01_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][25]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s01_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][26]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s01_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][27]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s01_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][28]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s01_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][29]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s01_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][2]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s01_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][30]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s01_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][31]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s01_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][32]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s01_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][33]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s01_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][3]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s01_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][4]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s01_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][5]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s01_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][6]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s01_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][7]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s01_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][8]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s01_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/rd_data_fifo_0/memory_reg[31][9]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s01_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/RD.r_channel_0/transaction_fifo_0/memory_reg[31][0]_srl322
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s01_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][0]_srl42
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s01_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][1]_srl42
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s01_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][2]_srl42
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s01_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][3]_srl42
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s01_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][4]_srl42
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s01_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][5]_srl42
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s01_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][6]_srl42
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s01_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bid_fifo_0/memory_reg[3][7]_srl42
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s01_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bresp_fifo_0/memory_reg[3][0]_srl42
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/ps8_0_axi_periph/s01_couplers/auto_pc/inst/gen_axilite.gen_b2s_conv.axilite_b2s/WR.b_channel_0/bresp_fifo_0/memory_reg[3][1]_srl42
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/axi_smc/inst/m00_exit_pipeline/m00_exit/inst/exit_inst/gen_r_cmd_fifo.r_cmd_fifo/gen_srls[11].srl_nx1/shift_reg_reg[0]_srl162
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/axi_smc/inst/m00_exit_pipeline/m00_exit/inst/exit_inst/gen_r_cmd_fifo.r_cmd_fifo/gen_srls[14].srl_nx1/shift_reg_reg[0]_srl162
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/axi_smc/inst/m00_exit_pipeline/m00_exit/inst/exit_inst/gen_r_cmd_fifo.r_cmd_fifo/gen_srls[15].srl_nx1/shift_reg_reg[0]_srl162
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/axi_smc/inst/m00_exit_pipeline/m00_exit/inst/exit_inst/gen_r_cmd_fifo.r_cmd_fifo/gen_srls[16].srl_nx1/shift_reg_reg[0]_srl162
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/axi_smc/inst/m00_exit_pipeline/m00_exit/inst/exit_inst/gen_r_cmd_fifo.r_cmd_fifo/gen_srls[17].srl_nx1/shift_reg_reg[0]_srl162
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/axi_smc/inst/m00_exit_pipeline/m00_exit/inst/exit_inst/gen_r_cmd_fifo.r_cmd_fifo/gen_srls[4].srl_nx1/shift_reg_reg[0]_srl162
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/axi_smc_1/inst/m00_exit_pipeline/m00_exit/inst/exit_inst/gen_w_cmd_fifo.w_cmd_fifo/gen_srls[1].srl_nx1/shift_reg_reg[0]_srl162
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/axi_smc_1/inst/m00_exit_pipeline/m00_exit/inst/exit_inst/gen_w_cmd_fifo.w_cmd_fifo/gen_srls[2].srl_nx1/shift_reg_reg[0]_srl162
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/axi_smc_1/inst/m00_exit_pipeline/m00_exit/inst/exit_inst/gen_w_cmd_fifo.w_cmd_fifo/gen_srls[3].srl_nx1/shift_reg_reg[0]_srl162
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�block_design_i/axi_smc_1/inst/s00_entry_pipeline/s00_si_converter/inst/gen_normal.splitter_inst/gen_no_wsplitter.gen_endpoint_woffset.gen_wbypass_offset_fifo.wbypass_offset_fifo/gen_srls[0].srl_nx1/shift_reg_reg[0]_srl162
none static srl address bitsZ31-1131h px� 
�
�Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2
Opt 31-11312
100Z17-14h px� 
�
dSRL Remap converted %s SRLs to %s registers and converted %s registers of register chains to %s SRLs546*opt2
02
02
02
0Z31-1064h px� 
T
%s*common2;
9Phase 7 Shift Register Optimization | Checksum: 2c8de8ce
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:01 ; elapsed = 00:00:02 . Memory (MB): peak = 2310.844 ; gain = 0.000h px� 
F
1Shift Register Optimization | Checksum: 2c8de8ce
*commonh px� 
v
.Phase %s created %s cells and removed %s cells267*opt2
Shift Register Optimization2
02
0Z31-389h px� 
T

Phase %s%s
101*constraints2
8 2
Post Processing NetlistZ18-101h px� 
P
%s*common27
5Phase 8 Post Processing Netlist | Checksum: 2c8de8ce
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:01 ; elapsed = 00:00:02 . Memory (MB): peak = 2310.844 ; gain = 0.000h px� 
B
-Post Processing Netlist | Checksum: 2c8de8ce
*commonh px� 
r
.Phase %s created %s cells and removed %s cells267*opt2
Post Processing Netlist2
02
0Z31-389h px� 
�
�In phase %s, %s netlist objects are constrained preventing optimization. Please run opt_design with -debug_log to get more detail. 510*opt2
Post Processing Netlist2
87Z31-1021h px� 
I

Phase %s%s
101*constraints2
9 2
FinalizationZ18-101h px� 
j

Phase %s%s
101*constraints2
9.1 2-
+Finalizing Design Cores and Updating ShapesZ18-101h px� 
g
%s*common2N
LPhase 9.1 Finalizing Design Cores and Updating Shapes | Checksum: 19cb72f8e
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:01 ; elapsed = 00:00:02 . Memory (MB): peak = 2310.844 ; gain = 0.000h px� 
]

Phase %s%s
101*constraints2
9.2 2 
Verifying Netlist ConnectivityZ18-101h px� 
O

Starting %s Task
103*constraints2
Connectivity CheckZ18-103h px� 
�

%s
*constraints2a
_Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.019 . Memory (MB): peak = 2310.844 ; gain = 0.000h px� 
Z
%s*common2A
?Phase 9.2 Verifying Netlist Connectivity | Checksum: 19cb72f8e
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:01 ; elapsed = 00:00:02 . Memory (MB): peak = 2310.844 ; gain = 0.000h px� 
F
%s*common2-
+Phase 9 Finalization | Checksum: 19cb72f8e
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:01 ; elapsed = 00:00:02 . Memory (MB): peak = 2310.844 ; gain = 0.000h px� 
/
Opt_design Change Summary
*commonh px� 
/
=========================
*commonh px� 


*commonh px� 


*commonh px� 
�
z-------------------------------------------------------------------------------------------------------------------------
*commonh px� 
�
�|  Phase                        |  #Cells created  |  #Cells Removed  |  #Constrained objects preventing optimizations  |
-------------------------------------------------------------------------------------------------------------------------
*commonh px� 
�
�|  Retarget                     |              70  |             450  |                                             75  |
|  Constant propagation         |              22  |              37  |                                             75  |
|  Sweep                        |               0  |              38  |                                            219  |
|  BUFG optimization            |               0  |               0  |                                              0  |
|  Shift Register Optimization  |               0  |               0  |                                              0  |
|  Post Processing Netlist      |               0  |               0  |                                             87  |
-------------------------------------------------------------------------------------------------------------------------
*commonh px� 


*commonh px� 


*commonh px� 
P
%s*common27
5Ending Logic Optimization Task | Checksum: 19cb72f8e
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:01 ; elapsed = 00:00:02 . Memory (MB): peak = 2310.844 ; gain = 0.000h px� 
b
2Building netlist checker database with flags, 0x%s23991*constraints2
8Z18-11670h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2*
(Done building netlist checker database: 2

00:00:002
00:00:00.0102

2310.8442
0.000Z17-268h px� 
O

Starting %s Task
103*constraints2
Power OptimizationZ18-103h px� 
a
7Will skip clock gating for clocks with period < %s ns.
114*pwropt2
2.00Z34-132h px� 
=
Applying IDT optimizations ...
9*pwroptZ34-9h px� 
?
Applying ODC optimizations ...
10*pwroptZ34-10h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
K
,Running Vector-less Activity Propagation...
51*powerZ33-51h px� 
P
3
Finished Running Vector-less Activity Propagation
1*powerZ33-1h px� 


*pwropth px� 
S

Starting %s Task
103*constraints2
PowerOpt Patch EnablesZ18-103h px� 
�
�WRITE_MODE attribute of %s BRAM(s) out of a total of %s has been updated to save power.
    Run report_power_opt to get a complete listing of the BRAMs updated.
129*pwropt2
02
4Z34-162h px� 
R
+Structural ODC has moved %s WE to EN ports
155*pwropt2
2Z34-201h px� 
r
CNumber of BRAM Ports augmented: %s newly gated: %s Total Ports: %s
65*pwropt2
32
22
8Z34-65h px� 
S
%s*common2:
8Ending PowerOpt Patch Enables Task | Checksum: fd0843d2
h px� 
�

%s
*constraints2a
_Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.054 . Memory (MB): peak = 2944.512 ; gain = 0.000h px� 
O
%s*common26
4Ending Power Optimization Task | Checksum: fd0843d2
h px� 


%s
*constraints2_
]Time (s): cpu = 00:00:04 ; elapsed = 00:00:10 . Memory (MB): peak = 2944.512 ; gain = 633.668h px� 
J

Starting %s Task
103*constraints2
Final CleanupZ18-103h px� 
J
%s*common21
/Ending Final Cleanup Task | Checksum: fd0843d2
h px� 
�

%s
*constraints2a
_Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.001 . Memory (MB): peak = 2944.512 ; gain = 0.000h px� 
P

Starting %s Task
103*constraints2
Netlist ObfuscationZ18-103h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0182

2944.5122
0.000Z17-268h px� 
P
%s*common27
5Ending Netlist Obfuscation Task | Checksum: 9951d33f
h px� 
�

%s
*constraints2a
_Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.020 . Memory (MB): peak = 2944.512 ; gain = 0.000h px� 
H
Releasing license: %s
83*common2
ImplementationZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
442
2582
552
0Z4-41h px� 
J
%s completed successfully
29*	vivadotcl2

opt_designZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
opt_design: 2

00:00:062

00:00:162

2944.5122	
963.172Z17-268h px� 
�
%s4*runtcl2�
�Executing : report_drc -file block_design_wrapper_drc_opted.rpt -pb block_design_wrapper_drc_opted.pb -rpx block_design_wrapper_drc_opted.rpx
h px� 
�
Command: %s
53*	vivadotcl2�
�report_drc -file block_design_wrapper_drc_opted.rpt -pb block_design_wrapper_drc_opted.pb -rpx block_design_wrapper_drc_opted.rpxZ4-113h px� 
>
IP Catalog is up to date.1232*coregenZ19-1839h px� 
>
Running DRC with %s threads
24*drc2
2Z23-27h px� 
�
#The results of DRC are in file %s.
586*	vivadotcl2�
iC:/Users/ADMIN/Documents/ASCON-Vitis/ascon_test/ascon_test.runs/impl_1/block_design_wrapper_drc_opted.rptiC:/Users/ADMIN/Documents/ASCON-Vitis/ascon_test/ascon_test.runs/impl_1/block_design_wrapper_drc_opted.rpt8Z2-168h px� 
J
%s completed successfully
29*	vivadotcl2

report_drcZ4-42h px� 
H
&Writing timing data to binary archive.266*timingZ38-480h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write ShapeDB Complete: 2

00:00:002
00:00:00.0162

2944.5122
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2e
cC:/Users/ADMIN/Documents/ASCON-Vitis/ascon_test/ascon_test.runs/impl_1/block_design_wrapper_opt.dcpZ17-1381h px� 


End Record