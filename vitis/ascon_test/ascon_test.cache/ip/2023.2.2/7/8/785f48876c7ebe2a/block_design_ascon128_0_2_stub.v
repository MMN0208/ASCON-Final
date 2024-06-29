// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2.2 (win64) Build 4126759 Thu Feb  8 23:53:51 MST 2024
// Date        : Wed Apr 24 15:19:14 2024
// Host        : DELL running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ block_design_ascon128_0_2_stub.v
// Design      : block_design_ascon128_0_2
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu3eg-sbva484-1-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "ascon128,Vivado 2023.2.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(s_axi_ASCON128_AWADDR, 
  s_axi_ASCON128_AWVALID, s_axi_ASCON128_AWREADY, s_axi_ASCON128_WDATA, 
  s_axi_ASCON128_WSTRB, s_axi_ASCON128_WVALID, s_axi_ASCON128_WREADY, 
  s_axi_ASCON128_BRESP, s_axi_ASCON128_BVALID, s_axi_ASCON128_BREADY, 
  s_axi_ASCON128_ARADDR, s_axi_ASCON128_ARVALID, s_axi_ASCON128_ARREADY, 
  s_axi_ASCON128_RDATA, s_axi_ASCON128_RRESP, s_axi_ASCON128_RVALID, 
  s_axi_ASCON128_RREADY, ap_clk, ap_rst_n, interrupt, in_stream_TVALID, in_stream_TREADY, 
  in_stream_TDATA, in_stream_TLAST, in_stream_TKEEP, in_stream_TSTRB, out_stream_TVALID, 
  out_stream_TREADY, out_stream_TDATA, out_stream_TLAST, out_stream_TKEEP, 
  out_stream_TSTRB)
/* synthesis syn_black_box black_box_pad_pin="s_axi_ASCON128_AWADDR[7:0],s_axi_ASCON128_AWVALID,s_axi_ASCON128_AWREADY,s_axi_ASCON128_WDATA[31:0],s_axi_ASCON128_WSTRB[3:0],s_axi_ASCON128_WVALID,s_axi_ASCON128_WREADY,s_axi_ASCON128_BRESP[1:0],s_axi_ASCON128_BVALID,s_axi_ASCON128_BREADY,s_axi_ASCON128_ARADDR[7:0],s_axi_ASCON128_ARVALID,s_axi_ASCON128_ARREADY,s_axi_ASCON128_RDATA[31:0],s_axi_ASCON128_RRESP[1:0],s_axi_ASCON128_RVALID,s_axi_ASCON128_RREADY,ap_rst_n,interrupt,in_stream_TVALID,in_stream_TREADY,in_stream_TDATA[63:0],in_stream_TLAST[0:0],in_stream_TKEEP[7:0],in_stream_TSTRB[7:0],out_stream_TVALID,out_stream_TREADY,out_stream_TDATA[63:0],out_stream_TLAST[0:0],out_stream_TKEEP[7:0],out_stream_TSTRB[7:0]" */
/* synthesis syn_force_seq_prim="ap_clk" */;
  input [7:0]s_axi_ASCON128_AWADDR;
  input s_axi_ASCON128_AWVALID;
  output s_axi_ASCON128_AWREADY;
  input [31:0]s_axi_ASCON128_WDATA;
  input [3:0]s_axi_ASCON128_WSTRB;
  input s_axi_ASCON128_WVALID;
  output s_axi_ASCON128_WREADY;
  output [1:0]s_axi_ASCON128_BRESP;
  output s_axi_ASCON128_BVALID;
  input s_axi_ASCON128_BREADY;
  input [7:0]s_axi_ASCON128_ARADDR;
  input s_axi_ASCON128_ARVALID;
  output s_axi_ASCON128_ARREADY;
  output [31:0]s_axi_ASCON128_RDATA;
  output [1:0]s_axi_ASCON128_RRESP;
  output s_axi_ASCON128_RVALID;
  input s_axi_ASCON128_RREADY;
  input ap_clk /* synthesis syn_isclock = 1 */;
  input ap_rst_n;
  output interrupt;
  input in_stream_TVALID;
  output in_stream_TREADY;
  input [63:0]in_stream_TDATA;
  input [0:0]in_stream_TLAST;
  input [7:0]in_stream_TKEEP;
  input [7:0]in_stream_TSTRB;
  output out_stream_TVALID;
  input out_stream_TREADY;
  output [63:0]out_stream_TDATA;
  output [0:0]out_stream_TLAST;
  output [7:0]out_stream_TKEEP;
  output [7:0]out_stream_TSTRB;
endmodule
