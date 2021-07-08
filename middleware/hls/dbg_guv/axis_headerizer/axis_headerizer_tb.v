`timescale 1ns / 1ps

/*
testbench_template.v

Replace innards with desired logic
*/

`include "macros.vh"
`include "axis_headerizer.v"

module axis_headerizer_tb # (
    parameter DATA_WIDTH = 64,
    parameter DEST_WIDTH = 16,
    parameter ID_WIDTH = 16,
    parameter USER_WIDTH = 8,
    parameter RESET_TYPE = `NO_RESET
);
    reg clk = 0;
    reg rst = 0;
    
    `sim_in_axis_kl(sides, DATA_WIDTH);
    reg [DEST_WIDTH -1:0] sides_TDEST = 0;
    reg [ID_WIDTH -1:0]   sides_TID   = 0;
    reg [USER_WIDTH -1:0] sides_TUSER = 0;
    
    `sim_out_axis_kl(hdr, DATA_WIDTH);

    
    initial begin
        $dumpfile("axis_headerizer.vcd");
        $dumpvars;
        $dumplimit(512000);
        
        sides_TVALID <= 1;
        
        # 2000
        $finish;
        

    end
    
    always #5 clk <= ~clk;
    
    always @(posedge clk) begin
        if (`axis_flit(sides)) begin
            sides_TDATA <= sides_TDATA + 3; //Could have done +1, but +3 more interesting
            sides_TKEEP <= $random;
            sides_TLAST <= $random;
            sides_TDEST <= $random;
            sides_TID   <= $random;
            sides_TUSER <= $random;
        end
    end

    axis_headerizer # (
		.DATA_WIDTH(DATA_WIDTH),
		.DEST_WIDTH(DEST_WIDTH),
		.ID_WIDTH(ID_WIDTH),
		.USER_WIDTH(USER_WIDTH),
		.RESET_TYPE(RESET_TYPE)
    ) DUT (
		.clk(clk),
		.rst(rst),
        
        `inst_axis_kl(sides, sides),
		.sides_TDEST(sides_TDEST),
		.sides_TID(sides_TID),
		.sides_TUSER(sides_TUSER),
        
        `inst_axis_kl(hdr, hdr)
    );

endmodule
