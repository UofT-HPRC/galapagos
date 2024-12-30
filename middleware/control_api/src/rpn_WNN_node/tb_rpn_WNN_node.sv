module tb #(
    `include "ctrl_api_reliability_header_parameters.vh"
    `include "ctrl_api_header_parameters.vh"
) ();

    // Parameters
    `include "ctrl_api_message_parameters.vh"
    `include "ctrl_api_reliability_message_parameters.vh"
    localparam ACK_TIMEOUT = 10;
    localparam SEQ_NUM_REPLY_TIMEOUT = 15;

    // IDs
    localparam DUT_NODE_ID = 3;
    localparam DUT_IP_ADDRESS = 'h0A010802;
    localparam REMOTE_IP_ADDRESS = 'h0A010868; 
    localparam KIP_PORT = 'hFB;
    localparam WAN_SEQUENCE_NUMBER = 3301;
    localparam WAN_NUM_NODE_ID = 'hAC;
    integer i;

    // Declarations
    logic r_clk;
    logic r_resetn;
    // AXI-Stream interface from reliability nodes. 
    logic r_from_rpn_tvalid;
    logic w_from_rpn_tready;
    logic [AXIS_DATA_WIDTH-1:0] r_from_rpn_tdata;
    logic [AXIS_WAN_TDEST_WIDTH-1:0] r_from_rpn_tdest;
    // AXI-Stream interface from Network Bridge
    logic r_from_nb_tvalid;
    logic w_from_nb_tready;
    logic [AXIS_DATA_WIDTH-1:0] r_from_nb_tdata;
    logic [AXIS_KEEP_WIDTH-1:0] r_from_nb_tkeep;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] r_from_nb_tid;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] r_from_nb_tdest;
    logic [AXIS_FROM_NB_TUSER_WIDTH-1:0] r_from_nb_tuser;
    logic r_from_nb_tlast;
    // AXI-Stream to KIP Interface
    logic w_to_nb_KIP_tvalid;
    logic r_to_nb_KIP_tready;
    logic [AXIS_DATA_WIDTH-1:0] w_to_nb_KIP_tdata;
    logic [AXIS_KEEP_WIDTH-1:0] w_to_nb_KIP_tkeep;
    logic [AXIS_KIP_TUSER_WIDTH-1:0] w_to_nb_KIP_tuser;
    logic w_to_nb_KIP_tlast;
    // AXI-Stream to RPN Interface
    logic w_to_rpn_tvalid;
    logic r_to_rpn_tready;
    logic [WAN_SEQUENCE_NUMBER_WIDTH-1:0] w_to_rpn_tdata;
    logic [WAN_NUM_TDEST_WIDTH-1:0] w_to_rpn_tdest;
    logic w_to_rpn_tuser;
    // Other
    logic r_network_bridge_test_enable; // When set to 1, TB will send data "from GULF-Stream" according to the registers below
    logic [AXIS_DATA_WIDTH-1:0] r_network_bridge_test_tdata; 
    logic [AXIS_LAN_TDEST_WIDTH-1:0] r_network_bridge_test_tid;
    logic [AXIS_LAN_TDEST_WIDTH-1:0] r_network_bridge_test_tdest;
    logic [AXIS_KIP_TUSER_WIDTH-1:0] r_network_bridge_test_tuser;
    // Used to simulate timeouts from GULF-Stream
    logic [31:0] r_simulated_latency_cycles; // When set to non-zero, GULF-Stream will wait that number of cycles after receiving a packet to send a response
    logic [31:0] r_num_cycles_waited;
    logic r_packet_received_from_dut;
    logic [NODE_ID_WIDTH-1:0] r_destination_node_id;

    // DUT
    rpn_WNN_node #(
        .ACK_TIMEOUT(ACK_TIMEOUT),
        .SEQ_NUM_REPLY_TIMEOUT(SEQ_NUM_REPLY_TIMEOUT)
    ) DUT (
        .i_clk(r_clk),
        .i_ap_rst_n(r_resetn),
        .i_node_id(DUT_NODE_ID),
        .i_WAN_number_node_id(WAN_NUM_NODE_ID),
        .i_WAN_number_node_ip_addr(REMOTE_IP_ADDRESS),
        .i_KIP_port_number(KIP_PORT),
        // AXI-Stream interface from reliability nodes.
        .from_rpn_tvalid(r_from_rpn_tvalid),
        .from_rpn_tready(w_from_rpn_tready),
        .from_rpn_tdata(r_from_rpn_tdata),
        .from_rpn_tdest(r_from_rpn_tdest),
        // AXI-Stream interface from Network Bridge
        .from_nb_tvalid(r_from_nb_tvalid),
        .from_nb_tready(w_from_nb_tready),
        .from_nb_tdata(r_from_nb_tdata),
        .from_nb_tkeep(r_from_nb_tkeep),
        .from_nb_tid(r_from_nb_tid),
        .from_nb_tdest(r_from_nb_tdest),
        .from_nb_tuser(r_from_nb_tuser),
        .from_nb_tlast(r_from_nb_tlast),
        // AXI-Stream to Network Bridge KIP Interface
        .to_nb_KIP_tvalid(w_to_nb_KIP_tvalid),
        .to_nb_KIP_tready(r_to_nb_KIP_tready),
        .to_nb_KIP_tdata(w_to_nb_KIP_tdata),
        .to_nb_KIP_tkeep(w_to_nb_KIP_tkeep),
        .to_nb_KIP_tuser(w_to_nb_KIP_tuser),
        .to_nb_KIP_tlast(w_to_nb_KIP_tlast),
        // AXI-Stream to WAN TX Interface
        .to_rpn_tvalid(w_to_rpn_tvalid),
        .to_rpn_tready(r_to_rpn_tready),
        .to_rpn_tdata(w_to_rpn_tdata),
        .to_rpn_tdest(w_to_rpn_tdest),
        .to_rpn_tuser(w_to_rpn_tuser)
    );

    // clock generator (100MHz, MUST BE BLOCKING)
    initial begin
        r_clk = 1;
        forever
            #5 r_clk = ~r_clk;
    end 

    // Reset Logic (for 10 cycles)
    initial begin
        r_resetn <= 0;
        #100 r_resetn <= 1;
    end

    // Constants
    initial begin
        // From Network-Bridge Interface
        r_from_nb_tkeep = 'hFFFFFFFFFFFFFFFF;
        r_from_nb_tid = 0; // Not used
        r_from_nb_tdest = 0; // Not used
        r_from_nb_tlast = 1;
        // To KIP Interface
        r_to_nb_KIP_tready = 1;
        // to-RPN interfaces
        r_to_rpn_tready = 1;
    end

    // // Test Logic
    // initial begin
    //     r_network_bridge_test_enable <= 0;
    //     r_network_bridge_test_tdata <= 0;
    //     r_network_bridge_test_tuser <= 0;
    //     r_simulated_latency_cycles <= 0;
    //     r_from_rpn_tvalid <= 0;
    //     r_from_rpn_tdata <= 0;
    //     r_from_rpn_tdest <= 0;
    //     #100
    //     r_from_rpn_tvalid <= 1;
    //     // Test sending one of each expected message types
    //     // WAN TX requesting sequence number
    //     r_from_rpn_tdata <= RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_REQUEST;
    //     r_from_rpn_tdest <= 'hAAAA;
    //     #100
    //     // KIP RX updating sequence number
    //     r_from_rpn_tdata <= RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_WRITE; // How do we write?
    //     r_from_rpn_tdest <= 'hBBBB;
    //     #100
    //     // KIP TX requesting sequence Number
    //     r_from_rpn_tdata <= RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_REQUEST;
    //     r_from_rpn_tdest <= 'hCCCC;
    //     #100
    //     // LAN RX updating sequence number
    //     r_from_rpn_tdata <= RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_WRITE;
    //     r_from_rpn_tdest <= 'hDDDD;
    //     #100
    //     // KIP RX checking sequence number
    //     r_from_rpn_tdata <= RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_CHECK;
    //     r_from_rpn_tdest <= 'hEEEE;
    //     #1000
    //     $finish;
    // end
    
    // // Test re-transmission of sequence numbers and requests
    // initial begin
    //     r_network_bridge_test_enable <= 0;
    //     r_network_bridge_test_tdata <= 0;
    //     r_network_bridge_test_tuser <= 0;
    //     r_simulated_latency_cycles <= SEQ_NUM_REPLY_TIMEOUT + 5;
    //     r_from_rpn_tvalid <= 0;
    //     r_from_rpn_tdata <= 0;
    //     r_from_rpn_tdest <= 0;
    //     #100
    //     r_from_rpn_tvalid <= 1;
    //     // Test sending one of each expected message types
    //     // WAN TX requesting sequence number
    //     r_from_rpn_tdata <= RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_REQUEST;
    //     r_from_rpn_tdest <= 'hAAAA;
    //     #100
    //     r_from_rpn_tdata <= RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_WRITE; // How do we write?
    //     r_from_rpn_tdest <= 'hBBBB;
    //     #100
    //     r_from_rpn_tdata <= RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_REQUEST;
    //     r_from_rpn_tdest <= 'hCCCC;
    //     #100
    //     r_from_rpn_tdata <= RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_WRITE;
    //     r_from_rpn_tdest <= 'hDDDD;
    //     #100
    //     // KIP RX checking sequence number
    //     r_from_rpn_tdata <= RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_CHECK;
    //     r_from_rpn_tdest <= 'hEEEE;
    //     #1000
    //     $finish;
    // end
   
    // Test multiple ACKs arriving at different times. Disable Network Bridge
    initial begin
        r_network_bridge_test_enable <= 0;
        r_network_bridge_test_tdata <= 0;
        r_network_bridge_test_tuser <= 0;
        r_simulated_latency_cycles <= 0;
        r_from_rpn_tvalid <= 0;
        r_from_rpn_tdata <= 0;
        r_from_rpn_tdest <= 0;
        // Network Bridge
        r_from_nb_tvalid <= 0;
        r_from_nb_tdata <= 0;
        r_from_nb_tid <= 0;
        r_from_nb_tdest <= 0;
        r_from_nb_tuser <= 0;
        r_from_nb_tlast <= 1;
        #100
        // Send SEQ NUM Reply
        r_from_nb_tvalid <= 1;
        // TDATA
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_WAN_NUM_SEQ_NUM_REPLY;
        r_from_nb_tdata[GW_KIP_SENDER_NODE_ID_OFFSET+:GW_KIP_SENDER_NODE_ID_WIDTH] <= WAN_NUM_NODE_ID;
        r_from_nb_tdata[GW_KIP_SEQUENCE_NUMBER_OFFSET+:GW_KIP_SEQUENCE_NUMBER_WIDTH] <= 1;
        r_from_nb_tdata[AXIS_DATA_WIDTH-1:(GW_KIP_SEQUENCE_NUMBER_OFFSET+GW_KIP_SEQUENCE_NUMBER_WIDTH)] <= 0;
        // TUSER
        r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= REMOTE_IP_ADDRESS;
        r_from_nb_tuser[KIP_TUSER_SRC_PORT_OFFSET+:KIP_TUSER_SRC_PORT_WIDTH] <= KIP_PORT;
        r_from_nb_tuser[KIP_TUSER_DEST_PORT_OFFSET+:KIP_TUSER_DEST_PORT_WIDTH] <= KIP_PORT;
        #100
        r_from_rpn_tvalid <= 1;
        // WAN TX requesting sequence number
        r_from_rpn_tdata <= RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_REQUEST;
        r_from_rpn_tdest <= 'hAAAA;
        #100
        // Send ACK with the wrong Message type
        // TDATA
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_REPLY;
        r_from_nb_tdata[GW_KIP_SENDER_NODE_ID_OFFSET+:GW_KIP_SENDER_NODE_ID_WIDTH] <= WAN_NUM_NODE_ID;
        r_from_nb_tdata[GW_KIP_SEQUENCE_NUMBER_OFFSET+:GW_KIP_SEQUENCE_NUMBER_WIDTH] <= w_to_nb_KIP_tdata[GW_KIP_SEQUENCE_NUMBER_OFFSET+:GW_KIP_SEQUENCE_NUMBER_WIDTH];
        r_from_nb_tdata[AXIS_DATA_WIDTH-1:(GW_KIP_SEQUENCE_NUMBER_OFFSET+GW_KIP_SEQUENCE_NUMBER_WIDTH)] <= 0;
        #100
        // Send ACK with wrong sender node ID
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_REPLY;
        r_from_nb_tdata[GW_KIP_SENDER_NODE_ID_OFFSET+:GW_KIP_SENDER_NODE_ID_WIDTH] <= 0;
        #100
        // Send ACK with wrong sequence number
        r_from_nb_tdata[GW_KIP_SENDER_NODE_ID_OFFSET+:GW_KIP_SENDER_NODE_ID_WIDTH] <= WAN_NUM_NODE_ID;
        r_from_nb_tdata[GW_KIP_SEQUENCE_NUMBER_OFFSET+:GW_KIP_SEQUENCE_NUMBER_WIDTH] <= w_to_nb_KIP_tdata[GW_KIP_SEQUENCE_NUMBER_OFFSET+:GW_KIP_SEQUENCE_NUMBER_WIDTH]-1;
        #100
        // Send Correct ACK
        r_from_nb_tdata[GW_KIP_SEQUENCE_NUMBER_OFFSET+:GW_KIP_SEQUENCE_NUMBER_WIDTH] <= w_to_nb_KIP_tdata[GW_KIP_SEQUENCE_NUMBER_OFFSET+:GW_KIP_SEQUENCE_NUMBER_WIDTH];
        #10
        // Test all message types have correct expected replies
        // Outgoing SEQ NUM WRITE
        r_from_rpn_tdata <= RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_WRITE; // How do we write?
        r_from_rpn_tdest <= 'hBBBB;
        #50
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_REPLY;
        r_from_nb_tdata[GW_KIP_SEQUENCE_NUMBER_OFFSET+:GW_KIP_SEQUENCE_NUMBER_WIDTH] <= w_to_nb_KIP_tdata[GW_KIP_SEQUENCE_NUMBER_OFFSET+:GW_KIP_SEQUENCE_NUMBER_WIDTH];
        #50
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_BRESP;
        #10
        // Incoming SEQ NUM Request
        r_from_rpn_tdata <= RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_REQUEST;
        r_from_rpn_tdest <= 'hCCCC;
        #50
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_BRESP;
        r_from_nb_tdata[GW_KIP_SEQUENCE_NUMBER_OFFSET+:GW_KIP_SEQUENCE_NUMBER_WIDTH] <= w_to_nb_KIP_tdata[GW_KIP_SEQUENCE_NUMBER_OFFSET+:GW_KIP_SEQUENCE_NUMBER_WIDTH];
        #50
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_REPLY;
        #10
        // Incoming SEQ NUM Write
        r_from_rpn_tdata <= RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_WRITE;
        r_from_rpn_tdest <= 'hDDDD;
        #50
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_REPLY;
        r_from_nb_tdata[GW_KIP_SEQUENCE_NUMBER_OFFSET+:GW_KIP_SEQUENCE_NUMBER_WIDTH] <= w_to_nb_KIP_tdata[GW_KIP_SEQUENCE_NUMBER_OFFSET+:GW_KIP_SEQUENCE_NUMBER_WIDTH];
        #50
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_BRESP;
        #10
        // Outgoing SEQ NUM Check
        r_from_rpn_tdata <= RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_CHECK;
        r_from_rpn_tdest <= 'hDDDD;
        #50
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_REPLY;
        r_from_nb_tdata[GW_KIP_SEQUENCE_NUMBER_OFFSET+:GW_KIP_SEQUENCE_NUMBER_WIDTH] <= w_to_nb_KIP_tdata[GW_KIP_SEQUENCE_NUMBER_OFFSET+:GW_KIP_SEQUENCE_NUMBER_WIDTH];
        #50
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_RDATA;
        #1000
        $finish;
    end


    // // Simulate Network Bridge: Respond to SEQ NUM REQUESTS and PUBs
    // always @(posedge r_clk, negedge r_resetn) begin
    //     if (r_resetn == 0) begin
    //         r_from_nb_tvalid <= 0;
    //         r_from_nb_tdata <= 0;
    //         r_from_nb_tuser <= 0;
    //         r_num_cycles_waited <= 0;
    //         r_packet_received_from_dut <= 0;
    //     end
    //     // If packet has been received by DUT, stop sending packet from Network Bridge
    //     if (r_from_nb_tvalid == 1 && w_from_nb_tready == 1) begin
    //         r_from_nb_tvalid <= 0;
    //         r_from_nb_tdata <= r_from_nb_tdata;
    //         r_from_nb_tuser <= r_from_nb_tuser;
    //         r_num_cycles_waited <= 0;
    //     end
    //     // If simulated latency is enabled, stall GS communications until after latency is over
    //     else if (r_packet_received_from_dut == 1) begin
    //         if (r_num_cycles_waited == r_simulated_latency_cycles) begin
    //             r_num_cycles_waited <= 0;
    //             r_packet_received_from_dut <= 0;
    //             r_from_nb_tvalid <= 1;
    //         end
    //         else begin
    //             r_num_cycles_waited <= r_num_cycles_waited + 1;
    //             r_packet_received_from_dut <= 1;
    //             r_from_nb_tvalid <= 0;
    //         end
    //         r_from_nb_tdata <= r_from_nb_tdata;
    //         r_from_nb_tuser <= r_from_nb_tuser;
    //     end
        
    //     else if (w_to_nb_KIP_tvalid == 1) begin
    //         if (r_simulated_latency_cycles == 0) begin
    //             r_from_nb_tvalid <= 1;
    //             r_packet_received_from_dut <= 0;
    //             r_num_cycles_waited <= 0;
    //         end
    //         else begin
    //             r_from_nb_tvalid <= 0;
    //             r_packet_received_from_dut <= 1;
    //             r_num_cycles_waited <= 1;
    //         end
    //         // Respond to the message with the appropriate reply
    //         case(w_to_nb_KIP_tdata[RPN_MSG_TYPE_WIDTH-1:0])
    //             RPN_MSG_TYPE_WAN_NUM_SEQ_NUM_CHECK: r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_WAN_NUM_SEQ_NUM_REPLY;
    //             RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_REQUEST: r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_REPLY;
    //             RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_WRITE: r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_BRESP;
    //             RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_REQUEST: r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_REPLY;
    //             RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_WRITE: r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_BRESP;
    //             RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_CHECK: r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_RDATA;
    //         endcase
    //         r_from_nb_tdata[GW_KIP_SENDER_NODE_ID_OFFSET+:GW_KIP_SENDER_NODE_ID_WIDTH] <= WAN_NUM_NODE_ID;
    //         // If this is an initial sequence number check, give it 1
    //         if (w_to_nb_KIP_tdata[RPN_MSG_TYPE_WIDTH-1:0] == RPN_MSG_TYPE_WAN_NUM_SEQ_NUM_CHECK)
    //             r_from_nb_tdata[GW_KIP_SEQUENCE_NUMBER_OFFSET+:GW_KIP_SEQUENCE_NUMBER_WIDTH] <= 1;
    //         else
    //             r_from_nb_tdata[GW_KIP_SEQUENCE_NUMBER_OFFSET+:GW_KIP_SEQUENCE_NUMBER_WIDTH] <= w_to_nb_KIP_tdata[GW_KIP_SEQUENCE_NUMBER_OFFSET+:GW_KIP_SEQUENCE_NUMBER_WIDTH];
    //         r_from_nb_tdata[GW_KIP_WAN_SEQUENCE_NUMBER_OFFSET+:GW_KIP_WAN_SEQUENCE_NUMBER_WIDTH] <= WAN_SEQUENCE_NUMBER;
    //         r_from_nb_tdata[GW_KIP_WAN_CTDEST_OFFSET+:GW_KIP_WAN_CTDEST_WIDTH] <= w_to_nb_KIP_tdata[GW_KIP_WAN_CTDEST_OFFSET+:GW_KIP_WAN_CTDEST_WIDTH];
    //         r_from_nb_tdata[GW_KIP_WAN_LOCK_OFFSET] <= 1;
    //         r_from_nb_tdata[AXIS_DATA_WIDTH-1:GW_KIP_WAN_LOCK_OFFSET+1] <= 0;
    //         r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= REMOTE_IP_ADDRESS;
    //         r_from_nb_tuser[KIP_TUSER_SRC_PORT_OFFSET+:KIP_TUSER_SRC_PORT_WIDTH] <= KIP_PORT;
    //         r_from_nb_tuser[KIP_TUSER_DEST_PORT_OFFSET+:KIP_TUSER_DEST_PORT_WIDTH] <= KIP_PORT;
    //     end
    //     // Case 2:Test multiple packets coming from Network Bridge
    //     else if (r_network_bridge_test_enable == 1) begin
    //         r_from_nb_tvalid <= 1;
    //         r_from_nb_tdata <= r_network_bridge_test_tdata;
    //         r_from_nb_tuser <= r_network_bridge_test_tuser;
    //     end
    //     else begin
    //         r_from_nb_tvalid <= 0;
    //         r_from_nb_tdata <= r_from_nb_tdata;
    //         r_from_nb_tuser <= r_from_nb_tuser;
    //     end
    // end

endmodule