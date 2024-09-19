`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/19/2024 09:45:59 AM
// Design Name: 
// Module Name: odometry
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


module odometry
    #(parameter DATAWIDTH=512, DESTWIDTH=8, USERWIDTH=8, IDWIDTH=8) (
    (* X_INTERFACE_MODE = "monitor" *)
    input Input_tlast,
    input Input_tvalid,
    input Input_tready,
    output [63:0] flit_count,
    output [63:0] packet_count,
    output [31:0] value,
    input clk,
    input rstn
    );
    reg [63:0] flit_count_reg = 0;
    reg [63:0] packet_count_reg = 0;
    reg [31:0] value_reg = 0;
    assign flit_count = flit_count_reg;
    assign packet_count = packet_count_reg;
    assign value = value_reg;
    always @(posedge clk)
    begin
        if (rstn == 0)
        begin
            flit_count_reg = 0;
            packet_count_reg = 0;
            value_reg = 0;
        end
        else if ((Input_tvalid == 1) && (Input_tready == 1))
        begin
            flit_count_reg = flit_count_reg + 1;
            packet_count_reg = packet_count_reg + Input_tlast;
            value_reg = value_reg + ((1000000000-value_reg)>>10);
        end
        else
        begin
            value_reg = value_reg - (value_reg >>10);
        end
    end
endmodule
