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
    // AXIS interface to RPN LAN interface
    logic w_to_rpn_LAN_tvalid;
    logic r_to_rpn_LAN_tready;
    logic [AXIS_DATA_WIDTH-1:0] w_to_rpn_LAN_tdata;
    logic [AXIS_KEEP_WIDTH-1:0] w_to_rpn_LAN_tkeep;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] w_to_rpn_LAN_tid;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] w_to_rpn_LAN_tdest;
    logic [AXIS_FROM_NB_TUSER_WIDTH-1:0] w_to_rpn_LAN_tuser;
    logic w_to_rpn_LAN_tlast;
    // AXIS interface to RPN WAN interface
    logic w_to_rpn_WAN_tvalid;
    logic r_to_rpn_WAN_tready;
    logic [AXIS_DATA_WIDTH-1:0] w_to_rpn_WAN_tdata;
    logic [AXIS_KEEP_WIDTH-1:0] w_to_rpn_WAN_tkeep;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] w_to_rpn_WAN_tid;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] w_to_rpn_WAN_tdest;
    logic [AXIS_FROM_NB_TUSER_WIDTH-1:0] w_to_rpn_WAN_tuser;
    logic w_to_rpn_WAN_tlast;
    // AXIS interface to RPN WNN interface
    logic w_to_rpn_WNN_tvalid;
    logic r_to_rpn_WNN_tready;
    logic [AXIS_DATA_WIDTH-1:0] w_to_rpn_WNN_tdata;
    logic [AXIS_KEEP_WIDTH-1:0] w_to_rpn_WNN_tkeep;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] w_to_rpn_WNN_tid;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] w_to_rpn_WNN_tdest;
    logic [AXIS_FROM_NB_TUSER_WIDTH-1:0] w_to_rpn_WNN_tuser;
    logic w_to_rpn_WNN_tlast;
    // AXIS interface to RPN KIP interface
    logic w_to_rpn_KIP_tvalid;
    logic r_to_rpn_KIP_tready;
    logic [AXIS_DATA_WIDTH-1:0] w_to_rpn_KIP_tdata;
    logic [AXIS_KEEP_WIDTH-1:0] w_to_rpn_KIP_tkeep;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] w_to_rpn_KIP_tid;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] w_to_rpn_KIP_tdest;
    logic [AXIS_FROM_NB_TUSER_WIDTH-1:0] w_to_rpn_KIP_tuser;
    logic w_to_rpn_KIP_tlast;

    rpn_from_network_bridge_splitter DUT (
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
        // AXIS interface to rpn LAN
        .to_rpn_LAN_tvalid(w_to_rpn_LAN_tvalid),
        .to_rpn_LAN_tready(r_to_rpn_LAN_tready),
        .to_rpn_LAN_tdata(w_to_rpn_LAN_tdata),
        .to_rpn_LAN_tkeep(w_to_rpn_LAN_tkeep),
        .to_rpn_LAN_tid(w_to_rpn_LAN_tid),
        .to_rpn_LAN_tdest(w_to_rpn_LAN_tdest),
        .to_rpn_LAN_tuser(w_to_rpn_LAN_tuser),
        .to_rpn_LAN_tlast(w_to_rpn_LAN_tlast),
        // AXIS interface to rpn WAN
        .to_rpn_WAN_tvalid(w_to_rpn_WAN_tvalid),
        .to_rpn_WAN_tready(r_to_rpn_WAN_tready),
        .to_rpn_WAN_tdata(w_to_rpn_WAN_tdata),
        .to_rpn_WAN_tkeep(w_to_rpn_WAN_tkeep),
        .to_rpn_WAN_tid(w_to_rpn_WAN_tid),
        .to_rpn_WAN_tdest(w_to_rpn_WAN_tdest),
        .to_rpn_WAN_tuser(w_to_rpn_WAN_tuser),
        .to_rpn_WAN_tlast(w_to_rpn_WAN_tlast),
         // AXIS interface to rpn WNN
        .to_rpn_WNN_tvalid(w_to_rpn_WNN_tvalid),
        .to_rpn_WNN_tready(r_to_rpn_WNN_tready),
        .to_rpn_WNN_tdata(w_to_rpn_WNN_tdata),
        .to_rpn_WNN_tkeep(w_to_rpn_WNN_tkeep),
        .to_rpn_WNN_tid(w_to_rpn_WNN_tid),
        .to_rpn_WNN_tdest(w_to_rpn_WNN_tdest),
        .to_rpn_WNN_tuser(w_to_rpn_WNN_tuser),
        .to_rpn_WNN_tlast(w_to_rpn_WNN_tlast),
         // AXIS interface to rpn KIP
        .to_rpn_KIP_tvalid(w_to_rpn_KIP_tvalid),
        .to_rpn_KIP_tready(r_to_rpn_KIP_tready),
        .to_rpn_KIP_tdata(w_to_rpn_KIP_tdata),
        .to_rpn_KIP_tkeep(w_to_rpn_KIP_tkeep),
        .to_rpn_KIP_tid(w_to_rpn_KIP_tid),
        .to_rpn_KIP_tdest(w_to_rpn_KIP_tdest),
        .to_rpn_KIP_tuser(w_to_rpn_KIP_tuser),
        .to_rpn_KIP_tlast(w_to_rpn_KIP_tlast)
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
        r_from_nb_tuser[AXIS_KIP_TUSER_SRC_PORT_OFFSET +:AXIS_KIP_TUSER_SRC_PORT_WIDTH] <= REMOTE_CTRL_PORT;        r_to_rpn_LAN_tready <= 0;
        r_to_rpn_WAN_tready <= 0;
        r_to_rpn_WNN_tready <= 0;
        r_to_rpn_KIP_tready <= 0;
        #100
        // Test rpn LAN
        r_from_nb_tvalid <= 1;
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_LAN_PUB;
        r_to_rpn_LAN_tready <= 1;
        r_to_rpn_WAN_tready <= 0;
        r_to_rpn_WNN_tready <= 0;
        r_to_rpn_KIP_tready <= 0;
        #5
        r_to_rpn_LAN_tready <= 0;
        r_to_rpn_WAN_tready <= 1;
        r_to_rpn_WNN_tready <= 1;
        r_to_rpn_KIP_tready <= 1;
        #5
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_LAN_ACK;
        r_to_rpn_LAN_tready <= 1;
        r_to_rpn_WAN_tready <= 0;
        r_to_rpn_WNN_tready <= 0;
        r_to_rpn_KIP_tready <= 0;
        #5
        r_to_rpn_LAN_tready <= 0;
        r_to_rpn_WAN_tready <= 1;
        r_to_rpn_WNN_tready <= 1;
        r_to_rpn_KIP_tready <= 1;
        #5
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_LAN_SEQ_NUM_CHECK;
        r_to_rpn_LAN_tready <= 1;
        r_to_rpn_WAN_tready <= 0;
        r_to_rpn_WNN_tready <= 0;
        r_to_rpn_KIP_tready <= 0;
        #5
        r_to_rpn_LAN_tready <= 0;
        r_to_rpn_WAN_tready <= 1;
        r_to_rpn_WNN_tready <= 1;
        r_to_rpn_KIP_tready <= 1;
        #5
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_LAN_SEQ_NUM_REPLY;
        r_to_rpn_LAN_tready <= 1;
        r_to_rpn_WAN_tready <= 0;
        r_to_rpn_WNN_tready <= 0;
        r_to_rpn_KIP_tready <= 0;
        #5
        r_to_rpn_LAN_tready <= 0;
        r_to_rpn_WAN_tready <= 1;
        r_to_rpn_WNN_tready <= 1;
        r_to_rpn_KIP_tready <= 1;
        #5
        r_to_rpn_LAN_tready <= 0;
        r_to_rpn_WAN_tready <= 0;
        r_to_rpn_WNN_tready <= 0;
        r_to_rpn_KIP_tready <= 0;
        #5
        // Test RPN WAN
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_WAN_PUB;
        r_to_rpn_LAN_tready <= 0;
        r_to_rpn_WAN_tready <= 1;
        r_to_rpn_WNN_tready <= 0;
        r_to_rpn_KIP_tready <= 0;
        #5
        r_to_rpn_LAN_tready <= 1;
        r_to_rpn_WAN_tready <= 0;
        r_to_rpn_WNN_tready <= 1;
        r_to_rpn_KIP_tready <= 1;
        #5
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_WAN_ACK;
        r_to_rpn_LAN_tready <= 0;
        r_to_rpn_WAN_tready <= 1;
        r_to_rpn_WNN_tready <= 0;
        r_to_rpn_KIP_tready <= 0;
        #5
        r_to_rpn_LAN_tready <= 1;
        r_to_rpn_WAN_tready <= 0;
        r_to_rpn_WNN_tready <= 1;
        r_to_rpn_KIP_tready <= 1;
        #5
        r_to_rpn_LAN_tready <= 0;
        r_to_rpn_WAN_tready <= 0;
        r_to_rpn_WNN_tready <= 0;
        r_to_rpn_KIP_tready <= 0;
        #5
        // Test RPN WNN
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_REQUEST;
        r_to_rpn_LAN_tready <= 0;
        r_to_rpn_WAN_tready <= 0;
        r_to_rpn_WNN_tready <= 1;
        r_to_rpn_KIP_tready <= 0;
        #5
        r_to_rpn_LAN_tready <= 1;
        r_to_rpn_WAN_tready <= 1;
        r_to_rpn_WNN_tready <= 0;
        r_to_rpn_KIP_tready <= 1;
        #5
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_REPLY;
        r_to_rpn_LAN_tready <= 0;
        r_to_rpn_WAN_tready <= 0;
        r_to_rpn_WNN_tready <= 1;
        r_to_rpn_KIP_tready <= 0;
        #5
        r_to_rpn_LAN_tready <= 1;
        r_to_rpn_WAN_tready <= 1;
        r_to_rpn_WNN_tready <= 0;
        r_to_rpn_KIP_tready <= 1;
        #5
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_WRITE;
        r_to_rpn_LAN_tready <= 0;
        r_to_rpn_WAN_tready <= 0;
        r_to_rpn_WNN_tready <= 1;
        r_to_rpn_KIP_tready <= 0;
        #5
        r_to_rpn_LAN_tready <= 1;
        r_to_rpn_WAN_tready <= 1;
        r_to_rpn_WNN_tready <= 0;
        r_to_rpn_KIP_tready <= 1;
        #5
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_BRESP;
        r_to_rpn_LAN_tready <= 0;
        r_to_rpn_WAN_tready <= 0;
        r_to_rpn_WNN_tready <= 1;
        r_to_rpn_KIP_tready <= 0;
        #5
        r_to_rpn_LAN_tready <= 1;
        r_to_rpn_WAN_tready <= 1;
        r_to_rpn_WNN_tready <= 0;
        r_to_rpn_KIP_tready <= 1;
        #5
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_CHECK;
        r_to_rpn_LAN_tready <= 0;
        r_to_rpn_WAN_tready <= 0;
        r_to_rpn_WNN_tready <= 1;
        r_to_rpn_KIP_tready <= 0;
        #5
        r_to_rpn_LAN_tready <= 1;
        r_to_rpn_WAN_tready <= 1;
        r_to_rpn_WNN_tready <= 0;
        r_to_rpn_KIP_tready <= 1;
        #5
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_WAN_OUTGOING_SEQ_NUM_RDATA;
        r_to_rpn_LAN_tready <= 0;
        r_to_rpn_WAN_tready <= 0;
        r_to_rpn_WNN_tready <= 1;
        r_to_rpn_KIP_tready <= 0;
        #5
        r_to_rpn_LAN_tready <= 1;
        r_to_rpn_WAN_tready <= 1;
        r_to_rpn_WNN_tready <= 0;
        r_to_rpn_KIP_tready <= 1;
        #5
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_REQUEST;
        r_to_rpn_LAN_tready <= 0;
        r_to_rpn_WAN_tready <= 0;
        r_to_rpn_WNN_tready <= 1;
        r_to_rpn_KIP_tready <= 0;
        #5
        r_to_rpn_LAN_tready <= 1;
        r_to_rpn_WAN_tready <= 1;
        r_to_rpn_WNN_tready <= 0;
        r_to_rpn_KIP_tready <= 1;
        #5
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_REPLY;
        r_to_rpn_LAN_tready <= 0;
        r_to_rpn_WAN_tready <= 0;
        r_to_rpn_WNN_tready <= 1;
        r_to_rpn_KIP_tready <= 0;
        #5
        r_to_rpn_LAN_tready <= 1;
        r_to_rpn_WAN_tready <= 1;
        r_to_rpn_WNN_tready <= 0;
        r_to_rpn_KIP_tready <= 1;
        #5
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_WRITE;
        r_to_rpn_LAN_tready <= 0;
        r_to_rpn_WAN_tready <= 0;
        r_to_rpn_WNN_tready <= 1;
        r_to_rpn_KIP_tready <= 0;
        #5
        r_to_rpn_LAN_tready <= 1;
        r_to_rpn_WAN_tready <= 1;
        r_to_rpn_WNN_tready <= 0;
        r_to_rpn_KIP_tready <= 1;
        #5
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_WAN_INCOMING_SEQ_NUM_BRESP;
        r_to_rpn_LAN_tready <= 0;
        r_to_rpn_WAN_tready <= 0;
        r_to_rpn_WNN_tready <= 1;
        r_to_rpn_KIP_tready <= 0;
        #5
        r_to_rpn_LAN_tready <= 1;
        r_to_rpn_WAN_tready <= 1;
        r_to_rpn_WNN_tready <= 0;
        r_to_rpn_KIP_tready <= 1;
        #5
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_WAN_NUM_SEQ_NUM_CHECK;
        r_to_rpn_LAN_tready <= 0;
        r_to_rpn_WAN_tready <= 0;
        r_to_rpn_WNN_tready <= 1;
        r_to_rpn_KIP_tready <= 0;
        #5
        r_to_rpn_LAN_tready <= 1;
        r_to_rpn_WAN_tready <= 1;
        r_to_rpn_WNN_tready <= 0;
        r_to_rpn_KIP_tready <= 1;
        #5
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_WAN_NUM_SEQ_NUM_REPLY;
        r_to_rpn_LAN_tready <= 0;
        r_to_rpn_WAN_tready <= 0;
        r_to_rpn_WNN_tready <= 1;
        r_to_rpn_KIP_tready <= 0;
        #5
        r_to_rpn_LAN_tready <= 1;
        r_to_rpn_WAN_tready <= 1;
        r_to_rpn_WNN_tready <= 0;
        r_to_rpn_KIP_tready <= 1;
        #5
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_WAN_SEQ_NUM_CHECK;
        r_to_rpn_LAN_tready <= 0;
        r_to_rpn_WAN_tready <= 0;
        r_to_rpn_WNN_tready <= 1;
        r_to_rpn_KIP_tready <= 0;
        #5
        r_to_rpn_LAN_tready <= 1;
        r_to_rpn_WAN_tready <= 1;
        r_to_rpn_WNN_tready <= 0;
        r_to_rpn_KIP_tready <= 1;
        #5
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_WAN_SEQ_NUM_REPLY;
        r_to_rpn_LAN_tready <= 0;
        r_to_rpn_WAN_tready <= 0;
        r_to_rpn_WNN_tready <= 1;
        r_to_rpn_KIP_tready <= 0;
        #5
        r_to_rpn_LAN_tready <= 1;
        r_to_rpn_WAN_tready <= 1;
        r_to_rpn_WNN_tready <= 0;
        r_to_rpn_KIP_tready <= 1;
        #5
        r_to_rpn_LAN_tready <= 0;
        r_to_rpn_WAN_tready <= 0;
        r_to_rpn_WNN_tready <= 0;
        r_to_rpn_KIP_tready <= 0;
        // Test RPN KIP 
        #5
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_KIP_PUB;
        r_to_rpn_LAN_tready <= 0;
        r_to_rpn_WAN_tready <= 0;
        r_to_rpn_WNN_tready <= 0;
        r_to_rpn_KIP_tready <= 1;
        #5
        r_to_rpn_LAN_tready <= 1;
        r_to_rpn_WAN_tready <= 1;
        r_to_rpn_WNN_tready <= 1;
        r_to_rpn_KIP_tready <= 0;
        #5
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_KIP_ACK;
        r_to_rpn_LAN_tready <= 0;
        r_to_rpn_WAN_tready <= 0;
        r_to_rpn_WNN_tready <= 0;
        r_to_rpn_KIP_tready <= 1;
        #5
        r_to_rpn_LAN_tready <= 1;
        r_to_rpn_WAN_tready <= 1;
        r_to_rpn_WNN_tready <= 1;
        r_to_rpn_KIP_tready <= 0;
        #50
        $finish;
    end
endmodule