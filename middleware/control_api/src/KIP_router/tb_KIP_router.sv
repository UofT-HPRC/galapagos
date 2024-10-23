module tb #(
    `include "ctrl_api_header_parameters.vh"
) ();

// Declarations
logic r_clk;
logic r_resetn;
logic [IP_ADDRESS_WIDTH-1:0] r_local_ip_address;
// Input from Router
logic r_from_kernels_tvalid;
logic w_from_kernels_tready;
logic [AXIS_DATA_WIDTH-1:0] r_from_kernels_tdata;
logic [AXIS_KEEP_WIDTH-1:0] r_from_kernels_tkeep;
logic [AXIS_KIP_TUSER_WIDTH-1:0] r_from_kernels_tuser;
logic r_from_kernels_tlast;
// Output to Control RX Network Bridge
// Input from Router
logic w_to_rx_nb_tvalid;
logic r_to_rx_nb_tready;
logic [AXIS_DATA_WIDTH-1:0] w_to_rx_nb_tdata;
logic [AXIS_KEEP_WIDTH-1:0] w_to_rx_nb_tkeep;
logic [AXIS_KIP_TUSER_WIDTH-1:0] w_to_rx_nb_tuser; // Src Port and SRC IP
logic w_to_rx_nb_tlast;
// Output to GULF-Stream
logic w_to_gs_tvalid;
logic r_to_gs_tready;
logic [AXIS_DATA_WIDTH-1:0] w_to_gs_tdata;
logic [AXIS_KEEP_WIDTH-1:0] w_to_gs_tkeep;
logic [AXIS_KIP_TUSER_WIDTH-1:0] w_to_gs_tuser; // Src Port and SRC IP
logic w_to_gs_tlast;

KIP_router DUT (
    .i_clk(r_clk),
    .i_ap_rst_n(r_resetn),
    .i_local_ip_address(r_local_ip_address),
    .from_kernels_tvalid(r_from_kernels_tvalid),
    .from_kernels_tready(w_from_kernels_tready),
    .from_kernels_tdata(r_from_kernels_tdata),
    .from_kernels_tkeep(r_from_kernels_tkeep),
    .from_kernels_tuser(r_from_kernels_tuser),
    .from_kernels_tlast(r_from_kernels_tlast),
    .to_rx_nb_tvalid(w_to_rx_nb_tvalid),
    .to_rx_nb_tready(r_to_rx_nb_tready),
    .to_rx_nb_tdata(w_to_rx_nb_tdata),
    .to_rx_nb_tkeep(w_to_rx_nb_tkeep),
    .to_rx_nb_tuser(w_to_rx_nb_tuser),
    .to_rx_nb_tlast(w_to_rx_nb_tlast),
    .to_gs_tvalid(w_to_gs_tvalid),
    .to_gs_tready(r_to_gs_tready),
    .to_gs_tdata(w_to_gs_tdata),
    .to_gs_tkeep(w_to_gs_tkeep),
    .to_gs_tuser(w_to_gs_tuser),
    .to_gs_tlast(w_to_gs_tlast)
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

// Test Logic
initial begin
    r_local_ip_address <= 'h0A030705;

    r_from_kernels_tvalid <= 1;
    r_from_kernels_tdata <= 'hABCDABCDABCDABCDABCDABCDABCDABCDABCDABCDABCDABCDABCDABCDABCDABCD;
    r_from_kernels_tkeep <= 'hAFAFAFAFAFAFAFAF;
    r_from_kernels_tuser <= 'hABABCDCD0A030705;
    r_from_kernels_tlast <= 0;
    r_to_rx_nb_tready <= 0;
    r_to_gs_tready <= 1;
    #5
    r_to_rx_nb_tready <= 1;
    r_from_kernels_tvalid <= 0;
    #5
    r_from_kernels_tvalid <= 1;
    r_from_kernels_tdata <= 'h0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F;
    r_from_kernels_tkeep <= 'h3434343434343434;
    r_from_kernels_tuser <= 'hFEFECDCD12121212;
    r_from_kernels_tlast <= 1;
    r_to_gs_tready <= 1;
    #5
    r_to_gs_tready <= 0;
    r_from_kernels_tvalid <= 0;
    #100
    $finish;
end



endmodule