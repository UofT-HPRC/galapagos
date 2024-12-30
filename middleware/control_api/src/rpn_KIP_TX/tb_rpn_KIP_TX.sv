module tb #(
    `include "ctrl_api_reliability_header_parameters.vh"
    `include "ctrl_api_header_parameters.vh"
) ();

    // Parameters
    `include "ctrl_api_message_parameters.vh"
    `include "ctrl_api_reliability_message_parameters.vh"
    localparam ACK_TIMEOUT = 10;

    // IDs
    localparam DUT_KERNEL_ID = 'hEE;
    localparam DUT_CLUSTER_ID = 3;
    localparam DUT_IP_ADDRESS = 'h0A010802;
    localparam REMOTE_KERNEL_ID = 'hAB;
    localparam REMOTE_CLUSTER_ID = 5;
    localparam REMOTE_IP_ADDRESS = 'h0A010868; 
    localparam CTRL_PORT = 'hDD;
    localparam KIP_PORT = 'hFB;
    localparam WAN_SEQUENCE_NUMBER = 3300;

    // Declarations
    logic r_clk;
    logic r_resetn;
    // AXI-Stream to-LAN interface from LAN Node Finder
    logic r_from_ctrl_tvalid;
    logic w_from_ctrl_tready;
    logic [AXIS_DATA_WIDTH-1:0] r_from_ctrl_tdata;
    logic [AXIS_KEEP_WIDTH-1:0] r_from_ctrl_tkeep;
    logic [AXIS_KIP_TUSER_WIDTH-1:0] r_from_ctrl_tuser;
    logic r_from_ctrl_tlast;
    // From WNN Interface
    logic r_from_WNN_tvalid;
    logic w_from_WNN_tready;
    logic [WAN_SEQUENCE_NUMBER_WIDTH-1:0] r_from_WNN_tdata; // Sequence number
    logic [AXIS_WAN_TDEST_WIDTH-1:0] r_from_WNN_tdest; // CTDEST
    // AXI-Stream interface from Network Bridge
    logic r_from_nb_tvalid;
    logic w_from_nb_tready;
    logic [AXIS_DATA_WIDTH-1:0] r_from_nb_tdata;
    logic [AXIS_KEEP_WIDTH-1:0] r_from_nb_tkeep;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] r_from_nb_tid;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] r_from_nb_tdest;
    logic [AXIS_FROM_NB_TUSER_WIDTH-1:0] r_from_nb_tuser;
    logic r_from_nb_tlast;
    // To WNN Interface
    logic w_to_WNN_tvalid;
    logic r_to_WNN_tready;
    logic [RPN_MSG_TYPE_WIDTH-1:0] w_to_WNN_tdata;
    logic [AXIS_WAN_TDEST_WIDTH-1:0] w_to_WNN_tdest;
    // AXI-Stream to Network Bridge LAN Interface
    logic w_to_nb_KIP_tvalid;
    logic r_to_nb_KIP_tready;
    logic [AXIS_DATA_WIDTH-1:0] w_to_nb_KIP_tdata;
    logic [AXIS_KEEP_WIDTH-1:0] w_to_nb_KIP_tkeep;
    logic [AXIS_KIP_TUSER_WIDTH-1:0] w_to_nb_KIP_tuser;
    logic w_to_nb_KIP_tlast;
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

    // DUT
    rpn_KIP_TX #(
        .ACK_TIMEOUT(ACK_TIMEOUT)
    ) DUT (
        .i_clk(r_clk),
        .i_ap_rst_n(r_resetn),
        .i_cluster_id(DUT_CLUSTER_ID),
        .i_KIP_port_number(KIP_PORT),
        // AXI-Stream to-KIP interface from NAC
        .from_ctrl_tvalid(r_from_ctrl_tvalid),
        .from_ctrl_tready(w_from_ctrl_tready),
        .from_ctrl_tdata(r_from_ctrl_tdata),
        .from_ctrl_tkeep(r_from_ctrl_tkeep),
        .from_ctrl_tuser(r_from_ctrl_tuser),
        .from_ctrl_tlast(r_from_ctrl_tlast),
        // Interface from WNN Node
        .from_WNN_tvalid(r_from_WNN_tvalid),
        .from_WNN_tready(w_from_WNN_tready),
        .from_WNN_tdata(r_from_WNN_tdata),
        .from_WNN_tdest(r_from_WNN_tdest),
        // AXI-Stream interface from Network Bridge
        .from_nb_tvalid(r_from_nb_tvalid),
        .from_nb_tready(w_from_nb_tready),
        .from_nb_tdata(r_from_nb_tdata),
        .from_nb_tkeep(r_from_nb_tkeep),
        .from_nb_tid(r_from_nb_tid),
        .from_nb_tdest(r_from_nb_tdest),
        .from_nb_tuser(r_from_nb_tuser),
        .from_nb_tlast(r_from_nb_tlast),
        // Interface to WNN
        .to_WNN_tvalid(w_to_WNN_tvalid),
        .to_WNN_tready(r_to_WNN_tready),
        .to_WNN_tdata(w_to_WNN_tdata),
        .to_WNN_tdest(w_to_WNN_tdest),
        // AXI-Stream to Network Bridge KIP Interface
        .to_nb_KIP_tvalid(w_to_nb_KIP_tvalid),
        .to_nb_KIP_tready(r_to_nb_KIP_tready),
        .to_nb_KIP_tdata(w_to_nb_KIP_tdata),
        .to_nb_KIP_tkeep(w_to_nb_KIP_tkeep),
        .to_nb_KIP_tuser(w_to_nb_KIP_tuser),
        .to_nb_KIP_tlast(w_to_nb_KIP_tlast)
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
        // From LAN Node Finder
        r_from_ctrl_tkeep = 'hFFFFFFFFFFFFFFFF;
        r_from_ctrl_tlast = 1;
        // From Network-Bridge Interface
        r_from_nb_tkeep = 'hFFFFFFFFFFFFFFFF;
        r_from_nb_tlast = 1;
        // to-nb-WAN interface
        r_to_nb_KIP_tready = 1;
        // to-WNN Interface
        r_to_WNN_tready = 1;
    end

    // Test Logic
    // initial begin
    //     r_network_bridge_test_enable <= 0;
    //     r_network_bridge_test_tdata <= 0;
    //     r_network_bridge_test_tid <= 0;
    //     r_network_bridge_test_tdest <= 0;
    //     r_network_bridge_test_tuser <= 0;
    //     r_simulated_latency_cycles <= 0;
    //     r_from_ctrl_tvalid <= 0;
    //     r_from_ctrl_tdata <= 0;
    //     r_from_ctrl_tuser <= 0;
    //     #200
    //     // Test sending a KIP message
    //     r_from_ctrl_tvalid <= 1;
    //     r_from_ctrl_tdata[AXIS_KIP_MSG_TYPE_WIDTH-1:0] <= MSG_RDATA;
    //     r_from_ctrl_tdata[AXIS_KIP_DATA_OFFSET+:AXIS_KIP_DATA_WIDTH] <= 'hABABABAB;
    //     r_from_ctrl_tdata[AXIS_KIP_TID_OFFSET+:AXIS_KIP_TID_WIDTH] <= REMOTE_KERNEL_ID;
    //     r_from_ctrl_tdata[AXIS_KIP_SENDER_TID_OFFSET+:AXIS_KIP_SENDER_TID_WIDTH] <= DUT_KERNEL_ID;
    //     r_from_ctrl_tdata[AXIS_KIP_CTDEST_OFFSET+:AXIS_KIP_CTDEST_WIDTH] <= REMOTE_CLUSTER_ID;
    //     r_from_ctrl_tdata[AXIS_DATA_WIDTH-1:(AXIS_KIP_CTDEST_OFFSET+AXIS_KIP_CTDEST_WIDTH)] <= 0;
    //     r_from_ctrl_tuser[IP_ADDRESS_WIDTH-1:0] <= REMOTE_IP_ADDRESS;
    //     r_from_ctrl_tuser[KIP_TUSER_SRC_PORT_OFFSET+:KIP_TUSER_SRC_PORT_WIDTH] <= KIP_PORT;
    //     r_from_ctrl_tuser[KIP_TUSER_DEST_PORT_OFFSET+:KIP_TUSER_DEST_PORT_WIDTH] <= KIP_PORT;

    //     #1000
    //     $finish;
    // end

    // Tested due to other bugs: retransmission, ACK with wrong CTID
    // Test Re-transmission (disable Network Bridge for this)
    initial begin
        r_network_bridge_test_enable <= 0;
        r_network_bridge_test_tdata <= 0;
        r_network_bridge_test_tid <= 0;
        r_network_bridge_test_tdest <= 0;
        r_network_bridge_test_tuser <= 0;
        r_simulated_latency_cycles <= 0;
        r_from_ctrl_tvalid <= 0;
        r_from_ctrl_tdata <= 0;
        r_from_ctrl_tuser <= 0;
        r_from_nb_tvalid <= 0;
        r_from_nb_tdata <= 0;
        r_from_nb_tid <= 0;
        r_from_nb_tdest <= 0;
        r_from_nb_tuser <= 0;
         #200
        // Test sending a WAN message
        r_from_ctrl_tvalid <= 1;
        r_from_ctrl_tdata[AXIS_KIP_MSG_TYPE_WIDTH-1:0] <= MSG_RDATA;
        r_from_ctrl_tdata[AXIS_KIP_DATA_OFFSET+:AXIS_KIP_DATA_WIDTH] <= 'hABABABAB;
        r_from_ctrl_tdata[AXIS_KIP_TID_OFFSET+:AXIS_KIP_TID_WIDTH] <= REMOTE_KERNEL_ID;
        r_from_ctrl_tdata[AXIS_KIP_SENDER_TID_OFFSET+:AXIS_KIP_SENDER_TID_WIDTH] <= DUT_KERNEL_ID;
        r_from_ctrl_tdata[AXIS_KIP_CTDEST_OFFSET+:AXIS_KIP_CTDEST_WIDTH] <= REMOTE_CLUSTER_ID;
        r_from_ctrl_tdata[AXIS_DATA_WIDTH-1:(AXIS_KIP_CTDEST_OFFSET+AXIS_KIP_CTDEST_WIDTH)] <= 0;
        r_from_ctrl_tuser[IP_ADDRESS_WIDTH-1:0] <= REMOTE_IP_ADDRESS;
        r_from_ctrl_tuser[KIP_TUSER_SRC_PORT_OFFSET+:KIP_TUSER_SRC_PORT_WIDTH] <= KIP_PORT;
        r_from_ctrl_tuser[KIP_TUSER_DEST_PORT_OFFSET+:KIP_TUSER_DEST_PORT_WIDTH] <= KIP_PORT;
        #10
        r_from_nb_tvalid <= 1;
        // Send ACK with the wrong CTID
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_KIP_ACK;
        r_from_nb_tdata[KIP_ACK_SENDER_CTID_OFFSET+:KIP_ACK_SENDER_CTID_WIDTH] <= 0;
        r_from_nb_tdata[KIP_ACK_SEQUENCE_NUMBER_OFFSET+:KIP_ACK_SEQUENCE_NUMBER_WIDTH] <= WAN_SEQUENCE_NUMBER + 1;
        r_from_nb_tid <= 0; // Not used for ACKs
        r_from_nb_tdest <= 0; // Not used for ACKs
        r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= REMOTE_IP_ADDRESS;
        r_from_nb_tuser[KIP_TUSER_SRC_PORT_OFFSET+:KIP_TUSER_SRC_PORT_WIDTH] <= KIP_PORT;
        r_from_nb_tuser[KIP_TUSER_DEST_PORT_OFFSET+:KIP_TUSER_DEST_PORT_WIDTH] <= KIP_PORT;
        #200
        // Send ACK with the wrong Sequence Number
        r_from_nb_tdata[WAN_ACK_SENDER_CTID_OFFSET+:WAN_ACK_SENDER_CTID_WIDTH] <= REMOTE_CLUSTER_ID;
        r_from_nb_tdata[WAN_ACK_SEQUENCE_NUMBER_OFFSET+:WAN_ACK_SEQUENCE_NUMBER_WIDTH] <= WAN_SEQUENCE_NUMBER+2;
        #200
        // Send Correct ACk
        r_from_nb_tdata[WAN_ACK_SEQUENCE_NUMBER_OFFSET+:WAN_ACK_SEQUENCE_NUMBER_WIDTH] <= WAN_SEQUENCE_NUMBER+1;
        #1000
        $finish;
    end

    // Simulate WNN Node: Handle WAN Sequence Number requests
    always @(posedge r_clk, negedge r_resetn) begin
        if (r_resetn == 0) begin
            r_from_WNN_tvalid <= 0;
            r_from_WNN_tdata <= 0;
            r_from_WNN_tdest <= 0;
        end
        else if (w_to_WNN_tvalid == 1) begin
            r_from_WNN_tvalid <= 1;
            r_from_WNN_tdata <= WAN_SEQUENCE_NUMBER;
            r_from_WNN_tdest <= w_to_WNN_tdest;
        end
        else if (r_from_WNN_tvalid == 1 && w_from_WNN_tready == 1) begin
            r_from_WNN_tvalid <= 0;
            r_from_WNN_tdata <= 0;
            r_from_WNN_tdest <= 0;
        end
        else begin
            r_from_WNN_tvalid <= r_from_WNN_tvalid;
            r_from_WNN_tdata <= r_from_WNN_tdata;
            r_from_WNN_tdest <= r_from_WNN_tdest;
        end 
    end

    // Simulate Network Bridge: Respond to KIP PUBs
    // always @(posedge r_clk, negedge r_resetn) begin
    //     if (r_resetn == 0) begin
    //         r_from_nb_tvalid <= 0;
    //         r_from_nb_tdata <= 0;
    //         r_from_nb_tid <= 0;
    //         r_from_nb_tdest <= 0;
    //         r_from_nb_tuser <= 0;
    //         r_num_cycles_waited <= 0;
    //         r_packet_received_from_dut <= 0;
    //     end
    //     // This only handles PUB requests, not the initial sequence numbers
    //     // If packet has been received by DUT, stop sending packet from Network Bridge
    //     else if (r_from_nb_tvalid == 1 && w_from_nb_tready == 1) begin
    //         r_from_nb_tvalid <= 0;
    //         r_from_nb_tdata <= r_from_nb_tdata;
    //         r_from_nb_tid <= r_from_nb_tid;
    //         r_from_nb_tdest <= r_from_nb_tdest;
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
    //         r_from_nb_tid <= r_from_nb_tid;
    //         r_from_nb_tdest <= r_from_nb_tdest;
    //         r_from_nb_tuser <= r_from_nb_tuser;
    //     end
    //     // Case 1: PUB packet recieved, respond with an acknowledgement
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
    //         r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_KIP_ACK;
    //         r_from_nb_tdata[KIP_ACK_SENDER_CTID_OFFSET+:KIP_ACK_SENDER_CTID_WIDTH] <= REMOTE_CLUSTER_ID;
    //         r_from_nb_tdata[KIP_ACK_SEQUENCE_NUMBER_OFFSET+:KIP_ACK_SEQUENCE_NUMBER_WIDTH] <= w_to_nb_KIP_tdata[PUB_KIP_SEQUENCE_NUMBER_OFFSET+:PUB_KIP_SEQUENCE_NUMBER_WIDTH];
    //         r_from_nb_tid <= 0; // Not used for ACKs
    //         r_from_nb_tdest <= 0; // Not used for ACKs
    //         r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= REMOTE_IP_ADDRESS;
    //         r_from_nb_tuser[KIP_TUSER_SRC_PORT_OFFSET+:KIP_TUSER_SRC_PORT_WIDTH] <= KIP_PORT;
    //         r_from_nb_tuser[KIP_TUSER_DEST_PORT_OFFSET+:KIP_TUSER_DEST_PORT_WIDTH] <= KIP_PORT;
    //     end
    //     // Case 2:Test multiple packets coming from Network Bridge
    //     else if (r_network_bridge_test_enable == 1) begin
    //         r_from_nb_tvalid <= 1;
    //         r_from_nb_tdata <= r_network_bridge_test_tdata;
    //         r_from_nb_tid <= r_network_bridge_test_tid;
    //         r_from_nb_tdest <= r_network_bridge_test_tdest;
    //         r_from_nb_tuser <= r_network_bridge_test_tuser;
    //     end
    //     else begin
    //         r_from_nb_tvalid <= 0;
    //         r_from_nb_tdata <= r_from_nb_tdata;
    //         r_from_nb_tid <= r_from_nb_tid;
    //         r_from_nb_tdest <= r_from_nb_tdest;
    //         r_from_nb_tuser <= r_from_nb_tuser;
    //     end
    // end


endmodule