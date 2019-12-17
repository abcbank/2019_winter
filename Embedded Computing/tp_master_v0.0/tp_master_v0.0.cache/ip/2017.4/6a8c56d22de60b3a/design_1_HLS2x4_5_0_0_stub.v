// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Tue Dec 10 00:42:52 2019
// Host        : DESKTOP-2IB9KP7 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_HLS2x4_5_0_0_stub.v
// Design      : design_1_HLS2x4_5_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "HLS2x4_5,Vivado 2017.4" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(ap_clk, ap_rst_n, ofmap_TDATA, ofmap_TVALID, 
  ofmap_TREADY, ofmap_TLAST, ofmap_TKEEP, ifmap_TDATA, ifmap_TVALID, ifmap_TREADY, ifmap_TLAST, 
  ifmap_TKEEP, fmap_TDATA, fmap_TVALID, fmap_TREADY, fmap_TLAST, fmap_TKEEP)
/* synthesis syn_black_box black_box_pad_pin="ap_clk,ap_rst_n,ofmap_TDATA[31:0],ofmap_TVALID,ofmap_TREADY,ofmap_TLAST,ofmap_TKEEP[3:0],ifmap_TDATA[31:0],ifmap_TVALID,ifmap_TREADY,ifmap_TLAST,ifmap_TKEEP[3:0],fmap_TDATA[31:0],fmap_TVALID,fmap_TREADY,fmap_TLAST,fmap_TKEEP[3:0]" */;
  input ap_clk;
  input ap_rst_n;
  output [31:0]ofmap_TDATA;
  output ofmap_TVALID;
  input ofmap_TREADY;
  output ofmap_TLAST;
  output [3:0]ofmap_TKEEP;
  input [31:0]ifmap_TDATA;
  input ifmap_TVALID;
  output ifmap_TREADY;
  input ifmap_TLAST;
  input [3:0]ifmap_TKEEP;
  input [31:0]fmap_TDATA;
  input fmap_TVALID;
  output fmap_TREADY;
  input fmap_TLAST;
  input [3:0]fmap_TKEEP;
endmodule
