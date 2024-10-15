module tb #(
    `include "ctrl_api_header_parameters.vh"
) ();

    // Parameters
    localparam DUT_ID = 'hAB;
    `include "ctrl_api_message_parameters.vh"

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
    logic w_to_anc_tvalid;
    logic r_to_anc_tready;
    logic [AXIS_DATA_WIDTH-1:0] w_to_anc_tdata;
    logic [AXIS_KEEP_WIDTH-1:0] w_to_anc_tkeep;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] w_to_anc_tid;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] w_to_anc_tdest;
    logic [AXIS_FROM_NB_TUSER_WIDTH-1:0] w_to_anc_tuser;
    logic w_to_anc_tlast;
    // AXIS interface to Network to AXI-Lite Converter
    logic w_to_nac_tvalid;
    logic r_to_nac_tready;
    logic [AXIS_DATA_WIDTH-1:0] w_to_nac_tdata;
    logic [AXIS_KEEP_WIDTH-1:0] w_to_nac_tkeep;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] w_to_nac_tid;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] w_to_nac_tdest;
    logic [AXIS_FROM_NB_TUSER_WIDTH-1:0] w_to_nac_tuser;
    logic w_to_nac_tlast;

    control_from_network_bridge_splitter DUT (
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
        .to_anc_tvalid(w_to_anc_tvalid),
        .to_anc_tready(r_to_anc_tready),
        .to_anc_tdata(w_to_anc_tdata),
        .to_anc_tkeep(w_to_anc_tkeep),
        .to_anc_tid(w_to_anc_tid),
        .to_anc_tdest(w_to_anc_tdest),
        .to_anc_tuser(w_to_anc_tuser),
        .to_anc_tlast(w_to_anc_tlast),
        // AXIS interface to Network to AXI-Lite Converter
        .to_nac_tvalid(w_to_nac_tvalid),
        .to_nac_tready(r_to_nac_tready),
        .to_nac_tdata(w_to_nac_tdata),
        .to_nac_tkeep(w_to_nac_tkeep),
        .to_nac_tid(w_to_nac_tid),
        .to_nac_tdest(w_to_nac_tdest),
        .to_nac_tuser(w_to_nac_tuser),
        .to_nac_tlast(w_to_nac_tlast)
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
        // Send back a KIP MSG_BUSY response to WAN message
        r_from_nb_tvalid <= 1;
        r_from_nb_tdata[AXIS_KIP_MSG_TYPE_WIDTH-1:0] <= MSG_BUSY;
        r_from_nb_tdata[AXIS_KIP_DATA_OFFSET+:AXIS_KIP_DATA_WIDTH] <= 0;
        r_from_nb_tdata[AXIS_KIP_TID_OFFSET+:AXIS_KIP_DATA_WIDTH] <= DUT_ID;
        r_from_nb_tdata[AXIS_KIP_SENDER_TID_OFFSET+:AXIS_KIP_SENDER_TID_WIDTH] <= 'hEE;
        r_from_nb_tdata[AXIS_DATA_WIDTH-1:(AXIS_KIP_SENDER_TID_OFFSET+AXIS_KIP_SENDER_TID_WIDTH)] <= 0;
        r_from_nb_tkeep <= 'hA;
        r_from_nb_tid <= 'hEE;
        r_from_nb_tuser <= 'hAAAABBBB;
        r_from_nb_tlast <= 0;
        // Should follow to_anc_tready
        r_to_anc_tready <= 1;
        r_to_nac_tready <= 0;
        #5
        r_from_nb_tvalid <= 0;
        r_to_anc_tready <= 0;
        r_to_nac_tready <= 1;
        #5
        // Test LAN write request from kernel FE for address 3ABABABABABABA, data CECECECE
        r_from_nb_tvalid <= 1;
        r_from_nb_tdata[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_WRITE;
        r_from_nb_tdata[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 'hCECECECE;
        r_from_nb_tdata[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 'h3ABABABABABABA;
        r_from_nb_tdata[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'hB;
        r_from_nb_tdata[AXIS_DATA_WIDTH-1:(AXIS_LAN_WSTRB_OFFSET+AXIS_LAN_WSTRB_WIDTH)] <= 0;
        r_from_nb_tkeep <= 'hB;
        r_from_nb_tid <= 'hFE;
        r_from_nb_tuser <= 0;
        r_from_nb_tlast <= 1;
        // Should follow to_nac_tready
        r_to_anc_tready <= 1;
        r_to_nac_tready <= 0;
        #5
        r_from_nb_tvalid <= 0;
        r_to_anc_tready <= 0;
        r_to_nac_tready <= 1;
        #5
        // Send BRESP back
        r_from_nb_tvalid <= 1;
        r_from_nb_tdata[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_BRESP;
        r_from_nb_tdata[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 'hADADADAD;
        r_from_nb_tdata[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 0;
        r_from_nb_tdata[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'hE;
        r_from_nb_tdata[AXIS_DATA_WIDTH-1:(AXIS_LAN_WSTRB_OFFSET+AXIS_LAN_WSTRB_WIDTH)] <= 0;
        r_from_nb_tkeep <= 'hC;
        r_from_nb_tid <= 'hCD;
        r_from_nb_tuser <= 'hBBBBCCCC;
        r_from_nb_tlast <= 1;
        // Should follow to_anc_tready
        r_to_anc_tready <= 1;
        r_to_nac_tready <= 0;
        #5
        r_from_nb_tvalid <= 0;
        r_to_anc_tready <= 0;
        r_to_nac_tready <= 1;
        #5
        // Test LAN read request from kernel EF for address 2BABABABABABAB
        r_from_nb_tvalid <= 1;
        r_from_nb_tdata[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_READ;
        r_from_nb_tdata[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 0;
        r_from_nb_tdata[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 'h2BABABABABABAB;
        r_from_nb_tdata[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'h0;
        r_from_nb_tdata[AXIS_DATA_WIDTH-1:(AXIS_LAN_WSTRB_OFFSET+AXIS_LAN_WSTRB_WIDTH)] <= 0;
        r_from_nb_tkeep <= 'hD;
        r_from_nb_tid <= 'hEF;
        r_from_nb_tuser <= 0;
        r_from_nb_tlast <= 1;
        // Should follow to_nac_tready
        r_to_anc_tready <= 1;
        r_to_nac_tready <= 0;
        #5
        r_from_nb_tvalid <= 0;
        r_to_anc_tready <= 0;
        r_to_nac_tready <= 1;
        #5
        // Send back RDATA
        r_from_nb_tvalid <= 1;
        r_from_nb_tdata[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_RDATA;
        r_from_nb_tdata[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 'hADADADAD;
        r_from_nb_tdata[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 0;
        r_from_nb_tdata[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'hE;
        r_from_nb_tdata[AXIS_DATA_WIDTH-1:(AXIS_LAN_WSTRB_OFFSET+AXIS_LAN_WSTRB_WIDTH)] <= 0;
        r_from_nb_tkeep <= 'hE;
        r_from_nb_tid <= 'hAB;
        r_from_nb_tuser <= 0;
        r_from_nb_tlast <= 0;
        // Should follow to_anc_tready
        r_to_anc_tready <= 1;
        r_to_nac_tready <= 0;
        #5
        r_from_nb_tvalid <= 0;
        r_to_anc_tready <= 0;
        r_to_nac_tready <= 1;
        #50
        $finish;
    end
endmodule