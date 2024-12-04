
module control_gw_network_bridge #(
    `include "ctrl_api_header_parameters.vh"
) (
    input i_clk,
    input i_ap_rst_n,
    // Input from Network Bridge
    input from_network_bridge_tvalid,
    output from_network_bridge_tready,
    input [AXIS_DATA_WIDTH-1:0] from_network_bridge_tdata,
    input [AXIS_KEEP_WIDTH-1:0] from_network_bridge_tkeep,
    input [IP_PORT_WIDTH-1:0] from_network_bridge_tid,
    input [IP_PORT_WIDTH-1:0] from_network_bridge_tdest, // Dest Port
    input [IP_ADDRESS_WIDTH-1:0] from_network_bridge_tuser, // Src Port and SRC IP
    input from_network_bridge_tlast,
    // Output to Control
    output to_ctrl_tvalid,
    input to_ctrl_tready,
    output [AXIS_DATA_WIDTH-1:0] to_ctrl_tdata,
    output [AXIS_KEEP_WIDTH-1:0] to_ctrl_tkeep,
    output [IP_PORT_WIDTH-1:0] to_ctrl_tid,
    output [IP_PORT_WIDTH-1:0] to_ctrl_tdest,
    output [IP_ADDRESS_WIDTH-1:0] to_ctrl_tuser,
    output to_ctrl_tlast
);
    
    // Assignments
    // Only pass on message payloads, not the headers. Header is always the first message, control message is the last
    assign from_network_bridge_tready = (from_network_bridge_tlast == 0) ? 1 : to_ctrl_tready;
    assign to_ctrl_tvalid = (from_network_bridge_tvalid == 1 && from_network_bridge_tlast == 1) ? 1 : 0;
    assign to_ctrl_tdata = from_network_bridge_tdata;
    assign to_ctrl_tkeep = from_network_bridge_tkeep;
    assign to_ctrl_tid = from_network_bridge_tid;
    assign to_ctrl_tdest = from_network_bridge_tdest;
    assign to_ctrl_tuser = from_network_bridge_tuser;
    assign to_ctrl_tlast = from_network_bridge_tlast;
endmodule