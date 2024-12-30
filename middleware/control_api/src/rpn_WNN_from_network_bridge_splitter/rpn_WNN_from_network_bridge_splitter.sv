module rpn_WNN_from_network_bridge_splitter #(
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
    // AXIS interface to RPN WNN Repo interfaces
    output to_rpn_WNN_repo_tvalid,
    input to_rpn_WNN_repo_tready,
    output [AXIS_DATA_WIDTH-1:0] to_rpn_WNN_repo_tdata,
    output [AXIS_KEEP_WIDTH-1:0] to_rpn_WNN_repo_tkeep,
    output [AXIS_FROM_NB_TDEST_WIDTH-1:0] to_rpn_WNN_repo_tid,
    output [AXIS_FROM_NB_TDEST_WIDTH-1:0] to_rpn_WNN_repo_tdest,
    output [AXIS_FROM_NB_TUSER_WIDTH-1:0] to_rpn_WNN_repo_tuser,
    output to_rpn_WNN_repo_tlast,
    // AXIS interface to RPN WNN Node interfaces
    output to_rpn_WNN_node_tvalid,
    input to_rpn_WNN_node_tready,
    output [AXIS_DATA_WIDTH-1:0] to_rpn_WNN_node_tdata,
    output [AXIS_KEEP_WIDTH-1:0] to_rpn_WNN_node_tkeep,
    output [AXIS_FROM_NB_TDEST_WIDTH-1:0] to_rpn_WNN_node_tid,
    output [AXIS_FROM_NB_TDEST_WIDTH-1:0] to_rpn_WNN_node_tdest,
    output [AXIS_FROM_NB_TUSER_WIDTH-1:0] to_rpn_WNN_node_tuser,
    output to_rpn_WNN_node_tlast
);

    // Message Offsets
    `include "ctrl_api_reliability_message_parameters.vh"

    // Declarations
    logic [RPN_MSG_TYPE_WIDTH-1:0] w_from_nb_msg_type;

    // Assignments
    assign w_from_nb_msg_type = from_network_bridge_tdata[RPN_MSG_TYPE_WIDTH-1:0];
    // Both interfaces are the same, just set TVALID and TREADY based on message type
    // AXIS interface from network bridge
    always_comb begin
        from_network_bridge_tready = 0;
        if (w_from_nb_msg_type < RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_REPLY)
            from_network_bridge_tready = to_rpn_WNN_repo_tready;
        else
            from_network_bridge_tready = to_rpn_WNN_node_tready;
    end
    // AXIS interface to RPN WNN Repo
    assign to_rpn_WNN_repo_tvalid = (w_from_nb_msg_type < RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_REPLY) ? from_network_bridge_tvalid : 0;
    assign to_rpn_WNN_repo_tdata = from_network_bridge_tdata;
    assign to_rpn_WNN_repo_tkeep = from_network_bridge_tkeep;
    assign to_rpn_WNN_repo_tid = from_network_bridge_tid;
    assign to_rpn_WNN_repo_tdest = from_network_bridge_tdest;
    assign to_rpn_WNN_repo_tuser = from_network_bridge_tuser;
    assign to_rpn_WNN_repo_tlast = from_network_bridge_tlast;
    // AXIS interface to RPN WNN Node
    assign to_rpn_WNN_node_tvalid = (w_from_nb_msg_type > RPN_MSG_TYPE_WAN_NUM_SEQ_NUM_CHECK) ? from_network_bridge_tvalid : 0;
    assign to_rpn_WNN_node_tdata = from_network_bridge_tdata;
    assign to_rpn_WNN_node_tkeep = from_network_bridge_tkeep;
    assign to_rpn_WNN_node_tid = from_network_bridge_tid;
    assign to_rpn_WNN_node_tdest = from_network_bridge_tdest;
    assign to_rpn_WNN_node_tuser = from_network_bridge_tuser;
    assign to_rpn_WNN_node_tlast = from_network_bridge_tlast;
endmodule