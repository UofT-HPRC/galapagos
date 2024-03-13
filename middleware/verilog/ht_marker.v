`timescale 1 ps / 1 ps

module ht_marker
   (
    usr_tready,
    usr_tvalid,
    usr_tdata,
    usr_tdest,
    usr_tid,
    usr_tkeep,
    usr_tlast,
    gal_tready,
    gal_tvalid,
    gal_tdata,
    gal_tkeep,
    gal_tlast,
    gal_tuser,
    gal_tdest,
    gal_tid,
    clk,
    resetn
    );


  output usr_tready;
  input usr_tvalid;
  input [511:0] usr_tdata;
  input [63:0] usr_tkeep;
  input [7:0] usr_tdest;
  input [7:0] usr_tid;
  input usr_tlast;
  
  input gal_tready;
  output gal_tvalid;
  output [511:0] gal_tdata;
  output [63:0] gal_tkeep;
  output gal_tlast;
  output [7:0] gal_tuser;
  output [7:0] gal_tdest;
  output [7:0] gal_tid;
  
  input clk;
  input resetn;
  
  assign usr_tready = gal_tready;
  assign gal_tvalid = usr_tvalid;
  assign gal_tdata = usr_tdata;
  assign gal_tkeep = usr_tkeep;
  assign gal_tlast = usr_tlast;
  assign gal_tdest = usr_tdest;
  assign gal_tid = usr_tid;
  assign gal_tuser = 0;
endmodule
