`timescale 1ns / 1ps

module tb #(
    `include "ctrl_api_header_parameters.vh"
)
    ();
    // Parameters
    localparam REQUEST_BUFFER_CAPACITY = 6;
    localparam AXI_LITE_WSTRB_ENABLED = 1;
    localparam DUT_ID = 'hF0;
    localparam DUT_CONTROL_PORT_NUMBER = 32769;

    `include "ctrl_api_message_parameters.vh"

    // Declarations
    logic r_clk;
    logic r_reset;
    // Used to send control messages
    logic r_remote_enable;
    logic [AXIS_LAN_TDEST_WIDTH-1:0] r_remote_tid;
    logic [AXIS_DATA_WIDTH-1:0] r_remote_data;
    logic [AXIS_FROM_NB_TUSER_WIDTH-1:0] r_remote_tuser;
    // Output AXI-Lite Write Interface
    // Write Address
    logic w_m_awvalid;
    logic r_m_awready;
    logic [AXI_LITE_ADDR_WIDTH-1:0] w_m_awaddr;
    // Write Data
    logic w_m_wvalid;
    logic r_m_wready;
    logic [AXI_LITE_DATA_WIDTH-1:0] w_m_wdata;
    logic [AXI_LITE_WSTRB_WIDTH-1:0] w_m_wstrb;
    // Write Response
    logic r_m_bvalid;
    logic w_m_bready;
    logic [AXI_LITE_BRESP_WIDTH-1:0] r_m_bresp;
    // AXI-Lite Read Interface
    // Read Address
    logic w_m_arvalid;
    logic r_m_arready;
    logic [AXI_LITE_ADDR_WIDTH-1:0] w_m_araddr;
    // Read Data
    logic r_m_rvalid;
    logic w_m_rready;
    logic [AXI_LITE_DATA_WIDTH-1:0] r_m_rdata;
    // to-LAN Interface
    logic w_to_LAN_tvalid;
    logic r_to_LAN_tready;
    logic [AXIS_DATA_WIDTH-1:0] w_to_LAN_tdata;
    logic [AXIS_KEEP_WIDTH-1:0] w_to_LAN_tkeep;
    logic [AXIS_LAN_TDEST_WIDTH-1:0] w_to_LAN_tid;
    logic [AXIS_LAN_TDEST_WIDTH-1:0] w_to_LAN_tdest;
    logic [AXIS_LAN_TUSER_WIDTH-1:0] w_to_LAN_tuser;
    logic w_to_LAN_tlast;
    // to-KIP Interface
    logic w_to_KIP_tvalid;
    logic r_to_KIP_tready;
    logic [AXIS_DATA_WIDTH-1:0] w_to_KIP_tdata;
    logic [AXIS_KEEP_WIDTH-1:0] w_to_KIP_tkeep;
    logic [AXIS_KIP_TUSER_WIDTH-1:0] w_to_KIP_tuser;
    logic w_to_KIP_tlast;
    // Network Bridge Interface
    logic r_from_nb_valid;
    logic w_from_nb_ready;
    logic [AXIS_DATA_WIDTH-1:0] r_from_nb_data;
    logic [AXIS_KEEP_WIDTH-1:0] r_from_nb_keep;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] r_from_nb_tid;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] r_from_nb_tdest;
    logic [AXIS_FROM_NB_TUSER_WIDTH-1:0] r_from_nb_tuser;
    logic r_from_nb_last;
    // AXI-Stream connection to request buffer
    logic w_to_request_buffer_tvalid;
    logic r_to_request_buffer_tready;
    logic [AXIS_DATA_WIDTH-1:0] w_to_request_buffer_tdata;
    logic [AXIS_KEEP_WIDTH-1:0] w_to_request_buffer_tkeep;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] w_to_request_buffer_tid;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] w_to_request_buffer_tdest;
    logic [AXIS_FROM_NB_TUSER_WIDTH-1:0] w_to_request_buffer_tuser;
    logic w_to_request_buffer_tlast;
    // AXI-Stream connection from request buffer
    logic r_from_request_buffer_tvalid;
    logic w_from_request_buffer_tready;
    logic [AXIS_DATA_WIDTH-1:0] r_from_request_buffer_tdata;
    logic [AXIS_KEEP_WIDTH-1:0] r_from_request_buffer_tkeep;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] r_from_request_buffer_tid;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] r_from_request_buffer_tdest;
    logic [AXIS_FROM_NB_TUSER_WIDTH-1:0] r_from_request_buffer_tuser;
    logic r_from_request_buffer_tlast;
    // Other Declarations
    logic [MSG_TYPE_WIDTH-1:0] w_to_LAN_message_type;
    logic [MSG_TYPE_WIDTH-1:0] w_to_WAN_message_type;

    // Assignments
    assign w_to_LAN_message_type = w_to_LAN_tdata[MSG_TYPE_WIDTH-1:0];

    // DUT
    network_to_axi_lite_converter #(
        .AXI_LITE_WSTRB_ENABLED(AXI_LITE_WSTRB_ENABLED),
        .REQUEST_BUFFER_CAPACITY(REQUEST_BUFFER_CAPACITY),
        .AXI_LITE_ADDR_WIDTH(AXI_LITE_ADDR_WIDTH)
    ) DUT (
        .i_clk(r_clk),
        .i_ap_rst_n(r_reset),
        .i_kernel_id(DUT_ID),
        .i_KIP_port_number(DUT_CONTROL_PORT_NUMBER),
        // Output AXI-Lite Write Address Interface
        .M_AXIL_awvalid(w_m_awvalid),
        .M_AXIL_awready(r_m_awready),
        .M_AXIL_awaddr(w_m_awaddr),
        // Output AXI-Lite Write Data Interface
        .M_AXIL_wvalid(w_m_wvalid),
        .M_AXIL_wready(r_m_wready),
        .M_AXIL_wdata(w_m_wdata),
        .M_AXIL_wstrb(w_m_wstrb),
        // Output AXI-Lite Write Response Interface
        .M_AXIL_bvalid(r_m_bvalid),
        .M_AXIL_bready(w_m_bready),
        .M_AXIL_bresp(r_m_bresp),
        // Output AXI-Lite Read Address Interface
        .M_AXIL_arvalid(w_m_arvalid),
        .M_AXIL_arready(r_m_arready),
        .M_AXIL_araddr(w_m_araddr),
        // Output AXI-Lite Read Data Interface
        .M_AXIL_rvalid(r_m_rvalid),
        .M_AXIL_rready(w_m_rready),
        .M_AXIL_rdata(r_m_rdata),
        // AXI-Stream to-LAN Interface
        .to_LAN_tvalid(w_to_LAN_tvalid),
        .to_LAN_tready(r_to_LAN_tready),
        .to_LAN_tdata(w_to_LAN_tdata),
        .to_LAN_tkeep(w_to_LAN_tkeep),
        .to_LAN_tid(w_to_LAN_tid),
        .to_LAN_tdest(w_to_LAN_tdest),
        .to_LAN_tuser(w_to_LAN_tuser),
        .to_LAN_tlast(w_to_LAN_tlast),
        // AXI-Stream to-KnownIP Interface
        .to_KIP_tvalid(w_to_KIP_tvalid),
        .to_KIP_tready(r_to_KIP_tready),
        .to_KIP_tdata(w_to_KIP_tdata),
        .to_KIP_tkeep(w_to_KIP_tkeep),
        .to_KIP_tuser(w_to_KIP_tuser),
        .to_KIP_tlast(w_to_KIP_tlast),
        // AXI-Stream from-Network-Bridge Interface
        .from_network_bridge_tvalid(r_from_nb_valid),
        .from_network_bridge_tready(w_from_nb_ready),
        .from_network_bridge_tdata(r_from_nb_data),
        .from_network_bridge_tkeep(r_from_nb_keep),
        .from_network_bridge_tid(r_from_nb_tid),
        .from_network_bridge_tdest(r_from_nb_tdest),
        .from_network_bridge_tuser(r_from_nb_tuser),
        .from_network_bridge_tlast(r_from_nb_last),
        // AXI-Stream connection to request buffer
        .to_request_buffer_tvalid(w_to_request_buffer_tvalid),
        .to_request_buffer_tready(r_to_request_buffer_tready),
        .to_request_buffer_tdata(w_to_request_buffer_tdata),
        .to_request_buffer_tkeep(w_to_request_buffer_tkeep),
        .to_request_buffer_tid(w_to_request_buffer_tid),
        .to_request_buffer_tdest(w_to_request_buffer_tdest),
        .to_request_buffer_tuser(w_to_request_buffer_tuser),
        .to_request_buffer_tlast(w_to_request_buffer_tlast),
        // AXI-Stream connection from request buffer
        .from_request_buffer_tvalid(r_from_request_buffer_tvalid),
        .from_request_buffer_tready(w_from_request_buffer_tready),
        .from_request_buffer_tdata(r_from_request_buffer_tdata),
        .from_request_buffer_tkeep(r_from_request_buffer_tkeep),
        .from_request_buffer_tid(r_from_request_buffer_tid),
        .from_request_buffer_tdest(r_from_request_buffer_tdest),
        .from_request_buffer_tuser(r_from_request_buffer_tuser),
        .from_request_buffer_tlast(r_from_request_buffer_tlast)
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
        r_m_awready = 1;
        r_m_wready = 1;
        r_m_arready = 1;
        r_to_LAN_tready = 1;
        r_to_KIP_tready = 1;
        // Other Signals
        r_from_nb_keep = 'hFFFFFFFFFFFFFFFF;
        r_from_nb_tdest = DUT_ID;
        r_from_nb_last = 1;
        // Fake a request buffer FIFO
        r_from_request_buffer_tdata[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_READ;
        r_from_request_buffer_tdata[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 'hCECECECE;
        r_from_request_buffer_tdata[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 'hABCDDCBAABABCDCD;
        r_from_request_buffer_tdata[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'hB;
        r_from_request_buffer_tdata[AXIS_LAN_TID_OFFSET+:AXIS_LAN_TID_WIDTH] <= 'hFE;
        r_from_request_buffer_tdata[AXIS_LAN_IP_OFFSET+:AXIS_LAN_IP_WIDTH] <= 'h0A030705;
        r_from_request_buffer_tdata[AXIS_DATA_WIDTH-1:(AXIS_LAN_IP_OFFSET+AXIS_LAN_IP_WIDTH)] <= 0;
        r_from_request_buffer_tkeep = 'hABCDABCDABCDABCD;
        r_from_request_buffer_tid = 'hAA;
        r_from_request_buffer_tdest = DUT_ID;
        r_from_request_buffer_tuser = 'hABCDABCD;
        r_from_request_buffer_tlast = 1;
    end

    // Test logic: Initial signals
    initial begin
        // Test Requests received from the network, buffer not full
        r_m_bvalid <= 1;
        r_m_bresp <= 3;
        r_m_rvalid <= 1;
        r_m_rdata <= 'hAABBCCDD;
        r_remote_enable <= 0;
        r_to_request_buffer_tready <= 1;
        r_from_request_buffer_tvalid <= 0;
        #100
        // // Test LAN read request from kernel EF for address 2BABABABABABAB
        // r_remote_data[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_READ;
        // r_remote_data[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 0;
        // r_remote_data[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 'h2BABABABABABAB;
        // r_remote_data[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'h0;
        // r_remote_data[AXIS_DATA_WIDTH-1:(AXIS_LAN_WSTRB_OFFSET+AXIS_LAN_WSTRB_WIDTH)] <= 0;
        // r_remote_tid <= 'hEF;
        // r_remote_tuser <= 0;
        // r_remote_enable <= 1;
        // #10  
        // r_remote_enable <= 0; 
        // r_from_request_buffer_tvalid <= 1;
        // #10
        // r_remote_enable <= 0;
        // #40
        // // Test LAN read request from kernel EF for address 2BABABABABABAB
        // r_remote_data[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_READ;
        // r_remote_data[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 0;
        // r_remote_data[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 'h2BABABABABABAB;
        // r_remote_data[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'h0;
        // r_remote_data[AXIS_DATA_WIDTH-1:(AXIS_LAN_WSTRB_OFFSET+AXIS_LAN_WSTRB_WIDTH)] <= 0;
        // r_remote_tid <= 'hEF;
        // r_remote_tuser <= 0;
        // r_remote_enable <= 1;
        // #10  
        // r_remote_enable <= 0; 
        // r_from_request_buffer_tvalid <= 1;
        // #10
        // r_remote_enable <= 0;
        // #40
        // // Test LAN write request from kernel FE for address 3ABABABABABABA, data CECECECE
        // r_remote_data[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_WRITE;
        // r_remote_data[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 'hCECECECE;
        // r_remote_data[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 'h3ABABABABABABA;
        // r_remote_data[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'hB;
        // r_remote_data[AXIS_DATA_WIDTH-1:(AXIS_LAN_WSTRB_OFFSET+AXIS_LAN_WSTRB_WIDTH)] <= 0;
        // r_remote_tid <= 'hFE;
        // r_remote_tuser <= 0;
        // r_remote_enable <= 1;
        // #10
        // r_remote_enable <= 0;
        // #40
        // // Test LAN write request from kernel FE for address 3ABABABABABABA, data CECECECE
        // r_remote_data[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_WRITE;
        // r_remote_data[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 'hCECECECE;
        // r_remote_data[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 'h3ABABABABABABA;
        // r_remote_data[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'hB;
        // r_remote_data[AXIS_DATA_WIDTH-1:(AXIS_LAN_WSTRB_OFFSET+AXIS_LAN_WSTRB_WIDTH)] <= 0;
        // r_remote_tid <= 'hFE;
        // r_remote_tuser <= 0;
        // r_remote_enable <= 1;
        // #10
        // r_remote_enable <= 0;
        // #40
        // // Test LAN read request from kernel EF for address 2BABABABABABAB
        // r_remote_data[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_READ;
        // r_remote_data[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 0;
        // r_remote_data[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 'h2BABABABABABAB;
        // r_remote_data[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'h0;
        // r_remote_data[AXIS_DATA_WIDTH-1:(AXIS_LAN_WSTRB_OFFSET+AXIS_LAN_WSTRB_WIDTH)] <= 0;
        // r_remote_tid <= 'hEF;
        // r_remote_tuser <= 0;
        // r_remote_enable <= 1;
        // #10  
        // r_remote_enable <= 0; 
        // r_from_request_buffer_tvalid <= 1;
        // #10
        // r_remote_enable <= 0;
        // #40
        // Test GW-forwarded LAN write request from kernel FE (IP 10.3.7.5) for address CDCDCDCDCDCDCDCD, data BEBEBEBE
        r_remote_data[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_WRITE;
        r_remote_data[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 'hBEBEBEBE;
        r_remote_data[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 'hCDCDCDCDCDCDCDCD;
        r_remote_data[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'hC;
        r_remote_data[AXIS_LAN_TID_OFFSET+:AXIS_LAN_TID_WIDTH] <= 'hFE;
        r_remote_data[AXIS_LAN_IP_OFFSET+:AXIS_LAN_IP_WIDTH] <= 'h0A030705;
        r_remote_data[AXIS_LAN_CTID_OFFSET+:AXIS_LAN_CTID_WIDTH] <= 'hABCEABCE;
        r_remote_data[AXIS_DATA_WIDTH-1:(AXIS_LAN_CTID_OFFSET+AXIS_LAN_CTID_WIDTH)] <= 0;
        r_remote_tid <= 0;
        r_remote_tuser <= 0;
        r_remote_enable <= 1;
        #10
        r_remote_enable <= 0;
        #40
        // // Test GW-forwarded LAN write request from kernel FE (IP 10.3.7.5) for address CDCDCDCDCDCDCDCD, data BEBEBEBE
        // r_remote_data[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_WRITE;
        // r_remote_data[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 'hBEBEBEBE;
        // r_remote_data[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 'hCDCDCDCDCDCDCDCD;
        // r_remote_data[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'hC;
        // r_remote_data[AXIS_LAN_TID_OFFSET+:AXIS_LAN_TID_WIDTH] <= 'hFE;
        // r_remote_data[AXIS_LAN_IP_OFFSET+:AXIS_LAN_IP_WIDTH] <= 'h0A030705;
        // r_remote_data[AXIS_DATA_WIDTH-1:(AXIS_LAN_IP_OFFSET+AXIS_LAN_IP_WIDTH)] <= 0;
        // r_remote_tid <= 0;
        // r_remote_tuser <= 0;
        // r_remote_enable <= 1;
        // #10
        // r_remote_enable <= 0;
        // #40
        // // Test LAN read request from kernel EF for address 2BABABABABABAB
        // r_remote_data[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_READ;
        // r_remote_data[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 0;
        // r_remote_data[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 'h2BABABABABABAB;
        // r_remote_data[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'h0;
        // r_remote_data[AXIS_DATA_WIDTH-1:(AXIS_LAN_WSTRB_OFFSET+AXIS_LAN_WSTRB_WIDTH)] <= 0;
        // r_remote_tid <= 'hEF;
        // r_remote_tuser <= 0;
        // r_remote_enable <= 1;
        // #10  
        // r_remote_enable <= 0; 
        // r_from_request_buffer_tvalid <= 1;
        // #10
        // r_remote_enable <= 0;
        // #40
        // Test GW-forwarded LAN Read request from kernel EE (IP 10.10.12.8) for address DFDFDFDFDFDFDFDF
        r_remote_data[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_READ;
        r_remote_data[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 0;
        r_remote_data[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 'hDFDFDFDFDFDFDFDF;
        r_remote_data[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'hD; // should be ignored
        r_remote_data[AXIS_LAN_TID_OFFSET+:AXIS_LAN_TID_WIDTH] <= 'hEE;
        r_remote_data[AXIS_LAN_IP_OFFSET+:AXIS_LAN_IP_WIDTH] <= 'h0A0A0C08;
        r_remote_data[AXIS_LAN_CTID_OFFSET+:AXIS_LAN_CTID_WIDTH] <= 'hBACEBACE;
        r_remote_data[AXIS_DATA_WIDTH-1:(AXIS_LAN_CTID_OFFSET+AXIS_LAN_CTID_WIDTH)] <= 0;
        r_remote_tid <= 0;
        r_remote_tuser <= 0;
        r_remote_enable <= 1;
        #10
        r_remote_enable <= 0;
        #200
        $finish;
        // // Test GW-forwarded LAN Read request from kernel EE (IP 10.10.12.8) for address DFDFDFDFDFDFDFDF
        // r_remote_data[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_READ;
        // r_remote_data[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 0;
        // r_remote_data[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 'hDFDFDFDFDFDFDFDF;
        // r_remote_data[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'hD; // should be ignored
        // r_remote_data[AXIS_LAN_TID_OFFSET+:AXIS_LAN_TID_WIDTH] <= 'hEE;
        // r_remote_data[AXIS_LAN_IP_OFFSET+:AXIS_LAN_IP_WIDTH] <= 'h0A0A0C08;
        // r_remote_data[AXIS_DATA_WIDTH-1:(AXIS_LAN_IP_OFFSET+AXIS_LAN_IP_WIDTH)] <= 0;
        // r_remote_tid <= 0;
        // r_remote_tuser <= 0;
        // r_remote_enable <= 1;
        // #10
        // r_remote_enable <= 0;
        // #40
        // // Test LAN read request from kernel EF for address 2BABABABABABAB
        // r_remote_data[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_READ;
        // r_remote_data[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 0;
        // r_remote_data[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 'h2BABABABABABAB;
        // r_remote_data[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'h0;
        // r_remote_data[AXIS_DATA_WIDTH-1:(AXIS_LAN_WSTRB_OFFSET+AXIS_LAN_WSTRB_WIDTH)] <= 0;
        // r_remote_tid <= 'hEF;
        // r_remote_tuser <= 0;
        // r_remote_enable <= 1;
        // #10  
        // r_remote_enable <= 0; 
        // r_from_request_buffer_tvalid <= 1;
        // #10
        // r_remote_enable <= 0;
        // #40
        // // Test LAN write request from kernel FE for address 3ABABABABABABA, data CECECECE
        // r_remote_data[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_WRITE;
        // r_remote_data[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 'hCECECECE;
        // r_remote_data[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 'h3ABABABABABABA;
        // r_remote_data[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'hB;
        // r_remote_data[AXIS_DATA_WIDTH-1:(AXIS_LAN_WSTRB_OFFSET+AXIS_LAN_WSTRB_WIDTH)] <= 0;
        // r_remote_tid <= 'hFE;
        // r_remote_tuser <= 0;
        // r_remote_enable <= 1;
        // #10
        // r_remote_enable <= 0;
        // #40
        // // Test GW-forwarded LAN write request from kernel FE (IP 10.3.7.5) for address CDCDCDCDCDCDCDCD, data BEBEBEBE
        // r_remote_data[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_WRITE;
        // r_remote_data[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 'hBEBEBEBE;
        // r_remote_data[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 'hCDCDCDCDCDCDCDCD;
        // r_remote_data[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'hC;
        // r_remote_data[AXIS_LAN_TID_OFFSET+:AXIS_LAN_TID_WIDTH] <= 'hFE;
        // r_remote_data[AXIS_LAN_IP_OFFSET+:AXIS_LAN_IP_WIDTH] <= 'h0A030705;
        // r_remote_data[AXIS_DATA_WIDTH-1:(AXIS_LAN_IP_OFFSET+AXIS_LAN_IP_WIDTH)] <= 0;
        // r_remote_tid <= 0;
        // r_remote_tuser <= 0;
        // r_remote_enable <= 1;
        // #10
        // r_remote_enable <= 0;
        // #40
        // // Test LAN write request from kernel FE for address 3ABABABABABABA, data CECECECE
        // r_remote_data[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_WRITE;
        // r_remote_data[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 'hCECECECE;
        // r_remote_data[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 'h3ABABABABABABA;
        // r_remote_data[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'hB;
        // r_remote_data[AXIS_DATA_WIDTH-1:(AXIS_LAN_WSTRB_OFFSET+AXIS_LAN_WSTRB_WIDTH)] <= 0;
        // r_remote_tid <= 'hFE;
        // r_remote_tuser <= 0;
        // r_remote_enable <= 1;
        // #10
        // r_remote_enable <= 0;
        // #40
        // // Test GW-forwarded LAN Read request from kernel EE (IP 10.10.12.8) for address DFDFDFDFDFDFDFDF
        // r_remote_data[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_READ;
        // r_remote_data[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 0;
        // r_remote_data[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 'hDFDFDFDFDFDFDFDF;
        // r_remote_data[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'hD; // should be ignored
        // r_remote_data[AXIS_LAN_TID_OFFSET+:AXIS_LAN_TID_WIDTH] <= 'hEE;
        // r_remote_data[AXIS_LAN_IP_OFFSET+:AXIS_LAN_IP_WIDTH] <= 'h0A0A0C08;
        // r_remote_data[AXIS_DATA_WIDTH-1:(AXIS_LAN_IP_OFFSET+AXIS_LAN_IP_WIDTH)] <= 0;
        // r_remote_tid <= 0;
        // r_remote_tuser <= 0;
        // r_remote_enable <= 1;
        // #10
        // r_remote_enable <= 0;
        // #40
        // // Test LAN write request from kernel FE for address 3ABABABABABABA, data CECECECE
        // r_remote_data[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_WRITE;
        // r_remote_data[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 'hCECECECE;
        // r_remote_data[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 'h3ABABABABABABA;
        // r_remote_data[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'hB;
        // r_remote_data[AXIS_DATA_WIDTH-1:(AXIS_LAN_WSTRB_OFFSET+AXIS_LAN_WSTRB_WIDTH)] <= 0;
        // r_remote_tid <= 'hFE;
        // r_remote_tuser <= 0;
        // r_remote_enable <= 1;
        // #10
        // r_remote_enable <= 0;
        // #40
        // // Test GW-forwarded LAN write request from kernel FE (IP 10.3.7.5) for address CDCDCDCDCDCDCDCD, data BEBEBEBE
        // r_remote_data[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_WRITE;
        // r_remote_data[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 'hBEBEBEBE;
        // r_remote_data[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 'hCDCDCDCDCDCDCDCD;
        // r_remote_data[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'hC;
        // r_remote_data[AXIS_LAN_TID_OFFSET+:AXIS_LAN_TID_WIDTH] <= 'hFE;
        // r_remote_data[AXIS_LAN_IP_OFFSET+:AXIS_LAN_IP_WIDTH] <= 'h0A030705;
        // r_remote_data[AXIS_DATA_WIDTH-1:(AXIS_LAN_IP_OFFSET+AXIS_LAN_IP_WIDTH)] <= 0;
        // r_remote_tid <= 0;
        // r_remote_tuser <= 0;
        // r_remote_enable <= 1;
        // #10
        // r_remote_enable <= 0;
        // #40
        // // Test GW-forwarded LAN Read request from kernel EE (IP 10.10.12.8) for address DFDFDFDFDFDFDFDF
        // r_remote_data[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_READ;
        // r_remote_data[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 0;
        // r_remote_data[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 'hDFDFDFDFDFDFDFDF;
        // r_remote_data[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'hD; // should be ignored
        // r_remote_data[AXIS_LAN_TID_OFFSET+:AXIS_LAN_TID_WIDTH] <= 'hEE;
        // r_remote_data[AXIS_LAN_IP_OFFSET+:AXIS_LAN_IP_WIDTH] <= 'h0A0A0C08;
        // r_remote_data[AXIS_DATA_WIDTH-1:(AXIS_LAN_IP_OFFSET+AXIS_LAN_IP_WIDTH)] <= 0;
        // r_remote_tid <= 0;
        // r_remote_tuser <= 0;
        // r_remote_enable <= 1;
        // #10
        // r_remote_enable <= 0;
        // #1000
        // $finish;

        // // Test messages arriving during an operation
        // r_remote_enable <= 0;
        // r_to_request_buffer_tready <= 1;
        // r_from_request_buffer_tvalid <= 1;
        // #100
        // // Test LAN read request from kernel EF for address 2BABABABABABAB
        // r_remote_data[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_READ;
        // r_remote_data[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 0;
        // r_remote_data[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 'hAAAABBBBCCCCDDDD;
        // r_remote_data[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'h0;
        // r_remote_data[AXIS_DATA_WIDTH-1:(AXIS_LAN_WSTRB_OFFSET+AXIS_LAN_WSTRB_WIDTH)] <= 0;
        // r_remote_tid <= 'hEF;
        // r_remote_tuser <= 0;
        // r_remote_enable <= 1;
        // #10  
        // // Send in 5 messages in quick succession
        // // Test LAN read request from kernel EF for address 2BABABABABABAB
        // r_remote_data[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_READ;
        // r_remote_data[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 0;
        // r_remote_data[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 'h2BABABABABABAB;
        // r_remote_data[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'h0;
        // r_remote_data[AXIS_DATA_WIDTH-1:(AXIS_LAN_WSTRB_OFFSET+AXIS_LAN_WSTRB_WIDTH)] <= 0;
        // r_remote_tid <= 'hEF;
        // r_remote_tuser <= 0;
        // r_remote_enable <= 1;
        // #10
        // // Test LAN write request from kernel FE for address 3ABABABABABABA, data CECECECE
        // r_remote_data[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_WRITE;
        // r_remote_data[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 'hCECECECE;
        // r_remote_data[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 'h3ABABABABABABA;
        // r_remote_data[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'hB;
        // r_remote_data[AXIS_DATA_WIDTH-1:(AXIS_LAN_WSTRB_OFFSET+AXIS_LAN_WSTRB_WIDTH)] <= 0;
        // r_remote_tid <= 'hFE;
        // r_remote_tuser <= 0;
        // r_remote_enable <= 1;
        // #10
        // // Test GW-forwarded LAN write request from kernel FE (IP 10.3.7.5) for address CDCDCDCDCDCDCDCD, data BEBEBEBE
        // r_remote_data[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_WRITE;
        // r_remote_data[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 'hBEBEBEBE;
        // r_remote_data[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 'hCDCDCDCDCDCDCDCD;
        // r_remote_data[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'hC;
        // r_remote_data[AXIS_LAN_TID_OFFSET+:AXIS_LAN_TID_WIDTH] <= 'hFE;
        // r_remote_data[AXIS_LAN_IP_OFFSET+:AXIS_LAN_IP_WIDTH] <= 'h0A030705;
        // r_remote_data[AXIS_DATA_WIDTH-1:(AXIS_LAN_IP_OFFSET+AXIS_LAN_IP_WIDTH)] <= 0;
        // r_remote_tid <= 0;
        // r_remote_tuser <= 0;
        // r_remote_enable <= 1;
        // #10
        // // Test GW-forwarded LAN Read request from kernel EE (IP 10.10.12.8) for address DFDFDFDFDFDFDFDF
        // r_remote_data[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_READ;
        // r_remote_data[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 0;
        // r_remote_data[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 'hDFDFDFDFDFDFDFDF;
        // r_remote_data[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'hD; // should be ignored
        // r_remote_data[AXIS_LAN_TID_OFFSET+:AXIS_LAN_TID_WIDTH] <= 'hEE;
        // r_remote_data[AXIS_LAN_IP_OFFSET+:AXIS_LAN_IP_WIDTH] <= 'h0A0A0C08;
        // r_remote_data[AXIS_DATA_WIDTH-1:(AXIS_LAN_IP_OFFSET+AXIS_LAN_IP_WIDTH)] <= 0;
        // r_remote_tid <= 0;
        // r_remote_tuser <= 0;
        // r_remote_enable <= 1;
        // #10
        // // Test GW-forwarded LAN Read request from kernel EE (IP 10.10.12.8) for address DFDFDFDFDFDFDFDF
        // r_remote_data[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_READ;
        // r_remote_data[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 0;
        // r_remote_data[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 'hDFDFDFDFDFDFDFDF;
        // r_remote_data[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'hD; // should be ignored
        // r_remote_data[AXIS_LAN_TID_OFFSET+:AXIS_LAN_TID_WIDTH] <= 'hEE;
        // r_remote_data[AXIS_LAN_IP_OFFSET+:AXIS_LAN_IP_WIDTH] <= 'h0A0A0C08;
        // r_remote_data[AXIS_DATA_WIDTH-1:(AXIS_LAN_IP_OFFSET+AXIS_LAN_IP_WIDTH)] <= 0;
        // r_remote_tid <= 0;
        // r_remote_tuser <= 0;
        // r_remote_enable <= 1;
        // // At some point the buffer will become full and busy messages will be sent
        // #1000
        // $finish;

        // // Test AWADDR/ARADDR or WDATA being delayed
        // r_m_arready <= 0;
        // r_m_awready <= 0;
        // r_m_wready <= 0;
        // r_m_bvalid <= 0;
        // r_m_bresp <= 3;
        // r_m_rvalid <= 0;
        // r_m_rdata <= 'hAABBCCDD;
        // r_remote_enable <= 0;
        // r_to_request_buffer_tready <= 1;
        // r_from_request_buffer_tvalid <= 1;
        // #100
        // // Test LAN write request from kernel FE for address 3ABABABABABABA, data CECECECE
        // r_remote_data[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_WRITE;
        // r_remote_data[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 'hCECECECE;
        // r_remote_data[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 'h3ABABABABABABA;
        // r_remote_data[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'hB;
        // r_remote_data[AXIS_DATA_WIDTH-1:(AXIS_LAN_WSTRB_OFFSET+AXIS_LAN_WSTRB_WIDTH)] <= 0;
        // r_remote_tid <= 'hFE;
        // r_remote_tuser <= 0;
        // r_remote_enable <= 1;
        // #50
        // r_m_awready <= 1;
        // // Queue up a bunch of other messages under it
        // // Test LAN read request from kernel EF for address 2BABABABABABAB
        // r_remote_data[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_READ;
        // r_remote_data[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 0;
        // r_remote_data[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 'h2BABABABABABAB;
        // r_remote_data[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'h0;
        // r_remote_data[AXIS_DATA_WIDTH-1:(AXIS_LAN_WSTRB_OFFSET+AXIS_LAN_WSTRB_WIDTH)] <= 0;
        // r_remote_tid <= 'hEF;
        // r_remote_tuser <= 0;
        // r_remote_enable <= 1;
        // #10
        // // Test LAN write request from kernel FE for address 3ABABABABABABA, data CECECECE
        // r_remote_data[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_WRITE;
        // r_remote_data[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 'hCECECECE;
        // r_remote_data[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 'h3ABABABABABABA;
        // r_remote_data[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'hB;
        // r_remote_data[AXIS_DATA_WIDTH-1:(AXIS_LAN_WSTRB_OFFSET+AXIS_LAN_WSTRB_WIDTH)] <= 0;
        // r_remote_tid <= 'hFE;
        // r_remote_tuser <= 0;
        // r_remote_enable <= 1;
        // #10
        // r_m_wready <= 1;
        // // Test GW-forwarded LAN write request from kernel FE (IP 10.3.7.5) for address CDCDCDCDCDCDCDCD, data BEBEBEBE
        // r_remote_data[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_WRITE;
        // r_remote_data[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 'hBEBEBEBE;
        // r_remote_data[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 'hCDCDCDCDCDCDCDCD;
        // r_remote_data[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'hC;
        // r_remote_data[AXIS_LAN_TID_OFFSET+:AXIS_LAN_TID_WIDTH] <= 'hFE;
        // r_remote_data[AXIS_LAN_IP_OFFSET+:AXIS_LAN_IP_WIDTH] <= 'h0A030705;
        // r_remote_data[AXIS_DATA_WIDTH-1:(AXIS_LAN_IP_OFFSET+AXIS_LAN_IP_WIDTH)] <= 0;
        // r_remote_tid <= 0;
        // r_remote_tuser <= 0;
        // r_remote_enable <= 1;
        // #10
        // // Test GW-forwarded LAN Read request from kernel EE (IP 10.10.12.8) for address DFDFDFDFDFDFDFDF
        // r_remote_data[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_READ;
        // r_remote_data[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 0;
        // r_remote_data[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 'hDFDFDFDFDFDFDFDF;
        // r_remote_data[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'hD; // should be ignored
        // r_remote_data[AXIS_LAN_TID_OFFSET+:AXIS_LAN_TID_WIDTH] <= 'hEE;
        // r_remote_data[AXIS_LAN_IP_OFFSET+:AXIS_LAN_IP_WIDTH] <= 'h0A0A0C08;
        // r_remote_data[AXIS_DATA_WIDTH-1:(AXIS_LAN_IP_OFFSET+AXIS_LAN_IP_WIDTH)] <= 0;
        // r_remote_tid <= 0;
        // r_remote_tuser <= 0;
        // r_remote_enable <= 1;
        // #10
        // // Test GW-forwarded LAN Read request from kernel EE (IP 10.10.12.8) for address DFDFDFDFDFDFDFDF
        // r_remote_data[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_READ;
        // r_remote_data[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 0;
        // r_remote_data[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] <= 'hDFDFDFDFDFDFDFDF;
        // r_remote_data[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'hD; // should be ignored
        // r_remote_data[AXIS_LAN_TID_OFFSET+:AXIS_LAN_TID_WIDTH] <= 'hEE;
        // r_remote_data[AXIS_LAN_IP_OFFSET+:AXIS_LAN_IP_WIDTH] <= 'h0A0A0C08;
        // r_remote_data[AXIS_DATA_WIDTH-1:(AXIS_LAN_IP_OFFSET+AXIS_LAN_IP_WIDTH)] <= 0;
        // r_remote_tid <= 0;
        // r_remote_tuser <= 0;
        // r_remote_enable <= 1;
        // #20
        // r_m_bvalid <= 1;
        // #150
        // r_m_arready <= 1;
        // #50
        // r_m_rvalid <= 1;
        // #1000
        // $finish;
    end

    // Test Logic: Simulate being Network Bridge
    always_ff @(posedge r_clk) begin
        if (r_reset == 0) begin
            r_from_nb_data[AXIS_DATA_WIDTH-1:0] <= 'h12345687;
            //r_from_nb_data[AXI_LITE_DATA_WIDTH-1:0] <= 'h12345687;
            //r_from_nb_data[AXI_LITE_DATA_WIDTH+:AXI_LITE_ADDR_WIDTH] <= 0;
            //r_from_nb_data[TDATA_TID_OFFSET+:AXIS_TID_WIDTH] <= DUT_ID;
            //r_from_nb_data[TDATA_IP_ADDRESS_OFFSET+:IP_ADDRESS_WIDTH] <= IP_ADDRESS;
            //r_from_nb_data[AXIS_DATA_WIDTH-1:TDATA_IP_ADDRESS_OFFSET+IP_ADDRESS_WIDTH] <= 0;
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

    // // Test Logic: Simulate being AXI-Lite Subordinate
    // always_ff @(posedge r_clk) begin
    //     if (r_reset == 0) begin
    //         r_m_bvalid <= 0;
    //         r_m_bresp <= 'b10;
    //         r_m_rvalid <= 0;
    //         r_m_rdata <= 'hABCDFEDC;
    //     end
    //     else begin
    //         // Case 0: Once signals are read turn them off
    //         if (r_m_bvalid == 1 && w_m_bready == 1) begin
    //             r_m_bvalid <= 0;
    //             r_m_rvalid <= r_m_rvalid;
    //         end
    //         else if (r_m_rvalid == 1 && w_m_rready == 1) begin
    //             r_m_rvalid <= 0;
    //             r_m_bvalid <= r_m_bvalid;
    //         end
    //         // Case 1: AXI-Lite Write performed
    //         if (w_m_awvalid == 1 || w_m_wvalid == 1) begin
    //             r_m_bvalid <= 1; 
    //             r_m_rvalid <= r_m_rvalid;
    //         end
    //         // Case 2: AXI-Lite Read performed
    //         else if (w_m_arvalid == 1) begin
    //             r_m_rvalid <= 1;
    //             r_m_bvalid <= r_m_bvalid;
    //         end
    //     end
    // end
endmodule