module tb #(
    `include "ctrl_api_header_parameters.vh"
) ();

// Declarations
logic r_clk;
logic r_resetn;
logic [IP_ADDRESS_WIDTH-1:0] r_local_ip_address;
logic [IP_PORT_WIDTH-1:0] r_LAN_port_number;
// Input from Router
logic r_from_router_tvalid;
logic w_from_router_tready;
logic [AXIS_DATA_WIDTH-1:0] r_from_router_tdata;
logic [AXIS_KEEP_WIDTH-1:0] r_from_router_tkeep;
logic [AXIS_LAN_TDEST_WIDTH-1:0] r_from_router_tid;
logic [AXIS_LAN_TDEST_WIDTH-1:0] r_from_router_tdest;
logic [AXIS_LAN_TUSER_WIDTH-1:0] r_from_router_tuser;
logic r_from_router_tlast;
// Output to Control RX Network Bridge
logic w_to_switch_tvalid;
logic r_to_switch_tready;
logic [AXIS_DATA_WIDTH-1:0] w_to_switch_tdata;
logic [AXIS_KEEP_WIDTH-1:0] w_to_switch_tkeep;
logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] w_to_switch_tid;
logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] w_to_switch_tdest;
logic [AXIS_FROM_NB_TUSER_WIDTH-1:0] w_to_switch_tuser;
logic w_to_switch_tlast;

LAN_local_formatter DUT (
    .i_clk(r_clk),
    .i_ap_rst_n(r_resetn),
    .i_local_ip_address(r_local_ip_address),
    .i_LAN_port_number(r_LAN_port_number),
    .from_router_tvalid(r_from_router_tvalid),
    .from_router_tready(w_from_router_tready),
    .from_router_tdata(r_from_router_tdata),
    .from_router_tkeep(r_from_router_tkeep),
    .from_router_tid(r_from_router_tid),
    .from_router_tdest(r_from_router_tdest),
    .from_router_tuser(r_from_router_tuser),
    .from_router_tlast(r_from_router_tlast),
    .to_switch_tvalid(w_to_switch_tvalid),
    .to_switch_tready(r_to_switch_tready),
    .to_switch_tdata(w_to_switch_tdata),
    .to_switch_tkeep(w_to_switch_tkeep),
    .to_switch_tid(w_to_switch_tid),
    .to_switch_tdest(w_to_switch_tdest),
    .to_switch_tuser(w_to_switch_tuser),
    .to_switch_tlast(w_to_switch_tlast)
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
    r_LAN_port_number <= 'hDCDC;

    r_from_router_tvalid <= 1;
    r_from_router_tdata <= 'hABCDABCDABCDABCDABCDABCDABCDABCDABCDABCDABCDABCDABCDABCDABCDABCD;
    r_from_router_tkeep <= 'hAFAFAFAFAFAFAFAF;
    r_from_router_tid <= 'hAB;
    r_from_router_tdest <= 'hCD;
    r_from_router_tuser <= 'h1;
    r_from_router_tlast <= 0;
    r_to_switch_tready <= 0;
    #5
    r_from_router_tvalid <= 0;
    r_from_router_tdata <= 'h0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F;
    r_from_router_tkeep <= 'h3434343434343434;
    r_from_router_tid <= 'hFF;
    r_from_router_tdest <= 'hEE;
    r_from_router_tuser <= 'hFEFECDCD12121212;
    r_from_router_tlast <= 1;
    r_to_switch_tready <= 1;
    #100
    $finish;
end

endmodule