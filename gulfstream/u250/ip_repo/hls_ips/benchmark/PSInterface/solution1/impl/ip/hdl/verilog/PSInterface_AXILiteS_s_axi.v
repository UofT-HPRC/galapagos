// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1ns/1ps
module PSInterface_AXILiteS_s_axi
#(parameter
    C_S_AXI_ADDR_WIDTH = 8,
    C_S_AXI_DATA_WIDTH = 32
)(
    input  wire                          ACLK,
    input  wire                          ARESET,
    input  wire                          ACLK_EN,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] AWADDR,
    input  wire                          AWVALID,
    output wire                          AWREADY,
    input  wire [C_S_AXI_DATA_WIDTH-1:0] WDATA,
    input  wire [C_S_AXI_DATA_WIDTH/8-1:0] WSTRB,
    input  wire                          WVALID,
    output wire                          WREADY,
    output wire [1:0]                    BRESP,
    output wire                          BVALID,
    input  wire                          BREADY,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] ARADDR,
    input  wire                          ARVALID,
    output wire                          ARREADY,
    output wire [C_S_AXI_DATA_WIDTH-1:0] RDATA,
    output wire [1:0]                    RRESP,
    output wire                          RVALID,
    input  wire                          RREADY,
    output wire [31:0]                   axil_start_V,
    output wire [31:0]                   axil_pkt_num_V,
    output wire [31:0]                   axil_pkt_len_V,
    output wire [31:0]                   axil_remote_ip_V,
    output wire [31:0]                   axil_remote_port_V,
    output wire [31:0]                   axil_local_port_V,
    input  wire [31:0]                   axil_tx_timeElapse_high_V,
    input  wire                          axil_tx_timeElapse_high_V_ap_vld,
    input  wire [31:0]                   axil_tx_timeElapse_low_V,
    input  wire                          axil_tx_timeElapse_low_V_ap_vld,
    input  wire [31:0]                   axil_tx_done_V,
    input  wire                          axil_tx_done_V_ap_vld,
    input  wire [31:0]                   axil_latency_sum_high_V,
    input  wire                          axil_latency_sum_high_V_ap_vld,
    input  wire [31:0]                   axil_latency_sum_low_V,
    input  wire                          axil_latency_sum_low_V_ap_vld,
    input  wire [31:0]                   axil_rx_timeElaspe_high_V,
    input  wire                          axil_rx_timeElaspe_high_V_ap_vld,
    input  wire [31:0]                   axil_rx_timeElaspe_low_V,
    input  wire                          axil_rx_timeElaspe_low_V_ap_vld,
    input  wire [31:0]                   axil_rx_done_V,
    input  wire                          axil_rx_done_V_ap_vld,
    input  wire [31:0]                   axil_rx_error_V,
    input  wire                          axil_rx_error_V_ap_vld,
    input  wire [31:0]                   axil_rx_curr_cnt_V,
    input  wire                          axil_rx_curr_cnt_V_ap_vld
);
//------------------------Address Info-------------------
// 0x00 : reserved
// 0x04 : reserved
// 0x08 : reserved
// 0x0c : reserved
// 0x10 : Data signal of axil_start_V
//        bit 31~0 - axil_start_V[31:0] (Read/Write)
// 0x14 : reserved
// 0x18 : Data signal of axil_pkt_num_V
//        bit 31~0 - axil_pkt_num_V[31:0] (Read/Write)
// 0x1c : reserved
// 0x20 : Data signal of axil_pkt_len_V
//        bit 31~0 - axil_pkt_len_V[31:0] (Read/Write)
// 0x24 : reserved
// 0x28 : Data signal of axil_remote_ip_V
//        bit 31~0 - axil_remote_ip_V[31:0] (Read/Write)
// 0x2c : reserved
// 0x30 : Data signal of axil_remote_port_V
//        bit 31~0 - axil_remote_port_V[31:0] (Read/Write)
// 0x34 : reserved
// 0x38 : Data signal of axil_local_port_V
//        bit 31~0 - axil_local_port_V[31:0] (Read/Write)
// 0x3c : reserved
// 0x40 : Data signal of axil_tx_timeElapse_high_V
//        bit 31~0 - axil_tx_timeElapse_high_V[31:0] (Read)
// 0x44 : Control signal of axil_tx_timeElapse_high_V
//        bit 0  - axil_tx_timeElapse_high_V_ap_vld (Read/COR)
//        others - reserved
// 0x48 : Data signal of axil_tx_timeElapse_low_V
//        bit 31~0 - axil_tx_timeElapse_low_V[31:0] (Read)
// 0x4c : Control signal of axil_tx_timeElapse_low_V
//        bit 0  - axil_tx_timeElapse_low_V_ap_vld (Read/COR)
//        others - reserved
// 0x50 : Data signal of axil_tx_done_V
//        bit 31~0 - axil_tx_done_V[31:0] (Read)
// 0x54 : Control signal of axil_tx_done_V
//        bit 0  - axil_tx_done_V_ap_vld (Read/COR)
//        others - reserved
// 0x58 : Data signal of axil_latency_sum_high_V
//        bit 31~0 - axil_latency_sum_high_V[31:0] (Read)
// 0x5c : Control signal of axil_latency_sum_high_V
//        bit 0  - axil_latency_sum_high_V_ap_vld (Read/COR)
//        others - reserved
// 0x60 : Data signal of axil_latency_sum_low_V
//        bit 31~0 - axil_latency_sum_low_V[31:0] (Read)
// 0x64 : Control signal of axil_latency_sum_low_V
//        bit 0  - axil_latency_sum_low_V_ap_vld (Read/COR)
//        others - reserved
// 0x68 : Data signal of axil_rx_timeElaspe_high_V
//        bit 31~0 - axil_rx_timeElaspe_high_V[31:0] (Read)
// 0x6c : Control signal of axil_rx_timeElaspe_high_V
//        bit 0  - axil_rx_timeElaspe_high_V_ap_vld (Read/COR)
//        others - reserved
// 0x70 : Data signal of axil_rx_timeElaspe_low_V
//        bit 31~0 - axil_rx_timeElaspe_low_V[31:0] (Read)
// 0x74 : Control signal of axil_rx_timeElaspe_low_V
//        bit 0  - axil_rx_timeElaspe_low_V_ap_vld (Read/COR)
//        others - reserved
// 0x78 : Data signal of axil_rx_done_V
//        bit 31~0 - axil_rx_done_V[31:0] (Read)
// 0x7c : Control signal of axil_rx_done_V
//        bit 0  - axil_rx_done_V_ap_vld (Read/COR)
//        others - reserved
// 0x80 : Data signal of axil_rx_error_V
//        bit 31~0 - axil_rx_error_V[31:0] (Read)
// 0x84 : Control signal of axil_rx_error_V
//        bit 0  - axil_rx_error_V_ap_vld (Read/COR)
//        others - reserved
// 0x88 : Data signal of axil_rx_curr_cnt_V
//        bit 31~0 - axil_rx_curr_cnt_V[31:0] (Read)
// 0x8c : Control signal of axil_rx_curr_cnt_V
//        bit 0  - axil_rx_curr_cnt_V_ap_vld (Read/COR)
//        others - reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

//------------------------Parameter----------------------
localparam
    ADDR_AXIL_START_V_DATA_0              = 8'h10,
    ADDR_AXIL_START_V_CTRL                = 8'h14,
    ADDR_AXIL_PKT_NUM_V_DATA_0            = 8'h18,
    ADDR_AXIL_PKT_NUM_V_CTRL              = 8'h1c,
    ADDR_AXIL_PKT_LEN_V_DATA_0            = 8'h20,
    ADDR_AXIL_PKT_LEN_V_CTRL              = 8'h24,
    ADDR_AXIL_REMOTE_IP_V_DATA_0          = 8'h28,
    ADDR_AXIL_REMOTE_IP_V_CTRL            = 8'h2c,
    ADDR_AXIL_REMOTE_PORT_V_DATA_0        = 8'h30,
    ADDR_AXIL_REMOTE_PORT_V_CTRL          = 8'h34,
    ADDR_AXIL_LOCAL_PORT_V_DATA_0         = 8'h38,
    ADDR_AXIL_LOCAL_PORT_V_CTRL           = 8'h3c,
    ADDR_AXIL_TX_TIMEELAPSE_HIGH_V_DATA_0 = 8'h40,
    ADDR_AXIL_TX_TIMEELAPSE_HIGH_V_CTRL   = 8'h44,
    ADDR_AXIL_TX_TIMEELAPSE_LOW_V_DATA_0  = 8'h48,
    ADDR_AXIL_TX_TIMEELAPSE_LOW_V_CTRL    = 8'h4c,
    ADDR_AXIL_TX_DONE_V_DATA_0            = 8'h50,
    ADDR_AXIL_TX_DONE_V_CTRL              = 8'h54,
    ADDR_AXIL_LATENCY_SUM_HIGH_V_DATA_0   = 8'h58,
    ADDR_AXIL_LATENCY_SUM_HIGH_V_CTRL     = 8'h5c,
    ADDR_AXIL_LATENCY_SUM_LOW_V_DATA_0    = 8'h60,
    ADDR_AXIL_LATENCY_SUM_LOW_V_CTRL      = 8'h64,
    ADDR_AXIL_RX_TIMEELASPE_HIGH_V_DATA_0 = 8'h68,
    ADDR_AXIL_RX_TIMEELASPE_HIGH_V_CTRL   = 8'h6c,
    ADDR_AXIL_RX_TIMEELASPE_LOW_V_DATA_0  = 8'h70,
    ADDR_AXIL_RX_TIMEELASPE_LOW_V_CTRL    = 8'h74,
    ADDR_AXIL_RX_DONE_V_DATA_0            = 8'h78,
    ADDR_AXIL_RX_DONE_V_CTRL              = 8'h7c,
    ADDR_AXIL_RX_ERROR_V_DATA_0           = 8'h80,
    ADDR_AXIL_RX_ERROR_V_CTRL             = 8'h84,
    ADDR_AXIL_RX_CURR_CNT_V_DATA_0        = 8'h88,
    ADDR_AXIL_RX_CURR_CNT_V_CTRL          = 8'h8c,
    WRIDLE                                = 2'd0,
    WRDATA                                = 2'd1,
    WRRESP                                = 2'd2,
    WRRESET                               = 2'd3,
    RDIDLE                                = 2'd0,
    RDDATA                                = 2'd1,
    RDRESET                               = 2'd2,
    ADDR_BITS         = 8;

//------------------------Local signal-------------------
    reg  [1:0]                    wstate = WRRESET;
    reg  [1:0]                    wnext;
    reg  [ADDR_BITS-1:0]          waddr;
    wire [31:0]                   wmask;
    wire                          aw_hs;
    wire                          w_hs;
    reg  [1:0]                    rstate = RDRESET;
    reg  [1:0]                    rnext;
    reg  [31:0]                   rdata;
    wire                          ar_hs;
    wire [ADDR_BITS-1:0]          raddr;
    // internal registers
    reg  [31:0]                   int_axil_start_V = 'b0;
    reg  [31:0]                   int_axil_pkt_num_V = 'b0;
    reg  [31:0]                   int_axil_pkt_len_V = 'b0;
    reg  [31:0]                   int_axil_remote_ip_V = 'b0;
    reg  [31:0]                   int_axil_remote_port_V = 'b0;
    reg  [31:0]                   int_axil_local_port_V = 'b0;
    reg  [31:0]                   int_axil_tx_timeElapse_high_V = 'b0;
    reg                           int_axil_tx_timeElapse_high_V_ap_vld;
    reg  [31:0]                   int_axil_tx_timeElapse_low_V = 'b0;
    reg                           int_axil_tx_timeElapse_low_V_ap_vld;
    reg  [31:0]                   int_axil_tx_done_V = 'b0;
    reg                           int_axil_tx_done_V_ap_vld;
    reg  [31:0]                   int_axil_latency_sum_high_V = 'b0;
    reg                           int_axil_latency_sum_high_V_ap_vld;
    reg  [31:0]                   int_axil_latency_sum_low_V = 'b0;
    reg                           int_axil_latency_sum_low_V_ap_vld;
    reg  [31:0]                   int_axil_rx_timeElaspe_high_V = 'b0;
    reg                           int_axil_rx_timeElaspe_high_V_ap_vld;
    reg  [31:0]                   int_axil_rx_timeElaspe_low_V = 'b0;
    reg                           int_axil_rx_timeElaspe_low_V_ap_vld;
    reg  [31:0]                   int_axil_rx_done_V = 'b0;
    reg                           int_axil_rx_done_V_ap_vld;
    reg  [31:0]                   int_axil_rx_error_V = 'b0;
    reg                           int_axil_rx_error_V_ap_vld;
    reg  [31:0]                   int_axil_rx_curr_cnt_V = 'b0;
    reg                           int_axil_rx_curr_cnt_V_ap_vld;

//------------------------Instantiation------------------

//------------------------AXI write fsm------------------
assign AWREADY = (wstate == WRIDLE);
assign WREADY  = (wstate == WRDATA);
assign BRESP   = 2'b00;  // OKAY
assign BVALID  = (wstate == WRRESP);
assign wmask   = { {8{WSTRB[3]}}, {8{WSTRB[2]}}, {8{WSTRB[1]}}, {8{WSTRB[0]}} };
assign aw_hs   = AWVALID & AWREADY;
assign w_hs    = WVALID & WREADY;

// wstate
always @(posedge ACLK) begin
    if (ARESET)
        wstate <= WRRESET;
    else if (ACLK_EN)
        wstate <= wnext;
end

// wnext
always @(*) begin
    case (wstate)
        WRIDLE:
            if (AWVALID)
                wnext = WRDATA;
            else
                wnext = WRIDLE;
        WRDATA:
            if (WVALID)
                wnext = WRRESP;
            else
                wnext = WRDATA;
        WRRESP:
            if (BREADY)
                wnext = WRIDLE;
            else
                wnext = WRRESP;
        default:
            wnext = WRIDLE;
    endcase
end

// waddr
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (aw_hs)
            waddr <= AWADDR[ADDR_BITS-1:0];
    end
end

//------------------------AXI read fsm-------------------
assign ARREADY = (rstate == RDIDLE);
assign RDATA   = rdata;
assign RRESP   = 2'b00;  // OKAY
assign RVALID  = (rstate == RDDATA);
assign ar_hs   = ARVALID & ARREADY;
assign raddr   = ARADDR[ADDR_BITS-1:0];

// rstate
always @(posedge ACLK) begin
    if (ARESET)
        rstate <= RDRESET;
    else if (ACLK_EN)
        rstate <= rnext;
end

// rnext
always @(*) begin
    case (rstate)
        RDIDLE:
            if (ARVALID)
                rnext = RDDATA;
            else
                rnext = RDIDLE;
        RDDATA:
            if (RREADY & RVALID)
                rnext = RDIDLE;
            else
                rnext = RDDATA;
        default:
            rnext = RDIDLE;
    endcase
end

// rdata
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs) begin
            rdata <= 1'b0;
            case (raddr)
                ADDR_AXIL_START_V_DATA_0: begin
                    rdata <= int_axil_start_V[31:0];
                end
                ADDR_AXIL_PKT_NUM_V_DATA_0: begin
                    rdata <= int_axil_pkt_num_V[31:0];
                end
                ADDR_AXIL_PKT_LEN_V_DATA_0: begin
                    rdata <= int_axil_pkt_len_V[31:0];
                end
                ADDR_AXIL_REMOTE_IP_V_DATA_0: begin
                    rdata <= int_axil_remote_ip_V[31:0];
                end
                ADDR_AXIL_REMOTE_PORT_V_DATA_0: begin
                    rdata <= int_axil_remote_port_V[31:0];
                end
                ADDR_AXIL_LOCAL_PORT_V_DATA_0: begin
                    rdata <= int_axil_local_port_V[31:0];
                end
                ADDR_AXIL_TX_TIMEELAPSE_HIGH_V_DATA_0: begin
                    rdata <= int_axil_tx_timeElapse_high_V[31:0];
                end
                ADDR_AXIL_TX_TIMEELAPSE_HIGH_V_CTRL: begin
                    rdata[0] <= int_axil_tx_timeElapse_high_V_ap_vld;
                end
                ADDR_AXIL_TX_TIMEELAPSE_LOW_V_DATA_0: begin
                    rdata <= int_axil_tx_timeElapse_low_V[31:0];
                end
                ADDR_AXIL_TX_TIMEELAPSE_LOW_V_CTRL: begin
                    rdata[0] <= int_axil_tx_timeElapse_low_V_ap_vld;
                end
                ADDR_AXIL_TX_DONE_V_DATA_0: begin
                    rdata <= int_axil_tx_done_V[31:0];
                end
                ADDR_AXIL_TX_DONE_V_CTRL: begin
                    rdata[0] <= int_axil_tx_done_V_ap_vld;
                end
                ADDR_AXIL_LATENCY_SUM_HIGH_V_DATA_0: begin
                    rdata <= int_axil_latency_sum_high_V[31:0];
                end
                ADDR_AXIL_LATENCY_SUM_HIGH_V_CTRL: begin
                    rdata[0] <= int_axil_latency_sum_high_V_ap_vld;
                end
                ADDR_AXIL_LATENCY_SUM_LOW_V_DATA_0: begin
                    rdata <= int_axil_latency_sum_low_V[31:0];
                end
                ADDR_AXIL_LATENCY_SUM_LOW_V_CTRL: begin
                    rdata[0] <= int_axil_latency_sum_low_V_ap_vld;
                end
                ADDR_AXIL_RX_TIMEELASPE_HIGH_V_DATA_0: begin
                    rdata <= int_axil_rx_timeElaspe_high_V[31:0];
                end
                ADDR_AXIL_RX_TIMEELASPE_HIGH_V_CTRL: begin
                    rdata[0] <= int_axil_rx_timeElaspe_high_V_ap_vld;
                end
                ADDR_AXIL_RX_TIMEELASPE_LOW_V_DATA_0: begin
                    rdata <= int_axil_rx_timeElaspe_low_V[31:0];
                end
                ADDR_AXIL_RX_TIMEELASPE_LOW_V_CTRL: begin
                    rdata[0] <= int_axil_rx_timeElaspe_low_V_ap_vld;
                end
                ADDR_AXIL_RX_DONE_V_DATA_0: begin
                    rdata <= int_axil_rx_done_V[31:0];
                end
                ADDR_AXIL_RX_DONE_V_CTRL: begin
                    rdata[0] <= int_axil_rx_done_V_ap_vld;
                end
                ADDR_AXIL_RX_ERROR_V_DATA_0: begin
                    rdata <= int_axil_rx_error_V[31:0];
                end
                ADDR_AXIL_RX_ERROR_V_CTRL: begin
                    rdata[0] <= int_axil_rx_error_V_ap_vld;
                end
                ADDR_AXIL_RX_CURR_CNT_V_DATA_0: begin
                    rdata <= int_axil_rx_curr_cnt_V[31:0];
                end
                ADDR_AXIL_RX_CURR_CNT_V_CTRL: begin
                    rdata[0] <= int_axil_rx_curr_cnt_V_ap_vld;
                end
            endcase
        end
    end
end


//------------------------Register logic-----------------
assign axil_start_V       = int_axil_start_V;
assign axil_pkt_num_V     = int_axil_pkt_num_V;
assign axil_pkt_len_V     = int_axil_pkt_len_V;
assign axil_remote_ip_V   = int_axil_remote_ip_V;
assign axil_remote_port_V = int_axil_remote_port_V;
assign axil_local_port_V  = int_axil_local_port_V;
// int_axil_start_V[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_axil_start_V[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AXIL_START_V_DATA_0)
            int_axil_start_V[31:0] <= (WDATA[31:0] & wmask) | (int_axil_start_V[31:0] & ~wmask);
    end
end

// int_axil_pkt_num_V[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_axil_pkt_num_V[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AXIL_PKT_NUM_V_DATA_0)
            int_axil_pkt_num_V[31:0] <= (WDATA[31:0] & wmask) | (int_axil_pkt_num_V[31:0] & ~wmask);
    end
end

// int_axil_pkt_len_V[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_axil_pkt_len_V[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AXIL_PKT_LEN_V_DATA_0)
            int_axil_pkt_len_V[31:0] <= (WDATA[31:0] & wmask) | (int_axil_pkt_len_V[31:0] & ~wmask);
    end
end

// int_axil_remote_ip_V[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_axil_remote_ip_V[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AXIL_REMOTE_IP_V_DATA_0)
            int_axil_remote_ip_V[31:0] <= (WDATA[31:0] & wmask) | (int_axil_remote_ip_V[31:0] & ~wmask);
    end
end

// int_axil_remote_port_V[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_axil_remote_port_V[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AXIL_REMOTE_PORT_V_DATA_0)
            int_axil_remote_port_V[31:0] <= (WDATA[31:0] & wmask) | (int_axil_remote_port_V[31:0] & ~wmask);
    end
end

// int_axil_local_port_V[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_axil_local_port_V[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AXIL_LOCAL_PORT_V_DATA_0)
            int_axil_local_port_V[31:0] <= (WDATA[31:0] & wmask) | (int_axil_local_port_V[31:0] & ~wmask);
    end
end

// int_axil_tx_timeElapse_high_V
always @(posedge ACLK) begin
    if (ARESET)
        int_axil_tx_timeElapse_high_V <= 0;
    else if (ACLK_EN) begin
        if (axil_tx_timeElapse_high_V_ap_vld)
            int_axil_tx_timeElapse_high_V <= axil_tx_timeElapse_high_V;
    end
end

// int_axil_tx_timeElapse_high_V_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_axil_tx_timeElapse_high_V_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (axil_tx_timeElapse_high_V_ap_vld)
            int_axil_tx_timeElapse_high_V_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_AXIL_TX_TIMEELAPSE_HIGH_V_CTRL)
            int_axil_tx_timeElapse_high_V_ap_vld <= 1'b0; // clear on read
    end
end

// int_axil_tx_timeElapse_low_V
always @(posedge ACLK) begin
    if (ARESET)
        int_axil_tx_timeElapse_low_V <= 0;
    else if (ACLK_EN) begin
        if (axil_tx_timeElapse_low_V_ap_vld)
            int_axil_tx_timeElapse_low_V <= axil_tx_timeElapse_low_V;
    end
end

// int_axil_tx_timeElapse_low_V_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_axil_tx_timeElapse_low_V_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (axil_tx_timeElapse_low_V_ap_vld)
            int_axil_tx_timeElapse_low_V_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_AXIL_TX_TIMEELAPSE_LOW_V_CTRL)
            int_axil_tx_timeElapse_low_V_ap_vld <= 1'b0; // clear on read
    end
end

// int_axil_tx_done_V
always @(posedge ACLK) begin
    if (ARESET)
        int_axil_tx_done_V <= 0;
    else if (ACLK_EN) begin
        if (axil_tx_done_V_ap_vld)
            int_axil_tx_done_V <= axil_tx_done_V;
    end
end

// int_axil_tx_done_V_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_axil_tx_done_V_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (axil_tx_done_V_ap_vld)
            int_axil_tx_done_V_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_AXIL_TX_DONE_V_CTRL)
            int_axil_tx_done_V_ap_vld <= 1'b0; // clear on read
    end
end

// int_axil_latency_sum_high_V
always @(posedge ACLK) begin
    if (ARESET)
        int_axil_latency_sum_high_V <= 0;
    else if (ACLK_EN) begin
        if (axil_latency_sum_high_V_ap_vld)
            int_axil_latency_sum_high_V <= axil_latency_sum_high_V;
    end
end

// int_axil_latency_sum_high_V_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_axil_latency_sum_high_V_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (axil_latency_sum_high_V_ap_vld)
            int_axil_latency_sum_high_V_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_AXIL_LATENCY_SUM_HIGH_V_CTRL)
            int_axil_latency_sum_high_V_ap_vld <= 1'b0; // clear on read
    end
end

// int_axil_latency_sum_low_V
always @(posedge ACLK) begin
    if (ARESET)
        int_axil_latency_sum_low_V <= 0;
    else if (ACLK_EN) begin
        if (axil_latency_sum_low_V_ap_vld)
            int_axil_latency_sum_low_V <= axil_latency_sum_low_V;
    end
end

// int_axil_latency_sum_low_V_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_axil_latency_sum_low_V_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (axil_latency_sum_low_V_ap_vld)
            int_axil_latency_sum_low_V_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_AXIL_LATENCY_SUM_LOW_V_CTRL)
            int_axil_latency_sum_low_V_ap_vld <= 1'b0; // clear on read
    end
end

// int_axil_rx_timeElaspe_high_V
always @(posedge ACLK) begin
    if (ARESET)
        int_axil_rx_timeElaspe_high_V <= 0;
    else if (ACLK_EN) begin
        if (axil_rx_timeElaspe_high_V_ap_vld)
            int_axil_rx_timeElaspe_high_V <= axil_rx_timeElaspe_high_V;
    end
end

// int_axil_rx_timeElaspe_high_V_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_axil_rx_timeElaspe_high_V_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (axil_rx_timeElaspe_high_V_ap_vld)
            int_axil_rx_timeElaspe_high_V_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_AXIL_RX_TIMEELASPE_HIGH_V_CTRL)
            int_axil_rx_timeElaspe_high_V_ap_vld <= 1'b0; // clear on read
    end
end

// int_axil_rx_timeElaspe_low_V
always @(posedge ACLK) begin
    if (ARESET)
        int_axil_rx_timeElaspe_low_V <= 0;
    else if (ACLK_EN) begin
        if (axil_rx_timeElaspe_low_V_ap_vld)
            int_axil_rx_timeElaspe_low_V <= axil_rx_timeElaspe_low_V;
    end
end

// int_axil_rx_timeElaspe_low_V_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_axil_rx_timeElaspe_low_V_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (axil_rx_timeElaspe_low_V_ap_vld)
            int_axil_rx_timeElaspe_low_V_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_AXIL_RX_TIMEELASPE_LOW_V_CTRL)
            int_axil_rx_timeElaspe_low_V_ap_vld <= 1'b0; // clear on read
    end
end

// int_axil_rx_done_V
always @(posedge ACLK) begin
    if (ARESET)
        int_axil_rx_done_V <= 0;
    else if (ACLK_EN) begin
        if (axil_rx_done_V_ap_vld)
            int_axil_rx_done_V <= axil_rx_done_V;
    end
end

// int_axil_rx_done_V_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_axil_rx_done_V_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (axil_rx_done_V_ap_vld)
            int_axil_rx_done_V_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_AXIL_RX_DONE_V_CTRL)
            int_axil_rx_done_V_ap_vld <= 1'b0; // clear on read
    end
end

// int_axil_rx_error_V
always @(posedge ACLK) begin
    if (ARESET)
        int_axil_rx_error_V <= 0;
    else if (ACLK_EN) begin
        if (axil_rx_error_V_ap_vld)
            int_axil_rx_error_V <= axil_rx_error_V;
    end
end

// int_axil_rx_error_V_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_axil_rx_error_V_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (axil_rx_error_V_ap_vld)
            int_axil_rx_error_V_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_AXIL_RX_ERROR_V_CTRL)
            int_axil_rx_error_V_ap_vld <= 1'b0; // clear on read
    end
end

// int_axil_rx_curr_cnt_V
always @(posedge ACLK) begin
    if (ARESET)
        int_axil_rx_curr_cnt_V <= 0;
    else if (ACLK_EN) begin
        if (axil_rx_curr_cnt_V_ap_vld)
            int_axil_rx_curr_cnt_V <= axil_rx_curr_cnt_V;
    end
end

// int_axil_rx_curr_cnt_V_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_axil_rx_curr_cnt_V_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (axil_rx_curr_cnt_V_ap_vld)
            int_axil_rx_curr_cnt_V_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_AXIL_RX_CURR_CNT_V_CTRL)
            int_axil_rx_curr_cnt_V_ap_vld <= 1'b0; // clear on read
    end
end


//------------------------Memory logic-------------------

endmodule
