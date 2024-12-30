module rpn_KIP_from_network_bridge_splitter #(
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
    // AXIS interface to RPN KIP TX interfaces
    output to_rpn_KIP_TX_tvalid,
    input to_rpn_KIP_TX_tready,
    output [AXIS_DATA_WIDTH-1:0] to_rpn_KIP_TX_tdata,
    output [AXIS_KEEP_WIDTH-1:0] to_rpn_KIP_TX_tkeep,
    output [AXIS_FROM_NB_TDEST_WIDTH-1:0] to_rpn_KIP_TX_tid,
    output [AXIS_FROM_NB_TDEST_WIDTH-1:0] to_rpn_KIP_TX_tdest,
    output [AXIS_FROM_NB_TUSER_WIDTH-1:0] to_rpn_KIP_TX_tuser,
    output to_rpn_KIP_TX_tlast,
    // AXIS interface to RPN KIP RX interfaces
    output to_rpn_KIP_RX_tvalid,
    input to_rpn_KIP_RX_tready,
    output [AXIS_DATA_WIDTH-1:0] to_rpn_KIP_RX_tdata,
    output [AXIS_KEEP_WIDTH-1:0] to_rpn_KIP_RX_tkeep,
    output [AXIS_FROM_NB_TDEST_WIDTH-1:0] to_rpn_KIP_RX_tid,
    output [AXIS_FROM_NB_TDEST_WIDTH-1:0] to_rpn_KIP_RX_tdest,
    output [AXIS_FROM_NB_TUSER_WIDTH-1:0] to_rpn_KIP_RX_tuser,
    output to_rpn_KIP_RX_tlast
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
        if (w_from_nb_msg_type == RPN_MSG_TYPE_KIP_PUB)
            from_network_bridge_tready = to_rpn_KIP_RX_tready;
        else
            from_network_bridge_tready = to_rpn_KIP_TX_tready;
    end
    // AXIS interface to RPN WNN Repo
    assign to_rpn_KIP_TX_tvalid = (w_from_nb_msg_type == RPN_MSG_TYPE_KIP_ACK) ? from_network_bridge_tvalid : 0;
    assign to_rpn_KIP_TX_tdata = from_network_bridge_tdata;
    assign to_rpn_KIP_TX_tkeep = from_network_bridge_tkeep;
    assign to_rpn_KIP_TX_tid = from_network_bridge_tid;
    assign to_rpn_KIP_TX_tdest = from_network_bridge_tdest;
    assign to_rpn_KIP_TX_tuser = from_network_bridge_tuser;
    assign to_rpn_KIP_TX_tlast = from_network_bridge_tlast;
    // AXIS interface to RPN WNN Node
    assign to_rpn_KIP_RX_tvalid = (w_from_nb_msg_type == RPN_MSG_TYPE_KIP_PUB) ? from_network_bridge_tvalid : 0;
    assign to_rpn_KIP_RX_tdata = from_network_bridge_tdata;
    assign to_rpn_KIP_RX_tkeep = from_network_bridge_tkeep;
    assign to_rpn_KIP_RX_tid = from_network_bridge_tid;
    assign to_rpn_KIP_RX_tdest = from_network_bridge_tdest;
    assign to_rpn_KIP_RX_tuser = from_network_bridge_tuser;
    assign to_rpn_KIP_RX_tlast = from_network_bridge_tlast;
endmodule