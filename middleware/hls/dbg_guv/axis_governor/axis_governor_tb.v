`timescale 1ns / 1ps

/*
testbench_template.v

Replace innards with desired logic
*/

`include "axis_governor.v"

module testbench_template # (
    parameter DATA_WIDTH = 8,
    parameter DEST_WIDTH = 16,
    parameter ID_WIDTH = 16
);
	reg clk = 0;
    //Input AXI Stream.
    reg [DATA_WIDTH-1:0] in_TDATA = 1;
    reg in_TVALID = 0;
    wire in_TREADY;
    reg [DATA_WIDTH/8 -1:0] in_TKEEP = 0;
    reg [DEST_WIDTH -1:0] in_TDEST = 0;
    reg [ID_WIDTH -1:0] in_TID = 0;
    reg in_TLAST = 0;
    
    //Inject AXI Stream. 
    reg [DATA_WIDTH-1:0] inj_TDATA = 0;
    reg inj_TVALID = 0;
    wire inj_TREADY;
    reg [DATA_WIDTH/8 -1:0] inj_TKEEP = 0;
    reg [DEST_WIDTH -1:0] inj_TDEST = 0;
    reg [ID_WIDTH -1:0] inj_TID = 0;
    reg inj_TLAST = 0;
    
    //Output AXI Stream.
    wire [DATA_WIDTH-1:0] out_TDATA;
    wire out_TVALID;
    reg out_TREADY = 0;
    wire [DATA_WIDTH/8 -1:0] out_TKEEP;
    wire [DEST_WIDTH -1:0] out_TDEST;
    wire [ID_WIDTH -1:0] out_TID;
    wire out_TLAST;
    
    //Log AXI Stream. 
    wire [DATA_WIDTH-1:0] log_TDATA;
    wire log_TVALID;
    reg log_TREADY = 0;
    wire [DATA_WIDTH/8 -1:0] log_TKEEP;
    wire [DEST_WIDTH -1:0] log_TDEST;
    wire [ID_WIDTH -1:0] log_TID;
    wire log_TLAST;
    
    //Control signals
    wire pause;
    wire drop;
    wire log;
    
    //Simulation variables
    wire inject;
    reg [3:0] state = 0;
    
    assign pause = state[0];
    assign drop = state[1];
    assign log = state[2];
    assign inject = state[3];
    
    integer fd, dummy;
    
    initial begin
        $dumpfile("axis_governor.vcd");
        $dumpvars;
        $dumplimit(512000);
        
        clk <= 0;
        
        repeat(16) begin
            repeat(32) @(negedge clk);
            state <= state + 1;
        end
        
        #10
        $finish;
    end
    
    always #5 clk <= ~clk;
    
    always @(posedge clk) begin
        #0.01 //Not sure why Vivado doesn't need this...
        in_TVALID <= $random;
        inj_TVALID <= $random & inject;
        out_TREADY <= $random;
        log_TREADY <= $random;
        
        if (in_TREADY && in_TVALID) begin
            in_TDATA <= in_TDATA + 2;
        end
        
        if (inj_TREADY && inj_TVALID) begin
            inj_TDATA <= inj_TDATA + 2;
        end
    end

axis_governor #(
    .DATA_WIDTH(DATA_WIDTH),
    .DEST_WIDTH(DEST_WIDTH),
    .ID_WIDTH(ID_WIDTH)
) DUT (   
    .clk(clk),
    
    //Input AXI Stream.
	.in_TDATA(in_TDATA),
	.in_TVALID(in_TVALID),
	.in_TREADY(in_TREADY),
	.in_TKEEP(in_TKEEP),
	.in_TDEST(in_TDEST),
	.in_TID(in_TID),
	.in_TLAST(in_TLAST),
    
    //Inject AXI Stream. 
	.inj_TDATA(inj_TDATA),
	.inj_TVALID(inj_TVALID),
	.inj_TREADY(inj_TREADY),
	.inj_TKEEP(inj_TKEEP),
	.inj_TDEST(inj_TDEST),
	.inj_TID(inj_TID),
	.inj_TLAST(inj_TLAST),
    
    //Output AXI Stream.
	.out_TDATA(out_TDATA),
	.out_TVALID(out_TVALID),
	.out_TREADY(out_TREADY),
	.out_TKEEP(out_TKEEP),
	.out_TDEST(out_TDEST),
	.out_TID(out_TID),
	.out_TLAST(out_TLAST),
    
    //Log AXI Stream. 
	.log_TDATA(log_TDATA),
	.log_TVALID(log_TVALID),
	.log_TREADY(log_TREADY),
	.log_TKEEP(log_TKEEP),
	.log_TDEST(log_TDEST),
	.log_TID(log_TID),
	.log_TLAST(log_TLAST),
    
    //Control signals
	.pause(pause),
	.drop(drop),
	.log_en(log)
);


endmodule
