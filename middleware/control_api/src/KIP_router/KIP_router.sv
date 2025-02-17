module KIP_router #(
    `include "ctrl_api_header_parameters.vh"
) (
    input i_clk,
    input i_ap_rst_n,
    input [IP_ADDRESS_WIDTH-1:0] i_local_ip_address,
    // AXIS interface from KIP switch
    input from_kernels_tvalid,
    output from_kernels_tready,
    input [AXIS_DATA_WIDTH-1:0] from_kernels_tdata,
    input [AXIS_KEEP_WIDTH-1:0] from_kernels_tkeep,
    input [AXIS_KIP_TUSER_WIDTH-1:0] from_kernels_tuser,
    input from_kernels_tlast,
    // AXIS interface to Control RX network bridge (local messages)
    output to_rx_nb_tvalid,
    input to_rx_nb_tready,
    output [AXIS_DATA_WIDTH-1:0] to_rx_nb_tdata,
    output [AXIS_KEEP_WIDTH-1:0] to_rx_nb_tkeep,
    output [AXIS_KIP_TUSER_WIDTH-1:0] to_rx_nb_tuser,
    output to_rx_nb_tlast,
    // AXIS interface to GULF-Stream (remote messages)
    output to_gs_tvalid,
    input to_gs_tready,
    output [AXIS_DATA_WIDTH-1:0] to_gs_tdata,
    output [AXIS_KEEP_WIDTH-1:0] to_gs_tkeep,
    output [AXIS_KIP_TUSER_WIDTH-1:0] to_gs_tuser,
    output to_gs_tlast
);
    // Local Messages (Dest IP matches this device's IP)
    assign to_rx_nb_tvalid = (from_kernels_tuser[IP_ADDRESS_WIDTH-1:0] == i_local_ip_address) ? from_kernels_tvalid : 0;
    assign to_rx_nb_tdata = from_kernels_tdata;
    assign to_rx_nb_tkeep = from_kernels_tkeep;
    assign to_rx_nb_tuser = from_kernels_tuser;
    assign to_rx_nb_tlast = from_kernels_tlast;

    // Remote Messages (Dest IP does not match this device's IP)
    assign to_gs_tvalid = (from_kernels_tuser[IP_ADDRESS_WIDTH-1:0] != i_local_ip_address) ? from_kernels_tvalid : 0;
    assign to_gs_tdata = from_kernels_tdata;
    assign to_gs_tkeep = from_kernels_tkeep;
    assign to_gs_tuser = from_kernels_tuser;
    assign to_gs_tlast = from_kernels_tlast;

    // Ready signal depends on if the message is local or remote
    assign from_kernels_tready = (from_kernels_tuser[IP_ADDRESS_WIDTH-1:0] == i_local_ip_address) ? to_rx_nb_tready : to_gs_tready;
endmodule