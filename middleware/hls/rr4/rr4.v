/*
A four-to-one round-robin AXI Stream Switch. 

Parameters:
    DATA_WIDTH - Width of TDATA field
    RESET_TYPE - Set to 0 for no reset, 1 for active-high, 2 for active-low
    PIPE_STAGE - Set to 1 to enable output pipeline registers
    TLAST_ARB  - Set to 1 to only arbitrate on TLAST

To use this in IP Integrator, you might have to concat your sidechannels into 
your TDATA. The axis_tdata_concat core is a nice way to do this
*/

`ifdef ICARUS_VERILOG
`include "bhand.v" //Make sure to use -I switch in iverilog command
`endif

`include "macros.vh"

module rr4 # (
    parameter DATA_WIDTH = 32,
    parameter PIPE_STAGE = 1,
    parameter RESET_TYPE = `NO_RESET,
    parameter TLAST_ARB = 1
) (
    input wire clk,
    input wire rst,
    
    //If not arbitrating on TLAST, the TLAST inputs are ignored
    `in_axis_l(s0, DATA_WIDTH),
    `in_axis_l(s1, DATA_WIDTH),
    `in_axis_l(s2, DATA_WIDTH),
    `in_axis_l(s3, DATA_WIDTH),
    
    `out_axis_l(o, DATA_WIDTH)
);

    //State variables used for deciding who gets the grant signal
    reg [3:0] sel_r = 'b0001;
    wire [3:0] sel;
    reg undecided = 1;
    
    ////////////////
    //HELPER WIRES//
    ////////////////
    
    wire [3:0] req = {s3_TVALID, s2_TVALID, s1_TVALID, s0_TVALID};
    //This technique found in Altera's "Advanced synthesis cookbook"
    wire [3:0] base = {sel_r[2:0], sel_r[3]};
    wire [7:0] req_dbl = {req, req};
    wire [7:0] gnt_dbl = req_dbl & ~(req_dbl - base);
    wire [3:0] gnt = gnt_dbl[7:4] | gnt_dbl[3:0];
    
    //Vivado requires this wire to be forward-declared in order to compile the
    //rest of it, even if it would be perfectly logical
    wire rst_sig;
`genif (RESET_TYPE == `ACTIVE_HIGH) begin
    assign rst_sig = rst;
`else_genif (RESET_TYPE == `ACTIVE_LOW) begin
    assign rst_sig = ~rst;
`endgen

    //////////////
    //MAIN LOGIC//
    //////////////
    
    //Use multiplexer
    `wire_axis_l(muxout, DATA_WIDTH);
    mux4_onehot # (DATA_WIDTH) the_mux (
        sel, 
        `ports_axis_l(s0), 
        `ports_axis_l(s1),
        `ports_axis_l(s2),
        `ports_axis_l(s3),
        `ports_axis_l(muxout)
    );
    
    //Update selection (taking care to only arbitrate on TLAST, if that's what
    //was required. There are four cases:
    // Arbitrate on TLAST and no reset
    // Arbitrate on TLAST and reset is active high or active low
    // No TLAST and no reset
    // No TLAST but reset is active high or active low
`genif(TLAST_ARB && RESET_TYPE == `NO_RESET) begin    
    assign sel = undecided ? gnt : sel_r;
    
    always @(posedge clk) begin
        sel_r <= `axis_flit(muxout) ? sel : sel_r;
        undecided <= `axis_flit(muxout) ? (muxout_TLAST ?  1 : 0) : undecided;
    end
`else_genif(TLAST_ARB) begin
    assign sel = undecided ? gnt : sel_r;
    
    always @(posedge clk) begin
        if (rst_sig) begin
            sel_r <= 'b0001;
            undecided <= 1;
        end else begin
            sel_r <= `axis_flit(muxout) ? sel : sel_r;
            undecided <= `axis_flit(muxout) ? (muxout_TLAST ?  1 : 0) : undecided;
        end
    end
`else_genif(RESET_TYPE == `NO_RESET) begin
    assign sel = gnt;
    always @(posedge clk) begin
        sel_r <= `axis_flit(muxout) ? sel : sel_r;
    end
`else_gen 
    assign sel = gnt;
    always @(posedge clk) begin
        if (rst_sig) begin
            sel_r <= 'b0001;
        end else begin
            sel_r <= `axis_flit(muxout) ? sel : sel_r;
        end
    end
`endgen

    //////////////////
    //ASSIGN OUTPUTS//
    //////////////////
    
    //If the pipeline registers are on, we need a bhand
`genif (PIPE_STAGE) begin
    bhand # (
        .DATA_WIDTH(DATA_WIDTH + 1), //Need room for TLAST
        .RESET_TYPE(RESET_TYPE)
    ) sit_shake_good_boy (
        .clk(clk),
        .rst(rst),
        
        .idata({muxout_TDATA, muxout_TLAST}),
        .idata_vld(muxout_TVALID),
        .idata_rdy(muxout_TREADY),
        
        .odata({o_TDATA, o_TLAST}),
        .odata_vld(o_TVALID),
        .odata_rdy(o_TREADY)
    );
`else_gen 
    assign o_TDATA = muxout_TDATA;
    assign o_TVALID = muxout_TVALID;
    assign muxout_TREADY = o_TREADY;
    assign o_TLAST = muxout_TLAST;
`endgen

endmodule


//Combinational
module mux4_onehot # (
    parameter DATA_WIDTH = 32
) (
    input wire [3:0] sel,
    
    `in_axis_l_reg(s0, DATA_WIDTH),
    `in_axis_l_reg(s1, DATA_WIDTH),
    `in_axis_l_reg(s2, DATA_WIDTH),
    `in_axis_l_reg(s3, DATA_WIDTH),
    
    `out_axis_l_reg(o, DATA_WIDTH)
);
    
    wire [1:0] muxsel = {sel[3] | sel[2], sel[3] | sel[1]};
    
    always @(*) begin
        case (muxsel)
        'b00: begin
            o_TDATA <= s0_TDATA;
            o_TVALID <= s0_TVALID;
            o_TLAST <= s0_TLAST;
            s0_TREADY <= o_TREADY;
            s1_TREADY <= 0;
            s2_TREADY <= 0;
            s3_TREADY <= 0;
            end
        'b01: begin
            o_TDATA <= s1_TDATA;
            o_TVALID <= s1_TVALID;
            o_TLAST <= s1_TLAST;
            s0_TREADY <= 0;
            s1_TREADY <= o_TREADY;
            s2_TREADY <= 0;
            s3_TREADY <= 0;
            end
        'b10: begin
            o_TDATA <= s2_TDATA;
            o_TVALID <= s2_TVALID;
            o_TLAST <= s2_TLAST;
            s0_TREADY <= 0;
            s1_TREADY <= 0;
            s2_TREADY <= o_TREADY;
            s3_TREADY <= 0;
            end
        'b11: begin
            o_TDATA <= s3_TDATA;
            o_TVALID <= s3_TVALID;
            o_TLAST <= s3_TLAST;
            s0_TREADY <= 0;
            s1_TREADY <= 0;
            s2_TREADY <= 0;
            s3_TREADY <= o_TREADY;
            end
        endcase
    end
    
endmodule
