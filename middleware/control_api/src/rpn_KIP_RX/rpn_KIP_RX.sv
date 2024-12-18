module rpn_KIP_RX #(
    `include "ctrl_api_reliability_header_parameters.vh"
    `include "ctrl_api_header_parameters.vh"
) (
    input i_clk,
    input i_ap_rst_n,
    input [CLUSTER_ID_WIDTH-1:0] i_cluster_id,
    input [IP_PORT_WIDTH-1:0] i_KIP_port_number,
    // AXI-Stream interface from Network Bridge
    input from_nb_tvalid,
    output logic from_nb_tready,
    input [AXIS_DATA_WIDTH-1:0] from_nb_tdata,
    input [AXIS_KEEP_WIDTH-1:0] from_nb_tkeep,
    input [AXIS_FROM_NB_TDEST_WIDTH-1:0] from_nb_tid,
    input [AXIS_FROM_NB_TDEST_WIDTH-1:0] from_nb_tdest,
    input [AXIS_FROM_NB_TUSER_WIDTH-1:0] from_nb_tuser,
    input from_nb_tlast,
    // AXI-Stream interface from WAN Number Node
    input from_WNN_tvalid,
    output logic from_WNN_tready,
    input [WAN_SEQUENCE_NUMBER_WIDTH-1:0] from_WNN_tdata, // Sequence number
    input [AXIS_WAN_TDEST_WIDTH-1:0] from_WNN_tdest, // CTDEST
    input from_WNN_tuser, // Lock
    // AXI-Stream interface to Control module
    output logic to_ctrl_tvalid,
    input to_ctrl_tready,
    output logic [AXIS_DATA_WIDTH-1:0] to_ctrl_tdata,
    output logic [AXIS_KEEP_WIDTH-1:0] to_ctrl_tkeep,
    output logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] to_ctrl_tid,
    output logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] to_ctrl_tdest,
    output logic [AXIS_FROM_NB_TUSER_WIDTH-1:0] to_ctrl_tuser,
    output logic to_ctrl_tlast,
    // AXI-Stream to Network Bridge KnownIP Interface
    output logic to_nb_KIP_tvalid,
    input to_nb_KIP_tready,
    output logic [AXIS_DATA_WIDTH-1:0] to_nb_KIP_tdata,
    output logic [AXIS_KEEP_WIDTH-1:0] to_nb_KIP_tkeep,
    output logic [AXIS_KIP_TUSER_WIDTH-1:0] to_nb_KIP_tuser,
    output logic to_nb_KIP_tlast,
    // AXI-Stream interface to WAN Number Node transmitter
    output logic to_WNN_tvalid,
    input to_WNN_tready,
    output logic [RPN_MSG_TYPE_WIDTH-1:0] to_WNN_tdata,
    output logic [AXIS_WAN_TDEST_WIDTH-1:0] to_WNN_tdest
);

    // Parameters
    `include "ctrl_api_reliability_message_parameters.vh"
    `include "ctrl_api_message_parameters.vh"
    localparam STATE_IDLE = 0;
    localparam STATE_SEND_WAN_SEQ_NUM_CHECK_TO_WNN = 1;
    localparam STATE_WAIT_WAN_SEQ_NUM_RDATA_FROM_WNN = 2;
    localparam STATE_SEND_WAN_SEQ_NUM_WRITE_TO_WNN = 3;
    localparam STATE_SEND_TO_CTRL = 4;
    localparam STATE_SEND_ACK_TO_NB_KIP = 5;

    // Definitions
    // Core State FSM
    logic [3:0] r_core_state;
    logic [3:0] w_next_core_state;
    // Sender Metadata
    logic [WAN_SEQUENCE_NUMBER_WIDTH-1:0] r_sender_sequence_number;
    logic [CLUSTER_ID_WIDTH-1:0] r_sender_ctid;
    logic [IP_ADDRESS_WIDTH-1:0] r_sender_ip_addr;
    logic [WAN_SEQUENCE_NUMBER_WIDTH-1:0] w_sender_sequence_number;
    logic [CLUSTER_ID_WIDTH-1:0] w_sender_ctid;
    logic [IP_ADDRESS_WIDTH-1:0] w_sender_ip_addr;
    // AXI-Stream interface to Control
    logic [PUB_KIP_DATA_WIDTH-1:0] r_to_ctrl_tdata;
    logic [AXIS_KEEP_WIDTH-1:0] r_to_ctrl_tkeep;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] r_to_ctrl_tid;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] r_to_ctrl_tdest;
    logic [AXIS_FROM_NB_TUSER_WIDTH-1:0] r_to_ctrl_tuser;
    logic [PUB_KIP_DATA_WIDTH-1:0] w_to_ctrl_tdata;
    logic [AXIS_KEEP_WIDTH-1:0] w_to_ctrl_tkeep;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] w_to_ctrl_tid;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] w_to_ctrl_tdest;
    logic [AXIS_FROM_NB_TUSER_WIDTH-1:0] w_to_ctrl_tuser;
    // Other
    logic [WAN_SEQUENCE_NUMBER_WIDTH-1:0] w_max_sequence_number;

    // Assignments
    // AXI-Stream interface from Network Bridge
    assign from_nb_tready = (r_core_state == STATE_IDLE) ? 1 : 0;
    // AXI-Stream interface from WAN Number Node
    assign from_WNN_tready = (r_core_state == STATE_WAIT_WAN_SEQ_NUM_RDATA_FROM_WNN) ? 1 : 0;
    // AXI-Stream interface to Control module
    assign to_ctrl_tvalid = (r_core_state == STATE_SEND_TO_CTRL) ? 1 : 0;
    assign to_ctrl_tdata[PUB_KIP_DATA_WIDTH-1:0] = r_to_ctrl_tdata;
    assign to_ctrl_tdata[AXIS_DATA_WIDTH-1:PUB_KIP_DATA_WIDTH] = 0;
    assign to_ctrl_tkeep = r_to_ctrl_tkeep;
    assign to_ctrl_tid = r_to_ctrl_tid;
    assign to_ctrl_tdest = r_to_ctrl_tdest;
    assign to_ctrl_tuser = r_to_ctrl_tuser;
    assign to_ctrl_tlast = 1;
    // AXI-Stream to Network Bridge KnownIP Interface
    assign to_nb_KIP_tvalid = (r_core_state == STATE_SEND_ACK_TO_NB_KIP) ? 1 : 0;
    // TDATA channel
    assign to_nb_KIP_tdata[RPN_MSG_TYPE_WIDTH-1:0] = RPN_MSG_TYPE_KIP_ACK;
    assign to_nb_KIP_tdata[KIP_ACK_SENDER_CTID_OFFSET+:KIP_ACK_SENDER_CTID_WIDTH] = i_cluster_id;
    assign to_nb_KIP_tdata[KIP_ACK_SEQUENCE_NUMBER_OFFSET+:KIP_ACK_SEQUENCE_NUMBER_WIDTH] = r_sender_sequence_number;
    assign to_nb_KIP_tdata[AXIS_DATA_WIDTH-1:(KIP_ACK_SEQUENCE_NUMBER_OFFSET+KIP_ACK_SEQUENCE_NUMBER_WIDTH)] = 0;
    assign to_nb_KIP_tkeep = 'hFFFFFFFFFFFFFFFF;
    // TUSER channel
    assign to_nb_KIP_tuser[IP_ADDRESS_WIDTH-1:0] = r_sender_ip_addr;
    assign to_nb_KIP_tuser[KIP_TUSER_SRC_PORT_OFFSET+:KIP_TUSER_SRC_PORT_WIDTH] = i_KIP_port_number;
    assign to_nb_KIP_tuser[KIP_TUSER_DEST_PORT_OFFSET+:KIP_TUSER_DEST_PORT_WIDTH] = i_KIP_port_number;
    assign to_nb_KIP_tlast = 1;
    // AXI-Stream interface to WAN Number Node transmitter
    assign to_WNN_tvalid = (r_core_state == STATE_SEND_WAN_SEQ_NUM_CHECK_TO_WNN
                         || r_core_state == STATE_SEND_WAN_SEQ_NUM_WRITE_TO_WNN) ? 1 : 0;
    assign to_WNN_tdest = r_sender_ctid;
    // Send different messages to WNN Repo depending on processing stage
    always_comb begin
        to_WNN_tdata = 0;
        if (r_core_state == STATE_SEND_WAN_SEQ_NUM_CHECK_TO_WNN)
            to_WNN_tdata = RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_CHECK;
        else if (r_core_state == STATE_SEND_WAN_SEQ_NUM_WRITE_TO_WNN)
            to_WNN_tdata = RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_WRITE;
        else
            to_WNN_tdata = 0;
    end
    // Other
    assign w_max_sequence_number[WAN_SEQUENCE_NUMBER_WIDTH-1:0] = -1;

    // Core State FSM
    always_comb begin
        w_next_core_state = STATE_IDLE;
        case(r_core_state)
            STATE_IDLE: begin
                w_next_core_state = (from_nb_tvalid == 1) ? STATE_SEND_WAN_SEQ_NUM_CHECK_TO_WNN: STATE_IDLE;
            end
            STATE_SEND_WAN_SEQ_NUM_CHECK_TO_WNN: begin
                w_next_core_state = (to_WNN_tready == 1) ? STATE_WAIT_WAN_SEQ_NUM_RDATA_FROM_WNN : STATE_SEND_WAN_SEQ_NUM_CHECK_TO_WNN;
            end
            STATE_WAIT_WAN_SEQ_NUM_RDATA_FROM_WNN: begin
                if (from_WNN_tvalid == 1) begin
                    // Case 1: The sequence number has looped back to 0. This is a correct new sequence number.
                    if (from_WNN_tdata == w_max_sequence_number
                        && r_sender_sequence_number == 0)
                        w_next_core_state = STATE_SEND_WAN_SEQ_NUM_WRITE_TO_WNN;
                    // Case 2: The incoming WAN sequence number matches the one the WNN repo sent us
                    else if (r_sender_sequence_number == from_WNN_tdata + 1)
                        w_next_core_state = STATE_SEND_WAN_SEQ_NUM_WRITE_TO_WNN;
                    // Case 3: The incoming WAN sequence number is a re-transmission from the previous transaction, transmit an ACK without doing anything
                    else if (r_sender_sequence_number == from_WNN_tdata)
                        w_next_core_state = STATE_SEND_ACK_TO_NB_KIP;
                    // Case 4: The incoming WAN sequence number is incorrect, ignore it
                    else
                        w_next_core_state = STATE_IDLE;
                end
                else
                    w_next_core_state = STATE_WAIT_WAN_SEQ_NUM_RDATA_FROM_WNN;
            end
            STATE_SEND_WAN_SEQ_NUM_WRITE_TO_WNN: begin
                w_next_core_state = (to_WNN_tready == 1) ? STATE_SEND_TO_CTRL : STATE_SEND_WAN_SEQ_NUM_WRITE_TO_WNN;
            end
            STATE_SEND_TO_CTRL: begin
                w_next_core_state = (to_ctrl_tready == 1) ? STATE_SEND_ACK_TO_NB_KIP : STATE_SEND_TO_CTRL;
            end
            STATE_SEND_ACK_TO_NB_KIP: begin
                w_next_core_state = (to_nb_KIP_tready == 1) ? STATE_IDLE : STATE_SEND_ACK_TO_NB_KIP;
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
        w_sender_ctid = 0;
        w_to_ctrl_tdata = 0;
        w_to_ctrl_tkeep = 0;
        w_to_ctrl_tid = 0;
        w_to_ctrl_tdest = 0;
        w_to_ctrl_tuser = 0;
        if (r_core_state == STATE_IDLE) begin
            if (from_nb_tvalid == 1) begin
                w_to_ctrl_tdata[PUB_KIP_DATA_WIDTH-1:0] = from_nb_tdata[PUB_KIP_DATA_OFFSET+:PUB_KIP_DATA_WIDTH]; 
                w_to_ctrl_tkeep = from_nb_tkeep;
                // TID and TDEST from Control RX Network Bridge will be incorrect for KIP PUB packets, get these fields from the KIP packet data itself
                w_to_ctrl_tid = from_nb_tdata[(PUB_KIP_DATA_OFFSET+AXIS_KIP_SENDER_TID_OFFSET)+:AXIS_KIP_SENDER_TID_WIDTH];
                w_to_ctrl_tdest = from_nb_tdata[(PUB_KIP_DATA_OFFSET+AXIS_KIP_TID_OFFSET)+:AXIS_KIP_TID_WIDTH];
                w_to_ctrl_tuser = from_nb_tuser;
                w_sender_sequence_number = from_nb_tdata[PUB_KIP_SEQUENCE_NUMBER_OFFSET+:PUB_KIP_SEQUENCE_NUMBER_WIDTH]; 
                w_sender_ctid = from_nb_tdata[PUB_KIP_SENDER_CTID_OFFSET+:PUB_KIP_SENDER_CTID_WIDTH]; 
                w_sender_ip_addr = from_nb_tuser[IP_ADDRESS_WIDTH-1:0];
            end
            else begin
                w_sender_sequence_number = 0;
                w_sender_ctid = 0;
                w_sender_ip_addr = 0;
                w_to_ctrl_tdata = 0;
                w_to_ctrl_tkeep = 0;
                w_to_ctrl_tid = 0;
                w_to_ctrl_tdest = 0;
                w_to_ctrl_tuser = 0;
            end
        end
        else begin
            w_sender_sequence_number = r_sender_sequence_number;
            w_sender_ctid = r_sender_ctid;
            w_sender_ip_addr = r_sender_ip_addr;
            w_to_ctrl_tdata = r_to_ctrl_tdata;
            w_to_ctrl_tkeep = r_to_ctrl_tkeep;
            w_to_ctrl_tid = r_to_ctrl_tid;
            w_to_ctrl_tdest = r_to_ctrl_tdest;
            w_to_ctrl_tuser = r_to_ctrl_tuser;
        end
    end
    always_ff @(posedge i_clk, negedge i_ap_rst_n) begin
        if (i_ap_rst_n == 0) begin
            r_sender_sequence_number <= 0;
            r_sender_ctid <= 0;
            r_sender_ip_addr <= 0;
            r_to_ctrl_tdata <= 0;
            r_to_ctrl_tkeep <= 0;
            r_to_ctrl_tid <= 0;
            r_to_ctrl_tdest <= 0;
            r_to_ctrl_tuser <= 0;
        end
        else begin
            r_sender_sequence_number <= w_sender_sequence_number;
            r_sender_ctid <= w_sender_ctid;
            r_sender_ip_addr <= w_sender_ip_addr;
            r_to_ctrl_tdata <= w_to_ctrl_tdata;
            r_to_ctrl_tkeep <= w_to_ctrl_tkeep;
            r_to_ctrl_tid <= w_to_ctrl_tid;
            r_to_ctrl_tdest <= w_to_ctrl_tdest;
            r_to_ctrl_tuser <= w_to_ctrl_tuser;
        end
    end
endmodule