// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2017.4.1
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module data_transfer_f (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        fmap_TDATA,
        fmap_TVALID,
        fmap_TREADY,
        W_BRAM_0_0_address0,
        W_BRAM_0_0_ce0,
        W_BRAM_0_0_we0,
        W_BRAM_0_0_d0,
        W_BRAM_0_1_address0,
        W_BRAM_0_1_ce0,
        W_BRAM_0_1_we0,
        W_BRAM_0_1_d0,
        W_BRAM_0_2_address0,
        W_BRAM_0_2_ce0,
        W_BRAM_0_2_we0,
        W_BRAM_0_2_d0,
        W_BRAM_0_3_address0,
        W_BRAM_0_3_ce0,
        W_BRAM_0_3_we0,
        W_BRAM_0_3_d0,
        W_BRAM_1_0_address0,
        W_BRAM_1_0_ce0,
        W_BRAM_1_0_we0,
        W_BRAM_1_0_d0,
        W_BRAM_1_1_address0,
        W_BRAM_1_1_ce0,
        W_BRAM_1_1_we0,
        W_BRAM_1_1_d0,
        W_BRAM_1_2_address0,
        W_BRAM_1_2_ce0,
        W_BRAM_1_2_we0,
        W_BRAM_1_2_d0,
        W_BRAM_1_3_address0,
        W_BRAM_1_3_ce0,
        W_BRAM_1_3_we0,
        W_BRAM_1_3_d0,
        m,
        c
);

parameter    ap_ST_fsm_state1 = 4'd1;
parameter    ap_ST_fsm_state2 = 4'd2;
parameter    ap_ST_fsm_pp0_stage0 = 4'd4;
parameter    ap_ST_fsm_state5 = 4'd8;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [15:0] fmap_TDATA;
input   fmap_TVALID;
output   fmap_TREADY;
output  [3:0] W_BRAM_0_0_address0;
output   W_BRAM_0_0_ce0;
output   W_BRAM_0_0_we0;
output  [15:0] W_BRAM_0_0_d0;
output  [3:0] W_BRAM_0_1_address0;
output   W_BRAM_0_1_ce0;
output   W_BRAM_0_1_we0;
output  [15:0] W_BRAM_0_1_d0;
output  [3:0] W_BRAM_0_2_address0;
output   W_BRAM_0_2_ce0;
output   W_BRAM_0_2_we0;
output  [15:0] W_BRAM_0_2_d0;
output  [3:0] W_BRAM_0_3_address0;
output   W_BRAM_0_3_ce0;
output   W_BRAM_0_3_we0;
output  [15:0] W_BRAM_0_3_d0;
output  [3:0] W_BRAM_1_0_address0;
output   W_BRAM_1_0_ce0;
output   W_BRAM_1_0_we0;
output  [15:0] W_BRAM_1_0_d0;
output  [3:0] W_BRAM_1_1_address0;
output   W_BRAM_1_1_ce0;
output   W_BRAM_1_1_we0;
output  [15:0] W_BRAM_1_1_d0;
output  [3:0] W_BRAM_1_2_address0;
output   W_BRAM_1_2_ce0;
output   W_BRAM_1_2_we0;
output  [15:0] W_BRAM_1_2_d0;
output  [3:0] W_BRAM_1_3_address0;
output   W_BRAM_1_3_ce0;
output   W_BRAM_1_3_we0;
output  [15:0] W_BRAM_1_3_d0;
input  [6:0] m;
input  [8:0] c;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg fmap_TREADY;
reg W_BRAM_0_0_ce0;
reg W_BRAM_0_0_we0;
reg W_BRAM_0_1_ce0;
reg W_BRAM_0_1_we0;
reg W_BRAM_0_2_ce0;
reg W_BRAM_0_2_we0;
reg W_BRAM_0_3_ce0;
reg W_BRAM_0_3_we0;
reg W_BRAM_1_0_ce0;
reg W_BRAM_1_0_we0;
reg W_BRAM_1_1_ce0;
reg W_BRAM_1_1_we0;
reg W_BRAM_1_2_ce0;
reg W_BRAM_1_2_we0;
reg W_BRAM_1_3_ce0;
reg W_BRAM_1_3_we0;

(* fsm_encoding = "none" *) reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    fmap_TDATA_blk_n;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_pp0_stage0;
wire   [0:0] exitcond_flatten2_fu_382_p2;
reg   [67:0] indvar_flatten2_reg_194;
reg   [31:0] i1_reg_205;
reg   [35:0] indvar_flatten_reg_214;
reg   [31:0] j1_reg_225;
reg   [3:0] k1_reg_234;
wire   [0:0] tmp_28_fu_259_p1;
reg   [0:0] tmp_28_reg_536;
wire   [1:0] tmp_29_fu_263_p1;
reg   [1:0] tmp_29_reg_541;
wire   [35:0] bound_fu_321_p2;
reg   [35:0] bound_reg_547;
wire   [7:0] tmp_11_fu_345_p2;
reg   [7:0] tmp_11_reg_553;
wire   [31:0] c_cast2_fu_351_p1;
reg   [31:0] c_cast2_reg_558;
wire    ap_CS_fsm_state2;
wire   [31:0] m_cast1_fu_354_p1;
wire   [67:0] bound7_fu_367_p2;
reg   [67:0] bound7_reg_569;
wire   [1:0] tmp_35_t_fu_377_p2;
reg   [1:0] tmp_35_t_reg_574;
reg    ap_block_state3_pp0_stage0_iter0;
wire    ap_block_state4_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_11001;
reg   [0:0] exitcond_flatten2_reg_579;
wire   [67:0] indvar_flatten_next2_fu_387_p2;
wire   [0:0] exitcond_flatten_fu_399_p2;
reg   [0:0] exitcond_flatten_reg_588;
wire   [31:0] tmp_31_t_mid2_v_v_fu_411_p3;
reg   [31:0] tmp_31_t_mid2_v_v_reg_593;
wire   [0:0] tmp_31_t_mid2_fu_423_p2;
reg   [0:0] tmp_31_t_mid2_reg_598;
wire   [0:0] exitcond_mid_fu_440_p2;
reg   [0:0] exitcond_mid_reg_602;
wire   [3:0] k1_mid2_fu_458_p3;
reg   [3:0] k1_mid2_reg_607;
wire   [1:0] tmp_35_t_mid1_fu_470_p2;
reg   [1:0] tmp_35_t_mid1_reg_612;
wire   [31:0] j1_mid2_fu_475_p3;
reg   [15:0] fmap_read_reg_622;
wire   [3:0] k1_1_fu_483_p2;
wire   [35:0] indvar_flatten_next_fu_495_p3;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state3;
reg    ap_enable_reg_pp0_iter1;
reg   [31:0] ap_phi_mux_i1_phi_fu_208_p4;
wire   [63:0] tmp_3_fu_515_p1;
wire   [1:0] tmp_35_t_mid2_fu_509_p3;
wire   [7:0] tmp_27_fu_245_p1;
wire   [7:0] tmp_s_fu_267_p2;
wire   [0:0] tmp_7_fu_273_p2;
wire   [7:0] smax1_fu_279_p3;
wire   [8:0] smax1_cast_fu_287_p1;
wire   [8:0] tmp_8_fu_291_p2;
wire  signed [31:0] tmp_22_cast_fu_297_p1;
wire   [11:0] tmp_30_fu_305_p3;
wire  signed [34:0] tmp_9_fu_313_p1;
wire   [35:0] p_shl_fu_317_p1;
wire   [35:0] cast_fu_301_p1;
wire   [6:0] tmp_fu_253_p2;
wire   [0:0] tmp_10_fu_327_p2;
wire   [6:0] smax4_fu_333_p3;
wire   [7:0] smax4_cast_fu_341_p1;
wire   [7:0] m_cast1_cast_fu_249_p1;
wire  signed [31:0] tmp_25_cast_fu_357_p1;
wire   [35:0] bound7_fu_367_p0;
wire   [31:0] bound7_fu_367_p1;
wire   [1:0] tmp_31_fu_373_p1;
wire   [31:0] i1_1_fu_393_p2;
wire   [0:0] tmp_32_fu_419_p1;
wire   [0:0] exitcond_fu_434_p2;
wire   [0:0] not_exitcond_flatten_fu_428_p2;
wire   [31:0] j1_mid_fu_404_p3;
wire   [0:0] tmp_12_fu_452_p2;
wire   [31:0] j1_1_fu_446_p2;
wire   [1:0] tmp_33_fu_466_p1;
wire   [35:0] indvar_flatten_op_fu_489_p2;
wire   [1:0] tmp_35_t_mid_fu_503_p3;
wire    ap_CS_fsm_state5;
reg   [3:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
wire   [67:0] bound7_fu_367_p00;
wire   [67:0] bound7_fu_367_p10;

// power-on initialization
initial begin
#0 ap_CS_fsm = 4'd1;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
end

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
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b1 == ap_condition_pp0_exit_iter0_state3) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
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
        if (((1'b1 == ap_condition_pp0_exit_iter0_state3) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state3);
        end else if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end else if ((1'b1 == ap_CS_fsm_state2)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (exitcond_flatten2_reg_579 == 1'd0))) begin
        i1_reg_205 <= tmp_31_t_mid2_v_v_reg_593;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        i1_reg_205 <= m_cast1_fu_354_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten2_fu_382_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        indvar_flatten2_reg_194 <= indvar_flatten_next2_fu_387_p2;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        indvar_flatten2_reg_194 <= 68'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten2_fu_382_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        indvar_flatten_reg_214 <= indvar_flatten_next_fu_495_p3;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        indvar_flatten_reg_214 <= 36'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten2_fu_382_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        j1_reg_225 <= j1_mid2_fu_475_p3;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        j1_reg_225 <= c_cast2_fu_351_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten2_fu_382_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        k1_reg_234 <= k1_1_fu_483_p2;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        k1_reg_234 <= 4'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        bound7_reg_569 <= bound7_fu_367_p2;
        c_cast2_reg_558[8 : 0] <= c_cast2_fu_351_p1[8 : 0];
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        bound_reg_547 <= bound_fu_321_p2;
        tmp_11_reg_553 <= tmp_11_fu_345_p2;
        tmp_28_reg_536 <= tmp_28_fu_259_p1;
        tmp_29_reg_541 <= tmp_29_fu_263_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        exitcond_flatten2_reg_579 <= exitcond_flatten2_fu_382_p2;
        tmp_35_t_reg_574 <= tmp_35_t_fu_377_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten2_fu_382_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        exitcond_flatten_reg_588 <= exitcond_flatten_fu_399_p2;
        exitcond_mid_reg_602 <= exitcond_mid_fu_440_p2;
        fmap_read_reg_622 <= fmap_TDATA;
        k1_mid2_reg_607 <= k1_mid2_fu_458_p3;
        tmp_31_t_mid2_reg_598 <= tmp_31_t_mid2_fu_423_p2;
        tmp_35_t_mid1_reg_612 <= tmp_35_t_mid1_fu_470_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten2_fu_382_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_31_t_mid2_v_v_reg_593 <= tmp_31_t_mid2_v_v_fu_411_p3;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        W_BRAM_0_0_ce0 = 1'b1;
    end else begin
        W_BRAM_0_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_35_t_mid2_fu_509_p3 == 2'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (tmp_31_t_mid2_reg_598 == 1'd0))) begin
        W_BRAM_0_0_we0 = 1'b1;
    end else begin
        W_BRAM_0_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        W_BRAM_0_1_ce0 = 1'b1;
    end else begin
        W_BRAM_0_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_35_t_mid2_fu_509_p3 == 2'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (tmp_31_t_mid2_reg_598 == 1'd0))) begin
        W_BRAM_0_1_we0 = 1'b1;
    end else begin
        W_BRAM_0_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        W_BRAM_0_2_ce0 = 1'b1;
    end else begin
        W_BRAM_0_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_35_t_mid2_fu_509_p3 == 2'd2) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (tmp_31_t_mid2_reg_598 == 1'd0))) begin
        W_BRAM_0_2_we0 = 1'b1;
    end else begin
        W_BRAM_0_2_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        W_BRAM_0_3_ce0 = 1'b1;
    end else begin
        W_BRAM_0_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_35_t_mid2_fu_509_p3 == 2'd3) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (tmp_31_t_mid2_reg_598 == 1'd0))) begin
        W_BRAM_0_3_we0 = 1'b1;
    end else begin
        W_BRAM_0_3_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        W_BRAM_1_0_ce0 = 1'b1;
    end else begin
        W_BRAM_1_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_35_t_mid2_fu_509_p3 == 2'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (tmp_31_t_mid2_reg_598 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        W_BRAM_1_0_we0 = 1'b1;
    end else begin
        W_BRAM_1_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        W_BRAM_1_1_ce0 = 1'b1;
    end else begin
        W_BRAM_1_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_35_t_mid2_fu_509_p3 == 2'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (tmp_31_t_mid2_reg_598 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        W_BRAM_1_1_we0 = 1'b1;
    end else begin
        W_BRAM_1_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        W_BRAM_1_2_ce0 = 1'b1;
    end else begin
        W_BRAM_1_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_35_t_mid2_fu_509_p3 == 2'd2) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (tmp_31_t_mid2_reg_598 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        W_BRAM_1_2_we0 = 1'b1;
    end else begin
        W_BRAM_1_2_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        W_BRAM_1_3_ce0 = 1'b1;
    end else begin
        W_BRAM_1_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_35_t_mid2_fu_509_p3 == 2'd3) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (tmp_31_t_mid2_reg_598 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        W_BRAM_1_3_we0 = 1'b1;
    end else begin
        W_BRAM_1_3_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((exitcond_flatten2_fu_382_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state3 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state3 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) | ((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)))) begin
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
    if (((ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (exitcond_flatten2_reg_579 == 1'd0))) begin
        ap_phi_mux_i1_phi_fu_208_p4 = tmp_31_t_mid2_v_v_reg_593;
    end else begin
        ap_phi_mux_i1_phi_fu_208_p4 = i1_reg_205;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((exitcond_flatten2_fu_382_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        fmap_TDATA_blk_n = fmap_TVALID;
    end else begin
        fmap_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((exitcond_flatten2_fu_382_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        fmap_TREADY = 1'b1;
    end else begin
        fmap_TREADY = 1'b0;
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
            if (~((exitcond_flatten2_fu_382_p2 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if (((exitcond_flatten2_fu_382_p2 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign W_BRAM_0_0_address0 = tmp_3_fu_515_p1;

assign W_BRAM_0_0_d0 = fmap_read_reg_622;

assign W_BRAM_0_1_address0 = tmp_3_fu_515_p1;

assign W_BRAM_0_1_d0 = fmap_read_reg_622;

assign W_BRAM_0_2_address0 = tmp_3_fu_515_p1;

assign W_BRAM_0_2_d0 = fmap_read_reg_622;

assign W_BRAM_0_3_address0 = tmp_3_fu_515_p1;

assign W_BRAM_0_3_d0 = fmap_read_reg_622;

assign W_BRAM_1_0_address0 = tmp_3_fu_515_p1;

assign W_BRAM_1_0_d0 = fmap_read_reg_622;

assign W_BRAM_1_1_address0 = tmp_3_fu_515_p1;

assign W_BRAM_1_1_d0 = fmap_read_reg_622;

assign W_BRAM_1_2_address0 = tmp_3_fu_515_p1;

assign W_BRAM_1_2_d0 = fmap_read_reg_622;

assign W_BRAM_1_3_address0 = tmp_3_fu_515_p1;

assign W_BRAM_1_3_d0 = fmap_read_reg_622;

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd3];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((exitcond_flatten2_fu_382_p2 == 1'd0) & (fmap_TVALID == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((exitcond_flatten2_fu_382_p2 == 1'd0) & (fmap_TVALID == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1));
end

always @ (*) begin
    ap_block_state3_pp0_stage0_iter0 = ((exitcond_flatten2_fu_382_p2 == 1'd0) & (fmap_TVALID == 1'b0));
end

assign ap_block_state4_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign bound7_fu_367_p0 = bound7_fu_367_p00;

assign bound7_fu_367_p00 = bound_reg_547;

assign bound7_fu_367_p1 = bound7_fu_367_p10;

assign bound7_fu_367_p10 = $unsigned(tmp_25_cast_fu_357_p1);

assign bound7_fu_367_p2 = (bound7_fu_367_p0 * bound7_fu_367_p1);

assign bound_fu_321_p2 = (p_shl_fu_317_p1 + cast_fu_301_p1);

assign c_cast2_fu_351_p1 = c;

assign cast_fu_301_p1 = $unsigned(tmp_22_cast_fu_297_p1);

assign exitcond_flatten2_fu_382_p2 = ((indvar_flatten2_reg_194 == bound7_reg_569) ? 1'b1 : 1'b0);

assign exitcond_flatten_fu_399_p2 = ((indvar_flatten_reg_214 == bound_reg_547) ? 1'b1 : 1'b0);

assign exitcond_fu_434_p2 = ((k1_reg_234 == 4'd9) ? 1'b1 : 1'b0);

assign exitcond_mid_fu_440_p2 = (not_exitcond_flatten_fu_428_p2 & exitcond_fu_434_p2);

assign i1_1_fu_393_p2 = (32'd1 + ap_phi_mux_i1_phi_fu_208_p4);

assign indvar_flatten_next2_fu_387_p2 = (68'd1 + indvar_flatten2_reg_194);

assign indvar_flatten_next_fu_495_p3 = ((exitcond_flatten_fu_399_p2[0:0] === 1'b1) ? 36'd1 : indvar_flatten_op_fu_489_p2);

assign indvar_flatten_op_fu_489_p2 = (indvar_flatten_reg_214 + 36'd1);

assign j1_1_fu_446_p2 = (32'd1 + j1_mid_fu_404_p3);

assign j1_mid2_fu_475_p3 = ((exitcond_mid_fu_440_p2[0:0] === 1'b1) ? j1_1_fu_446_p2 : j1_mid_fu_404_p3);

assign j1_mid_fu_404_p3 = ((exitcond_flatten_fu_399_p2[0:0] === 1'b1) ? c_cast2_reg_558 : j1_reg_225);

assign k1_1_fu_483_p2 = (k1_mid2_fu_458_p3 + 4'd1);

assign k1_mid2_fu_458_p3 = ((tmp_12_fu_452_p2[0:0] === 1'b1) ? 4'd0 : k1_reg_234);

assign m_cast1_cast_fu_249_p1 = m;

assign m_cast1_fu_354_p1 = m;

assign not_exitcond_flatten_fu_428_p2 = (exitcond_flatten_fu_399_p2 ^ 1'd1);

assign p_shl_fu_317_p1 = $unsigned(tmp_9_fu_313_p1);

assign smax1_cast_fu_287_p1 = smax1_fu_279_p3;

assign smax1_fu_279_p3 = ((tmp_7_fu_273_p2[0:0] === 1'b1) ? tmp_27_fu_245_p1 : tmp_s_fu_267_p2);

assign smax4_cast_fu_341_p1 = smax4_fu_333_p3;

assign smax4_fu_333_p3 = ((tmp_10_fu_327_p2[0:0] === 1'b1) ? m : tmp_fu_253_p2);

assign tmp_10_fu_327_p2 = ((m > tmp_fu_253_p2) ? 1'b1 : 1'b0);

assign tmp_11_fu_345_p2 = (smax4_cast_fu_341_p1 - m_cast1_cast_fu_249_p1);

assign tmp_12_fu_452_p2 = (exitcond_mid_fu_440_p2 | exitcond_flatten_fu_399_p2);

assign tmp_22_cast_fu_297_p1 = $signed(tmp_8_fu_291_p2);

assign tmp_25_cast_fu_357_p1 = $signed(tmp_11_reg_553);

assign tmp_27_fu_245_p1 = c[7:0];

assign tmp_28_fu_259_p1 = m[0:0];

assign tmp_29_fu_263_p1 = c[1:0];

assign tmp_30_fu_305_p3 = {{tmp_8_fu_291_p2}, {3'd0}};

assign tmp_31_fu_373_p1 = j1_reg_225[1:0];

assign tmp_31_t_mid2_fu_423_p2 = (tmp_32_fu_419_p1 ^ tmp_28_reg_536);

assign tmp_31_t_mid2_v_v_fu_411_p3 = ((exitcond_flatten_fu_399_p2[0:0] === 1'b1) ? i1_1_fu_393_p2 : ap_phi_mux_i1_phi_fu_208_p4);

assign tmp_32_fu_419_p1 = tmp_31_t_mid2_v_v_fu_411_p3[0:0];

assign tmp_33_fu_466_p1 = j1_1_fu_446_p2[1:0];

assign tmp_35_t_fu_377_p2 = (tmp_31_fu_373_p1 - tmp_29_reg_541);

assign tmp_35_t_mid1_fu_470_p2 = (tmp_33_fu_466_p1 - tmp_29_reg_541);

assign tmp_35_t_mid2_fu_509_p3 = ((exitcond_mid_reg_602[0:0] === 1'b1) ? tmp_35_t_mid1_reg_612 : tmp_35_t_mid_fu_503_p3);

assign tmp_35_t_mid_fu_503_p3 = ((exitcond_flatten_reg_588[0:0] === 1'b1) ? 2'd0 : tmp_35_t_reg_574);

assign tmp_3_fu_515_p1 = k1_mid2_reg_607;

assign tmp_7_fu_273_p2 = ((tmp_27_fu_245_p1 > tmp_s_fu_267_p2) ? 1'b1 : 1'b0);

assign tmp_8_fu_291_p2 = (smax1_cast_fu_287_p1 - c);

assign tmp_9_fu_313_p1 = $signed(tmp_30_fu_305_p3);

assign tmp_fu_253_p2 = (7'd2 + m);

assign tmp_s_fu_267_p2 = (8'd4 + tmp_27_fu_245_p1);

always @ (posedge ap_clk) begin
    c_cast2_reg_558[31:9] <= 23'b00000000000000000000000;
end

endmodule //data_transfer_f
