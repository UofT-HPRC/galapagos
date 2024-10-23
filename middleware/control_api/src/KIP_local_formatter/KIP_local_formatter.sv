module KIP_local_formatter #(
    `include "ctrl_api_header_parameters.vh"
) (
    input i_clk,
    input i_ap_rst_n,
    // AXIS interface from KIP Router
    input from_router_tvalid,
    output from_router_tready,
    input [AXIS_DATA_WIDTH-1:0] from_router_tdata,
    input [AXIS_KEEP_WIDTH-1:0] from_router_tkeep,
    input [AXIS_KIP_TUSER_WIDTH-1:0] from_router_tuser,
    input from_router_tlast,
    // AXIS interface to kernels
    output to_kernels_tvalid,
    input to_kernels_tready,
    output [AXIS_DATA_WIDTH-1:0] to_kernels_tdata,
    output [AXIS_KEEP_WIDTH-1:0] to_kernels_tkeep,
    output [AXIS_FROM_NB_TDEST_WIDTH-1:0] to_kernels_tid,
    output [AXIS_FROM_NB_TDEST_WIDTH-1:0] to_kernels_tdest,
    output [AXIS_FROM_NB_TUSER_WIDTH-1:0] to_kernels_tuser,
    output to_kernels_tlast
);

    // Message Offsets
    `include "ctrl_api_message_parameters.vh"

    assign from_router_tready = to_kernels_tready;

    assign to_kernels_tvalid = from_router_tvalid;
    assign to_kernels_tdata = from_router_tdata;
    assign to_kernels_tkeep = from_router_tkeep;
    assign to_kernels_tid = from_router_tdata[AXIS_KIP_SENDER_TID_OFFSET+:AXIS_LAN_TDEST_WIDTH];
    assign to_kernels_tdest = from_router_tdata[AXIS_KIP_TID_OFFSET+:AXIS_LAN_TDEST_WIDTH];
    assign to_kernels_tuser = from_router_tuser;
    assign to_kernels_tlast = from_router_tlast;
endmodule