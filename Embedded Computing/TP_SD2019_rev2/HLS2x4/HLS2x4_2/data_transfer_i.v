// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2017.4.1
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module data_transfer_i (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        ifmap_TDATA,
        ifmap_TVALID,
        ifmap_TREADY,
        I_BRAM_0_address0,
        I_BRAM_0_ce0,
        I_BRAM_0_we0,
        I_BRAM_0_d0,
        I_BRAM_1_address0,
        I_BRAM_1_ce0,
        I_BRAM_1_we0,
        I_BRAM_1_d0,
        c,
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
input  [15:0] ifmap_TDATA;
input   ifmap_TVALID;
output   ifmap_TREADY;
output  [9:0] I_BRAM_0_address0;
output   I_BRAM_0_ce0;
output   I_BRAM_0_we0;
output  [15:0] I_BRAM_0_d0;
output  [9:0] I_BRAM_1_address0;
output   I_BRAM_1_ce0;
output   I_BRAM_1_we0;
output  [15:0] I_BRAM_1_d0;
input  [6:0] c;
input  [3:0] f;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg ifmap_TREADY;
reg I_BRAM_0_ce0;
reg I_BRAM_0_we0;
reg I_BRAM_1_ce0;
reg I_BRAM_1_we0;

(* fsm_encoding = "none" *) reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    ifmap_TDATA_blk_n;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_pp0_stage0;
wire   [0:0] exitcond_flatten1_fu_243_p2;
reg   [68:0] indvar_flatten1_reg_102;
reg   [31:0] i_reg_113;
reg   [36:0] indvar_flatten_reg_122;
reg   [4:0] j_reg_133;
reg   [31:0] k_reg_144;
wire   [0:0] tmp_15_fu_163_p1;
reg   [0:0] tmp_15_reg_399;
wire   [6:0] tmp_3_fu_185_p2;
reg   [6:0] tmp_3_reg_404;
wire  signed [4:0] f_cast_fu_191_p1;
reg  signed [4:0] f_cast_reg_409;
wire    ap_CS_fsm_state2;
wire   [31:0] f_cast2_fu_195_p1;
reg   [31:0] f_cast2_reg_414;
wire   [31:0] c_cast1_fu_207_p1;
wire   [31:0] tmp_1_fu_216_p1;
reg   [31:0] tmp_1_reg_426;
wire   [68:0] bound6_fu_231_p2;
reg   [68:0] bound6_reg_431;
wire   [0:0] exitcond1_mid_fu_237_p2;
reg   [0:0] exitcond1_mid_reg_436;
reg   [0:0] exitcond_flatten1_reg_441;
reg    ap_block_state3_pp0_stage0_iter0;
wire    ap_block_state4_pp0_stage0_iter1;
wire    ap_block_state5_pp0_stage0_iter2;
reg    ap_block_pp0_stage0_11001;
wire   [68:0] indvar_flatten_next1_fu_248_p2;
wire   [31:0] tmp_17_t_mid2_v_v_fu_281_p3;
reg   [31:0] tmp_17_t_mid2_v_v_reg_450;
wire   [0:0] tmp_17_t_mid2_fu_293_p2;
reg   [0:0] tmp_17_t_mid2_reg_455;
reg   [0:0] ap_reg_pp0_iter1_tmp_17_t_mid2_reg_455;
wire   [4:0] tmp_3_mid2_fu_323_p3;
reg   [4:0] tmp_3_mid2_reg_459;
reg   [15:0] ifmap_read_reg_466;
reg   [15:0] ap_reg_pp0_iter1_ifmap_read_reg_466;
wire   [10:0] tmp_20_fu_331_p1;
reg   [10:0] tmp_20_reg_472;
wire   [31:0] k_2_fu_335_p2;
wire   [36:0] indvar_flatten_next_fu_347_p3;
wire   [10:0] tmp_6_fu_383_p2;
reg   [10:0] tmp_6_reg_487;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state3;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg   [31:0] ap_phi_mux_i_phi_fu_116_p4;
reg   [4:0] ap_phi_mux_j_phi_fu_137_p4;
wire   [63:0] tmp_17_cast_fu_389_p1;
wire   [5:0] tmp_12_fu_153_p1;
wire   [5:0] tmp_fu_157_p2;
wire   [0:0] tmp_2_fu_167_p2;
wire   [5:0] smax3_fu_173_p3;
wire   [6:0] smax3_cast_fu_181_p1;
wire   [5:0] f_cast2_cast1_fu_199_p1;
wire   [5:0] tmp_s_fu_210_p2;
wire  signed [31:0] tmp_14_cast_fu_224_p1;
wire   [31:0] bound6_fu_231_p1;
wire   [6:0] f_cast2_cast_fu_203_p1;
wire   [6:0] tmp_11_cast_fu_220_p1;
wire   [0:0] exitcond_flatten_fu_260_p2;
wire   [31:0] i_1_fu_254_p2;
wire   [0:0] tmp_18_fu_289_p1;
wire   [0:0] exitcond_fu_298_p2;
wire   [4:0] j_mid_fu_266_p3;
wire   [0:0] exitcond1_mid1_fu_303_p3;
wire   [31:0] k_mid_fu_274_p3;
wire   [4:0] j_2_fu_310_p2;
wire   [31:0] k_mid2_fu_316_p3;
wire   [36:0] indvar_flatten_op_fu_341_p2;
wire   [9:0] tmp_19_fu_358_p3;
wire   [10:0] p_shl1_cast_fu_365_p1;
wire   [10:0] tmp_3_mid2_cast_fu_355_p1;
wire   [10:0] tmp_21_fu_375_p1;
wire   [10:0] tmp_5_fu_369_p2;
wire   [10:0] tmp_22_fu_378_p2;
wire    ap_CS_fsm_state6;
reg   [3:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
wire   [68:0] bound6_fu_231_p10;

// power-on initialization
initial begin
#0 ap_CS_fsm = 4'd1;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
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
    if (((exitcond_flatten1_reg_441 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        i_reg_113 <= tmp_17_t_mid2_v_v_reg_450;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        i_reg_113 <= c_cast1_fu_207_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten1_fu_243_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        indvar_flatten1_reg_102 <= indvar_flatten_next1_fu_248_p2;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        indvar_flatten1_reg_102 <= 69'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten1_fu_243_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        indvar_flatten_reg_122 <= indvar_flatten_next_fu_347_p3;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        indvar_flatten_reg_122 <= 37'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten1_reg_441 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        j_reg_133 <= tmp_3_mid2_reg_459;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        j_reg_133 <= 5'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten1_fu_243_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        k_reg_144 <= k_2_fu_335_p2;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        k_reg_144 <= f_cast2_fu_195_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ap_reg_pp0_iter1_ifmap_read_reg_466 <= ifmap_read_reg_466;
        ap_reg_pp0_iter1_tmp_17_t_mid2_reg_455 <= tmp_17_t_mid2_reg_455;
        exitcond_flatten1_reg_441 <= exitcond_flatten1_fu_243_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        bound6_reg_431 <= bound6_fu_231_p2;
        exitcond1_mid_reg_436 <= exitcond1_mid_fu_237_p2;
        f_cast2_reg_414[4 : 0] <= f_cast2_fu_195_p1[4 : 0];
        f_cast_reg_409 <= f_cast_fu_191_p1;
        tmp_1_reg_426[5 : 0] <= tmp_1_fu_216_p1[5 : 0];
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten1_fu_243_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ifmap_read_reg_466 <= ifmap_TDATA;
        tmp_17_t_mid2_reg_455 <= tmp_17_t_mid2_fu_293_p2;
        tmp_20_reg_472 <= tmp_20_fu_331_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        tmp_15_reg_399 <= tmp_15_fu_163_p1;
        tmp_3_reg_404 <= tmp_3_fu_185_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten1_fu_243_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_17_t_mid2_v_v_reg_450 <= tmp_17_t_mid2_v_v_fu_281_p3;
        tmp_3_mid2_reg_459 <= tmp_3_mid2_fu_323_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_flatten1_reg_441 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_6_reg_487 <= tmp_6_fu_383_p2;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        I_BRAM_0_ce0 = 1'b1;
    end else begin
        I_BRAM_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_reg_pp0_iter1_tmp_17_t_mid2_reg_455 == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        I_BRAM_0_we0 = 1'b1;
    end else begin
        I_BRAM_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        I_BRAM_1_ce0 = 1'b1;
    end else begin
        I_BRAM_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (ap_reg_pp0_iter1_tmp_17_t_mid2_reg_455 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        I_BRAM_1_we0 = 1'b1;
    end else begin
        I_BRAM_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((exitcond_flatten1_fu_243_p2 == 1'd1)) begin
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
    if (((ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((exitcond_flatten1_reg_441 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ap_phi_mux_i_phi_fu_116_p4 = tmp_17_t_mid2_v_v_reg_450;
    end else begin
        ap_phi_mux_i_phi_fu_116_p4 = i_reg_113;
    end
end

always @ (*) begin
    if (((exitcond_flatten1_reg_441 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ap_phi_mux_j_phi_fu_137_p4 = tmp_3_mid2_reg_459;
    end else begin
        ap_phi_mux_j_phi_fu_137_p4 = j_reg_133;
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
    if (((exitcond_flatten1_fu_243_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ifmap_TDATA_blk_n = ifmap_TVALID;
    end else begin
        ifmap_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((exitcond_flatten1_fu_243_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ifmap_TREADY = 1'b1;
    end else begin
        ifmap_TREADY = 1'b0;
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
            if ((~((exitcond_flatten1_fu_243_p2 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone)) & ~((ap_enable_reg_pp0_iter2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((exitcond_flatten1_fu_243_p2 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone)) | ((ap_enable_reg_pp0_iter2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone)))) begin
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

assign I_BRAM_0_address0 = tmp_17_cast_fu_389_p1;

assign I_BRAM_0_d0 = ap_reg_pp0_iter1_ifmap_read_reg_466;

assign I_BRAM_1_address0 = tmp_17_cast_fu_389_p1;

assign I_BRAM_1_d0 = ap_reg_pp0_iter1_ifmap_read_reg_466;

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd3];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((exitcond_flatten1_fu_243_p2 == 1'd0) & (ifmap_TVALID == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((exitcond_flatten1_fu_243_p2 == 1'd0) & (ifmap_TVALID == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1));
end

always @ (*) begin
    ap_block_state3_pp0_stage0_iter0 = ((exitcond_flatten1_fu_243_p2 == 1'd0) & (ifmap_TVALID == 1'b0));
end

assign ap_block_state4_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign bound6_fu_231_p1 = bound6_fu_231_p10;

assign bound6_fu_231_p10 = $unsigned(tmp_14_cast_fu_224_p1);

assign bound6_fu_231_p2 = (69'd961 * bound6_fu_231_p1);

assign c_cast1_fu_207_p1 = c;

assign exitcond1_mid1_fu_303_p3 = ((exitcond_flatten_fu_260_p2[0:0] === 1'b1) ? exitcond1_mid_reg_436 : exitcond_fu_298_p2);

assign exitcond1_mid_fu_237_p2 = ((f_cast2_cast_fu_203_p1 != tmp_11_cast_fu_220_p1) ? 1'b1 : 1'b0);

assign exitcond_flatten1_fu_243_p2 = ((indvar_flatten1_reg_102 == bound6_reg_431) ? 1'b1 : 1'b0);

assign exitcond_flatten_fu_260_p2 = ((indvar_flatten_reg_122 == 37'd961) ? 1'b1 : 1'b0);

assign exitcond_fu_298_p2 = ((k_reg_144 != tmp_1_reg_426) ? 1'b1 : 1'b0);

assign f_cast2_cast1_fu_199_p1 = $unsigned(f_cast_fu_191_p1);

assign f_cast2_cast_fu_203_p1 = $unsigned(f_cast_fu_191_p1);

assign f_cast2_fu_195_p1 = $unsigned(f_cast_fu_191_p1);

assign f_cast_fu_191_p1 = $signed(f);

assign i_1_fu_254_p2 = (32'd1 + ap_phi_mux_i_phi_fu_116_p4);

assign indvar_flatten_next1_fu_248_p2 = (indvar_flatten1_reg_102 + 69'd1);

assign indvar_flatten_next_fu_347_p3 = ((exitcond_flatten_fu_260_p2[0:0] === 1'b1) ? 37'd1 : indvar_flatten_op_fu_341_p2);

assign indvar_flatten_op_fu_341_p2 = (indvar_flatten_reg_122 + 37'd1);

assign j_2_fu_310_p2 = (5'd1 + j_mid_fu_266_p3);

assign j_mid_fu_266_p3 = ((exitcond_flatten_fu_260_p2[0:0] === 1'b1) ? 5'd0 : ap_phi_mux_j_phi_fu_137_p4);

assign k_2_fu_335_p2 = (k_mid2_fu_316_p3 + 32'd1);

assign k_mid2_fu_316_p3 = ((exitcond1_mid1_fu_303_p3[0:0] === 1'b1) ? k_mid_fu_274_p3 : f_cast2_reg_414);

assign k_mid_fu_274_p3 = ((exitcond_flatten_fu_260_p2[0:0] === 1'b1) ? f_cast2_reg_414 : k_reg_144);

assign p_shl1_cast_fu_365_p1 = tmp_19_fu_358_p3;

assign smax3_cast_fu_181_p1 = smax3_fu_173_p3;

assign smax3_fu_173_p3 = ((tmp_2_fu_167_p2[0:0] === 1'b1) ? tmp_12_fu_153_p1 : tmp_fu_157_p2);

assign tmp_11_cast_fu_220_p1 = tmp_s_fu_210_p2;

assign tmp_12_fu_153_p1 = c[5:0];

assign tmp_14_cast_fu_224_p1 = $signed(tmp_3_reg_404);

assign tmp_15_fu_163_p1 = c[0:0];

assign tmp_17_cast_fu_389_p1 = tmp_6_reg_487;

assign tmp_17_t_mid2_fu_293_p2 = (tmp_18_fu_289_p1 ^ tmp_15_reg_399);

assign tmp_17_t_mid2_v_v_fu_281_p3 = ((exitcond_flatten_fu_260_p2[0:0] === 1'b1) ? i_1_fu_254_p2 : ap_phi_mux_i_phi_fu_116_p4);

assign tmp_18_fu_289_p1 = tmp_17_t_mid2_v_v_fu_281_p3[0:0];

assign tmp_19_fu_358_p3 = {{tmp_3_mid2_reg_459}, {5'd0}};

assign tmp_1_fu_216_p1 = tmp_s_fu_210_p2;

assign tmp_20_fu_331_p1 = k_mid2_fu_316_p3[10:0];

assign tmp_21_fu_375_p1 = $unsigned(f_cast_reg_409);

assign tmp_22_fu_378_p2 = (tmp_20_reg_472 - tmp_21_fu_375_p1);

assign tmp_2_fu_167_p2 = ((tmp_12_fu_153_p1 > tmp_fu_157_p2) ? 1'b1 : 1'b0);

assign tmp_3_fu_185_p2 = (smax3_cast_fu_181_p1 - c);

assign tmp_3_mid2_cast_fu_355_p1 = tmp_3_mid2_reg_459;

assign tmp_3_mid2_fu_323_p3 = ((exitcond1_mid1_fu_303_p3[0:0] === 1'b1) ? j_mid_fu_266_p3 : j_2_fu_310_p2);

assign tmp_5_fu_369_p2 = (p_shl1_cast_fu_365_p1 - tmp_3_mid2_cast_fu_355_p1);

assign tmp_6_fu_383_p2 = (tmp_5_fu_369_p2 + tmp_22_fu_378_p2);

assign tmp_fu_157_p2 = (6'd2 + tmp_12_fu_153_p1);

assign tmp_s_fu_210_p2 = (6'd31 + f_cast2_cast1_fu_199_p1);

always @ (posedge ap_clk) begin
    f_cast2_reg_414[31:5] <= 27'b000000000000000000000000000;
    tmp_1_reg_426[31:6] <= 26'b00000000000000000000000000;
end

endmodule //data_transfer_i
