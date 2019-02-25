// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2017.4
// Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module Loop_4_proc21 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        val_size_dout,
        val_size_empty_n,
        val_size_read,
        val_fifo_V_dout,
        val_fifo_V_empty_n,
        val_fifo_V_read,
        vect_fifo_V_dout,
        vect_fifo_V_empty_n,
        vect_fifo_V_read,
        output_stream_V_TDATA,
        output_stream_V_TVALID,
        output_stream_V_TREADY
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_pp0_stage0 = 3'd2;
parameter    ap_ST_fsm_state10 = 3'd4;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [31:0] val_size_dout;
input   val_size_empty_n;
output   val_size_read;
input  [31:0] val_fifo_V_dout;
input   val_fifo_V_empty_n;
output   val_fifo_V_read;
input  [31:0] vect_fifo_V_dout;
input   vect_fifo_V_empty_n;
output   vect_fifo_V_read;
output  [31:0] output_stream_V_TDATA;
output   output_stream_V_TVALID;
input   output_stream_V_TREADY;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg val_size_read;
reg val_fifo_V_read;
reg vect_fifo_V_read;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [31:0] output_stream_V_1_data_out;
reg    output_stream_V_1_vld_in;
wire    output_stream_V_1_vld_out;
wire    output_stream_V_1_ack_in;
wire    output_stream_V_1_ack_out;
reg   [31:0] output_stream_V_1_payload_A;
reg   [31:0] output_stream_V_1_payload_B;
reg    output_stream_V_1_sel_rd;
reg    output_stream_V_1_sel_wr;
wire    output_stream_V_1_sel;
wire    output_stream_V_1_load_A;
wire    output_stream_V_1_load_B;
reg   [1:0] output_stream_V_1_state;
wire    output_stream_V_1_state_cmp_full;
reg    val_size_blk_n;
reg    val_fifo_V_blk_n;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter1;
wire    ap_block_pp0_stage0;
reg   [0:0] exitcond_i_reg_135;
reg    vect_fifo_V_blk_n;
reg    output_stream_V_TDATA_blk_n;
reg    ap_enable_reg_pp0_iter6;
reg   [0:0] ap_reg_pp0_iter5_exitcond_i_reg_135;
reg    ap_enable_reg_pp0_iter7;
reg   [0:0] ap_reg_pp0_iter6_exitcond_i_reg_135;
reg   [31:0] i3_i_reg_103;
reg   [31:0] val_size_read_reg_130;
reg    ap_block_state1;
wire   [0:0] exitcond_i_fu_119_p2;
wire    ap_block_state2_pp0_stage0_iter0;
reg    ap_block_state3_pp0_stage0_iter1;
wire    ap_block_state4_pp0_stage0_iter2;
wire    ap_block_state5_pp0_stage0_iter3;
wire    ap_block_state6_pp0_stage0_iter4;
wire    ap_block_state7_pp0_stage0_iter5;
wire    ap_block_state8_pp0_stage0_iter6;
reg    ap_block_state8_io;
wire    ap_block_state9_pp0_stage0_iter7;
reg    ap_block_state9_io;
reg    ap_block_pp0_stage0_11001;
reg   [0:0] ap_reg_pp0_iter1_exitcond_i_reg_135;
reg   [0:0] ap_reg_pp0_iter2_exitcond_i_reg_135;
reg   [0:0] ap_reg_pp0_iter3_exitcond_i_reg_135;
reg   [0:0] ap_reg_pp0_iter4_exitcond_i_reg_135;
wire   [31:0] i_fu_124_p2;
reg    ap_enable_reg_pp0_iter0;
reg   [31:0] tmp_reg_144;
reg   [31:0] tmp_1_reg_149;
wire   [31:0] grp_fu_114_p2;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state2;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_enable_reg_pp0_iter4;
reg    ap_enable_reg_pp0_iter5;
reg    ap_block_pp0_stage0_01001;
reg    grp_fu_114_ce;
wire    ap_CS_fsm_state10;
reg   [2:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 3'd1;
#0 output_stream_V_1_sel_rd = 1'b0;
#0 output_stream_V_1_sel_wr = 1'b0;
#0 output_stream_V_1_state = 2'd0;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter6 = 1'b0;
#0 ap_enable_reg_pp0_iter7 = 1'b0;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_enable_reg_pp0_iter4 = 1'b0;
#0 ap_enable_reg_pp0_iter5 = 1'b0;
end

spmv_mult_axis_fmbkb #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
spmv_mult_axis_fmbkb_U30(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(tmp_reg_144),
    .din1(tmp_1_reg_149),
    .ce(grp_fu_114_ce),
    .dout(grp_fu_114_p2)
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
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((output_stream_V_1_ack_in == 1'b1) & (1'b1 == ap_CS_fsm_state10))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_condition_pp0_exit_iter0_state2) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if ((~((ap_start == 1'b0) | (val_size_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            if ((1'b1 == ap_condition_pp0_exit_iter0_state2)) begin
                ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state2);
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
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter4 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter5 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter5 <= ap_enable_reg_pp0_iter4;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter6 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter6 <= ap_enable_reg_pp0_iter5;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter7 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter7 <= ap_enable_reg_pp0_iter6;
        end else if ((~((ap_start == 1'b0) | (val_size_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter7 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        output_stream_V_1_sel_rd <= 1'b0;
    end else begin
        if (((output_stream_V_1_ack_out == 1'b1) & (output_stream_V_1_vld_out == 1'b1))) begin
            output_stream_V_1_sel_rd <= ~output_stream_V_1_sel_rd;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        output_stream_V_1_sel_wr <= 1'b0;
    end else begin
        if (((output_stream_V_1_ack_in == 1'b1) & (output_stream_V_1_vld_in == 1'b1))) begin
            output_stream_V_1_sel_wr <= ~output_stream_V_1_sel_wr;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        output_stream_V_1_state <= 2'd0;
    end else begin
        if ((((output_stream_V_1_state == 2'd2) & (output_stream_V_1_vld_in == 1'b0)) | ((output_stream_V_1_state == 2'd3) & (output_stream_V_1_vld_in == 1'b0) & (output_stream_V_1_ack_out == 1'b1)))) begin
            output_stream_V_1_state <= 2'd2;
        end else if ((((output_stream_V_1_state == 2'd1) & (output_stream_V_1_ack_out == 1'b0)) | ((output_stream_V_1_state == 2'd3) & (output_stream_V_1_ack_out == 1'b0) & (output_stream_V_1_vld_in == 1'b1)))) begin
            output_stream_V_1_state <= 2'd1;
        end else if (((~((output_stream_V_1_vld_in == 1'b0) & (output_stream_V_1_ack_out == 1'b1)) & ~((output_stream_V_1_ack_out == 1'b0) & (output_stream_V_1_vld_in == 1'b1)) & (output_stream_V_1_state == 2'd3)) | ((output_stream_V_1_state == 2'd1) & (output_stream_V_1_ack_out == 1'b1)) | ((output_stream_V_1_state == 2'd2) & (output_stream_V_1_vld_in == 1'b1)))) begin
            output_stream_V_1_state <= 2'd3;
        end else begin
            output_stream_V_1_state <= 2'd2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_start == 1'b0) | (val_size_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        i3_i_reg_103 <= 32'd0;
    end else if (((exitcond_i_fu_119_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        i3_i_reg_103 <= i_fu_124_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ap_reg_pp0_iter1_exitcond_i_reg_135 <= exitcond_i_reg_135;
        exitcond_i_reg_135 <= exitcond_i_fu_119_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        ap_reg_pp0_iter2_exitcond_i_reg_135 <= ap_reg_pp0_iter1_exitcond_i_reg_135;
        ap_reg_pp0_iter3_exitcond_i_reg_135 <= ap_reg_pp0_iter2_exitcond_i_reg_135;
        ap_reg_pp0_iter4_exitcond_i_reg_135 <= ap_reg_pp0_iter3_exitcond_i_reg_135;
        ap_reg_pp0_iter5_exitcond_i_reg_135 <= ap_reg_pp0_iter4_exitcond_i_reg_135;
        ap_reg_pp0_iter6_exitcond_i_reg_135 <= ap_reg_pp0_iter5_exitcond_i_reg_135;
    end
end

always @ (posedge ap_clk) begin
    if ((output_stream_V_1_load_A == 1'b1)) begin
        output_stream_V_1_payload_A <= grp_fu_114_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((output_stream_V_1_load_B == 1'b1)) begin
        output_stream_V_1_payload_B <= grp_fu_114_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond_i_reg_135 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_1_reg_149 <= vect_fifo_V_dout;
        tmp_reg_144 <= val_fifo_V_dout;
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_start == 1'b0) | (val_size_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        val_size_read_reg_130 <= val_size_dout;
    end
end

always @ (*) begin
    if ((exitcond_i_fu_119_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state2 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state2 = 1'b0;
    end
end

always @ (*) begin
    if (((output_stream_V_1_ack_in == 1'b1) & (1'b1 == ap_CS_fsm_state10))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
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
    if (((ap_enable_reg_pp0_iter5 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter7 == 1'b0) & (ap_enable_reg_pp0_iter6 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((output_stream_V_1_ack_in == 1'b1) & (1'b1 == ap_CS_fsm_state10))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        grp_fu_114_ce = 1'b1;
    end else begin
        grp_fu_114_ce = 1'b0;
    end
end

always @ (*) begin
    if ((output_stream_V_1_sel == 1'b1)) begin
        output_stream_V_1_data_out = output_stream_V_1_payload_B;
    end else begin
        output_stream_V_1_data_out = output_stream_V_1_payload_A;
    end
end

always @ (*) begin
    if (((ap_reg_pp0_iter5_exitcond_i_reg_135 == 1'd0) & (ap_enable_reg_pp0_iter6 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        output_stream_V_1_vld_in = 1'b1;
    end else begin
        output_stream_V_1_vld_in = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_reg_pp0_iter6_exitcond_i_reg_135 == 1'd0) & (ap_enable_reg_pp0_iter7 == 1'b1) & (1'b0 == ap_block_pp0_stage0)) | ((ap_reg_pp0_iter5_exitcond_i_reg_135 == 1'd0) & (ap_enable_reg_pp0_iter6 == 1'b1) & (1'b0 == ap_block_pp0_stage0)))) begin
        output_stream_V_TDATA_blk_n = output_stream_V_1_state[1'd1];
    end else begin
        output_stream_V_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((exitcond_i_reg_135 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        val_fifo_V_blk_n = val_fifo_V_empty_n;
    end else begin
        val_fifo_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((exitcond_i_reg_135 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        val_fifo_V_read = 1'b1;
    end else begin
        val_fifo_V_read = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        val_size_blk_n = val_size_empty_n;
    end else begin
        val_size_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (val_size_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        val_size_read = 1'b1;
    end else begin
        val_size_read = 1'b0;
    end
end

always @ (*) begin
    if (((exitcond_i_reg_135 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        vect_fifo_V_blk_n = vect_fifo_V_empty_n;
    end else begin
        vect_fifo_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((exitcond_i_reg_135 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        vect_fifo_V_read = 1'b1;
    end else begin
        vect_fifo_V_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start == 1'b0) | (val_size_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((exitcond_i_fu_119_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0)) & ~((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter7 == 1'b1) & (ap_enable_reg_pp0_iter6 == 1'b0)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((exitcond_i_fu_119_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0)) | ((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter7 == 1'b1) & (ap_enable_reg_pp0_iter6 == 1'b0)))) begin
                ap_NS_fsm = ap_ST_fsm_state10;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state10 : begin
            if (((output_stream_V_1_ack_in == 1'b1) & (1'b1 == ap_CS_fsm_state10))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state10;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state10 = ap_CS_fsm[32'd2];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((ap_enable_reg_pp0_iter1 == 1'b1) & (((exitcond_i_reg_135 == 1'd0) & (vect_fifo_V_empty_n == 1'b0)) | ((exitcond_i_reg_135 == 1'd0) & (val_fifo_V_empty_n == 1'b0))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = (((1'b1 == ap_block_state9_io) & (ap_enable_reg_pp0_iter7 == 1'b1)) | ((1'b1 == ap_block_state8_io) & (ap_enable_reg_pp0_iter6 == 1'b1)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((exitcond_i_reg_135 == 1'd0) & (vect_fifo_V_empty_n == 1'b0)) | ((exitcond_i_reg_135 == 1'd0) & (val_fifo_V_empty_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = (((1'b1 == ap_block_state9_io) & (ap_enable_reg_pp0_iter7 == 1'b1)) | ((1'b1 == ap_block_state8_io) & (ap_enable_reg_pp0_iter6 == 1'b1)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((exitcond_i_reg_135 == 1'd0) & (vect_fifo_V_empty_n == 1'b0)) | ((exitcond_i_reg_135 == 1'd0) & (val_fifo_V_empty_n == 1'b0)))));
end

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (val_size_empty_n == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state3_pp0_stage0_iter1 = (((exitcond_i_reg_135 == 1'd0) & (vect_fifo_V_empty_n == 1'b0)) | ((exitcond_i_reg_135 == 1'd0) & (val_fifo_V_empty_n == 1'b0)));
end

assign ap_block_state4_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage0_iter4 = ~(1'b1 == 1'b1);

assign ap_block_state7_pp0_stage0_iter5 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state8_io = ((ap_reg_pp0_iter5_exitcond_i_reg_135 == 1'd0) & (output_stream_V_1_ack_in == 1'b0));
end

assign ap_block_state8_pp0_stage0_iter6 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state9_io = ((ap_reg_pp0_iter6_exitcond_i_reg_135 == 1'd0) & (output_stream_V_1_ack_in == 1'b0));
end

assign ap_block_state9_pp0_stage0_iter7 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign exitcond_i_fu_119_p2 = ((i3_i_reg_103 == val_size_read_reg_130) ? 1'b1 : 1'b0);

assign i_fu_124_p2 = (i3_i_reg_103 + 32'd1);

assign output_stream_V_1_ack_in = output_stream_V_1_state[1'd1];

assign output_stream_V_1_ack_out = output_stream_V_TREADY;

assign output_stream_V_1_load_A = (output_stream_V_1_state_cmp_full & ~output_stream_V_1_sel_wr);

assign output_stream_V_1_load_B = (output_stream_V_1_state_cmp_full & output_stream_V_1_sel_wr);

assign output_stream_V_1_sel = output_stream_V_1_sel_rd;

assign output_stream_V_1_state_cmp_full = ((output_stream_V_1_state != 2'd1) ? 1'b1 : 1'b0);

assign output_stream_V_1_vld_out = output_stream_V_1_state[1'd0];

assign output_stream_V_TDATA = output_stream_V_1_data_out;

assign output_stream_V_TVALID = output_stream_V_1_state[1'd0];

endmodule //Loop_4_proc21
