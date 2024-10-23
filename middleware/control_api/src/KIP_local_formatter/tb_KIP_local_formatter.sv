module tb #(
    `include "ctrl_api_header_parameters.vh"
) ();

// Declarations
logic r_clk;
logic r_resetn;
// Input from Router
logic r_from_router_tvalid;
logic w_from_router_tready;
logic [AXIS_DATA_WIDTH-1:0] r_from_router_tdata;
logic [AXIS_KEEP_WIDTH-1:0] r_from_router_tkeep;
logic [AXIS_KIP_TUSER_WIDTH-1:0] r_from_router_tuser; // Src Port and SRC IP
logic r_from_router_tlast;
// Output to Control RX Network Bridge
logic w_to_kernels_tvalid;
logic r_to_kernels_tready;
logic [AXIS_DATA_WIDTH-1:0] w_to_kernels_tdata;
logic [AXIS_KEEP_WIDTH-1:0] w_to_kernels_tkeep;
logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] w_to_kernels_tid;
logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] w_to_kernels_tdest;
logic [AXIS_FROM_NB_TUSER_WIDTH-1:0] w_to_kernels_tuser;
logic w_to_kernels_tlast;

KIP_local_formatter DUT (
    .i_clk(r_clk),
    .i_ap_rst_n(r_resetn),
    .from_router_tvalid(r_from_router_tvalid),
    .from_router_tready(w_from_router_tready),
    .from_router_tdata(r_from_router_tdata),
    .from_router_tkeep(r_from_router_tkeep),
    .from_router_tuser(r_from_router_tuser),
    .from_router_tlast(r_from_router_tlast),
    .to_kernels_tvalid(w_to_kernels_tvalid),
    .to_kernels_tready(r_to_kernels_tready),
    .to_kernels_tdata(w_to_kernels_tdata),
    .to_kernels_tkeep(w_to_kernels_tkeep),
    .to_kernels_tid(w_to_kernels_tid),
    .to_kernels_tdest(w_to_kernels_tdest),
    .to_kernels_tuser(w_to_kernels_tuser),
    .to_kernels_tlast(w_to_kernels_tlast)
);

// Message Offsets
`include "ctrl_api_message_parameters.vh"

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

// Test Logic
initial begin
    r_from_router_tvalid <= 1;
    r_from_router_tdata <= 'hABCDABCDABCDABCDABCDABCDABCDABCDABCDABCDABCDABCDABCDABCDABCDABCD;
    r_from_router_tdata[AXIS_KIP_TID_OFFSET+:AXIS_LAN_TDEST_WIDTH] <= 'hFE;
    r_from_router_tdata[AXIS_KIP_SENDER_TID_OFFSET+:AXIS_LAN_TDEST_WIDTH] <= 'hFA;
    r_from_router_tkeep <= 'hAFAFAFAFAFAFAFAF;
    r_from_router_tuser <= 'hABABCDCDEFEFEFEF;
    r_from_router_tlast <= 0;
    r_to_kernels_tready <= 0;
    #5
    r_from_router_tvalid <= 0;
    r_from_router_tdata <= 'h0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F;
    r_from_router_tdata[AXIS_KIP_TID_OFFSET+:AXIS_LAN_TDEST_WIDTH] <= 'hAA;
    r_from_router_tdata[AXIS_KIP_SENDER_TID_OFFSET+:AXIS_LAN_TDEST_WIDTH] <= 'hBB;
    r_from_router_tkeep <= 'h3434343434343434;
    r_from_router_tuser <= 'hFEFECDCD12121212;
    r_from_router_tlast <= 1;
    r_to_kernels_tready <= 1;
    #100
    $finish;
end

endmodule