`timescale 1ns / 1ps

module tb();
    // Parameters 
    parameter BUSY_RESPONSE_PAUSE_DURATION = 5; //cycles
    parameter AXI_LITE_BRESP_WIDTH = 2;
    parameter AXI_LITE_RRESP_WIDTH = 2;
    parameter AXI_LITE_WSTRB_ENABLED = 1;
    parameter AXI_LITE_ADDR_WIDTH = 64;
    parameter AXI_LITE_DATA_WIDTH = 32;
    parameter AXI_LITE_WSTRB_WIDTH = 4;
    parameter AXIS_DATA_WIDTH = 512;
    parameter AXIS_KEEP_WIDTH = 64;
    parameter AXIS_LAN_TDEST_WIDTH = 8;
    parameter AXIS_LAN_TUSER_WIDTH = 8;
    parameter AXIS_WAN_TDEST_WIDTH = 32;
    parameter AXIS_WAN_TUSER_WIDTH = 16;
    parameter AXIS_KIP_TUSER_WIDTH = 64;
    parameter AXIS_FROM_NB_TDEST_WIDTH = 8;
    parameter AXIS_FROM_NB_TUSER_WIDTH = 64;
    parameter IP_ADDRESS_WIDTH = 32;
    parameter IP_PORT_WIDTH = 16;
    parameter DUT_ID = 'hF0;
    parameter DUT_IP_ADDRESS = 'h0A010702;

    `include "ctrl_api_message_parameters.vh"

    // Declarations
    logic r_clk;
    logic r_reset;
    // Used to send control messages
    logic r_remote_enable;
    logic [AXIS_LAN_TDEST_WIDTH-1:0] r_remote_tid;
    logic [AXIS_DATA_WIDTH-1:0] r_remote_data;
    logic [AXIS_FROM_NB_TUSER_WIDTH-1:0] r_remote_tuser;
    
    // Input AXI-Lite Write Interface
    // Write Address
    logic r_s_awvalid;
    logic w_s_awready;
    logic [AXI_LITE_ADDR_WIDTH-1:0] r_s_awaddr;
    // Write Data
    logic r_s_wvalid;
    logic w_s_wready;
    logic [AXI_LITE_DATA_WIDTH-1:0] r_s_wdata;
    logic [AXI_LITE_WSTRB_WIDTH-1:0] r_s_wstrb;
    // Write Response
    logic w_s_bvalid;
    logic r_s_bready;
    logic [AXI_LITE_BRESP_WIDTH-1:0] w_s_bresp;
    // AXI-Lite Read Interface
    // Read Address
    logic r_s_arvalid;
    logic w_s_arready;
    logic [AXI_LITE_ADDR_WIDTH-1:0] r_s_araddr;
    // Read Data
    logic w_s_rvalid;
    logic r_s_rready;
    logic [AXI_LITE_DATA_WIDTH-1:0] w_s_rdata;
    // to-LAN Interface
    logic w_to_LAN_tvalid;
    logic r_to_LAN_tready;
    logic [AXIS_DATA_WIDTH-1:0] w_to_LAN_tdata;
    logic [AXIS_KEEP_WIDTH-1:0] w_to_LAN_tkeep;
    logic [AXIS_LAN_TDEST_WIDTH-1:0] w_to_LAN_tid;
    logic [AXIS_LAN_TDEST_WIDTH-1:0] w_to_LAN_tdest;
    logic [AXIS_LAN_TUSER_WIDTH-1:0] w_to_LAN_tuser;
    logic w_to_LAN_tlast;
    // to-WAN Interface
    logic w_to_WAN_tvalid;
    logic r_to_WAN_tready;
    logic [AXIS_DATA_WIDTH-1:0] w_to_WAN_tdata;
    logic [AXIS_KEEP_WIDTH-1:0] w_to_WAN_tkeep;
    logic [AXIS_WAN_TDEST_WIDTH-1:0] w_to_WAN_tdest;
    logic [AXIS_WAN_TUSER_WIDTH-1:0] w_to_WAN_tuser;
    logic w_to_WAN_tlast;
    // Network Bridge Interface
    logic r_from_nb_valid;
    logic w_from_nb_ready;
    logic [AXIS_DATA_WIDTH-1:0] r_from_nb_data;
    logic [AXIS_KEEP_WIDTH-1:0] r_from_nb_keep;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] r_from_nb_tid;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] r_from_nb_tdest;
    logic [AXIS_FROM_NB_TUSER_WIDTH-1:0] r_from_nb_tuser;
    logic r_from_nb_last;
    // Other Declarations
    logic [MSG_TYPE_WIDTH-1:0] w_to_LAN_message_type;
    logic [MSG_TYPE_WIDTH-1:0] w_to_WAN_message_type;

    // Assignments
    assign w_to_LAN_message_type = w_to_LAN_tdata[MSG_TYPE_WIDTH-1:0];
    assign w_to_WAN_message_type = w_to_WAN_tdata[MSG_TYPE_WIDTH-1:0];

    // DUT
    axi_lite_to_network_converter #(
        .AXI_LITE_WSTRB_ENABLED(AXI_LITE_WSTRB_ENABLED),
        .BUSY_RESPONSE_PAUSE_DURATION(BUSY_RESPONSE_PAUSE_DURATION),
        .AXI_LITE_ADDR_WIDTH(AXI_LITE_ADDR_WIDTH)
    ) DUT (
        .i_clk(r_clk),
        .i_ap_rst_n(r_reset),
        .i_kernel_id(DUT_ID),
        .i_kernel_ip_address(DUT_IP_ADDRESS),
        // Input AXI-Lite Write Address Interface
        .S_AXIL_awvalid(r_s_awvalid),
        .S_AXIL_awready(w_s_awready),
        .S_AXIL_awaddr(r_s_awaddr),
        // Input AXI-Lite Write Data Interface
        .S_AXIL_wvalid(r_s_wvalid),
        .S_AXIL_wready(w_s_wready),
        .S_AXIL_wdata(r_s_wdata),
        .S_AXIL_wstrb(r_s_wstrb),
        // Input AXI-Lite Write Response Interface
        .S_AXIL_bvalid(w_s_bvalid),
        .S_AXIL_bready(r_s_bready),
        .S_AXIL_bresp(w_s_bresp),
        // Input AXI-Lite Read Address Interface
        .S_AXIL_arvalid(r_s_arvalid),
        .S_AXIL_arready(w_s_arready),
        .S_AXIL_araddr(r_s_araddr),
        // Input AXI-Lite Read Data Interface
        .S_AXIL_rvalid(w_s_rvalid),
        .S_AXIL_rready(r_s_rready),
        .S_AXIL_rdata(w_s_rdata),
        // AXI-Stream to-LAN Interface
        .to_LAN_tvalid(w_to_LAN_tvalid),
        .to_LAN_tready(r_to_LAN_tready),
        .to_LAN_tdata(w_to_LAN_tdata),
        .to_LAN_tkeep(w_to_LAN_tkeep),
        .to_LAN_tid(w_to_LAN_tid),
        .to_LAN_tdest(w_to_LAN_tdest),
        .to_LAN_tuser(w_to_LAN_tuser),
        .to_LAN_tlast(w_to_LAN_tlast),
        // AXI-Stream to-WAN Interface
        .to_WAN_tvalid(w_to_WAN_tvalid),
        .to_WAN_tready(r_to_WAN_tready),
        .to_WAN_tdata(w_to_WAN_tdata),
        .to_WAN_tkeep(w_to_WAN_tkeep),
        .to_WAN_tdest(w_to_WAN_tdest),
        .to_WAN_tuser(w_to_WAN_tuser),
        .to_WAN_tlast(w_to_WAN_tlast),
        // AXI-Stream from-Network-Bridge Interface
        .from_network_bridge_tvalid(r_from_nb_valid),
        .from_network_bridge_tready(w_from_nb_ready),
        .from_network_bridge_tdata(r_from_nb_data),
        .from_network_bridge_tkeep(r_from_nb_keep),
        .from_network_bridge_tid(r_from_nb_tid),
        .from_network_bridge_tdest(r_from_nb_tdest),
        .from_network_bridge_tuser(r_from_nb_tuser),
        .from_network_bridge_tlast(r_from_nb_last)
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
        // All Ready Signals
        r_s_bready = 1;
        r_s_rready = 1;
        r_to_LAN_tready = 1;
        r_to_WAN_tready = 1;
        // Other Signals
        r_from_nb_keep = 'hFFFFFFFFFFFFFFFF;
        r_from_nb_tdest = DUT_ID;
        r_from_nb_last = 1;
    end

    // Test logic: Initial signals
    initial begin
        // // Test AXI-Lite Write and Read
        // r_remote_enable <= 0;
        // r_s_awvalid <= 0;
        // r_s_awaddr <= 0;
        // r_s_wvalid <= 0;
        // r_s_wdata <= 0;
        // r_s_arvalid <= 0;
        // r_s_araddr <= 0;
        // #100
        // // 64-bit LAN Read from address ABCDABCDABCDABCD of kernel EF
        // r_s_araddr[AXIL_IS_WAN_OFFSET] <= 0;
        // r_s_araddr[AXIL_LAN_TDEST_OFFSET+:AXIS_LAN_TDEST_WIDTH] <= 'hEF;
        // r_s_araddr[AXIL_LAN_BASE_REG_ADDR_OFFSET+:AXIL_LAN_FULL_REG_ADDR_WIDTH] <= 'hABCDABCDABCDABCD;
        // r_s_arvalid <= 1;
        // #100
        // r_s_arvalid <= 0;
        // #10
        // // 64-bit LAN Write ABCDEF12 to address DFDFDFDFDFDFDF of kernel AB
        // r_s_awaddr[AXIL_IS_WAN_OFFSET] <= 0;
        // r_s_awaddr[AXIL_LAN_TDEST_OFFSET+:AXIS_LAN_TDEST_WIDTH] <= 'hAB;
        // r_s_awaddr[AXIL_LAN_BASE_REG_ADDR_OFFSET+:AXIL_LAN_FULL_REG_ADDR_WIDTH] <= 'hDFDFDFDFDFDFDF;
        // r_s_wdata <= 'hABCDEF12;
        // r_s_wstrb = 'hA;
        // #120 
        // r_s_awvalid <= 1;
        // r_s_wvalid <= 1;
        // #10
        // r_s_awvalid <= 0;
        // r_s_wvalid <= 0;
        // #100
        // r_s_awvalid <= 1;
        // r_s_wvalid <= 1;
        // // 64-bit WAN Write 77776666 to cluster AFAFFCFC port 7E0E, Register Address BCBC
        // r_s_awaddr[AXIL_IS_WAN_OFFSET] <= 1;
        // r_s_awaddr[AXIL_WAN_BASE_PORT_OFFSET+:AXIL_WAN_BASE_PORT_WIDTH] <= 'h7E0E;
        // r_s_awaddr[AXIL_WAN_BASE_CTDEST_OFFSET+:AXIL_WAN_BASE_CTDEST_WIDTH] <= 'hFCFC;
        // r_s_awaddr[AXIL_WAN_EXTENDED_PORT_OFFSET] <= 0;
        // r_s_awaddr[AXIL_WAN_EXTENDED_CTDEST_OFFSET+:AXIL_WAN_EXTENDED_CTDEST_WIDTH] <= 'hAFAF;
        // r_s_awaddr[AXIL_CREG_ADDR_OFFSET+:AXIL_CREG_ADDR_WIDTH] <= 'hBCBC;
        // r_s_wdata <= 'h77776666;
        // r_s_wstrb = 'hB;
        // #10
        // r_s_awvalid <= 0;
        // r_s_wvalid <= 0;
        // #100
        // // 64-bit LAN Read from Address BCBCBCBCBCBCBC of kernel CD 
        // r_s_araddr[AXIL_IS_WAN_OFFSET] <= 0;
        // r_s_araddr[AXIL_LAN_TDEST_OFFSET+:AXIS_LAN_TDEST_WIDTH] <= 'hCD;
        // r_s_araddr[AXIL_LAN_BASE_REG_ADDR_OFFSET+:AXIL_LAN_FULL_REG_ADDR_WIDTH] <= 'hBCBCBCBCBCBCBC;
        // r_s_arvalid <= 1;
        // r_s_awvalid <= 1;
        // r_s_wvalid <= 1;
        // #10
        // r_s_arvalid <= 0;
        // r_s_awvalid <= 0;
        // r_s_wvalid <= 0;
        // #100
        // // 64-bit WAN Read from cluster FBFBFAFA port E0E0, Register Address ABAB
        // r_s_araddr[AXIL_IS_WAN_OFFSET] <= 1;
        // r_s_araddr[AXIL_WAN_BASE_PORT_OFFSET+:AXIL_WAN_BASE_PORT_WIDTH] <= 'h60E0;
        // r_s_araddr[AXIL_WAN_BASE_CTDEST_OFFSET+:AXIL_WAN_BASE_CTDEST_WIDTH] <= 'hFAFA;
        // r_s_araddr[AXIL_WAN_EXTENDED_PORT_OFFSET] <= 1;
        // r_s_araddr[AXIL_WAN_EXTENDED_CTDEST_OFFSET+:AXIL_WAN_EXTENDED_CTDEST_WIDTH] <= 'hFBFB;
        // r_s_araddr[AXIL_CREG_ADDR_OFFSET+:AXIL_CREG_ADDR_WIDTH] <= 'hABAB;   
        // r_s_arvalid <= 1;     
        // #10
        // r_s_arvalid <= 1;
        // #1000
        // $finish;

        // Test Different Orders of Operations
        // r_remote_enable <= 0;
        // r_s_awvalid <= 0;
        // r_s_wvalid <= 0;
        // r_s_arvalid <= 0;
        // r_s_araddr <= 0;
        // r_s_awaddr <= 0;
        // r_s_wdata <= 0;
        // r_s_wstrb <= 0;
        // #100
        // // 64-bit LAN Read from Address BCBCBCBCBCBCBC of kernel CD 
        // r_s_araddr[AXIL_IS_WAN_OFFSET] <= 0;
        // r_s_araddr[AXIL_LAN_TDEST_OFFSET+:AXIS_LAN_TDEST_WIDTH] <= 'hCD;
        // r_s_araddr[AXIL_LAN_BASE_REG_ADDR_OFFSET+:AXIL_LAN_FULL_REG_ADDR_WIDTH] <= 'hBCBCBCBCBCBCBC;
        // r_s_arvalid <= 1;
        // r_s_awvalid <= 1;
        // r_s_wvalid <= 1;
        // #10
        // r_s_arvalid <= 0;
        // r_s_awvalid <= 0;
        // r_s_wvalid <= 0;
        // #10
        // // 64-bit LAN Write ABCDEF12 to address DFDFDFDFDFDFDF of kernel AB
        // r_s_awaddr[AXIL_IS_WAN_OFFSET] <= 0;
        // r_s_awaddr[AXIL_LAN_TDEST_OFFSET+:AXIS_LAN_TDEST_WIDTH] <= 'hAB;
        // r_s_awaddr[AXIL_LAN_BASE_REG_ADDR_OFFSET+:AXIL_LAN_FULL_REG_ADDR_WIDTH] <= 'hDFDFDFDFDFDFDF;
        // r_s_wdata <= 'hABCDEF12;
        // r_s_wstrb <= 'hC; 
        // r_s_awvalid <= 1;
        // r_s_wvalid <= 1;
        // #100
        // r_s_awvalid <= 0;
        // r_s_wvalid <= 0;
        // #10
        // r_s_awvalid <= 1;
        // r_s_wvalid <= 1;
        // // 64-bit WAN Write 77776666 to cluster AFAFFCFC port 7E0E, Register Address BCBC
        // r_s_awaddr[AXIL_IS_WAN_OFFSET] <= 1;
        // r_s_awaddr[AXIL_WAN_BASE_PORT_OFFSET+:AXIL_WAN_BASE_PORT_WIDTH] <= 'h7E0E;
        // r_s_awaddr[AXIL_WAN_BASE_CTDEST_OFFSET+:AXIL_WAN_BASE_CTDEST_WIDTH] <= 'hFCFC;
        // r_s_awaddr[AXIL_WAN_EXTENDED_PORT_OFFSET] <= 0;
        // r_s_awaddr[AXIL_WAN_EXTENDED_CTDEST_OFFSET+:AXIL_WAN_EXTENDED_CTDEST_WIDTH] <= 'hAFAF;
        // r_s_awaddr[AXIL_CREG_ADDR_OFFSET+:AXIL_CREG_ADDR_WIDTH] <= 'hBCBC;
        // r_s_wdata <= 'h77776666;
        // #100
        // r_s_awvalid <= 0;
        // r_s_wvalid <= 0;
        // #10
        // // 64-bit WAN Read from cluster FBFBFAFA port E0E0, Register Address ABAB
        // r_s_araddr[AXIL_IS_WAN_OFFSET] <= 1;
        // r_s_araddr[AXIL_WAN_BASE_PORT_OFFSET+:AXIL_WAN_BASE_PORT_WIDTH] <= 'h60E0;
        // r_s_araddr[AXIL_WAN_BASE_CTDEST_OFFSET+:AXIL_WAN_BASE_CTDEST_WIDTH] <= 'hFAFA;
        // r_s_araddr[AXIL_WAN_EXTENDED_PORT_OFFSET] <= 1;
        // r_s_araddr[AXIL_WAN_EXTENDED_CTDEST_OFFSET+:AXIL_WAN_EXTENDED_CTDEST_WIDTH] <= 'hFBFB;
        // r_s_araddr[AXIL_CREG_ADDR_OFFSET+:AXIL_CREG_ADDR_WIDTH] <= 'hABAB;   
        // r_s_arvalid <= 1;     
        // #100
        // r_s_arvalid <= 1;
        // #1000
        // $finish;
        
        // // Test S_AXIL_awaddr and wdata in different cycles
        // r_remote_enable <= 0;
        // r_s_awvalid <= 0;
        // r_s_wvalid <= 0;
        // r_s_arvalid <= 0;
        // r_s_araddr <= 0;
        // // 64-bit LAN Write ABCDEF12 to address DFDFDFDFDFDFDF of kernel AB
        // r_s_awaddr[AXIL_IS_WAN_OFFSET] <= 0;
        // r_s_awaddr[AXIL_LAN_TDEST_OFFSET+:AXIS_LAN_TDEST_WIDTH] <= 'hAB;
        // r_s_awaddr[AXIL_LAN_BASE_REG_ADDR_OFFSET+:AXIL_LAN_FULL_REG_ADDR_WIDTH] <= 'hDFDFDFDFDFDFDF;
        // r_s_wdata <= 'hABCDEF12;
        // r_s_wstrb <= 'hD;
        // #120 
        // r_s_awvalid <= 0;
        // r_s_wvalid <= 1;
        // #10
        // r_s_awvalid <= 1;
        // r_s_wvalid <= 0;
        // #10
        // r_s_awvalid <= 0;
        // r_s_wvalid <= 0;
        // #50
        // // 64-bit WAN Write 77776666 to cluster AFAFFCFC port 7E0E, Register Address BCBC
        // r_s_awaddr[AXIL_IS_WAN_OFFSET] <= 1;
        // r_s_awaddr[AXIL_WAN_BASE_PORT_OFFSET+:AXIL_WAN_BASE_PORT_WIDTH] <= 'h7E0E;
        // r_s_awaddr[AXIL_WAN_BASE_CTDEST_OFFSET+:AXIL_WAN_BASE_CTDEST_WIDTH] <= 'hFCFC;
        // r_s_awaddr[AXIL_WAN_EXTENDED_PORT_OFFSET] <= 0;
        // r_s_awaddr[AXIL_WAN_EXTENDED_CTDEST_OFFSET+:AXIL_WAN_EXTENDED_CTDEST_WIDTH] <= 'hAFAF;
        // r_s_awaddr[AXIL_CREG_ADDR_OFFSET+:AXIL_CREG_ADDR_WIDTH] <= 'hBCBC;
        // r_s_wdata <= 'h77776666;
        // r_s_wstrb <= 'hE;
        // r_s_awvalid <= 1;
        // r_s_wvalid <= 0;
        // #10
        // r_s_awvalid <= 0;
        // r_s_wvalid <= 1;
        // #10
        // r_s_awvalid <= 0;
        // r_s_wvalid <= 0;
        // #1000
        // $finish;

        // TODO: Test AXIL_ADDR being 32 bits

        // TODO: Test AXIL_ADDR being 45 bits

        // // Test retransmission due to busy responses
        // r_remote_enable <= 0;
        // r_s_awvalid <= 0;
        // r_s_wvalid <= 0;
        // r_s_arvalid <= 0;
        // r_s_awaddr <= 0;
        // r_s_wdata <= 0;
        // r_s_araddr <= 0;
        // #100
        // // Insert a request into the buffer
        // // 64-bit WAN Write 77776666 to cluster AFAFFCFC port 7E0E, Register Address BCBC
        // r_s_awaddr[AXIL_IS_WAN_OFFSET] <= 1;
        // r_s_awaddr[AXIL_WAN_BASE_PORT_OFFSET+:AXIL_WAN_BASE_PORT_WIDTH] <= 'h7E0E;
        // r_s_awaddr[AXIL_WAN_BASE_CTDEST_OFFSET+:AXIL_WAN_BASE_CTDEST_WIDTH] <= 'hFCFC;
        // r_s_awaddr[AXIL_WAN_EXTENDED_PORT_OFFSET] <= 0;
        // r_s_awaddr[AXIL_WAN_EXTENDED_CTDEST_OFFSET+:AXIL_WAN_EXTENDED_CTDEST_WIDTH] <= 'hAFAF;
        // r_s_awaddr[AXIL_CREG_ADDR_OFFSET+:AXIL_CREG_ADDR_WIDTH] <= 'hBCBC;
        // r_s_wdata <= 'h77776666;
        // r_s_wstrb <= 'hE;
        // r_s_awvalid <= 1;
        // r_s_wvalid <= 1;
        // #10
        // r_s_awvalid <= 0;
        // r_s_wvalid <= 0;
        // // Send back a KIP MSG_BUSY response to WAN message
        // r_remote_data[AXIS_KIP_MSG_TYPE_WIDTH-1:0] <= MSG_BUSY;
        // r_remote_data[AXIS_KIP_DATA_OFFSET+:AXIS_KIP_DATA_WIDTH] <= 0;
        // r_remote_data[AXIS_KIP_TID_OFFSET+:AXIS_KIP_DATA_WIDTH] <= DUT_ID;
        // r_remote_data[AXIS_KIP_SENDER_TID_OFFSET+:AXIS_KIP_SENDER_TID_WIDTH] <= 'hEE;
        // r_remote_data[AXIS_DATA_WIDTH-1:(AXIS_KIP_SENDER_TID_OFFSET+AXIS_KIP_SENDER_TID_WIDTH)] <= 0;
        // r_remote_tid <= 'hEE;
        // r_remote_tuser <= 0;
        // r_remote_enable <= 1;
        // #200
        // r_remote_enable <= 0;
        // #50
        // // 64-bit LAN Read from Address BCBCBCBCBCBCBC of kernel CD 
        // r_s_araddr[AXIL_IS_WAN_OFFSET] <= 0;
        // r_s_araddr[AXIL_LAN_TDEST_OFFSET+:AXIS_LAN_TDEST_WIDTH] <= 'hCD;
        // r_s_araddr[AXIL_LAN_BASE_REG_ADDR_OFFSET+:AXIL_LAN_FULL_REG_ADDR_WIDTH] <= 'hBCBCBCBCBCBCBC;
        // r_s_arvalid <= 1;
        // #10
        // r_s_arvalid <= 0;
        // // Send back a LAN MSG_BUSY response to LAN message
        // r_remote_data[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_BUSY;
        // r_remote_data[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 0;
        // r_remote_data[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 0;
        // r_remote_data[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 0;
        // r_remote_data[AXIS_DATA_WIDTH-1:(AXIS_LAN_WSTRB_OFFSET+AXIS_LAN_WSTRB_WIDTH)] <= 0;
        // r_remote_tid <= 'hCD;
        // r_remote_tuser <= 0;
        // r_remote_enable <= 1;
        // #100
        // r_remote_enable <= 0;
        // #1000
        // $finish;

        // Test sending the wrong response to the request
        r_remote_enable <= 0;
        r_s_awvalid <= 0;
        r_s_wvalid <= 0;
        r_s_arvalid <= 0;
        r_s_araddr <= 0;
        // 64-bit LAN Write ABCDEF12 to address DFDFDFDFDFDFDF of kernel AB
        r_s_awaddr[AXIL_IS_WAN_OFFSET] <= 0;
        r_s_awaddr[AXIL_LAN_TDEST_OFFSET+:AXIS_LAN_TDEST_WIDTH] <= 'hAB;
        r_s_awaddr[AXIL_LAN_BASE_REG_ADDR_OFFSET+:AXIL_LAN_FULL_REG_ADDR_WIDTH] <= 'hDFDFDFDFDFDFDF;
        r_s_wdata <= 'hABCDEF12;
        r_s_wstrb <= 'hD;
        #120 
        r_s_awvalid <= 0;
        r_s_wvalid <= 1;
        #10
        r_s_awvalid <= 1;
        r_s_wvalid <= 0;
        #10
        r_s_awvalid <= 0;
        r_s_wvalid <= 0;
        // Send back RDATA
        r_remote_data[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_RDATA;
        r_remote_data[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 'hADADADAD;
        r_remote_data[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 0;
        r_remote_data[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'hE;
        r_remote_data[AXIS_DATA_WIDTH-1:(AXIS_LAN_WSTRB_OFFSET+AXIS_LAN_WSTRB_WIDTH)] <= 0;
        r_remote_tid <= 'hAB;
        r_remote_tuser <= 0;
        r_remote_enable <= 1;
        #100
        // Send back a LAN MSG_BUSY response to LAN message
        r_remote_data[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_BUSY;
        r_remote_data[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 0;
        r_remote_data[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 0;
        r_remote_data[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 0;
        r_remote_data[AXIS_DATA_WIDTH-1:(AXIS_LAN_WSTRB_OFFSET+AXIS_LAN_WSTRB_WIDTH)] <= 0;
        r_remote_tid <= 'hCD; // BUSY message response: doesn't care where it came from?
        r_remote_tuser <= 0;
        r_remote_enable <= 1;
        #100
        // Send BRESP back
        r_remote_data[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_BRESP;
        r_remote_data[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 'hADADADAD;
        r_remote_data[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 0;
        r_remote_data[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'hE;
        r_remote_data[AXIS_DATA_WIDTH-1:(AXIS_LAN_WSTRB_OFFSET+AXIS_LAN_WSTRB_WIDTH)] <= 0;
        r_remote_tid <= 'hAB;
        r_remote_tuser <= 0;
        r_remote_enable <= 1;
        #100
        r_remote_enable <= 0;        
        // 64-bit LAN Read from Address BCBCBCBCBCBCBC of kernel CD 
        r_s_araddr[AXIL_IS_WAN_OFFSET] <= 0;
        r_s_araddr[AXIL_LAN_TDEST_OFFSET+:AXIS_LAN_TDEST_WIDTH] <= 'hCD;
        r_s_araddr[AXIL_LAN_BASE_REG_ADDR_OFFSET+:AXIL_LAN_FULL_REG_ADDR_WIDTH] <= 'hBCBCBCBCBCBCBC;
        r_s_arvalid <= 1;
        #10
        r_s_arvalid <= 0;
        // Send BRESP back
        r_remote_data[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_BRESP;
        r_remote_data[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 'hADADADAD;
        r_remote_data[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 0;
        r_remote_data[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'hE;
        r_remote_data[AXIS_DATA_WIDTH-1:(AXIS_LAN_WSTRB_OFFSET+AXIS_LAN_WSTRB_WIDTH)] <= 0;
        r_remote_tid <= 'hCD;
        r_remote_tuser <= 0;
        r_remote_enable <= 1;
        #100
        // Send back a LAN MSG_BUSY response to LAN message
        r_remote_data[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_BUSY;
        r_remote_data[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 0;
        r_remote_data[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 0;
        r_remote_data[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 0;
        r_remote_data[AXIS_DATA_WIDTH-1:(AXIS_LAN_WSTRB_OFFSET+AXIS_LAN_WSTRB_WIDTH)] <= 0;
        r_remote_tid <= 'hCD; // BUSY message response: doesn't care where it came from?
        r_remote_tuser <= 0;
        r_remote_enable <= 1;
        #100
        // Send back RDATA
        r_remote_data[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_RDATA;
        r_remote_data[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 'hADADADAD;
        r_remote_data[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 0;
        r_remote_data[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'hE;
        r_remote_data[AXIS_DATA_WIDTH-1:(AXIS_LAN_WSTRB_OFFSET+AXIS_LAN_WSTRB_WIDTH)] <= 0;
        r_remote_tid <= 'hAB;
        r_remote_tuser <= 0;
        r_remote_enable <= 1;
        #100
        // 64-bit WAN Write 77776666 to cluster AFAFFCFC port 7E0E, Register Address BCBC
        r_s_awaddr[AXIL_IS_WAN_OFFSET] <= 1;
        r_s_awaddr[AXIL_WAN_BASE_PORT_OFFSET+:AXIL_WAN_BASE_PORT_WIDTH] <= 'h7E0E;
        r_s_awaddr[AXIL_WAN_BASE_CTDEST_OFFSET+:AXIL_WAN_BASE_CTDEST_WIDTH] <= 'hFCFC;
        r_s_awaddr[AXIL_WAN_EXTENDED_PORT_OFFSET] <= 0;
        r_s_awaddr[AXIL_WAN_EXTENDED_CTDEST_OFFSET+:AXIL_WAN_EXTENDED_CTDEST_WIDTH] <= 'hAFAF;
        r_s_awaddr[AXIL_CREG_ADDR_OFFSET+:AXIL_CREG_ADDR_WIDTH] <= 'hBCBC;
        r_s_wdata <= 'h77776666;
        r_s_awvalid <= 1;
        r_s_wvalid <= 1;
        #10
        r_s_awvalid <= 0;
        r_s_wvalid <= 0;
        // Send back RDATA
        r_remote_data[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_RDATA;
        r_remote_data[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 'hADADADAD;
        r_remote_data[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 0;
        r_remote_data[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'hE;
        r_remote_data[AXIS_DATA_WIDTH-1:(AXIS_LAN_WSTRB_OFFSET+AXIS_LAN_WSTRB_WIDTH)] <= 0;
        r_remote_tid <= 'hAB;
        r_remote_tuser <= 0;
        r_remote_enable <= 1;
        #100
        // Send back a LAN MSG_BUSY response to LAN message
        r_remote_data[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_BUSY;
        r_remote_data[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 0;
        r_remote_data[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 0;
        r_remote_data[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 0;
        r_remote_data[AXIS_DATA_WIDTH-1:(AXIS_LAN_WSTRB_OFFSET+AXIS_LAN_WSTRB_WIDTH)] <= 0;
        r_remote_tid <= 'hCD; // BUSY message response: doesn't care where it came from?
        r_remote_tuser <= 0;
        r_remote_enable <= 1;
        #100
        // Send BRESP back
        r_remote_data[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_BRESP;
        r_remote_data[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 'hADADADAD;
        r_remote_data[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 0;
        r_remote_data[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'hE;
        r_remote_data[AXIS_DATA_WIDTH-1:(AXIS_LAN_WSTRB_OFFSET+AXIS_LAN_WSTRB_WIDTH)] <= 0;
        r_remote_tid <= 'hCD;
        r_remote_tuser <= 0;
        r_remote_enable <= 1;
        #100
        // 64-bit WAN Read from cluster FBFBFAFA port E0E0, Register Address ABAB
        r_s_araddr[AXIL_IS_WAN_OFFSET] <= 1;
        r_s_araddr[AXIL_WAN_BASE_PORT_OFFSET+:AXIL_WAN_BASE_PORT_WIDTH] <= 'h60E0;
        r_s_araddr[AXIL_WAN_BASE_CTDEST_OFFSET+:AXIL_WAN_BASE_CTDEST_WIDTH] <= 'hFAFA;
        r_s_araddr[AXIL_WAN_EXTENDED_PORT_OFFSET] <= 1;
        r_s_araddr[AXIL_WAN_EXTENDED_CTDEST_OFFSET+:AXIL_WAN_EXTENDED_CTDEST_WIDTH] <= 'hFBFB;
        r_s_araddr[AXIL_CREG_ADDR_OFFSET+:AXIL_CREG_ADDR_WIDTH] <= 'hABAB;   
        r_s_arvalid <= 1;     
        #100
        // Send BRESP back
        r_remote_data[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_BRESP;
        r_remote_data[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 'hADADADAD;
        r_remote_data[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 0;
        r_remote_data[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'hE;
        r_remote_data[AXIS_DATA_WIDTH-1:(AXIS_LAN_WSTRB_OFFSET+AXIS_LAN_WSTRB_WIDTH)] <= 0;
        r_remote_tid <= 'hCD;
        r_remote_tuser <= 0;
        r_remote_enable <= 1;
        #100
        // Send back a LAN MSG_BUSY response to LAN message
        r_remote_data[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_BUSY;
        r_remote_data[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 0;
        r_remote_data[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 0;
        r_remote_data[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 0;
        r_remote_data[AXIS_DATA_WIDTH-1:(AXIS_LAN_WSTRB_OFFSET+AXIS_LAN_WSTRB_WIDTH)] <= 0;
        r_remote_tid <= 'hAB; // BUSY message response: doesn't care where it came from?
        r_remote_tuser <= 0;
        r_remote_enable <= 1;
        #100
        // Send back RDATA
        r_remote_data[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_RDATA;
        r_remote_data[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 'hADADADAD;
        r_remote_data[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 0;
        r_remote_data[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'hE;
        r_remote_data[AXIS_DATA_WIDTH-1:(AXIS_LAN_WSTRB_OFFSET+AXIS_LAN_WSTRB_WIDTH)] <= 0;
        r_remote_tid <= 'hAB;
        r_remote_tuser <= 0;
        r_remote_enable <= 1;
        #1000
        $finish;

    end

    // Test Logic: Simulate being Network Bridge
    always_ff @(posedge r_clk) begin
        if (r_reset == 0) begin
            r_from_nb_data[AXIS_DATA_WIDTH-1:0] <= 'h12345687;
            r_from_nb_tid = 'h11;
            r_from_nb_valid <= 0;
            r_from_nb_tuser <= 0;
        end
        // Case 1: Sending a remote message to Control
        else if (r_remote_enable == 1) begin
            r_from_nb_valid <= 1;
            r_from_nb_tid <= r_remote_tid;
            r_from_nb_data <= r_remote_data;
            r_from_nb_tuser <= r_remote_tuser;
        end
        // Case 2: Control is sending an AXI-Lite Write or Read over to-LAN interface
        else if (w_to_LAN_tvalid == 1'b1) begin
            r_from_nb_tid <= w_to_LAN_tdest;
            if (w_to_LAN_message_type == MSG_READ) begin
                r_from_nb_data[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_RDATA;
                r_from_nb_data[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 'h12345687;
                r_from_nb_data[AXIS_DATA_WIDTH-1:AXIS_LAN_ADDR_OFFSET] <= 0;
                r_from_nb_valid <= 1;
            end
            else if (w_to_LAN_message_type == MSG_WRITE) begin
                r_from_nb_data[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_BRESP;
                r_from_nb_data[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 'h12345687;
                r_from_nb_data[AXIS_DATA_WIDTH-1:AXIS_LAN_ADDR_OFFSET] <= 0;                
                r_from_nb_valid <= 1;
            end
            // For BRESP or RDATA results, do nothing
            else begin
                r_from_nb_data <= 0;
                r_from_nb_valid <= 0;
            end
            r_from_nb_tuser <= 0;
        end
        // Case 3: Control is sending an AXI-Lite Write or Read over to-WAN interface
        else if (w_to_WAN_tvalid == 1'b1) begin
            r_from_nb_tid <= 0; // remote kernel's ID
            if (w_to_WAN_message_type == MSG_READ) begin
                r_from_nb_data[AXIS_KIP_MSG_TYPE_WIDTH-1:0] <= MSG_RDATA;
                r_from_nb_data[AXIS_KIP_DATA_OFFSET+:AXIS_KIP_DATA_WIDTH] <= 'h12345687;
                r_from_nb_data[AXIS_KIP_TID_OFFSET+:AXIS_KIP_TID_WIDTH] <= w_to_WAN_tdata[AXIS_WAN_TID_OFFSET+:AXIS_WAN_TID_WIDTH];
                r_from_nb_data[AXIS_DATA_WIDTH-1:(AXIS_KIP_TID_OFFSET+AXIS_KIP_TID_WIDTH)] <= 0;
                r_from_nb_valid <= 1;
            end
            else if (w_to_WAN_message_type == MSG_WRITE) begin
                r_from_nb_data[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_BRESP;
                r_from_nb_data[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 'h12345687;
                r_from_nb_data[AXIS_KIP_TID_OFFSET+:AXIS_KIP_TID_WIDTH] <= w_to_WAN_tdata[AXIS_WAN_TID_OFFSET+:AXIS_WAN_TID_WIDTH];
                r_from_nb_data[AXIS_DATA_WIDTH-1:(AXIS_KIP_TID_OFFSET+AXIS_KIP_TID_WIDTH)] <= 0;
                r_from_nb_valid <= 1;
            end
            // For BRESP or RDATA results, do nothing
            else begin
                r_from_nb_data <= 0;
                r_from_nb_valid <= 0;
            end
            r_from_nb_tuser <= 0;
        end
        else if (r_from_nb_valid == 1'b1 && w_from_nb_ready == 1'b1) begin
            r_from_nb_data <= r_from_nb_data;
            r_from_nb_valid <= 0;
            r_from_nb_tuser <= r_from_nb_tuser;
        end
        else begin
            r_from_nb_data <= r_from_nb_data;
            r_from_nb_valid <= r_from_nb_valid;
            r_from_nb_tuser <= r_from_nb_tuser;
        end
    end
endmodule

