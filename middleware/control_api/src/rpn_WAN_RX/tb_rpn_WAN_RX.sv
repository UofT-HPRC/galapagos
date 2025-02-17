module tb #(
    `include "ctrl_api_reliability_header_parameters.vh"
    `include "ctrl_api_header_parameters.vh"
) ();

    // Parameters
    `include "ctrl_api_message_parameters.vh"
    `include "ctrl_api_reliability_message_parameters.vh"

    // IDs
    localparam DUT_KERNEL_ID = 'hAA;
    localparam DUT_CTID = 'hEFEFEFEF;
    localparam DUT_IP_ADDRESS = 'h0A010802;
    localparam REMOTE_KERNEL_ID = 'hBB;
    localparam REMOTE_CTID = 'hABCDABCD;
    localparam REMOTE_IP_ADDRESS = 'h0A010868; 
    localparam CTRL_PORT = 'hFA;
    localparam KIP_PORT = 'hFB;
    localparam CURRENT_SEQUENCE_NUMBER = -1;

    // Declarations
    logic r_clk;
    logic r_resetn;
    // AXI-Stream interface from Network Bridge
    logic r_from_nb_tvalid;
    logic w_from_nb_tready;
    logic [AXIS_DATA_WIDTH-1:0] r_from_nb_tdata;
    logic [AXIS_KEEP_WIDTH-1:0] r_from_nb_tkeep;
    logic [IP_PORT_WIDTH-1:0] r_from_nb_tid;
    logic [IP_PORT_WIDTH-1:0] r_from_nb_tdest;
    logic [IP_ADDRESS_WIDTH-1:0] r_from_nb_tuser;
    logic r_from_nb_tlast;
    // AXI-Stream interface to Control module
    logic w_to_ctrl_tvalid;
    logic r_to_ctrl_tready;
    logic [AXIS_DATA_WIDTH-1:0] w_to_ctrl_tdata;
    logic [AXIS_KEEP_WIDTH-1:0] w_to_ctrl_tkeep;
    logic [IP_PORT_WIDTH-1:0] w_to_ctrl_tid;
    logic [IP_PORT_WIDTH-1:0] w_to_ctrl_tdest;
    logic [IP_ADDRESS_WIDTH-1:0] w_to_ctrl_tuser;
    logic w_to_ctrl_tlast;
    // AXI-Stream to Network Bridge KnownIP Interface
    logic w_to_nb_KIP_tvalid;
    logic r_to_nb_KIP_tready;
    logic [AXIS_DATA_WIDTH-1:0] w_to_nb_KIP_tdata;
    logic [AXIS_KEEP_WIDTH-1:0] w_to_nb_KIP_tkeep;
    logic [AXIS_KIP_TUSER_WIDTH-1:0] w_to_nb_KIP_tuser;
    logic w_to_nb_KIP_tlast;
    // BRAM connection to Sequence Number BRAM
    logic w_to_sequence_number_BRAM_CLK;
    logic w_to_sequence_number_BRAM_RST;
    logic w_to_sequence_number_BRAM_EN;
    logic [BRAM_WEN_WIDTH-1:0] w_to_sequence_number_BRAM_WEN;
    logic [WAN_SEQUENCE_NUMBER_WIDTH-1:0] w_to_sequence_number_BRAM_DIN;
    logic [BRAM_ADDR_WIDTH-1:0] w_to_sequence_number_BRAM_ADDR;
    logic [WAN_SEQUENCE_NUMBER_WIDTH-1:0] r_to_sequence_number_BRAM_DOUT;
    // Other

    // DUT
    rpn_WAN_RX #(
    ) DUT (
        .i_clk(r_clk),
        .i_ap_rst_n(r_resetn),
        .i_cluster_id(DUT_CTID),
        .i_gateway_ip_address(DUT_IP_ADDRESS),
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
        // AXI-Stream interface to Control module
        .to_ctrl_tvalid(w_to_ctrl_tvalid),
        .to_ctrl_tready(r_to_ctrl_tready),
        .to_ctrl_tdata(w_to_ctrl_tdata),
        .to_ctrl_tkeep(w_to_ctrl_tkeep),
        .to_ctrl_tid(w_to_ctrl_tid),
        .to_ctrl_tdest(w_to_ctrl_tdest),
        .to_ctrl_tuser(w_to_ctrl_tuser),
        .to_ctrl_tlast(w_to_ctrl_tlast),
        // AXI-Stream to Network Bridge KnownIP Interface
        .to_nb_KIP_tvalid(w_to_nb_KIP_tvalid),
        .to_nb_KIP_tready(r_to_nb_KIP_tready),
        .to_nb_KIP_tdata(w_to_nb_KIP_tdata),
        .to_nb_KIP_tkeep(w_to_nb_KIP_tkeep),
        .to_nb_KIP_tuser(w_to_nb_KIP_tuser),
        .to_nb_KIP_tlast(w_to_nb_KIP_tlast),
        // BRAM connection to Sequence Number BRAM
        .to_sequence_number_BRAM_CLK(w_to_sequence_number_BRAM_CLK),
        .to_sequence_number_BRAM_RST(w_to_sequence_number_BRAM_RST),
        .to_sequence_number_BRAM_EN(w_to_sequence_number_BRAM_EN),
        .to_sequence_number_BRAM_WEN(w_to_sequence_number_BRAM_WEN),
        .to_sequence_number_BRAM_DIN(w_to_sequence_number_BRAM_DIN),
        .to_sequence_number_BRAM_ADDR(w_to_sequence_number_BRAM_ADDR),
        .to_sequence_number_BRAM_DOUT(r_to_sequence_number_BRAM_DOUT)
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
        // to-Control Interface
        r_to_ctrl_tready = 1;
        // to-nb-KIP Interface
        r_to_nb_KIP_tready = 1;
        // Sequence Number BRAM
        r_to_sequence_number_BRAM_DOUT = CURRENT_SEQUENCE_NUMBER;
    end

    initial begin
        r_from_nb_tvalid <= 0;
        r_from_nb_tdata <= 0;
        r_from_nb_tuser <= 0;
        #100
        // // Test sending PUB WAN packets
        // // Received a WAN PUB packet: Write CDCDCDCD to port ACAC
        // r_from_nb_tvalid <= 1;
        // // TDATA
        // r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_WAN_PUB;
        // r_from_nb_tdata[PUB_WAN_SENDER_CTID_OFFSET+:PUB_WAN_SENDER_CTID_WIDTH] <= REMOTE_CTID;
        // r_from_nb_tdata[PUB_WAN_SEQUENCE_NUMBER_OFFSET+:PUB_WAN_SEQUENCE_NUMBER_WIDTH] <= CURRENT_SEQUENCE_NUMBER + 1; // Set a different packet ID to test forwarded LAN packets
        // r_from_nb_tdata[(PUB_WAN_DATA_OFFSET)+:AXIS_WAN_MSG_TYPE_WIDTH] <= MSG_WRITE; // LAN Data begins here
        // r_from_nb_tdata[(PUB_WAN_DATA_OFFSET+AXIS_WAN_DATA_OFFSET)+:AXIS_WAN_DATA_WIDTH] <= 'hCDCDCDCD;
        // r_from_nb_tdata[(PUB_WAN_DATA_OFFSET+AXIS_WAN_DEST_PORT_OFFSET)+:AXIS_WAN_DEST_PORT_WIDTH] <= 'hACAC;
        // r_from_nb_tdata[(PUB_WAN_DATA_OFFSET+AXIS_WAN_CTDEST_OFFSET)+:AXIS_WAN_CTDEST_WIDTH] <= DUT_CTID;
        // r_from_nb_tdata[(PUB_WAN_DATA_OFFSET+AXIS_WAN_CREG_ADDR_OFFSET)+:AXIS_WAN_CREG_ADDR_WIDTH] <= 0;
        // r_from_nb_tdata[(PUB_WAN_DATA_OFFSET+AXIS_WAN_WSTRB_OFFSET)+:AXIS_WAN_WSTRB_WIDTH] <= 'hE;
        // r_from_nb_tdata[(PUB_WAN_DATA_OFFSET+AXIS_WAN_TID_OFFSET)+:AXIS_WAN_TID_WIDTH] <= REMOTE_KERNEL_ID;
        // r_from_nb_tdata[(PUB_WAN_DATA_OFFSET+AXIS_WAN_IP_OFFSET)+:AXIS_LAN_IP_WIDTH] <= REMOTE_IP_ADDRESS;
        // r_from_nb_tdata[(PUB_WAN_DATA_OFFSET+AXIS_WAN_CTID_OFFSET)+:AXIS_WAN_CTID_WIDTH] <= REMOTE_CTID;
        // r_from_nb_tid <= CTRL_PORT;
        // r_from_nb_tdest <= 'hACAC;
        // // TUSER
        // r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= REMOTE_IP_ADDRESS;
        // #100
        // // Received WAN packets from a previous transaction
        // r_from_nb_tdata[PUB_WAN_SEQUENCE_NUMBER_OFFSET+:PUB_WAN_SEQUENCE_NUMBER_WIDTH] <= CURRENT_SEQUENCE_NUMBER;
        // #100
        // r_from_nb_tdata[PUB_WAN_SEQUENCE_NUMBER_OFFSET+:PUB_WAN_SEQUENCE_NUMBER_WIDTH] <= CURRENT_SEQUENCE_NUMBER - 2;
        // #100
        // // Received invalid LAN packet
        // r_from_nb_tdata[PUB_WAN_SEQUENCE_NUMBER_OFFSET+:PUB_WAN_SEQUENCE_NUMBER_WIDTH] <= CURRENT_SEQUENCE_NUMBER + 2;
        // #1000
        // $finish;

        // // Test a SEQ NUM Request
        // Received a WAN PUB packet: Write CDCDCDCD to port ACAC
        r_from_nb_tvalid <= 1;
        // TDATA
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_WAN_PUB;
        r_from_nb_tdata[PUB_WAN_SENDER_CTID_OFFSET+:PUB_WAN_SENDER_CTID_WIDTH] <= REMOTE_CTID;
        r_from_nb_tdata[PUB_WAN_SEQUENCE_NUMBER_OFFSET+:PUB_WAN_SEQUENCE_NUMBER_WIDTH] <= CURRENT_SEQUENCE_NUMBER + 1;
        r_from_nb_tdata[(PUB_WAN_DATA_OFFSET)+:AXIS_WAN_MSG_TYPE_WIDTH] <= MSG_WRITE; // LAN Data begins here
        r_from_nb_tdata[(PUB_WAN_DATA_OFFSET+AXIS_WAN_DATA_OFFSET)+:AXIS_WAN_DATA_WIDTH] <= 'hCDCDCDCD;
        r_from_nb_tdata[(PUB_WAN_DATA_OFFSET+AXIS_WAN_DEST_PORT_OFFSET)+:AXIS_WAN_DEST_PORT_WIDTH] <= 'hACAC;
        r_from_nb_tdata[(PUB_WAN_DATA_OFFSET+AXIS_WAN_CTDEST_OFFSET)+:AXIS_WAN_CTDEST_WIDTH] <= DUT_CTID;
        r_from_nb_tdata[(PUB_WAN_DATA_OFFSET+AXIS_WAN_CREG_ADDR_OFFSET)+:AXIS_WAN_CREG_ADDR_WIDTH] <= 0;
        r_from_nb_tdata[(PUB_WAN_DATA_OFFSET+AXIS_WAN_WSTRB_OFFSET)+:AXIS_WAN_WSTRB_WIDTH] <= 'hE;
        r_from_nb_tdata[(PUB_WAN_DATA_OFFSET+AXIS_WAN_TID_OFFSET)+:AXIS_WAN_TID_WIDTH] <= REMOTE_KERNEL_ID;
        r_from_nb_tdata[(PUB_WAN_DATA_OFFSET+AXIS_WAN_IP_OFFSET)+:AXIS_LAN_IP_WIDTH] <= REMOTE_IP_ADDRESS;
        r_from_nb_tdata[(PUB_WAN_DATA_OFFSET+AXIS_WAN_CTID_OFFSET)+:AXIS_WAN_CTID_WIDTH] <= REMOTE_CTID;
        r_from_nb_tid <= CTRL_PORT;
        r_from_nb_tdest <= 'hACAC;
        // TUSER
        r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= REMOTE_IP_ADDRESS;
        #100
        // Received a WAN SEQ NUM request packet 
        // TDATA
        r_from_nb_tdata[RPN_MSG_TYPE_WIDTH-1:0] <= RPN_MSG_TYPE_WAN_SEQ_NUM_CHECK;
        r_from_nb_tdata[PUB_WAN_SENDER_CTID_OFFSET+:PUB_WAN_SENDER_CTID_WIDTH] <= REMOTE_CTID;
        r_from_nb_tdata[PUB_WAN_SEQUENCE_NUMBER_OFFSET+:PUB_WAN_SEQUENCE_NUMBER_WIDTH] <= 0;
        r_from_nb_tdata[AXIS_DATA_WIDTH-1:PUB_WAN_DATA_OFFSET] <= 0;
        r_from_nb_tid <= CTRL_PORT;
        r_from_nb_tdest <= 'hACAC;
        // TUSER
        r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= REMOTE_IP_ADDRESS;
        #100
        $finish;
    end

endmodule