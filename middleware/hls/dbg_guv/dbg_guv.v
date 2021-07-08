`timescale 1ns / 1ps

//TODO: Figure out how to disable the AXI Stream sidechannels using parameters
//Sadly, there is no clean way to do this.....

/*

This wraps around axis_governor.v, and is what will get put into your block 
diagram when you use the automatic TCL scripts provided along with these cores. 
Please forgive the messy organization; it's unclear how to organize things 
until they're all finished.

This controller works by maintaining two sets of registers. The first set of 
registers, called S1, include:

    - drop_cnt: The number of flits to drop from the input stream
    - log_cnt: The number of flits to log from the input stream
    - inj_TDATA: The TDATA field of the injection input
    - inj_TVALID: The TVALID field of the injection input.
    - inj_T*: The other AXI Stream fields for the injection input
    - keep_pausing: When 1, pauses input stream indefinitely
    - keep_logging: When 1, logs input stream indefinitely
    - keep_dropping: When 1, drops input stream indefinitely

Whenever a flit is dropped(logged), drop_cnt(log_cnt) is decremented. Once the 
count reaches zero, no more flits will be dropped(logged), unless 
keep_dropping(keep_logging) is asserted. If the drop_cnt(log_cnt) is nonzero, 
the keep_pausing signal is ignored. Otherwise, keep_pausing causes 
keep_dropping(keep_logging) to be ignored. Also, as soon as the injected flit 
is sent out, the inj_TVALID register is reset to zero.

The second set of registers, called S2, is identical to the first set. In the 
code, they have an "_r" at the end of their name. These registers do not 
control anything, and can only be set by the command interface. The trick is 
that we perform S1 = S2 when the user sends a special command. This allows the 
user to build up a (possibly complex) set of register updates that will then be 
applied simultaneously. 

The command interface is definitely clunky, but I've already found myself 
spending a lot of time writing this code and I want to move on. It only needs 
to be good enough. Anyway, it works in two steps: first you send an address, 
and then you send data on the immediately following flit. The address is 
formatted as {padding, dbg_core, reg}. The dbg_core address specifies which 
debug core to use, and reg specifies which of the S1 registers to update within 
that debug core. If reg is all ones, then S1 is copied into S2. These addresses 
are aligned to the right of cmd_in_TDATA by padding on the left. The data is 
formatted as {padding, data}. Everything is in big-endian.
    
There's an interesting parameter I added: STICKY_MODE. When S1 is copied into 
S2, I was resetting all the S1 registers back to zero. However, in some cases 
this was very inconvenient, and can cost more logic if you're not using a reset 
signal. So when STICKY_MODE is enabled, the S1 registers retain their values 
until the user explicitly chagnes them

*/

 `ifdef ICARUS_VERILOG
`include "axis_governor.v"
`include "axis_headerizer.v"
`endif

`include "macros.vh"

module dbg_guv # (
    parameter DATA_WIDTH = 64,
    parameter DEST_WIDTH = 16,
    parameter ID_WIDTH = 16,
    parameter CNT_SIZE = 16,
    parameter ADDR_WIDTH = 10, //This gives 1024 simultaneous debug cores
    parameter [ADDR_WIDTH -1:0] ADDR = 0, //Set this to be different for each 
    parameter RESET_TYPE = `NO_RESET,
    parameter STICKY_MODE = 1, //If 1, latching registers does not reset them
    parameter PIPE_STAGE = 1 //This causes a delay on cmd_out in case fanout is
                             //an issue
) (
    input wire clk,
    input wire rst,
    
    //Input command stream
    //This may be a bad decision, but I decided the command width should match
    //the inject data width.
    //How does this work if you have a bunch of streams of different sizes that
    //you want to debug? Also, what about the rr_tree in that case?
    //Also, this core cannot assert backpressure
    input wire [DATA_WIDTH -1:0] cmd_in_TDATA,
    input wire cmd_in_TVALID,
    
    //All the controllers are daisy-chained. If in incoming command is not for
    //this controller, send it to the next one
    output wire [DATA_WIDTH -1:0] cmd_out_TDATA,
    output wire cmd_out_TVALID,
    
    //Also,since this module is intended to wrap around axis_governor, we need
    //to provide access to its ports through this one.
    
    //Input AXI Stream.
    input wire [DATA_WIDTH-1:0] in_TDATA,
    input wire in_TVALID,
    output wire in_TREADY,
    input wire [DATA_WIDTH/8 -1:0] in_TKEEP,
    input wire [DEST_WIDTH -1:0] in_TDEST,
    input wire [ID_WIDTH -1:0] in_TID,
    input wire in_TLAST,
    
    //Output AXI Stream.
    output wire [DATA_WIDTH-1:0] out_TDATA,
    output wire out_TVALID,
    input wire out_TREADY,
    output wire [DATA_WIDTH/8 -1:0] out_TKEEP,
    output wire [DEST_WIDTH -1:0] out_TDEST,
    output wire [ID_WIDTH -1:0] out_TID,
    output wire out_TLAST,
    
    //Log AXI Stream. 
    //This core takes care of adding the TDEST, TID, TLAST, and governor ID as
    //a header on logged flits. The TKEEP sidechannel is concatted for 
    //compatibility with the rr4 module
    `out_axis_l(log_catted, DATA_WIDTH + DATA_WIDTH/8)
);
    ////////////////////
    //LOCAL PARAMETERS//
    ////////////////////
    
    `localparam REG_ADDR_WIDTH = 4;
    //These just clean up the code slightly
    `localparam NO_RST = (RESET_TYPE == `NO_RESET);
    `localparam HAS_RST = (RESET_TYPE != `NO_RESET);
    
    
`ifdef ICARUS_VERILOG
    initial begin 
        $display("dbg_guv:");
        $display("--------");
        $display("DATA_WIDTH = %d", DATA_WIDTH );
        $display("DEST_WIDTH = %d", DEST_WIDTH );
        $display("ID_WIDTH = %d",   ID_WIDTH   );
        $display("CNT_SIZE = %d",   CNT_SIZE   );
        $display("ADDR_WIDTH = %d", ADDR_WIDTH );
        $display("ADDR = %d",       ADDR       );
        $display("RESET_TYPE = %d", RESET_TYPE );
        $display("STICKY_MODE = %d",STICKY_MODE); 
        $display("PIPE_STAGE = %d", PIPE_STAGE );
    end
`endif
    
    ////////////////////////
    //FORWARD DECLARATIONS//
    ////////////////////////
    
    //Wires needed for axis_governor connections
    wire inj_TREADY;
    `wire_axis_kl(log, DATA_WIDTH);
    wire [DEST_WIDTH -1:0] log_TDEST;
    wire [ID_WIDTH -1:0] log_TID;
    
    ////////////////
    //HELPER WIRES//
    ////////////////
    
    //Named subfields of command
    wire [ADDR_WIDTH -1:0] cmd_core_addr = cmd_in_TDATA[ADDR_WIDTH + REG_ADDR_WIDTH -1 -: ADDR_WIDTH];
    wire [REG_ADDR_WIDTH -1:0] cmd_reg_addr = cmd_in_TDATA[REG_ADDR_WIDTH -1:0];  
    //We need to know if this message was meant for us
    wire msg_for_us = (cmd_core_addr == ADDR);
    
    wire rst_sig;
`genif (RESET_TYPE == `ACTIVE_HIGH) begin
    assign rst_sig = rst;
`else_gen
    assign rst_sig = ~rst;
`endgen

    ///////////////////////////
    //COMMAND INTERPRETER FSM//
    ///////////////////////////
    
    //These registers are immediately updated
    reg [CNT_SIZE -1:0] drop_cnt_r = 0;        //Reg addr = 0
    reg [CNT_SIZE -1:0] log_cnt_r = 0;         //Reg addr = 1
    reg [DATA_WIDTH -1:0] inj_TDATA_r = 0;     //Reg addr = 2
    reg inj_TVALID_r = 0;                      //Reg addr = 3
    reg inj_TLAST_r = 0;                       //Reg addr = 4
    reg [DATA_WIDTH/8 -1:0] inj_TKEEP_r = 0;   //Reg addr = 5
    reg [DEST_WIDTH -1:0] inj_TDEST_r = 0;     //Reg addr = 6
    reg [ID_WIDTH -1:0] inj_TID_r = 0;         //Reg addr = 7
    reg keep_pausing_r = 0;                    //Reg addr = 8
    reg keep_logging_r = 0;                    //Reg addr = 9
    reg keep_dropping_r = 0;                   //Reg addr = 10
    
    `localparam CMD_FSM_ADDR = 0;
    `localparam CMD_FSM_DATA = 1;
    `localparam CMD_FSM_IGNORE = 2;
    
    reg [1:0] cmd_fsm_state = CMD_FSM_ADDR;
    reg [REG_ADDR_WIDTH -1:0] saved_reg_addr = 0;
    
    //The user puts in a reg address of all ones to commit register values
    wire reg_addr_all_ones = (cmd_reg_addr == {REG_ADDR_WIDTH{1'b1}});
    wire latch_sig = (cmd_fsm_state == CMD_FSM_ADDR) && msg_for_us && cmd_in_TVALID && reg_addr_all_ones;
    
    //In the interests of keeping things simple, the commands will happen over
    //two flits: "address" and "data"
    
    //TODO: If Vivado is truly inefficient, I'll rewrite this code in a more
    //optimized way
`genif (NO_RST && STICKY_MODE == 0) begin
    always @(posedge clk) begin
        if (latch_sig) begin //This code is unlikely to synthesize to something efficient
            drop_cnt_r <= 0;
            log_cnt_r <= 0;
            inj_TVALID_r <= 0;
            keep_pausing_r <= 0;
            keep_logging_r <= 0;
            keep_dropping_r <= 0;
        end else if (cmd_in_TVALID) begin
            case (cmd_fsm_state)
                CMD_FSM_ADDR: begin
                    cmd_fsm_state <= msg_for_us ? CMD_FSM_DATA : (reg_addr_all_ones ? CMD_FSM_ADDR : CMD_FSM_IGNORE);
                    saved_reg_addr <= cmd_reg_addr;
                end CMD_FSM_DATA: begin
                    cmd_fsm_state <= CMD_FSM_ADDR;
                    case (saved_reg_addr)
                        0:  drop_cnt_r <= cmd_in_TDATA[CNT_SIZE -1:0];
                        1:  log_cnt_r <= cmd_in_TDATA[CNT_SIZE -1:0];
                        2:  inj_TDATA_r <= cmd_in_TDATA;
                        3:  inj_TVALID_r <= cmd_in_TDATA[0];
                        4:  inj_TLAST_r <= cmd_in_TDATA[0];
                        5:  inj_TKEEP_r <= cmd_in_TDATA[DATA_WIDTH/8 -1:0];
                        6:  inj_TDEST_r <= cmd_in_TDATA[DEST_WIDTH -1:0];
                        7:  inj_TID_r <= cmd_in_TDATA[ID_WIDTH -1:0];
                        8:  keep_pausing_r <= cmd_in_TDATA[0];
                        9:  keep_logging_r <= cmd_in_TDATA[0];
                        10: keep_dropping_r <= cmd_in_TDATA[0];
                    endcase
                end CMD_FSM_IGNORE: begin
                    cmd_fsm_state <= CMD_FSM_ADDR;
                end
            endcase
        end
    end
`else_genif (NO_RST) begin //NO_RST && STICKY_MODE == 1
    always @(posedge clk) begin
        if (cmd_in_TVALID) begin
            case (cmd_fsm_state)
                CMD_FSM_ADDR: begin
                    cmd_fsm_state <= reg_addr_all_ones ? 
                        CMD_FSM_ADDR                                :
                        (msg_for_us ? CMD_FSM_DATA : CMD_FSM_IGNORE);
                        
                    saved_reg_addr <= cmd_reg_addr;
                end CMD_FSM_DATA: begin
                    cmd_fsm_state <= CMD_FSM_ADDR;
                    case (saved_reg_addr)
                        0:  drop_cnt_r <= cmd_in_TDATA[CNT_SIZE -1:0];
                        1:  log_cnt_r <= cmd_in_TDATA[CNT_SIZE -1:0];
                        2:  inj_TDATA_r <= cmd_in_TDATA;
                        3:  inj_TVALID_r <= cmd_in_TDATA[0];
                        4:  inj_TLAST_r <= cmd_in_TDATA[0];
                        5:  inj_TKEEP_r <= cmd_in_TDATA[DATA_WIDTH/8 -1:0];
                        6:  inj_TDEST_r <= cmd_in_TDATA[DEST_WIDTH -1:0];
                        7:  inj_TID_r <= cmd_in_TDATA[ID_WIDTH -1:0];
                        8:  keep_pausing_r <= cmd_in_TDATA[0];
                        9:  keep_logging_r <= cmd_in_TDATA[0];
                        10: keep_dropping_r <= cmd_in_TDATA[0];
                    endcase
                end CMD_FSM_IGNORE: begin
                    cmd_fsm_state <= CMD_FSM_ADDR;
                end
            endcase
        end
    end
`else_genif (STICKY_MODE == 0) begin //HAS_RST && STICKY_MODE == 0
    always @(posedge clk) begin
        if (latch_sig || rst_sig) begin
            drop_cnt_r <= 0;
            log_cnt_r <= 0;
            inj_TVALID_r <= 0;
            keep_pausing_r <= 0;
            keep_logging_r <= 0;
            keep_dropping_r <= 0;
        end else if (cmd_in_TVALID) begin
            case (cmd_fsm_state)
            CMD_FSM_ADDR: begin
                cmd_fsm_state <= msg_for_us ? CMD_FSM_DATA : (reg_addr_all_ones ? CMD_FSM_ADDR : CMD_FSM_IGNORE);
                saved_reg_addr <= cmd_reg_addr;
            end CMD_FSM_DATA: begin
                cmd_fsm_state <= CMD_FSM_ADDR;
                case (saved_reg_addr)
                    0:  drop_cnt_r <= cmd_in_TDATA[CNT_SIZE -1:0];
                    1:  log_cnt_r <= cmd_in_TDATA[CNT_SIZE -1:0];
                    2:  inj_TDATA_r <= cmd_in_TDATA;
                    3:  inj_TVALID_r <= cmd_in_TDATA[0];
                    4:  inj_TLAST_r <= cmd_in_TDATA[0];
                    5:  inj_TKEEP_r <= cmd_in_TDATA[DATA_WIDTH/8 -1:0];
                    6:  inj_TDEST_r <= cmd_in_TDATA[DEST_WIDTH -1:0];
                    7:  inj_TID_r <= cmd_in_TDATA[ID_WIDTH -1:0];
                    8:  keep_pausing_r <= cmd_in_TDATA[0];
                    9:  keep_logging_r <= cmd_in_TDATA[0];
                    10: keep_dropping_r <= cmd_in_TDATA[0];
                endcase
            end CMD_FSM_IGNORE: begin
                cmd_fsm_state <= CMD_FSM_ADDR;
            end
            endcase
        end
    end
`else_gen //HAS_RST && STICKY_MODE == 1
    always @(posedge clk) begin
        if (rst_sig) begin
            drop_cnt_r <= 0;
            log_cnt_r <= 0;
            inj_TVALID_r <= 0;
            keep_pausing_r <= 0;
            keep_logging_r <= 0;
            keep_dropping_r <= 0;
        end else if (cmd_in_TVALID) begin
            case (cmd_fsm_state)
                CMD_FSM_ADDR: begin
                    cmd_fsm_state <= reg_addr_all_ones ? 
                        CMD_FSM_ADDR                                :
                        (msg_for_us ? CMD_FSM_DATA : CMD_FSM_IGNORE);
                        
                    saved_reg_addr <= cmd_reg_addr;
                end CMD_FSM_DATA: begin
                    cmd_fsm_state <= CMD_FSM_ADDR;
                    case (saved_reg_addr)
                        0:  drop_cnt_r <= cmd_in_TDATA[CNT_SIZE -1:0];
                        1:  log_cnt_r <= cmd_in_TDATA[CNT_SIZE -1:0];
                        2:  inj_TDATA_r <= cmd_in_TDATA;
                        3:  inj_TVALID_r <= cmd_in_TDATA[0];
                        4:  inj_TLAST_r <= cmd_in_TDATA[0];
                        5:  inj_TKEEP_r <= cmd_in_TDATA[DATA_WIDTH/8 -1:0];
                        6:  inj_TDEST_r <= cmd_in_TDATA[DEST_WIDTH -1:0];
                        7:  inj_TID_r <= cmd_in_TDATA[ID_WIDTH -1:0];
                        8:  keep_pausing_r <= cmd_in_TDATA[0];
                        9:  keep_logging_r <= cmd_in_TDATA[0];
                        10: keep_dropping_r <= cmd_in_TDATA[0];
                    endcase
                end CMD_FSM_IGNORE: begin
                    cmd_fsm_state <= CMD_FSM_ADDR;
                end
            endcase
        end
    end
`endgen
    
    ////////////////////////
    //GOVERNOR CONTROL FSM//
    ////////////////////////
        
    reg [CNT_SIZE -1:0] drop_cnt = 0;
    reg [CNT_SIZE -1:0] log_cnt = 0;
    reg [DATA_WIDTH -1:0] inj_TDATA = 0;
    reg inj_TVALID = 0;
    reg inj_TLAST = 0;
    reg [DATA_WIDTH/8 -1:0] inj_TKEEP = 0;
    reg [DEST_WIDTH -1:0] inj_TDEST = 0;
    reg [ID_WIDTH -1:0] inj_TID = 0;
    reg keep_pausing = 0;
    reg keep_logging = 0;
    reg keep_dropping = 0;
    
    //Governor control wires. These feed directly into axis_governor
    wire pause;
    wire drop;
    wire log_en;
    
`genif (NO_RST) begin
    always @(posedge clk) begin
        if (latch_sig) begin
            drop_cnt <= drop_cnt_r;
            log_cnt <= log_cnt_r;
            inj_TDATA <= inj_TDATA_r;
            inj_TVALID <= inj_TVALID_r;
            inj_TLAST <= inj_TLAST_r;
            inj_TKEEP <= inj_TKEEP_r;
            inj_TDEST <= inj_TDEST_r;
            inj_TID <= inj_TID_r;
            keep_pausing <= keep_pausing_r;
            keep_logging <= keep_logging_r;
            keep_dropping <= keep_dropping_r;
        end else begin
            //Decrement drop_cnt when flit is sent (if drop_cnt is not already zero)
            drop_cnt <= (|drop_cnt) ? (drop_cnt - `axis_flit(in)) : drop_cnt;
            //Decrement drop_cnt when flit is logged (if log_cnt is not already zero)
            log_cnt <= (|log_cnt) ? (log_cnt - `axis_flit(log)) : log_cnt;
            //Set inj_TVALID to 0 once an injection occurs
            inj_TVALID <= `axis_flit(inj) ? 0 : inj_TVALID;
        end
    end
`else_gen 
    always @(posedge clk) begin
        if (rst_sig) begin
            drop_cnt <= 0;
            log_cnt <= 0;
            inj_TDATA <= 0;
            inj_TVALID <= 0;
            inj_TLAST <= 0;
            inj_TKEEP <= 0;
            inj_TDEST <= 0;
            inj_TID <= 0;
            keep_pausing <= 0;
            keep_logging <= 0;
            keep_dropping <= 0;
        end else if (latch_sig) begin
            drop_cnt <= drop_cnt_r;
            log_cnt <= log_cnt_r;
            inj_TDATA <= inj_TDATA_r;
            inj_TVALID <= inj_TVALID_r;
            inj_TLAST <= inj_TLAST_r;
            inj_TKEEP <= inj_TKEEP_r;
            inj_TDEST <= inj_TDEST_r;
            inj_TID <= inj_TID_r;
            keep_pausing <= keep_pausing_r;
            keep_logging <= keep_logging_r;
            keep_dropping <= keep_dropping_r;
        end else begin
            //Decrement drop_cnt when flit is sent (if drop_cnt is not already zero)
            drop_cnt <= (|drop_cnt) ? (drop_cnt - `axis_flit(in)) : drop_cnt;
            //Decrement drop_cnt when flit is logged (if log_cnt is not already zero)
            log_cnt <= (|log_cnt) ? (log_cnt - `axis_flit(log)) : log_cnt;
            //Set inj_TVALID to 0 once an injection occurs
            inj_TVALID <= `axis_flit(inj) ? 0 : inj_TVALID;
        end
    end
`endgen
    
    //We don't pause if our dropping/logging counters are still going
    assign pause = keep_pausing && ~(|drop_cnt || |log_cnt);
    assign log_en = keep_logging || (|log_cnt);
    assign drop = keep_dropping || (|drop_cnt);
    

    /////////////////////////////
    //INSTANTIATE AXIS GOVERNOR//
    /////////////////////////////
    
    axis_governor #(
		.DATA_WIDTH(DATA_WIDTH),
		.DEST_WIDTH(DEST_WIDTH),
		.ID_WIDTH(ID_WIDTH)
    ) ello_guvna (    
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
		.log_en(log_en)
    );    
    
    //////////////////////////////////////
    //CONNECT REMAINING WIRES TO OUTPUTS//
    //////////////////////////////////////

`genif (PIPE_STAGE) begin
    //Delay by one cycle for timing
    reg [DATA_WIDTH -1:0] cmd_out_TDATA_r = 0;
    reg cmd_out_TVALID_r = 0;
    
    always @(posedge clk) begin
        cmd_out_TDATA_r <= cmd_in_TDATA;
        cmd_out_TVALID_r <= cmd_in_TVALID;
    end
    
    assign cmd_out_TDATA = cmd_out_TDATA_r;
    assign cmd_out_TVALID = cmd_out_TVALID_r;
`else_gen 
    assign cmd_out_TDATA = cmd_in_TDATA;
    assign cmd_out_TVALID = cmd_in_TVALID;
`endgen
    
    //Run the log outputs through the "headerizer" module. This module takes a
    //single flit and sends out a two-flit packet:
    //
    // Input flit: log_TDATA, log_TKEEP, log_TLAST, log_TDEST, log_TID, log_TUSER
    //
    // Output flit 1: TDATA = {log_TLAST, log_TDEST, log_TID, log_TUSER}, TKEEP = (all ones), TLAST = 0
    // Output flit 2: TDATA = log_TDATA, TKEEP = log_TKEEP, TLAST = log_TLAST
    
    `wire_axis_kl(log_with_hdr, DATA_WIDTH);
    
    axis_headerizer # (
		.DATA_WIDTH(DATA_WIDTH),
		.DEST_WIDTH(DEST_WIDTH),
		.ID_WIDTH(ID_WIDTH),
		.USER_WIDTH(ADDR_WIDTH),
		.RESET_TYPE(RESET_TYPE),
        .ENABLE_TLAST_HACK(1)
    ) headerizer (
		.clk(clk),
		.rst(rst),
        
        `inst_axis_kl(sides, log),
		.sides_TDEST(log_TDEST),
		.sides_TID(log_TID),
		.sides_TUSER(ADDR),
        
        `inst_axis_kl(hdr, log_with_hdr)
    );
    
    assign log_catted_TDATA = {log_with_hdr_TDATA, log_with_hdr_TKEEP};
    assign log_catted_TVALID = log_with_hdr_TVALID;
    assign log_with_hdr_TREADY = log_catted_TREADY;
    assign log_catted_TLAST = log_with_hdr_TLAST;
    
    //It might be better to just concat the log side channels into TDATA rather 
    //than in a header flit. That way, at the cost of more routing resources, 
    //it might be possible to have 100% transparent snooping. I wasn't sure 
    //what to do so I just picked the header method and went with it
    
endmodule
