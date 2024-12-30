// This module sits inside the cluster gateway. It is responsible for forwarding WAN control messages originating from other clusters

module gw_ctrl_preprogrammed #(
    localparam REG_ADDR_BRAM_WIDTH = 64,
    localparam TDEST_BRAM_WIDTH = 32,
    `include "ctrl_api_header_parameters.vh"
) (
    input i_clk,
    input i_ap_rst_n,
    // AXI-Stream interface from Network Bridge
    input from_WAN_tvalid,
    output from_WAN_tready,
    input [AXIS_DATA_WIDTH-1:0] from_WAN_tdata,
    input [AXIS_KEEP_WIDTH-1:0] from_WAN_tkeep,
    input [IP_PORT_WIDTH-1:0] from_WAN_tid,
    input [IP_PORT_WIDTH-1:0] from_WAN_tdest,
    input [IP_ADDRESS_WIDTH-1:0] from_WAN_tuser,
    input from_WAN_tlast,
    // AXI-Stream interface to Network Bridge
    output to_LAN_tvalid,
    input to_LAN_tready,
    output [AXIS_DATA_WIDTH-1:0] to_LAN_tdata,
    output [AXIS_KEEP_WIDTH-1:0] to_LAN_tkeep,
    output [AXIS_LAN_TDEST_WIDTH-1:0] to_LAN_tid,
    output [AXIS_LAN_TDEST_WIDTH-1:0] to_LAN_tdest,
    output [AXIS_LAN_TUSER_WIDTH-1:0] to_LAN_tuser,
    output to_LAN_tlast,
    // BRAM interface to Register Address ROM
    output logic to_register_address_ROM_CLK,
    output logic to_register_address_ROM_RST,
    output logic to_register_address_ROM_EN,
    output logic [BRAM_ADDR_WIDTH-1:0] to_register_address_ROM_ADDR,
    input [REG_ADDR_BRAM_WIDTH-1:0] to_register_address_ROM_DOUT,
    // BRAM interface to TDEST ROM. This stores data in the format:
    //  | TDEST | INFRA_OR_USER |
    //  |8     1|       0       |
    output logic to_tdest_ROM_CLK,
    output logic to_tdest_ROM_RST,
    output logic to_tdest_ROM_EN,
    output logic [BRAM_ADDR_WIDTH-1:0] to_tdest_ROM_ADDR,
    input [TDEST_BRAM_WIDTH-1:0] to_tdest_ROM_DOUT
);

    // Parameters
    `include "ctrl_api_message_parameters.vh"
    // Module modes. In Forward mode, the gateway kernel forwards to the destination whatever data the requesting kernel sent. In overwrite mode, the gateway kernel sends the data provided in i_axil_write_data to the destination, ignoring the requesting kernel's data.
    localparam MODULE_MODE_FORWARD = 0;
    localparam MODULE_MODE_OVERWRITE = 1;
    // FSM States
    localparam STATE_IDLE = 0;
    localparam STATE_FETCH_DESTINATION = 1;
    localparam STATE_SEND_LAN_MESSAGE = 2;
    
    // Declarations
    logic [1:0] r_core_state;
    logic [1:0] w_next_core_state;
    // AXI-Stream to-LAN
    logic [AXIS_LAN_MSG_TYPE_WIDTH-1:0] r_to_LAN_message_type;
    logic [AXIS_LAN_DATA_WIDTH-1:0] r_to_LAN_message_data;
    logic [AXIS_LAN_ADDR_WIDTH-1:0] r_to_LAN_address;
    logic [AXIS_LAN_WSTRB_WIDTH-1:0] r_to_LAN_wstrb;
    logic [AXIS_LAN_TDEST_WIDTH-1:0] r_to_LAN_tdest;
    logic [AXIS_LAN_TUSER_WIDTH-1:0] r_to_LAN_tuser;
    logic [AXIS_LAN_TDEST_WIDTH-1:0] r_to_LAN_requestor_tid;
    logic [AXIS_LAN_IP_WIDTH-1:0] r_to_LAN_requestor_ip;
    logic [AXIS_WAN_TDEST_WIDTH-1:0] r_to_LAN_requestor_ctid;
    logic [AXIS_LAN_MSG_TYPE_WIDTH-1:0] w_to_LAN_message_type;
    logic [AXIS_LAN_DATA_WIDTH-1:0] w_to_LAN_message_data;
    logic [AXIS_LAN_ADDR_WIDTH-1:0] w_to_LAN_address;
    logic [AXIS_LAN_WSTRB_WIDTH-1:0] w_to_LAN_wstrb;
    logic [AXIS_LAN_TDEST_WIDTH-1:0] w_to_LAN_tdest;
    logic [AXIS_LAN_TUSER_WIDTH-1:0] w_to_LAN_tuser;
    logic [AXIS_LAN_TDEST_WIDTH-1:0] w_to_LAN_requestor_tid;
    logic [AXIS_LAN_IP_WIDTH-1:0] w_to_LAN_requestor_ip;
    logic [AXIS_WAN_TDEST_WIDTH-1:0] w_to_LAN_requestor_CTID;
    // Other
    logic [AXIS_WAN_MSG_TYPE_WIDTH-1:0] w_from_WAN_message_type;
    logic w_tdest_is_infra;

    // Assignments
    // AXI-Stream interface from Network Bridge
    assign from_WAN_tready = (r_core_state == STATE_IDLE ? 1 : 0);
    // AXI-Stream interface to Network Bridge
    assign to_LAN_tvalid = (r_core_state == STATE_SEND_LAN_MESSAGE ? 1 : 0);
    // to-LAN TDATA channel
    assign to_LAN_tdata[AXIS_LAN_MSG_TYPE_WIDTH-1:0] = r_to_LAN_message_type;
    assign to_LAN_tdata[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] = r_to_LAN_message_data;
    assign to_LAN_tdata[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] = r_to_LAN_address;
    assign to_LAN_tdata[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] = r_to_LAN_wstrb;
    assign to_LAN_tdata[AXIS_LAN_TID_OFFSET+:AXIS_LAN_TID_WIDTH] = r_to_LAN_requestor_tid;
    assign to_LAN_tdata[AXIS_LAN_IP_OFFSET+:AXIS_LAN_IP_WIDTH] = r_to_LAN_requestor_ip;
    assign to_LAN_tdata[AXIS_LAN_CTID_OFFSET+:AXIS_LAN_CTID_WIDTH] = r_to_LAN_requestor_ctid;
    assign to_LAN_tdata[AXIS_DATA_WIDTH-1:(AXIS_LAN_CTID_OFFSET+AXIS_LAN_CTID_WIDTH)] = 0;    
    assign to_LAN_tkeep = 'hFFFFFFFFFFFFFFFF;
    assign to_LAN_tid = 0; // Indicates this was from the gateway
    assign to_LAN_tdest = r_to_LAN_tdest;
    assign to_LAN_tuser = r_to_LAN_tuser; // Indicates this is a control packet
    assign to_LAN_tlast = 1;
    // BRAM interface to Register Address ROM
    assign to_register_address_ROM_CLK = i_clk;
    assign to_register_address_ROM_RST = ~i_ap_rst_n;
    assign to_register_address_ROM_EN = (r_core_state == STATE_IDLE && from_WAN_tvalid == 1) ? 1 : 0;
    // TODO: Test what the register address has to be to make 64-bit addresses work
    // Assume that this is byte addressable, therefore 64-bit addresses are separated by 8 entries
    assign to_register_address_ROM_ADDR[2:0] = 0;
    assign to_register_address_ROM_ADDR[3+:IP_PORT_WIDTH] = from_WAN_tdest;
    assign to_register_address_ROM_ADDR[BRAM_ADDR_WIDTH-1:(IP_PORT_WIDTH+3)] = 0;
    // BRAM interface to TDEST ROM
    assign to_tdest_ROM_CLK = i_clk;
    assign to_tdest_ROM_RST = ~i_ap_rst_n;
    assign to_tdest_ROM_EN = (r_core_state == STATE_IDLE && from_WAN_tvalid == 1) ? 1 : 0;
    // Address is byte-addressable, therefore entry 1 = 0x4, entry 2 = 0x8, etc
    // This translates to a bit shift left by 2
    assign to_tdest_ROM_ADDR[1:0] = 0;
    assign to_tdest_ROM_ADDR[2+:IP_PORT_WIDTH] = from_WAN_tdest;
    assign to_tdest_ROM_ADDR[BRAM_ADDR_WIDTH-1:(IP_PORT_WIDTH+2)] = 0;
    // Other
    assign w_from_WAN_message_type = from_WAN_tdata[AXIS_WAN_MSG_TYPE_WIDTH-1:0];
    assign w_tdest_is_infra = to_tdest_ROM_DOUT[0];

    // Core State FSM
    always_comb begin
        w_next_core_state = STATE_IDLE;
        case(r_core_state)
            STATE_IDLE: begin
                w_next_core_state = (from_WAN_tvalid == 1) ? STATE_FETCH_DESTINATION : STATE_IDLE;
            end
            STATE_FETCH_DESTINATION: begin
                w_next_core_state = STATE_SEND_LAN_MESSAGE;
            end
            STATE_SEND_LAN_MESSAGE: begin
                w_next_core_state = (to_LAN_tready == 1) ? STATE_IDLE : STATE_SEND_LAN_MESSAGE;
            end
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

    // Read WAN packet sent from another cluster
    always_comb begin
        w_to_LAN_message_type = 0;
        w_to_LAN_message_data = 0;
        w_to_LAN_wstrb = 0;
        w_to_LAN_requestor_tid = 0;
        w_to_LAN_requestor_ip = 0;
        w_to_LAN_requestor_CTID = 0;
        if (r_core_state == STATE_IDLE) begin
            if (from_WAN_tvalid == 1) begin
                w_to_LAN_message_type = w_from_WAN_message_type;
                w_to_LAN_message_data = from_WAN_tdata[AXIS_WAN_DATA_OFFSET+:AXIS_WAN_DATA_WIDTH];
                w_to_LAN_wstrb = from_WAN_tdata[AXIS_WAN_WSTRB_OFFSET+:AXIS_WAN_WSTRB_WIDTH];
                w_to_LAN_requestor_tid = from_WAN_tdata[AXIS_WAN_TID_OFFSET+:AXIS_WAN_TID_WIDTH];
                w_to_LAN_requestor_ip = from_WAN_tdata[AXIS_WAN_IP_OFFSET+:AXIS_WAN_IP_WIDTH];
                w_to_LAN_requestor_CTID = from_WAN_tdata[AXIS_WAN_CTID_OFFSET+:AXIS_WAN_CTID_WIDTH];
            end
            // Reset values in IDLE
            else begin
                w_to_LAN_message_type = 0;
                w_to_LAN_message_data = 0;
                w_to_LAN_wstrb = 0;
                w_to_LAN_requestor_tid = 0;
                w_to_LAN_requestor_ip = 0;
                w_to_LAN_requestor_CTID = 0;
            end
        end
        else begin
            w_to_LAN_message_type = r_to_LAN_message_type;
            w_to_LAN_message_data = r_to_LAN_message_data;
            w_to_LAN_wstrb = r_to_LAN_wstrb;
            w_to_LAN_requestor_tid = r_to_LAN_requestor_tid;
            w_to_LAN_requestor_ip = r_to_LAN_requestor_ip;
            w_to_LAN_requestor_CTID = r_to_LAN_requestor_ctid;
        end
    end
    always_ff @(posedge i_clk, negedge i_ap_rst_n) begin
        if (i_ap_rst_n == 0) begin
            r_to_LAN_message_type <= 0;
            r_to_LAN_message_data <= 0;
            r_to_LAN_wstrb <= 0;
            r_to_LAN_requestor_tid <= 0;
            r_to_LAN_requestor_ip <= 0;
            r_to_LAN_requestor_ctid <= 0;
        end
        else begin
            r_to_LAN_message_type <= w_to_LAN_message_type;
            r_to_LAN_message_data <= w_to_LAN_message_data;
            r_to_LAN_wstrb <= w_to_LAN_wstrb;
            r_to_LAN_requestor_tid <= w_to_LAN_requestor_tid;
            r_to_LAN_requestor_ip <= w_to_LAN_requestor_ip;
            r_to_LAN_requestor_ctid <= w_to_LAN_requestor_CTID;
        end
    end

    // Read destination address and TDEST from BRAM
    always_comb begin
        w_to_LAN_address = 0;
        w_to_LAN_tdest = 0;
        w_to_LAN_tuser = 0;
        // Reset in IDLE
        if (r_core_state == STATE_IDLE) begin
            w_to_LAN_address = 0;
            w_to_LAN_tdest = 0;
            w_to_LAN_tuser = 0;
        end
        else if (r_core_state == STATE_FETCH_DESTINATION) begin
            w_to_LAN_address = to_register_address_ROM_DOUT[AXIS_LAN_ADDR_WIDTH-1:0];
            w_to_LAN_tdest = to_tdest_ROM_DOUT[AXIS_LAN_TDEST_WIDTH:1];
            w_to_LAN_tuser = (w_tdest_is_infra == 1) ? AXIS_LAN_PORT_INFRASTRUCTURE : AXIS_LAN_PORT_USER;
        end
        else begin
            w_to_LAN_address = r_to_LAN_address;
            w_to_LAN_tdest = r_to_LAN_tdest;
            w_to_LAN_tuser = r_to_LAN_tuser;
        end
    end
    always_ff @(posedge i_clk, negedge i_ap_rst_n) begin
        if (i_ap_rst_n == 0) begin
            r_to_LAN_address <= 0;
            r_to_LAN_tdest <= 0;
            r_to_LAN_tuser <= 0;
        end
        else begin
            r_to_LAN_address <= w_to_LAN_address;
            r_to_LAN_tdest <= w_to_LAN_tdest;
            r_to_LAN_tuser <= w_to_LAN_tuser;
        end
    end
endmodule