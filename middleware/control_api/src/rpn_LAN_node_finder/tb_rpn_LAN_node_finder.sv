module tb #(
    `include "ctrl_api_reliability_header_parameters.vh"
    `include "ctrl_api_header_parameters.vh"
) ();

// Message Offsets
`include "ctrl_api_message_parameters.vh"
`include "ctrl_api_reliability_message_parameters.vh"
// IDs
localparam DUT_KERNEL_ID = 'hAA;
localparam REMOTE_KERNEL_ID = 'hBB;

// Declarations
logic r_clk;
logic r_resetn;
// AXI-Stream interface from Control
logic r_from_ctrl_LAN_tvalid;
logic w_from_ctrl_LAN_tready;
logic [AXIS_DATA_WIDTH-1:0] r_from_ctrl_LAN_tdata;
logic [AXIS_KEEP_WIDTH-1:0] r_from_ctrl_LAN_tkeep;
logic [AXIS_LAN_TDEST_WIDTH-1:0] r_from_ctrl_LAN_tid;
logic [AXIS_LAN_TDEST_WIDTH-1:0] r_from_ctrl_LAN_tdest;
logic [AXIS_LAN_TUSER_WIDTH-1:0] r_from_ctrl_LAN_tuser;
logic r_from_ctrl_LAN_tlast;
// AXI-Stream interface to Control module
logic w_to_LAN_TX_tvalid;
logic r_to_LAN_TX_tready;
logic [AXIS_DATA_WIDTH-1:0] w_to_LAN_TX_tdata;
logic [AXIS_KEEP_WIDTH-1:0] w_to_LAN_TX_tkeep;
logic [AXIS_LAN_TDEST_WIDTH-1:0] w_to_LAN_TX_tid;
logic [AXIS_LAN_TDEST_WIDTH-1:0] w_to_LAN_TX_tdest;
logic [AXIS_LAN_TUSER_WIDTH-1:0] w_to_LAN_TX_tuser;
logic w_to_LAN_TX_tlast;
// BRAM connection to K2N BRAM
logic w_kernel_to_node_BRAM_CLK;
logic w_kernel_to_node_BRAM_RST;
logic w_kernel_to_node_BRAM_EN;
logic [BRAM_ADDR_WIDTH-1:0] w_kernel_to_node_BRAM_ADDR;
logic [NODE_ID_WIDTH-1:0] r_kernel_to_node_BRAM_DOUT;

// DUT
rpn_LAN_node_finder #(
) DUT (
    .i_clk(r_clk),
    .i_ap_rst_n(r_resetn),
    // AXI-Stream to-LAN interface from Control
    .from_ctrl_LAN_tvalid(r_from_ctrl_LAN_tvalid),
    .from_ctrl_LAN_tready(w_from_ctrl_LAN_tready),
    .from_ctrl_LAN_tdata(r_from_ctrl_LAN_tdata),
    .from_ctrl_LAN_tkeep(r_from_ctrl_LAN_tkeep),
    .from_ctrl_LAN_tid(r_from_ctrl_LAN_tid),
    .from_ctrl_LAN_tdest(r_from_ctrl_LAN_tdest),
    .from_ctrl_LAN_tuser(r_from_ctrl_LAN_tuser),
    .from_ctrl_LAN_tlast(r_from_ctrl_LAN_tlast),
    // AXI-Stream to Network Bridge LAN Interface
    .to_LAN_TX_tvalid(w_to_LAN_TX_tvalid),
    .to_LAN_TX_tready(r_to_LAN_TX_tready),
    .to_LAN_TX_tdata(w_to_LAN_TX_tdata),
    .to_LAN_TX_tkeep(w_to_LAN_TX_tkeep),
    .to_LAN_TX_tid(w_to_LAN_TX_tid),
    .to_LAN_TX_tdest(w_to_LAN_TX_tdest),
    .to_LAN_TX_tuser(w_to_LAN_TX_tuser),
    .to_LAN_TX_tlast(w_to_LAN_TX_tlast),
    // BRAM connection for converting between kernel and node
    .kernel_to_node_ROM_CLK(w_kernel_to_node_BRAM_CLK),
    .kernel_to_node_ROM_RST(w_kernel_to_node_BRAM_RST),
    .kernel_to_node_ROM_EN(w_kernel_to_node_BRAM_EN),
    .kernel_to_node_ROM_ADDR(w_kernel_to_node_BRAM_ADDR),
    .kernel_to_node_ROM_DOUT(r_kernel_to_node_BRAM_DOUT)
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

// Constants
initial begin
    // From Network-Bridge Interface
    r_from_ctrl_LAN_tkeep = 'hFFFFFFFFFFFFFFFF;
    r_from_ctrl_LAN_tuser = 1;
    r_from_ctrl_LAN_tlast = 1;
    // to-Control Interface
    r_to_LAN_TX_tready = 1;
    // Sequence Number BRAM
    r_kernel_to_node_BRAM_DOUT = 'hCE;
end

initial begin
    r_from_ctrl_LAN_tvalid <= 0;
    r_from_ctrl_LAN_tdata <= 0;
    r_from_ctrl_LAN_tid <= 0;
    r_from_ctrl_LAN_tdest <= 0;
    #100
    // Test sending PUB LAN packets
    // Received a LAN PUB packet: Write CDCDCDCD to address ABCDABCDABCDABCD 
    r_from_ctrl_LAN_tvalid <= 1;
    // TDATA
    r_from_ctrl_LAN_tdata[0+:AXIS_LAN_MSG_TYPE_WIDTH] <= MSG_WRITE; // LAN Data begins here
    r_from_ctrl_LAN_tdata[(AXIS_LAN_DATA_OFFSET)+:AXIS_LAN_DATA_WIDTH] <= 'hCDCDCDCD;
    r_from_ctrl_LAN_tdata[(AXIS_LAN_ADDR_OFFSET)+:AXIS_LAN_ADDR_WIDTH] <= 'hABCDABCDABCDABCD;
    r_from_ctrl_LAN_tdata[(AXIS_LAN_WSTRB_OFFSET)+:AXIS_LAN_WSTRB_WIDTH] <= 'hE;
    r_from_ctrl_LAN_tdata[(AXIS_LAN_TID_OFFSET)+:AXIS_LAN_TID_WIDTH] <= 0;
    r_from_ctrl_LAN_tdata[(AXIS_LAN_IP_OFFSET)+:AXIS_LAN_IP_WIDTH] <= 0;
    r_from_ctrl_LAN_tid <= REMOTE_KERNEL_ID;
    r_from_ctrl_LAN_tdest <= DUT_KERNEL_ID;
    #100
    $finish;

end

endmodule