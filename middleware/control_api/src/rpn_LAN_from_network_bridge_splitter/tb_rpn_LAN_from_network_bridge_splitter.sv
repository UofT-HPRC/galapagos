module tb #(
    `include "ctrl_api_reliability_header_parameters.vh"
    `include "ctrl_api_header_parameters.vh"
) ();

    // Parameters
    localparam DUT_ID = 'hAB;
    `include "ctrl_api_message_parameters.vh"
    `include "ctrl_api_reliability_message_parameters.vh"

    // Declarations
    logic r_clk;
    logic r_resetn;
    // AXIS interface from network bridge
    logic r_from_nb_tvalid;
    logic w_from_nb_tready;
    logic [AXIS_DATA_WIDTH-1:0] r_from_nb_tdata;
    logic [AXIS_KEEP_WIDTH-1:0] r_from_nb_tkeep;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] r_from_nb_tid;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] r_from_nb_tdest;
    logic [AXIS_FROM_NB_TUSER_WIDTH-1:0] r_from_nb_tuser;
    logic r_from_nb_tlast;
    // AXIS interface to RPN LAN Sequence Number Initializer
    logic w_to_LAN_seq_num_initializer_tvalid;
    logic r_to_LAN_seq_num_initializer_tready;
    logic [AXIS_DATA_WIDTH-1:0] w_to_LAN_seq_num_initializer_tdata;
    logic [AXIS_KEEP_WIDTH-1:0] w_to_LAN_seq_num_initializer_tkeep;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] w_to_LAN_seq_num_initializer_tid;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] w_to_LAN_seq_num_initializer_tdest;
    logic [AXIS_FROM_NB_TUSER_WIDTH-1:0] w_to_LAN_seq_num_initializer_tuser;
    logic w_to_LAN_seq_num_initializer_tlast;
    // AXIS interface to RPN LAN TX
    logic w_to_LAN_TX_tvalid;
    logic r_to_LAN_TX_tready;
    logic [AXIS_DATA_WIDTH-1:0] w_to_LAN_TX_tdata;
    logic [AXIS_KEEP_WIDTH-1:0] w_to_LAN_TX_tkeep;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] w_to_LAN_TX_tid;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] w_to_LAN_TX_tdest;
    logic [AXIS_FROM_NB_TUSER_WIDTH-1:0] w_to_LAN_TX_tuser;
    logic w_to_LAN_TX_tlast;
    // AXIS interface to RPN LAN RX
    logic w_to_LAN_RX_tvalid;
    logic r_to_LAN_RX_tready;
    logic [AXIS_DATA_WIDTH-1:0] w_to_LAN_RX_tdata;
    logic [AXIS_KEEP_WIDTH-1:0] w_to_LAN_RX_tkeep;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] w_to_LAN_RX_tid;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] w_to_LAN_RX_tdest;
    logic [AXIS_FROM_NB_TUSER_WIDTH-1:0] w_to_LAN_RX_tuser;
    logic w_to_LAN_RX_tlast;
    
    rpn_LAN_from_network_bridge_splitter DUT (
        .i_clk(r_clk),
        .i_ap_rst_n(r_resetn),
        // AXIS interface from network bridge
        .from_network_bridge_tvalid(r_from_nb_tvalid),
        .from_network_bridge_tready(w_from_nb_tready),
        .from_network_bridge_tdata(r_from_nb_tdata),
        .from_network_bridge_tkeep(r_from_nb_tkeep),
        .from_network_bridge_tid(r_from_nb_tid),
        .from_network_bridge_tdest(r_from_nb_tdest),
        .from_network_bridge_tuser(r_from_nb_tuser),
        .from_network_bridge_tlast(r_from_nb_tlast),
        // AXIS interface to AXI-Lite to Network Converter
        .to_rpn_LAN_seq_num_initializer_tvalid(w_to_LAN_seq_num_initializer_tvalid),
        .to_rpn_LAN_seq_num_initializer_tready(r_to_LAN_seq_num_initializer_tready),
        .to_rpn_LAN_seq_num_initializer_tdata(w_to_LAN_seq_num_initializer_tdata),
        .to_rpn_LAN_seq_num_initializer_tkeep(w_to_LAN_seq_num_initializer_tkeep),
        .to_rpn_LAN_seq_num_initializer_tid(w_to_LAN_seq_num_initializer_tid),
        .to_rpn_LAN_seq_num_initializer_tdest(w_to_LAN_seq_num_initializer_tdest),
        .to_rpn_LAN_seq_num_initializer_tuser(w_to_LAN_seq_num_initializer_tuser),
        .to_rpn_LAN_seq_num_initializer_tlast(w_to_LAN_seq_num_initializer_tlast),
        // AXIS interface to RPN LAN TX
        .to_rpn_LAN_TX_tvalid(w_to_LAN_TX_tvalid),
        .to_rpn_LAN_TX_tready(r_to_LAN_TX_tready),
        .to_rpn_LAN_TX_tdata(w_to_LAN_TX_tdata),
        .to_rpn_LAN_TX_tkeep(w_to_LAN_TX_tkeep),
        .to_rpn_LAN_TX_tid(w_to_LAN_TX_tid),
        .to_rpn_LAN_TX_tdest(w_to_LAN_TX_tdest),
        .to_rpn_LAN_TX_tuser(w_to_LAN_TX_tuser),
        .to_rpn_LAN_TX_tlast(w_to_LAN_TX_tlast),
        // AXIS interface to RPN LAN RX
        .to_rpn_LAN_RX_tvalid(w_to_LAN_RX_tvalid),
        .to_rpn_LAN_RX_tready(r_to_LAN_RX_tready),
        .to_rpn_LAN_RX_tdata(w_to_LAN_RX_tdata),
        .to_rpn_LAN_RX_tkeep(w_to_LAN_RX_tkeep),
        .to_rpn_LAN_RX_tid(w_to_LAN_RX_tid),
        .to_rpn_LAN_RX_tdest(w_to_LAN_RX_tdest),
        .to_rpn_LAN_RX_tuser(w_to_LAN_RX_tuser),
        .to_rpn_LAN_RX_tlast(w_to_LAN_RX_tlast)
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

    // Constant Assignments
    initial begin
        r_from_nb_tdest <= DUT_ID;
    end

    // Test Logic
    initial begin
        #50
        // Test the different logic modes
        // Send back a LAN SEQ NUM REPLY
        r_from_nb_tvalid <= 1;
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_LAN_SEQ_NUM_REPLY;
        r_from_nb_tdata[LAN_ACK_SENDER_NODE_ID_OFFSET+:LAN_ACK_SENDER_NODE_ID_WIDTH] <= 3;
        r_from_nb_tdata[LAN_ACK_SEQUENCE_NUMBER_OFFSET+:LAN_ACK_SEQUENCE_NUMBER_WIDTH] <= 5;
        r_from_nb_tdata[AXIS_DATA_WIDTH-1:(LAN_ACK_SEQUENCE_NUMBER_OFFSET+LAN_ACK_SEQUENCE_NUMBER_WIDTH)] <= 0;
        r_from_nb_tkeep <= 'hA;
        r_from_nb_tid <= 'hEE;
        r_from_nb_tuser <= 'hAAAABBBB;
        r_from_nb_tlast <= 0;
        // Should follow LAN SEQ NUM initializer
        r_to_LAN_seq_num_initializer_tready <= 1;
        r_to_LAN_TX_tready <= 0;
        r_to_LAN_RX_tready <= 0;
        #5
        r_from_nb_tvalid <= 0;
        r_to_LAN_seq_num_initializer_tready <= 0;
        r_to_LAN_TX_tready <= 1;
        r_to_LAN_RX_tready <= 1;
        #5
        // Test LAN SEQ NUM CHECK
        r_from_nb_tvalid <= 1;
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_LAN_SEQ_NUM_CHECK;
        r_from_nb_tdata[LAN_ACK_SENDER_NODE_ID_OFFSET+:LAN_ACK_SENDER_NODE_ID_WIDTH] <= 8;
        r_from_nb_tdata[LAN_ACK_SEQUENCE_NUMBER_OFFSET+:LAN_ACK_SEQUENCE_NUMBER_WIDTH] <= 0;
        r_from_nb_tdata[AXIS_DATA_WIDTH-1:(LAN_ACK_SEQUENCE_NUMBER_OFFSET+LAN_ACK_SEQUENCE_NUMBER_WIDTH)] <= 0;
        r_from_nb_tkeep <= 'h4;
        r_from_nb_tid <= 'hCC;
        r_from_nb_tuser <= 'h11112222;
        r_from_nb_tlast <= 0;
        // Should follow rpn_LAN_RX tready
        r_to_LAN_seq_num_initializer_tready <= 0;
        r_to_LAN_TX_tready <= 0;
        r_to_LAN_RX_tready <= 1;
        #5
        r_to_LAN_seq_num_initializer_tready <= 1;
        r_to_LAN_TX_tready <= 1;
        r_to_LAN_RX_tready <= 0;
        #5
        // Test LAN ACK
        r_from_nb_tvalid <= 1;
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_LAN_ACK;
        r_from_nb_tdata[LAN_ACK_SENDER_NODE_ID_OFFSET+:LAN_ACK_SENDER_NODE_ID_WIDTH] <= 4;
        r_from_nb_tdata[LAN_ACK_SEQUENCE_NUMBER_OFFSET+:LAN_ACK_SEQUENCE_NUMBER_WIDTH] <= 6;
        r_from_nb_tdata[AXIS_DATA_WIDTH-1:(LAN_ACK_SEQUENCE_NUMBER_OFFSET+LAN_ACK_SEQUENCE_NUMBER_WIDTH)] <= 0;
        r_from_nb_tkeep <= 'hB;
        r_from_nb_tid <= 'hFF;
        r_from_nb_tuser <= 'hBBBBCCCC;
        r_from_nb_tlast <= 1;
        // Should follow rpn_LAN_TX tready
        r_to_LAN_seq_num_initializer_tready <= 0;
        r_to_LAN_TX_tready <= 1;
        r_to_LAN_RX_tready <= 0;
        #5
        r_to_LAN_seq_num_initializer_tready <= 1;
        r_to_LAN_TX_tready <= 0;
        r_to_LAN_RX_tready <= 1;
        #5
        // Test PUB LAN
        r_from_nb_tvalid <= 1;
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_LAN_PUB;
        r_from_nb_tdata[LAN_ACK_SENDER_NODE_ID_OFFSET+:LAN_ACK_SENDER_NODE_ID_WIDTH] <= 2;
        r_from_nb_tdata[LAN_ACK_SEQUENCE_NUMBER_OFFSET+:LAN_ACK_SEQUENCE_NUMBER_WIDTH] <= 1;
        r_from_nb_tdata[AXIS_DATA_WIDTH-1:(LAN_ACK_SEQUENCE_NUMBER_OFFSET+LAN_ACK_SEQUENCE_NUMBER_WIDTH)] <= 0;
        r_from_nb_tkeep <= 'hC;
        r_from_nb_tid <= 'h33;
        r_from_nb_tuser <= 'hCCCCDDDD;
        r_from_nb_tlast <= 0;
        // Should follow rpn_LAN_RX tready
        r_to_LAN_seq_num_initializer_tready <= 0;
        r_to_LAN_TX_tready <= 0;
        r_to_LAN_RX_tready <= 1;
        #5
        r_to_LAN_seq_num_initializer_tready <= 1;
        r_to_LAN_TX_tready <= 1;
        r_to_LAN_RX_tready <= 0;
        #50
        $finish;
    end
endmodule