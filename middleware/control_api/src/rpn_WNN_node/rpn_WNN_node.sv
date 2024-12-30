module rpn_WNN_node #(
    parameter ACK_TIMEOUT = 1800, // Number of cycles we wait for ACK before resending PUB
    parameter SEQ_NUM_REPLY_TIMEOUT = 1800, // Number of cycles we wait for Sequence Number Reply before resending request
    `include "ctrl_api_reliability_header_parameters.vh"
    `include "ctrl_api_header_parameters.vh"
) (
    input i_clk,
    input i_ap_rst_n,
    input [NODE_ID_WIDTH-1:0] i_node_id,
    input [NODE_ID_WIDTH-1:0] i_WAN_number_node_id, // ID of the WAN number node
    input [IP_ADDRESS_WIDTH-1:0] i_WAN_number_node_ip_addr, // IP address of the node holding the WAN sequence numbers
    input [IP_PORT_WIDTH-1:0] i_KIP_port_number,
    // AXI-Stream interface from reliability nodes. They only send the message type that they want to send, this kernel takes care of the rest
    input from_rpn_tvalid,
    output wire from_rpn_tready,
    input [RPN_MSG_TYPE_WIDTH-1:0] from_rpn_tdata, // Represents the message they want to send
    input [AXIS_WAN_TDEST_WIDTH-1:0] from_rpn_tdest, // Represents the target cluster ID
    // AXI-Stream interface from Network Bridge
    input from_nb_tvalid,
    output logic from_nb_tready,
    input [AXIS_DATA_WIDTH-1:0] from_nb_tdata,
    input [AXIS_KEEP_WIDTH-1:0] from_nb_tkeep,
    input [AXIS_FROM_NB_TDEST_WIDTH-1:0] from_nb_tid,
    input [AXIS_FROM_NB_TDEST_WIDTH-1:0] from_nb_tdest,
    input [AXIS_FROM_NB_TUSER_WIDTH-1:0] from_nb_tuser,
    input from_nb_tlast,
    // AXI-Stream to Network Bridge KIP Interface
    output to_nb_KIP_tvalid,
    input to_nb_KIP_tready,
    output [AXIS_DATA_WIDTH-1:0] to_nb_KIP_tdata,
    output [AXIS_KEEP_WIDTH-1:0] to_nb_KIP_tkeep,
    output [AXIS_KIP_TUSER_WIDTH-1:0] to_nb_KIP_tuser,
    output to_nb_KIP_tlast,
    // AXI-Stream to RPN Interface
    output to_rpn_tvalid,
    input to_rpn_tready,
    output [WAN_SEQUENCE_NUMBER_WIDTH-1:0] to_rpn_tdata, // Sequence number
    output logic [WAN_NUM_TDEST_WIDTH-1:0] to_rpn_tdest, // CTDEST
    output to_rpn_tuser // Lock
);

    // Parameters
    localparam STATE_INIT = 0; 
    localparam STATE_SEND_SEQ_NUM_REQ_TO_KIP = 1;
    localparam STATE_WAIT_SEQ_NUM_REPLY_FROM_NETWORK_BRIDGE = 2;
    // Used for normal operation
    localparam STATE_IDLE = 3;
    localparam STATE_SEND_PUB_TO_KIP = 4;
    localparam STATE_WAIT_ACK_FROM_NETWORK_BRIDGE = 5;
    localparam STATE_SEND_SEQ_NUM_TO_RPN = 6;



    // Message Offsets
    `include "ctrl_api_reliability_message_parameters.vh"
    `include "ctrl_api_message_parameters.vh"
    // Other
    localparam SEQ_NUM_REPLY_TIMER_WIDTH = $clog2(SEQ_NUM_REPLY_TIMEOUT);
    localparam ACK_TIMER_WIDTH = $clog2(ACK_TIMEOUT);

    // Declarations
    logic [4:0] r_core_state;
    logic [4:0] w_next_core_state;
    // Metadata about each transaction in normal operation
    logic [ACK_TIMER_WIDTH-1:0] r_ACK_num_cycles_waited; // Used to trigger timeouts
    logic [ACK_TIMER_WIDTH-1:0] w_ACK_num_cycles_waited;
    logic [SEQ_NUM_REPLY_TIMER_WIDTH-1:0] r_REPLY_num_cycles_waited; // Used to trigger timeouts
    logic [SEQ_NUM_REPLY_TIMER_WIDTH-1:0] w_REPLY_num_cycles_waited;
    logic [NODE_ID_WIDTH-1:0] r_destination_node_id; // Tracks the destination node of the current transaction
    logic [NODE_ID_WIDTH-1:0] w_destination_node_id;
    logic [WAN_NUM_SEQUENCE_NUMBER_WIDTH-1:0] r_sequence_number; // Tracks the sequence number of the MOST RECENT transaction
    logic [WAN_NUM_SEQUENCE_NUMBER_WIDTH-1:0] w_sequence_number;
    // To KIP Interface
    logic [RPN_MSG_TYPE_WIDTH-1:0] r_request_msg_type; // Tracks the request message currently being sent
    logic [RPN_MSG_TYPE_WIDTH-1:0] w_request_msg_type;
    logic [RPN_MSG_TYPE_WIDTH-1:0] r_expected_reply; // Tracks the request message currently being sent
    logic [RPN_MSG_TYPE_WIDTH-1:0] w_expected_reply;
    logic [AXIS_WAN_TDEST_WIDTH-1:0] r_request_CTDEST; // Tracks the target cluster of the current request
    logic [AXIS_WAN_TDEST_WIDTH-1:0] w_request_CTDEST;
    // Transmit sequence numbers to WAN TX or KIP TX
    logic [WAN_SEQUENCE_NUMBER_WIDTH-1:0] r_WAN_sequence_number; // Tracks the sequence number sent back from the WAN Number node
    logic [WAN_SEQUENCE_NUMBER_WIDTH-1:0] w_WAN_sequence_number;
    logic [AXIS_WAN_TDEST_WIDTH-1:0] r_WAN_CTDEST;
    logic [AXIS_WAN_TDEST_WIDTH-1:0] w_WAN_CTDEST;
    logic r_WAN_sequence_number_lock; // Tracks whether or not the received sequence number is locked
    logic w_WAN_sequence_number_lock;

    // Other
    logic w_correct_ACK_arrived;

    // Assignments
    // From RPN modules
    assign from_rpn_tready = (r_core_state == STATE_IDLE) ? 1 : 0;
    // From Network Bridge interface
    // If ACKs arrive after the transaction is complete, just ignore them
    assign from_nb_tready = (r_core_state == STATE_WAIT_SEQ_NUM_REPLY_FROM_NETWORK_BRIDGE
                          || r_core_state == STATE_IDLE
                          || r_core_state == STATE_WAIT_ACK_FROM_NETWORK_BRIDGE) ? 1 : 0;    
    // to-KIP interface to Network Bridge
    assign to_nb_KIP_tvalid = (r_core_state == STATE_SEND_SEQ_NUM_REQ_TO_KIP
                            || r_core_state == STATE_SEND_PUB_TO_KIP) ? 1 : 0;
    // to-KIP TDATA
    assign to_nb_KIP_tdata[RPN_MSG_TYPE_WIDTH-1:0] = r_request_msg_type;
    assign to_nb_KIP_tdata[GW_KIP_SENDER_NODE_ID_OFFSET+:GW_KIP_SENDER_NODE_ID_WIDTH] = i_node_id;
    assign to_nb_KIP_tdata[GW_KIP_SEQUENCE_NUMBER_OFFSET+:GW_KIP_SEQUENCE_NUMBER_WIDTH] = r_sequence_number;
    assign to_nb_KIP_tdata[GW_KIP_WAN_SEQUENCE_NUMBER_OFFSET+:GW_KIP_WAN_SEQUENCE_NUMBER_WIDTH] = 0;
    assign to_nb_KIP_tdata[GW_KIP_WAN_CTDEST_OFFSET+:GW_KIP_WAN_CTDEST_WIDTH] = r_request_CTDEST;
    assign to_nb_KIP_tdata[AXIS_DATA_WIDTH-1:(GW_KIP_WAN_CTDEST_OFFSET+GW_KIP_WAN_CTDEST_WIDTH)] = 0;
    assign to_nb_KIP_tkeep = 'hFFFFFFFFFFFFFFFF;
    // to-KIP TUSER
    assign to_nb_KIP_tuser[IP_ADDRESS_WIDTH-1:0] = i_WAN_number_node_ip_addr;
    assign to_nb_KIP_tuser[KIP_TUSER_SRC_PORT_OFFSET+:KIP_TUSER_SRC_PORT_WIDTH] = i_KIP_port_number;
    assign to_nb_KIP_tuser[KIP_TUSER_DEST_PORT_OFFSET+:KIP_TUSER_DEST_PORT_WIDTH] = i_KIP_port_number;
    assign to_nb_KIP_tlast = 1;
    // Interface to RPN WAN TX
    assign to_rpn_tvalid = (r_core_state == STATE_SEND_SEQ_NUM_TO_RPN) ? 1 : 0;
    assign to_rpn_tdata[WAN_SEQUENCE_NUMBER_WIDTH-1:0] = r_WAN_sequence_number;
    assign to_rpn_tuser = r_WAN_sequence_number_lock;
    // Destination of reply depends on the original message
    always_comb begin
        to_rpn_tdest = 0;
        case (r_request_msg_type)
            // WAN TX requesting sequence number
            RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_REQUEST: to_rpn_tdest = ID_RPN_WAN_TX;
            // KIP RX checking sequence number
            RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_CHECK: to_rpn_tdest = ID_RPN_KIP_RX;
            // KIP RX releasing sequence number (No reply needed)
            RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_WRITE: to_rpn_tdest = 0;
            // KIP TX requesting sequence number
            RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_REQUEST: to_rpn_tdest = ID_RPN_KIP_TX;
            // LAN RX updating sequence number (No reply needed)
            RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_WRITE: to_rpn_tdest = 0;                    
        endcase
    end
    // Checking if we have received the correct ACK depends on the initial request
    assign w_correct_ACK_arrived = (from_nb_tvalid == 1 
                                 && from_nb_tdata[GW_KIP_SENDER_NODE_ID_OFFSET+:GW_KIP_SENDER_NODE_ID_WIDTH] == i_WAN_number_node_id
                                 && from_nb_tdata[GW_KIP_SEQUENCE_NUMBER_OFFSET+:GW_KIP_SEQUENCE_NUMBER_WIDTH] == r_sequence_number
                                 && from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] == r_expected_reply) ? 1 : 0;

    // Core State FSM
    always_comb begin
        w_next_core_state = STATE_INIT;
        case(r_core_state)
            STATE_INIT: begin
                // When module comes out of reset, get sequence number used to communicate with WAN Num node RX
                w_next_core_state = (i_ap_rst_n == 1) ? STATE_SEND_SEQ_NUM_REQ_TO_KIP : STATE_INIT; 
            end
            STATE_SEND_SEQ_NUM_REQ_TO_KIP: begin
                w_next_core_state = (to_nb_KIP_tready == 1) ? STATE_WAIT_SEQ_NUM_REPLY_FROM_NETWORK_BRIDGE : STATE_SEND_SEQ_NUM_REQ_TO_KIP;
            end
            STATE_WAIT_SEQ_NUM_REPLY_FROM_NETWORK_BRIDGE: begin
                // Case 1: Correct ACK has arrived, core enters normal operation
                // We know it's a correct ACK because no other message/request has been sent from this kernel yet (it was in reset)
                if (from_nb_tvalid == 1 && from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] == r_expected_reply)
                    w_next_core_state = STATE_IDLE;
                // Case 2: Timeout is over, re-transmit
                else if (r_REPLY_num_cycles_waited == SEQ_NUM_REPLY_TIMEOUT)
                    w_next_core_state = STATE_SEND_SEQ_NUM_REQ_TO_KIP;
                // Case 3: No ACK/Wrong ACK/leftover SEQ NUM REPLY arrive, ignore
                else
                    w_next_core_state = STATE_WAIT_SEQ_NUM_REPLY_FROM_NETWORK_BRIDGE;
            end
            STATE_IDLE: begin
                w_next_core_state = (from_rpn_tvalid == 1) ? STATE_SEND_PUB_TO_KIP : STATE_IDLE;
            end
            STATE_SEND_PUB_TO_KIP: begin
                w_next_core_state = (to_nb_KIP_tready == 1) ? STATE_WAIT_ACK_FROM_NETWORK_BRIDGE : STATE_SEND_PUB_TO_KIP;
            end
            STATE_WAIT_ACK_FROM_NETWORK_BRIDGE: begin
                // Case 1: Correct ACK has arrived
                if (w_correct_ACK_arrived == 1) begin  
                    // Case 1A: Sequence number has to be sent to requesting kernel
                    if (r_expected_reply != RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_BRESP
                     && r_expected_reply != RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_BRESP)
                    w_next_core_state = STATE_SEND_SEQ_NUM_TO_RPN;
                    // Case 1B: Requesting kernel performed a write, so no update needed
                    else
                        w_next_core_state = STATE_IDLE;
                end
                // Case 2: Timeout is over, re-transmit
                else if (r_ACK_num_cycles_waited == ACK_TIMEOUT)
                    w_next_core_state = STATE_SEND_PUB_TO_KIP;
                // Case 3: No ACK/Wrong ACK/leftover SEQ NUM REPLY arrive, ignore
                else
                    w_next_core_state = STATE_WAIT_ACK_FROM_NETWORK_BRIDGE;
            end
            STATE_SEND_SEQ_NUM_TO_RPN: begin
                w_next_core_state = (to_rpn_tready == 1) ? STATE_IDLE: STATE_SEND_SEQ_NUM_TO_RPN;
            end
        endcase
    end
    always_ff @(posedge i_clk, negedge i_ap_rst_n) begin
        if (i_ap_rst_n == 0) begin
            r_core_state <= STATE_INIT;
        end
        else begin
            r_core_state <= w_next_core_state;
        end
    end

    // Set message type for current transaction
    // When message type has been determined, also set the expected reply type
    always_comb begin
        // Case 1: Getting initial sequence number
        if (r_core_state == STATE_INIT) begin
            w_request_msg_type = RPN_MSG_TYPE_WAN_NUM_SEQ_NUM_CHECK;
            w_expected_reply = RPN_MSG_TYPE_WAN_NUM_SEQ_NUM_REPLY;
            w_request_CTDEST = 0;
        end
        // Case 2: Normal operation
        else if (r_core_state == STATE_IDLE) begin
            if (from_rpn_tvalid == 1) begin
                w_request_msg_type = from_rpn_tdata[RPN_MSG_TYPE_WIDTH-1:0];
                case (from_rpn_tdata[RPN_MSG_TYPE_WIDTH-1:0])
                    // WAN TX requesting sequence number
                    RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_REQUEST: w_expected_reply = RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_REPLY;
                    // KIP RX checking sequence number
                    RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_CHECK: w_expected_reply = RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_RDATA; 
                    // KIP RX releasing sequence number
                    RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_WRITE: w_expected_reply = RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_BRESP;
                    // KIP TX requesting sequence number
                    RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_REQUEST: w_expected_reply = RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_REPLY;
                    // LAN RX updating sequence number
                    RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_WRITE: w_expected_reply = RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_BRESP;                    
                endcase
                w_request_CTDEST = from_rpn_tdest;
            end
            // Only reset to-KIP channel in IDLE. This way, we can re-transmit without having to re-write the data
            else begin
                w_request_msg_type = 0;
                w_expected_reply = 0;
                w_request_CTDEST = 0;
            end
        end
        else begin
            w_request_msg_type = r_request_msg_type;
            w_expected_reply = r_expected_reply;
            w_request_CTDEST = r_request_CTDEST;
        end
    end
    always_ff @(posedge i_clk, negedge i_ap_rst_n) begin
        if (i_ap_rst_n == 0) begin
            r_request_msg_type <= 0;
            r_expected_reply <= 0;
            r_request_CTDEST <= 0;
        end
        else begin
            r_request_msg_type <= w_request_msg_type;
            r_expected_reply <= w_expected_reply;
            r_request_CTDEST <= w_request_CTDEST;
        end
    end

    // When a sequence number request is sent from WAN TX or KIP TX, read the reply
    always_comb begin
        // Reset in IDLE
        if (r_core_state == STATE_IDLE) begin
            w_WAN_sequence_number = 0;
            w_WAN_CTDEST = 0;
            w_WAN_sequence_number_lock = 0;
        end
        else if (r_core_state == STATE_WAIT_ACK_FROM_NETWORK_BRIDGE
         && w_correct_ACK_arrived == 1) begin
            w_WAN_sequence_number = from_nb_tdata[GW_KIP_WAN_SEQUENCE_NUMBER_OFFSET+:GW_KIP_WAN_SEQUENCE_NUMBER_WIDTH];
            w_WAN_CTDEST = from_nb_tdata[GW_KIP_WAN_CTDEST_OFFSET+:GW_KIP_WAN_CTDEST_WIDTH];
            w_WAN_sequence_number_lock = from_nb_tdata[GW_KIP_WAN_LOCK_OFFSET];
        end
        else begin
            w_WAN_sequence_number = r_WAN_sequence_number;
            w_WAN_sequence_number_lock = r_WAN_sequence_number_lock;
            w_WAN_CTDEST = r_WAN_CTDEST;
        end
    end
    always_ff @(posedge i_clk, negedge i_ap_rst_n) begin
        if (i_ap_rst_n == 0) begin
            r_WAN_sequence_number <= 0;
            r_WAN_sequence_number_lock <= 0;
            r_WAN_CTDEST <= 0;
        end
        else begin
            r_WAN_sequence_number <= w_WAN_sequence_number;
            r_WAN_sequence_number_lock <= w_WAN_sequence_number_lock;
            r_WAN_CTDEST <= w_WAN_CTDEST;
        end
    end

    // Since this module only sends messages to the WAN Num Node's RX module, only 1 sequence number needs to be tracked
    always_comb begin
        // Get initial sequence number
        if (r_core_state == STATE_WAIT_SEQ_NUM_REPLY_FROM_NETWORK_BRIDGE
         && from_nb_tvalid == 1)
            w_sequence_number = from_nb_tdata[GW_KIP_SEQUENCE_NUMBER_OFFSET+:GW_KIP_SEQUENCE_NUMBER_WIDTH];
        // During normal operation, increment sequence number for every new transaction
        else if (r_core_state == STATE_IDLE && from_rpn_tvalid == 1)
            // This is the sequence number of the most recent transaction, so we need to increment it before sending it
            w_sequence_number = r_sequence_number + 1;
        else
            w_sequence_number = r_sequence_number;
    end
    always_ff @(posedge i_clk, negedge i_ap_rst_n) begin
        if (i_ap_rst_n == 0) begin
            r_sequence_number <= 0;
        end
        else begin
            r_sequence_number <= w_sequence_number;
        end
    end

    // PUB packets are re-sent if ACKs are not received in an adequate amount of time. This time is specified based on ACK_TIMEOUT (in cycles)
    always_comb begin
        // Only used when waiting for ACKs, nowhere else
        if (r_core_state == STATE_WAIT_ACK_FROM_NETWORK_BRIDGE) begin
            if (r_ACK_num_cycles_waited == ACK_TIMEOUT)
                w_ACK_num_cycles_waited = 0;
            else
                w_ACK_num_cycles_waited = r_ACK_num_cycles_waited + 1;
        end
        // Not used anywhere else
        else begin
            w_ACK_num_cycles_waited = 0;
        end
    end
    always_ff @(posedge i_clk, negedge i_ap_rst_n) begin
        if (i_ap_rst_n == 0) begin
            r_ACK_num_cycles_waited <= 0;
        end
        else begin
            r_ACK_num_cycles_waited <= w_ACK_num_cycles_waited;
        end
    end

    // SEQ NUM REQUEST packets are re-sent if REPLIES are not received in an adequate amount of time. This time is specified based on SEQUENCE_NUMBER_REPLY_TIMEOUT (in cycles)
    always_comb begin
        // Only used when waiting for SEQ NUM REPLIES, nowhere else
        if (r_core_state == STATE_WAIT_SEQ_NUM_REPLY_FROM_NETWORK_BRIDGE) begin
            if (r_REPLY_num_cycles_waited == SEQ_NUM_REPLY_TIMEOUT)
                w_REPLY_num_cycles_waited = 0;
            else
                w_REPLY_num_cycles_waited = r_REPLY_num_cycles_waited + 1;
        end
        // Not used anywhere else
        else begin
            w_REPLY_num_cycles_waited = 0;
        end
    end
    always_ff @(posedge i_clk, negedge i_ap_rst_n) begin
        if (i_ap_rst_n == 0) begin
            r_REPLY_num_cycles_waited <= 0;
        end
        else begin
            r_REPLY_num_cycles_waited <= w_REPLY_num_cycles_waited;
        end
    end
endmodule