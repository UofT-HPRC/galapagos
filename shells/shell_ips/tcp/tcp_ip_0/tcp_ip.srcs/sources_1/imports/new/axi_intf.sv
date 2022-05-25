`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/11/2018 12:23:38 PM
// Design Name: 
// Module Name: axi_intf
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

`include "axi_pkg.sv"

module axi_intf
#(
    parameter C_ADDR_WIDTH = 40
)
(
    input logic  aclk,
    input logic  aresetn,
    input logic  [31:0]  s_axictl_awaddr, // Write address (optional)
    input logic          s_axictl_awvalid, // Write address valid (optional)
    output logic         s_axictl_awready, // Write address ready (optional)
    input logic  [31:0]  s_axictl_wdata, // Write data (optional)
    input logic          s_axictl_wvalid, // Write valid (optional)
    output logic         s_axictl_wready, // Write ready (optional)
    output logic  [1:0]  s_axictl_bresp, // Write response (optional)
    output logic         s_axictl_bvalid, // Write response valid (optional)
    input logic          s_axictl_bready, // Write response ready (optional)
    input logic  [31:0]  s_axictl_araddr, // Read address (optional)
    input logic          s_axictl_arvalid, // Read address valid (optional)
    output logic         s_axictl_arready, // Read address ready (optional)
    output logic  [31:0] s_axictl_rdata, // Read data (optional)
    output logic  [1:0]  s_axictl_rresp, // Read response (optional)
    output logic         s_axictl_rvalid, // Read valid (optional)
    input logic          s_axictl_rready, // Read ready (optional)


    input  logic [31:0] ip_reg,
    input  logic [31:0] gateway_reg,
    input  logic [31:0] subnet_reg,
    input  logic [47:0] mac_reg,

    output logic [31:0] axi_lite_ip,
    output logic [31:0] axi_lite_gateway,
    output logic [31:0] axi_lite_subnet,
    output logic [47:0] axi_lite_mac,

    output logic axi_lite_grat_arp_en,
    output logic axi_lite_ip_en,
    output logic axi_lite_subnet_en,
    output logic axi_lite_gateway_en,
    output logic axi_lite_mac_en

    );
	
    localparam C_NUM_REGISTERS = 6;
    //0  0x00 send grat
    //1  0x04 ip
    //2  0x08 gateway
    //3  0x0C subnet
    //4  0x10 mac high
    //5  0x14 mac low
    axiLiteBus s_axi();
	logic  [31:0] wdata;
    logic  regWrEn[C_NUM_REGISTERS-1:0];
    logic  [31:0] regData[C_NUM_REGISTERS-1:0];

	axi_block #(.C_NUM_REGISTERS(C_NUM_REGISTERS)) axi_block_inst ( .* );

    //write logic
    //
    logic [31:0] control_reg;

    always_ff @ (posedge aclk)
    begin
        if(~aresetn)
        begin
            axi_lite_mac[47:32] <= 0;
        end
        else
        begin
            if(regWrEn[4])
            begin
                axi_lite_mac[47:32] <= wdata[15:0];
            end
        end
    end
    
    assign axi_lite_ip          = wdata;
    assign axi_lite_gateway      = wdata;
    assign axi_lite_subnet      = wdata;
    assign axi_lite_mac[31:0]   = wdata;


    assign axi_lite_grat_arp_en = regWrEn[0]; 
    assign axi_lite_ip_en       = regWrEn[1];
    assign axi_lite_gateway_en  = regWrEn[2];
    assign axi_lite_subnet_en   = regWrEn[3];
    assign axi_lite_mac_en      = regWrEn[5]; //writing to lower mac will register it

    //read logic
    assign regData[0] = 0;
    assign regData[1] = ip_reg;
    assign regData[2] = gateway_reg;
    assign regData[3] = subnet_reg;
    assign regData[4] = mac_reg[47:32];
    assign regData[5] = mac_reg[31:0];

    //sytemverilog interfaces -> normal verilog ports
    assign s_axi.awaddr     = s_axictl_awaddr  ;
    assign s_axi.awvalid    = s_axictl_awvalid ;
    assign s_axictl_awready = s_axi.awready    ;
    assign s_axi.wdata      = s_axictl_wdata   ;
    assign s_axi.wvalid     = s_axictl_wvalid  ;
    assign s_axictl_wready  = s_axi.wready     ;
    assign s_axictl_bresp   = s_axi.bresp      ;
    assign s_axictl_bvalid  = s_axi.bvalid     ;
    assign s_axi.bready     = s_axictl_bready  ;
    assign s_axi.araddr     = s_axictl_araddr  ;
    assign s_axi.arvalid    = s_axictl_arvalid ;
    assign s_axictl_arready = s_axi.arready    ;
    assign s_axictl_rdata   = s_axi.rdata      ;
    assign s_axictl_rresp   = s_axi.rresp      ;
    assign s_axictl_rvalid  = s_axi.rvalid     ;
    assign s_axi.rready     = s_axictl_rready  ;
endmodule

//////////////////////////////////////////////
module axi_block #(
	parameter C_NUM_REGISTERS = 8
)(
    input logic  aclk, input logic  aresetn,
    axiLiteBus.slave s_axi,
	
	output logic  [31:0] wdata,
    output logic  regWrEn[C_NUM_REGISTERS-1:0],
    input logic  [31:0] regData[C_NUM_REGISTERS-1:0]
);
logic [$clog2(C_NUM_REGISTERS)-1:0] regRdAddr; 
logic regRdAddrEn;

logic wrOneHot[C_NUM_REGISTERS-1:0];
logic regWrOneHot[C_NUM_REGISTERS-1:0];
logic regWrOneHotRegEn;

logic regWrEnablesOutSel;
//Control path for read channel
enum logic {ST_S0R, ST_S1R} rd_cs, rd_ns;
always_ff @ (posedge aclk)
    if(~aresetn)
        rd_cs <= ST_S0R;
    else
        rd_cs <= rd_ns;

always_comb
begin
    s_axi.arready = 0;
    s_axi.rvalid  = 0;
    regRdAddrEn   = 0;
    rd_ns = rd_cs;
    if(rd_cs == ST_S0R)
    begin
        s_axi.arready = 1;
        regRdAddrEn = 1;
        if(s_axi.arvalid)
            rd_ns = ST_S1R;
    end
    else
    begin
        s_axi.rvalid = 1;
        if(s_axi.rready)
            rd_ns = ST_S0R;
    end
end
//Data path for Read Channel
//multiplexer
assign s_axi.rdata = regData[regRdAddr];
always_ff @ (posedge aclk)
begin
    if(regRdAddrEn)
        regRdAddr <= s_axi.araddr[$clog2(C_NUM_REGISTERS)-1+2:2];
end
//Control path for Write Channel

enum logic [1:0] {ST_S0 = 0, ST_S1, ST_S2} wr_cs, wr_ns;
always_ff @ (posedge aclk)
begin
    if(~aresetn)
        wr_cs <= ST_S0;
    else
        wr_cs <= wr_ns;
end

always_comb
begin
    wr_ns = wr_cs;
    s_axi.awready = 0;
    s_axi.wready  = 0;
    s_axi.bvalid  = 0;
    regWrOneHotRegEn   = 0;
    regWrEnablesOutSel    = 0;

    case(wr_cs)
        ST_S0:
        begin
            s_axi.awready = 1;
            regWrOneHotRegEn = 1;
            if(s_axi.awvalid)
                wr_ns = ST_S1;
        end
        ST_S1:
        begin
            s_axi.wready = 1;
            if(s_axi.wvalid)
            begin
                regWrEnablesOutSel = 1;
                wr_ns = ST_S2;
            end
        end
        ST_S2:
        begin
            s_axi.bvalid = 1;
            if(s_axi.bready)
                wr_ns = ST_S0;
        end
    endcase

end

//Datapath for Write Channels

always_ff @ (posedge aclk)
begin
    if(regWrOneHotRegEn)
        regWrOneHot <= wrOneHot;
end

    always_comb
    begin
        for(int i = 0; i < C_NUM_REGISTERS; i++)
        begin
            wrOneHot[i] = 0;
            if(i == s_axi.awaddr[$clog2(C_NUM_REGISTERS)-1+2:2])
                wrOneHot[i] = 1;
        end
    end   

always_comb
begin
    for(int i = 0; i < C_NUM_REGISTERS; i++)
    begin
        regWrEn[i] = 0;
        if(regWrEnablesOutSel)
            regWrEn[i] = regWrOneHot[i];
    end
end


assign wdata = s_axi.wdata;
assign s_axi.bresp = 0;
assign s_axi.rresp = 0;
endmodule

