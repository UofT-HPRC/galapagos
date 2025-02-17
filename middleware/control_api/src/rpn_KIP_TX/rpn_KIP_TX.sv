module rpn_KIP_TX #(
    parameter ACK_TIMEOUT = 1800, // Number of cycles we wait for ACK before resending PUB
    `include "ctrl_api_reliability_header_parameters.vh"
    `include "ctrl_api_header_parameters.vh"
) (
    input i_clk,
    input i_ap_rst_n,
    input [AXIS_WAN_TDEST_WIDTH-1:0] i_cluster_id,
    input [IP_PORT_WIDTH-1:0] i_KIP_port_number,
    // AXI-Stream to-KIP interface from Network to AXI-Lite Converter
    input from_ctrl_tvalid,
    output from_ctrl_tready,
    input [AXIS_DATA_WIDTH-1:0] from_ctrl_tdata,
    input [AXIS_KEEP_WIDTH-1:0] from_ctrl_tkeep,
    input [AXIS_KIP_TUSER_WIDTH-1:0] from_ctrl_tuser,
    input from_ctrl_tlast,
    // AXI-Stream interface from WNN Node
    input from_WNN_tvalid,
    output logic from_WNN_tready,
    input [WAN_SEQUENCE_NUMBER_WIDTH-1:0] from_WNN_tdata, // Sequence number
    input [WAN_NUM_TDEST_WIDTH-1:0] from_WNN_tdest, // CTDEST
    input from_WNN_tuser, // Lock, ignored for KIP TX
    // AXI-Stream interface from Network Bridge
    input from_nb_tvalid,
    output logic from_nb_tready,
    input [AXIS_DATA_WIDTH-1:0] from_nb_tdata,
    input [AXIS_KEEP_WIDTH-1:0] from_nb_tkeep,
    input [AXIS_FROM_NB_TDEST_WIDTH-1:0] from_nb_tid,
    input [AXIS_FROM_NB_TDEST_WIDTH-1:0] from_nb_tdest,
    input [AXIS_FROM_NB_TUSER_WIDTH-1:0] from_nb_tuser,
    input from_nb_tlast,
    // AXI-Stream to WAN Number Node Interface
    output to_WNN_tvalid,
    input to_WNN_tready,
    output [RPN_MSG_TYPE_WIDTH-1:0] to_WNN_tdata,
    output [AXIS_WAN_TDEST_WIDTH-1:0] to_WNN_tdest,
    // AXI-Stream to Network Bridge WAN Interface
    output to_nb_KIP_tvalid,
    input to_nb_KIP_tready,
    output [AXIS_DATA_WIDTH-1:0] to_nb_KIP_tdata,
    output [AXIS_KEEP_WIDTH-1:0] to_nb_KIP_tkeep,
    output [AXIS_KIP_TUSER_WIDTH-1:0] to_nb_KIP_tuser,
    output to_nb_KIP_tlast
);

    // Parameters
    localparam STATE_IDLE = 0;
    localparam STATE_SEND_WNN_REQUEST = 1; // Send request to get WAN sequence number for the current transaction
    localparam STATE_WAIT_WNN_RESPONSE = 2; // No need to re-transmit because WNN takes care of retransmission
    localparam STATE_SEND_TO_NB_KIP = 4; // Send KIP message to destination
    localparam STATE_WAIT_ACK_FROM_NETWORK_BRIDGE = 5; // Wait for KIP ACK message

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
    logic [AXIS_WAN_TDEST_WIDTH-1:0] r_ctdest;
    logic [AXIS_WAN_TDEST_WIDTH-1:0] w_ctdest;
    logic [WAN_SEQUENCE_NUMBER_WIDTH-1:0] r_WAN_sequence_number; // Tracks the sequence number of the current transaction
    logic [WAN_SEQUENCE_NUMBER_WIDTH-1:0] w_WAN_sequence_number;
    // To Network Bridge KIP Interface
    logic [PUB_KIP_DATA_WIDTH-1:0] r_to_nb_KIP_packet_data; 
    logic [IP_ADDRESS_WIDTH-1:0] r_to_nb_KIP_ip_addr;
    logic [AXIS_KEEP_WIDTH-1:0] r_to_nb_KIP_tkeep;
    logic [PUB_KIP_DATA_WIDTH-1:0] w_to_nb_KIP_packet_data;
    logic [AXIS_KEEP_WIDTH-1:0] w_to_nb_KIP_tkeep;
    logic [IP_ADDRESS_WIDTH-1:0] w_to_nb_KIP_ip_addr;

    // Other
    logic w_correct_ACK_arrived;

    // Assignments
    assign w_correct_ACK_arrived = (from_nb_tvalid == 1 
                                 && from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] == RPN_MSG_TYPE_KIP_ACK
                                 && from_nb_tdata[KIP_ACK_SENDER_CTID_OFFSET+:KIP_ACK_SENDER_CTID_WIDTH] == r_ctdest
                                 && from_nb_tdata[KIP_ACK_SEQUENCE_NUMBER_OFFSET+:KIP_ACK_SEQUENCE_NUMBER_WIDTH] == r_WAN_sequence_number) ? 1 : 0;
    // to-KIP interface from NAC
    assign from_ctrl_tready = (r_core_state == STATE_IDLE) ? 1 : 0;
    // From WNN Node interface
    assign from_WNN_tready = (r_core_state == STATE_WAIT_WNN_RESPONSE) ? 1 : 0;
    // From Network Bridge interface
    // If ACKs arrive after the transaction is complete, just ignore them
    assign from_nb_tready = (r_core_state == STATE_IDLE
                          || r_core_state == STATE_WAIT_ACK_FROM_NETWORK_BRIDGE) ? 1 : 0;  
    // to-WNN interface
    assign to_WNN_tvalid = (r_core_state == STATE_SEND_WNN_REQUEST) ? 1 : 0;
    assign to_WNN_tdata = RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_REQUEST;
    assign to_WNN_tdest = r_ctdest; 
    // to-KIP interface to Network Bridge
    assign to_nb_KIP_tvalid = (r_core_state == STATE_SEND_TO_NB_KIP) ? 1 : 0;
    // to-KIP TDATA
    assign to_nb_KIP_tdata[RPN_MSG_TYPE_WIDTH-1:0] = RPN_MSG_TYPE_KIP_PUB;
    assign to_nb_KIP_tdata[PUB_KIP_SENDER_CTID_OFFSET+:PUB_KIP_SENDER_CTID_WIDTH] = i_cluster_id;
    assign to_nb_KIP_tdata[PUB_KIP_SEQUENCE_NUMBER_OFFSET+:PUB_KIP_SEQUENCE_NUMBER_WIDTH] = r_WAN_sequence_number;
    assign to_nb_KIP_tdata[PUB_KIP_DATA_OFFSET+:PUB_KIP_DATA_WIDTH] = r_to_nb_KIP_packet_data;
    assign to_nb_KIP_tkeep = r_to_nb_KIP_tkeep;
    // to-KIP TUSER
    assign to_nb_KIP_tuser[IP_ADDRESS_WIDTH-1:0] = r_to_nb_KIP_ip_addr;
    assign to_nb_KIP_tuser[KIP_TUSER_SRC_PORT_OFFSET+:KIP_TUSER_SRC_PORT_WIDTH] = i_KIP_port_number;
    assign to_nb_KIP_tuser[KIP_TUSER_DEST_PORT_OFFSET+:KIP_TUSER_DEST_PORT_WIDTH] = i_KIP_port_number;
    assign to_nb_KIP_tlast = 1;   

    // Core State FSM
    always_comb begin
        w_next_core_state = STATE_IDLE;
        case(r_core_state)
            STATE_IDLE: begin
                w_next_core_state = (from_ctrl_tvalid == 1) ? STATE_SEND_WNN_REQUEST : STATE_IDLE;
            end
            STATE_SEND_WNN_REQUEST: begin
                w_next_core_state = (to_WNN_tready == 1) ? STATE_WAIT_WNN_RESPONSE : STATE_SEND_WNN_REQUEST;
            end
            STATE_WAIT_WNN_RESPONSE: begin
                w_next_core_state = (from_WNN_tvalid == 1) ? STATE_SEND_TO_NB_KIP : STATE_WAIT_WNN_RESPONSE;
            end
            STATE_SEND_TO_NB_KIP: begin
                w_next_core_state = (to_nb_KIP_tready == 1) ? STATE_WAIT_ACK_FROM_NETWORK_BRIDGE : STATE_SEND_TO_NB_KIP;
            end
            STATE_WAIT_ACK_FROM_NETWORK_BRIDGE: begin
                // Case 1: Correct ACK has arrived
                if (w_correct_ACK_arrived == 1)
                    w_next_core_state = STATE_IDLE;
                // Case 2: Timeout is over, re-transmit
                else if (r_ACK_num_cycles_waited == ACK_TIMEOUT)
                    w_next_core_state = STATE_SEND_TO_NB_KIP;
                // Case 3: No ACK/Wrong ACK/leftover SEQ NUM REPLY arrive, ignore
                else
                    w_next_core_state = STATE_WAIT_ACK_FROM_NETWORK_BRIDGE;
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

    // Read packet information from the current transaction
    always_comb begin
        if (r_core_state == STATE_IDLE) begin
            if (from_ctrl_tvalid == 1) begin            
                w_ctdest = from_ctrl_tdata[AXIS_KIP_CTDEST_OFFSET+:AXIS_KIP_CTDEST_WIDTH];
                w_to_nb_KIP_packet_data = from_ctrl_tdata[PUB_KIP_DATA_WIDTH-1:0];
                w_to_nb_KIP_ip_addr = from_ctrl_tuser[IP_ADDRESS_WIDTH-1:0];
                w_to_nb_KIP_tkeep = from_ctrl_tkeep;
            end
            else begin
                w_ctdest = 0;
                w_to_nb_KIP_packet_data = 0;
                w_to_nb_KIP_ip_addr = 0;
                w_to_nb_KIP_tkeep = 0;
            end
        end
        else begin
            w_ctdest = r_ctdest;
            w_to_nb_KIP_packet_data = r_to_nb_KIP_packet_data;
            w_to_nb_KIP_ip_addr = r_to_nb_KIP_ip_addr;
            w_to_nb_KIP_tkeep = r_to_nb_KIP_tkeep;
        end
    end
    always_ff @(posedge i_clk, negedge i_ap_rst_n) begin
        if (i_ap_rst_n == 0) begin
            r_ctdest <= 0;
            r_to_nb_KIP_packet_data <= 0;
            r_to_nb_KIP_ip_addr <= 0;
            r_to_nb_KIP_tkeep <= 0;
        end
        else begin
            r_ctdest <= w_ctdest;
            r_to_nb_KIP_packet_data <= w_to_nb_KIP_packet_data;
            r_to_nb_KIP_ip_addr <= w_to_nb_KIP_ip_addr;
            r_to_nb_KIP_tkeep <= w_to_nb_KIP_tkeep;
        end
    end

    // Get sequence number for the current transaction
    always_comb begin
        // Reset in IDLE
        if (r_core_state == STATE_IDLE)
            w_WAN_sequence_number = 0;
        else if (r_core_state == STATE_WAIT_WNN_RESPONSE 
              && from_WNN_tvalid == 1)
            // This is the sequence number of the most current transaction (previously incremented when the forwarded LAN request first arrived), so no incrementing here
            w_WAN_sequence_number = from_WNN_tdata[WAN_SEQUENCE_NUMBER_WIDTH-1:0];
        else
            w_WAN_sequence_number = r_WAN_sequence_number;
    end
    always_ff @(posedge i_clk, negedge i_ap_rst_n) begin
        if (i_ap_rst_n == 0) begin
            r_WAN_sequence_number <= 0;
        end
        else begin
            r_WAN_sequence_number <= w_WAN_sequence_number;
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