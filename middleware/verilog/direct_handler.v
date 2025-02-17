`timescale 1 ps / 1 ps

module direct_handler
    (
    direct_rx_tready,
    direct_rx_tvalid,
    direct_rx_tlast,
    direct_rx_tdata,
    direct_rx_tdest,
    direct_rx_tuser,
    lan_tx_tready,
    lan_tx_tvalid,
    lan_tx_tlast,
    lan_tx_tdata,
    lan_tx_tdest,
    lan_tx_tid,
    lan_tx_tuser,
    direct_tx_tready,
    direct_tx_tvalid,
    direct_tx_tlast,
    direct_tx_tdata,
    direct_tx_tdest,
    direct_tx_tuser,
    clk,
    rstn
    );
    input clk;
    input rstn;
    output direct_rx_tready;
    input direct_rx_tvalid;
    input direct_rx_tlast;
    input [511:0] direct_rx_tdata;
    input [63:0] direct_rx_tkeep;
    input [15:0] direct_rx_tdest;
    input [47:0] direct_rx_tuser;
    
    input lan_tx_tready;
    output lan_tx_tvalid;
    output lan_tx_tlast;
    output [511:0] lan_tx_tdata;
    output [63:0] lan_tx_tkeep;
    output [7:0] lan_tx_tdest;
    output [7:0] lan_tx_tid;
    output [7:0] lan_tx_tuser;
    
    input direct_tx_tready;
    output direct_tx_tvalid;
    output direct_tx_tlast;
    output [511:0] direct_tx_tdata;
    output [63:0] direct_tx_tkeep;
    output [15:0] direct_tx_tdest;
    output [47:0] direct_tx_tuser;
    
    assign direct_tx_tvalid = 0;
    assign direct_tx_tlast = 0;
    assign direct_tx_tdata = 0;
    assign direct_tx_tkeep = 0;
    assign direct_tx_tdest = 0;
    assign direct_tx_tuser = 0;
    