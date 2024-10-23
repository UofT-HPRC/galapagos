module rpn_LAN_TX #(
    parameter ACK_TIMEOUT = 1800, // Number of cycles we wait for ACK before resending PUB
    `include "ctrl_api_reliability_header_parameters.vh"
    `include "ctrl_api_header_parameters.vh"
) (
    input i_clk,
    input i_ap_rst_n,
    input i_sequence_numbers_initialized, // Sent from sequence number initializer
    input [NODE_ID_WIDTH-1:0] i_node_id,
    // AXI-Stream to-LAN interface from LAN Node Finder
    input from_LAN_node_finder_tvalid,
    output wire from_LAN_node_finder_tready,
    input [AXIS_DATA_WIDTH-1:0] from_LAN_node_finder_tdata,
    input [AXIS_KEEP_WIDTH-1:0] from_LAN_node_finder_tkeep,
    input [AXIS_LAN_TDEST_WIDTH-1:0] from_LAN_node_finder_tid,
    input [AXIS_LAN_TDEST_WIDTH-1:0] from_LAN_node_finder_tdest,
    input [AXIS_LAN_TUSER_WIDTH-1:0] from_LAN_node_finder_tuser,
    input from_LAN_node_finder_tlast,
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
    // BRAM connection for converting between node and sequence number
    output wire node_to_LAN_seq_num_BRAM_CLK, 
    output wire node_to_LAN_seq_num_BRAM_RST,
    output logic node_to_LAN_seq_num_BRAM_EN,
    output logic [BRAM_ADDR_WIDTH-1:0] node_to_LAN_seq_num_BRAM_ADDR,
    input [LAN_SEQUENCE_NUMBER_WIDTH-1:0] node_to_LAN_seq_num_BRAM_DOUT,
    output logic [BRAM_WEN_WIDTH-1:0] node_to_LAN_seq_num_BRAM_WEN,
    output logic [LAN_SEQUENCE_NUMBER_WIDTH-1:0] node_to_LAN_seq_num_BRAM_DIN
);

    // Parameters
    localparam STATE_INIT = 0; // Waiting for Sequence Number Initializer to get sequence numbers
    localparam STATE_IDLE = 1;
    // Used for normal operation
    localparam STATE_GET_SEQUENCE_NUMBER = 2;
    localparam STATE_SEND_PUB_TO_LAN = 3;
    localparam STATE_WAIT_ACK_FROM_NETWORK_BRIDGE = 4;
    // Used for getting initial sequence numbers

    // Message Offsets
    `include "ctrl_api_reliability_message_parameters.vh"
    `include "ctrl_api_message_parameters.vh"
    // Other
    localparam ACK_TIMER_WIDTH = $clog2(ACK_TIMEOUT);

    // Declarations
    logic [4:0] r_core_state;
    logic [4:0] w_next_core_state;
    // Metadata about each transaction in normal operation
    logic [ACK_TIMER_WIDTH-1:0] r_ACK_num_cycles_waited; // Used to trigger timeouts
    logic [ACK_TIMER_WIDTH-1:0] w_ACK_num_cycles_waited;
    logic [NODE_ID_WIDTH-1:0] r_destination_node_id; // Tracks the destination node of the current transaction
    logic [NODE_ID_WIDTH-1:0] w_destination_node_id;
    logic [LAN_SEQUENCE_NUMBER_WIDTH-1:0] r_sequence_number; // Tracks the sequence number of the current transaction
    logic [LAN_SEQUENCE_NUMBER_WIDTH-1:0] w_sequence_number;
    // To Network Bridge LAN Interface
    logic [PUB_LAN_DATA_WIDTH-1:0] r_to_nb_LAN_packet_data; 
    logic [AXIS_KEEP_WIDTH-1:0] r_to_nb_LAN_tkeep;
    logic [AXIS_LAN_TDEST_WIDTH-1:0] r_to_nb_LAN_tid;
    logic [AXIS_LAN_TDEST_WIDTH-1:0] r_to_nb_LAN_tdest;
    logic [PUB_LAN_DATA_WIDTH-1:0] w_to_nb_LAN_packet_data;
    logic [AXIS_KEEP_WIDTH-1:0] w_to_nb_LAN_tkeep;
    logic [AXIS_LAN_TDEST_WIDTH-1:0] w_to_nb_LAN_tid;
    logic [AXIS_LAN_TDEST_WIDTH-1:0] w_to_nb_LAN_tdest;
    // Other
    logic w_correct_ACK_arrived;

    // Assignments
    assign w_correct_ACK_arrived = (from_nb_tvalid == 1 
                                 && from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] == RPN_MSG_TYPE_LAN_ACK
                                 && from_nb_tdata[LAN_ACK_SENDER_NODE_ID_OFFSET+:LAN_ACK_SENDER_NODE_ID_OFFSET] == r_destination_node_id
                                 && from_nb_tdata[LAN_ACK_SEQUENCE_NUMBER_OFFSET+:LAN_ACK_SEQUENCE_NUMBER_WIDTH] == r_sequence_number) ? 1 : 0;
    // From LAN node finder
    assign from_LAN_node_finder_tready = (r_core_state == STATE_IDLE) ? 1 : 0;
    // From Network Bridge interface
    // If ACKs arrive after the transaction is complete, just ignore them
    assign from_nb_tready = (r_core_state == STATE_IDLE
                          || r_core_state == STATE_WAIT_ACK_FROM_NETWORK_BRIDGE) ? 1 : 0;    
    // to-LAN interface to Network Bridge
    assign to_nb_LAN_tvalid = (r_core_state == STATE_SEND_PUB_TO_LAN) ? 1 : 0;
    // to-LAN TDATA
    assign to_nb_LAN_tdata[RPN_MSG_TYPE_WIDTH-1:0] = RPN_MSG_TYPE_LAN_PUB;
    assign to_nb_LAN_tdata[PUB_LAN_SENDER_NODE_ID_OFFSET+:PUB_LAN_SENDER_NODE_ID_WIDTH] = i_node_id;
    assign to_nb_LAN_tdata[PUB_LAN_SEQUENCE_NUMBER_OFFSET+:PUB_LAN_SEQUENCE_NUMBER_WIDTH] = r_sequence_number;
    assign to_nb_LAN_tdata[PUB_LAN_FWD_CTID_OFFSET+:PUB_LAN_FWD_CTID_OFFSET] = 0; // Only used for forwarded LAN messages
    assign to_nb_LAN_tdata[PUB_LAN_FWD_WAN_SEQ_NUM_OFFSET+:PUB_LAN_FWD_WAN_SEQ_NUM_WIDTH] = 0; // Only used for forwarded LAN messages
    assign to_nb_LAN_tdata[PUB_LAN_DATA_OFFSET+:PUB_LAN_DATA_WIDTH] = r_to_nb_LAN_packet_data;
    assign to_nb_LAN_tkeep = r_to_nb_LAN_tkeep;
    assign to_nb_LAN_tid = r_to_nb_LAN_tid;
    assign to_nb_LAN_tdest = r_to_nb_LAN_tdest;
    assign to_nb_LAN_tuser = 1; // Indicates this is a control packet
    assign to_nb_LAN_tlast = 1;    
    // BRAM connection to Sequence Number BRAM (stores the sequence number for the MOST RECENT transaction)
    assign node_to_LAN_seq_num_BRAM_CLK = i_clk;
    assign node_to_LAN_seq_num_BRAM_RST = ~i_ap_rst_n;
    // Node to Sequence Number BRAM Enable
    always_comb begin
        node_to_LAN_seq_num_BRAM_EN = 0;
        // Case 1: New packet has arrived, read sequence number
        if (r_core_state == STATE_IDLE && from_LAN_node_finder_tvalid == 1)
            node_to_LAN_seq_num_BRAM_EN = 1;
        // Case 2: Acknowledgement was received, write most recent sequence number back to BRAM
        else if (r_core_state == STATE_WAIT_ACK_FROM_NETWORK_BRIDGE && w_correct_ACK_arrived == 1)
            node_to_LAN_seq_num_BRAM_EN = 1;
        else
            node_to_LAN_seq_num_BRAM_EN = 0;
    end
    // Node to Sequence Number BRAM Address
    // Address is byte-addressable, therefore entry 1 = 0x4, entry 2 = 0x8, etc
    // This works out to a bit shift left by 2
    assign node_to_LAN_seq_num_BRAM_ADDR[BRAM_ADDR_WIDTH-1:NODE_ID_WIDTH+2] = 0;
    assign node_to_LAN_seq_num_BRAM_ADDR[1:0] = 0;
    always_comb begin
        node_to_LAN_seq_num_BRAM_ADDR[NODE_ID_WIDTH+1:2] = 0;
        // Case 1: Starting a new transaction
        if (r_core_state == STATE_IDLE)
            node_to_LAN_seq_num_BRAM_ADDR[NODE_ID_WIDTH+1:2] = from_LAN_node_finder_tuser[NODE_ID_WIDTH-1:0];
        // Case 2: Writing new sequence number after transaction is complete
        else
            node_to_LAN_seq_num_BRAM_ADDR[NODE_ID_WIDTH+1:2] = r_destination_node_id;
    end
    // Node to Sequence Number BRAM Write Enable and Data In (stores the sequence number for the MOST RECENT transaction)
    always_comb begin
        node_to_LAN_seq_num_BRAM_WEN = 0;
        node_to_LAN_seq_num_BRAM_DIN = 0;
        // Write new sequence number in after transaction is complete
        if (r_core_state == STATE_WAIT_ACK_FROM_NETWORK_BRIDGE
         && w_correct_ACK_arrived == 1) begin
            node_to_LAN_seq_num_BRAM_WEN = 'hF;
            node_to_LAN_seq_num_BRAM_DIN = r_sequence_number;
        end
        else begin
            node_to_LAN_seq_num_BRAM_WEN = 0;
            node_to_LAN_seq_num_BRAM_DIN = 0;
        end
    end

    // Core State FSM
    always_comb begin
        w_next_core_state = STATE_INIT;
        case(r_core_state)
            STATE_INIT: begin
                // This module only begins working when the initial sequence numbers have been found
                w_next_core_state = (i_sequence_numbers_initialized == 1) ? STATE_IDLE : STATE_INIT; 
            end
            STATE_IDLE: begin
                w_next_core_state = (from_LAN_node_finder_tvalid == 1) ? STATE_GET_SEQUENCE_NUMBER : STATE_IDLE;
            end
            STATE_GET_SEQUENCE_NUMBER: begin
                w_next_core_state = STATE_SEND_PUB_TO_LAN;
            end
            STATE_SEND_PUB_TO_LAN: begin
                w_next_core_state = (to_nb_LAN_tready == 1) ? STATE_WAIT_ACK_FROM_NETWORK_BRIDGE : STATE_SEND_PUB_TO_LAN;
            end
            STATE_WAIT_ACK_FROM_NETWORK_BRIDGE: begin
                // Case 1: Correct ACK has arrived
                if (w_correct_ACK_arrived == 1)
                    w_next_core_state = STATE_IDLE;
                // Case 2: Timeout is over, re-transmit
                else if (r_ACK_num_cycles_waited == ACK_TIMEOUT)
                    w_next_core_state = STATE_SEND_PUB_TO_LAN;
                // Case 3: No ACK/Wrong ACK/leftover SEQ NUM REPLY arrive, ignore
                else
                    w_next_core_state = STATE_WAIT_ACK_FROM_NETWORK_BRIDGE;
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

    // Read destination node ID from the current transaction
    always_comb begin
        if (r_core_state == STATE_IDLE)
            // Read destination when a new transaction comes in
            w_destination_node_id = (from_LAN_node_finder_tvalid == 1) ? from_LAN_node_finder_tuser[NODE_ID_WIDTH-1:0] : 0;
        else
            w_destination_node_id = r_destination_node_id;
    end
    always_ff @(posedge i_clk, negedge i_ap_rst_n) begin
        if (i_ap_rst_n == 0) begin
            r_destination_node_id <= 0;
        end
        else begin
            r_destination_node_id <= w_destination_node_id;
        end
    end

    // Read sequence number for the current transaction
    always_comb begin
        // Reset in IDLE
        if (r_core_state == STATE_IDLE)
            w_sequence_number = 0;
        else if (r_core_state == STATE_GET_SEQUENCE_NUMBER)
            // This is the sequence number of the most recent transaction, so we need to increment it before sending it
            w_sequence_number = node_to_LAN_seq_num_BRAM_DOUT[LAN_SEQUENCE_NUMBER_WIDTH-1:0] + 1;
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

    // Interface to Network Bridge LAN
    always_comb begin
        if (r_core_state == STATE_IDLE) begin
            if (from_LAN_node_finder_tvalid == 1) begin
                w_to_nb_LAN_packet_data = from_LAN_node_finder_tdata[PUB_LAN_DATA_WIDTH-1:0];
                w_to_nb_LAN_tkeep = from_LAN_node_finder_tkeep;
                w_to_nb_LAN_tid = from_LAN_node_finder_tid;
                w_to_nb_LAN_tdest = from_LAN_node_finder_tdest;
            end
            // Only reset to-LAN channel in IDLE. This way, we can re-transmit without having to re-write the data
            else begin
                w_to_nb_LAN_packet_data = 0;
                w_to_nb_LAN_tkeep = 0;
                w_to_nb_LAN_tid = 0;
                w_to_nb_LAN_tdest = 0;
            end
        end
        else begin
            w_to_nb_LAN_packet_data = r_to_nb_LAN_packet_data;
            w_to_nb_LAN_tkeep = r_to_nb_LAN_tkeep;
            w_to_nb_LAN_tid = r_to_nb_LAN_tid;
            w_to_nb_LAN_tdest = r_to_nb_LAN_tdest;
        end
    end
    always_ff @(posedge i_clk, negedge i_ap_rst_n) begin
        if (i_ap_rst_n == 0) begin
            r_to_nb_LAN_packet_data <= 0;
            r_to_nb_LAN_tkeep <= 0;
            r_to_nb_LAN_tid <= 0;
            r_to_nb_LAN_tdest <= 0;
        end
        else begin
            r_to_nb_LAN_packet_data <= w_to_nb_LAN_packet_data;
            r_to_nb_LAN_tkeep <= w_to_nb_LAN_tkeep;
            r_to_nb_LAN_tid <= w_to_nb_LAN_tid;
            r_to_nb_LAN_tdest <= w_to_nb_LAN_tdest;
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
endmodule