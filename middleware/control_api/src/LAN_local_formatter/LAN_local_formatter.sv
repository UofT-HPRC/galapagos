module LAN_local_formatter #(
    `include "ctrl_api_header_parameters.vh"
) (
    input i_clk,
    input i_ap_rst_n,
    input [IP_ADDRESS_WIDTH-1:0] i_local_ip_address,
    input [IP_PORT_WIDTH-1:0] i_LAN_port_number,
    // AXIS interface from LAN Router
    input from_router_tvalid,
    output from_router_tready,
    input [AXIS_DATA_WIDTH-1:0] from_router_tdata,
    input [AXIS_KEEP_WIDTH-1:0] from_router_tkeep,
    input [AXIS_LAN_TDEST_WIDTH-1:0] from_router_tid,
    input [AXIS_LAN_TDEST_WIDTH-1:0] from_router_tdest,
    input [AXIS_LAN_TUSER_WIDTH-1:0] from_router_tuser,
    input from_router_tlast,
    // AXIS interface to from_nb switch
    output to_switch_tvalid,
    input to_switch_tready,
    output [AXIS_DATA_WIDTH-1:0] to_switch_tdata,
    output [AXIS_KEEP_WIDTH-1:0] to_switch_tkeep,
    output [AXIS_FROM_NB_TDEST_WIDTH-1:0] to_switch_tid,
    output [AXIS_FROM_NB_TDEST_WIDTH-1:0] to_switch_tdest,
    output [AXIS_FROM_NB_TUSER_WIDTH-1:0] to_switch_tuser,
    output to_switch_tlast
);
    // Message Offsets
    `include "ctrl_api_message_parameters.vh"

    assign to_switch_tvalid = from_router_tvalid;
    assign to_switch_tdata = from_router_tdata;
    assign to_switch_tkeep = from_router_tkeep;
    assign to_switch_tid = from_router_tid;
    assign to_switch_tdest = from_router_tdest;
    assign to_switch_tlast = from_router_tlast;
    // Replace TUSER field with local FPGA IP address and ports
    assign to_switch_tuser[IP_ADDRESS_WIDTH-1:0] = i_local_ip_address;
    assign to_switch_tuser[AXIS_FROM_NB_SRC_PORT_OFFSET+:IP_PORT_WIDTH] = i_LAN_port_number;
    assign to_switch_tuser[AXIS_FROM_NB_DEST_PORT_OFFSET+:IP_PORT_WIDTH] = i_LAN_port_number;

    assign from_router_tready = to_switch_tready;
endmodule