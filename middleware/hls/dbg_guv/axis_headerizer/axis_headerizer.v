`timescale 1ns / 1ps


`include "macros.vh"

module axis_headerizer # (
    parameter DATA_WIDTH = 64,
    parameter DEST_WIDTH = 16,
    parameter ID_WIDTH = 16,
    parameter USER_WIDTH = 8,
    parameter RESET_TYPE = `NO_RESET,
    parameter ENABLE_TLAST_HACK = 0
) (
    input wire clk,
    input wire rst,
    
    `in_axis_kl(sides, DATA_WIDTH),
    input wire [DEST_WIDTH -1:0] sides_TDEST,
    input wire [ID_WIDTH -1:0] sides_TID,
    input wire [USER_WIDTH -1:0] sides_TUSER,
    
    `out_axis_kl(hdr, DATA_WIDTH)
);
    
    `localparam WAIT_FIRST_VLD = 0;
    `localparam WAIT_LAST = 1;
    
    reg state = WAIT_FIRST_VLD;
    
    `wire_rst_sig;
    
`genif (RESET_TYPE == `NO_RESET) begin
    always @(posedge clk) begin
        case (state)
        WAIT_FIRST_VLD:
            state <= `axis_flit(hdr) ? WAIT_LAST : WAIT_FIRST_VLD;
        WAIT_LAST:
            state <= `axis_last(hdr) ? WAIT_FIRST_VLD : WAIT_LAST;
        endcase
    end
`else_gen
    always @(posedge clk) begin
        if (rst_sig) begin
            state <= WAIT_FIRST_VLD;
        end else begin
            case (state)
            WAIT_FIRST_VLD:
                state <= `axis_flit(hdr) ? WAIT_LAST : WAIT_FIRST_VLD;
            WAIT_LAST:
                state <= `axis_last(hdr) ? WAIT_FIRST_VLD : WAIT_LAST;
            endcase
        end
    end
`endgen
    
    //TODO: Parameterize which sidechannels are present?
    `localparam PAD_WIDTH = DATA_WIDTH - (1 + DEST_WIDTH + ID_WIDTH + USER_WIDTH);
    wire [DATA_WIDTH -1:0] header = {{PAD_WIDTH{1'b0}}, sides_TLAST, sides_TDEST, sides_TID, sides_TUSER};
    
    assign hdr_TDATA = (state == WAIT_LAST) ? sides_TDATA : header;
    assign hdr_TVALID = sides_TVALID;
    assign sides_TREADY = (state == WAIT_LAST) && hdr_TREADY;
    assign hdr_TKEEP = (state == WAIT_LAST) ? sides_TKEEP : {(DATA_WIDTH/8){1'b1}};
`genif (ENABLE_TLAST_HACK == 0) begin
    assign hdr_TLAST = (state == WAIT_LAST) && sides_TLAST;
`else_gen
    assign hdr_TLAST = (state == WAIT_LAST);
`endgen

endmodule
