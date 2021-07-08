`timescale 1ns / 1ps

/*

The counterpart to axis_concat.v


Each side channel has an "in enable" and an "out enable". This means:

in | out | Meaning
------------------------------------
 d |  0  | The side channel is not present at the output
 0 |  1  | The side channel is split out of output TDATA
 1 |  1  | The side channel is present at input, and not split out of output TDATA

*/

`include "macros.vh"

/*

Unfortunately, due to problems with Vivado, I have to move all the 
automatically derived parameters into macros instead of using localparam

Specifically, this happens because you can't use localparam to set a module's 
port width, even if you use the K&R-style Verilog syntax:

    module my_thing # (
        parameter W = 2
    ) (a, b);
    localparam WW = W+W;
    input wire [W -1:0] a;
    output wire [WW -1:0] b;
    
    endmodule

Vivado chokes on it.

So there is no choice but to use ugly `define statements... and to make things
worse, you can't do 
    x ? 1 : 0
Vivado only understands
    (x != 0) ? 1 : 0
*/

//Derived parameters. Do not set manually!
//
//The "SPLIT_*_WIDTH" parameters mean how many additional bits are present in
//the output TDATA
//
//The "SAFE_*_WIDTH" parameters are an ugly hack. See, if I just did 
//something like
//  input wire [DEST_WIDTH - 1 :0]
//but DEST_WIDTH was 0, then we would get a Verilog error. Although I plan
//to have the packaged IP hide the ability to edit the width if you disable
//the port, I don't want obscure errors if the user typed in 0 before 
//disabling. 
//
//The "PASSTHRU_*" indicate that a side channel shouldnot be concatted with 
//TDATA; instead, it is given its own output
//
`define SPLIT_LAST (((IN_ENABLE_LAST == 0) && (OUT_ENABLE_LAST != 0)) ? 1 : 0)
`define SPLIT_KEEP (((IN_ENABLE_KEEP == 0) && (OUT_ENABLE_KEEP != 0)) ? 1 : 0)
`define SPLIT_DEST (((IN_ENABLE_DEST == 0) && (OUT_ENABLE_DEST != 0)) ? 1 : 0)
`define SPLIT_ID (((IN_ENABLE_ID == 0) && (OUT_ENABLE_ID != 0)) ? 1 : 0)
`define SPLIT_USER (((IN_ENABLE_USER == 0) && (OUT_ENABLE_USER != 0)) ? 1 : 0)

`define SPLIT_LAST_WIDTH (`SPLIT_LAST) //For consistency

`define KEEP_WIDTH ((DATA_WIDTH+7)/8)
`define SPLIT_KEEP_WIDTH (`SPLIT_KEEP * `KEEP_WIDTH)
`define IN_SAFE_KEEP_WIDTH ((IN_ENABLE_KEEP != 0) ? `KEEP_WIDTH : 1)
`define OUT_SAFE_KEEP_WIDTH ((OUT_ENABLE_KEEP != 0) ? `KEEP_WIDTH : 1)

`define SPLIT_DEST_WIDTH (`SPLIT_DEST * DEST_WIDTH)
`define IN_SAFE_DEST_WIDTH ((IN_ENABLE_DEST != 0) ? DEST_WIDTH : 1)
`define OUT_SAFE_DEST_WIDTH ((OUT_ENABLE_DEST != 0) ? DEST_WIDTH : 1)

`define SPLIT_ID_WIDTH (`SPLIT_ID * ID_WIDTH)
`define IN_SAFE_ID_WIDTH ((IN_ENABLE_ID != 0) ? ID_WIDTH : 1)
`define OUT_SAFE_ID_WIDTH ((OUT_ENABLE_ID != 0) ? ID_WIDTH : 1)

`define SPLIT_USER_WIDTH (`SPLIT_USER * USER_WIDTH)
`define IN_SAFE_USER_WIDTH ((IN_ENABLE_USER != 0) ? USER_WIDTH : 1)
`define OUT_SAFE_USER_WIDTH ((OUT_ENABLE_USER != 0) ? USER_WIDTH : 1)


`define PASSTHRU_LAST (((IN_ENABLE_LAST != 0) && (OUT_ENABLE_LAST != 0)) ? 1 : 0)
`define PASSTHRU_KEEP (((IN_ENABLE_KEEP != 0) && (OUT_ENABLE_KEEP != 0)) ? 1 : 0)
`define PASSTHRU_DEST (((IN_ENABLE_DEST != 0) && (OUT_ENABLE_DEST != 0)) ? 1 : 0)
`define PASSTHRU_ID (((IN_ENABLE_ID != 0) && (OUT_ENABLE_ID != 0)) ? 1 : 0)
`define PASSTHRU_USER (((IN_ENABLE_USER != 0) && (OUT_ENABLE_USER != 0)) ? 1 : 0)

`define WIDTH_U (`SPLIT_USER_WIDTH)
`define WIDTH_IU (`SPLIT_ID_WIDTH + `WIDTH_U)
`define WIDTH_DIU (`SPLIT_DEST_WIDTH + `WIDTH_IU)
`define WIDTH_KDIU (`SPLIT_KEEP_WIDTH + `WIDTH_DIU)
`define WIDTH_LKDIU (`SPLIT_LAST_WIDTH + `WIDTH_KDIU)
`define WIDTH_DLKDIU (DATA_WIDTH + `WIDTH_LKDIU)

module axis_unconcat # (
    parameter DATA_WIDTH = 32,
    
    parameter IN_ENABLE_KEEP = 0,
    parameter OUT_ENABLE_KEEP = 0,
    
    parameter IN_ENABLE_LAST = 1,
    parameter OUT_ENABLE_LAST = 1,
    
    parameter IN_ENABLE_DEST = 0,
    parameter OUT_ENABLE_DEST = 0,
    parameter DEST_WIDTH = 16,
    
    parameter IN_ENABLE_ID = 0,
    parameter OUT_ENABLE_ID = 0,
    parameter ID_WIDTH = 16,
    
    parameter IN_ENABLE_USER = 0,
    parameter OUT_ENABLE_USER = 0,
    parameter USER_WIDTH = 16
) (
    input wire clk, //Dummy clock to get rid of Vivado's annoying warning
    
    input wire [DATA_WIDTH
                + `SPLIT_LAST_WIDTH
                + `SPLIT_KEEP_WIDTH
                + `SPLIT_DEST_WIDTH
                + `SPLIT_ID_WIDTH
                + `SPLIT_USER_WIDTH
                -1:0] left_TDATA,
    input wire left_TVALID,
    output wire left_TREADY,
    input wire left_TLAST,
    input wire [`IN_SAFE_KEEP_WIDTH -1:0] left_TKEEP,
    input wire [`IN_SAFE_DEST_WIDTH -1:0] left_TDEST,
    input wire [`IN_SAFE_ID_WIDTH -1:0] left_TID,
    input wire [`IN_SAFE_USER_WIDTH -1:0] left_TUSER,
    
    output wire [DATA_WIDTH-1:0] right_TDATA,
    output wire right_TVALID,
    input wire right_TREADY,
    output wire right_TLAST,
    output wire [`OUT_SAFE_KEEP_WIDTH -1:0] right_TKEEP,
    output wire [`OUT_SAFE_DEST_WIDTH -1:0] right_TDEST,
    output wire [`OUT_SAFE_ID_WIDTH -1:0] right_TID,
    output wire [`OUT_SAFE_USER_WIDTH -1:0] right_TUSER
);

assign right_TDATA = left_TDATA[`WIDTH_DLKDIU -1 -: DATA_WIDTH];

`genif (`SPLIT_LAST) begin
    assign right_TLAST = left_TDATA[`WIDTH_LKDIU -1 -: 1];
`endgen

`genif (`SPLIT_KEEP) begin
    assign right_TKEEP = left_TDATA[`WIDTH_KDIU -1 -: `KEEP_WIDTH];
`endgen

`genif (`SPLIT_DEST) begin
    assign right_TDEST = left_TDATA[`WIDTH_DIU -1 -: DEST_WIDTH];
`endgen

`genif (`SPLIT_ID) begin
    assign right_TID = left_TDATA[`WIDTH_IU -1 -: ID_WIDTH];
`endgen

`genif (`SPLIT_USER) begin
    assign right_TUSER = left_TDATA[`WIDTH_U -1 -: USER_WIDTH];
`endgen

assign right_TVALID = left_TVALID;
assign left_TREADY = right_TREADY;

`genif (`PASSTHRU_LAST) begin
    assign right_TLAST = left_TLAST;
`endgen

`genif (`PASSTHRU_KEEP) begin
    assign right_TKEEP = left_TKEEP;
`endgen

`genif (`PASSTHRU_DEST) begin
    assign right_TDEST = left_TDEST;
`endgen

`genif (`PASSTHRU_ID) begin
    assign right_TID = left_TID;
`endgen

`genif (`PASSTHRU_USER) begin
    assign right_TUSER = left_TUSER;
`endgen




endmodule

