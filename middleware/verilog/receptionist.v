`timescale 1 ps / 1 ps

module receptionist
   (
    gulf_tready,
    gulf_tvalid,
    gulf_tdata,
    gulf_tkeep,
    gulf_tlast,
    ip,
    src_prt,
    dst_prt,
    gal_tready,
    gal_tvalid,
    gal_tdata,
    gal_tkeep,
    gal_tlast,
    gal_tuser,
    gal_tdest,
    clk,
    resetn
    );


  output gulf_tready;
  input gulf_tvalid;
  input [511:0] gulf_tdata;
  input [63:0] gulf_tkeep;
  input gulf_tlast;
  input [31:0] ip;
  input [15:0] src_prt;
  input [15:0] dst_prt;
  
  input gal_tready;
  output gal_tvalid;
  output [511:0] gal_tdata;
  output [63:0] gal_tkeep;
  output gal_tlast;
  output [47:0] gal_tuser;
  output [15:0] gal_tdest;
  
  input clk;
  input resetn;
  
  assign gulf_tready = gal_tready;
  assign gal_tvalid = gulf_tvalid;
  assign gal_tdata = gulf_tdata;
  assign gal_tkeep = gulf_tkeep;
  assign gal_tlast = gulf_tlast;
  assign gal_tdest = dst_prt;
  assign gal_tuser[47:32] = src_prt;
  assign gal_tuser[31:0] = ip;
endmodule
