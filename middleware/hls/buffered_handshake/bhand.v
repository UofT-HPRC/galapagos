`ifndef BHAND_INCLUDE_GUARD
`define BHAND_INCLUDE_GUARD 1

`timescale 1ns / 1ps
/*
bhand.v

Implements a buffered handshake. Can control whether or not the core has reset
signals and of which polarity. (Unfortunately, it makes the Verilog harder to
read...)

*/

`define genif generate if
`define else_genif end else if
`define endgen end endgenerate

`define NO_RESET 0
`define ACTIVE_HIGH 1
`define ACTIVE_LOW 2

module bhand # (
    parameter DATA_WIDTH = 8,
    parameter RESET_TYPE = `ACTIVE_HIGH
) (
    input wire clk,
    //Reset is used according to the RESET_TYPE parameter
    input wire rst,
    
    //Connect your input stream signals here
    //For example,
    //  .idata({in_TDATA, in_TKEEP, in_TDEST, in_TID, in_TLAST}),
    //  .idata_vld(in_TVALID),
    //  .idata_rdy(in_TREADY)
    //
    //Keep in mind that idata_rdy is an output of this module
    input wire [DATA_WIDTH-1:0] idata,
    input wire idata_vld,
    output wire idata_rdy,
    
    //Connect your output stream signals here
    //For example,
    //  .odata({out_TDATA, out_TKEEP, out_TDEST, out_TID, out_TLAST}),
    //  .odata_vld(out_TVALID),
    //  .odata_rdy(out_TREADY)
    //
    //Keep in mind that odata_rdy is an input of this module
    output wire [DATA_WIDTH-1:0] odata,
    output wire odata_vld,
    input wire odata_rdy
);

    //Some helper signals for neatening up the code
    wire shift_in;
    assign shift_in = idata_vld && idata_rdy;
    
    wire shift_out;
    assign shift_out = odata_vld && odata_rdy;
 
    //Forward-declare this signal since extra_mem needs it
    reg mem_vld = 0;

    //Internal registers and signals for extra element
    reg [DATA_WIDTH-1:0] extra_mem = 0;
    reg extra_mem_vld = 0;
    wire extra_mem_rdy;
    
    //Unlike a regular FIFO, we are only ready if empty:
    assign extra_mem_rdy = (extra_mem_vld == 0);
    
    //We will enable writing into extra mem if a new element is shifting in AND
    //mem is full AND mem will not be read on this cycle
    wire extra_mem_en;
    assign extra_mem_en = shift_in && mem_vld && !shift_out;

`genif (RESET_TYPE == `NO_RESET) begin

    always @(posedge clk) begin
        //extra_mem_vld's next value
        if (extra_mem_en) begin
            extra_mem_vld <= 1;
        end else if (shift_out) begin
            extra_mem_vld <= 0;
        end
    end
    
`else_genif (RESET_TYPE == `ACTIVE_HIGH) begin

    always @(posedge clk) begin
        if (rst) begin
            extra_mem_vld <= 0;
        end else begin
            if (extra_mem_en) begin
                extra_mem_vld <= 1;
            end else if (shift_out) begin
                extra_mem_vld <= 0;
            end
        end
    end
    
`else_genif (RESET_TYPE == `ACTIVE_LOW) begin

    always @(posedge clk) begin
        if (!rst) begin
            extra_mem_vld <= 0;
        end else begin
            if (extra_mem_en) begin
                extra_mem_vld <= 1;
            end else if (shift_out) begin
                extra_mem_vld <= 0;
            end
        end
    end
    
`endgen
    
    //extra_mem's next value
    always @(posedge clk) begin
        if (extra_mem_en) begin
            extra_mem <= idata;
        end
    end
    
    
    //Internal registers and signals for FIFO element
    reg [DATA_WIDTH-1:0] mem = 0;
    //reg mem_vld = 0; //moved
    wire mem_rdy;
    
    //We are ready if FIFO is empty, or if the value is leaving on this cycle
    assign mem_rdy = !mem_vld || (odata_vld && odata_rdy);
    
    //We will enable writing into mem if it is ready, and if the input is valid
    wire mem_en;
    assign mem_en = mem_rdy && (idata_vld || extra_mem_vld);

`genif (RESET_TYPE == `NO_RESET) begin
    always @(posedge clk) begin
        //mem_vld's next value
        if (mem_en) begin
            mem_vld <= 1;
        end else if (shift_out) begin
            mem_vld <= 0;
        end
    end
end else if (RESET_TYPE == `ACTIVE_HIGH) begin
    always @(posedge clk) begin
        //mem_vld's next value
        if (rst) begin
            mem_vld <= 0;
        end else begin
            if (mem_en) begin
                mem_vld <= 1;
            end else if (shift_out) begin
                mem_vld <= 0;
            end
        end
    end
end else if (RESET_TYPE == `ACTIVE_LOW) begin
    always @(posedge clk) begin
        //mem_vld's next value
        if (!rst) begin
            mem_vld <= 0;
        end else begin
            if (mem_en) begin
                mem_vld <= 1;
            end else if (shift_out) begin
                mem_vld <= 0;
            end
        end
    end
`endgen
    
    always @(posedge clk) begin
        //mem's next value
        if (mem_en) begin
            mem <= extra_mem_vld ? extra_mem : idata;
        end
    end
    
    //Actually wire up module outputs
    assign idata_rdy = extra_mem_rdy;
    assign odata = mem;
    assign odata_vld = mem_vld;
    
endmodule


`undef NO_RESET
`undef ACTIVE_HIGH
`undef ACTIVE_LOW

`undef genif
`undef else_genif
`undef endgen

`endif
