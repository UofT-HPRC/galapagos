`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2018 02:08:18 PM
// Design Name: 
// Module Name: axi_pkg
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`ifndef AXI_H
`define AXI_H
interface axiStream
#(parameter C_DATA_WIDTH = 64);
    logic [C_DATA_WIDTH-1:0] TDATA;
    logic TVALID;
    logic [C_DATA_WIDTH/8-1:0] TKEEP;
    logic TLAST;
    logic TREADY;

    modport master (
        output TDATA,
        output TVALID,
        output TKEEP,
        output TLAST,
        input  TREADY
    );

    modport slave (
        input TDATA,
        input TVALID,
        input TKEEP,
        input TLAST,
        output TREADY
    );
endinterface
interface axiLiteBus(input aclk);

    logic [32-1:0]   awaddr;
    logic                      awvalid;
    logic                      awready;
    logic [32-1:0]   wdata;
    logic                      wvalid;
    logic                      wready;
    logic [1:0]                bresp;
    logic                      bvalid;
    logic                      bready;
    logic [32-1:0]   araddr;
    logic                      arvalid;
    logic                      arready;
    logic [32-1:0]   rdata;
    logic [1:0]                rresp;
    logic                      rvalid;
    logic                      rready;

    modport slave(
        input awaddr,
        input awvalid,
        output  awready,
        input wdata,
        input wvalid,
        output  wready,
        output  bresp,
        output  bvalid,
        input bready,
        input araddr,
        input arvalid,
        output  arready,
        output rdata,
        output rresp,
        output rvalid,
        input rready
    );

    clocking cb @(posedge aclk);
        output awaddr;
        output awvalid;
        input  awready;
        output wdata;
        output wvalid;
        input  wready;
        input  bresp;
        input  bvalid;
        output bready;
        output araddr;
        output arvalid;
        input  arready;
        input rdata;
        input rresp;
        input rvalid;
        output rready;
    endclocking

    //task automatic init();
        //araddr  = 0;
        //arvalid = 0;
        //awaddr  = 0;
        //awvalid = 0;
        //bready  = 0;
        //rready  = 0;
        //wdata   = 0;
        //wvalid  = 0;
    //endtask

    //task automatic write(logic [31:0] address, logic [31:0] data);
        //cb.awaddr <= address;
        //cb.awvalid <= 1;
        //cb.wdata  <= data;
        //cb.bready <= 0;
        //cb.wvalid  <= 0;
        //@(cb iff cb.awready);
        //cb.awvalid <= 0;
        //cb.wvalid  <= 1;
        //@(cb iff cb.wready);
        //cb.wvalid <= 0;
        //cb.bready <= 1;
        //@(cb iff cb.bvalid);
        //cb.bready <= 0;
    //endtask

    //task automatic read(logic [31:0] address, output logic [31:0] data);
        //cb.araddr <= address;
        //cb.arvalid <= 1;
        //cb.rready <= 0;
        //@(cb iff cb.arready);
        //cb.arvalid <= 0;
        //cb.rready <= 1;
        //@(cb iff cb.rvalid);
        //data = cb.rdata;
        //cb.rready <= 0;
    //endtask
endinterface

interface axiBus
#(
    parameter C_DATA_WIDTH = 512,
    parameter C_ADDR_WIDTH = 40,
    parameter C_ID_WIDTH   = 2
);
    logic [C_ID_WIDTH-1:0]     AWID;
    logic [C_ADDR_WIDTH-1:0]   AWADDR;
    logic [7:0]                AWLEN;
    logic [2:0]                AWSIZE;
    logic [1:0]                AWBURST;
    logic                      AWLOCK;
    logic [3:0]                AWCACHE;
    logic [2:0]                AWPROT;
    logic [3:0]                AWQOS;
    logic                      AWVALID;
    logic                      AWREADY;
    logic [C_DATA_WIDTH-1:0]   WDATA;
    logic [C_DATA_WIDTH/8-1:0] WSTRB;
    logic                      WLAST;
    logic                      WVALID;
    logic                      WREADY;
    logic [C_ID_WIDTH-1:0]     BID;
    logic [1:0]                BRESP;
    logic                      BVALID;
    logic                      BREADY;
    logic [C_ID_WIDTH-1:0]     ARID;
    logic [C_ADDR_WIDTH-1:0]   ARADDR;
    logic [7:0]                ARLEN;
    logic [2:0]                ARSIZE;
    logic [1:0]                ARBURST;
    logic                      ARLOCK;
    logic [3:0]                ARCACHE;
    logic [2:0]                ARPROT;
    logic [3:0]                ARQOS;
    logic                      ARVALID;
    logic                      ARREADY;
    logic [C_ID_WIDTH-1:0]     RID;
    logic [C_DATA_WIDTH-1:0]   RDATA;
    logic [1:0]                RRESP;
    logic                      RLAST;
    logic                      RVALID;
    logic                      RREADY;

    modport master(

        output AWID,
        output AWADDR,
        output AWLEN,
        output AWSIZE,
        output AWBURST,
        output AWLOCK,
        output AWCACHE,
        output AWPROT,
        output AWQOS,
        output AWVALID,
        input  AWREADY,
        output WDATA,
        output WSTRB,
        output WLAST,
        output WVALID,
        input  WREADY,
        input  BID,
        input  BRESP,
        input  BVALID,
        output BREADY,
        output ARID,
        output ARADDR,
        output ARLEN,
        output ARSIZE,
        output ARBURST,
        output ARLOCK,
        output ARCACHE,
        output ARPROT,
        output ARQOS,
        output ARVALID,
        input  ARREADY,
        input  RID,
        input  RDATA,
        input  RRESP,
        input  RLAST,
        input  RVALID,
        output RREADY
    );
    modport slave(
        input  AWID,
        input  AWADDR,
        input  AWLEN,
        input  AWSIZE,
        input  AWBURST,
        input  AWLOCK,
        input  AWCACHE,
        input  AWPROT,
        input  AWQOS,
        input  AWVALID,
        output AWREADY,
        input  WDATA,
        input  WSTRB,
        input  WLAST,
        input  WVALID,
        output WREADY,
        output BID,
        output BRESP,
        output BVALID,
        input  BREADY,
        input  ARID,
        input  ARADDR,
        input  ARLEN,
        input  ARSIZE,
        input  ARBURST,
        input  ARLOCK,
        input  ARCACHE,
        input  ARPROT,
        input  ARQOS,
        input  ARVALID,
        output ARREADY,
        output RID,
        output RDATA,
        output RRESP,
        output RLAST,
        output RVALID,
        input  RREADY
    );
endinterface
`endif
