module tb #(
    `include "ctrl_api_reliability_header_parameters.vh"
    `include "ctrl_api_header_parameters.vh"
) ();

    // Parameters
    `include "ctrl_api_message_parameters.vh"
    `include "ctrl_api_reliability_message_parameters.vh"
    localparam NUM_FPGA_NODES = 5; // 1 2 3 4 5
    localparam ACK_TIMEOUT = 10;
    localparam SEQUENCE_NUMBER_REPLY_TIMEOUT = 15;
    localparam FPGA_NODE_ID_WIDTH = $clog2(NUM_FPGA_NODES);

    // IDs
    localparam DUT_NODE_ID = 3;
    localparam DUT_IP_ADDRESS = 'h0A010802;
    localparam REMOTE_IP_ADDRESS = 'h0A010868; 
    localparam CTRL_PORT = 'hDD;
    localparam KIP_PORT = 'hFB;
    integer i;

    // Declarations
    logic r_clk;
    logic r_resetn;
    // AXI-Stream to-LAN interface from LAN Node Finder
    logic r_from_LAN_node_finder_tvalid;
    logic w_from_LAN_node_finder_tready;
    logic [AXIS_DATA_WIDTH-1:0] r_from_LAN_node_finder_tdata;
    logic [AXIS_KEEP_WIDTH-1:0] r_from_LAN_node_finder_tkeep;
    logic [AXIS_LAN_TDEST_WIDTH-1:0] r_from_LAN_node_finder_tid;
    logic [AXIS_LAN_TDEST_WIDTH-1:0] r_from_LAN_node_finder_tdest;
    logic r_from_LAN_node_finder_tlast;
    // AXI-Stream interface from Network Bridge
    logic r_from_nb_tvalid;
    logic w_from_nb_tready;
    logic [AXIS_DATA_WIDTH-1:0] r_from_nb_tdata;
    logic [AXIS_KEEP_WIDTH-1:0] r_from_nb_tkeep;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] r_from_nb_tid;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] r_from_nb_tdest;
    logic [AXIS_FROM_NB_TUSER_WIDTH-1:0] r_from_nb_tuser;
    logic r_from_nb_tlast;
    // AXI-Stream to Network Bridge LAN Interface
    logic w_to_nb_LAN_tvalid;
    logic r_to_nb_LAN_tready;
    logic [AXIS_DATA_WIDTH-1:0] w_to_nb_LAN_tdata;
    logic [AXIS_KEEP_WIDTH-1:0] w_to_nb_LAN_tkeep;
    logic [AXIS_LAN_TDEST_WIDTH-1:0] w_to_nb_LAN_tid;
    logic [AXIS_LAN_TDEST_WIDTH-1:0] w_to_nb_LAN_tdest;
    logic [AXIS_LAN_TUSER_WIDTH-1:0] w_to_nb_LAN_tuser;
    logic w_to_nb_LAN_tlast;
    // BRAM connection to Sequence Number BRAM
    logic w_to_sequence_number_BRAM_CLK;
    logic w_to_sequence_number_BRAM_RST;
    logic w_to_sequence_number_BRAM_EN;
    logic [BRAM_WEN_WIDTH-1:0] w_to_sequence_number_BRAM_WEN;
    logic [LAN_SEQUENCE_NUMBER_WIDTH-1:0] w_to_sequence_number_BRAM_DIN;
    logic [BRAM_ADDR_WIDTH-1:0] w_to_sequence_number_BRAM_ADDR;
    logic [LAN_SEQUENCE_NUMBER_WIDTH-1:0] r_to_sequence_number_BRAM_DOUT;
    // Fake BRAMs to simulate BRAM behaviour
    logic [LAN_SEQUENCE_NUMBER_WIDTH-1:0] r_LAN_sequence_number_array [NUM_FPGA_NODES:0]; // We start from Node 1 to 255
    // Other
    logic r_ready_to_test; // Only set this to 1 after we've initialized the module and all of its sequence numbers
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
    rpn_LAN_TX #(
        .ACK_TIMEOUT(ACK_TIMEOUT)
    ) DUT (
        .i_clk(r_clk),
        .i_ap_rst_n(r_resetn),
        .i_sequence_numbers_initialized(r_ready_to_test),
        .i_node_id(DUT_NODE_ID),
        // AXI-Stream to-LAN interface from LAN Node Finder
        .from_LAN_node_finder_tvalid(r_from_LAN_node_finder_tvalid),
        .from_LAN_node_finder_tready(w_from_LAN_node_finder_tready),
        .from_LAN_node_finder_tdata(r_from_LAN_node_finder_tdata),
        .from_LAN_node_finder_tkeep(r_from_LAN_node_finder_tkeep),
        .from_LAN_node_finder_tid(r_from_LAN_node_finder_tid),
        .from_LAN_node_finder_tdest(r_from_LAN_node_finder_tdest),
        .from_LAN_node_finder_tuser(r_destination_node_id),
        .from_LAN_node_finder_tlast(r_from_LAN_node_finder_tlast),
        // AXI-Stream interface from Network Bridge
        .from_nb_tvalid(r_from_nb_tvalid),
        .from_nb_tready(w_from_nb_tready),
        .from_nb_tdata(r_from_nb_tdata),
        .from_nb_tkeep(r_from_nb_tkeep),
        .from_nb_tid(r_from_nb_tid),
        .from_nb_tdest(r_from_nb_tdest),
        .from_nb_tuser(r_from_nb_tuser),
        .from_nb_tlast(r_from_nb_tlast),
        // AXI-Stream to Network Bridge LAN Interface
        .to_nb_LAN_tvalid(w_to_nb_LAN_tvalid),
        .to_nb_LAN_tready(r_to_nb_LAN_tready),
        .to_nb_LAN_tdata(w_to_nb_LAN_tdata),
        .to_nb_LAN_tkeep(w_to_nb_LAN_tkeep),
        .to_nb_LAN_tid(w_to_nb_LAN_tid),
        .to_nb_LAN_tdest(w_to_nb_LAN_tdest),
        .to_nb_LAN_tuser(w_to_nb_LAN_tuser),
        .to_nb_LAN_tlast(w_to_nb_LAN_tlast),
        // BRAM connection for converting between node and sequence number
        .node_to_LAN_seq_num_BRAM_CLK(w_to_sequence_number_BRAM_CLK),
        .node_to_LAN_seq_num_BRAM_RST(w_to_sequence_number_BRAM_RST),
        .node_to_LAN_seq_num_BRAM_EN(w_to_sequence_number_BRAM_EN),
        .node_to_LAN_seq_num_BRAM_ADDR(w_to_sequence_number_BRAM_ADDR),
        .node_to_LAN_seq_num_BRAM_DOUT(r_to_sequence_number_BRAM_DOUT),
        .node_to_LAN_seq_num_BRAM_WEN(w_to_sequence_number_BRAM_WEN),
        .node_to_LAN_seq_num_BRAM_DIN(w_to_sequence_number_BRAM_DIN)
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
        r_from_LAN_node_finder_tkeep = 'hFFFFFFFFFFFFFFFF;
        r_from_LAN_node_finder_tlast = 1;
        // From Network-Bridge Interface
        r_from_nb_tkeep = 'hFFFFFFFFFFFFFFFF;
        r_from_nb_tlast = 1;
        // to-nb-LAN interface
        r_to_nb_LAN_tready = 1;
    end

    // Test Logic
    initial begin
        r_ready_to_test <= 0;
        r_network_bridge_test_enable <= 0;
        r_network_bridge_test_tdata <= 0;
        r_network_bridge_test_tid <= 0;
        r_network_bridge_test_tdest <= 0;
        r_network_bridge_test_tuser <= 0;
        r_simulated_latency_cycles <= 0;
        r_from_LAN_node_finder_tvalid <= 0;
        r_from_LAN_node_finder_tdata <= 0;
        r_from_LAN_node_finder_tid <= 0;
        r_from_LAN_node_finder_tdest <= 0;
        r_destination_node_id <= 0;
        #200
        // Test sending a LAN message before activation
        // Test sending a LAN message from kernel 2 to kernel 4 (node 3)
        r_from_LAN_node_finder_tvalid <= 1;
        r_from_LAN_node_finder_tdata[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_WRITE;
        r_from_LAN_node_finder_tdata[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 'hABABABAB;
        r_from_LAN_node_finder_tdata[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 'hEFEFEFEFEFEFEFEF;
        r_from_LAN_node_finder_tdata[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'hF;
        r_from_LAN_node_finder_tdata[AXIS_DATA_WIDTH-1:(AXIS_LAN_WSTRB_OFFSET+AXIS_LAN_WSTRB_WIDTH)] <= 0;
        r_from_LAN_node_finder_tid <= 2;
        r_from_LAN_node_finder_tdest <= 3;
        r_destination_node_id <= 4;
        #50
        // Activate the core
        r_ready_to_test <= 1;
        #100
        // Test sending a LAN message from kernel 2 to kernel 4 (node 3)
        r_from_LAN_node_finder_tvalid <= 1;
        r_from_LAN_node_finder_tdata[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_WRITE;
        r_from_LAN_node_finder_tdata[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 'hABABABAB;
        r_from_LAN_node_finder_tdata[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 'hEFEFEFEFEFEFEFEF;
        r_from_LAN_node_finder_tdata[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'hF;
        r_from_LAN_node_finder_tdata[AXIS_LAN_TID_OFFSET+:AXIS_LAN_TID_WIDTH] <= 'hBC;
        r_from_LAN_node_finder_tdata[AXIS_LAN_IP_OFFSET+:AXIS_LAN_IP_WIDTH] <= 'h0A010868;
        r_from_LAN_node_finder_tdata[AXIS_LAN_CTID_OFFSET+:AXIS_LAN_CTID_WIDTH] <= 'hDEADBEEF;
        r_from_LAN_node_finder_tdata[AXIS_DATA_WIDTH-1:(AXIS_LAN_CTID_OFFSET+AXIS_LAN_CTID_WIDTH)] <= 0;
        r_from_LAN_node_finder_tid <= 2;
        r_from_LAN_node_finder_tdest <= 3;
        r_destination_node_id <= 4;
        #1000
        $finish;
    end
    // To test: Multiple ACKS arriving simultaneously lost ACKs arriving at different times
    // Test multiple LAN messages being sent, to the same and different nodes
    // initial begin
    //     r_ready_to_test <= 0;
    //     r_network_bridge_test_enable <= 0;
    //     r_network_bridge_test_tdata <= 0;
    //     r_network_bridge_test_tid <= 0;
    //     r_network_bridge_test_tdest <= 0;
    //     r_network_bridge_test_tuser <= 0;
    //     r_simulated_latency_cycles <= 0;
    //     r_from_LAN_node_finder_tvalid <= 0;
    //     r_from_LAN_node_finder_tdata <= 0;
    //     r_from_LAN_node_finder_tid <= 0;
    //     r_from_LAN_node_finder_tdest <= 0;
    //     r_destination_node_id <= 0;
    //     #200
    //     // Activate the core
    //     r_ready_to_test <= 1;
    //     #100
    //     // Test sending a LAN message from kernel 2 to kernel 3 (node 4)
    //     r_from_LAN_node_finder_tvalid <= 1;
    //     r_from_LAN_node_finder_tdata[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_WRITE;
    //     r_from_LAN_node_finder_tdata[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 'hABABABAB;
    //     r_from_LAN_node_finder_tdata[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 'hEFEFEFEFEFEFEFEF;
    //     r_from_LAN_node_finder_tdata[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'hF;
    //     r_from_LAN_node_finder_tdata[AXIS_DATA_WIDTH-1:(AXIS_LAN_WSTRB_OFFSET+AXIS_LAN_WSTRB_WIDTH)] <= 0;
    //     r_from_LAN_node_finder_tid <= 2;
    //     r_from_LAN_node_finder_tdest <= 3;
    //     r_destination_node_id <= 4;
    //     #100
    //     r_from_LAN_node_finder_tvalid <= 0;
    //     #20
    //     // Test sending a LAN message from kernel 1 to kernel AA (node 1)
    //     r_from_LAN_node_finder_tvalid <= 1;
    //     r_from_LAN_node_finder_tdata[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_READ;
    //     r_from_LAN_node_finder_tdata[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 'h0;
    //     r_from_LAN_node_finder_tdata[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 'hABABABABABABABAB;
    //     r_from_LAN_node_finder_tdata[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'h0A010868;
    //     r_from_LAN_node_finder_tdata[AXIS_DATA_WIDTH-1:(AXIS_LAN_WSTRB_OFFSET+AXIS_LAN_WSTRB_WIDTH)] <= 0;
    //     r_from_LAN_node_finder_tid <= 1;
    //     r_from_LAN_node_finder_tdest <= 'hAA;
    //     r_destination_node_id <= 1;
    //     #100
    //     r_from_LAN_node_finder_tvalid <= 0;
    //     #20
    //     // Test sending a LAN message from kernel 2 to kernel 8 (node 4)
    //     r_from_LAN_node_finder_tvalid <= 1;
    //     r_from_LAN_node_finder_tdata[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_READ;
    //     r_from_LAN_node_finder_tdata[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 0;
    //     r_from_LAN_node_finder_tdata[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 'hAEAEAEAEAEAEAEAE;
    //     r_from_LAN_node_finder_tdata[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 0;
    //     r_from_LAN_node_finder_tdata[AXIS_DATA_WIDTH-1:(AXIS_LAN_WSTRB_OFFSET+AXIS_LAN_WSTRB_WIDTH)] <= 0;
    //     r_from_LAN_node_finder_tid <= 2;
    //     r_from_LAN_node_finder_tdest <= 8;
    //     r_destination_node_id <= 4;
    //     #100
    //     #1000
    //     $finish;
    // end

    // // Test messages being queued due to waiting for re transmission
    // initial begin
    //     r_ready_to_test <= 0;
    //     r_network_bridge_test_enable <= 0;
    //     r_network_bridge_test_tdata <= 0;
    //     r_network_bridge_test_tid <= 0;
    //     r_network_bridge_test_tdest <= 0;
    //     r_network_bridge_test_tuser <= 0;
    //     r_simulated_latency_cycles <= 30;
    //     r_from_LAN_node_finder_tvalid <= 0;
    //     r_from_LAN_node_finder_tdata <= 0;
    //     r_from_LAN_node_finder_tid <= 0;
    //     r_from_LAN_node_finder_tdest <= 0;
    //     r_destination_node_id <= 0;
    //     #200
    //     // Activate the core
    //     r_ready_to_test <= 1;
    //     #100
    //     // Test sending a LAN message from kernel 2 to kernel 3 (node 4)
    //     r_from_LAN_node_finder_tvalid <= 1;
    //     r_from_LAN_node_finder_tdata[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_WRITE;
    //     r_from_LAN_node_finder_tdata[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 'hABABABAB;
    //     r_from_LAN_node_finder_tdata[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 'hEFEFEFEFEFEFEFEF;
    //     r_from_LAN_node_finder_tdata[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'hF;
    //     r_from_LAN_node_finder_tdata[AXIS_DATA_WIDTH-1:(AXIS_LAN_WSTRB_OFFSET+AXIS_LAN_WSTRB_WIDTH)] <= 0;
    //     r_from_LAN_node_finder_tid <= 2;
    //     r_from_LAN_node_finder_tdest <= 3;
    //     r_destination_node_id <= 4;
    //     #100
    //     r_from_LAN_node_finder_tvalid <= 0;
    //     #20
    //     // Test sending a LAN message from kernel 1 to kernel AA (node 1)
    //     r_from_LAN_node_finder_tvalid <= 1;
    //     r_from_LAN_node_finder_tdata[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_READ;
    //     r_from_LAN_node_finder_tdata[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 'h0;
    //     r_from_LAN_node_finder_tdata[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 'hABABABABABABABAB;
    //     r_from_LAN_node_finder_tdata[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'h0A010868;
    //     r_from_LAN_node_finder_tdata[AXIS_DATA_WIDTH-1:(AXIS_LAN_WSTRB_OFFSET+AXIS_LAN_WSTRB_WIDTH)] <= 0;
    //     r_from_LAN_node_finder_tid <= 1;
    //     r_from_LAN_node_finder_tdest <= 'hAA;
    //     r_destination_node_id <= 1;
    //     #1000
    //     $finish;
    // end

    // Test multiple ACKs arriving at different times. Disable Network Bridge
    // initial begin
    //     r_ready_to_test <= 0;
    //     r_network_bridge_test_enable <= 0;
    //     r_network_bridge_test_tdata <= 0;
    //     r_network_bridge_test_tid <= 0;
    //     r_network_bridge_test_tdest <= 0;
    //     r_network_bridge_test_tuser <= 0;
    //     r_simulated_latency_cycles <= 0;
    //     r_from_LAN_node_finder_tvalid <= 0;
    //     r_from_LAN_node_finder_tdata <= 0;
    //     r_from_LAN_node_finder_tid <= 0;
    //     r_from_LAN_node_finder_tdest <= 0;
    //     r_destination_node_id <= 0;
    //     #200
    //     // Activate the core
    //     r_ready_to_test <= 1;
    //     #100
    //     // Test sending a LAN message from kernel 2 to kernel 3 (node 4)
    //     r_from_LAN_node_finder_tvalid <= 1;
    //     r_from_LAN_node_finder_tdata[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_WRITE;
    //     r_from_LAN_node_finder_tdata[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 'hABABABAB;
    //     r_from_LAN_node_finder_tdata[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 'hEFEFEFEFEFEFEFEF;
    //     r_from_LAN_node_finder_tdata[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'hF;
    //     r_from_LAN_node_finder_tdata[AXIS_DATA_WIDTH-1:(AXIS_LAN_WSTRB_OFFSET+AXIS_LAN_WSTRB_WIDTH)] <= 0;
    //     r_from_LAN_node_finder_tid <= 2;
    //     r_from_LAN_node_finder_tdest <= 3;
    //     r_destination_node_id <= 4;
    //     #50
    //     r_from_LAN_node_finder_tvalid <= 0;
    //     // Send LAN ACK
    //     r_from_nb_tvalid <= 1;
    //     r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_LAN_ACK;
    //     r_from_nb_tdata[LAN_ACK_SENDER_NODE_ID_OFFSET+:LAN_ACK_SENDER_NODE_ID_WIDTH] <= r_destination_node_id;
    //     r_from_nb_tdata[LAN_ACK_SEQUENCE_NUMBER_OFFSET+:LAN_ACK_SEQUENCE_NUMBER_WIDTH] <= w_to_nb_LAN_tdata[PUB_LAN_SEQUENCE_NUMBER_OFFSET+:PUB_LAN_SEQUENCE_NUMBER_WIDTH];
    //     r_from_nb_tdata[AXIS_DATA_WIDTH-1:(PUB_LAN_SEQUENCE_NUMBER_OFFSET+PUB_LAN_SEQUENCE_NUMBER_WIDTH)] <= 0;
    //     r_from_nb_tid <= w_to_nb_LAN_tdest;
    //     r_from_nb_tdest <= w_to_nb_LAN_tid;
    //     r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= 'h0A010802;
    //     r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= REMOTE_IP_ADDRESS;
    //     r_from_nb_tuser[KIP_TUSER_SRC_PORT_OFFSET+:KIP_TUSER_SRC_PORT_WIDTH] <= KIP_PORT;
    //     r_from_nb_tuser[KIP_TUSER_DEST_PORT_OFFSET+:KIP_TUSER_DEST_PORT_WIDTH] <= KIP_PORT;        
    //     #100
    //     // Test sending a LAN message from kernel 1 to kernel AA (node 1)
    //     r_from_LAN_node_finder_tvalid <= 1;
    //     r_from_LAN_node_finder_tdata[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_READ;
    //     r_from_LAN_node_finder_tdata[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 'h0;
    //     r_from_LAN_node_finder_tdata[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 'hABABABABABABABAB;
    //     r_from_LAN_node_finder_tdata[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'h0A010868;
    //     r_from_LAN_node_finder_tdata[AXIS_DATA_WIDTH-1:(AXIS_LAN_WSTRB_OFFSET+AXIS_LAN_WSTRB_WIDTH)] <= 0;
    //     r_from_LAN_node_finder_tid <= 1;
    //     r_from_LAN_node_finder_tdest <= 'hAA;
    //     r_destination_node_id <= 1;
    //     #50
    //     // Send LAN ACK
    //     r_from_nb_tvalid <= 1;
    //     r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_LAN_ACK;
    //     r_from_nb_tdata[LAN_ACK_SENDER_NODE_ID_OFFSET+:LAN_ACK_SENDER_NODE_ID_WIDTH] <= r_destination_node_id;
    //     r_from_nb_tdata[LAN_ACK_SEQUENCE_NUMBER_OFFSET+:LAN_ACK_SEQUENCE_NUMBER_WIDTH] <= w_to_nb_LAN_tdata[PUB_LAN_SEQUENCE_NUMBER_OFFSET+:PUB_LAN_SEQUENCE_NUMBER_WIDTH];
    //     r_from_nb_tdata[AXIS_DATA_WIDTH-1:(PUB_LAN_SEQUENCE_NUMBER_OFFSET+PUB_LAN_SEQUENCE_NUMBER_WIDTH)] <= 0;
    //     r_from_nb_tid <= w_to_nb_LAN_tdest;
    //     r_from_nb_tdest <= w_to_nb_LAN_tid;
    //     r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= 'h0A010802;
    //     r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= REMOTE_IP_ADDRESS;
    //     r_from_nb_tuser[KIP_TUSER_SRC_PORT_OFFSET+:KIP_TUSER_SRC_PORT_WIDTH] <= KIP_PORT;
    //     r_from_nb_tuser[KIP_TUSER_DEST_PORT_OFFSET+:KIP_TUSER_DEST_PORT_WIDTH] <= KIP_PORT;        
    //     #100
    //     #1000
    //     $finish;
    // end

    // Simulate Sequence Number block ram
    initial begin
        for (i = 0; i < NUM_FPGA_NODES+1; i = i + 1)
            r_LAN_sequence_number_array[i] = 0;
    end
    // Case 1: Writing a sequence number
    always_ff @(posedge r_clk, negedge r_resetn) begin
        if (w_to_sequence_number_BRAM_EN == 1 
         && w_to_sequence_number_BRAM_WEN == 1)
            r_LAN_sequence_number_array[w_to_sequence_number_BRAM_ADDR>>2] <= w_to_sequence_number_BRAM_DIN;
        else
            r_LAN_sequence_number_array[w_to_sequence_number_BRAM_ADDR>>2] <= r_LAN_sequence_number_array[w_to_sequence_number_BRAM_ADDR>>2];

    end
    // Case 2: Reading a sequence number
    always_ff @(posedge r_clk, negedge r_resetn) begin
        if (r_resetn == 0) begin
            r_to_sequence_number_BRAM_DOUT <= 0;
        end
        else if (w_to_sequence_number_BRAM_EN == 1 
         && w_to_sequence_number_BRAM_WEN == 0)
            r_to_sequence_number_BRAM_DOUT <= r_LAN_sequence_number_array[w_to_sequence_number_BRAM_ADDR>>2];
        else
            r_to_sequence_number_BRAM_DOUT <= 0;
    end

    // Simulate Network Bridge: Respond to SEQ NUM REQUESTS and PUBs
    always @(posedge r_clk, negedge r_resetn) begin
        if (r_resetn == 0) begin
            r_from_nb_tvalid <= 0;
            r_from_nb_tdata <= 0;
            r_from_nb_tid <= 0;
            r_from_nb_tdest <= 0;
            r_from_nb_tuser <= 0;
            r_num_cycles_waited <= 0;
            r_packet_received_from_dut <= 0;
        end
        // This only handles PUB requests, not the initial sequence numbers
        else if (r_ready_to_test == 1) begin 
            // If packet has been received by DUT, stop sending packet from Network Bridge
            if (r_from_nb_tvalid == 1 && w_from_nb_tready == 1) begin
                r_from_nb_tvalid <= 0;
                r_from_nb_tdata <= r_from_nb_tdata;
                r_from_nb_tid <= r_from_nb_tid;
                r_from_nb_tdest <= r_from_nb_tdest;
                r_from_nb_tuser <= r_from_nb_tuser;
                r_num_cycles_waited <= 0;
            end
            // If simulated latency is enabled, stall GS communications until after latency is over
            else if (r_packet_received_from_dut == 1) begin
                if (r_num_cycles_waited == r_simulated_latency_cycles) begin
                    r_num_cycles_waited <= 0;
                    r_packet_received_from_dut <= 0;
                    r_from_nb_tvalid <= 1;
                end
                else begin
                    r_num_cycles_waited <= r_num_cycles_waited + 1;
                    r_packet_received_from_dut <= 1;
                    r_from_nb_tvalid <= 0;
                end
                r_from_nb_tdata <= r_from_nb_tdata;
                r_from_nb_tid <= r_from_nb_tid;
                r_from_nb_tdest <= r_from_nb_tdest;
                r_from_nb_tuser <= r_from_nb_tuser;
            end
            // Case 1: PUB packet recieved, respond with an acknowledgement
            else if (w_to_nb_LAN_tvalid == 1) begin
                if (r_simulated_latency_cycles == 0) begin
                    r_from_nb_tvalid <= 1;
                    r_packet_received_from_dut <= 0;
                    r_num_cycles_waited <= 0;
                end
                else begin
                    r_from_nb_tvalid <= 0;
                    r_packet_received_from_dut <= 1;
                    r_num_cycles_waited <= 1;
                end
                r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_LAN_ACK;
                r_from_nb_tdata[LAN_ACK_SENDER_NODE_ID_OFFSET+:LAN_ACK_SENDER_NODE_ID_WIDTH] <= r_destination_node_id;
                r_from_nb_tdata[LAN_ACK_SEQUENCE_NUMBER_OFFSET+:LAN_ACK_SEQUENCE_NUMBER_WIDTH] <= w_to_nb_LAN_tdata[PUB_LAN_SEQUENCE_NUMBER_OFFSET+:PUB_LAN_SEQUENCE_NUMBER_WIDTH];
                r_from_nb_tid <= w_to_nb_LAN_tdest;
                r_from_nb_tdest <= w_to_nb_LAN_tid;
                r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= REMOTE_IP_ADDRESS;
                r_from_nb_tuser[KIP_TUSER_SRC_PORT_OFFSET+:KIP_TUSER_SRC_PORT_WIDTH] <= CTRL_PORT;
                r_from_nb_tuser[KIP_TUSER_DEST_PORT_OFFSET+:KIP_TUSER_DEST_PORT_WIDTH] <= CTRL_PORT;
            end
            // Case 2:Test multiple packets coming from Network Bridge
            else if (r_network_bridge_test_enable == 1) begin
                r_from_nb_tvalid <= 1;
                r_from_nb_tdata <= r_network_bridge_test_tdata;
                r_from_nb_tid <= r_network_bridge_test_tid;
                r_from_nb_tdest <= r_network_bridge_test_tdest;
                r_from_nb_tuser <= r_network_bridge_test_tuser;
            end
            else begin
                r_from_nb_tvalid <= 0;
                r_from_nb_tdata <= r_from_nb_tdata;
                r_from_nb_tid <= r_from_nb_tid;
                r_from_nb_tdest <= r_from_nb_tdest;
                r_from_nb_tuser <= r_from_nb_tuser;
            end
        end
    end


endmodule