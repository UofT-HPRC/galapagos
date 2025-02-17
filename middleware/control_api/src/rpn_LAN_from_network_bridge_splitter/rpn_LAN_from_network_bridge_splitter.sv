module rpn_LAN_from_network_bridge_splitter #(
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
    // AXIS interface to rpn LAN sequence number initializer
    output logic to_rpn_LAN_seq_num_initializer_tvalid,
    input to_rpn_LAN_seq_num_initializer_tready,
    output logic [AXIS_DATA_WIDTH-1:0] to_rpn_LAN_seq_num_initializer_tdata,
    output logic [AXIS_KEEP_WIDTH-1:0] to_rpn_LAN_seq_num_initializer_tkeep,
    output logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] to_rpn_LAN_seq_num_initializer_tid,
    output logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] to_rpn_LAN_seq_num_initializer_tdest,
    output logic [AXIS_FROM_NB_TUSER_WIDTH-1:0] to_rpn_LAN_seq_num_initializer_tuser,
    output logic to_rpn_LAN_seq_num_initializer_tlast,
    // AXIS interface to rpn LAN TX
    output logic to_rpn_LAN_TX_tvalid,
    input to_rpn_LAN_TX_tready,
    output logic [AXIS_DATA_WIDTH-1:0] to_rpn_LAN_TX_tdata,
    output logic [AXIS_KEEP_WIDTH-1:0] to_rpn_LAN_TX_tkeep,
    output logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] to_rpn_LAN_TX_tid,
    output logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] to_rpn_LAN_TX_tdest,
    output logic [AXIS_FROM_NB_TUSER_WIDTH-1:0] to_rpn_LAN_TX_tuser,
    output logic to_rpn_LAN_TX_tlast,
    // AXIS interface to rpn LAN RX
    output logic to_rpn_LAN_RX_tvalid,
    input to_rpn_LAN_RX_tready,
    output logic [AXIS_DATA_WIDTH-1:0] to_rpn_LAN_RX_tdata,
    output logic [AXIS_KEEP_WIDTH-1:0] to_rpn_LAN_RX_tkeep,
    output logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] to_rpn_LAN_RX_tid,
    output logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] to_rpn_LAN_RX_tdest,
    output logic [AXIS_FROM_NB_TUSER_WIDTH-1:0] to_rpn_LAN_RX_tuser,
    output logic to_rpn_LAN_RX_tlast
);

    // Message Offsets
    `include "ctrl_api_reliability_message_parameters.vh"

    // Declarations
    logic [RPN_MSG_TYPE_WIDTH-1:0] w_from_nb_msg_type;

    // Assignments
    assign w_from_nb_msg_type = from_network_bridge_tdata[RPN_MSG_TYPE_WIDTH-1:0];
    // All interfaces are the same, just set TVALID and TREADY based on message type
    // AXIS interface from network bridge
    always_comb begin
        from_network_bridge_tready = 0;
        // Case 1: Message is bound for RPN LAN RX
        if (w_from_nb_msg_type[0] == 0)
            from_network_bridge_tready = to_rpn_LAN_RX_tready;
        // Case 2: Message is bound for RPN LAN TX
        else if (w_from_nb_msg_type == RPN_MSG_TYPE_LAN_ACK)
            from_network_bridge_tready = to_rpn_LAN_TX_tready;
        else
            from_network_bridge_tready = to_rpn_LAN_seq_num_initializer_tready;

    end
    // AXIS interface to LAN sequence number initializer
    assign to_rpn_LAN_seq_num_initializer_tvalid = (w_from_nb_msg_type == RPN_MSG_TYPE_LAN_SEQ_NUM_REPLY) ? from_network_bridge_tvalid : 0;
    assign to_rpn_LAN_seq_num_initializer_tdata = from_network_bridge_tdata;
    assign to_rpn_LAN_seq_num_initializer_tkeep = from_network_bridge_tkeep;
    assign to_rpn_LAN_seq_num_initializer_tid = from_network_bridge_tid;
    assign to_rpn_LAN_seq_num_initializer_tdest = from_network_bridge_tdest;
    assign to_rpn_LAN_seq_num_initializer_tuser = from_network_bridge_tuser;
    assign to_rpn_LAN_seq_num_initializer_tlast = from_network_bridge_tlast;
    // AXIS interface to RPN LAN TX
    assign to_rpn_LAN_TX_tvalid = (w_from_nb_msg_type == RPN_MSG_TYPE_LAN_ACK) ? from_network_bridge_tvalid : 0;
    assign to_rpn_LAN_TX_tdata = from_network_bridge_tdata;
    assign to_rpn_LAN_TX_tkeep = from_network_bridge_tkeep;
    assign to_rpn_LAN_TX_tid = from_network_bridge_tid;
    assign to_rpn_LAN_TX_tdest = from_network_bridge_tdest;
    assign to_rpn_LAN_TX_tuser = from_network_bridge_tuser;
    assign to_rpn_LAN_TX_tlast = from_network_bridge_tlast;
    // AXIS interface to RPN LAN RX
    // Either RPN_MSG_TYPE_LAN_PUB (0) or RPN_MSG_TYPE_LAN_SEQ_NUM_CHECK (2), either way LSB must be 0
    assign to_rpn_LAN_RX_tvalid = (w_from_nb_msg_type[0] == 0) ? from_network_bridge_tvalid : 0;
    assign to_rpn_LAN_RX_tdata = from_network_bridge_tdata;
    assign to_rpn_LAN_RX_tkeep = from_network_bridge_tkeep;
    assign to_rpn_LAN_RX_tid = from_network_bridge_tid;
    assign to_rpn_LAN_RX_tdest = from_network_bridge_tdest;
    assign to_rpn_LAN_RX_tuser = from_network_bridge_tuser;
    assign to_rpn_LAN_RX_tlast = from_network_bridge_tlast;

endmodule