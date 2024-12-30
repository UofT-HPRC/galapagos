module rpn_WNN_repo #(
    parameter IS_OUTGOING = 0, // 0 means used for incoming WAN sequence numbers, 1 means used for outgoing WAN sequence numbers
    parameter NUM_FPGA_NODES = 256, // Number of FPGA nodes in this cluster
    `include "ctrl_api_reliability_header_parameters.vh"
    `include "ctrl_api_header_parameters.vh"
) (
    input i_clk,
    input i_ap_rst_n,
    input i_sequence_numbers_initialized, // Sent from sequence number initializer
    input [NODE_ID_WIDTH-1:0] i_node_id,
    input [IP_PORT_WIDTH-1:0] i_KIP_port_number,
    // AXI-Stream interface from Network Bridge
    input from_nb_tvalid,
    output wire from_nb_tready,
    input [AXIS_DATA_WIDTH-1:0] from_nb_tdata,
    input [AXIS_KEEP_WIDTH-1:0] from_nb_tkeep,
    input [AXIS_FROM_NB_TDEST_WIDTH-1:0] from_nb_tid,
    input [AXIS_FROM_NB_TDEST_WIDTH-1:0] from_nb_tdest,
    input [AXIS_FROM_NB_TUSER_WIDTH-1:0] from_nb_tuser,
    input from_nb_tlast,
    // AXI-Stream to Network Bridge KnownIP Interface
    output wire to_nb_KIP_tvalid,
    input to_nb_KIP_tready,
    output wire [AXIS_DATA_WIDTH-1:0] to_nb_KIP_tdata,
    output wire [AXIS_KEEP_WIDTH-1:0] to_nb_KIP_tkeep,
    output wire [AXIS_KIP_TUSER_WIDTH-1:0] to_nb_KIP_tuser,
    output wire to_nb_KIP_tlast,
    // BRAM connection to WAN Number Node Sequence Number BRAM. This stores the sequence number of the MOST RECENT transaction
    output wire to_WNN_sequence_number_BRAM_CLK, 
    output wire to_WNN_sequence_number_BRAM_RST,
    output wire to_WNN_sequence_number_BRAM_EN,
    output wire [BRAM_WEN_WIDTH-1:0] to_WNN_sequence_number_BRAM_WEN,
    output wire [WAN_NUM_SEQUENCE_NUMBER_WIDTH-1:0] to_WNN_sequence_number_BRAM_DIN,
    output logic [BRAM_ADDR_WIDTH-1:0] to_WNN_sequence_number_BRAM_ADDR,
    input [WAN_NUM_SEQUENCE_NUMBER_WIDTH-1:0] to_WNN_sequence_number_BRAM_DOUT,
    // BRAM connection to WAN Sequence Number Owner BRAM. This stores the ID of the node which currently owns the WAN sequence number
    // Owner BRAM is only used for outgoing sequence numbers
    output wire to_WAN_number_owner_BRAM_CLK, 
    output wire to_WAN_number_owner_BRAM_RST,
    output logic to_WAN_number_owner_BRAM_EN,
    output logic [BRAM_WEN_WIDTH-1:0] to_WAN_number_owner_BRAM_WEN,
    output logic [NODE_ID_WIDTH-1:0] to_WAN_number_owner_BRAM_DIN,
    output logic [BRAM_ADDR_WIDTH-1:0] to_WAN_number_owner_BRAM_ADDR,
    input [NODE_ID_WIDTH-1:0] to_WAN_number_owner_BRAM_DOUT,
    // BRAM connection to WAN Sequence Number BRAM. This stores the sequence number of the MOST RECENT transaction
    output wire to_WAN_sequence_number_BRAM_CLK, 
    output wire to_WAN_sequence_number_BRAM_RST,
    output logic to_WAN_sequence_number_BRAM_EN,
    output logic [BRAM_WEN_WIDTH-1:0] to_WAN_sequence_number_BRAM_WEN,
    output logic [WAN_SEQUENCE_NUMBER_WIDTH-1:0] to_WAN_sequence_number_BRAM_DIN,
    output logic [BRAM_ADDR_WIDTH-1:0] to_WAN_sequence_number_BRAM_ADDR,
    input [WAN_SEQUENCE_NUMBER_WIDTH-1:0] to_WAN_sequence_number_BRAM_DOUT
);

    // Parameters
    `include "ctrl_api_reliability_message_parameters.vh"
    localparam STATE_INIT = 0;
    localparam STATE_IDLE = 1;
    localparam STATE_COMPARE_WNN_SEQ_NUM = 2;
    localparam STATE_WRITE_WNN_SEQ_NUM = 3;
    localparam STATE_ACCESS_WAN_SEQ_NUM = 4;
    localparam STATE_TRANSMIT_ACK = 5;         
    localparam STATE_TRANSMIT_SEQ_NUM_REPLY = 6;
    // Assign expected requests based on whether this module is handling outgoing or incoming WAN sequence numbers
    localparam RPN_READ_REQUEST = (IS_OUTGOING == 1) ? RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_REQUEST : RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_REQUEST;
    localparam RPN_READ_REPLY = (IS_OUTGOING == 1) ? RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_REPLY : RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_REPLY;
    localparam RPN_WRITE_REQUEST = (IS_OUTGOING == 1) ? RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_WRITE : RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_WRITE;
    localparam RPN_BRESP = (IS_OUTGOING == 1) ? RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_BRESP : RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_BRESP;
    
    // Definitions
    // Core State FSM
    logic [3:0] r_core_state;
    logic [3:0] w_next_core_state;
    logic [WAN_SEQUENCE_NUMBER_WIDTH-1:0] r_WAN_sequence_number;
    logic [WAN_SEQUENCE_NUMBER_WIDTH-1:0] w_WAN_sequence_number;
    logic [AXIS_WAN_TDEST_WIDTH-1:0] r_WAN_CTDEST;
    logic [AXIS_WAN_TDEST_WIDTH-1:0] w_WAN_CTDEST;
    logic r_WAN_sequence_number_locked; // 1 if locked and not for the sender node, 0 if not locked/locked but for the sender node
    logic w_WAN_sequence_number_locked;
    // Sender Metadata
    logic [WAN_NUM_SEQUENCE_NUMBER_WIDTH-1:0] r_sender_sequence_number;
    logic [NODE_ID_WIDTH-1:0] r_sender_node_id;
    logic [RPN_MSG_TYPE_WIDTH-1:0] r_rpn_msg_type;
    logic [WAN_NUM_SEQUENCE_NUMBER_WIDTH-1:0] w_sender_sequence_number;
    logic [NODE_ID_WIDTH-1:0] w_sender_node_id;
    logic [RPN_MSG_TYPE_WIDTH-1:0] w_rpn_msg_type;
    // AXI-Stream interface to Network Bridge
    logic [RPN_MSG_TYPE_WIDTH-1:0] r_to_nb_KIP_msg_type;
    logic [WAN_NUM_SEQUENCE_NUMBER_WIDTH-1:0] r_to_nb_KIP_sequence_number;
    logic [IP_ADDRESS_WIDTH-1:0] r_to_nb_KIP_ip_addr;
    logic [RPN_MSG_TYPE_WIDTH-1:0] w_to_nb_KIP_msg_type;
    logic [WAN_NUM_SEQUENCE_NUMBER_WIDTH-1:0] w_to_nb_KIP_sequence_number;
    logic [IP_ADDRESS_WIDTH-1:0] w_to_nb_KIP_ip_addr;
    // Other
    logic [WAN_NUM_SEQUENCE_NUMBER_WIDTH-1:0] w_max_sequence_number;


    // Assignments
    // AXI-Stream interface from Network Bridge
    // Set ready to high even in STATE_INIT to prevent the from_nb channel from becoming backpressured
    assign from_nb_tready = (r_core_state == STATE_INIT
                          || r_core_state == STATE_IDLE) ? 1 : 0;
    // AXI-Stream to Network Bridge KnownIP Interface
    assign to_nb_KIP_tvalid = (r_core_state == STATE_TRANSMIT_ACK || r_core_state == STATE_TRANSMIT_SEQ_NUM_REPLY) ? 1 : 0;
    // TDATA channel
    assign to_nb_KIP_tdata[RPN_MSG_TYPE_WIDTH-1:0] = r_to_nb_KIP_msg_type;
    assign to_nb_KIP_tdata[GW_KIP_SENDER_NODE_ID_OFFSET+:GW_KIP_SENDER_NODE_ID_WIDTH] = i_node_id;
    assign to_nb_KIP_tdata[GW_KIP_SEQUENCE_NUMBER_OFFSET+:GW_KIP_SEQUENCE_NUMBER_WIDTH] = r_to_nb_KIP_sequence_number;
    assign to_nb_KIP_tdata[GW_KIP_WAN_SEQUENCE_NUMBER_OFFSET+:GW_KIP_WAN_SEQUENCE_NUMBER_WIDTH] = r_WAN_sequence_number;
    assign to_nb_KIP_tdata[GW_KIP_WAN_CTDEST_OFFSET+:GW_KIP_WAN_CTDEST_WIDTH] = r_WAN_CTDEST;
    assign to_nb_KIP_tdata[GW_KIP_WAN_LOCK_OFFSET] = r_WAN_sequence_number_locked;
    assign to_nb_KIP_tdata[AXIS_DATA_WIDTH-1:(GW_KIP_WAN_LOCK_OFFSET+1)] = 0;
    assign to_nb_KIP_tkeep = 'hFFFFFFFFFFFFFFFF;
    // TUSER channel
    assign to_nb_KIP_tuser[IP_ADDRESS_WIDTH-1:0] = r_to_nb_KIP_ip_addr;
    assign to_nb_KIP_tuser[KIP_TUSER_SRC_PORT_OFFSET+:KIP_TUSER_SRC_PORT_WIDTH] = i_KIP_port_number;
    assign to_nb_KIP_tuser[KIP_TUSER_DEST_PORT_OFFSET+:KIP_TUSER_DEST_PORT_WIDTH] = i_KIP_port_number;
    assign to_nb_KIP_tlast = 1;
    // BRAM connection to WNN BRAM
    assign to_WNN_sequence_number_BRAM_CLK = i_clk;
    assign to_WNN_sequence_number_BRAM_RST = ~i_ap_rst_n;
    assign to_WNN_sequence_number_BRAM_EN = ((r_core_state == STATE_IDLE && from_nb_tvalid == 1)
                                       || r_core_state == STATE_WRITE_WNN_SEQ_NUM) ? 1 : 0;
    assign to_WNN_sequence_number_BRAM_WEN = (r_core_state == STATE_WRITE_WNN_SEQ_NUM) ? 'hF : 0;
    assign to_WNN_sequence_number_BRAM_DIN = r_sender_sequence_number;
    // Address is byte-addressable, therefore entry 1 = 0x4, entry 2 = 0x8, etc
    // This translates to a bit shift left by 2
    assign to_WNN_sequence_number_BRAM_ADDR[1:0] = 0;
    assign to_WNN_sequence_number_BRAM_ADDR[BRAM_ADDR_WIDTH-1:NODE_ID_WIDTH+2] = 0;
    always_comb begin
        to_WNN_sequence_number_BRAM_ADDR[NODE_ID_WIDTH+1:2] = 0;
        // Case 1: Reading a sequence number based on incoming message
        if (r_core_state == STATE_IDLE && from_nb_tvalid == 1)
            to_WNN_sequence_number_BRAM_ADDR[NODE_ID_WIDTH+1:2] = from_nb_tdata[GW_KIP_SENDER_NODE_ID_OFFSET+:GW_KIP_SENDER_NODE_ID_WIDTH];
        // Case 2: Updating a sequence number
        else if (r_core_state == STATE_WRITE_WNN_SEQ_NUM)
            to_WNN_sequence_number_BRAM_ADDR[NODE_ID_WIDTH+1:2] = r_sender_node_id;
        else
            to_WNN_sequence_number_BRAM_ADDR[NODE_ID_WIDTH+1:2] = 0;
    end
    // BRAM connection to WAN Owner BRAM (Only used for Outgoing Sequence Numbers)
    generate
        // Only used for Outgoing sequence numbers
        if (IS_OUTGOING == 1) begin
            assign to_WAN_number_owner_BRAM_CLK = i_clk;
            assign to_WAN_number_owner_BRAM_RST = ~i_ap_rst_n;
            // Address is byte-addressable, therefore entry 1 = 0x4, entry 2 = 0x8, etc
            // This translates to a bit shift left by 2
            // TODO: WAN CTDEST is already 32 bits, so there will be data loss
            assign to_WAN_number_owner_BRAM_ADDR[1:0] = 0;
            assign to_WAN_number_owner_BRAM_ADDR[BRAM_ADDR_WIDTH-1:2] = r_WAN_CTDEST[AXIS_WAN_TDEST_WIDTH-1:0];
            // WAN Owner BRAM Enable
            always_comb begin
                to_WAN_number_owner_BRAM_EN = 0;
                // Case 1: Read the current owner of the WAN sequence number
                // This has to be done regardless of write or read, because write needs to verify that the owner is correct?
                if (w_next_core_state == STATE_ACCESS_WAN_SEQ_NUM)
                    to_WAN_number_owner_BRAM_EN = 1;
                else if (r_core_state == STATE_ACCESS_WAN_SEQ_NUM) begin
                    // Case 2: Request is a SEQ NUM WRITE, which unlocks the sequence number
                    if (r_rpn_msg_type == RPN_WRITE_REQUEST
                    && to_WAN_number_owner_BRAM_DOUT == r_sender_node_id)
                        to_WAN_number_owner_BRAM_EN = 1;
                    // Case 3: Request is a SEQ NUM READ for an unlocked sequence number
                    else if (r_rpn_msg_type == RPN_READ_REQUEST
                        && to_WAN_number_owner_BRAM_DOUT == 0)
                        to_WAN_number_owner_BRAM_EN = 1;
                    else
                        to_WAN_number_owner_BRAM_EN = 0;
                end
                else
                    to_WAN_number_owner_BRAM_EN = 0;
            end
            // WAN Owner BRAM Write Enable and Data In
            always_comb begin
                to_WAN_number_owner_BRAM_WEN = 0;
                to_WAN_number_owner_BRAM_DIN = 0;
                if (r_core_state == STATE_ACCESS_WAN_SEQ_NUM) begin
                    // Case 1: Request is valid SEQ NUM WRITE, which unlocks the sequence number
                    if (r_rpn_msg_type == RPN_WRITE_REQUEST
                    && to_WAN_number_owner_BRAM_DOUT == r_sender_node_id) begin
                        to_WAN_number_owner_BRAM_WEN = 'hF;
                        to_WAN_number_owner_BRAM_DIN = 0;
                    end
                    // Case 3: Request is a SEQ NUM READ for an unlocked sequence number
                    else if (r_rpn_msg_type == RPN_READ_REQUEST
                        && to_WAN_number_owner_BRAM_DOUT == 0) begin
                        to_WAN_number_owner_BRAM_WEN = 'hF;
                        to_WAN_number_owner_BRAM_DIN = r_sender_node_id;
                    end
                    else begin
                        to_WAN_number_owner_BRAM_WEN = 0;
                        to_WAN_number_owner_BRAM_DIN = 0;
                    end
                end
                else begin
                    to_WAN_number_owner_BRAM_WEN = 0;
                    to_WAN_number_owner_BRAM_DIN = 0;
                end
            end
        end
        else begin
            assign to_WAN_number_owner_BRAM_CLK = 0;
            assign to_WAN_number_owner_BRAM_RST = 0;
            assign to_WAN_number_owner_BRAM_ADDR = 0;
            assign to_WAN_number_owner_BRAM_WEN = 0;
            assign to_WAN_number_owner_BRAM_WEN = 0;
            assign to_WAN_number_owner_BRAM_DIN = 0;
        end
    endgenerate
    // BRAM connection to WAN Sequence Number BRAM
    assign to_WAN_sequence_number_BRAM_CLK = i_clk;
    assign to_WAN_sequence_number_BRAM_RST = ~i_ap_rst_n;
    // Address is byte-addressable, therefore entry 1 = 0x4, entry 2 = 0x8, etc
    // This translates to a bit shift left by 2
    // TODO: WAN CTDEST is already 32 bits, so there will be data loss
    assign to_WAN_sequence_number_BRAM_ADDR[1:0] = 0;
    assign to_WAN_sequence_number_BRAM_ADDR[BRAM_ADDR_WIDTH-1:2] = r_WAN_CTDEST[AXIS_WAN_TDEST_WIDTH-1:0];
    assign to_WAN_sequence_number_BRAM_DIN = to_WAN_sequence_number_BRAM_DOUT + 1;
    // WAN Sequence Number BRAM Write Enable: 
    // Outgoing SEQ numbers: only write when we get a valid WRITE request from the owner
    generate
        if (IS_OUTGOING == 1)
            assign to_WAN_sequence_number_BRAM_WEN = (r_core_state == STATE_ACCESS_WAN_SEQ_NUM
                                                   && r_rpn_msg_type == RPN_WRITE_REQUEST
                                                   && to_WAN_number_owner_BRAM_DOUT == r_sender_node_id) ? 'hF : 0;
        else
            assign to_WAN_sequence_number_BRAM_WEN = (r_core_state == STATE_ACCESS_WAN_SEQ_NUM
                                                   && r_rpn_msg_type == RPN_WRITE_REQUEST) ? 'hF : 0;
    endgenerate
    // WAN Sequence Number BRAM Enable
    always_comb begin
        // Case 1: Read WAN Sequence Number
        // The data needs to be ready for STATE_ACCESS_WAN_SEQ_NUM
        // This has to be done regardless of write or read, because write increments the stored value by 1
        if (w_next_core_state == STATE_ACCESS_WAN_SEQ_NUM)
            to_WAN_sequence_number_BRAM_EN = 1;
        // Case 2: SEQ Num Write needs to perform a write
        else if (r_core_state == STATE_ACCESS_WAN_SEQ_NUM
        && r_rpn_msg_type == RPN_WRITE_REQUEST)
            to_WAN_sequence_number_BRAM_EN = 1;
        else
            to_WAN_sequence_number_BRAM_EN = 0;
    end
    // Other
    assign w_max_sequence_number[WAN_NUM_SEQUENCE_NUMBER_WIDTH-1:0] = -1;

    
    // Core State FSM depending on whether or not this is used for INCOMING or OUTGOING WAN sequence numbers
    always_comb begin
        w_next_core_state = STATE_INIT;
        case(r_core_state)
            STATE_INIT: begin
                w_next_core_state = (i_sequence_numbers_initialized == 1) ? STATE_IDLE : STATE_INIT;
            end
            STATE_IDLE: begin
                w_next_core_state = (from_nb_tvalid == 1) ? STATE_COMPARE_WNN_SEQ_NUM: STATE_IDLE;
            end
            STATE_COMPARE_WNN_SEQ_NUM: begin
                // Case 1: Original request was to check the current sequence number
                if (r_rpn_msg_type == RPN_MSG_TYPE_WAN_NUM_SEQ_NUM_CHECK)
                    w_next_core_state = STATE_TRANSMIT_SEQ_NUM_REPLY;
                // Case 2: Request was to read or check a sequence number
                else if (r_rpn_msg_type == RPN_READ_REQUEST
                      || r_rpn_msg_type == RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_CHECK) begin
                    // Case 2A: The sequence number has looped back to 0. This is a correct new sequence number.
                    if (to_WNN_sequence_number_BRAM_DOUT == w_max_sequence_number
                      && r_sender_sequence_number == 0)
                        w_next_core_state = STATE_WRITE_WNN_SEQ_NUM;
                    // Case 2B: This is a re-transmission of the most recent read. Then, read/lock the value again
                    else if (to_WNN_sequence_number_BRAM_DOUT == r_sender_sequence_number)
                        w_next_core_state = STATE_ACCESS_WAN_SEQ_NUM;
                    // Case 2C: This is a correct new sequence number
                    else if (to_WNN_sequence_number_BRAM_DOUT == (r_sender_sequence_number - 1))
                        w_next_core_state = STATE_WRITE_WNN_SEQ_NUM;
                    // Shouldn't happen
                    else
                        w_next_core_state = STATE_IDLE;
                end
                // Case 3: Request was to write a sequence number
                else begin
                    // Case 3A: The sequence number has looped back to 0. This is a correct new sequence number.
                    if (to_WNN_sequence_number_BRAM_DOUT == w_max_sequence_number
                      && r_sender_sequence_number == 0)
                        w_next_core_state = STATE_WRITE_WNN_SEQ_NUM;
                    // Case 3B: This is a re-transmission of the current sequence number, jump directly to transmitting ACK without writing WNN sequence number or updating WAN sequence number
                    else if (to_WNN_sequence_number_BRAM_DOUT == r_sender_sequence_number)
                        w_next_core_state = STATE_TRANSMIT_ACK;
                    // Case 3C: This is a correct new sequence number
                    else if (to_WNN_sequence_number_BRAM_DOUT == (r_sender_sequence_number - 1))
                        w_next_core_state = STATE_WRITE_WNN_SEQ_NUM;
                    // Shouldn't happen
                    else
                        w_next_core_state = STATE_IDLE;
                end
            end
            STATE_WRITE_WNN_SEQ_NUM: begin
                w_next_core_state = STATE_ACCESS_WAN_SEQ_NUM;
            end
            STATE_ACCESS_WAN_SEQ_NUM: begin
                w_next_core_state = STATE_TRANSMIT_ACK;
            end
            STATE_TRANSMIT_ACK: begin
                w_next_core_state = (to_nb_KIP_tready == 1) ? STATE_IDLE : STATE_TRANSMIT_ACK;
            end
            STATE_TRANSMIT_SEQ_NUM_REPLY: begin
                w_next_core_state = (to_nb_KIP_tready == 1) ? STATE_IDLE : STATE_TRANSMIT_SEQ_NUM_REPLY;
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

    // Read the sequence number and packet when it arrives
    always_comb begin
        w_sender_sequence_number = 0;
        w_sender_node_id = 0;
        w_rpn_msg_type = 0;
        w_WAN_CTDEST = 0;
        if (r_core_state == STATE_IDLE) begin
            if (from_nb_tvalid == 1) begin
                w_rpn_msg_type = from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0];
                w_sender_sequence_number = from_nb_tdata[GW_KIP_SEQUENCE_NUMBER_OFFSET+:GW_KIP_SEQUENCE_NUMBER_WIDTH]; 
                w_sender_node_id = from_nb_tdata[GW_KIP_SENDER_NODE_ID_OFFSET+:GW_KIP_SENDER_NODE_ID_WIDTH]; 
                w_WAN_CTDEST = from_nb_tdata[GW_KIP_WAN_CTDEST_OFFSET+:GW_KIP_WAN_CTDEST_WIDTH];
            end
            else begin
                w_rpn_msg_type = 0;
                w_sender_sequence_number = 0;
                w_sender_node_id = 0;
                w_WAN_CTDEST = 0;
            end
        end
        else begin
            w_rpn_msg_type = r_rpn_msg_type;
            w_sender_sequence_number = r_sender_sequence_number;
            w_sender_node_id = r_sender_node_id;
            w_WAN_CTDEST = r_WAN_CTDEST;
        end
    end
    always_ff @(posedge i_clk, negedge i_ap_rst_n) begin
        if (i_ap_rst_n == 0) begin
            r_rpn_msg_type <= 0;
            r_sender_sequence_number <= 0;
            r_sender_node_id <= 0;
            r_WAN_CTDEST <= 0;
        end
        else begin
            r_sender_sequence_number <= w_sender_sequence_number;
            r_sender_node_id <= w_sender_node_id;
            r_rpn_msg_type <= w_rpn_msg_type;
            r_WAN_CTDEST <= w_WAN_CTDEST;
        end
    end

    // Read WAN Sequence number and its lock
    generate
        // Case 1: for Outgoing sequence numbers, check the lock owner before assigning sequence number
        if (IS_OUTGOING == 1) begin
            always_comb begin
                w_WAN_sequence_number = 0;
                w_WAN_sequence_number_locked = 0;
                // Clear in IDLE
                if (r_core_state == STATE_IDLE) begin
                    w_WAN_sequence_number = 0;
                    w_WAN_sequence_number_locked = 0;
                end
                else if (r_core_state == STATE_ACCESS_WAN_SEQ_NUM) begin
                    // Edge case: for a Sequence number check, only show unlocked if the requesting node is the owner
                    if (r_rpn_msg_type == RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_CHECK) begin
                        if (to_WAN_number_owner_BRAM_DOUT[NODE_ID_WIDTH-1:0] == r_sender_node_id) begin
                            w_WAN_sequence_number = to_WAN_sequence_number_BRAM_DOUT;
                            w_WAN_sequence_number_locked = 0;
                        end
                        else begin
                            w_WAN_sequence_number = 0;
                            w_WAN_sequence_number_locked = 1;
                        end
                    end
                    // If the node is unlocked or assigned to the sender node, send WAN sequence number
                    else if (to_WAN_number_owner_BRAM_DOUT[NODE_ID_WIDTH-1:0] == r_sender_node_id
                     || to_WAN_number_owner_BRAM_DOUT[NODE_ID_WIDTH-1:0] == 0) begin
                        w_WAN_sequence_number = to_WAN_sequence_number_BRAM_DOUT;
                        w_WAN_sequence_number_locked = 0;
                    end
                    else begin
                        w_WAN_sequence_number = 0;
                        w_WAN_sequence_number_locked = 1;
                    end
                end
                else begin
                    w_WAN_sequence_number = r_WAN_sequence_number;
                    w_WAN_sequence_number_locked = r_WAN_sequence_number_locked;
                end
            end
        end
        // Case 2: For incoming sequence numbers, lock is not checked
        else begin
            always_comb begin
                w_WAN_sequence_number = 0;
                w_WAN_sequence_number_locked = 0;
                if (r_core_state == STATE_ACCESS_WAN_SEQ_NUM)
                    w_WAN_sequence_number = to_WAN_sequence_number_BRAM_DOUT;
                else
                    w_WAN_sequence_number = r_WAN_sequence_number;
            end
        end
    endgenerate
    always_ff @(posedge i_clk, negedge i_ap_rst_n) begin
        if (i_ap_rst_n == 0) begin
            r_WAN_sequence_number <= 0;
            r_WAN_sequence_number_locked <= 0;
        end
        else begin
            r_WAN_sequence_number <= w_WAN_sequence_number;
            r_WAN_sequence_number_locked <= w_WAN_sequence_number_locked;
        end
    end

    // Write Acknowledgements based on the results  
    always_comb begin
        w_to_nb_KIP_sequence_number = 0;
        w_to_nb_KIP_ip_addr = 0;
        if (r_core_state == STATE_IDLE) begin
            w_to_nb_KIP_sequence_number = 0;
            if (from_nb_tvalid == 1)
                w_to_nb_KIP_ip_addr = from_nb_tuser[IP_ADDRESS_WIDTH-1:0];
            else
                w_to_nb_KIP_ip_addr = 0;
        end
        else if (r_core_state == STATE_COMPARE_WNN_SEQ_NUM) begin
            if (r_rpn_msg_type == RPN_MSG_TYPE_WAN_NUM_SEQ_NUM_CHECK) begin
                w_to_nb_KIP_sequence_number = to_WNN_sequence_number_BRAM_DOUT;
            end
            else begin
                w_to_nb_KIP_sequence_number = r_sender_sequence_number;
            end
            w_to_nb_KIP_ip_addr = r_to_nb_KIP_ip_addr;
        end
        else begin
            w_to_nb_KIP_sequence_number = r_to_nb_KIP_sequence_number;
            w_to_nb_KIP_ip_addr = r_to_nb_KIP_ip_addr;
        end
    end
    always_ff @(posedge i_clk, negedge i_ap_rst_n) begin
        if (i_ap_rst_n == 0) begin
            r_to_nb_KIP_sequence_number <= 0;
            r_to_nb_KIP_ip_addr <= 0;
        end
        else begin
            r_to_nb_KIP_sequence_number <= w_to_nb_KIP_sequence_number;
            r_to_nb_KIP_ip_addr <= w_to_nb_KIP_ip_addr;
        end
    end
    // Depending on whether or not this is used for INCOMING or OUTGOING WAN sequence numbers, determine ACK message type
    always_comb begin
        w_to_nb_KIP_msg_type = 0;
        if (r_core_state == STATE_IDLE) begin
            w_to_nb_KIP_msg_type = 0;
        end
        else if (r_core_state == STATE_COMPARE_WNN_SEQ_NUM) begin
            if (r_rpn_msg_type == RPN_MSG_TYPE_WAN_NUM_SEQ_NUM_CHECK) begin
                w_to_nb_KIP_msg_type = RPN_MSG_TYPE_WAN_NUM_SEQ_NUM_REPLY;
            end
            else begin
                case (r_rpn_msg_type)
                    RPN_READ_REQUEST: w_to_nb_KIP_msg_type = RPN_READ_REPLY;
                    RPN_WRITE_REQUEST: w_to_nb_KIP_msg_type = RPN_BRESP;
                    // Used for outgoing only, but doesn't matter:
                    RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_CHECK: w_to_nb_KIP_msg_type = RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_RDATA;
                endcase
            end
        end
        else begin
            w_to_nb_KIP_msg_type = r_to_nb_KIP_msg_type;
        end
    end
    always_ff @(posedge i_clk, negedge i_ap_rst_n) begin
        if (i_ap_rst_n == 0) begin
            r_to_nb_KIP_msg_type <= 0;
        end
        else begin
            r_to_nb_KIP_msg_type <= w_to_nb_KIP_msg_type;
        end
    end
endmodule