module rpn_WNN_repo_from_network_bridge_splitter #(
    `include "ctrl_api_reliability_header_parameters.vh"
    `include "ctrl_api_header_parameters.vh"
) (
    input i_clk,
    input i_ap_rst_n,
    // AXIS interface from network bridge
    input from_network_bridge_tvalid,
    output logic from_network_bridge_tready,
    input [AXIS_DATA_WIDTH-1:0] from_network_bridge_tdata,
    input [AXIS_KEEP_WIDTH-1:0] from_network_bridge_tkeep,
    input [AXIS_FROM_NB_TDEST_WIDTH-1:0] from_network_bridge_tid,
    input [AXIS_FROM_NB_TDEST_WIDTH-1:0] from_network_bridge_tdest,
    input [AXIS_FROM_NB_TUSER_WIDTH-1:0] from_network_bridge_tuser,
    input from_network_bridge_tlast,
    // AXIS interface to RPN WNN Outgoing Repo interfaces
    output to_rpn_WNN_outgoing_repo_tvalid,
    input to_rpn_WNN_outgoing_repo_tready,
    output [AXIS_DATA_WIDTH-1:0] to_rpn_WNN_outgoing_repo_tdata,
    output [AXIS_KEEP_WIDTH-1:0] to_rpn_WNN_outgoing_repo_tkeep,
    output [AXIS_FROM_NB_TDEST_WIDTH-1:0] to_rpn_WNN_outgoing_repo_tid,
    output [AXIS_FROM_NB_TDEST_WIDTH-1:0] to_rpn_WNN_outgoing_repo_tdest,
    output [AXIS_FROM_NB_TUSER_WIDTH-1:0] to_rpn_WNN_outgoing_repo_tuser,
    output to_rpn_WNN_outgoing_repo_tlast,
    // AXIS interface to RPN WNN Incoming Repo interfaces
    output to_rpn_WNN_incoming_repo_tvalid,
    input to_rpn_WNN_incoming_repo_tready,
    output [AXIS_DATA_WIDTH-1:0] to_rpn_WNN_incoming_repo_tdata,
    output [AXIS_KEEP_WIDTH-1:0] to_rpn_WNN_incoming_repo_tkeep,
    output [AXIS_FROM_NB_TDEST_WIDTH-1:0] to_rpn_WNN_incoming_repo_tid,
    output [AXIS_FROM_NB_TDEST_WIDTH-1:0] to_rpn_WNN_incoming_repo_tdest,
    output [AXIS_FROM_NB_TUSER_WIDTH-1:0] to_rpn_WNN_incoming_repo_tuser,
    output to_rpn_WNN_incoming_repo_tlast,
    // AXIS interface to RPN WAN Sequence Number Initializer interfaces
    output to_rpn_WAN_seq_num_initializer_tvalid,
    input to_rpn_WAN_seq_num_initializer_tready,
    output [AXIS_DATA_WIDTH-1:0] to_rpn_WAN_seq_num_initializer_tdata,
    output [AXIS_KEEP_WIDTH-1:0] to_rpn_WAN_seq_num_initializer_tkeep,
    output [AXIS_FROM_NB_TDEST_WIDTH-1:0] to_rpn_WAN_seq_num_initializer_tid,
    output [AXIS_FROM_NB_TDEST_WIDTH-1:0] to_rpn_WAN_seq_num_initializer_tdest,
    output [AXIS_FROM_NB_TUSER_WIDTH-1:0] to_rpn_WAN_seq_num_initializer_tuser,
    output to_rpn_WAN_seq_num_initializer_tlast
);

    // Message Offsets
    `include "ctrl_api_reliability_message_parameters.vh"

    // Declarations
    logic [RPN_MSG_TYPE_WIDTH-1:0] w_from_nb_msg_type;

    // Assignments
    assign w_from_nb_msg_type = from_network_bridge_tdata[RPN_MSG_TYPE_WIDTH-1:0];
    // Both interfaces are the same, just set TVALID and TREADY based on message type
    // Outbound module should only be receiving PUBREC and PUBCOMP. Inbound module should only receive PUB and PUBREL
    // AXIS interface from network bridge
    always_comb begin
        from_network_bridge_tready = 0;
        if (w_from_nb_msg_type < RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_REQUEST)
            from_network_bridge_tready = to_rpn_WAN_seq_num_initializer_tready;
        else if (w_from_nb_msg_type < RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_REQUEST)
            from_network_bridge_tready = to_rpn_WNN_outgoing_repo_tready;
        else
            from_network_bridge_tready = to_rpn_WNN_incoming_repo_tready;
    end
    // AXIS interface to RPN WNN Outgoing Repo
    assign to_rpn_WNN_outgoing_repo_tvalid = (w_from_nb_msg_type > RPN_MSG_TYPE_WAN_SEQ_NUM_REPLY
                                           && w_from_nb_msg_type < RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_REQUEST) ? from_network_bridge_tvalid : 0;
    assign to_rpn_WNN_outgoing_repo_tdata = from_network_bridge_tdata;
    assign to_rpn_WNN_outgoing_repo_tkeep = from_network_bridge_tkeep;
    assign to_rpn_WNN_outgoing_repo_tid = from_network_bridge_tid;
    assign to_rpn_WNN_outgoing_repo_tdest = from_network_bridge_tdest;
    assign to_rpn_WNN_outgoing_repo_tuser = from_network_bridge_tuser;
    assign to_rpn_WNN_outgoing_repo_tlast = from_network_bridge_tlast;
    // AXIS interface to RPN WNN Incoming Repo
    assign to_rpn_WNN_incoming_repo_tvalid = (w_from_nb_msg_type > RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_CHECK) ? from_network_bridge_tvalid : 0;
    assign to_rpn_WNN_incoming_repo_tdata = from_network_bridge_tdata;
    assign to_rpn_WNN_incoming_repo_tkeep = from_network_bridge_tkeep;
    assign to_rpn_WNN_incoming_repo_tid = from_network_bridge_tid;
    assign to_rpn_WNN_incoming_repo_tdest = from_network_bridge_tdest;
    assign to_rpn_WNN_incoming_repo_tuser = from_network_bridge_tuser;
    assign to_rpn_WNN_incoming_repo_tlast = from_network_bridge_tlast;
    // AXIS interface to RPN WAN Sequence Number Initializer
    assign to_rpn_WAN_seq_num_initializer_tvalid = (w_from_nb_msg_type < RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_REQUEST) ? from_network_bridge_tvalid : 0;
    assign to_rpn_WAN_seq_num_initializer_tdata = from_network_bridge_tdata;
    assign to_rpn_WAN_seq_num_initializer_tkeep = from_network_bridge_tkeep;
    assign to_rpn_WAN_seq_num_initializer_tid = from_network_bridge_tid;
    assign to_rpn_WAN_seq_num_initializer_tdest = from_network_bridge_tdest;
    assign to_rpn_WAN_seq_num_initializer_tuser = from_network_bridge_tuser;
    assign to_rpn_WAN_seq_num_initializer_tlast = from_network_bridge_tlast;
endmodule