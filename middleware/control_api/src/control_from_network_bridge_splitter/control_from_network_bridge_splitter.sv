module control_from_network_bridge_splitter #(
    `include "ctrl_api_header_parameters.vh"
) (
    input i_clk,
    input i_ap_rst_n,
    // AXIS interface from network bridge
    input from_network_bridge_tvalid,
    output from_network_bridge_tready,
    input [AXIS_DATA_WIDTH-1:0] from_network_bridge_tdata,
    input [AXIS_KEEP_WIDTH-1:0] from_network_bridge_tkeep,
    input [AXIS_FROM_NB_TDEST_WIDTH-1:0] from_network_bridge_tid,
    input [AXIS_FROM_NB_TDEST_WIDTH-1:0] from_network_bridge_tdest,
    input [AXIS_FROM_NB_TUSER_WIDTH-1:0] from_network_bridge_tuser,
    input from_network_bridge_tlast,
    // AXIS interface to AXI-Lite to Network Converter
    output to_anc_tvalid,
    input to_anc_tready,
    output [AXIS_DATA_WIDTH-1:0] to_anc_tdata,
    output [AXIS_KEEP_WIDTH-1:0] to_anc_tkeep,
    output [AXIS_FROM_NB_TDEST_WIDTH-1:0] to_anc_tid,
    output [AXIS_FROM_NB_TDEST_WIDTH-1:0] to_anc_tdest,
    output [AXIS_FROM_NB_TUSER_WIDTH-1:0] to_anc_tuser,
    output to_anc_tlast,
    // AXIS interface to Network to AXI-Lite Converter
    output to_nac_tvalid,
    input to_nac_tready,
    output [AXIS_DATA_WIDTH-1:0] to_nac_tdata,
    output [AXIS_KEEP_WIDTH-1:0] to_nac_tkeep,
    output [AXIS_FROM_NB_TDEST_WIDTH-1:0] to_nac_tid,
    output [AXIS_FROM_NB_TDEST_WIDTH-1:0] to_nac_tdest,
    output [AXIS_FROM_NB_TUSER_WIDTH-1:0] to_nac_tuser,
    output to_nac_tlast
);

    // Message Offsets
    `include "ctrl_api_message_parameters.vh"

    // Declarations
    logic [MSG_TYPE_WIDTH-1:0] w_from_nb_msg_type;

    // Assignments
    assign w_from_nb_msg_type = from_network_bridge_tdata[MSG_TYPE_WIDTH-1:0];
    // Both interfaces are the same, just set TVALID and TREADY based on message type
    // AXIS interface from network bridge
    assign from_network_bridge_tready = (w_from_nb_msg_type == MSG_READ
                                      || w_from_nb_msg_type == MSG_WRITE) ? to_nac_tready : to_anc_tready;
    // AXIS interface to AXI-Lite to Network Converter
    assign to_anc_tvalid = (w_from_nb_msg_type == MSG_BRESP
                         || w_from_nb_msg_type == MSG_RDATA
                         || w_from_nb_msg_type == MSG_BUSY) ? from_network_bridge_tvalid : 0;
    assign to_anc_tdata = from_network_bridge_tdata;
    assign to_anc_tkeep = from_network_bridge_tkeep;
    assign to_anc_tid = from_network_bridge_tid;
    assign to_anc_tdest = from_network_bridge_tdest;
    assign to_anc_tuser = from_network_bridge_tuser;
    assign to_anc_tlast = from_network_bridge_tlast;
    // AXIS interface to Network to AXI-Lite Converter
    assign to_nac_tvalid = (w_from_nb_msg_type == MSG_READ
                         || w_from_nb_msg_type == MSG_WRITE) ? from_network_bridge_tvalid : 0;
    assign to_nac_tdata = from_network_bridge_tdata;
    assign to_nac_tkeep = from_network_bridge_tkeep;
    assign to_nac_tid = from_network_bridge_tid;
    assign to_nac_tdest = from_network_bridge_tdest;
    assign to_nac_tuser = from_network_bridge_tuser;
    assign to_nac_tlast = from_network_bridge_tlast;

endmodule