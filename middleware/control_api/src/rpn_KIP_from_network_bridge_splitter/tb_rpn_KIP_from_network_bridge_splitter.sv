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
    // AXIS interface to RPN WNN Repo interface
    logic w_to_rpn_KIP_TX_tvalid;
    logic r_to_rpn_KIP_TX_tready;
    logic [AXIS_DATA_WIDTH-1:0] w_to_rpn_KIP_TX_tdata;
    logic [AXIS_KEEP_WIDTH-1:0] w_to_rpn_KIP_TX_tkeep;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] w_to_rpn_KIP_TX_tid;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] w_to_rpn_KIP_TX_tdest;
    logic [AXIS_FROM_NB_TUSER_WIDTH-1:0] w_to_rpn_KIP_TX_tuser;
    logic w_to_rpn_KIP_TX_tlast;
    // AXIS interface to RPN WNN Node interface
    logic w_to_rpn_KIP_RX_tvalid;
    logic r_to_rpn_KIP_RX_tready;
    logic [AXIS_DATA_WIDTH-1:0] w_to_rpn_KIP_RX_tdata;
    logic [AXIS_KEEP_WIDTH-1:0] w_to_rpn_KIP_RX_tkeep;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] w_to_rpn_KIP_RX_tid;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] w_to_rpn_KIP_RX_tdest;
    logic [AXIS_FROM_NB_TUSER_WIDTH-1:0] w_to_rpn_KIP_RX_tuser;
    logic w_to_rpn_KIP_RX_tlast;

    rpn_KIP_from_network_bridge_splitter DUT (
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
        // AXIS interface to rpn KIP TX
        .to_rpn_KIP_TX_tvalid(w_to_rpn_KIP_TX_tvalid),
        .to_rpn_KIP_TX_tready(r_to_rpn_KIP_TX_tready),
        .to_rpn_KIP_TX_tdata(w_to_rpn_KIP_TX_tdata),
        .to_rpn_KIP_TX_tkeep(w_to_rpn_KIP_TX_tkeep),
        .to_rpn_KIP_TX_tid(w_to_rpn_KIP_TX_tid),
        .to_rpn_KIP_TX_tdest(w_to_rpn_KIP_TX_tdest),
        .to_rpn_KIP_TX_tuser(w_to_rpn_KIP_TX_tuser),
        .to_rpn_KIP_TX_tlast(w_to_rpn_KIP_TX_tlast),
         // AXIS interface to rpn KIP RX
        .to_rpn_KIP_RX_tvalid(w_to_rpn_KIP_RX_tvalid),
        .to_rpn_KIP_RX_tready(r_to_rpn_KIP_RX_tready),
        .to_rpn_KIP_RX_tdata(w_to_rpn_KIP_RX_tdata),
        .to_rpn_KIP_RX_tkeep(w_to_rpn_KIP_RX_tkeep),
        .to_rpn_KIP_RX_tid(w_to_rpn_KIP_RX_tid),
        .to_rpn_KIP_RX_tdest(w_to_rpn_KIP_RX_tdest),
        .to_rpn_KIP_RX_tuser(w_to_rpn_KIP_RX_tuser),
        .to_rpn_KIP_RX_tlast(w_to_rpn_KIP_RX_tlast)
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
        r_from_nb_tuser[AXIS_KIP_TUSER_SRC_PORT_OFFSET +:AXIS_KIP_TUSER_SRC_PORT_WIDTH] <= REMOTE_CTRL_PORT;        r_to_rpn_KIP_TX_tready <= 0;
        r_to_rpn_KIP_RX_tready <= 0;
        #100
        r_from_nb_tvalid <= 1;
        // Test RPN KIP
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_KIP_PUB;
        r_to_rpn_KIP_TX_tready <= 0;
        r_to_rpn_KIP_RX_tready <= 1;
        #5
        r_to_rpn_KIP_TX_tready <= 1;
        r_to_rpn_KIP_RX_tready <= 0;
        #5
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_KIP_ACK;
        r_to_rpn_KIP_TX_tready <= 1;
        r_to_rpn_KIP_RX_tready <= 0;
        #5
        r_to_rpn_KIP_TX_tready <= 0;
        r_to_rpn_KIP_RX_tready <= 1;
        #50
        $finish;
    end
endmodule