module rpn_LAN_RX #(
    `include "ctrl_api_reliability_header_parameters.vh"
    `include "ctrl_api_header_parameters.vh"
) (
    input i_clk,
    input i_ap_rst_n,
    input [NODE_ID_WIDTH-1:0] i_node_id,
    input [IP_ADDRESS_WIDTH-1:0] i_node_ip_address,
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
    // AXI-Stream interface to Control module
    output wire to_ctrl_tvalid,
    input to_ctrl_tready,
    output wire [AXIS_DATA_WIDTH-1:0] to_ctrl_tdata,
    output wire [AXIS_KEEP_WIDTH-1:0] to_ctrl_tkeep,
    output wire [AXIS_FROM_NB_TDEST_WIDTH-1:0] to_ctrl_tid,
    output wire [AXIS_FROM_NB_TDEST_WIDTH-1:0] to_ctrl_tdest,
    output wire [AXIS_FROM_NB_TUSER_WIDTH-1:0] to_ctrl_tuser,
    output wire to_ctrl_tlast,
    // AXI-Stream to Network Bridge KnownIP Interface
    output wire to_nb_KIP_tvalid,
    input to_nb_KIP_tready,
    output wire [AXIS_DATA_WIDTH-1:0] to_nb_KIP_tdata,
    output wire [AXIS_KEEP_WIDTH-1:0] to_nb_KIP_tkeep,
    output wire [AXIS_KIP_TUSER_WIDTH-1:0] to_nb_KIP_tuser,
    output wire to_nb_KIP_tlast,
    // AXI-Stream interface to WAN Number Node transmitter
    output to_WNN_tvalid,
    input to_WNN_tready,
    output [RPN_MSG_TYPE_WIDTH-1:0] to_WNN_tdata,
    output [AXIS_WAN_TDEST_WIDTH-1:0] to_WNN_tdest,
    // BRAM connection to Sequence Number BRAM. This stores the sequence number of the MOST RECENT transaction
    output wire to_sequence_number_BRAM_CLK, 
    output wire to_sequence_number_BRAM_RST,
    output wire to_sequence_number_BRAM_EN,
    output wire [BRAM_WEN_WIDTH-1:0] to_sequence_number_BRAM_WEN,
    output wire [LAN_SEQUENCE_NUMBER_WIDTH-1:0] to_sequence_number_BRAM_DIN,
    output logic [BRAM_ADDR_WIDTH-1:0] to_sequence_number_BRAM_ADDR,
    input [LAN_SEQUENCE_NUMBER_WIDTH-1:0] to_sequence_number_BRAM_DOUT
);

    // Parameters
    `include "ctrl_api_reliability_message_parameters.vh"
    localparam STATE_IDLE = 0;
    localparam STATE_COMPARE_SEQ_NUM = 1;
    localparam STATE_SEND_TO_CTRL = 2;
    localparam STATE_WRITE_NEW_SEQ_NUM = 3;
    localparam STATE_TRANSMIT_ACK = 4;
    localparam STATE_SEND_WNN_WRITE = 5;
    localparam STATE_TRANSMIT_SEQ_NUM_REPLY = 6;

    // Definitions
    // Core State FSM
    logic [3:0] r_core_state;
    logic [3:0] w_next_core_state;
    // Sender Metadata
    logic [LAN_SEQUENCE_NUMBER_WIDTH-1:0] r_sender_sequence_number;
    logic [NODE_ID_WIDTH-1:0] r_sender_node_id;
    logic [RPN_MSG_TYPE_WIDTH-1:0] r_rpn_msg_type;
    logic [CLUSTER_ID_WIDTH-1:0] r_ctid;
    logic [LAN_SEQUENCE_NUMBER_WIDTH-1:0] w_sender_sequence_number;
    logic [NODE_ID_WIDTH-1:0] w_sender_node_id;
    logic [RPN_MSG_TYPE_WIDTH-1:0] w_rpn_msg_type;
    logic [CLUSTER_ID_WIDTH-1:0] w_ctid;
    // AXI-Stream interface to Control
    logic [PUB_LAN_DATA_WIDTH-1:0] r_to_ctrl_tdata;
    logic [AXIS_KEEP_WIDTH-1:0] r_to_ctrl_tkeep;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] r_to_ctrl_tid;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] r_to_ctrl_tdest;
    logic [AXIS_FROM_NB_TUSER_WIDTH-1:0] r_to_ctrl_tuser;
    logic [PUB_LAN_DATA_WIDTH-1:0] w_to_ctrl_tdata;
    logic [AXIS_KEEP_WIDTH-1:0] w_to_ctrl_tkeep;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] w_to_ctrl_tid;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] w_to_ctrl_tdest;
    logic [AXIS_FROM_NB_TUSER_WIDTH-1:0] w_to_ctrl_tuser;
    // AXI-Stream interface to Network Bridge
    logic [RPN_MSG_TYPE_WIDTH-1:0] r_to_nb_KIP_msg_type;
    logic [LAN_SEQUENCE_NUMBER_WIDTH-1:0] r_to_nb_KIP_sequence_number;
    logic [IP_ADDRESS_WIDTH-1:0] r_to_nb_KIP_ip_addr;
    logic [RPN_MSG_TYPE_WIDTH-1:0] w_to_nb_KIP_msg_type;
    logic [LAN_SEQUENCE_NUMBER_WIDTH-1:0] w_to_nb_KIP_sequence_number;
    logic [IP_ADDRESS_WIDTH-1:0] w_to_nb_KIP_ip_addr;
    // Other
    logic [LAN_SEQUENCE_NUMBER_WIDTH-1:0] w_max_sequence_number;
    logic w_current_message_is_forwarded;

    // Assignments
    // AXI-Stream interface from Network Bridge
    assign from_nb_tready = (r_core_state == STATE_IDLE) ? 1 : 0;
    // AXI-Stream interface to Control module
    assign to_ctrl_tvalid = (r_core_state == STATE_SEND_TO_CTRL) ? 1 : 0;
    assign to_ctrl_tdata[PUB_LAN_DATA_WIDTH-1:0] = r_to_ctrl_tdata;
    assign to_ctrl_tdata[AXIS_DATA_WIDTH-1:PUB_LAN_DATA_WIDTH] = 0;
    assign to_ctrl_tkeep = r_to_ctrl_tkeep;
    assign to_ctrl_tid = r_to_ctrl_tid;
    assign to_ctrl_tdest = r_to_ctrl_tdest;
    assign to_ctrl_tuser = r_to_ctrl_tuser;
    assign to_ctrl_tlast = 1;
    // AXI-Stream to Network Bridge KnownIP Interface
    assign to_nb_KIP_tvalid = (r_core_state == STATE_TRANSMIT_ACK || r_core_state == STATE_TRANSMIT_SEQ_NUM_REPLY) ? 1 : 0;
    // TDATA channel
    assign to_nb_KIP_tdata[RPN_MSG_TYPE_WIDTH-1:0] = r_to_nb_KIP_msg_type;
    assign to_nb_KIP_tdata[LAN_ACK_SENDER_NODE_ID_OFFSET+:LAN_ACK_SENDER_NODE_ID_WIDTH] = i_node_id;
    assign to_nb_KIP_tdata[LAN_ACK_SEQUENCE_NUMBER_OFFSET+:LAN_ACK_SEQUENCE_NUMBER_WIDTH] = r_to_nb_KIP_sequence_number;
    assign to_nb_KIP_tdata[AXIS_DATA_WIDTH-1:(LAN_ACK_SEQUENCE_NUMBER_OFFSET+LAN_ACK_SEQUENCE_NUMBER_WIDTH)] = 0;
    assign to_nb_KIP_tkeep = 'hFFFFFFFFFFFFFFFF;
    // TUSER channel
    assign to_nb_KIP_tuser[IP_ADDRESS_WIDTH-1:0] = r_to_nb_KIP_ip_addr;
    assign to_nb_KIP_tuser[KIP_TUSER_SRC_PORT_OFFSET+:KIP_TUSER_SRC_PORT_WIDTH] = i_KIP_port_number;
    assign to_nb_KIP_tuser[KIP_TUSER_DEST_PORT_OFFSET+:KIP_TUSER_DEST_PORT_WIDTH] = i_KIP_port_number;
    assign to_nb_KIP_tlast = 1;
    // AXI-Stream interface to WAN Number Node transmitter
    assign to_WNN_tvalid = (r_core_state == STATE_SEND_WNN_WRITE) ? 1 : 0;
    assign to_WNN_tdata = RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_WRITE;
    assign to_WNN_tdest = r_ctid;
    // BRAM connection to Sequence Number BRAM
    assign to_sequence_number_BRAM_CLK = i_clk;
    assign to_sequence_number_BRAM_RST = ~i_ap_rst_n;
    assign to_sequence_number_BRAM_EN = ((r_core_state == STATE_IDLE && from_nb_tvalid == 1)
                                       || r_core_state == STATE_WRITE_NEW_SEQ_NUM) ? 1 : 0;
    assign to_sequence_number_BRAM_WEN = (r_core_state == STATE_WRITE_NEW_SEQ_NUM) ? 'hF : 0;
    assign to_sequence_number_BRAM_DIN = r_sender_sequence_number;
    // Address is byte-addressable, therefore entry 1 = 0x4, entry 2 = 0x8, etc
    // This translates to a bit shift left by 2
    assign to_sequence_number_BRAM_ADDR[1:0] = 0;
    assign to_sequence_number_BRAM_ADDR[BRAM_ADDR_WIDTH-1:NODE_ID_WIDTH+2] = 0;
    always_comb begin
        to_sequence_number_BRAM_ADDR[NODE_ID_WIDTH+1:2] = 0;
        // Case 1: Reading a sequence number based on incoming message
        if (r_core_state == STATE_IDLE && from_nb_tvalid == 1)
            to_sequence_number_BRAM_ADDR[NODE_ID_WIDTH+1:2] = from_nb_tdata[PUB_LAN_SENDER_NODE_ID_OFFSET+:PUB_LAN_SENDER_NODE_ID_WIDTH];
        // Case 2: Updating a sequence number
        else if (r_core_state == STATE_WRITE_NEW_SEQ_NUM)
            to_sequence_number_BRAM_ADDR[NODE_ID_WIDTH+1:2] = r_sender_node_id;
        else
            to_sequence_number_BRAM_ADDR[NODE_ID_WIDTH+1:2] = 0;
    end
    // Other
    assign w_max_sequence_number[LAN_SEQUENCE_NUMBER_WIDTH-1:0] = -1;
    assign w_current_message_is_forwarded = (r_ctid == 0) ? 0 : 1;

    // Core State FSM
    always_comb begin
        w_next_core_state = STATE_IDLE;
        case(r_core_state)
            STATE_IDLE: begin
                w_next_core_state = (from_nb_tvalid == 1) ? STATE_COMPARE_SEQ_NUM: STATE_IDLE;
            end
            STATE_COMPARE_SEQ_NUM: begin
                // Case 1: Original request was to check the current sequence number
                if (r_rpn_msg_type == RPN_MSG_TYPE_LAN_SEQ_NUM_CHECK)
                    w_next_core_state = STATE_TRANSMIT_SEQ_NUM_REPLY;
                // Case 2: The sequence number has looped back to 0. This is a correct new sequence number.
                else if (to_sequence_number_BRAM_DOUT == w_max_sequence_number
                      && r_sender_sequence_number == 0)
                    w_next_core_state = STATE_WRITE_NEW_SEQ_NUM;
                // Case 3: This is a re-transmission of the current sequence number, transmit an ACK back without doing anything
                else if (to_sequence_number_BRAM_DOUT == r_sender_sequence_number)
                    w_next_core_state = STATE_TRANSMIT_ACK;
                // Case 4: This is a correct new sequence number
                else if (to_sequence_number_BRAM_DOUT == (r_sender_sequence_number - 1))
                    w_next_core_state = STATE_WRITE_NEW_SEQ_NUM;
                // Shouldn't happen
                else
                    w_next_core_state = STATE_IDLE;
            end
            STATE_WRITE_NEW_SEQ_NUM: begin
                w_next_core_state = (w_current_message_is_forwarded == 1) ? STATE_SEND_WNN_WRITE : STATE_SEND_TO_CTRL;
            end
            STATE_SEND_WNN_WRITE: begin
                w_next_core_state = (to_WNN_tready == 1) ? STATE_SEND_TO_CTRL : STATE_SEND_WNN_WRITE;
            end
            STATE_SEND_TO_CTRL: begin
                w_next_core_state = (to_ctrl_tready == 1) ? STATE_TRANSMIT_ACK : STATE_SEND_TO_CTRL;
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
            r_core_state <= STATE_IDLE;
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
        w_to_ctrl_tdata = 0;
        w_to_ctrl_tkeep = 0;
        w_to_ctrl_tid = 0;
        w_to_ctrl_tdest = 0;
        w_to_ctrl_tuser = 0;
        w_ctid = 0;
        if (r_core_state == STATE_IDLE) begin
            if (from_nb_tvalid == 1) begin
                w_rpn_msg_type = from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0];
                w_to_ctrl_tkeep = from_nb_tkeep;
                w_to_ctrl_tid = from_nb_tid;
                w_to_ctrl_tdest = from_nb_tdest;
                w_to_ctrl_tuser = from_nb_tuser;
                w_sender_sequence_number = from_nb_tdata[PUB_LAN_SEQUENCE_NUMBER_OFFSET+:LAN_SEQUENCE_NUMBER_WIDTH]; 
                w_sender_node_id = from_nb_tdata[PUB_LAN_SENDER_NODE_ID_OFFSET+:PUB_LAN_SENDER_NODE_ID_WIDTH]; 
                w_to_ctrl_tdata[PUB_LAN_DATA_WIDTH-1:0] = from_nb_tdata[PUB_LAN_DATA_OFFSET+:PUB_LAN_DATA_WIDTH]; 
                // Record original cluster ID for forwarded LAN messages
                w_ctid = from_nb_tdata[PUB_LAN_FWD_CTID_OFFSET+:PUB_LAN_FWD_CTID_WIDTH];
            end
            else begin
                w_rpn_msg_type = 0;
                w_sender_sequence_number = 0;
                w_sender_node_id = 0;
                w_to_ctrl_tdata = 0;
                w_to_ctrl_tkeep = 0;
                w_to_ctrl_tid = 0;
                w_to_ctrl_tdest = 0;
                w_to_ctrl_tuser = 0;
                w_ctid = 0;
            end
        end
        else begin
            w_rpn_msg_type = r_rpn_msg_type;
            w_sender_sequence_number = r_sender_sequence_number;
            w_sender_node_id = r_sender_node_id;
            w_to_ctrl_tdata = r_to_ctrl_tdata;
            w_to_ctrl_tkeep = r_to_ctrl_tkeep;
            w_to_ctrl_tid = r_to_ctrl_tid;
            w_to_ctrl_tdest = r_to_ctrl_tdest;
            w_to_ctrl_tuser = r_to_ctrl_tuser;
            w_ctid = r_ctid;
        end
    end
    always_ff @(posedge i_clk, negedge i_ap_rst_n) begin
        if (i_ap_rst_n == 0) begin
            r_rpn_msg_type <= 0;
            r_sender_sequence_number <= 0;
            r_sender_node_id <= 0;
            r_to_ctrl_tdata <= 0;
            r_to_ctrl_tkeep <= 0;
            r_to_ctrl_tid <= 0;
            r_to_ctrl_tdest <= 0;
            r_to_ctrl_tuser <= 0;
            r_ctid <= 0;
        end
        else begin
            r_sender_sequence_number <= w_sender_sequence_number;
            r_sender_node_id <= w_sender_node_id;
            r_rpn_msg_type <= w_rpn_msg_type;
            r_to_ctrl_tdata <= w_to_ctrl_tdata;
            r_to_ctrl_tkeep <= w_to_ctrl_tkeep;
            r_to_ctrl_tid <= w_to_ctrl_tid;
            r_to_ctrl_tdest <= w_to_ctrl_tdest;
            r_to_ctrl_tuser <= w_to_ctrl_tuser;
            r_ctid <= w_ctid;
        end
    end

    // Write Acknowledgements based on the results  
    always_comb begin
        w_to_nb_KIP_msg_type = 0;
        w_to_nb_KIP_sequence_number = 0;
        w_to_nb_KIP_ip_addr = 0;
        if (r_core_state == STATE_IDLE) begin
            w_to_nb_KIP_msg_type = 0;
            w_to_nb_KIP_sequence_number = 0;
            if (from_nb_tvalid == 1)
                w_to_nb_KIP_ip_addr = from_nb_tuser[IP_ADDRESS_WIDTH-1:0];
            else
                w_to_nb_KIP_ip_addr = 0;
        end
        else if (r_core_state == STATE_COMPARE_SEQ_NUM) begin
            if (r_rpn_msg_type == RPN_MSG_TYPE_LAN_SEQ_NUM_CHECK) begin
                w_to_nb_KIP_msg_type = RPN_MSG_TYPE_LAN_SEQ_NUM_REPLY;
                w_to_nb_KIP_sequence_number = to_sequence_number_BRAM_DOUT;
            end
            else begin
                w_to_nb_KIP_msg_type = RPN_MSG_TYPE_LAN_ACK;
                w_to_nb_KIP_sequence_number = r_sender_sequence_number;
            end
            w_to_nb_KIP_ip_addr = r_to_nb_KIP_ip_addr;
        end
        else begin
            w_to_nb_KIP_msg_type = r_to_nb_KIP_msg_type;
            w_to_nb_KIP_sequence_number = r_to_nb_KIP_sequence_number;
            w_to_nb_KIP_ip_addr = r_to_nb_KIP_ip_addr;
        end
    end
    always_ff @(posedge i_clk, negedge i_ap_rst_n) begin
        if (i_ap_rst_n == 0) begin
            r_to_nb_KIP_msg_type <= 0;
            r_to_nb_KIP_sequence_number <= 0;
            r_to_nb_KIP_ip_addr <= 0;
        end
        else begin
            r_to_nb_KIP_msg_type <= w_to_nb_KIP_msg_type;
            r_to_nb_KIP_sequence_number <= w_to_nb_KIP_sequence_number;
            r_to_nb_KIP_ip_addr <= w_to_nb_KIP_ip_addr;
        end
    end
endmodule