module tb #(
    `include "ctrl_api_header_parameters.vh"
)();
    
    // DUT Declarations
    localparam REG_ADDR_BRAM_WIDTH = 64;
    localparam TDEST_BRAM_WIDTH = 32;
    localparam MODE_FORWARD = 0;
    localparam MODE_OVERWRITE = 1;
    `include "ctrl_api_message_parameters.vh"

    // Declarations
    logic r_clk;
    logic r_reset;
    // AXI-Stream interface from Network Bridge
    logic r_from_WAN_tvalid;
    logic w_from_WAN_tready;
    logic [AXIS_DATA_WIDTH-1:0] w_from_WAN_tdata;
    logic [AXIS_KEEP_WIDTH-1:0] r_from_WAN_tkeep;
    logic [IP_PORT_WIDTH-1:0] w_from_WAN_tid;
    logic [IP_PORT_WIDTH-1:0] w_from_WAN_tdest;
    logic [IP_ADDRESS_WIDTH-1:0] w_from_WAN_tuser;
    logic [AXIS_WAN_MSG_TYPE_WIDTH-1:0] r_message_type;
    logic [AXIS_WAN_DATA_WIDTH-1:0] r_message_data;
    logic [AXIS_WAN_TDEST_WIDTH-1:0] r_ctdest;
    logic [IP_PORT_WIDTH-1:0] r_source_port;
    logic [IP_PORT_WIDTH-1:0] r_dest_port;
    logic [IP_ADDRESS_WIDTH-1:0] r_requestor_ip;
    logic [AXIS_LAN_TDEST_WIDTH-1:0] r_requestor_id;
    logic [AXIS_WAN_TDEST_WIDTH-1:0] r_requestor_ctid;
    logic r_from_WAN_tlast;
    // AXI-Stream interface to Network Bridge
    logic w_to_LAN_tvalid;
    logic r_to_LAN_tready;
    logic [AXIS_DATA_WIDTH-1:0] w_to_LAN_tdata;
    logic [AXIS_KEEP_WIDTH-1:0] w_to_LAN_tkeep;
    logic [AXIS_LAN_TDEST_WIDTH-1:0] w_to_LAN_tid;
    logic [AXIS_LAN_TDEST_WIDTH-1:0] w_to_LAN_tdest;
    logic [AXIS_LAN_TUSER_WIDTH-1:0] w_to_LAN_tuser;
    logic w_to_LAN_tlast;
    // BRAM interface to Register Address ROM
    logic w_to_register_address_ROM_CLK;
    logic w_to_register_address_ROM_RST;
    logic w_to_register_address_ROM_EN;
    logic [BRAM_ADDR_WIDTH-1:0] w_to_register_address_ROM_ADDR;
    logic [REG_ADDR_BRAM_WIDTH-1:0] r_to_register_address_ROM_DOUT;
    // BRAM interface to TDEST ROM. This stores data in the format:
    //  | TDEST | INFRA_OR_USER |
    //  |8     1|       0       |
    logic w_to_tdest_ROM_CLK;
    logic w_to_tdest_ROM_RST;
    logic w_to_tdest_ROM_EN;
    logic [BRAM_ADDR_WIDTH-1:0] w_to_tdest_ROM_ADDR;
    logic [TDEST_BRAM_WIDTH-1:0] r_to_tdest_ROM_DOUT;
    // Assignments
    assign w_from_WAN_tid = r_source_port;
    assign w_from_WAN_tdest = r_dest_port;
    assign w_from_WAN_tuser = r_requestor_ip;
    assign w_from_WAN_tdata[AXIS_WAN_MSG_TYPE_WIDTH-1:0] = r_message_type;
    assign w_from_WAN_tdata[AXIS_WAN_DATA_OFFSET+:AXIS_WAN_DATA_WIDTH] = r_message_data;
    assign w_from_WAN_tdata[AXIS_WAN_DEST_PORT_OFFSET+:AXIS_WAN_DEST_PORT_WIDTH] = r_dest_port;
    assign w_from_WAN_tdata[AXIS_WAN_CTDEST_OFFSET+:AXIS_WAN_CTDEST_WIDTH] = r_ctdest;
    assign w_from_WAN_tdata[AXIS_WAN_CREG_ADDR_OFFSET+:AXIS_WAN_CREG_ADDR_WIDTH] = 'hEFEF;
    assign w_from_WAN_tdata[AXIS_WAN_WSTRB_OFFSET+:AXIS_WAN_WSTRB_WIDTH] = 'hE;
    assign w_from_WAN_tdata[AXIS_WAN_TID_OFFSET+:AXIS_WAN_TID_WIDTH] = r_requestor_id;
    assign w_from_WAN_tdata[AXIS_WAN_IP_OFFSET+:AXIS_WAN_IP_WIDTH] = r_requestor_ip;
    assign w_from_WAN_tdata[AXIS_WAN_CTID_OFFSET+:AXIS_WAN_CTID_WIDTH] = r_requestor_ctid;
    assign w_from_WAN_tdata[AXIS_DATA_WIDTH-1:(AXIS_WAN_CTID_OFFSET+AXIS_WAN_CTID_WIDTH)] = 0;
    // DUT
    gw_ctrl_preprogrammed #(
    ) DUT (
        .i_clk(r_clk),
        .i_ap_rst_n(r_reset),
        // AXI-Stream interface from Network Bridge
        .from_WAN_tvalid(r_from_WAN_tvalid),
        .from_WAN_tready(w_from_WAN_tready),
        .from_WAN_tdata(w_from_WAN_tdata),
        .from_WAN_tkeep(r_from_WAN_tkeep),
        .from_WAN_tid(w_from_WAN_tid),
        .from_WAN_tdest(w_from_WAN_tdest),
        .from_WAN_tuser(w_from_WAN_tuser),
        .from_WAN_tlast(r_from_WAN_tlast),
        // AXI-Stream interface to Network Bridge
        .to_LAN_tvalid(w_to_LAN_tvalid),
        .to_LAN_tready(r_to_LAN_tready),
        .to_LAN_tdata(w_to_LAN_tdata),
        .to_LAN_tkeep(w_to_LAN_tkeep),
        .to_LAN_tid(w_to_LAN_tid),
        .to_LAN_tdest(w_to_LAN_tdest),
        .to_LAN_tuser(w_to_LAN_tuser),
        .to_LAN_tlast(w_to_LAN_tlast),
        // BRAM interface to Register Address ROM
        .to_register_address_ROM_CLK(w_to_register_address_ROM_CLK),
        .to_register_address_ROM_RST(w_to_register_address_ROM_RST),
        .to_register_address_ROM_EN(w_to_register_address_ROM_EN),
        .to_register_address_ROM_ADDR(w_to_register_address_ROM_ADDR),
        .to_register_address_ROM_DOUT(r_to_register_address_ROM_DOUT),
        // BRAM interface to TDEST ROM. This stores data in the format:
        //  | TDEST | INFRA_OR_USER |
        //  |8     1|       0       |
        .to_tdest_ROM_CLK(w_to_tdest_ROM_CLK),
        .to_tdest_ROM_RST(w_to_tdest_ROM_RST),
        .to_tdest_ROM_EN(w_to_tdest_ROM_EN),
        .to_tdest_ROM_ADDR(w_to_tdest_ROM_ADDR),
        .to_tdest_ROM_DOUT(r_to_tdest_ROM_DOUT)
    );

    // clock generator (100MHz)
	initial begin
		r_clk = 1;
		forever
		  #5 r_clk = ~r_clk;
	end 

    // Reset Logic (for 10 cycles)
    initial begin
        r_reset = 0;
        #100 r_reset = 1;
    end

    // Constant Assignments
    initial begin
        r_from_WAN_tkeep = 'hFFFFFFFFFFFFFFFF;
        r_from_WAN_tlast = 1;
        r_to_LAN_tready = 1;
        // BRAM Results
        r_to_register_address_ROM_DOUT = 'hEFEFABABCDCDFFFF;
        r_to_tdest_ROM_DOUT = 'hAA;
    end

    // Test logic
    initial begin
        r_from_WAN_tvalid <= 0;
        r_message_type <= 0;
        r_message_data <= 0;
        r_source_port <= 0;
        r_dest_port <= 0;
        r_ctdest <= 0;
        r_requestor_id <= 0;
        r_requestor_ip <= 0;
        r_requestor_ctid <= 0;
        #100
        // Test Forwarded AXI-Lite Write from cluster 3 kernel 5 (IP Address 10.1.16.1) writing to cluster 6 port 5
        r_from_WAN_tvalid <= 1;
        r_message_type <= MSG_WRITE;
        r_message_data <= 'hABABABAB;
        r_source_port <= 'hABAB;
        r_dest_port <= 'h5;
        r_ctdest <= 'h6;
        r_requestor_id <= 'h5;
        r_requestor_ip <= 'h0A011001;
        r_requestor_ctid <= 'hABCDABCD;
        #100
        // Test Forwarded AXI-Lite Read from cluster 8 kernel 17 writing to cluster 6 port 6
        r_from_WAN_tvalid <= 1;
        r_message_type <= MSG_READ;
        r_message_data <= 'h0;
        r_source_port <= 'hCECE;
        r_dest_port <= 'h6;
        r_ctdest <= 'h6;
        r_requestor_id <= 17;
        r_requestor_ip <= 'h0A011001;
        r_requestor_ctid <= 'hBCADBCAD;
        #100
        // Test Forwarded AXI-Lite Write from cluster 3 kernel 5 (IP Address 10.1.16.1) writing to cluster 6 port 5
        r_from_WAN_tvalid <= 1;
        r_message_type <= MSG_WRITE;
        r_message_data <= 'hABABABAB;
        r_source_port <= 'hABAB;
        r_dest_port <= 'h5;
        r_ctdest <= 'h6;
        r_requestor_id <= 'h5;
        r_requestor_ip <= 'h0A011001;
        r_requestor_ctid <= 'hABCDABCD;
        #1000
        $finish;

        // Test Reads and Writes
        // // Test Forwarded AXI-Lite Write from cluster 3 kernel 5 (IP Address 10.1.16.1) writing to cluster 6 port 0xFFE0
        // r_module_write_mode <= MODE_FORWARD;
        // r_from_WAN_tvalid <= 1;
        // r_from_WAN_tdata[AXIS_WAN_MSG_TYPE_WIDTH-1:0] <= MSG_WRITE;
        // r_from_WAN_tdata[AXIS_WAN_DATA_OFFSET+:AXIS_WAN_DATA_WIDTH] <= 'hABABABAB;
        // r_from_WAN_tdata[AXIS_WAN_DEST_PORT_OFFSET+:AXIS_WAN_DEST_PORT_WIDTH] <= 'hFFE0;
        // r_from_WAN_tdata[AXIS_WAN_CTDEST_OFFSET+:AXIS_WAN_CTDEST_WIDTH] <= 'h6;
        // r_from_WAN_tdata[AXIS_WAN_CREG_ADDR_OFFSET+:AXIS_WAN_CREG_ADDR_WIDTH] <= 'hEFEF;
        // r_from_WAN_tdata[AXIS_WAN_WSTRB_OFFSET+:AXIS_WAN_WSTRB_WIDTH] <= 'hB;
        // r_from_WAN_tdata[AXIS_WAN_TID_OFFSET+:AXIS_WAN_TID_WIDTH] <= 'h5;
        // r_from_WAN_tdata[AXIS_WAN_IP_OFFSET+:AXIS_WAN_IP_WIDTH] <= 'h0A011001;
        // #10
        // r_from_WAN_tvalid <= 0;
        // #10
        // // Test Forwarded AXI-Lite Read from cluster 8 kernel 17 writing to cluster 6 port 0xFFE0
        // r_module_write_mode <= MODE_FORWARD;
        // r_from_WAN_tvalid <= 1;
        // r_from_WAN_tdata[AXIS_WAN_MSG_TYPE_WIDTH-1:0] <= MSG_READ;
        // r_from_WAN_tdata[AXIS_WAN_DATA_OFFSET+:AXIS_WAN_DATA_WIDTH] <= 'h0;
        // r_from_WAN_tdata[AXIS_WAN_DEST_PORT_OFFSET+:AXIS_WAN_DEST_PORT_WIDTH] <= 'hFFE0;
        // r_from_WAN_tdata[AXIS_WAN_CTDEST_OFFSET+:AXIS_WAN_CTDEST_WIDTH] <= 'h6;
        // r_from_WAN_tdata[AXIS_WAN_CREG_ADDR_OFFSET+:AXIS_WAN_CREG_ADDR_WIDTH] <= 'hEFEF;
        // r_from_WAN_tdata[AXIS_WAN_WSTRB_OFFSET+:AXIS_WAN_WSTRB_WIDTH] <= 'hA;
        // r_from_WAN_tdata[AXIS_WAN_TID_OFFSET+:AXIS_WAN_TID_WIDTH] <= 17;
        // r_from_WAN_tdata[AXIS_WAN_IP_OFFSET+:AXIS_WAN_IP_WIDTH] <= 'h0A011001;
        // #10
        // r_from_WAN_tvalid <= 0;
        // #10
        // // Test Overwritten AXI-Lite Write from cluster 3 kernel 5 writing to cluster 6 port 0xFFE0
        // r_module_write_mode <= MODE_OVERWRITE;
        // r_from_WAN_tvalid <= 1;
        // r_from_WAN_tdata[AXIS_WAN_MSG_TYPE_WIDTH-1:0] <= MSG_WRITE;
        // r_from_WAN_tdata[AXIS_WAN_DATA_OFFSET+:AXIS_WAN_DATA_WIDTH] <= 'hABABABAB;
        // r_from_WAN_tdata[AXIS_WAN_DEST_PORT_OFFSET+:AXIS_WAN_DEST_PORT_WIDTH] <= 'hFFE0;
        // r_from_WAN_tdata[AXIS_WAN_CTDEST_OFFSET+:AXIS_WAN_CTDEST_WIDTH] <= 'h6;
        // r_from_WAN_tdata[AXIS_WAN_CREG_ADDR_OFFSET+:AXIS_WAN_CREG_ADDR_WIDTH] <= 'hEFEF;
        // r_from_WAN_tdata[AXIS_WAN_WSTRB_OFFSET+:AXIS_WAN_WSTRB_WIDTH] <= 'hD;
        // r_from_WAN_tdata[AXIS_WAN_TID_OFFSET+:AXIS_WAN_TID_WIDTH] <= 'h5;
        // r_from_WAN_tdata[AXIS_WAN_IP_OFFSET+:AXIS_WAN_IP_WIDTH] <= 'h0A011001;
        // #1000 
        // $finish;
    end
endmodule