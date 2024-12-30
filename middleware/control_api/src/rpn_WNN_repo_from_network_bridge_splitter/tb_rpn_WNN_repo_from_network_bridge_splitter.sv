module tb #(
    `include "ctrl_api_reliability_header_parameters.vh"
    `include "ctrl_api_header_parameters.vh"
) ();

    // Parameters
    localparam DUT_ID = 'hAB;
    localparam DUT_CTRL_PORT = 'hBBBB;
    localparam REMOTE_KERNEL_ID = 'hCC;
    localparam REMOTE_IP_ADDRESS = 'h0C0D0E0F;
    localparam REMOTE_CTRL_PORT = 'hACAC;
    localparam REMOTE_KIP_PORT = 'hE0C0;

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
    // AXIS interface to RPN outgoing repo
    logic w_to_rpn_WNN_outgoing_repo_tvalid;
    logic r_to_rpn_WNN_outgoing_repo_tready;
    logic [AXIS_DATA_WIDTH-1:0] w_to_rpn_WNN_outgoing_repo_tdata;
    logic [AXIS_KEEP_WIDTH-1:0] w_to_rpn_WNN_outgoing_repo_tkeep;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] w_to_rpn_WNN_outgoing_repo_tid;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] w_to_rpn_WNN_outgoing_repo_tdest;
    logic [AXIS_FROM_NB_TUSER_WIDTH-1:0] w_to_rpn_WNN_outgoing_repo_tuser;
    logic w_to_rpn_WNN_outgoing_repo_tlast;
    // AXIS interface to RPN Incoming Repo interface
    logic w_to_rpn_WNN_incoming_repo_tvalid;
    logic r_to_rpn_WNN_incoming_repo_tready;
    logic [AXIS_DATA_WIDTH-1:0] w_to_rpn_WNN_incoming_repo_tdata;
    logic [AXIS_KEEP_WIDTH-1:0] w_to_rpn_WNN_incoming_repo_tkeep;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] w_to_rpn_WNN_incoming_repo_tid;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] w_to_rpn_WNN_incoming_repo_tdest;
    logic [AXIS_FROM_NB_TUSER_WIDTH-1:0] w_to_rpn_WNN_incoming_repo_tuser;
    logic w_to_rpn_WNN_incoming_repo_tlast;
    // AXIS interface to RPN WAN Sequence Number Initializer interface
    logic w_to_rpn_WAN_seq_num_initializer_tvalid;
    logic r_to_rpn_WAN_seq_num_initializer_tready;
    logic [AXIS_DATA_WIDTH-1:0] w_to_rpn_WAN_seq_num_initializer_tdata;
    logic [AXIS_KEEP_WIDTH-1:0] w_to_rpn_WAN_seq_num_initializer_tkeep;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] w_to_rpn_WAN_seq_num_initializer_tid;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] w_to_rpn_WAN_seq_num_initializer_tdest;
    logic [AXIS_FROM_NB_TUSER_WIDTH-1:0] w_to_rpn_WAN_seq_num_initializer_tuser;
    logic w_to_rpn_WAN_seq_num_initializer_tlast;

    rpn_WNN_repo_from_network_bridge_splitter DUT (
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
        // AXIS interface to rpn WNN outgoing repo
        .to_rpn_WNN_outgoing_repo_tvalid(w_to_rpn_WNN_outgoing_repo_tvalid),
        .to_rpn_WNN_outgoing_repo_tready(r_to_rpn_WNN_outgoing_repo_tready),
        .to_rpn_WNN_outgoing_repo_tdata(w_to_rpn_WNN_outgoing_repo_tdata),
        .to_rpn_WNN_outgoing_repo_tkeep(w_to_rpn_WNN_outgoing_repo_tkeep),
        .to_rpn_WNN_outgoing_repo_tid(w_to_rpn_WNN_outgoing_repo_tid),
        .to_rpn_WNN_outgoing_repo_tdest(w_to_rpn_WNN_outgoing_repo_tdest),
        .to_rpn_WNN_outgoing_repo_tuser(w_to_rpn_WNN_outgoing_repo_tuser),
        .to_rpn_WNN_outgoing_repo_tlast(w_to_rpn_WNN_outgoing_repo_tlast),
        // AXIS interface to rpn WNN incoming repo
        .to_rpn_WNN_incoming_repo_tvalid(w_to_rpn_WNN_incoming_repo_tvalid),
        .to_rpn_WNN_incoming_repo_tready(r_to_rpn_WNN_incoming_repo_tready),
        .to_rpn_WNN_incoming_repo_tdata(w_to_rpn_WNN_incoming_repo_tdata),
        .to_rpn_WNN_incoming_repo_tkeep(w_to_rpn_WNN_incoming_repo_tkeep),
        .to_rpn_WNN_incoming_repo_tid(w_to_rpn_WNN_incoming_repo_tid),
        .to_rpn_WNN_incoming_repo_tdest(w_to_rpn_WNN_incoming_repo_tdest),
        .to_rpn_WNN_incoming_repo_tuser(w_to_rpn_WNN_incoming_repo_tuser),
        .to_rpn_WNN_incoming_repo_tlast(w_to_rpn_WNN_incoming_repo_tlast),
         // AXIS interface to rpn WAN Sequence Number Initializer
        .to_rpn_WAN_seq_num_initializer_tvalid(w_to_rpn_WAN_seq_num_initializer_tvalid),
        .to_rpn_WAN_seq_num_initializer_tready(r_to_rpn_WAN_seq_num_initializer_tready),
        .to_rpn_WAN_seq_num_initializer_tdata(w_to_rpn_WAN_seq_num_initializer_tdata),
        .to_rpn_WAN_seq_num_initializer_tkeep(w_to_rpn_WAN_seq_num_initializer_tkeep),
        .to_rpn_WAN_seq_num_initializer_tid(w_to_rpn_WAN_seq_num_initializer_tid),
        .to_rpn_WAN_seq_num_initializer_tdest(w_to_rpn_WAN_seq_num_initializer_tdest),
        .to_rpn_WAN_seq_num_initializer_tuser(w_to_rpn_WAN_seq_num_initializer_tuser),
        .to_rpn_WAN_seq_num_initializer_tlast(w_to_rpn_WAN_seq_num_initializer_tlast)
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
        r_from_nb_tlast <= 1;
    end

    // Test Logic
    initial begin
        #50
        // Test the different logic modes
        r_from_nb_tvalid <= 0;
        r_from_nb_tdata <= 0;
        r_from_nb_tid <= 'hAB;
        r_from_nb_tkeep <= 'hEFEFEFEFEFEFEFEF;
        r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= REMOTE_IP_ADDRESS;
        r_from_nb_tuser[AXIS_KIP_TUSER_DEST_PORT_OFFSET+:AXIS_KIP_TUSER_DEST_PORT_WIDTH] <= DUT_CTRL_PORT;
        r_from_nb_tuser[AXIS_KIP_TUSER_SRC_PORT_OFFSET +:AXIS_KIP_TUSER_SRC_PORT_WIDTH] <= REMOTE_CTRL_PORT;        r_to_rpn_WNN_outgoing_repo_tready <= 0;
        r_to_rpn_WNN_incoming_repo_tready <= 0;
        r_to_rpn_WAN_seq_num_initializer_tready <= 0;
        #100
        r_from_nb_tvalid <= 1;
        // Test RPN WNN
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_REQUEST;
        r_to_rpn_WNN_outgoing_repo_tready <= 1;
        r_to_rpn_WNN_incoming_repo_tready <= 0;
        r_to_rpn_WAN_seq_num_initializer_tready <= 0;
        #5
        r_to_rpn_WNN_outgoing_repo_tready <= 0;
        r_to_rpn_WNN_incoming_repo_tready <= 1;
        r_to_rpn_WAN_seq_num_initializer_tready <= 1;
        #5
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_WRITE;
        r_to_rpn_WNN_outgoing_repo_tready <= 1;
        r_to_rpn_WNN_incoming_repo_tready <= 0;
        r_to_rpn_WAN_seq_num_initializer_tready <= 0;
        #5
        r_to_rpn_WNN_outgoing_repo_tready <= 0;
        r_to_rpn_WNN_incoming_repo_tready <= 1;
        r_to_rpn_WAN_seq_num_initializer_tready <= 1;
        #5
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_CHECK;
        r_to_rpn_WNN_outgoing_repo_tready <= 1;
        r_to_rpn_WNN_incoming_repo_tready <= 0;
        r_to_rpn_WAN_seq_num_initializer_tready <= 0;
        #5
        r_to_rpn_WNN_outgoing_repo_tready <= 0;
        r_to_rpn_WNN_incoming_repo_tready <= 1;
        r_to_rpn_WAN_seq_num_initializer_tready <= 1;
        #5
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_REQUEST;
        r_to_rpn_WNN_outgoing_repo_tready <= 0;
        r_to_rpn_WNN_incoming_repo_tready <= 1;
        r_to_rpn_WAN_seq_num_initializer_tready <= 0;
        #5
        r_to_rpn_WNN_outgoing_repo_tready <= 1;
        r_to_rpn_WNN_incoming_repo_tready <= 0;
        r_to_rpn_WAN_seq_num_initializer_tready <= 1;
        #5
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_WRITE;
        r_to_rpn_WNN_outgoing_repo_tready <= 0;
        r_to_rpn_WNN_incoming_repo_tready <= 1;
        r_to_rpn_WAN_seq_num_initializer_tready <= 0;
        #5
        r_to_rpn_WNN_outgoing_repo_tready <= 1;
        r_to_rpn_WNN_incoming_repo_tready <= 0;
        r_to_rpn_WAN_seq_num_initializer_tready <= 1;
        #5
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_WAN_NUM_SEQ_NUM_CHECK;
        r_to_rpn_WNN_outgoing_repo_tready <= 0;
        r_to_rpn_WNN_incoming_repo_tready <= 1;
        r_to_rpn_WAN_seq_num_initializer_tready <= 0;
        #5
        r_to_rpn_WNN_outgoing_repo_tready <= 1;
        r_to_rpn_WNN_incoming_repo_tready <= 0;
        r_to_rpn_WAN_seq_num_initializer_tready <= 1;
        #5
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_WAN_SEQ_NUM_CHECK;
        r_to_rpn_WNN_outgoing_repo_tready <= 0;
        r_to_rpn_WNN_incoming_repo_tready <= 0;
        r_to_rpn_WAN_seq_num_initializer_tready <= 1;
        #5
        r_to_rpn_WNN_outgoing_repo_tready <= 1;
        r_to_rpn_WNN_incoming_repo_tready <= 1;
        r_to_rpn_WAN_seq_num_initializer_tready <= 0;
        #5
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_WAN_SEQ_NUM_REPLY;
        r_to_rpn_WNN_outgoing_repo_tready <= 0;
        r_to_rpn_WNN_incoming_repo_tready <= 0;
        r_to_rpn_WAN_seq_num_initializer_tready <= 1;
        #5
        r_to_rpn_WNN_outgoing_repo_tready <= 1;
        r_to_rpn_WNN_incoming_repo_tready <= 1;
        r_to_rpn_WAN_seq_num_initializer_tready <= 0;
        #50
        $finish;
    end
endmodule