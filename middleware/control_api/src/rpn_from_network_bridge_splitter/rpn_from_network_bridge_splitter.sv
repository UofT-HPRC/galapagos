module rpn_from_network_bridge_splitter #(
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
    // AXIS interface to RPN LAN interfaces
    output to_rpn_LAN_tvalid,
    input to_rpn_LAN_tready,
    output [AXIS_DATA_WIDTH-1:0] to_rpn_LAN_tdata,
    output [AXIS_KEEP_WIDTH-1:0] to_rpn_LAN_tkeep,
    output [AXIS_FROM_NB_TDEST_WIDTH-1:0] to_rpn_LAN_tid,
    output [AXIS_FROM_NB_TDEST_WIDTH-1:0] to_rpn_LAN_tdest,
    output [AXIS_FROM_NB_TUSER_WIDTH-1:0] to_rpn_LAN_tuser,
    output to_rpn_LAN_tlast,
    // AXIS interface to RPN WAN interfaces
    output to_rpn_WAN_tvalid,
    input to_rpn_WAN_tready,
    output [AXIS_DATA_WIDTH-1:0] to_rpn_WAN_tdata,
    output [AXIS_KEEP_WIDTH-1:0] to_rpn_WAN_tkeep,
    output [AXIS_FROM_NB_TDEST_WIDTH-1:0] to_rpn_WAN_tid,
    output [AXIS_FROM_NB_TDEST_WIDTH-1:0] to_rpn_WAN_tdest,
    output [AXIS_FROM_NB_TUSER_WIDTH-1:0] to_rpn_WAN_tuser,
    output to_rpn_WAN_tlast,
    // AXIS interface to RPN WNN interfaces
    output to_rpn_WNN_tvalid,
    input to_rpn_WNN_tready,
    output [AXIS_DATA_WIDTH-1:0] to_rpn_WNN_tdata,
    output [AXIS_KEEP_WIDTH-1:0] to_rpn_WNN_tkeep,
    output [AXIS_FROM_NB_TDEST_WIDTH-1:0] to_rpn_WNN_tid,
    output [AXIS_FROM_NB_TDEST_WIDTH-1:0] to_rpn_WNN_tdest,
    output [AXIS_FROM_NB_TUSER_WIDTH-1:0] to_rpn_WNN_tuser,
    output to_rpn_WNN_tlast,
    // AXIS interface to RPN KIP interfaces
    output to_rpn_KIP_tvalid,
    input to_rpn_KIP_tready,
    output [AXIS_DATA_WIDTH-1:0] to_rpn_KIP_tdata,
    output [AXIS_KEEP_WIDTH-1:0] to_rpn_KIP_tkeep,
    output [AXIS_FROM_NB_TDEST_WIDTH-1:0] to_rpn_KIP_tid,
    output [AXIS_FROM_NB_TDEST_WIDTH-1:0] to_rpn_KIP_tdest,
    output [AXIS_FROM_NB_TUSER_WIDTH-1:0] to_rpn_KIP_tuser,
    output to_rpn_KIP_tlast
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
        if (w_from_nb_msg_type < RPN_MSG_TYPE_WAN_PUB)
            from_network_bridge_tready = to_rpn_LAN_tready;
        else if (w_from_nb_msg_type < RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_REQUEST)
            from_network_bridge_tready = to_rpn_WAN_tready;
        else if (w_from_nb_msg_type < RPN_MSG_TYPE_KIP_PUB)
            from_network_bridge_tready = to_rpn_WNN_tready;
        else
            from_network_bridge_tready = to_rpn_KIP_tready;
    end
    // AXIS interface to RPN LAN
    assign to_rpn_LAN_tvalid = (w_from_nb_msg_type < RPN_MSG_TYPE_WAN_PUB) ? from_network_bridge_tvalid : 0;
    assign to_rpn_LAN_tdata = from_network_bridge_tdata;
    assign to_rpn_LAN_tkeep = from_network_bridge_tkeep;
    assign to_rpn_LAN_tid = from_network_bridge_tid;
    assign to_rpn_LAN_tdest = from_network_bridge_tdest;
    assign to_rpn_LAN_tuser = from_network_bridge_tuser;
    assign to_rpn_LAN_tlast = from_network_bridge_tlast;
    // AXIS interface to RPN WAN
    assign to_rpn_WAN_tvalid = (w_from_nb_msg_type > RPN_MSG_TYPE_LAN_SEQ_NUM_REPLY 
                             && w_from_nb_msg_type < RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_REQUEST) ? from_network_bridge_tvalid : 0;
    assign to_rpn_WAN_tdata = from_network_bridge_tdata;
    assign to_rpn_WAN_tkeep = from_network_bridge_tkeep;
    assign to_rpn_WAN_tid = from_network_bridge_tid;
    assign to_rpn_WAN_tdest = from_network_bridge_tdest;
    assign to_rpn_WAN_tuser = from_network_bridge_tuser;
    assign to_rpn_WAN_tlast = from_network_bridge_tlast;
    // AXIS interface to RPN WNN
    assign to_rpn_WNN_tvalid = (w_from_nb_msg_type > RPN_MSG_TYPE_WAN_ACK 
                             && w_from_nb_msg_type < RPN_MSG_TYPE_KIP_PUB) ? from_network_bridge_tvalid : 0;
    assign to_rpn_WNN_tdata = from_network_bridge_tdata;
    assign to_rpn_WNN_tkeep = from_network_bridge_tkeep;
    assign to_rpn_WNN_tid = from_network_bridge_tid;
    assign to_rpn_WNN_tdest = from_network_bridge_tdest;
    assign to_rpn_WNN_tuser = from_network_bridge_tuser;
    assign to_rpn_WNN_tlast = from_network_bridge_tlast;
    // AXIS interface to RPN KIP
    assign to_rpn_KIP_tvalid = (w_from_nb_msg_type > RPN_MSG_TYPE_WAN_SEQ_NUM_REPLY) ? from_network_bridge_tvalid : 0;
    assign to_rpn_KIP_tdata = from_network_bridge_tdata;
    assign to_rpn_KIP_tkeep = from_network_bridge_tkeep;
    assign to_rpn_KIP_tid = from_network_bridge_tid;
    assign to_rpn_KIP_tdest = from_network_bridge_tdest;
    assign to_rpn_KIP_tuser = from_network_bridge_tuser;
    assign to_rpn_KIP_tlast = from_network_bridge_tlast;
endmodule