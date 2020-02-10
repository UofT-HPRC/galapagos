`timescale 1ns / 1ps

/*
This module is an AXI Stream passthrough, but with options to modify the
underlying stream. Supported operations:

    - Injecting flits
    - Forcing ready to low (i.e. pausing)
    - Copying flits to another interface (i.e. logging)
    - Dropping flits (while potentially logging them)

This module is designed to be used inside of an FSM which can, among other 
things, accept commands to allow single-stepping, running to a "breakpoint" or 
"watchpoint", repackage logged streams to move the side channels into TDATA, 
etc. For now I just wanted to simulate this.

This module requires 2 LUTs for the glue logic, and whatever LUTs/MUXes are 
needed for the multiplexers at the output

*/

//TODO: Find out how to selectively disable certain side channels
//Default widths correspond to Galapagos defaults
module axis_governor #(
    parameter DATA_WIDTH = 64,
    parameter DEST_WIDTH = 16,
    parameter ID_WIDTH = 16
) (    
    input wire clk,
    
    //Input AXI Stream.
    input wire [DATA_WIDTH-1:0] in_TDATA,
    input wire in_TVALID,
    output wire in_TREADY,
    input wire [DATA_WIDTH/8 -1:0] in_TKEEP,
    input wire [DEST_WIDTH -1:0] in_TDEST,
    input wire [ID_WIDTH -1:0] in_TID,
    input wire in_TLAST,
    
    //Inject AXI Stream. 
    input wire [DATA_WIDTH-1:0] inj_TDATA,
    input wire inj_TVALID,
    output wire inj_TREADY,
    input wire [DATA_WIDTH/8 -1:0] inj_TKEEP,
    input wire [DEST_WIDTH -1:0] inj_TDEST,
    input wire [ID_WIDTH -1:0] inj_TID,
    input wire inj_TLAST,
    
    //Output AXI Stream.
    output wire [DATA_WIDTH-1:0] out_TDATA,
    output wire out_TVALID,
    input wire out_TREADY,
    output wire [DATA_WIDTH/8 -1:0] out_TKEEP,
    output wire [DEST_WIDTH -1:0] out_TDEST,
    output wire [ID_WIDTH -1:0] out_TID,
    output wire out_TLAST,
    
    //Log AXI Stream. 
    output wire [DATA_WIDTH-1:0] log_TDATA,
    output wire log_TVALID,
    input wire log_TREADY,
    output wire [DATA_WIDTH/8 -1:0] log_TKEEP,
    output wire [DEST_WIDTH -1:0] log_TDEST,
    output wire [ID_WIDTH -1:0] log_TID,
    output wire log_TLAST,
    
    //Control signals
    input wire pause,
    input wire drop,
    input wire log_en
    //input wire inject //Not needed; this is determined from inj_TVALID
);    
    //Perform the tricky management of valids and readies.
    //This module is defined lower down in this file
    axis_governor_glue_log glue(
        .in_vld(in_TVALID),
        .out_rdy(out_TREADY),
        .log_en(log_en),
        .log_rdy(log_TREADY),
        .inj_vld(inj_TVALID),
        .pause(pause),
        .drop(drop),
        
        .in_rdy(in_TREADY),
        .out_vld(out_TVALID),
        .log_vld(log_TVALID),
        .inj_rdy(inj_TREADY)
    );
    
    //Connect remaining AXI Stream signals
    assign out_TDATA = inj_TVALID ? inj_TDATA : in_TDATA;
    assign out_TKEEP = inj_TVALID ? inj_TKEEP : in_TKEEP;
    assign out_TDEST = inj_TVALID ? inj_TDEST : in_TDEST;
    assign out_TID = inj_TVALID ? inj_TID : in_TID;
    assign out_TLAST = inj_TVALID ? inj_TLAST : in_TLAST;
    
    assign log_TDATA = in_TDATA;
    assign log_TKEEP = in_TKEEP;
    assign log_TDEST = in_TDEST;
    assign log_TID = in_TID;
    assign log_TLAST = in_TLAST;
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
    //assign log_vld = log_en && in_vld && s_rdy;
    //
    //Also note that log_vld depends on log_rdy. Technically, this violates the
    //AXI Stream specification. In order for this to work, you need to connect
    //the log AXI Stream channel to a core which does not have a combinational
    //path from ready to valid (a register slice, for example)
    assign log_vld = log_en && ~pause && in_vld && (drop || (~inj_vld && out_rdy));
    
    //At least this is simple...
    assign inj_rdy = out_rdy;

endmodule
