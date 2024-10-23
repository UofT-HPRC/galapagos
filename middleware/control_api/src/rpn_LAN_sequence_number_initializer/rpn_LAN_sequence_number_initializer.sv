module rpn_LAN_sequence_number_initializer #(
    parameter NUM_FPGA_NODES = 256, // Number of FPGA nodes in this cluster, must be sequential starting from 1
    parameter SEQUENCE_NUMBER_REPLY_TIMEOUT = 1800, // Number of cycles we wait for SEQ_NUM_REPLY before resending SEQ_NUM_REQUEST
    `include "ctrl_api_reliability_header_parameters.vh"
    `include "ctrl_api_header_parameters.vh"
) (
    input i_clk,
    input i_ap_rst_n,
    output wire o_sequence_numbers_initialized,
    input [NODE_ID_WIDTH-1:0] i_node_id,
    // AXI-Stream interface from Network Bridge
    input from_nb_tvalid,
    output logic from_nb_tready,
    input [AXIS_DATA_WIDTH-1:0] from_nb_tdata,
    input [AXIS_KEEP_WIDTH-1:0] from_nb_tkeep,
    input [AXIS_FROM_NB_TDEST_WIDTH-1:0] from_nb_tid,
    input [AXIS_FROM_NB_TDEST_WIDTH-1:0] from_nb_tdest,
    input [AXIS_FROM_NB_TUSER_WIDTH-1:0] from_nb_tuser,
    input from_nb_tlast,
    // AXI-Stream to Network Bridge LAN Interface
    output to_nb_LAN_tvalid,
    input to_nb_LAN_tready,
    output [AXIS_DATA_WIDTH-1:0] to_nb_LAN_tdata,
    output [AXIS_KEEP_WIDTH-1:0] to_nb_LAN_tkeep,
    output [AXIS_LAN_TDEST_WIDTH-1:0] to_nb_LAN_tid,
    output [AXIS_LAN_TDEST_WIDTH-1:0] to_nb_LAN_tdest,
    output [AXIS_LAN_TUSER_WIDTH-1:0] to_nb_LAN_tuser,
    output to_nb_LAN_tlast,
    // BRAM connection for converting between node and kernel number
    output wire node_to_kernel_ROM_CLK, 
    output wire node_to_kernel_ROM_RST,
    output logic node_to_kernel_ROM_EN,
    output logic [BRAM_ADDR_WIDTH-1:0] node_to_kernel_ROM_ADDR,
    input [AXIS_LAN_TDEST_WIDTH-1:0] node_to_kernel_ROM_DOUT,
    // // BRAM connection for converting between node and sequence number
    output wire node_to_LAN_seq_num_BRAM_CLK, 
    output wire node_to_LAN_seq_num_BRAM_RST,
    output logic node_to_LAN_seq_num_BRAM_EN,
    output logic [BRAM_ADDR_WIDTH-1:0] node_to_LAN_seq_num_BRAM_ADDR,
    input [AXIS_LAN_TDEST_WIDTH-1:0] node_to_LAN_seq_num_BRAM_DOUT,
    output logic [BRAM_WEN_WIDTH-1:0] node_to_LAN_seq_num_BRAM_WEN,
    output logic [LAN_SEQUENCE_NUMBER_WIDTH-1:0] node_to_LAN_seq_num_BRAM_DIN
);

    // Parameters
    localparam STATE_IDLE = 0;
    // Used for getting initial sequence numbers
    localparam STATE_GET_TDEST = 1; // LAN routing uses kernel ID, not node ID, so pick a kernel on the target node
    localparam STATE_SEND_SEQ_NUM_REQ_TO_LAN = 2;
    localparam STATE_WAIT_SEQ_NUM_REPLY_FROM_NETWORK_BRIDGE = 3;
    localparam STATE_COMPLETE = 4; // All sequence numbers have been initialized

    // Message Offsets
    `include "ctrl_api_reliability_message_parameters.vh"
    `include "ctrl_api_message_parameters.vh"
    // Other
    localparam SEQ_NUM_REPLY_TIMER_WIDTH = $clog2(SEQUENCE_NUMBER_REPLY_TIMEOUT);
    localparam NUM_SEQ_NUMBERS_RECVD_WIDTH = $clog2(NUM_FPGA_NODES);

    // Declarations
    logic [4:0] r_core_state;
    logic [4:0] w_next_core_state;
    logic [255:0] w_to_decoder_input; // Used for decoding one-hot values
    logic [255:0] w_to_resend_decoder_input; // Used for decoding one-hot values
    // Metadata for getting initial sequence numbers
    logic [SEQ_NUM_REPLY_TIMER_WIDTH-1:0] r_REPLY_num_cycles_waited; // Used to trigger timeouts
    logic [SEQ_NUM_REPLY_TIMER_WIDTH-1:0] w_REPLY_num_cycles_waited;
    logic [NUM_FPGA_NODES-1:0] r_LAN_seq_num_outstanding; // One-hot encoding, Bit i = 1 means node i has NOT returned the sequence number
    logic [NUM_FPGA_NODES-1:0] w_LAN_seq_num_outstanding; 
    logic [NUM_SEQ_NUMBERS_RECVD_WIDTH-1:0] r_num_seq_num_outstanding; // Stores the number of nodes from which we are still awaiting replies
    logic [NUM_SEQ_NUMBERS_RECVD_WIDTH-1:0] w_num_seq_num_outstanding;
    logic [NUM_FPGA_NODES-1:0] w_received_sequence_number_mask; // Used to update LAN_seq_num_outstanding when a reply has arrived from a node
    // Metadata used for transmitting/re-transmitting sequence number requests
    logic [NUM_FPGA_NODES-1:0] r_LAN_nodes_to_target; // Tracks which nodes to send requests to each round, same format as LAN_seq_num_outstanding
    logic [NUM_FPGA_NODES-1:0] w_LAN_nodes_to_target;
    logic [NUM_SEQ_NUMBERS_RECVD_WIDTH-1:0] r_num_req_to_send_this_round; // Stores the number of nodes to which we need to send requests this round
    logic [NUM_SEQ_NUMBERS_RECVD_WIDTH-1:0] w_num_req_to_send_this_round;
    logic [NUM_FPGA_NODES-1:0] w_LAN_nodes_to_target_mask; // Used to update LAN_nodes_to_target when a request has been sent to that node
    logic [NODE_ID_WIDTH-1:0] r_current_node_id;
    logic [NUM_FPGA_NODES-1:0] w_next_node_one_hot;
    logic [NODE_ID_WIDTH-1:0] w_next_node_to_send_req;
    logic [NUM_FPGA_NODES-1:0] w_LAN_sno_shifted_to_sender; // Shifts LAN_seq_num_outstanding vector to the current reply's sender
    logic w_received_reply_is_retransmission;
    logic [NUM_FPGA_NODES-1:0] w_first_node_to_resend_one_hot;
    logic [NODE_ID_WIDTH-1:0] w_first_node_to_resend_req;
    // To Network Bridge LAN Interface
    logic [AXIS_LAN_TDEST_WIDTH-1:0] r_to_nb_LAN_tdest;
    logic [AXIS_LAN_TDEST_WIDTH-1:0] w_to_nb_LAN_tdest;
    // Other
    logic [NODE_ID_WIDTH-1:0] w_from_nb_sender_node_id;
    logic [BRAM_ADDR_WIDTH-1:0] w_node_to_kernel_ROM_addr;
    
    // Assignments
    assign o_sequence_numbers_initialized = (r_core_state == STATE_COMPLETE) ? 1 : 0; // Tell LAN_TX we're done
    // Transmitting sequence number requests
    assign w_next_node_one_hot = w_LAN_nodes_to_target & ~(w_LAN_nodes_to_target-1); // Represents the node ID that hasn't been received yet
    assign w_LAN_nodes_to_target_mask = ~(1 << (r_current_node_id-1));
    // Decoding the next node from one-hot to binary
    assign w_to_decoder_input[NUM_FPGA_NODES-1:0] = w_next_node_one_hot[NUM_FPGA_NODES-1:0];
    generate
        if (NUM_FPGA_NODES < 256)
            assign w_to_decoder_input[255:NUM_FPGA_NODES] = 0; 
    endgenerate
    // Retransmitting sequence number requests
    // This will only ever be used in the cycle right before re-transmission is due to begin, setting the first node ID to access. Therefore, we need the most recent version of LAN_sequence_number_outstanding, before it gets written to r_LAN_nodes_to_target
    assign w_first_node_to_resend_one_hot = w_LAN_seq_num_outstanding & ~(w_LAN_seq_num_outstanding-1);
    // Decoding the next node from one-hot to binary
    assign w_to_resend_decoder_input[NUM_FPGA_NODES-1:0] = w_first_node_to_resend_one_hot[NUM_FPGA_NODES-1:0];
    generate
        if (NUM_FPGA_NODES < 256)
            assign w_to_resend_decoder_input[255:NUM_FPGA_NODES] = 0; 
    endgenerate
    // To check if the received reply is a retransmission, simply check if that node's reply is still outstanding
    assign w_LAN_sno_shifted_to_sender = (r_LAN_seq_num_outstanding >> (w_from_nb_sender_node_id-1));
    assign w_received_reply_is_retransmission = ~(w_LAN_sno_shifted_to_sender[0]);
    assign w_received_sequence_number_mask = ~(1 << (w_from_nb_sender_node_id-1));

    // From Network Bridge interface
    // If ACKs arrive after the transaction is complete, just ignore them
    assign from_nb_tready = (r_core_state == STATE_WAIT_SEQ_NUM_REPLY_FROM_NETWORK_BRIDGE
                          || r_core_state == STATE_COMPLETE) ? 1 : 0;
    assign w_from_nb_sender_node_id = from_nb_tdata[LAN_ACK_SENDER_NODE_ID_OFFSET+:LAN_ACK_SENDER_NODE_ID_WIDTH];
    
    // to-LAN interface to Network Bridge
    assign to_nb_LAN_tvalid = (r_core_state == STATE_SEND_SEQ_NUM_REQ_TO_LAN) ? 1 : 0;
    // to-LAN TDATA
    assign to_nb_LAN_tdata[RPN_MSG_TYPE_WIDTH-1:0] = RPN_MSG_TYPE_LAN_SEQ_NUM_CHECK;
    assign to_nb_LAN_tdata[PUB_LAN_SENDER_NODE_ID_OFFSET+:PUB_LAN_SENDER_NODE_ID_WIDTH] = i_node_id;
    assign to_nb_LAN_tdata[AXIS_DATA_WIDTH-1:(PUB_LAN_SENDER_NODE_ID_OFFSET+PUB_LAN_SENDER_NODE_ID_WIDTH)] = 0; // No other fields are used for sequence number requests
    assign to_nb_LAN_tkeep = 'hFFFFFFFFFFFFFFFF;
    assign to_nb_LAN_tid = i_node_id; // Doesn't matter, LAN RX will send message back using KIP
    assign to_nb_LAN_tdest = r_to_nb_LAN_tdest;
    assign to_nb_LAN_tuser = 1; // Indicates this is a control packet
    assign to_nb_LAN_tlast = 1;
    
    // BRAM connection for converting between node and kernel
    assign node_to_kernel_ROM_CLK = i_clk; 
    assign node_to_kernel_ROM_RST = ~i_ap_rst_n;
    // Kernel to Node BRAM Enable
    always_comb begin
        node_to_kernel_ROM_EN = 0;
        // Case 1: First node to read
        if (r_core_state == STATE_IDLE && i_ap_rst_n != 0)
            node_to_kernel_ROM_EN = 1;
        // Case 2: Just transmitted a SEQ NUM REQUEST, and need to transmit another
        else if (r_core_state == STATE_SEND_SEQ_NUM_REQ_TO_LAN 
              && to_nb_LAN_tready == 1
              && r_num_req_to_send_this_round != 0)
            node_to_kernel_ROM_EN = 1;
        // Case 3: Waited for a timeout, now we need to send another round of SEQ NUM REQUESTs
        else if (r_core_state == STATE_WAIT_SEQ_NUM_REPLY_FROM_NETWORK_BRIDGE
                && r_REPLY_num_cycles_waited == SEQUENCE_NUMBER_REPLY_TIMEOUT)
            node_to_kernel_ROM_EN = 1;
        else
            node_to_kernel_ROM_EN = 0;
    end
    // Kernel to Node BRAM Address
    // Address is byte-addressable, therefore entry 1 = 0x4, entry 2 = 0x8, etc
    // This corresponds to a bit-shift left by 2
    assign node_to_kernel_ROM_ADDR[1:0] = 0;
    assign node_to_kernel_ROM_ADDR[BRAM_ADDR_WIDTH-1:NODE_ID_WIDTH+2] = 0;
    always_comb begin
        node_to_kernel_ROM_ADDR[NODE_ID_WIDTH+1:2] = 0;
        // Case 1: First node to read
        if (r_core_state == STATE_IDLE && i_ap_rst_n != 0)
            node_to_kernel_ROM_ADDR[NODE_ID_WIDTH+1:2] = w_next_node_to_send_req;
        // Case 2: Just transmitted a SEQ NUM REQUEST, and need to transmit another
        else if (r_core_state == STATE_SEND_SEQ_NUM_REQ_TO_LAN 
              && to_nb_LAN_tready == 1
              && r_num_req_to_send_this_round != 0)
            node_to_kernel_ROM_ADDR[NODE_ID_WIDTH+1:2] = w_next_node_to_send_req;
        // Case 3: Waited for a timeout, now we need to send another round of SEQ NUM REQUESTs
        else if (r_core_state == STATE_WAIT_SEQ_NUM_REPLY_FROM_NETWORK_BRIDGE
              && r_REPLY_num_cycles_waited == SEQUENCE_NUMBER_REPLY_TIMEOUT)
            // In this case, next_node_to_send_req has not yet been updated
            node_to_kernel_ROM_ADDR[NODE_ID_WIDTH+1:2] = w_first_node_to_resend_req;
        else
            node_to_kernel_ROM_ADDR[NODE_ID_WIDTH+1:2] = 0;
    end
    
    // BRAM connection to Sequence Number BRAM (stores the sequence number for the MOST RECENT transaction)
    assign node_to_LAN_seq_num_BRAM_CLK = i_clk;
    assign node_to_LAN_seq_num_BRAM_RST = ~i_ap_rst_n;
    // Node to Sequence Number BRAM Enable
    always_comb begin
        node_to_LAN_seq_num_BRAM_EN = 0;
        // When getting initial sequence numbers, write sequence numbers as they come in
        if (r_core_state == STATE_WAIT_SEQ_NUM_REPLY_FROM_NETWORK_BRIDGE
            && from_nb_tvalid == 1
            && w_received_reply_is_retransmission == 0)
            node_to_LAN_seq_num_BRAM_EN = 1;
        else
            node_to_LAN_seq_num_BRAM_EN = 0;
    end    
    // Node to Sequence Number BRAM Address
    // Address is byte-addressable, therefore entry 1 = 0x4, entry 2 = 0x8, etc
    // This works out to a bit shift left by 2
    assign node_to_LAN_seq_num_BRAM_ADDR[BRAM_ADDR_WIDTH-1:NODE_ID_WIDTH+2] = 0;
    assign node_to_LAN_seq_num_BRAM_ADDR[NODE_ID_WIDTH+1:2] = from_nb_tdata[LAN_ACK_SENDER_NODE_ID_OFFSET+:LAN_ACK_SENDER_NODE_ID_WIDTH];
    assign node_to_LAN_seq_num_BRAM_ADDR[1:0] = 0;
    // Node to Sequence Number BRAM Write Enable and Data In (stores the sequence number for the MOST RECENT transaction)
    // WEN will always be active when EN is active because this is a write-only operation
    genvar i;
    generate
        for (i = 0; i < BRAM_WEN_WIDTH; i = i + 1)
            assign node_to_LAN_seq_num_BRAM_WEN[i] = node_to_LAN_seq_num_BRAM_EN;
    endgenerate
    assign node_to_LAN_seq_num_BRAM_DIN = from_nb_tdata[LAN_ACK_SEQUENCE_NUMBER_OFFSET+:LAN_ACK_SEQUENCE_NUMBER_WIDTH];

    // Modules
    one_hot_decoder m_next_node_decoder(
        .i_one_hot(w_to_decoder_input),
        .o_binary(w_next_node_to_send_req)
    );
    one_hot_decoder m_first_node_to_resend_decoder(
        .i_one_hot(w_to_resend_decoder_input),
        .o_binary(w_first_node_to_resend_req)
    );

    // Core State FSM
    always_comb begin
        w_next_core_state = STATE_IDLE;
        case(r_core_state)
            STATE_IDLE: begin
                w_next_core_state = STATE_GET_TDEST;
            end
            STATE_GET_TDEST: begin
                w_next_core_state = STATE_SEND_SEQ_NUM_REQ_TO_LAN;
            end
            STATE_SEND_SEQ_NUM_REQ_TO_LAN: begin
                if (to_nb_LAN_tready == 1) begin
                    // Case 1: Just sent the last request message in this round of transmissions
                    if (r_num_req_to_send_this_round == 0)
                        w_next_core_state = STATE_WAIT_SEQ_NUM_REPLY_FROM_NETWORK_BRIDGE;
                    // Case 2: Transmit the next request message in this round
                    else
                        w_next_core_state = STATE_GET_TDEST;
                end
                else
                    w_next_core_state = STATE_SEND_SEQ_NUM_REQ_TO_LAN;
            end
            STATE_WAIT_SEQ_NUM_REPLY_FROM_NETWORK_BRIDGE: begin
                // Case 1: The last reply has arrived
                if (from_nb_tvalid == 1
                    && w_num_seq_num_outstanding == 0)
                    w_next_core_state = STATE_COMPLETE;
                // Case 2: Timeout hits
                else if (r_REPLY_num_cycles_waited == SEQUENCE_NUMBER_REPLY_TIMEOUT)
                    w_next_core_state = STATE_GET_TDEST;
                else
                    w_next_core_state = STATE_WAIT_SEQ_NUM_REPLY_FROM_NETWORK_BRIDGE;
            end
            STATE_COMPLETE: begin
                w_next_core_state = STATE_COMPLETE;
            end
        endcase
    end
    always_ff @(posedge i_clk, negedge i_ap_rst_n) begin
        if (i_ap_rst_n == 0) begin
            r_core_state <= STATE_IDLE;
        end
        else begin
            r_core_state <= w_next_core_state;
        end
    end

    // Interface to Network Bridge LAN
    always_comb begin
        w_to_nb_LAN_tdest = (r_core_state == STATE_GET_TDEST) ? node_to_kernel_ROM_DOUT[AXIS_LAN_TDEST_WIDTH-1:0] : r_to_nb_LAN_tdest;
    end
    always_ff @(posedge i_clk, negedge i_ap_rst_n) begin
        if (i_ap_rst_n == 0) begin
            r_to_nb_LAN_tdest <= 0;
        end
        else begin
            r_to_nb_LAN_tdest <= w_to_nb_LAN_tdest;
        end
    end

    // When getting initial sequence numbers, track the number of outstanding requests and from where
    always_comb begin
        // When a SEQ NUM REPLY is received, we must update the number of received sequence numbers
        if (r_core_state == STATE_WAIT_SEQ_NUM_REPLY_FROM_NETWORK_BRIDGE
         && from_nb_tvalid == 1) begin
            w_LAN_seq_num_outstanding = r_LAN_seq_num_outstanding & w_received_sequence_number_mask;
            // Only decrement number of outstanding replies if we have received a new LAN sequence number reply, not a re-transmission
            if (w_received_reply_is_retransmission == 0)
                w_num_seq_num_outstanding = r_num_seq_num_outstanding - 1;
            else
                w_num_seq_num_outstanding = r_num_seq_num_outstanding;
        end
        else begin
            w_LAN_seq_num_outstanding = r_LAN_seq_num_outstanding;
            w_num_seq_num_outstanding = r_num_seq_num_outstanding;
        end
    end
    always_ff @(posedge i_clk, negedge i_ap_rst_n) begin
        if (i_ap_rst_n == 0) begin
            r_LAN_seq_num_outstanding <= 'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
            r_num_seq_num_outstanding <= NUM_FPGA_NODES;
        end
        else begin
            r_LAN_seq_num_outstanding <= w_LAN_seq_num_outstanding;
            r_num_seq_num_outstanding <= w_num_seq_num_outstanding;
        end
    end

    // Transmit and re-transmit the SEQ NUM REQUESTS to get initial sequence numbers
    always_comb begin
        // Case 1: In the process of transmitting, track which nodes we have sent requests to
        if (r_core_state == STATE_GET_TDEST) begin
            w_LAN_nodes_to_target = r_LAN_nodes_to_target & w_LAN_nodes_to_target_mask;
            w_num_req_to_send_this_round = r_num_req_to_send_this_round - 1;
        end
        // Case 2: If we're getting ready to re-transmit, load up the most recent outstanding sequence numbers
        else if (r_core_state == STATE_WAIT_SEQ_NUM_REPLY_FROM_NETWORK_BRIDGE
              && r_REPLY_num_cycles_waited == SEQUENCE_NUMBER_REPLY_TIMEOUT) begin
            // use the wires so that we have the most recent values;
            w_LAN_nodes_to_target = w_LAN_seq_num_outstanding; 
            w_num_req_to_send_this_round = w_num_seq_num_outstanding;
        end
        else begin
            w_LAN_nodes_to_target = r_LAN_nodes_to_target;
            w_num_req_to_send_this_round = r_num_req_to_send_this_round;
        end
    end
    always_ff @(posedge i_clk, negedge i_ap_rst_n) begin
        if (i_ap_rst_n == 0) begin
            // Initial setup is done through the reset
            r_LAN_nodes_to_target <= 'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
            r_num_req_to_send_this_round <= NUM_FPGA_NODES;
        end
        else begin
            r_LAN_nodes_to_target <= w_LAN_nodes_to_target;
            r_num_req_to_send_this_round <= w_num_req_to_send_this_round;
        end
    end

    // While transmitting, track the current node ID we are transmitting to
    always_ff @(posedge i_clk, negedge i_ap_rst_n) begin
        if (i_ap_rst_n == 0) begin
            // Initial setup is done through the reset
            r_current_node_id <= 0;
        end
        else begin
            r_current_node_id <= w_next_node_to_send_req;
        end
    end

    // SEQ NUM REQUEST packets are re-sent if REPLIES are not received in an adequate amount of time. This time is specified based on SEQUENCE_NUMBER_REPLY_TIMEOUT (in cycles)
    always_comb begin
        // Only used when waiting for SEQ NUM REPLIES, nowhere else
        if (r_core_state == STATE_WAIT_SEQ_NUM_REPLY_FROM_NETWORK_BRIDGE) begin
            if (r_REPLY_num_cycles_waited == SEQUENCE_NUMBER_REPLY_TIMEOUT)
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