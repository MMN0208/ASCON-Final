-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2.2 (win64) Build 4126759 Thu Feb  8 23:53:51 MST 2024
-- Date        : Wed Apr 17 14:18:34 2024
-- Host        : DELL running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ block_design_ascon128_0_0_stub.vhdl
-- Design      : block_design_ascon128_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu3eg-sbva484-1-i
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    s_axi_ASCON128_AWADDR : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_ASCON128_AWVALID : in STD_LOGIC;
    s_axi_ASCON128_AWREADY : out STD_LOGIC;
    s_axi_ASCON128_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_ASCON128_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_ASCON128_WVALID : in STD_LOGIC;
    s_axi_ASCON128_WREADY : out STD_LOGIC;
    s_axi_ASCON128_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_ASCON128_BVALID : out STD_LOGIC;
    s_axi_ASCON128_BREADY : in STD_LOGIC;
    s_axi_ASCON128_ARADDR : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_ASCON128_ARVALID : in STD_LOGIC;
    s_axi_ASCON128_ARREADY : out STD_LOGIC;
    s_axi_ASCON128_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_ASCON128_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_ASCON128_RVALID : out STD_LOGIC;
    s_axi_ASCON128_RREADY : in STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    interrupt : out STD_LOGIC;
    asso_data_TVALID : in STD_LOGIC;
    asso_data_TREADY : out STD_LOGIC;
    asso_data_TDATA : in STD_LOGIC_VECTOR ( 63 downto 0 );
    asso_data_TLAST : in STD_LOGIC_VECTOR ( 0 to 0 );
    asso_data_TKEEP : in STD_LOGIC_VECTOR ( 7 downto 0 );
    asso_data_TSTRB : in STD_LOGIC_VECTOR ( 7 downto 0 );
    asso_data_TUSER : in STD_LOGIC_VECTOR ( 0 to 0 );
    in_stream_TVALID : in STD_LOGIC;
    in_stream_TREADY : out STD_LOGIC;
    in_stream_TDATA : in STD_LOGIC_VECTOR ( 63 downto 0 );
    in_stream_TLAST : in STD_LOGIC_VECTOR ( 0 to 0 );
    in_stream_TKEEP : in STD_LOGIC_VECTOR ( 7 downto 0 );
    in_stream_TSTRB : in STD_LOGIC_VECTOR ( 7 downto 0 );
    in_stream_TUSER : in STD_LOGIC_VECTOR ( 0 to 0 );
    out_stream_TVALID : out STD_LOGIC;
    out_stream_TREADY : in STD_LOGIC;
    out_stream_TDATA : out STD_LOGIC_VECTOR ( 63 downto 0 );
    out_stream_TLAST : out STD_LOGIC_VECTOR ( 0 to 0 );
    out_stream_TKEEP : out STD_LOGIC_VECTOR ( 7 downto 0 );
    out_stream_TSTRB : out STD_LOGIC_VECTOR ( 7 downto 0 );
    out_stream_TUSER : out STD_LOGIC_VECTOR ( 0 to 0 )
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "s_axi_ASCON128_AWADDR[7:0],s_axi_ASCON128_AWVALID,s_axi_ASCON128_AWREADY,s_axi_ASCON128_WDATA[31:0],s_axi_ASCON128_WSTRB[3:0],s_axi_ASCON128_WVALID,s_axi_ASCON128_WREADY,s_axi_ASCON128_BRESP[1:0],s_axi_ASCON128_BVALID,s_axi_ASCON128_BREADY,s_axi_ASCON128_ARADDR[7:0],s_axi_ASCON128_ARVALID,s_axi_ASCON128_ARREADY,s_axi_ASCON128_RDATA[31:0],s_axi_ASCON128_RRESP[1:0],s_axi_ASCON128_RVALID,s_axi_ASCON128_RREADY,ap_clk,ap_rst_n,interrupt,asso_data_TVALID,asso_data_TREADY,asso_data_TDATA[63:0],asso_data_TLAST[0:0],asso_data_TKEEP[7:0],asso_data_TSTRB[7:0],asso_data_TUSER[0:0],in_stream_TVALID,in_stream_TREADY,in_stream_TDATA[63:0],in_stream_TLAST[0:0],in_stream_TKEEP[7:0],in_stream_TSTRB[7:0],in_stream_TUSER[0:0],out_stream_TVALID,out_stream_TREADY,out_stream_TDATA[63:0],out_stream_TLAST[0:0],out_stream_TKEEP[7:0],out_stream_TSTRB[7:0],out_stream_TUSER[0:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "ascon128,Vivado 2023.2.2";
begin
end;
