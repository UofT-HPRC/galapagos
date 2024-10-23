module reliability_from_network_bridge_splitter #(
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
    // AXIS interface to AXI-Lite to reliability outbound side
    output to_rel_outbound_tvalid,
    input to_rel_outbound_tready,
    output [AXIS_DATA_WIDTH-1:0] to_rel_outbound_tdata,
    output [AXIS_KEEP_WIDTH-1:0] to_rel_outbound_tkeep,
    output [AXIS_FROM_NB_TDEST_WIDTH-1:0] to_rel_outbound_tid,
    output [AXIS_FROM_NB_TDEST_WIDTH-1:0] to_rel_outbound_tdest,
    output [AXIS_FROM_NB_TUSER_WIDTH-1:0] to_rel_outbound_tuser,
    output to_rel_outbound_tlast,
    // AXIS interface to reliability inbound side
    output to_rel_inbound_tvalid,
    input to_rel_inbound_tready,
    output [AXIS_DATA_WIDTH-1:0] to_rel_inbound_tdata,
    output [AXIS_KEEP_WIDTH-1:0] to_rel_inbound_tkeep,
    output [AXIS_FROM_NB_TDEST_WIDTH-1:0] to_rel_inbound_tid,
    output [AXIS_FROM_NB_TDEST_WIDTH-1:0] to_rel_inbound_tdest,
    output [AXIS_FROM_NB_TUSER_WIDTH-1:0] to_rel_inbound_tuser,
    output to_rel_inbound_tlast
);

    // Message Offsets
    `include "ctrl_api_reliability_message_parameters.vh"

    // Declarations
    logic [PACKET_MSG_TYPE_WIDTH-1:0] w_from_nb_msg_type;

    // Assignments
    assign w_from_nb_msg_type = from_network_bridge_tdata[PACKET_MSG_TYPE_WIDTH-1:0];
    // Both interfaces are the same, just set TVALID and TREADY based on message type
    // Outbound module should only be receiving PUBREC and PUBCOMP. Inbound module should only receive PUB and PUBREL
    // AXIS interface from network bridge
    assign from_network_bridge_tready = (w_from_nb_msg_type == RPM_MSG_TYPE_PUB
                                      || w_from_nb_msg_type == RPM_MSG_TYPE_PUBREL) ? to_rel_inbound_tready : to_rel_outbound_tready;
    // AXIS interface to outbound module
    assign to_rel_outbound_tvalid = (w_from_nb_msg_type == RPM_MSG_TYPE_PUBREC
                         || w_from_nb_msg_type == RPM_MSG_TYPE_PUBCOMP) ? from_network_bridge_tvalid : 0;
    assign to_rel_outbound_tdata = from_network_bridge_tdata;
    assign to_rel_outbound_tkeep = from_network_bridge_tkeep;
    assign to_rel_outbound_tid = from_network_bridge_tid;
    assign to_rel_outbound_tdest = from_network_bridge_tdest;
    assign to_rel_outbound_tuser = from_network_bridge_tuser;
    assign to_rel_outbound_tlast = from_network_bridge_tlast;
    // AXIS interface to inbound module
    assign to_rel_inbound_tvalid = (w_from_nb_msg_type == RPM_MSG_TYPE_PUB
                                 || w_from_nb_msg_type == RPM_MSG_TYPE_PUBREL) ? from_network_bridge_tvalid : 0;
    assign to_rel_inbound_tdata = from_network_bridge_tdata;
    assign to_rel_inbound_tkeep = from_network_bridge_tkeep;
    assign to_rel_inbound_tid = from_network_bridge_tid;
    assign to_rel_inbound_tdest = from_network_bridge_tdest;
    assign to_rel_inbound_tuser = from_network_bridge_tuser;
    assign to_rel_inbound_tlast = from_network_bridge_tlast;

endmodule