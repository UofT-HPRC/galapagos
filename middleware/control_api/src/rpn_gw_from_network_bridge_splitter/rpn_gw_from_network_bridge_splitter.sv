module rpn_gw_from_network_bridge_splitter #(
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
    input [IP_PORT_WIDTH-1:0] from_network_bridge_tid,
    input [IP_PORT_WIDTH-1:0] from_network_bridge_tdest,
    input [IP_ADDRESS_WIDTH-1:0] from_network_bridge_tuser,
    input from_network_bridge_tlast,
    // AXIS interface to RPN LAN interfaces
    output to_rpn_LAN_TX_tvalid,
    input to_rpn_LAN_TX_tready,
    output [AXIS_DATA_WIDTH-1:0] to_rpn_LAN_TX_tdata,
    output [AXIS_KEEP_WIDTH-1:0] to_rpn_LAN_TX_tkeep,
    output [IP_PORT_WIDTH-1:0] to_rpn_LAN_TX_tid,
    output [IP_PORT_WIDTH-1:0] to_rpn_LAN_TX_tdest,
    output [IP_ADDRESS_WIDTH-1:0] to_rpn_LAN_TX_tuser,
    output to_rpn_LAN_TX_tlast,
    // AXIS interface to RPN WAN interfaces
    output to_rpn_WAN_RX_tvalid,
    input to_rpn_WAN_RX_tready,
    output [AXIS_DATA_WIDTH-1:0] to_rpn_WAN_RX_tdata,
    output [AXIS_KEEP_WIDTH-1:0] to_rpn_WAN_RX_tkeep,
    output [IP_PORT_WIDTH-1:0] to_rpn_WAN_RX_tid,
    output [IP_PORT_WIDTH-1:0] to_rpn_WAN_RX_tdest,
    output [IP_ADDRESS_WIDTH-1:0] to_rpn_WAN_RX_tuser,
    output to_rpn_WAN_RX_tlast
);

    // Message Offsets
    `include "ctrl_api_reliability_message_parameters.vh"

    // Declarations
    logic [RPN_MSG_TYPE_WIDTH-1:0] w_from_nb_msg_type;

    // Assignments
    assign w_from_nb_msg_type = from_network_bridge_tdata[RPN_MSG_TYPE_WIDTH-1:0];
    assign w_go_to_rpn_WAN_RX = (w_from_nb_msg_type == RPN_MSG_TYPE_WAN_PUB
                              || w_from_nb_msg_type == RPN_MSG_TYPE_WAN_SEQ_NUM_CHECK) ? 1 : 0;
    // Both interfaces are the same, just set TVALID and TREADY based on message type
    // Outbound module should only be receiving PUBREC and PUBCOMP. Inbound module should only receive PUB and PUBREL
    // AXIS interface from network bridge
    always_comb begin
        from_network_bridge_tready = 0;
        if (w_from_nb_msg_type == RPN_MSG_TYPE_WAN_PUB
         || w_from_nb_msg_type == RPN_MSG_TYPE_WAN_SEQ_NUM_CHECK)
            from_network_bridge_tready = to_rpn_WAN_RX_tready;
        else
            from_network_bridge_tready = to_rpn_LAN_TX_tready;
    end
    // AXIS interface to RPN LAN TX
    assign to_rpn_LAN_TX_tvalid = (w_go_to_rpn_WAN_RX == 0) ? from_network_bridge_tvalid : 0;
    assign to_rpn_LAN_TX_tdata = from_network_bridge_tdata;
    assign to_rpn_LAN_TX_tkeep = from_network_bridge_tkeep;
    assign to_rpn_LAN_TX_tid = from_network_bridge_tid;
    assign to_rpn_LAN_TX_tdest = from_network_bridge_tdest;
    assign to_rpn_LAN_TX_tuser = from_network_bridge_tuser;
    assign to_rpn_LAN_TX_tlast = from_network_bridge_tlast;
    // AXIS interface to RPN WAN RX
    assign to_rpn_WAN_RX_tvalid = (w_go_to_rpn_WAN_RX == 1) ? from_network_bridge_tvalid : 0;
    assign to_rpn_WAN_RX_tdata = from_network_bridge_tdata;
    assign to_rpn_WAN_RX_tkeep = from_network_bridge_tkeep;
    assign to_rpn_WAN_RX_tid = from_network_bridge_tid;
    assign to_rpn_WAN_RX_tdest = from_network_bridge_tdest;
    assign to_rpn_WAN_RX_tuser = from_network_bridge_tuser;
    assign to_rpn_WAN_RX_tlast = from_network_bridge_tlast;
endmodule