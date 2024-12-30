module tb #(
    `include "ctrl_api_reliability_header_parameters.vh"
    `include "ctrl_api_header_parameters.vh"
) ();

    // Parameters
    `include "ctrl_api_message_parameters.vh"
    `include "ctrl_api_reliability_message_parameters.vh"
    localparam IS_OUTGOING = 1; 
    localparam NUM_FPGA_NODES = 8; // 1 2 3 4 5 6 7 8 
    localparam NUM_CLUSTERS = 16; // 1 2 3 4 5 6 ... 16
    localparam FPGA_NODE_ID_WIDTH = $clog2(NUM_FPGA_NODES);
    integer i;

    localparam RPN_READ_REQUEST = (IS_OUTGOING == 1) ? RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_REQUEST : RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_REQUEST;
    localparam RPN_WRITE_REQUEST = (IS_OUTGOING == 1) ? RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_WRITE : RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_WRITE;

    // IDs
    localparam DUT_KERNEL_ID = 'hAA;
    localparam DUT_NODE_ID = 'hEF;
    localparam DUT_IP_ADDRESS = 'h0A010802;
    localparam REMOTE_KERNEL_ID = 'hBB;
    localparam REMOTE_NODE_ID = 'hAB;
    localparam REMOTE_IP_ADDRESS = 'h0A010868; 
    // Forwarded LAN messages will use Node ID 0, and GW IP Address
    localparam GATEWAY_IP_ADDRESS = 'h0B0C0D0E;
    localparam REMOTE_CTID = 'hABCDABCD;
    localparam REMOTE_WAN_SEQUENCE_NUMBER = 8888;
    localparam CTRL_PORT = 'hDD;
    localparam KIP_PORT = 'hFB;
    localparam CURRENT_SEQUENCE_NUMBER = 3300;

    // Declarations
    logic r_clk;
    logic r_resetn;
    logic r_sequence_numbers_initialized;
    // AXI-Stream interface from Network Bridge
    logic r_from_nb_tvalid;
    logic w_from_nb_tready;
    logic [AXIS_DATA_WIDTH-1:0] r_from_nb_tdata;
    logic [AXIS_KEEP_WIDTH-1:0] r_from_nb_tkeep;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] r_from_nb_tid;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] r_from_nb_tdest;
    logic [AXIS_FROM_NB_TUSER_WIDTH-1:0] r_from_nb_tuser;
    logic r_from_nb_tlast;
    // AXI-Stream to Network Bridge KnownIP Interface
    logic w_to_nb_KIP_tvalid;
    logic r_to_nb_KIP_tready;
    logic [AXIS_DATA_WIDTH-1:0] w_to_nb_KIP_tdata;
    logic [AXIS_KEEP_WIDTH-1:0] w_to_nb_KIP_tkeep;
    logic [AXIS_KIP_TUSER_WIDTH-1:0] w_to_nb_KIP_tuser;
    logic w_to_nb_KIP_tlast;
    // BRAM connection to WNN Sequence Number BRAM
    logic w_to_WNN_sequence_number_BRAM_CLK;
    logic w_to_WNN_sequence_number_BRAM_RST;
    logic w_to_WNN_sequence_number_BRAM_EN;
    logic [BRAM_WEN_WIDTH-1:0] w_to_WNN_sequence_number_BRAM_WEN;
    logic [WAN_NUM_SEQUENCE_NUMBER_WIDTH-1:0] w_to_WNN_sequence_number_BRAM_DIN;
    logic [BRAM_ADDR_WIDTH-1:0] w_to_WNN_sequence_number_BRAM_ADDR;
    logic [WAN_NUM_SEQUENCE_NUMBER_WIDTH-1:0] r_to_WNN_sequence_number_BRAM_DOUT;
    // BRAM connection to WAN Number Owner BRAM
    logic w_to_WAN_number_owner_BRAM_CLK;
    logic w_to_WAN_number_owner_BRAM_RST;
    logic w_to_WAN_number_owner_BRAM_EN;
    logic [BRAM_WEN_WIDTH-1:0] w_to_WAN_number_owner_BRAM_WEN;
    logic [NODE_ID_WIDTH-1:0] w_to_WAN_number_owner_BRAM_DIN;
    logic [BRAM_ADDR_WIDTH-1:0] w_to_WAN_number_owner_BRAM_ADDR;
    logic [NODE_ID_WIDTH-1:0] r_to_WAN_number_owner_BRAM_DOUT;
    // BRAM connection to WAN Sequence Number BRAM
    logic w_to_WAN_sequence_number_BRAM_CLK;
    logic w_to_WAN_sequence_number_BRAM_RST;
    logic w_to_WAN_sequence_number_BRAM_EN;
    logic [BRAM_WEN_WIDTH-1:0] w_to_WAN_sequence_number_BRAM_WEN;
    logic [WAN_SEQUENCE_NUMBER_WIDTH-1:0] w_to_WAN_sequence_number_BRAM_DIN;
    logic [BRAM_ADDR_WIDTH-1:0] w_to_WAN_sequence_number_BRAM_ADDR;
    logic [WAN_SEQUENCE_NUMBER_WIDTH-1:0] r_to_WAN_sequence_number_BRAM_DOUT;
    // Fake BRAMs to simulate BRAM behaviour
    logic [WAN_NUM_SEQUENCE_NUMBER_WIDTH-1:0] r_WNN_sequence_number_array [NUM_FPGA_NODES:0]; // Used to communicate between nodes and WNN Repo
    logic [WAN_SEQUENCE_NUMBER_WIDTH-1:0] r_WAN_sequence_number_array [NUM_CLUSTERS:0]; // Sequence numbers for GW->GW connections
    logic [NODE_ID_WIDTH-1:0] r_WAN_number_owner_array [NUM_CLUSTERS:0]; // Current owner of the WAN sequence number

    // DUT
    rpn_WNN_repo #(
        .IS_OUTGOING(IS_OUTGOING),
        .NUM_FPGA_NODES(NUM_FPGA_NODES)
    ) DUT (
        .i_clk(r_clk),
        .i_ap_rst_n(r_resetn),
        .i_sequence_numbers_initialized(r_sequence_numbers_initialized),
        .i_node_id(DUT_NODE_ID),
        .i_KIP_port_number(KIP_PORT),
        // AXI-Stream interface from Network Bridge
        .from_nb_tvalid(r_from_nb_tvalid),
        .from_nb_tready(w_from_nb_tready),
        .from_nb_tdata(r_from_nb_tdata),
        .from_nb_tkeep(r_from_nb_tkeep),
        .from_nb_tid(r_from_nb_tid),
        .from_nb_tdest(r_from_nb_tdest),
        .from_nb_tuser(r_from_nb_tuser),
        .from_nb_tlast(r_from_nb_tlast),
        // AXI-Stream to Network Bridge KnownIP Interface
        .to_nb_KIP_tvalid(w_to_nb_KIP_tvalid),
        .to_nb_KIP_tready(r_to_nb_KIP_tready),
        .to_nb_KIP_tdata(w_to_nb_KIP_tdata),
        .to_nb_KIP_tkeep(w_to_nb_KIP_tkeep),
        .to_nb_KIP_tuser(w_to_nb_KIP_tuser),
        .to_nb_KIP_tlast(w_to_nb_KIP_tlast),
        // BRAM connection to WNN Sequence Number BRAM
        .to_WNN_sequence_number_BRAM_CLK(w_to_WNN_sequence_number_BRAM_CLK),
        .to_WNN_sequence_number_BRAM_RST(w_to_WNN_sequence_number_BRAM_RST),
        .to_WNN_sequence_number_BRAM_EN(w_to_WNN_sequence_number_BRAM_EN),
        .to_WNN_sequence_number_BRAM_WEN(w_to_WNN_sequence_number_BRAM_WEN),
        .to_WNN_sequence_number_BRAM_DIN(w_to_WNN_sequence_number_BRAM_DIN),
        .to_WNN_sequence_number_BRAM_ADDR(w_to_WNN_sequence_number_BRAM_ADDR),
        .to_WNN_sequence_number_BRAM_DOUT(r_to_WNN_sequence_number_BRAM_DOUT),
        // BRAM connection to WAN Number owner BRAM
        .to_WAN_number_owner_BRAM_CLK(w_to_WAN_number_owner_BRAM_CLK),
        .to_WAN_number_owner_BRAM_RST(w_to_WAN_number_owner_BRAM_RST),
        .to_WAN_number_owner_BRAM_EN(w_to_WAN_number_owner_BRAM_EN),
        .to_WAN_number_owner_BRAM_WEN(w_to_WAN_number_owner_BRAM_WEN),
        .to_WAN_number_owner_BRAM_DIN(w_to_WAN_number_owner_BRAM_DIN),
        .to_WAN_number_owner_BRAM_ADDR(w_to_WAN_number_owner_BRAM_ADDR),
        .to_WAN_number_owner_BRAM_DOUT(r_to_WAN_number_owner_BRAM_DOUT),
        // BRAM connection to Sequence Number BRAM
        .to_WAN_sequence_number_BRAM_CLK(w_to_WAN_sequence_number_BRAM_CLK),
        .to_WAN_sequence_number_BRAM_RST(w_to_WAN_sequence_number_BRAM_RST),
        .to_WAN_sequence_number_BRAM_EN(w_to_WAN_sequence_number_BRAM_EN),
        .to_WAN_sequence_number_BRAM_WEN(w_to_WAN_sequence_number_BRAM_WEN),
        .to_WAN_sequence_number_BRAM_DIN(w_to_WAN_sequence_number_BRAM_DIN),
        .to_WAN_sequence_number_BRAM_ADDR(w_to_WAN_sequence_number_BRAM_ADDR),
        .to_WAN_sequence_number_BRAM_DOUT(r_to_WAN_sequence_number_BRAM_DOUT)
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
        // to-nb-KIP Interface
        r_to_nb_KIP_tready = 1;
    end

    // // To switch between outgoing and incoming, set IS_OUTGOING to 0 or 1
    // initial begin
    //     r_from_nb_tvalid <= 0;
    //     r_from_nb_tdata <= 0;
    //     r_from_nb_tuser <= 0;
    //     r_sequence_numbers_initialized <= 0;
    //     #100
    //     r_sequence_numbers_initialized <= 1;
    //     // Test a WAN SEQ NUM Request from Node 3 for Cluster 5's WAN sequence number
    //     r_from_nb_tvalid <= 1;
    //     // TDATA
    //     r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_READ_REQUEST;
    //     r_from_nb_tdata[GW_KIP_SENDER_NODE_ID_OFFSET+:GW_KIP_SENDER_NODE_ID_WIDTH] <= 3;
    //     r_from_nb_tdata[GW_KIP_SEQUENCE_NUMBER_OFFSET+:GW_KIP_SEQUENCE_NUMBER_WIDTH] <= 2*3 + 1; // Current WNN sequence number
    //     r_from_nb_tdata[GW_KIP_WAN_SEQUENCE_NUMBER_OFFSET+:GW_KIP_WAN_SEQUENCE_NUMBER_WIDTH] <= 0;
    //     r_from_nb_tdata[GW_KIP_WAN_CTDEST_OFFSET+:GW_KIP_WAN_CTDEST_WIDTH] <= 5;
    //     r_from_nb_tdata[AXIS_DATA_WIDTH-1:GW_KIP_WAN_LOCK_OFFSET] <= 0;
    //     // TUSER
    //     r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= 'h0A010868;
    //     r_from_nb_tuser[AXIS_KIP_TUSER_DEST_PORT_OFFSET+:AXIS_KIP_TUSER_DEST_PORT_WIDTH] <= KIP_PORT;
    //     r_from_nb_tuser[AXIS_KIP_TUSER_SRC_PORT_OFFSET+:AXIS_KIP_TUSER_SRC_PORT_WIDTH] <= KIP_PORT;
    //     #100
    //     // Test a sequence number request from node 6 for the same WAN sequence number (cluster 5)
    //     // TDATA
    //     r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_READ_REQUEST;
    //     r_from_nb_tdata[GW_KIP_SENDER_NODE_ID_OFFSET+:GW_KIP_SENDER_NODE_ID_WIDTH] <= 6;
    //     r_from_nb_tdata[GW_KIP_SEQUENCE_NUMBER_OFFSET+:GW_KIP_SEQUENCE_NUMBER_WIDTH] <= 2*6 + 1; // Current WNN sequence number
    //     r_from_nb_tdata[GW_KIP_WAN_SEQUENCE_NUMBER_OFFSET+:GW_KIP_WAN_SEQUENCE_NUMBER_WIDTH] <= 0;
    //     r_from_nb_tdata[GW_KIP_WAN_CTDEST_OFFSET+:GW_KIP_WAN_CTDEST_WIDTH] <= 5;
    //     r_from_nb_tdata[AXIS_DATA_WIDTH-1:GW_KIP_WAN_LOCK_OFFSET] <= 0;
    //     // TUSER
    //     r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= 'h0A010802;
    //     #100
    //     // Test a re-transmitted WAN SEQ NUM Request from Node 3 for Cluster 5's WAN sequence number
    //     r_from_nb_tvalid <= 1;
    //     // TDATA
    //     r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_READ_REQUEST;
    //     r_from_nb_tdata[GW_KIP_SENDER_NODE_ID_OFFSET+:GW_KIP_SENDER_NODE_ID_WIDTH] <= 3;
    //     r_from_nb_tdata[GW_KIP_SEQUENCE_NUMBER_OFFSET+:GW_KIP_SEQUENCE_NUMBER_WIDTH] <= 2*3 + 1; // Previous WNN sequence number
    //     r_from_nb_tdata[GW_KIP_WAN_SEQUENCE_NUMBER_OFFSET+:GW_KIP_WAN_SEQUENCE_NUMBER_WIDTH] <= 0;
    //     r_from_nb_tdata[GW_KIP_WAN_CTDEST_OFFSET+:GW_KIP_WAN_CTDEST_WIDTH] <= 5;
    //     r_from_nb_tdata[AXIS_DATA_WIDTH-1:GW_KIP_WAN_LOCK_OFFSET] <= 0;
    //     // TUSER
    //     r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= 'h0A010868;
    //     #100 
    //     // Test an incorrect WAN SEQ NUM Write from Node 4 for Cluster 5's WAN sequence number
    //     r_from_nb_tvalid <= 1;
    //     // TDATA
    //     r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_WRITE_REQUEST;
    //     r_from_nb_tdata[GW_KIP_SENDER_NODE_ID_OFFSET+:GW_KIP_SENDER_NODE_ID_WIDTH] <= 4;
    //     r_from_nb_tdata[GW_KIP_SEQUENCE_NUMBER_OFFSET+:GW_KIP_SEQUENCE_NUMBER_WIDTH] <= 2*4 + 1; // Current WNN sequence number
    //     r_from_nb_tdata[GW_KIP_WAN_SEQUENCE_NUMBER_OFFSET+:GW_KIP_WAN_SEQUENCE_NUMBER_WIDTH] <= 0;
    //     r_from_nb_tdata[GW_KIP_WAN_CTDEST_OFFSET+:GW_KIP_WAN_CTDEST_WIDTH] <= 5;
    //     r_from_nb_tdata[AXIS_DATA_WIDTH-1:GW_KIP_WAN_LOCK_OFFSET] <= 0;
    //     // TUSER
    //     r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= 'h0A010868;
    //     #100
    //     // Test a WAN SEQ NUM Write from Node 3 for Cluster 5's WAN sequence number
    //     r_from_nb_tvalid <= 1;
    //     // TDATA
    //     r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_WRITE_REQUEST;
    //     r_from_nb_tdata[GW_KIP_SENDER_NODE_ID_OFFSET+:GW_KIP_SENDER_NODE_ID_WIDTH] <= 3;
    //     r_from_nb_tdata[GW_KIP_SEQUENCE_NUMBER_OFFSET+:GW_KIP_SEQUENCE_NUMBER_WIDTH] <= 2*3 + 2; // Previous WNN sequence number
    //     r_from_nb_tdata[GW_KIP_WAN_SEQUENCE_NUMBER_OFFSET+:GW_KIP_WAN_SEQUENCE_NUMBER_WIDTH] <= 0;
    //     r_from_nb_tdata[GW_KIP_WAN_CTDEST_OFFSET+:GW_KIP_WAN_CTDEST_WIDTH] <= 5;
    //     r_from_nb_tdata[AXIS_DATA_WIDTH-1:GW_KIP_WAN_LOCK_OFFSET] <= 0;
    //     // TUSER
    //     r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= 'h0A010868;
    //     #100
    //     // Test a previous sequence number request from node 6 for the same WAN sequence number (cluster 5)
    //     r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_READ_REQUEST;
    //     r_from_nb_tdata[GW_KIP_SENDER_NODE_ID_OFFSET+:GW_KIP_SENDER_NODE_ID_WIDTH] <= 6;
    //     r_from_nb_tdata[GW_KIP_SEQUENCE_NUMBER_OFFSET+:GW_KIP_SEQUENCE_NUMBER_WIDTH] <= 2*6; // Current WNN sequence number
    //     r_from_nb_tdata[GW_KIP_WAN_SEQUENCE_NUMBER_OFFSET+:GW_KIP_WAN_SEQUENCE_NUMBER_WIDTH] <= 0;
    //     r_from_nb_tdata[GW_KIP_WAN_CTDEST_OFFSET+:GW_KIP_WAN_CTDEST_WIDTH] <= 5;
    //     r_from_nb_tdata[AXIS_DATA_WIDTH-1:GW_KIP_WAN_LOCK_OFFSET] <= 0;
    //     // TUSER
    //     r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= 'h0A010802;
    //     #100
    //     // Test a re-transmitted sequence number request from node 6 for the same WAN sequence number (cluster 5)
    //     // TDATA
    //     r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_READ_REQUEST;
    //     r_from_nb_tdata[GW_KIP_SENDER_NODE_ID_OFFSET+:GW_KIP_SENDER_NODE_ID_WIDTH] <= 6;
    //     r_from_nb_tdata[GW_KIP_SEQUENCE_NUMBER_OFFSET+:GW_KIP_SEQUENCE_NUMBER_WIDTH] <= 2*6 + 1; // Current WNN sequence number
    //     r_from_nb_tdata[GW_KIP_WAN_SEQUENCE_NUMBER_OFFSET+:GW_KIP_WAN_SEQUENCE_NUMBER_WIDTH] <= 0;
    //     r_from_nb_tdata[GW_KIP_WAN_CTDEST_OFFSET+:GW_KIP_WAN_CTDEST_WIDTH] <= 5;
    //     r_from_nb_tdata[AXIS_DATA_WIDTH-1:GW_KIP_WAN_LOCK_OFFSET] <= 0;
    //     // TUSER
    //     r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= 'h0A010802;
    //     #100
    //     // Test a WAN SEQ NUM Request from Node 8 for Cluster 9
    //     // TDATA
    //     r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_READ_REQUEST;
    //     r_from_nb_tdata[GW_KIP_SENDER_NODE_ID_OFFSET+:GW_KIP_SENDER_NODE_ID_WIDTH] <= 8;
    //     r_from_nb_tdata[GW_KIP_SEQUENCE_NUMBER_OFFSET+:GW_KIP_SEQUENCE_NUMBER_WIDTH] <= 2*8 + 1; // Current WNN sequence number
    //     r_from_nb_tdata[GW_KIP_WAN_SEQUENCE_NUMBER_OFFSET+:GW_KIP_WAN_SEQUENCE_NUMBER_WIDTH] <= 0;
    //     r_from_nb_tdata[GW_KIP_WAN_CTDEST_OFFSET+:GW_KIP_WAN_CTDEST_WIDTH] <= 9;
    //     r_from_nb_tdata[AXIS_DATA_WIDTH-1:GW_KIP_WAN_LOCK_OFFSET] <= 0;
    //     // TUSER
    //     r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= 'h0A010802;
    //     #100
    //     // Test a WAN SEQ NUM Check from Node 8 for Cluster 9
    //     r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_CHECK;
    //     r_from_nb_tdata[GW_KIP_SENDER_NODE_ID_OFFSET+:GW_KIP_SENDER_NODE_ID_WIDTH] <= 8;
    //     r_from_nb_tdata[GW_KIP_SEQUENCE_NUMBER_OFFSET+:GW_KIP_SEQUENCE_NUMBER_WIDTH] <= 2*8 + 2; // Current WNN sequence number
    //     r_from_nb_tdata[GW_KIP_WAN_SEQUENCE_NUMBER_OFFSET+:GW_KIP_WAN_SEQUENCE_NUMBER_WIDTH] <= 0;
    //     r_from_nb_tdata[GW_KIP_WAN_CTDEST_OFFSET+:GW_KIP_WAN_CTDEST_WIDTH] <= 9;
    //     r_from_nb_tdata[AXIS_DATA_WIDTH-1:GW_KIP_WAN_LOCK_OFFSET] <= 0;
    //     // TUSER
    //     r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= 'h0A010802;
    //     #100
    //     // Test a WAN SEQ NUM Check from Node 5 for Cluster 9
    //     r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_CHECK;
    //     r_from_nb_tdata[GW_KIP_SENDER_NODE_ID_OFFSET+:GW_KIP_SENDER_NODE_ID_WIDTH] <= 5;
    //     r_from_nb_tdata[GW_KIP_SEQUENCE_NUMBER_OFFSET+:GW_KIP_SEQUENCE_NUMBER_WIDTH] <= 2*5 + 1; // Current WNN sequence number
    //     r_from_nb_tdata[GW_KIP_WAN_SEQUENCE_NUMBER_OFFSET+:GW_KIP_WAN_SEQUENCE_NUMBER_WIDTH] <= 0;
    //     r_from_nb_tdata[GW_KIP_WAN_CTDEST_OFFSET+:GW_KIP_WAN_CTDEST_WIDTH] <= 9;
    //     r_from_nb_tdata[AXIS_DATA_WIDTH-1:GW_KIP_WAN_LOCK_OFFSET] <= 0;
    //     // TUSER
    //     r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= 'h0A010802;
    //     #100
    //     // Test a Previous WAN SEQ NUM Check from Node 8 for Cluster 9
    //     r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_CHECK;
    //     r_from_nb_tdata[GW_KIP_SENDER_NODE_ID_OFFSET+:GW_KIP_SENDER_NODE_ID_WIDTH] <= 8;
    //     r_from_nb_tdata[GW_KIP_SEQUENCE_NUMBER_OFFSET+:GW_KIP_SEQUENCE_NUMBER_WIDTH] <= 2*8 + 2; // Current WNN sequence number
    //     r_from_nb_tdata[GW_KIP_WAN_SEQUENCE_NUMBER_OFFSET+:GW_KIP_WAN_SEQUENCE_NUMBER_WIDTH] <= 0;
    //     r_from_nb_tdata[GW_KIP_WAN_CTDEST_OFFSET+:GW_KIP_WAN_CTDEST_WIDTH] <= 9;
    //     r_from_nb_tdata[AXIS_DATA_WIDTH-1:GW_KIP_WAN_LOCK_OFFSET] <= 0;
    //     // TUSER
    //     r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= 'h0A010802;
    //     #100
    //     // Test a Current WAN SEQ NUM Check from Node 7 for Cluster 10
    //     r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_CHECK;
    //     r_from_nb_tdata[GW_KIP_SENDER_NODE_ID_OFFSET+:GW_KIP_SENDER_NODE_ID_WIDTH] <= 7;
    //     r_from_nb_tdata[GW_KIP_SEQUENCE_NUMBER_OFFSET+:GW_KIP_SEQUENCE_NUMBER_WIDTH] <= 2*7 + 1; // Current WNN sequence number
    //     r_from_nb_tdata[GW_KIP_WAN_SEQUENCE_NUMBER_OFFSET+:GW_KIP_WAN_SEQUENCE_NUMBER_WIDTH] <= 0;
    //     r_from_nb_tdata[GW_KIP_WAN_CTDEST_OFFSET+:GW_KIP_WAN_CTDEST_WIDTH] <= 10;
    //     r_from_nb_tdata[AXIS_DATA_WIDTH-1:GW_KIP_WAN_LOCK_OFFSET] <= 0;
    //     // TUSER
    //     r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= 'h0A010802;
    //     #1000
    //     $finish;
    // end

    // Test WNN SEQ NUM CHECK
    initial begin
        r_from_nb_tvalid <= 0;
        r_from_nb_tdata <= 0;
        r_from_nb_tuser <= 0;
        r_sequence_numbers_initialized <= 0;
        #150
        r_sequence_numbers_initialized <= 1;
        // Test a WNN SEQ NUM Check from Node 3
        r_from_nb_tvalid <= 1;
        // TDATA
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_WAN_NUM_SEQ_NUM_CHECK;
        r_from_nb_tdata[GW_KIP_SENDER_NODE_ID_OFFSET+:GW_KIP_SENDER_NODE_ID_WIDTH] <= 3;
        r_from_nb_tdata[GW_KIP_SEQUENCE_NUMBER_OFFSET+:GW_KIP_SEQUENCE_NUMBER_WIDTH] <= 0; // Asking for WNN SEQ NUM
        r_from_nb_tdata[GW_KIP_WAN_SEQUENCE_NUMBER_OFFSET+:GW_KIP_WAN_SEQUENCE_NUMBER_WIDTH] <= 0;
        r_from_nb_tdata[GW_KIP_WAN_CTDEST_OFFSET+:GW_KIP_WAN_CTDEST_WIDTH] <= 0;
        r_from_nb_tdata[AXIS_DATA_WIDTH-1:GW_KIP_WAN_LOCK_OFFSET] <= 0;
        // TUSER
        r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= 'h0A010868;
        r_from_nb_tuser[AXIS_KIP_TUSER_DEST_PORT_OFFSET+:AXIS_KIP_TUSER_DEST_PORT_WIDTH] <= KIP_PORT;
        r_from_nb_tuser[AXIS_KIP_TUSER_SRC_PORT_OFFSET+:AXIS_KIP_TUSER_SRC_PORT_WIDTH] <= KIP_PORT;
        #100
        // Test a WAN SEQ NUM Request from Node 3 for Cluster 5's WAN sequence number
        r_from_nb_tvalid <= 1;
        // TDATA
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_READ_REQUEST;
        r_from_nb_tdata[GW_KIP_SENDER_NODE_ID_OFFSET+:GW_KIP_SENDER_NODE_ID_WIDTH] <= 3;
        r_from_nb_tdata[GW_KIP_SEQUENCE_NUMBER_OFFSET+:GW_KIP_SEQUENCE_NUMBER_WIDTH] <= 2*3 + 1; // Current WNN sequence number
        r_from_nb_tdata[GW_KIP_WAN_SEQUENCE_NUMBER_OFFSET+:GW_KIP_WAN_SEQUENCE_NUMBER_WIDTH] <= 0;
        r_from_nb_tdata[GW_KIP_WAN_CTDEST_OFFSET+:GW_KIP_WAN_CTDEST_WIDTH] <= 5;
        r_from_nb_tdata[AXIS_DATA_WIDTH-1:GW_KIP_WAN_LOCK_OFFSET] <= 0;
        // TUSER
        r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= 'h0A010802;
        r_from_nb_tuser[AXIS_KIP_TUSER_DEST_PORT_OFFSET+:AXIS_KIP_TUSER_DEST_PORT_WIDTH] <= KIP_PORT;
        r_from_nb_tuser[AXIS_KIP_TUSER_SRC_PORT_OFFSET+:AXIS_KIP_TUSER_SRC_PORT_WIDTH] <= KIP_PORT;
        #100
        // Test a WNN SEQ NUM Check from Node 3
        r_from_nb_tvalid <= 1;
        // TDATA
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_WAN_NUM_SEQ_NUM_CHECK;
        r_from_nb_tdata[GW_KIP_SENDER_NODE_ID_OFFSET+:GW_KIP_SENDER_NODE_ID_WIDTH] <= 3;
        r_from_nb_tdata[GW_KIP_SEQUENCE_NUMBER_OFFSET+:GW_KIP_SEQUENCE_NUMBER_WIDTH] <= 0; // Asking for WNN SEQ NUM
        r_from_nb_tdata[GW_KIP_WAN_SEQUENCE_NUMBER_OFFSET+:GW_KIP_WAN_SEQUENCE_NUMBER_WIDTH] <= 0;
        r_from_nb_tdata[GW_KIP_WAN_CTDEST_OFFSET+:GW_KIP_WAN_CTDEST_WIDTH] <= 0;
        r_from_nb_tdata[AXIS_DATA_WIDTH-1:GW_KIP_WAN_LOCK_OFFSET] <= 0;
        // TUSER
        r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= 'h0A010868;
        r_from_nb_tuser[AXIS_KIP_TUSER_DEST_PORT_OFFSET+:AXIS_KIP_TUSER_DEST_PORT_WIDTH] <= KIP_PORT;
        r_from_nb_tuser[AXIS_KIP_TUSER_SRC_PORT_OFFSET+:AXIS_KIP_TUSER_SRC_PORT_WIDTH] <= KIP_PORT;
        #1000
        $finish;
    end

    // initial begin
    //     r_from_nb_tvalid <= 0;
    //     r_from_nb_tdata <= 0;
    //     r_from_nb_tuser <= 0;
    //     r_sequence_numbers_initialized <= 0;
    //     #100
    //     r_sequence_numbers_initialized <= 1;
    //     // Test a WAN SEQ NUM Request from Node 3 for Cluster 5's WAN sequence number
    //     r_from_nb_tvalid <= 1;
    //     // TDATA
    //     r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_READ_REQUEST;
    //     r_from_nb_tdata[GW_KIP_SENDER_NODE_ID_OFFSET+:GW_KIP_SENDER_NODE_ID_WIDTH] <= 3;
    //     r_from_nb_tdata[GW_KIP_SEQUENCE_NUMBER_OFFSET+:GW_KIP_SEQUENCE_NUMBER_WIDTH] <= 0; // Current WNN sequence number
    //     r_from_nb_tdata[GW_KIP_WAN_SEQUENCE_NUMBER_OFFSET+:GW_KIP_WAN_SEQUENCE_NUMBER_WIDTH] <= 0;
    //     r_from_nb_tdata[GW_KIP_WAN_CTDEST_OFFSET+:GW_KIP_WAN_CTDEST_WIDTH] <= 5;
    //     r_from_nb_tdata[AXIS_DATA_WIDTH-1:GW_KIP_WAN_LOCK_OFFSET] <= 0;
    //     // TUSER
    //     r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= 'h0A010868;
    //     r_from_nb_tuser[AXIS_KIP_TUSER_DEST_PORT_OFFSET+:AXIS_KIP_TUSER_DEST_PORT_WIDTH] <= KIP_PORT;
    //     r_from_nb_tuser[AXIS_KIP_TUSER_SRC_PORT_OFFSET+:AXIS_KIP_TUSER_SRC_PORT_WIDTH] <= KIP_PORT;
    //     #100
    //     // Test a re-transmitted WAN SEQ NUM Request from Node 3 for Cluster 5's WAN sequence number
    //     r_from_nb_tvalid <= 1;
    //     // TDATA
    //     r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_READ_REQUEST;
    //     r_from_nb_tdata[GW_KIP_SENDER_NODE_ID_OFFSET+:GW_KIP_SENDER_NODE_ID_WIDTH] <= 3;
    //     r_from_nb_tdata[GW_KIP_SEQUENCE_NUMBER_OFFSET+:GW_KIP_SEQUENCE_NUMBER_WIDTH] <= -1; // Previous WNN sequence number
    //     r_from_nb_tdata[GW_KIP_WAN_SEQUENCE_NUMBER_OFFSET+:GW_KIP_WAN_SEQUENCE_NUMBER_WIDTH] <= 0;
    //     r_from_nb_tdata[GW_KIP_WAN_CTDEST_OFFSET+:GW_KIP_WAN_CTDEST_WIDTH] <= 5;
    //     r_from_nb_tdata[AXIS_DATA_WIDTH-1:GW_KIP_WAN_LOCK_OFFSET] <= 0;
    //     // TUSER
    //     r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= 'h0A010868;
    //     #100 
    //     // Test a WAN SEQ NUM Write from Node 3 for Cluster 5's WAN sequence number
    //     r_from_nb_tvalid <= 1;
    //     // TDATA
    //     r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_WRITE_REQUEST;
    //     r_from_nb_tdata[GW_KIP_SENDER_NODE_ID_OFFSET+:GW_KIP_SENDER_NODE_ID_WIDTH] <= 3;
    //     r_from_nb_tdata[GW_KIP_SEQUENCE_NUMBER_OFFSET+:GW_KIP_SEQUENCE_NUMBER_WIDTH] <= 0; // Previous WNN sequence number
    //     r_from_nb_tdata[GW_KIP_WAN_SEQUENCE_NUMBER_OFFSET+:GW_KIP_WAN_SEQUENCE_NUMBER_WIDTH] <= 0;
    //     r_from_nb_tdata[GW_KIP_WAN_CTDEST_OFFSET+:GW_KIP_WAN_CTDEST_WIDTH] <= 5;
    //     r_from_nb_tdata[AXIS_DATA_WIDTH-1:GW_KIP_WAN_LOCK_OFFSET] <= 0;
    //     // TUSER
    //     r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= 'h0A010868;
    //     #100
    //     #1000
    //     $finish;
    // end

    // Simulate WNN Sequence Number block ram
    initial begin
        for (i = 0; i < NUM_FPGA_NODES+1; i = i + 1)
            r_WNN_sequence_number_array[i] = 2*i;
            // r_WNN_sequence_number_array[i] = -1;
    end
    // Case 1: Writing a sequence number
    always_ff @(posedge r_clk, negedge r_resetn) begin
        if (w_to_WNN_sequence_number_BRAM_EN == 1 
         && w_to_WNN_sequence_number_BRAM_WEN == 'hF)
            r_WNN_sequence_number_array[w_to_WNN_sequence_number_BRAM_ADDR>>2] <= w_to_WNN_sequence_number_BRAM_DIN;
        else
            r_WNN_sequence_number_array[w_to_WNN_sequence_number_BRAM_ADDR>>2] <= r_WNN_sequence_number_array[w_to_WNN_sequence_number_BRAM_ADDR>>2];
    end
    // Case 2: Reading a sequence number
    always_ff @(posedge r_clk, negedge r_resetn) begin
        if (r_resetn == 0) begin
            r_to_WNN_sequence_number_BRAM_DOUT <= 0;
        end
        else if (w_to_WNN_sequence_number_BRAM_EN == 1 
         && w_to_WNN_sequence_number_BRAM_WEN == 0)
            r_to_WNN_sequence_number_BRAM_DOUT <= r_WNN_sequence_number_array[w_to_WNN_sequence_number_BRAM_ADDR>>2];
        else
            r_to_WNN_sequence_number_BRAM_DOUT <= 0;
    end

    // Simulate WAN Sequence Number block ram
    initial begin
        for (i = 0; i < NUM_CLUSTERS+1; i = i + 1)
            r_WAN_sequence_number_array[i] = 3*i;
    end
    // Case 1: Writing a sequence number
    always_ff @(posedge r_clk, negedge r_resetn) begin
        if (w_to_WAN_sequence_number_BRAM_EN == 1 
         && w_to_WAN_sequence_number_BRAM_WEN == 'hF)
            r_WAN_sequence_number_array[w_to_WAN_sequence_number_BRAM_ADDR>>2] <= w_to_WAN_sequence_number_BRAM_DIN;
        else
            r_WAN_sequence_number_array[w_to_WAN_sequence_number_BRAM_ADDR>>2] <= r_WAN_sequence_number_array[w_to_WAN_sequence_number_BRAM_ADDR>>2];

    end
    // Case 2: Reading a sequence number
    always_ff @(posedge r_clk, negedge r_resetn) begin
        if (r_resetn == 0) begin
            r_to_WAN_sequence_number_BRAM_DOUT <= 0;
        end
        else if (w_to_WAN_sequence_number_BRAM_EN == 1 
         && w_to_WAN_sequence_number_BRAM_WEN == 0)
            r_to_WAN_sequence_number_BRAM_DOUT <= r_WAN_sequence_number_array[w_to_WAN_sequence_number_BRAM_ADDR>>2];
        else
            r_to_WAN_sequence_number_BRAM_DOUT <= 0;
    end

    // Simulate WAN Number Owner block ram
    initial begin
        for (i = 0; i < NUM_CLUSTERS+1; i = i + 1)
            r_WAN_number_owner_array[i] = 0; // No owners at the start
    end
    // Case 1: Writing a sequence number
    always_ff @(posedge r_clk, negedge r_resetn) begin
        if (w_to_WAN_number_owner_BRAM_EN == 1 
         && w_to_WAN_number_owner_BRAM_WEN == 'hF)
            r_WAN_number_owner_array[w_to_WAN_number_owner_BRAM_ADDR>>2] <= w_to_WAN_number_owner_BRAM_DIN;
        else
            r_WAN_number_owner_array[w_to_WAN_number_owner_BRAM_ADDR>>2] <= r_WAN_number_owner_array[w_to_WAN_number_owner_BRAM_ADDR>>2];

    end
    // Case 2: Reading a sequence number
    always_ff @(posedge r_clk, negedge r_resetn) begin
        if (r_resetn == 0) begin
            r_to_WAN_number_owner_BRAM_DOUT <= 0;
        end
        else if (w_to_WAN_number_owner_BRAM_EN == 1 
         && w_to_WAN_number_owner_BRAM_WEN == 0)
            r_to_WAN_number_owner_BRAM_DOUT <= r_WAN_number_owner_array[w_to_WAN_number_owner_BRAM_ADDR>>2];
        else
            r_to_WAN_number_owner_BRAM_DOUT <= 0;
    end
endmodule