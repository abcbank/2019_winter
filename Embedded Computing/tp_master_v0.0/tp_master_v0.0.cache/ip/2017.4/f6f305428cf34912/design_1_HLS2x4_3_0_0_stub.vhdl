-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
-- Date        : Tue Dec 10 00:59:25 2019
-- Host        : DESKTOP-2IB9KP7 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_HLS2x4_3_0_0_stub.vhdl
-- Design      : design_1_HLS2x4_3_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    ofmap_TDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ofmap_TVALID : out STD_LOGIC;
    ofmap_TREADY : in STD_LOGIC;
    ofmap_TLAST : out STD_LOGIC;
    ofmap_TKEEP : out STD_LOGIC_VECTOR ( 3 downto 0 );
    ifmap_TDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    ifmap_TVALID : in STD_LOGIC;
    ifmap_TREADY : out STD_LOGIC;
    ifmap_TLAST : in STD_LOGIC;
    ifmap_TKEEP : in STD_LOGIC_VECTOR ( 3 downto 0 );
    fmap_TDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    fmap_TVALID : in STD_LOGIC;
    fmap_TREADY : out STD_LOGIC;
    fmap_TLAST : in STD_LOGIC;
    fmap_TKEEP : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "ap_clk,ap_rst_n,ofmap_TDATA[31:0],ofmap_TVALID,ofmap_TREADY,ofmap_TLAST,ofmap_TKEEP[3:0],ifmap_TDATA[31:0],ifmap_TVALID,ifmap_TREADY,ifmap_TLAST,ifmap_TKEEP[3:0],fmap_TDATA[31:0],fmap_TVALID,fmap_TREADY,fmap_TLAST,fmap_TKEEP[3:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "HLS2x4_3,Vivado 2017.4";
begin
end;
