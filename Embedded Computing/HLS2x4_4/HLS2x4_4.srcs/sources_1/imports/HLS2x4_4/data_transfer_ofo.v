// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2017.4.1
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module data_transfer_ofo (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        ofmap_TDATA,
        ofmap_TVALID,
        ofmap_TREADY,
        O_BRAM_0_address0,
        O_BRAM_0_ce0,
        O_BRAM_0_q0,
        O_BRAM_0_address1,
        O_BRAM_0_ce1,
        O_BRAM_0_we1,
        O_BRAM_0_d1,
        O_BRAM_1_address0,
        O_BRAM_1_ce0,
        O_BRAM_1_q0,
        O_BRAM_1_address1,
        O_BRAM_1_ce1,
        O_BRAM_1_we1,
        O_BRAM_1_d1,
        O_BRAM_2_address0,
        O_BRAM_2_ce0,
        O_BRAM_2_q0,
        O_BRAM_2_address1,
        O_BRAM_2_ce1,
        O_BRAM_2_we1,
        O_BRAM_2_d1,
        O_BRAM_3_address0,
        O_BRAM_3_ce0,
        O_BRAM_3_q0,
        O_BRAM_3_address1,
        O_BRAM_3_ce1,
        O_BRAM_3_we1,
        O_BRAM_3_d1,
        m,
        f
);

parameter    ap_ST_fsm_state1 = 4'd1;
parameter    ap_ST_fsm_state2 = 4'd2;
parameter    ap_ST_fsm_pp0_stage0 = 4'd4;
parameter    ap_ST_fsm_state6 = 4'd8;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [15:0] ofmap_TDATA;
output   ofmap_TVALID;
input   ofmap_TREADY;
output  [7:0] O_BRAM_0_address0;
output   O_BRAM_0_ce0;
input  [15:0] O_BRAM_0_q0;
output  [7:0] O_BRAM_0_address1;
output   O_BRAM_0_ce1;
output   O_BRAM_0_we1;
output  [15:0] O_BRAM_0_d1;
output  [7:0] O_BRAM_1_address0;
output   O_BRAM_1_ce0;
input  [15:0] O_BRAM_1_q0;
output  [7:0] O_BRAM_1_address1;
output   O_BRAM_1_ce1;
output   O_BRAM_1_we1;
output  [15:0] O_BRAM_1_d1;
output  [7:0] O_BRAM_2_address0;
output   O_BRAM_2_ce0;
input  [15:0] O_BRAM_2_q0;
output  [7:0] O_BRAM_2_address1;
output   O_BRAM_2_ce1;
output   O_BRAM_2_we1;
output  [15:0] O_BRAM_2_d1;
output  [7:0] O_BRAM_3_address0;
output   O_BRAM_3_ce0;
input  [15:0] O_BRAM_3_q0;
output  [7:0] O_BRAM_3_address1;
output   O_BRAM_3_ce1;
output   O_BRAM_3_we1;
output  [15:0] O_BRAM_3_d1;
input  [6:0] m;
input  [2:0] f;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg ofmap_TVALID;
reg O_BRAM_0_ce0;
reg O_BRAM_0_ce1;
reg O_BRAM_0_we1;
reg O_BRAM_1_ce0;
reg O_BRAM_1_ce1;
reg O_BRAM_1_we1;
reg O_BRAM_2_ce0;
reg O_BRAM_2_ce1;
reg O_BRAM_2_we1;
reg O_BRAM_3_ce0;
reg O_BRAM_3_ce1;
reg O_BRAM_3_we1;

(* fsm_encoding = "none" *) reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    ofmap_TDATA_blk_n;
reg    ap_enable_reg_pp0_iter2;
wire    ap_block_pp0_stage0;
reg   [0:0] exitcond_flatten_reg_370;
reg   [0:0] ap_reg_pp0_iter1_exitcond_flatten_reg_370;
reg   [35:0] indvar_flatten_reg_149;
reg   [3:0] j_reg_160;
reg   [31:0] k_reg_171;
wire  signed [3:0] f_cast2_fu_180_p1;
reg  signed [3:0] f_cast2_reg_333;
wire   [4:0] tmp_1_fu_192_p2;
reg   [4:0] tmp_1_reg_339;
wire   [5:0] tmp_5_fu_216_p2;
reg   [5:0] tmp_5_reg_344;
wire   [31:0] f_cast1_fu_222_p1;
reg   [31:0] f_cast1_reg_349;
wire    ap_CS_fsm_state2;
wire   [31:0] tmp_1_cast_fu_225_p1;
reg   [31:0] tmp_1_cast_reg_355;
wire   [1:0] tmp_2_fu_228_p1;
reg   [1:0] tmp_2_reg_360;
wire   [35:0] bound_fu_239_p2;
reg   [35:0] bound_reg_365;
wire   [0:0] exitcond_flatten_fu_245_p2;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_block_state3_pp0_stage0_iter0;
wire    ap_block_state4_pp0_stage0_iter1;
wire    ap_block_state5_pp0_stage0_iter2;
reg    ap_sig_ioackin_ofmap_TREADY;
reg    ap_block_state5_io;
reg    ap_block_pp0_stage0_11001;
wire   [35:0] indvar_flatten_next_fu_250_p2;
reg    ap_enable_reg_pp0_iter0;
wire   [3:0] tmp_7_mid2_v_fu_274_p3;
reg   [3:0] tmp_7_mid2_v_reg_379;
(* use_dsp48 = "no" *) wire   [8:0] tmp_10_fu_289_p2;
reg   [8:0] tmp_10_reg_385;
wire   [31:0] k_1_fu_295_p2;
reg   [7:0] O_BRAM_0_addr_reg_395;
reg   [7:0] O_BRAM_1_addr_reg_401;
reg   [7:0] O_BRAM_2_addr_reg_407;
reg   [7:0] O_BRAM_3_addr_reg_413;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state3;
reg    ap_enable_reg_pp0_iter1;
reg   [3:0] ap_phi_mux_j_phi_fu_164_p4;
wire  signed [63:0] tmp_7_cast_fu_304_p1;
wire   [15:0] tmp_3_fu_311_p6;
wire    ap_block_pp0_stage0_01001;
reg    ap_reg_ioackin_ofmap_TREADY;
wire   [4:0] f_cast1_cast1_fu_184_p1;
wire   [0:0] tmp_4_fu_198_p2;
wire   [4:0] smax1_fu_204_p3;
wire   [5:0] smax1_cast_fu_212_p1;
wire   [5:0] f_cast1_cast_fu_188_p1;
wire  signed [31:0] tmp_5_cast_fu_232_p1;
wire   [31:0] bound_fu_239_p1;
wire   [0:0] tmp_s_fu_262_p2;
wire   [3:0] j_1_fu_256_p2;
wire   [31:0] k_mid2_fu_267_p3;
wire   [8:0] tmp_8_fu_282_p1;
wire   [8:0] tmp_9_fu_286_p1;
wire   [8:0] grp_fu_325_p3;
wire   [4:0] grp_fu_325_p0;
wire   [3:0] grp_fu_325_p1;
wire    ap_CS_fsm_state6;
reg   [3:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
wire   [35:0] bound_fu_239_p10;
wire   [8:0] grp_fu_325_p10;

// power-on initialization
initial begin
#0 ap_CS_fsm = 4'd1;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_reg_ioackin_ofmap_TREADY = 1'b0;
end

HLS2x4_4_mux_42_1eOg #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 16 ),
    .din2_WIDTH( 16 ),
    .din3_WIDTH( 16 ),
    .din4_WIDTH( 2 ),
    .dout_WIDTH( 16 ))
HLS2x4_4_mux_42_1eOg_U43(
    .din0(O_BRAM_0_q0),
    .din1(O_BRAM_1_q0),
    .din2(O_BRAM_2_q0),
    .din3(O_BRAM_3_q0),
    .din4(tmp_2_reg_360),
    .dout(tmp_3_fu_311_p6)
);

HLS2x4_4_mac_mulafYi #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 5 ),
    .din1_WIDTH( 4 ),
    .din2_WIDTH( 9 ),
    .dout_WIDTH( 9 ))
HLS2x4_4_mac_mulafYi_U44(
    .din0(grp_fu_325_p0),
    .din1(grp_fu_325_p1),
    .din2(tmp_10_reg_385),
    .dout(grp_fu_325_p3)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b1 == ap_condition_pp0_exit_iter0_state3) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if ((1'b1 == ap_CS_fsm_state2)) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            if ((1'b1 == ap_condition_pp0_exit_iter0_state3)) begin
                ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state3);
            end else if ((1'b1 == 1'b1)) begin
                ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end else if ((1'b1 == ap_CS_fsm_state2)) begin
            ap_enable_reg_pp0_iter2 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_reg_ioackin_ofmap_TREADY <= 1'b0;
    end else begin
        if (((ap_reg_pp0_iter1_exitcond_flatten_reg_370 == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
            if ((1'b0 == ap_block_pp0_stage0_11001)) begin
                ap_reg_ioackin_ofmap_TREADY <= 1'b0;
            end else if (((ofmap_TREADY == 1'b1) & (1'b0 == ap_block_pp0_stage0_01001))) begin
                ap_reg_ioackin_ofmap_TREADY <= 1'b1;
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten_fu_245_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        indvar_flatten_reg_149 <= indvar_flatten_next_fu_250_p2;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        indvar_flatten_reg_149 <= 36'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten_reg_370 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        j_reg_160 <= tmp_7_mid2_v_reg_379;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        j_reg_160 <= 4'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten_fu_245_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        k_reg_171 <= k_1_fu_295_p2;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        k_reg_171 <= f_cast1_fu_222_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten_reg_370 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        O_BRAM_0_addr_reg_395 <= tmp_7_cast_fu_304_p1;
        O_BRAM_1_addr_reg_401 <= tmp_7_cast_fu_304_p1;
        O_BRAM_2_addr_reg_407 <= tmp_7_cast_fu_304_p1;
        O_BRAM_3_addr_reg_413 <= tmp_7_cast_fu_304_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ap_reg_pp0_iter1_exitcond_flatten_reg_370 <= exitcond_flatten_reg_370;
        exitcond_flatten_reg_370 <= exitcond_flatten_fu_245_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        bound_reg_365 <= bound_fu_239_p2;
        f_cast1_reg_349[3 : 0] <= f_cast1_fu_222_p1[3 : 0];
        tmp_1_cast_reg_355[4 : 0] <= tmp_1_cast_fu_225_p1[4 : 0];
        tmp_2_reg_360 <= tmp_2_fu_228_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        f_cast2_reg_333 <= f_cast2_fu_180_p1;
        tmp_1_reg_339 <= tmp_1_fu_192_p2;
        tmp_5_reg_344 <= tmp_5_fu_216_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten_fu_245_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_10_reg_385 <= tmp_10_fu_289_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten_fu_245_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_7_mid2_v_reg_379 <= tmp_7_mid2_v_fu_274_p3;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        O_BRAM_0_ce0 = 1'b1;
    end else begin
        O_BRAM_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        O_BRAM_0_ce1 = 1'b1;
    end else begin
        O_BRAM_0_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (tmp_2_reg_360 == 2'd0))) begin
        O_BRAM_0_we1 = 1'b1;
    end else begin
        O_BRAM_0_we1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        O_BRAM_1_ce0 = 1'b1;
    end else begin
        O_BRAM_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        O_BRAM_1_ce1 = 1'b1;
    end else begin
        O_BRAM_1_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (tmp_2_reg_360 == 2'd1))) begin
        O_BRAM_1_we1 = 1'b1;
    end else begin
        O_BRAM_1_we1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        O_BRAM_2_ce0 = 1'b1;
    end else begin
        O_BRAM_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        O_BRAM_2_ce1 = 1'b1;
    end else begin
        O_BRAM_2_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (tmp_2_reg_360 == 2'd2))) begin
        O_BRAM_2_we1 = 1'b1;
    end else begin
        O_BRAM_2_we1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        O_BRAM_3_ce0 = 1'b1;
    end else begin
        O_BRAM_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        O_BRAM_3_ce1 = 1'b1;
    end else begin
        O_BRAM_3_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (tmp_2_reg_360 == 2'd3))) begin
        O_BRAM_3_we1 = 1'b1;
    end else begin
        O_BRAM_3_we1 = 1'b0;
    end
end

always @ (*) begin
    if ((exitcond_flatten_fu_245_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state3 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state3 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state6) | ((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((exitcond_flatten_reg_370 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_phi_mux_j_phi_fu_164_p4 = tmp_7_mid2_v_reg_379;
    end else begin
        ap_phi_mux_j_phi_fu_164_p4 = j_reg_160;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((ap_reg_ioackin_ofmap_TREADY == 1'b0)) begin
        ap_sig_ioackin_ofmap_TREADY = ofmap_TREADY;
    end else begin
        ap_sig_ioackin_ofmap_TREADY = 1'b1;
    end
end

always @ (*) begin
    if (((ap_reg_pp0_iter1_exitcond_flatten_reg_370 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        ofmap_TDATA_blk_n = ofmap_TREADY;
    end else begin
        ofmap_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_reg_pp0_iter1_exitcond_flatten_reg_370 == 1'd0) & (ap_reg_ioackin_ofmap_TREADY == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_01001))) begin
        ofmap_TVALID = 1'b1;
    end else begin
        ofmap_TVALID = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((ap_enable_reg_pp0_iter0 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone) & (exitcond_flatten_fu_245_p2 == 1'd1)) & ~((ap_enable_reg_pp0_iter2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((ap_enable_reg_pp0_iter2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone)) | ((ap_enable_reg_pp0_iter0 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone) & (exitcond_flatten_fu_245_p2 == 1'd1)))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign O_BRAM_0_address0 = tmp_7_cast_fu_304_p1;

assign O_BRAM_0_address1 = O_BRAM_0_addr_reg_395;

assign O_BRAM_0_d1 = 16'd0;

assign O_BRAM_1_address0 = tmp_7_cast_fu_304_p1;

assign O_BRAM_1_address1 = O_BRAM_1_addr_reg_401;

assign O_BRAM_1_d1 = 16'd0;

assign O_BRAM_2_address0 = tmp_7_cast_fu_304_p1;

assign O_BRAM_2_address1 = O_BRAM_2_addr_reg_407;

assign O_BRAM_2_d1 = 16'd0;

assign O_BRAM_3_address0 = tmp_7_cast_fu_304_p1;

assign O_BRAM_3_address1 = O_BRAM_3_addr_reg_413;

assign O_BRAM_3_d1 = 16'd0;

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd3];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_01001 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_block_state5_io));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_block_state5_io));
end

assign ap_block_state3_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state5_io = ((ap_reg_pp0_iter1_exitcond_flatten_reg_370 == 1'd0) & (ap_sig_ioackin_ofmap_TREADY == 1'b0));
end

assign ap_block_state5_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign bound_fu_239_p1 = bound_fu_239_p10;

assign bound_fu_239_p10 = $unsigned(tmp_5_cast_fu_232_p1);

assign bound_fu_239_p2 = (36'd13 * bound_fu_239_p1);

assign exitcond_flatten_fu_245_p2 = ((indvar_flatten_reg_149 == bound_reg_365) ? 1'b1 : 1'b0);

assign f_cast1_cast1_fu_184_p1 = $unsigned(f_cast2_fu_180_p1);

assign f_cast1_cast_fu_188_p1 = $unsigned(f_cast2_fu_180_p1);

assign f_cast1_fu_222_p1 = $unsigned(f_cast2_reg_333);

assign f_cast2_fu_180_p1 = $signed(f);

assign grp_fu_325_p0 = 9'd13;

assign grp_fu_325_p1 = grp_fu_325_p10;

assign grp_fu_325_p10 = tmp_7_mid2_v_reg_379;

assign indvar_flatten_next_fu_250_p2 = (indvar_flatten_reg_149 + 36'd1);

assign j_1_fu_256_p2 = (4'd1 + ap_phi_mux_j_phi_fu_164_p4);

assign k_1_fu_295_p2 = (k_mid2_fu_267_p3 + 32'd1);

assign k_mid2_fu_267_p3 = ((tmp_s_fu_262_p2[0:0] === 1'b1) ? k_reg_171 : f_cast1_reg_349);

assign ofmap_TDATA = tmp_3_fu_311_p6;

assign smax1_cast_fu_212_p1 = smax1_fu_204_p3;

assign smax1_fu_204_p3 = ((tmp_4_fu_198_p2[0:0] === 1'b1) ? f_cast1_cast1_fu_184_p1 : tmp_1_fu_192_p2);

assign tmp_10_fu_289_p2 = (tmp_8_fu_282_p1 - tmp_9_fu_286_p1);

assign tmp_1_cast_fu_225_p1 = tmp_1_reg_339;

assign tmp_1_fu_192_p2 = (5'd13 + f_cast1_cast1_fu_184_p1);

assign tmp_2_fu_228_p1 = m[1:0];

assign tmp_4_fu_198_p2 = ((f_cast1_cast1_fu_184_p1 > tmp_1_fu_192_p2) ? 1'b1 : 1'b0);

assign tmp_5_cast_fu_232_p1 = $signed(tmp_5_reg_344);

assign tmp_5_fu_216_p2 = (smax1_cast_fu_212_p1 - f_cast1_cast_fu_188_p1);

assign tmp_7_cast_fu_304_p1 = $signed(grp_fu_325_p3);

assign tmp_7_mid2_v_fu_274_p3 = ((tmp_s_fu_262_p2[0:0] === 1'b1) ? ap_phi_mux_j_phi_fu_164_p4 : j_1_fu_256_p2);

assign tmp_8_fu_282_p1 = k_mid2_fu_267_p3[8:0];

assign tmp_9_fu_286_p1 = $unsigned(f_cast2_reg_333);

assign tmp_s_fu_262_p2 = (($signed(k_reg_171) < $signed(tmp_1_cast_reg_355)) ? 1'b1 : 1'b0);

always @ (posedge ap_clk) begin
    f_cast1_reg_349[31:4] <= 28'b0000000000000000000000000000;
    tmp_1_cast_reg_355[31:5] <= 27'b000000000000000000000000000;
end

endmodule //data_transfer_ofo
