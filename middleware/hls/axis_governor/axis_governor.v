`timescale 1ns / 1ps

//Preprocessor statemetns for compatibility with Icarus and Vivado
`ifdef FROM_AXIS_GOVERNOR
`define localparam parameter
`else /*For Vivado*/
`define localparam localparam
`endif


`define NO_RESET    0
`define ACTIVE_HIGH 1
`define ACTIVE_LOW  2

`define genif generate if
`define else_genif end else if
`define endgen end endgenerate

/*
This module is an AXI Stream passthrough, but with options to modify the
underlying stream. Supported operations:

    - Injecting flits
    - Forcing ready to low
    - Copying flits to another interface
    - Up to four(?) NAT rules on TDEST/TID
    - Flit/Packet counts
*/



module axis_governor #(
    parameter DATA_WIDTH = 64,
    parameter [7:0] CMD_ADDR = 0,
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
    
    //Command AXI Stream. This is just so Vivado makes it an interface and keeps
    //the block diagram simple
    input wire [DATA_WIDTH-1:0] cmd_TDATA,
    input wire cmd_TVALID,
    output wire cmd_TREADY,
    
    //Output AXI Stream. This is just so Vivado makes it an interface and keeps
    //the block diagram simple
    output wire [DATA_WIDTH-1:0] out_TDATA,
    output wire out_TVALID,
    input wire out_TREADY,
    output wire [DATA_WIDTH/8 -1:0] out_TKEEP,
    output wire out_TDEST,
    output wire out_TID,
    output wire out_TLAST,
    
    //Log AXI Stream. This is just so Vivado makes it an interface and keeps
    //the block diagram simple
    output wire [DATA_WIDTH-1:0] log_TDATA,
    output wire log_TVALID,
    input wire log_TREADY,
    output wire [DATA_WIDTH/8 -1:0] log_TKEEP,
    output wire log_TDEST,
    output wire log_TID,
    output wire log_TLAST
);
    
    //State variables
    reg pause = 1;
    reg log = 0;
    reg drop = 0;
    wire inj_vld; //Derived from inj_cnt and cmd_rdy
    reg [15:0] pause_cnt = 0;
    reg [15:0] drop_cnt;
    reg [15:0] log_cnt = 0;
    reg [15:0] inj_cnt = 0;
    
    
    //Named subfields of command
    assign cmd_dest = cmd_TDATA[63:56];
    assign cmd_cnt = cmd_TDATA[31:16];
    assign cmd_pause = cmd_TDATA[3]; 
    assign cmd_drop = cmd_TDATA[2]; 
    assign cmd_log = cmd_TDATA[1]; 
    assign cmd_inject = cmd_TDATA[0]; 

    //Handle command stream interface
    //Luckily for us, the only time we backpressure the commands is if we're
    //not ready for an injection.
    //
    //Otherwise, if this command is not meant for us, we force TREADY low
    //TODO: Is this how I want to do this? 
    assign cmd_TREADY = (cmd_dest == CMD_ADDR) && (~(|inj_cnt) || slv_TREADY);
    
    //Perform the tricky management of valids and readies.
    //This module is defined lower down in this file
    axis_governor_glue_log glue(
        .in_vld(in_TVALID),
        .out_rdy(out_TREADY),
        .log_en(log),
        .log_rdy(log_TREADY),
        .inj_vld(???),
        .pause(pause),
        .drop(drop),
        
        .in_rdy(in_TREADY),
        .out_vld(out_TVALID),
        .log_vld(log_TVALID),
        .inj_rdy(???)
    );
    
    //Connect remaining AXI Stream signals
    
endmodule


//This glue logic was NOT easy to come up with. In the end I did a 128-entry
//truth table. There was no other way to be sure I covered every corner case.
//At some point I may attach the truth table with this code.
module axis_governor_glue_log (
    input wire in_vld, 
    input wire out_rdy, 
    input wire log_en,
    input wire log_rdy,
    input wire inj_vld,
    input wire pause,
    input wire drop,
    
    output wire in_rdy,
    output wire out_vld,
    output wire log_vld,
    output wire inj_rdy
);
    
    //(~inj_vld && out_rdy) means the slave is ready to receive a flit from the
    //master. OR'ing this with drop means the slave (and injector) cannot 
    //backpressure the master if drop is high.
    //
    //(log_rdy || ~log_en) means that the logger is not backpressuring the
    //master
    //
    //Finally, in_rd is forced low if we are paused
    assign in_rdy = ~pause && (log_rdy || ~log_en) && (drop || (~inj_vld && out_rdy));
    
    //If the injector has valid data, it takes precedence
    //The other condition means that the master is trying to send something to
    //the slave, and that the logger is not backpressuring the master
    assign out_vld = inj_vld || (in_vld && ~drop && ~pause && (~log_en || log_rdy));
    
    //Note: this next line is written this way to let Vivado synthesize the logic
    //in simple LUTs. However, it is better understood as
    //
    //assign log_vld = log_en && in_vld && m_rdy;
    //
    //Also note that log_vld depends on log_rdy. Technically, this violates the
    //AXI Stream specification. In order for this to work, you need to connect
    //the log AXI Stream channel to a core which does not have a combinational
    //path from ready to valid (a register slice, for example)
    assign log_vld = log_en && ~pause && in_vld && log_rdy && (drop || (~inj_vld && out_rdy));
    
    //At least this is simple...
    assign inj_rdy = out_rdy;

endmodule
    

`undef genif
`undef else_genif
`undef endgen

`undef NO_RESET
`undef ACTIVE_HIGH
`undef ACTIVE_LOW
