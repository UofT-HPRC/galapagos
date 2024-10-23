
module control_rx_network_bridge #(
    `include "ctrl_api_header_parameters.vh"
) (
    input i_clk,
    input i_ap_rst_n,
    input [IP_PORT_WIDTH-1:0] i_CTRL_KIP_port_number,
    // Input from Receptionist
    input from_receptionist_tvalid,
    output from_receptionist_tready,
    input [AXIS_DATA_WIDTH-1:0] from_receptionist_tdata,
    input [AXIS_KEEP_WIDTH-1:0] from_receptionist_tkeep,
    input [AXIS_RECEP_TDEST_WIDTH-1:0] from_receptionist_tdest, // Dest Port
    input [AXIS_RECEP_TUSER_WIDTH-1:0] from_receptionist_tuser, // Src Port and SRC IP
    input from_receptionist_tlast,
    // Output to Control
    output to_ctrl_tvalid,
    input to_ctrl_tready,
    output [AXIS_DATA_WIDTH-1:0] to_ctrl_tdata,
    output [AXIS_KEEP_WIDTH-1:0] to_ctrl_tkeep,
    output [AXIS_FROM_NB_TDEST_WIDTH-1:0] to_ctrl_tid,
    output [AXIS_FROM_NB_TDEST_WIDTH-1:0] to_ctrl_tdest,
    output [AXIS_FROM_NB_TUSER_WIDTH-1:0] to_ctrl_tuser,
    output to_ctrl_tlast
);
    // Parameters
    localparam STATE_IDLE = 0;
    localparam STATE_WAIT_FOR_LAN_PAYLOAD = 1;
    localparam STATE_SEND_TO_CTRL = 2;
    // Message Offsets
    `include "ctrl_api_message_parameters.vh"

    // Declarations
    logic [2:0] r_core_state;
    // Output to Control
    logic [AXIS_DATA_WIDTH-1:0] r_to_ctrl_tdata;
    logic [AXIS_KEEP_WIDTH-1:0] r_to_ctrl_tkeep;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] r_to_ctrl_tid;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] r_to_ctrl_tdest;
    // TUSER field
    logic [IP_ADDRESS_WIDTH-1:0] r_to_ctrl_tuser_src_ip;
    logic [IP_PORT_WIDTH-1:0] r_to_ctrl_tuser_dest_port;
    logic [IP_PORT_WIDTH-1:0] r_to_ctrl_tuser_src_port;
    
    // Assignments
    assign from_receptionist_tready = (r_core_state == STATE_IDLE || r_core_state == STATE_WAIT_FOR_LAN_PAYLOAD) ? 1 : 0;
    assign to_ctrl_tvalid = (r_core_state == STATE_SEND_TO_CTRL) ? 1 : 0;
    assign to_ctrl_tdata = r_to_ctrl_tdata;
    assign to_ctrl_tkeep = r_to_ctrl_tkeep;
    assign to_ctrl_tid = r_to_ctrl_tid;
    assign to_ctrl_tdest = r_to_ctrl_tdest;
    assign to_ctrl_tuser[IP_ADDRESS_WIDTH-1:0] = r_to_ctrl_tuser_src_ip;
    assign to_ctrl_tuser[AXIS_KIP_TUSER_DEST_PORT_OFFSET+:AXIS_KIP_TUSER_DEST_PORT_WIDTH] = r_to_ctrl_tuser_dest_port;
    assign to_ctrl_tuser[AXIS_KIP_TUSER_SRC_PORT_OFFSET+:AXIS_KIP_TUSER_SRC_PORT_WIDTH] = r_to_ctrl_tuser_src_port;
    assign to_ctrl_tlast = 1;

    // Core State FSM
    always_ff @(posedge i_clk, negedge i_ap_rst_n) begin
        if (i_ap_rst_n == 0) begin
            r_core_state <= STATE_IDLE;
        end
        else begin
            case (r_core_state)
                STATE_IDLE: begin
                    // Treat packet differently depending on if it's a KIP or Control port
                    if (from_receptionist_tvalid == 1) begin
                        r_core_state <= (from_receptionist_tdest == i_CTRL_KIP_port_number) ? STATE_SEND_TO_CTRL : STATE_WAIT_FOR_LAN_PAYLOAD;
                    end
                    else begin
                        r_core_state <= r_core_state;
                    end
                end
                STATE_WAIT_FOR_LAN_PAYLOAD: begin
                    r_core_state <= (from_receptionist_tvalid == 1) ? STATE_SEND_TO_CTRL : r_core_state;
                end
                STATE_SEND_TO_CTRL: begin
                    r_core_state <= (to_ctrl_tready == 1) ? STATE_IDLE : r_core_state;
                end
            endcase
        end
    end

    // Read packets from Receptionist
    always_ff @(posedge i_clk, negedge i_ap_rst_n) begin
        if (i_ap_rst_n == 0) begin
            r_to_ctrl_tdata <= 0;
            r_to_ctrl_tkeep <= 0;
            r_to_ctrl_tid <= 0;
            r_to_ctrl_tdest <= 0;
            r_to_ctrl_tuser_src_ip <= 0;
            r_to_ctrl_tuser_dest_port <= 0;
            r_to_ctrl_tuser_src_port <= 0;
        end
        else if (r_core_state == STATE_IDLE && from_receptionist_tvalid == 1) begin
            // Case 1: Incoming packet is a KIP packet. Send it on to destination
            if (from_receptionist_tdest == i_CTRL_KIP_port_number) begin
                r_to_ctrl_tdata <= from_receptionist_tdata;
                r_to_ctrl_tkeep <= from_receptionist_tkeep;
                // Extract TID and TDEST from packet data
                r_to_ctrl_tid <= from_receptionist_tdata[AXIS_KIP_SENDER_TID_OFFSET+:AXIS_KIP_SENDER_TID_WIDTH];
                r_to_ctrl_tdest <= from_receptionist_tdata[AXIS_KIP_TID_OFFSET+:AXIS_KIP_TID_WIDTH];
                r_to_ctrl_tuser_src_ip <= from_receptionist_tuser[IP_ADDRESS_WIDTH-1:0];
                r_to_ctrl_tuser_dest_port <= from_receptionist_tdest;
                r_to_ctrl_tuser_src_port <= from_receptionist_tuser[AXIS_KIP_TUSER_SRC_PORT_OFFSET+:AXIS_KIP_TUSER_SRC_PORT_WIDTH];
            end
            // Case 2: Incoming packet is a LAN packet. Only the LAN packet header will have arrived, containing TID, TDEST, TUSER
            else begin
                r_to_ctrl_tdata <= 0;
                r_to_ctrl_tkeep <= 0;
                r_to_ctrl_tid <= from_receptionist_tdata[AXIS_LAN_HDR_TID_OFFSET+:AXIS_LAN_HDR_TID_WIDTH];
                r_to_ctrl_tdest <= from_receptionist_tdata[AXIS_LAN_HDR_TDEST_OFFSET+:AXIS_LAN_HDR_TDEST_WIDTH];
                r_to_ctrl_tuser_src_ip <= 0;
                r_to_ctrl_tuser_dest_port <= 0;
                r_to_ctrl_tuser_src_port <= 0;
            end
        end
        // Clear data while waiting in IDLE
        else if (r_core_state == STATE_IDLE) begin
            r_to_ctrl_tdata <= 0;
            r_to_ctrl_tkeep <= 0;
            r_to_ctrl_tid <= 0;
            r_to_ctrl_tdest <= 0;
            r_to_ctrl_tuser_src_ip <= 0;
            r_to_ctrl_tuser_dest_port <= 0;
            r_to_ctrl_tuser_src_port <= 0;
        end
        // For LAN packets, payload comes in the packet 2.
        else if (r_core_state == STATE_WAIT_FOR_LAN_PAYLOAD && from_receptionist_tvalid == 1) begin
            r_to_ctrl_tdata <= from_receptionist_tdata;
            r_to_ctrl_tkeep <= from_receptionist_tkeep;
            r_to_ctrl_tid <= r_to_ctrl_tid;
            r_to_ctrl_tdest <= r_to_ctrl_tdest;
            // TUSER
            r_to_ctrl_tuser_src_ip <= from_receptionist_tuser[IP_ADDRESS_WIDTH-1:0];
            r_to_ctrl_tuser_dest_port <= from_receptionist_tdest;
            r_to_ctrl_tuser_src_port <= from_receptionist_tuser[AXIS_KIP_TUSER_SRC_PORT_OFFSET+:AXIS_KIP_TUSER_SRC_PORT_WIDTH];
        end
        else begin
            r_to_ctrl_tdata <= r_to_ctrl_tdata;
            r_to_ctrl_tkeep <= r_to_ctrl_tkeep;
            r_to_ctrl_tid <= r_to_ctrl_tid;
            r_to_ctrl_tdest <= r_to_ctrl_tdest;
            r_to_ctrl_tuser_src_ip <= r_to_ctrl_tuser_src_ip;
            r_to_ctrl_tuser_dest_port <= r_to_ctrl_tuser_dest_port;
            r_to_ctrl_tuser_src_port <= r_to_ctrl_tuser_src_port;
        end
    end
endmodule