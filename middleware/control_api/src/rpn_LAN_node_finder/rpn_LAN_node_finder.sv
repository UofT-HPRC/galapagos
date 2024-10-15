module rpn_LAN_node_finder #(
    `include "ctrl_api_reliability_header_parameters.vh"
    `include "ctrl_api_header_parameters.vh"
    ) (
    input i_clk,
    input i_ap_rst_n,
    // AXI-Stream to-LAN interface from Control
    input from_ctrl_LAN_tvalid,
    output wire from_ctrl_LAN_tready,
    input [AXIS_DATA_WIDTH-1:0] from_ctrl_LAN_tdata,
    input [AXIS_KEEP_WIDTH-1:0] from_ctrl_LAN_tkeep,
    input [AXIS_LAN_TDEST_WIDTH-1:0] from_ctrl_LAN_tid,
    input [AXIS_LAN_TDEST_WIDTH-1:0] from_ctrl_LAN_tdest,
    input [AXIS_LAN_TUSER_WIDTH-1:0] from_ctrl_LAN_tuser,
    input from_ctrl_LAN_tlast,
    // AXI-Stream to Network Bridge LAN Interface
    output wire to_LAN_TX_tvalid,
    input to_LAN_TX_tready,
    output wire [AXIS_DATA_WIDTH-1:0] to_LAN_TX_tdata,
    output wire [AXIS_KEEP_WIDTH-1:0] to_LAN_TX_tkeep,
    output wire [AXIS_LAN_TDEST_WIDTH-1:0] to_LAN_TX_tid,
    output wire [AXIS_LAN_TDEST_WIDTH-1:0] to_LAN_TX_tdest,
    output wire [AXIS_LAN_TUSER_WIDTH-1:0] to_LAN_TX_tuser,
    output wire to_LAN_TX_tlast,
    // BRAM connection for converting between kernel and node
    output wire kernel_to_node_ROM_CLK, 
    output wire kernel_to_node_ROM_RST,
    output wire kernel_to_node_ROM_EN,
    output wire [BRAM_ADDR_WIDTH-1:0] kernel_to_node_ROM_ADDR,
    input [NODE_ID_WIDTH-1:0] kernel_to_node_ROM_DOUT
);

    // Parameters
    localparam STATE_IDLE = 0;
    localparam STATE_GET_NODE_NUMBER = 1;
    localparam STATE_SEND_TO_LAN_TX = 2;

    // Declarations
    logic [2:0] r_core_state;
    logic [2:0] w_next_core_state;
    logic [NODE_ID_WIDTH-1:0] r_destination_node_number;
    logic [NODE_ID_WIDTH-1:0] w_destination_node_number; 
    // To LAN TX Interface
    logic [AXIS_DATA_WIDTH-1:0] r_to_LAN_TX_tdata; 
    logic [AXIS_KEEP_WIDTH-1:0] r_to_LAN_TX_tkeep;
    logic [AXIS_LAN_TDEST_WIDTH-1:0] r_to_LAN_TX_tid;
    logic [AXIS_LAN_TDEST_WIDTH-1:0] r_to_LAN_TX_tdest;
    logic [AXIS_DATA_WIDTH-1:0] w_to_LAN_TX_tdata;
    logic [AXIS_KEEP_WIDTH-1:0] w_to_LAN_TX_tkeep;
    logic [AXIS_LAN_TDEST_WIDTH-1:0] w_to_LAN_TX_tid;
    logic [AXIS_LAN_TDEST_WIDTH-1:0] w_to_LAN_TX_tdest;

    // Assignments
    // Interfaces from Control
    assign from_ctrl_LAN_tready = (r_core_state == STATE_IDLE) ? 1 : 0;
    // to-LAN interface to Network Bridge (only used to forward PUB messages)
    assign to_LAN_TX_tvalid = (r_core_state == STATE_SEND_TO_LAN_TX) ? 1 : 0;
    assign to_LAN_TX_tdata = r_to_LAN_TX_tdata;
    assign to_LAN_TX_tkeep = r_to_LAN_TX_tkeep;
    assign to_LAN_TX_tid = r_to_LAN_TX_tid;
    assign to_LAN_TX_tdest = r_to_LAN_TX_tdest;
    // Replace TUSER field with destination node number
    assign to_LAN_TX_tuser[AXIS_LAN_TUSER_WIDTH-1:0] = r_destination_node_number;
    assign to_LAN_TX_tlast = 1;
    // BRAM connection for converting between kernel and node
    // This BRAM is only used when in normal operation
    assign kernel_to_node_ROM_CLK = i_clk; 
    assign kernel_to_node_ROM_RST = ~i_ap_rst_n;
    // Read node number from this BRAM when we get a new message in IDLE state
    assign kernel_to_node_ROM_EN = (r_core_state == STATE_IDLE
                                 && from_ctrl_LAN_tvalid == 1) ? 1 : 0;
    // Address is byte-addressable, therefore entry 1 = 0x4, entry 2 = 0x8, etc
    // This works out to a bit shift left by 2
    assign kernel_to_node_ROM_ADDR[1:0] = 0;
    assign kernel_to_node_ROM_ADDR[AXIS_LAN_TDEST_WIDTH+1:2] = from_ctrl_LAN_tdest;
    assign kernel_to_node_ROM_ADDR[BRAM_ADDR_WIDTH-1:AXIS_LAN_TDEST_WIDTH+2] = 0;

    // Core State FSM
    always_comb begin
        w_next_core_state = STATE_IDLE;
        case(r_core_state)
            STATE_IDLE:
                w_next_core_state = (from_ctrl_LAN_tvalid == 1) ? STATE_GET_NODE_NUMBER : STATE_IDLE;
            STATE_GET_NODE_NUMBER:
                w_next_core_state = STATE_SEND_TO_LAN_TX;
            STATE_SEND_TO_LAN_TX:
                w_next_core_state = (to_LAN_TX_tready == 1) ? STATE_IDLE : STATE_SEND_TO_LAN_TX;
        endcase
    end
    always_ff @(posedge i_clk, negedge i_ap_rst_n) begin
        if (i_ap_rst_n == 0) begin
            r_core_state <= STATE_IDLE;
        end
        else begin
            r_core_state <= w_next_core_state;
        end
    end

    // Read data from the current transaction
    always_comb begin
        if (r_core_state == STATE_IDLE) begin
            if (from_ctrl_LAN_tvalid == 1) begin
                w_to_LAN_TX_tdata <= from_ctrl_LAN_tdata;
                w_to_LAN_TX_tkeep <= from_ctrl_LAN_tkeep;
                w_to_LAN_TX_tid <= from_ctrl_LAN_tid;
                w_to_LAN_TX_tdest <= from_ctrl_LAN_tdest;
            end
            else begin
                w_to_LAN_TX_tdata <= 0;
                w_to_LAN_TX_tkeep <= 0;
                w_to_LAN_TX_tid <= 0;
                w_to_LAN_TX_tdest <= 0;
            end
        end
        else begin
            w_to_LAN_TX_tdata <= r_to_LAN_TX_tdata;
            w_to_LAN_TX_tkeep <= r_to_LAN_TX_tkeep;
            w_to_LAN_TX_tid <= r_to_LAN_TX_tid;
            w_to_LAN_TX_tdest <= r_to_LAN_TX_tdest;
        end
    end
    always_ff @(posedge i_clk, negedge i_ap_rst_n) begin
        if (i_ap_rst_n == 0) begin
            r_to_LAN_TX_tdata <= 0;
            r_to_LAN_TX_tkeep <= 0;
            r_to_LAN_TX_tid <= 0;
            r_to_LAN_TX_tdest <= 0;
        end
        else begin
            r_to_LAN_TX_tdata <= w_to_LAN_TX_tdata;
            r_to_LAN_TX_tkeep <= w_to_LAN_TX_tkeep;
            r_to_LAN_TX_tid <= w_to_LAN_TX_tid;
            r_to_LAN_TX_tdest <= w_to_LAN_TX_tdest;
        end
    end

    // Get the destination kernel's node number
    always_comb begin
        if (r_core_state == STATE_IDLE)
            w_destination_node_number = 0;
        else if (r_core_state == STATE_GET_NODE_NUMBER) 
            w_destination_node_number = kernel_to_node_ROM_DOUT[NODE_ID_WIDTH-1:0];
        else begin
            w_destination_node_number = r_destination_node_number;
        end
    end
    always_ff @(posedge i_clk, negedge i_ap_rst_n) begin
        if (i_ap_rst_n == 0) begin
            r_destination_node_number <= 0;
        end
        else begin
            r_destination_node_number <= w_destination_node_number;
        end
    end
endmodule