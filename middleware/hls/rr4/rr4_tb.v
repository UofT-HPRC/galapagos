`timescale 1ns / 1ps

/*
testbench_template.v

Replace innards with desired logic
*/

`include "rr4.v"
`include "macros.vh"

module rr4_tb # (
    parameter DATA_WIDTH = 8,
    parameter PIPE_STAGE = 1,
    parameter RESET_TYPE = `NO_RESET,
    parameter TLAST_ARB = 1
);
	reg clk = 0;
    reg rst = 0;
    //Other variables connected to your instance
    `sim_in_axis_l(s0, DATA_WIDTH);
    `sim_in_axis_l(s1, DATA_WIDTH);
    `sim_in_axis_l(s2, DATA_WIDTH);
    `sim_in_axis_l(s3, DATA_WIDTH);
    `sim_out_axis_l(o, DATA_WIDTH);
    
    //Makes sim easier to read
    wire [1:0] who = o_TDATA[1:0];
    wire o_flit = `axis_flit(o);
    
    //A few simple checks to make sure the outputs look okay.
    reg [DATA_WIDTH -1:0] s0_prev = 0;
    reg [DATA_WIDTH -1:0] s1_prev = 1;
    reg [DATA_WIDTH -1:0] s2_prev = 2;
    reg [DATA_WIDTH -1:0] s3_prev = 3;
    
    reg [15:0] s0_cnt = 0;
    reg [15:0] s1_cnt = 0;
    reg [15:0] s2_cnt = 0;
    reg [15:0] s3_cnt = 0;
    
    integer fd, dummy;
    
    initial begin
        $dumpfile("rr4.vcd");
        $dumpvars;
        $dumplimit(512000);
        
        s0_TDATA = 4;
        s1_TDATA = 5;
        s2_TDATA = 6;
        s3_TDATA = 7;
        
        s0_TVALID = 0;
        s1_TVALID = 0;
        s2_TVALID = 0;
        s3_TVALID = 0;
        
        s0_TLAST = 0;
        s1_TLAST = 0;
        s2_TLAST = 0;
        s3_TLAST = 0;
        
        fd = $fopen("rr4_drivers.mem", "r");
        if (fd == 0) begin
            $display("Could not open file");
            $finish;
        end
        
        while ($fgetc(fd) != "\n") begin
            if ($feof(fd)) begin
                $display("Error: file is in incorrect format");
                $finish;
            end
        end
    end
    
    always #5 clk <= ~clk;
    
    always @(posedge clk) begin
        if ($feof(fd)) begin
            $display("Reached end of drivers file");
            #20
            $finish;
        end
        
        //#0.01
        //dummy = $fscanf(fd, "%F%O%R%M%A%T", /* list of variables */);
        #200
        $dumpoff;
        #40000
        $dumpon;
        #200
        $finish;
    end
    
    //Quick and dirty test vectors
    always @(posedge clk) begin
        if (`axis_flit(s0)) begin
            s0_cnt <= s0_cnt + s0_TLAST;
            s0_TDATA <= s0_TDATA + 4;
        end if (`axis_flit(s1)) begin
            s1_cnt <= s1_cnt + s1_TLAST;
            s1_TDATA <= s1_TDATA + 4;
        end if (`axis_flit(s2)) begin
            s2_cnt <= s2_cnt + s2_TLAST;
            s2_TDATA <= s2_TDATA + 4;
        end if (`axis_flit(s3)) begin
            s3_cnt <= s3_cnt + s3_TLAST;
            s3_TDATA <= s3_TDATA + 4;
        end
        
        s0_TVALID <= $random;
        s1_TVALID <= $random;
        s2_TVALID <= $random;
        s3_TVALID <= $random;
        //~ s0_TVALID <= 1;
        //~ s1_TVALID <= 1;
        //~ s2_TVALID <= 1;
        //~ s3_TVALID <= 1;
        
        s0_TLAST <= $random;
        s1_TLAST <= $random;
        s2_TLAST <= $random;
        s3_TLAST <= $random;
        //~ s0_TLAST <= `axis_flit(s0) ? ~s0_TLAST : s0_TLAST;
        //~ s1_TLAST <= `axis_flit(s1) ? ~s1_TLAST : s1_TLAST;
        //~ s2_TLAST <= `axis_flit(s2) ? ~s2_TLAST : s2_TLAST;
        //~ s3_TLAST <= `axis_flit(s3) ? ~s3_TLAST : s3_TLAST;
        
        o_TREADY <= $random;
        //~ o_TREADY <= 1;
    end
    

    `define IDLE 3'b111
    reg [2:0] state = `IDLE;
    
    //Sime simple checks on the output
    always @(posedge clk) begin
        //This makes sure no flits are dropped or repeated
        if (`axis_flit(o)) begin
            case (who)
            2'b00: begin
                if (o_TDATA - s0_prev != 8'd4) $display("Error! cur = %d, prev = %d", o_TDATA, s0_prev);
                s0_prev <= o_TDATA;
            end 2'b01: begin
                if (o_TDATA - s1_prev != 8'd4) $display("Error! cur = %d, prev = %d", o_TDATA, s1_prev);
                s1_prev <= o_TDATA;
            end 2'b10: begin
                if (o_TDATA - s2_prev != 8'd4) $display("Error! cur = %d, prev = %d", o_TDATA, s2_prev);
                s2_prev <= o_TDATA;
            end 2'b11: begin
                if (o_TDATA - s3_prev != 8'd4) $display("Error! cur = %d, prev = %d", o_TDATA, s3_prev);
                s3_prev <= o_TDATA;
            end
            endcase
        end
        
        //This makes sure no packet is interrupted before TLAST
        if (`axis_flit(o)) begin
            if (state != `IDLE && state[1:0] != who[1:0]) begin
                $display("Error! Interrupted packet!");
            end
            if (o_TLAST) begin
                state <= `IDLE;
            end else if (state == `IDLE) begin
                state <= {1'b0, who};
            end
        end
    end

    rr4 # (
		.DATA_WIDTH(DATA_WIDTH),
		.PIPE_STAGE(PIPE_STAGE),
		.RESET_TYPE(RESET_TYPE),
		.TLAST_ARB(TLAST_ARB)
    ) DUT (
        clk, rst,
        
        `ports_axis_l(s0),
        `ports_axis_l(s1),
        `ports_axis_l(s2),
        `ports_axis_l(s3),
        
        `ports_axis_l(o)
    );


endmodule
