`timescale 1ns / 1ps

`define NO_RESET    0
`define ACTIVE_HIGH 1
`define ACTIVE_LOW  2

`define genif generate if
`define else_genif end else if
`define endgen end endgenerate

module axistreamstats #(
    parameter DATA_WIDTH = 32,
    parameter CNT_WIDTH = 32,
    parameter RESET_TYPE = `ACTIVE_LOW
) (
    input wire clk,
    //Depending on RESET_TYPE, one or neither of these ports are used
    input wire rst,
    input wire rstn,
    
    //Input AXI Stream. This is just so Vivado makes it an interface and keeps
    //the block diagram simple
    input wire [DATA_WIDTH-1:0] in_TDATA,
    input wire in_TVALID,
    output wire in_TREADY,
    input wire [DATA_WIDTH/8 -1:0] in_TKEEP,
    input wire in_TDEST,
    input wire in_TID,
    input wire in_TLAST,
    
    //Output AXI Stream. This is just so Vivado makes it an interface and keeps
    //the block diagram simple
    output wire [DATA_WIDTH-1:0] out_TDATA,
    output wire out_TVALID,
    input wire out_TREADY,
    output wire [DATA_WIDTH/8 -1:0] out_TKEEP,
    output wire out_TDEST,
    output wire out_TID,
    output wire out_TLAST,
    
    //The flit and packet counts
    output wire [CNT_WIDTH-1:0] flit_cnt,
    output wire [CNT_WIDTH-1:0] pkt_cnt
);

    //First, directly connect the AXI Streams
    assign out_TDATA = in_TDATA;
    assign out_TVALID = in_TVALID;
    assign in_TREADY = out_TREADY;
    assign out_TKEEP = in_TKEEP;
    assign out_TDEST = in_TDEST;
    assign out_TID = in_TID;
    assign out_TLAST = in_TLAST;
    
    //A few helper signals
    wire flit_vld;
    assign flit_vld = in_TVALID && in_TREADY;
    
    wire flit_last;
    assign flit_last = flit_vld && in_TLAST;
    
    //Now do the packet counting
    reg [CNT_WIDTH-1:0] flit_cnt_r = 0;
    reg [CNT_WIDTH-1:0] pkt_cnt_r = 0;
    
`genif (RESET_TYPE == `NO_RESET) begin

    always @(posedge clk) begin
        flit_cnt_r <= flit_cnt_r + flit_vld;
        pkt_cnt_r <= pkt_cnt_r + flit_last;
    end
    
`else_genif (RESET_TYPE == `ACTIVE_HIGH) begin

    always @(posedge clk) begin
        if (rst) begin
            flit_cnt_r <= 0;
            pkt_cnt_r <= 0;
        end else begin
            flit_cnt_r <= flit_cnt_r + flit_vld;
            pkt_cnt_r <= pkt_cnt_r + flit_last;
        end
    end
    
`else_genif (RESET_TYPE == `ACTIVE_LOW) begin

    always @(posedge clk) begin
        if (!rstn) begin
            flit_cnt_r <= 0;
            pkt_cnt_r <= 0;
        end else begin
            flit_cnt_r <= flit_cnt_r + flit_vld;
            pkt_cnt_r <= pkt_cnt_r + flit_last;
        end
    end
    
`endgen

    //And of course, don't forget to assign the outputs!
    assign flit_cnt = flit_cnt_r;
    assign pkt_cnt = pkt_cnt_r;
    
endmodule
    
`undef genif
`undef else_genif
`undef endgen

`undef NO_RESET
`undef ACTIVE_HIGH
`undef ACTIVE_LOW
