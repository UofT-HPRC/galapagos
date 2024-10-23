module tb #(
    `include "ctrl_api_reliability_header_parameters.vh"
    `include "ctrl_api_header_parameters.vh"
) ();

    // Parameters
    `include "ctrl_api_message_parameters.vh"
    `include "ctrl_api_reliability_message_parameters.vh"
    localparam NUM_FPGA_NODES = 5; // 1 2 3 4 5  
    localparam SEQUENCE_NUMBER_REPLY_TIMEOUT = 15;
    localparam FPGA_NODE_ID_WIDTH = $clog2(NUM_FPGA_NODES);
    localparam BRAM_SEQUENCE_NUMBER_WIDTH = 16;

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
    logic w_sequence_numbers_initialized;
    // Simulate Node-to-kernel bram
    logic [AXIS_LAN_TDEST_WIDTH-1:0] r_node_to_kernel_array [NUM_FPGA_NODES:0]; // starts from 1
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
    // BRAM connection to Node to Kernel BRAM
    logic w_node_to_kernel_BRAM_CLK;
    logic w_node_to_kernel_BRAM_RST;
    logic w_node_to_kernel_BRAM_EN;
    logic [BRAM_ADDR_WIDTH-1:0] w_node_to_kernel_BRAM_ADDR;
    logic [AXIS_LAN_TDEST_WIDTH-1:0] r_node_to_kernel_BRAM_DOUT;
    // BRAM connection to Sequence Number BRAM
    logic w_to_sequence_number_BRAM_CLK;
    logic w_to_sequence_number_BRAM_RST;
    logic w_to_sequence_number_BRAM_EN;
    logic [BRAM_WEN_WIDTH-1:0] w_to_sequence_number_BRAM_WEN;
    logic [BRAM_SEQUENCE_NUMBER_WIDTH-1:0] w_to_sequence_number_BRAM_DIN;
    logic [BRAM_ADDR_WIDTH-1:0] w_to_sequence_number_BRAM_ADDR;
    logic [BRAM_SEQUENCE_NUMBER_WIDTH-1:0] r_to_sequence_number_BRAM_DOUT;
    // Fake BRAMs to simulate BRAM behaviour
    logic [LAN_SEQUENCE_NUMBER_WIDTH-1:0] r_LAN_sequence_number_array [NUM_FPGA_NODES-1:0];
    
    // DUT
    rpn_LAN_sequence_number_initializer #(
        .NUM_FPGA_NODES(NUM_FPGA_NODES),
        .SEQUENCE_NUMBER_REPLY_TIMEOUT(SEQUENCE_NUMBER_REPLY_TIMEOUT)
    ) DUT (
        .i_clk(r_clk),
        .i_ap_rst_n(r_resetn),
        .i_node_id(DUT_NODE_ID),
        .o_sequence_numbers_initialized(w_sequence_numbers_initialized),
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
        // BRAM connection for converting between node and kernel number
        .node_to_kernel_ROM_CLK(w_node_to_kernel_BRAM_CLK),
        .node_to_kernel_ROM_RST(w_node_to_kernel_BRAM_RST),
        .node_to_kernel_ROM_EN(w_node_to_kernel_BRAM_EN),
        .node_to_kernel_ROM_ADDR(w_node_to_kernel_BRAM_ADDR),
        .node_to_kernel_ROM_DOUT(r_node_to_kernel_BRAM_DOUT),
        // // BRAM connection for converting between node and sequence number
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
        // From Network-Bridge Interface
        r_from_nb_tkeep = 'hFFFFFFFFFFFFFFFF;
        r_from_nb_tlast = 1;
        // to-nb-LAN interface
        r_to_nb_LAN_tready = 1;
    end

    // Test Logic
    initial begin
        r_from_nb_tvalid <= 0;
        r_from_nb_tdata <= 0;
        r_from_nb_tid <= 0;
        r_from_nb_tdest <= 0;
        r_from_nb_tuser <= 0;
        #200
        // Test: Send LAN ACK replies using KIP back in order
        // Node 1
        r_from_nb_tvalid <= 1;
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_LAN_SEQ_NUM_REPLY;
        r_from_nb_tdata[LAN_ACK_SENDER_NODE_ID_OFFSET+:LAN_ACK_SENDER_NODE_ID_WIDTH] <= 1;
        r_from_nb_tdata[LAN_ACK_SEQUENCE_NUMBER_OFFSET+:LAN_ACK_SEQUENCE_NUMBER_WIDTH] <= 'hAAAA;
        r_from_nb_tid <= 0; // Doesn't matter, not used
        r_from_nb_tdest <= 0; // Doesn't matter, not used
        r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= 'hAABBCCDD;
        r_from_nb_tuser[FROM_NB_TUSER_SRC_PORT_OFFSET+:FROM_NB_TUSER_SRC_PORT_WIDTH] <= KIP_PORT;
        r_from_nb_tuser[FROM_NB_TUSER_DEST_PORT_OFFSET+:FROM_NB_TUSER_DEST_PORT_WIDTH] <= KIP_PORT;
        #20
        // Node 2
        r_from_nb_tvalid <= 1;
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_LAN_SEQ_NUM_REPLY;
        r_from_nb_tdata[LAN_ACK_SENDER_NODE_ID_OFFSET+:LAN_ACK_SENDER_NODE_ID_WIDTH] <= 2;
        r_from_nb_tdata[LAN_ACK_SEQUENCE_NUMBER_OFFSET+:LAN_ACK_SEQUENCE_NUMBER_WIDTH] <= 'hBBBB;
        r_from_nb_tid <= 0; // Doesn't matter, not used
        r_from_nb_tdest <= 0; // Doesn't matter, not used
        r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= 'hBBCCDDEE;
        r_from_nb_tuser[FROM_NB_TUSER_SRC_PORT_OFFSET+:FROM_NB_TUSER_SRC_PORT_WIDTH] <= KIP_PORT;
        r_from_nb_tuser[FROM_NB_TUSER_DEST_PORT_OFFSET+:FROM_NB_TUSER_DEST_PORT_WIDTH] <= KIP_PORT;
        #20
        // Node 3
        r_from_nb_tvalid <= 1;
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_LAN_SEQ_NUM_REPLY;
        r_from_nb_tdata[LAN_ACK_SENDER_NODE_ID_OFFSET+:LAN_ACK_SENDER_NODE_ID_WIDTH] <= 3;
        r_from_nb_tdata[LAN_ACK_SEQUENCE_NUMBER_OFFSET+:LAN_ACK_SEQUENCE_NUMBER_WIDTH] <= 'hCCCC;
        r_from_nb_tid <= 0; // Doesn't matter, not used
        r_from_nb_tdest <= 0; // Doesn't matter, not used
        r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= 'hCCDDEEFF;
        r_from_nb_tuser[FROM_NB_TUSER_SRC_PORT_OFFSET+:FROM_NB_TUSER_SRC_PORT_WIDTH] <= KIP_PORT;
        r_from_nb_tuser[FROM_NB_TUSER_DEST_PORT_OFFSET+:FROM_NB_TUSER_DEST_PORT_WIDTH] <= KIP_PORT;
        #20
        // Node 4
        r_from_nb_tvalid <= 1;
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_LAN_SEQ_NUM_REPLY;
        r_from_nb_tdata[LAN_ACK_SENDER_NODE_ID_OFFSET+:LAN_ACK_SENDER_NODE_ID_WIDTH] <= 4;
        r_from_nb_tdata[LAN_ACK_SEQUENCE_NUMBER_OFFSET+:LAN_ACK_SEQUENCE_NUMBER_WIDTH] <= 'hEEEE;
        r_from_nb_tid <= 0; // Doesn't matter, not used
        r_from_nb_tdest <= 0; // Doesn't matter, not used
        r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= 'hDDEEFFAA;
        r_from_nb_tuser[FROM_NB_TUSER_SRC_PORT_OFFSET+:FROM_NB_TUSER_SRC_PORT_WIDTH] <= KIP_PORT;
        r_from_nb_tuser[FROM_NB_TUSER_DEST_PORT_OFFSET+:FROM_NB_TUSER_DEST_PORT_WIDTH] <= KIP_PORT;
        #20
        // Node 5
        r_from_nb_tvalid <= 1;
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_LAN_SEQ_NUM_REPLY;
        r_from_nb_tdata[LAN_ACK_SENDER_NODE_ID_OFFSET+:LAN_ACK_SENDER_NODE_ID_WIDTH] <= 5;
        r_from_nb_tdata[LAN_ACK_SEQUENCE_NUMBER_OFFSET+:LAN_ACK_SEQUENCE_NUMBER_WIDTH] <= 'hFFFF;
        r_from_nb_tid <= 0; // Doesn't matter, not used
        r_from_nb_tdest <= 0; // Doesn't matter, not used
        r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= 'hEEFFAABB;
        r_from_nb_tuser[FROM_NB_TUSER_SRC_PORT_OFFSET+:FROM_NB_TUSER_SRC_PORT_WIDTH] <= KIP_PORT;
        r_from_nb_tuser[FROM_NB_TUSER_DEST_PORT_OFFSET+:FROM_NB_TUSER_DEST_PORT_WIDTH] <= KIP_PORT;
        #1000
        $finish;
    end
    // // Test packets arriving in different order
    // initial begin
    //     r_from_nb_tvalid <= 0;
    //     r_from_nb_tdata <= 0;
    //     r_from_nb_tid <= 0;
    //     r_from_nb_tdest <= 0;
    //     r_from_nb_tuser <= 0;
    //     #200
    //     // Test: Send LAN ACK replies using KIP back in order
    //     // Node 2
    //     r_from_nb_tvalid <= 1;
    //     r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_LAN_SEQ_NUM_REPLY;
    //     r_from_nb_tdata[LAN_ACK_SENDER_NODE_ID_OFFSET+:LAN_ACK_SENDER_NODE_ID_WIDTH] <= 2;
    //     r_from_nb_tdata[LAN_ACK_SEQUENCE_NUMBER_OFFSET+:LAN_ACK_SEQUENCE_NUMBER_WIDTH] <= 'hBBBB;
    //     r_from_nb_tid <= 0; // Doesn't matter, not used
    //     r_from_nb_tdest <= 0; // Doesn't matter, not used
    //     r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= 'hBBCCDDEE;
    //     r_from_nb_tuser[FROM_NB_TUSER_SRC_PORT_OFFSET+:FROM_NB_TUSER_SRC_PORT_WIDTH] <= KIP_PORT;
    //     r_from_nb_tuser[FROM_NB_TUSER_DEST_PORT_OFFSET+:FROM_NB_TUSER_DEST_PORT_WIDTH] <= KIP_PORT;
    //     #20
    //     // Node 1
    //     r_from_nb_tvalid <= 1;
    //     r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_LAN_SEQ_NUM_REPLY;
    //     r_from_nb_tdata[LAN_ACK_SENDER_NODE_ID_OFFSET+:LAN_ACK_SENDER_NODE_ID_WIDTH] <= 1;
    //     r_from_nb_tdata[LAN_ACK_SEQUENCE_NUMBER_OFFSET+:LAN_ACK_SEQUENCE_NUMBER_WIDTH] <= 'hAAAA;
    //     r_from_nb_tid <= 0; // Doesn't matter, not used
    //     r_from_nb_tdest <= 0; // Doesn't matter, not used
    //     r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= 'hAABBCCDD;
    //     r_from_nb_tuser[FROM_NB_TUSER_SRC_PORT_OFFSET+:FROM_NB_TUSER_SRC_PORT_WIDTH] <= KIP_PORT;
    //     r_from_nb_tuser[FROM_NB_TUSER_DEST_PORT_OFFSET+:FROM_NB_TUSER_DEST_PORT_WIDTH] <= KIP_PORT;
    //     #20
    //     // Node 3
    //     r_from_nb_tvalid <= 1;
    //     r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_LAN_SEQ_NUM_REPLY;
    //     r_from_nb_tdata[LAN_ACK_SENDER_NODE_ID_OFFSET+:LAN_ACK_SENDER_NODE_ID_WIDTH] <= 3;
    //     r_from_nb_tdata[LAN_ACK_SEQUENCE_NUMBER_OFFSET+:LAN_ACK_SEQUENCE_NUMBER_WIDTH] <= 'hCCCC;
    //     r_from_nb_tid <= 0; // Doesn't matter, not used
    //     r_from_nb_tdest <= 0; // Doesn't matter, not used
    //     r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= 'hCCDDEEFF;
    //     r_from_nb_tuser[FROM_NB_TUSER_SRC_PORT_OFFSET+:FROM_NB_TUSER_SRC_PORT_WIDTH] <= KIP_PORT;
    //     r_from_nb_tuser[FROM_NB_TUSER_DEST_PORT_OFFSET+:FROM_NB_TUSER_DEST_PORT_WIDTH] <= KIP_PORT;
    //     #20
    //     // Node 2
    //     r_from_nb_tvalid <= 1;
    //     r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_LAN_SEQ_NUM_REPLY;
    //     r_from_nb_tdata[LAN_ACK_SENDER_NODE_ID_OFFSET+:LAN_ACK_SENDER_NODE_ID_WIDTH] <= 2;
    //     r_from_nb_tdata[LAN_ACK_SEQUENCE_NUMBER_OFFSET+:LAN_ACK_SEQUENCE_NUMBER_WIDTH] <= 'hBBBB;
    //     r_from_nb_tid <= 0; // Doesn't matter, not used
    //     r_from_nb_tdest <= 0; // Doesn't matter, not used
    //     r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= 'hBBCCDDEE;
    //     r_from_nb_tuser[FROM_NB_TUSER_SRC_PORT_OFFSET+:FROM_NB_TUSER_SRC_PORT_WIDTH] <= KIP_PORT;
    //     r_from_nb_tuser[FROM_NB_TUSER_DEST_PORT_OFFSET+:FROM_NB_TUSER_DEST_PORT_WIDTH] <= KIP_PORT;
    //     #20
    //     // Node 5
    //     r_from_nb_tvalid <= 1;
    //     r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_LAN_SEQ_NUM_REPLY;
    //     r_from_nb_tdata[LAN_ACK_SENDER_NODE_ID_OFFSET+:LAN_ACK_SENDER_NODE_ID_WIDTH] <= 5;
    //     r_from_nb_tdata[LAN_ACK_SEQUENCE_NUMBER_OFFSET+:LAN_ACK_SEQUENCE_NUMBER_WIDTH] <= 'hFFFF;
    //     r_from_nb_tid <= 0; // Doesn't matter, not used
    //     r_from_nb_tdest <= 0; // Doesn't matter, not used
    //     r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= 'hEEFFAABB;
    //     r_from_nb_tuser[FROM_NB_TUSER_SRC_PORT_OFFSET+:FROM_NB_TUSER_SRC_PORT_WIDTH] <= KIP_PORT;
    //     r_from_nb_tuser[FROM_NB_TUSER_DEST_PORT_OFFSET+:FROM_NB_TUSER_DEST_PORT_WIDTH] <= KIP_PORT;
    //     #20
    //     // Node 4
    //     r_from_nb_tvalid <= 1;
    //     r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_LAN_SEQ_NUM_REPLY;
    //     r_from_nb_tdata[LAN_ACK_SENDER_NODE_ID_OFFSET+:LAN_ACK_SENDER_NODE_ID_WIDTH] <= 4;
    //     r_from_nb_tdata[LAN_ACK_SEQUENCE_NUMBER_OFFSET+:LAN_ACK_SEQUENCE_NUMBER_WIDTH] <= 'hEEEE;
    //     r_from_nb_tid <= 0; // Doesn't matter, not used
    //     r_from_nb_tdest <= 0; // Doesn't matter, not used
    //     r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= 'hDDEEFFAA;
    //     r_from_nb_tuser[FROM_NB_TUSER_SRC_PORT_OFFSET+:FROM_NB_TUSER_SRC_PORT_WIDTH] <= KIP_PORT;
    //     r_from_nb_tuser[FROM_NB_TUSER_DEST_PORT_OFFSET+:FROM_NB_TUSER_DEST_PORT_WIDTH] <= KIP_PORT;
    //     #20
    //     // Node 2
    //     r_from_nb_tvalid <= 1;
    //     r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_LAN_SEQ_NUM_REPLY;
    //     r_from_nb_tdata[LAN_ACK_SENDER_NODE_ID_OFFSET+:LAN_ACK_SENDER_NODE_ID_WIDTH] <= 2;
    //     r_from_nb_tdata[LAN_ACK_SEQUENCE_NUMBER_OFFSET+:LAN_ACK_SEQUENCE_NUMBER_WIDTH] <= 'hBBBB;
    //     r_from_nb_tid <= 0; // Doesn't matter, not used
    //     r_from_nb_tdest <= 0; // Doesn't matter, not used
    //     r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= 'hBBCCDDEE;
    //     r_from_nb_tuser[FROM_NB_TUSER_SRC_PORT_OFFSET+:FROM_NB_TUSER_SRC_PORT_WIDTH] <= KIP_PORT;
    //     r_from_nb_tuser[FROM_NB_TUSER_DEST_PORT_OFFSET+:FROM_NB_TUSER_DEST_PORT_WIDTH] <= KIP_PORT;
    //     #1000
    //     $finish;
    // end
    // // Test packets arriving in different order at different times
    // initial begin
    //     r_from_nb_tvalid <= 0;
    //     r_from_nb_tdata <= 0;
    //     r_from_nb_tid <= 0;
    //     r_from_nb_tdest <= 0;
    //     r_from_nb_tuser <= 0;
    //     #200
    //     // Node 2
    //     r_from_nb_tvalid <= 1;
    //     r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_LAN_SEQ_NUM_REPLY;
    //     r_from_nb_tdata[LAN_ACK_SENDER_NODE_ID_OFFSET+:LAN_ACK_SENDER_NODE_ID_WIDTH] <= 2;
    //     r_from_nb_tdata[LAN_ACK_SEQUENCE_NUMBER_OFFSET+:LAN_ACK_SEQUENCE_NUMBER_WIDTH] <= 'hBBBB;
    //     r_from_nb_tid <= 0; // Doesn't matter, not used
    //     r_from_nb_tdest <= 0; // Doesn't matter, not used
    //     r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= 'hBBCCDDEE;
    //     r_from_nb_tuser[FROM_NB_TUSER_SRC_PORT_OFFSET+:FROM_NB_TUSER_SRC_PORT_WIDTH] <= KIP_PORT;
    //     r_from_nb_tuser[FROM_NB_TUSER_DEST_PORT_OFFSET+:FROM_NB_TUSER_DEST_PORT_WIDTH] <= KIP_PORT;
    //     #200
    //     // Node 1
    //     r_from_nb_tvalid <= 1;
    //     r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_LAN_SEQ_NUM_REPLY;
    //     r_from_nb_tdata[LAN_ACK_SENDER_NODE_ID_OFFSET+:LAN_ACK_SENDER_NODE_ID_WIDTH] <= 1;
    //     r_from_nb_tdata[LAN_ACK_SEQUENCE_NUMBER_OFFSET+:LAN_ACK_SEQUENCE_NUMBER_WIDTH] <= 'hAAAA;
    //     r_from_nb_tid <= 0; // Doesn't matter, not used
    //     r_from_nb_tdest <= 0; // Doesn't matter, not used
    //     r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= 'hAABBCCDD;
    //     r_from_nb_tuser[FROM_NB_TUSER_SRC_PORT_OFFSET+:FROM_NB_TUSER_SRC_PORT_WIDTH] <= KIP_PORT;
    //     r_from_nb_tuser[FROM_NB_TUSER_DEST_PORT_OFFSET+:FROM_NB_TUSER_DEST_PORT_WIDTH] <= KIP_PORT;
    //     #200
    //     // Node 3
    //     r_from_nb_tvalid <= 1;
    //     r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_LAN_SEQ_NUM_REPLY;
    //     r_from_nb_tdata[LAN_ACK_SENDER_NODE_ID_OFFSET+:LAN_ACK_SENDER_NODE_ID_WIDTH] <= 3;
    //     r_from_nb_tdata[LAN_ACK_SEQUENCE_NUMBER_OFFSET+:LAN_ACK_SEQUENCE_NUMBER_WIDTH] <= 'hCCCC;
    //     r_from_nb_tid <= 0; // Doesn't matter, not used
    //     r_from_nb_tdest <= 0; // Doesn't matter, not used
    //     r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= 'hCCDDEEFF;
    //     r_from_nb_tuser[FROM_NB_TUSER_SRC_PORT_OFFSET+:FROM_NB_TUSER_SRC_PORT_WIDTH] <= KIP_PORT;
    //     r_from_nb_tuser[FROM_NB_TUSER_DEST_PORT_OFFSET+:FROM_NB_TUSER_DEST_PORT_WIDTH] <= KIP_PORT;
    //     #200
    //     // Node 2
    //     r_from_nb_tvalid <= 1;
    //     r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_LAN_SEQ_NUM_REPLY;
    //     r_from_nb_tdata[LAN_ACK_SENDER_NODE_ID_OFFSET+:LAN_ACK_SENDER_NODE_ID_WIDTH] <= 2;
    //     r_from_nb_tdata[LAN_ACK_SEQUENCE_NUMBER_OFFSET+:LAN_ACK_SEQUENCE_NUMBER_WIDTH] <= 'hBBBB;
    //     r_from_nb_tid <= 0; // Doesn't matter, not used
    //     r_from_nb_tdest <= 0; // Doesn't matter, not used
    //     r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= 'hBBCCDDEE;
    //     r_from_nb_tuser[FROM_NB_TUSER_SRC_PORT_OFFSET+:FROM_NB_TUSER_SRC_PORT_WIDTH] <= KIP_PORT;
    //     r_from_nb_tuser[FROM_NB_TUSER_DEST_PORT_OFFSET+:FROM_NB_TUSER_DEST_PORT_WIDTH] <= KIP_PORT;
    //     #200
    //     // Node 5
    //     r_from_nb_tvalid <= 1;
    //     r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_LAN_SEQ_NUM_REPLY;
    //     r_from_nb_tdata[LAN_ACK_SENDER_NODE_ID_OFFSET+:LAN_ACK_SENDER_NODE_ID_WIDTH] <= 5;
    //     r_from_nb_tdata[LAN_ACK_SEQUENCE_NUMBER_OFFSET+:LAN_ACK_SEQUENCE_NUMBER_WIDTH] <= 'hFFFF;
    //     r_from_nb_tid <= 0; // Doesn't matter, not used
    //     r_from_nb_tdest <= 0; // Doesn't matter, not used
    //     r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= 'hEEFFAABB;
    //     r_from_nb_tuser[FROM_NB_TUSER_SRC_PORT_OFFSET+:FROM_NB_TUSER_SRC_PORT_WIDTH] <= KIP_PORT;
    //     r_from_nb_tuser[FROM_NB_TUSER_DEST_PORT_OFFSET+:FROM_NB_TUSER_DEST_PORT_WIDTH] <= KIP_PORT;
    //     #200
    //     // Node 4
    //     r_from_nb_tvalid <= 1;
    //     r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_LAN_SEQ_NUM_REPLY;
    //     r_from_nb_tdata[LAN_ACK_SENDER_NODE_ID_OFFSET+:LAN_ACK_SENDER_NODE_ID_WIDTH] <= 4;
    //     r_from_nb_tdata[LAN_ACK_SEQUENCE_NUMBER_OFFSET+:LAN_ACK_SEQUENCE_NUMBER_WIDTH] <= 'hEEEE;
    //     r_from_nb_tid <= 0; // Doesn't matter, not used
    //     r_from_nb_tdest <= 0; // Doesn't matter, not used
    //     r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= 'hDDEEFFAA;
    //     r_from_nb_tuser[FROM_NB_TUSER_SRC_PORT_OFFSET+:FROM_NB_TUSER_SRC_PORT_WIDTH] <= KIP_PORT;
    //     r_from_nb_tuser[FROM_NB_TUSER_DEST_PORT_OFFSET+:FROM_NB_TUSER_DEST_PORT_WIDTH] <= KIP_PORT;
    //     #200
    //     // Node 2
    //     r_from_nb_tvalid <= 1;
    //     r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_LAN_SEQ_NUM_REPLY;
    //     r_from_nb_tdata[LAN_ACK_SENDER_NODE_ID_OFFSET+:LAN_ACK_SENDER_NODE_ID_WIDTH] <= 2;
    //     r_from_nb_tdata[LAN_ACK_SEQUENCE_NUMBER_OFFSET+:LAN_ACK_SEQUENCE_NUMBER_WIDTH] <= 'hBBBB;
    //     r_from_nb_tid <= 0; // Doesn't matter, not used
    //     r_from_nb_tdest <= 0; // Doesn't matter, not used
    //     r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= 'hBBCCDDEE;
    //     r_from_nb_tuser[FROM_NB_TUSER_SRC_PORT_OFFSET+:FROM_NB_TUSER_SRC_PORT_WIDTH] <= KIP_PORT;
    //     r_from_nb_tuser[FROM_NB_TUSER_DEST_PORT_OFFSET+:FROM_NB_TUSER_DEST_PORT_WIDTH] <= KIP_PORT;
    //     #1000
    //     $finish;
    // end


    // Simulate Node-to-kernel block ram
    initial begin
        for (i = 0; i < NUM_FPGA_NODES+1; i = i + 1)
            r_node_to_kernel_array[i] = 2*i;
    end
    always_ff @(posedge r_clk, negedge r_resetn) begin
        if (r_resetn == 0) begin
            r_node_to_kernel_BRAM_DOUT <= 0;
        end
        else begin
            if (w_node_to_kernel_BRAM_EN)
                r_node_to_kernel_BRAM_DOUT <= r_node_to_kernel_array[w_node_to_kernel_BRAM_ADDR];
            else
                r_node_to_kernel_BRAM_DOUT <= r_node_to_kernel_BRAM_DOUT;
        end
    end

    // Simulate Sequence Number block ram
    initial begin
        for (i = 0; i < NUM_FPGA_NODES; i = i + 1)
            r_LAN_sequence_number_array[i] = i*3;
    end
    // Case 1: Writing a sequence number
    always_ff @(posedge r_clk, negedge r_resetn) begin
        if (w_to_sequence_number_BRAM_EN == 1 
         && w_to_sequence_number_BRAM_WEN == 1)
            r_LAN_sequence_number_array[w_to_sequence_number_BRAM_ADDR] <= w_to_sequence_number_BRAM_DIN;
        else
            r_LAN_sequence_number_array[w_to_sequence_number_BRAM_ADDR] <= r_LAN_sequence_number_array[w_to_sequence_number_BRAM_ADDR];
    end
    // Case 2: Reading a sequence number
    always_ff @(posedge r_clk, negedge r_resetn) begin
        if (r_resetn == 0) begin
            r_to_sequence_number_BRAM_DOUT <= 0;
        end
        else if (w_to_sequence_number_BRAM_EN == 1 
         && w_to_sequence_number_BRAM_WEN == 0)
            r_to_sequence_number_BRAM_DOUT <= r_LAN_sequence_number_array[w_to_sequence_number_BRAM_ADDR];
        else
            r_to_sequence_number_BRAM_DOUT <= 0;
    end
endmodule