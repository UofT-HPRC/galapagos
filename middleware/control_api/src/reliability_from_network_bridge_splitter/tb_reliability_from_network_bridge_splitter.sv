module tb #(
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
    // AXIS interface to AXI-Lite to Network Converter
    logic w_to_rel_outbound_tvalid;
    logic r_to_rel_outbound_tready;
    logic [AXIS_DATA_WIDTH-1:0] w_to_rel_outbound_tdata;
    logic [AXIS_KEEP_WIDTH-1:0] w_to_rel_outbound_tkeep;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] w_to_rel_outbound_tid;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] w_to_rel_outbound_tdest;
    logic [AXIS_FROM_NB_TUSER_WIDTH-1:0] w_to_rel_outbound_tuser;
    logic w_to_rel_outbound_tlast;
    // AXIS interface to Network to AXI-Lite Converter
    logic w_to_rel_inbound_tvalid;
    logic r_to_rel_inbound_tready;
    logic [AXIS_DATA_WIDTH-1:0] w_to_rel_inbound_tdata;
    logic [AXIS_KEEP_WIDTH-1:0] w_to_rel_inbound_tkeep;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] w_to_rel_inbound_tid;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] w_to_rel_inbound_tdest;
    logic [AXIS_FROM_NB_TUSER_WIDTH-1:0] w_to_rel_inbound_tuser;
    logic w_to_rel_inbound_tlast;

    reliability_from_network_bridge_splitter DUT (
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
        // AXIS interface to reliability outbound
        .to_rel_outbound_tvalid(w_to_rel_outbound_tvalid),
        .to_rel_outbound_tready(r_to_rel_outbound_tready),
        .to_rel_outbound_tdata(w_to_rel_outbound_tdata),
        .to_rel_outbound_tkeep(w_to_rel_outbound_tkeep),
        .to_rel_outbound_tid(w_to_rel_outbound_tid),
        .to_rel_outbound_tdest(w_to_rel_outbound_tdest),
        .to_rel_outbound_tuser(w_to_rel_outbound_tuser),
        .to_rel_outbound_tlast(w_to_rel_outbound_tlast),
        // AXIS interface to reliability inbound
        .to_rel_inbound_tvalid(w_to_rel_inbound_tvalid),
        .to_rel_inbound_tready(r_to_rel_inbound_tready),
        .to_rel_inbound_tdata(w_to_rel_inbound_tdata),
        .to_rel_inbound_tkeep(w_to_rel_inbound_tkeep),
        .to_rel_inbound_tid(w_to_rel_inbound_tid),
        .to_rel_inbound_tdest(w_to_rel_inbound_tdest),
        .to_rel_inbound_tuser(w_to_rel_inbound_tuser),
        .to_rel_inbound_tlast(w_to_rel_inbound_tlast)
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
        // Received a LAN PUB packet: Write CDCDCDCD to address ABCDABCDABCDABCD 
        // TDATA
        r_from_nb_tvalid <= 1;
        r_from_nb_tdata[PACKET_MSG_TYPE_WIDTH-1:0] <= RPM_MSG_TYPE_PUB;
        r_from_nb_tdata[PUB_LAN_TID_OFFSET+:PUB_LAN_TID_WIDTH] <= REMOTE_KERNEL_ID;
        r_from_nb_tdata[PUB_LAN_IP_OFFSET+:PUB_LAN_IP_WIDTH] <= REMOTE_IP_ADDRESS;
        r_from_nb_tdata[PUB_LAN_PACKET_ID_OFFSET+:PUB_LAN_PACKET_ID_WIDTH] <= 'hEFEFEFEFEFEFEFEF; // Set a different packet ID to test forwarded LAN packets
        r_from_nb_tdata[(PUB_LAN_DATA_OFFSET)+:AXIS_LAN_MSG_TYPE_WIDTH] <= MSG_WRITE; // LAN Data begins here
        r_from_nb_tdata[(PUB_LAN_DATA_OFFSET+AXIS_LAN_DATA_OFFSET)+:AXIS_LAN_DATA_WIDTH] <= 'hCDCDCDCD;
        r_from_nb_tdata[(PUB_LAN_DATA_OFFSET+AXIS_LAN_ADDR_OFFSET)+:AXIS_LAN_ADDR_WIDTH] <= 'hABCDABCDABCDABCD;
        r_from_nb_tdata[(PUB_LAN_DATA_OFFSET+AXIS_LAN_WSTRB_OFFSET)+:AXIS_LAN_WSTRB_WIDTH] <= 'hE;
        r_from_nb_tdata[(PUB_LAN_DATA_OFFSET+AXIS_LAN_TID_OFFSET)+:AXIS_LAN_TID_WIDTH] <= REMOTE_KERNEL_ID;
        r_from_nb_tdata[(PUB_LAN_DATA_OFFSET+AXIS_LAN_IP_OFFSET)+:AXIS_LAN_IP_WIDTH] <= REMOTE_IP_ADDRESS;
        r_from_nb_tdata[AXIS_DATA_WIDTH-1:(PUB_LAN_DATA_OFFSET+AXIS_LAN_IP_OFFSET+AXIS_LAN_IP_WIDTH)] <= 0;
        r_from_nb_tid <= REMOTE_KERNEL_ID;
        r_from_nb_tkeep <= 'hA;
        r_from_nb_tlast <= 1;
        // TUSER
        r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= REMOTE_IP_ADDRESS;
        r_from_nb_tuser[AXIS_KIP_TUSER_DEST_PORT_OFFSET+:AXIS_KIP_TUSER_DEST_PORT_WIDTH] <= DUT_CTRL_PORT;
        r_from_nb_tuser[AXIS_KIP_TUSER_SRC_PORT_OFFSET +:AXIS_KIP_TUSER_SRC_PORT_WIDTH] <= REMOTE_CTRL_PORT;
        // TREADY should follow rel_inbound
        r_to_rel_outbound_tready <= 1;
        r_to_rel_inbound_tready <= 0;
        #5
        r_from_nb_tvalid <= 0;
        r_to_rel_outbound_tready <= 0;
        r_to_rel_inbound_tready <= 1;
        #5
        // Respond to PUB packet with a PUBREC packet
        r_from_nb_tvalid <= 1;
        r_from_nb_tdata[PACKET_MSG_TYPE_WIDTH-1:0] <= RPM_MSG_TYPE_PUBREC;
        r_from_nb_tdata[KIP_IP_OFFSET+:KIP_IP_WIDTH] <= REMOTE_IP_ADDRESS;
        r_from_nb_tdata[KIP_TDEST_OFFSET+:KIP_TDEST_WIDTH] <= DUT_ID;
        r_from_nb_tdata[KIP_TID_OFFSET+:KIP_TID_WIDTH] <= REMOTE_KERNEL_ID;
        r_from_nb_tdata[RESP_PACKET_ID_OFFSET+:PACKET_ID_WIDTH] <= 'hABCDABCD;
        r_from_nb_tdata[AXIS_DATA_WIDTH-1:(RESP_PACKET_ID_OFFSET+PACKET_ID_WIDTH)] <= 0;
        r_from_nb_tid <= REMOTE_KERNEL_ID;
        r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= REMOTE_IP_ADDRESS;
        r_from_nb_tuser[KIP_TUSER_SRC_PORT_OFFSET+:KIP_TUSER_SRC_PORT_WIDTH] <= REMOTE_KIP_PORT;
        r_from_nb_tuser[KIP_TUSER_DEST_PORT_OFFSET+:KIP_TUSER_DEST_PORT_WIDTH] <= REMOTE_KIP_PORT;
        r_from_nb_tlast <= 1;
        // TREADY should follow rel_outbound
        r_to_rel_outbound_tready <= 1;
        r_to_rel_inbound_tready <= 0;
        #5
        r_from_nb_tvalid <= 0;
        r_to_rel_outbound_tready <= 0;
        r_to_rel_inbound_tready <= 1;
        #5
        // Respond to PUBREC packet with a PUBREL packet
        r_from_nb_tvalid <= 1;
        r_from_nb_tdata[PACKET_MSG_TYPE_WIDTH-1:0] <= RPM_MSG_TYPE_PUBREL;
        r_from_nb_tdata[KIP_IP_OFFSET+:KIP_IP_WIDTH] <= REMOTE_IP_ADDRESS;
        r_from_nb_tdata[KIP_TDEST_OFFSET+:KIP_TDEST_WIDTH] <= DUT_ID;
        r_from_nb_tdata[KIP_TID_OFFSET+:KIP_TID_WIDTH] <= REMOTE_KERNEL_ID;
        r_from_nb_tdata[RESP_PACKET_ID_OFFSET+:PACKET_ID_WIDTH] <= 'hCDEFCDEF;
        r_from_nb_tdata[AXIS_DATA_WIDTH-1:(RESP_PACKET_ID_OFFSET+PACKET_ID_WIDTH)] <= 0;
        r_from_nb_tid <= REMOTE_KERNEL_ID;
        r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= REMOTE_IP_ADDRESS;
        r_from_nb_tuser[KIP_TUSER_SRC_PORT_OFFSET+:KIP_TUSER_SRC_PORT_WIDTH] <= REMOTE_KIP_PORT;
        r_from_nb_tuser[KIP_TUSER_DEST_PORT_OFFSET+:KIP_TUSER_DEST_PORT_WIDTH] <= REMOTE_KIP_PORT;
        r_from_nb_tlast <= 1;
        // TREADY should follow rel_inbound
        r_to_rel_outbound_tready <= 1;
        r_to_rel_inbound_tready <= 0;
        #5
        r_from_nb_tvalid <= 0;
        r_to_rel_outbound_tready <= 0;
        r_to_rel_inbound_tready <= 1;
        #5
        // Respond to PUBREL packet with a PUBCOMP packet
        r_from_nb_tvalid <= 1;
        r_from_nb_tdata[PACKET_MSG_TYPE_WIDTH-1:0] <= RPM_MSG_TYPE_PUBCOMP;
        r_from_nb_tdata[KIP_IP_OFFSET+:KIP_IP_WIDTH] <= REMOTE_IP_ADDRESS;
        r_from_nb_tdata[KIP_TDEST_OFFSET+:KIP_TDEST_WIDTH] <= DUT_ID;
        r_from_nb_tdata[KIP_TID_OFFSET+:KIP_TID_WIDTH] <= REMOTE_KERNEL_ID;
        r_from_nb_tdata[RESP_PACKET_ID_OFFSET+:PACKET_ID_WIDTH] <= 'hAEFAAEFA;
        r_from_nb_tdata[AXIS_DATA_WIDTH-1:(RESP_PACKET_ID_OFFSET+PACKET_ID_WIDTH)] <= 0;
        r_from_nb_tid <= REMOTE_KERNEL_ID;
        r_from_nb_tuser[IP_ADDRESS_WIDTH-1:0] <= REMOTE_IP_ADDRESS;
        r_from_nb_tuser[KIP_TUSER_SRC_PORT_OFFSET+:KIP_TUSER_SRC_PORT_WIDTH] <= REMOTE_KIP_PORT;
        r_from_nb_tuser[KIP_TUSER_DEST_PORT_OFFSET+:KIP_TUSER_DEST_PORT_WIDTH] <= REMOTE_KIP_PORT;
        r_from_nb_tlast <= 1;
        // TREADY should follow rel_outbound
        r_to_rel_outbound_tready <= 1;
        r_to_rel_inbound_tready <= 0;
        #5
        r_from_nb_tvalid <= 0;
        r_to_rel_outbound_tready <= 0;
        r_to_rel_inbound_tready <= 1;
        #50
        $finish;
    end
endmodule