module network_to_axi_lite_converter #(
    parameter AXI_LITE_WSTRB_ENABLED = 1, // 1 means enabled, 0 means disabled
    parameter REQUEST_BUFFER_CAPACITY = 64, // Number of entries the request buffer can store
    `include "ctrl_api_header_parameters.vh"
) (
    input logic i_clk,
    input logic i_ap_rst_n,
    input [AXIS_LAN_TDEST_WIDTH-1:0] i_kernel_id,
    input [IP_PORT_WIDTH-1:0] i_KIP_port_number, // The port number used to identify that packets are KIP packets
    // AXI-Lite Write Address Interface
    output logic M_AXIL_awvalid,
    input logic M_AXIL_awready,
    output logic [AXI_LITE_ADDR_WIDTH-1:0] M_AXIL_awaddr,
    // AXI-Lite Write Data Interface
    output logic M_AXIL_wvalid,
    input logic M_AXIL_wready,
    output logic [AXI_LITE_DATA_WIDTH-1:0] M_AXIL_wdata,
    output [AXI_LITE_WSTRB_WIDTH-1:0] M_AXIL_wstrb,
    // AXI-Lite Write Response Interface
    input logic M_AXIL_bvalid,
    output logic M_AXIL_bready,
    input logic [AXI_LITE_BRESP_WIDTH-1:0] M_AXIL_bresp,
    // AXI-Lite Read Address Interface
    output logic M_AXIL_arvalid,
    input logic M_AXIL_arready,
    output logic [AXI_LITE_ADDR_WIDTH-1:0] M_AXIL_araddr,
    // AXI-Lite Read Data Interface
    input logic M_AXIL_rvalid,
    output logic M_AXIL_rready,
    input logic [AXI_LITE_DATA_WIDTH-1:0] M_AXIL_rdata,
    // AXI-Stream to-LAN Interface
    output to_LAN_tvalid,
    input to_LAN_tready,
    output [AXIS_DATA_WIDTH-1:0] to_LAN_tdata,
    output [AXIS_KEEP_WIDTH-1:0] to_LAN_tkeep,
    output [AXIS_LAN_TDEST_WIDTH-1:0] to_LAN_tid,
    output [AXIS_LAN_TDEST_WIDTH-1:0] to_LAN_tdest,
    output [AXIS_LAN_TUSER_WIDTH-1:0] to_LAN_tuser,
    output to_LAN_tlast,
    // AXI-Stream to-KnownIP Interface
    output to_KIP_tvalid,
    input to_KIP_tready,
    output [AXIS_DATA_WIDTH-1:0] to_KIP_tdata,
    output [AXIS_KEEP_WIDTH-1:0] to_KIP_tkeep,
    output [AXIS_KIP_TUSER_WIDTH-1:0] to_KIP_tuser,
    output to_KIP_tlast,
    // AXI-Stream from-Network-Bridge Interface
    input from_network_bridge_tvalid,
    output from_network_bridge_tready,
    input [AXIS_DATA_WIDTH-1:0] from_network_bridge_tdata,
    input [AXIS_KEEP_WIDTH-1:0] from_network_bridge_tkeep,
    input [AXIS_FROM_NB_TDEST_WIDTH-1:0] from_network_bridge_tid,
    input [AXIS_FROM_NB_TDEST_WIDTH-1:0] from_network_bridge_tdest,
    input [AXIS_FROM_NB_TUSER_WIDTH-1:0] from_network_bridge_tuser,
    input from_network_bridge_tlast,
    // AXI-Stream connection to request buffer
    output to_request_buffer_tvalid,
    input to_request_buffer_tready,
    output [AXIS_DATA_WIDTH-1:0] to_request_buffer_tdata,
    output [AXIS_KEEP_WIDTH-1:0] to_request_buffer_tkeep,
    output [AXIS_FROM_NB_TDEST_WIDTH-1:0] to_request_buffer_tid,
    output [AXIS_FROM_NB_TDEST_WIDTH-1:0] to_request_buffer_tdest,
    output [AXIS_FROM_NB_TUSER_WIDTH-1:0] to_request_buffer_tuser,
    output to_request_buffer_tlast,
    // AXI-Stream connection from request buffer
    input from_request_buffer_tvalid,
    output from_request_buffer_tready,
    input [AXIS_DATA_WIDTH-1:0] from_request_buffer_tdata,
    input [AXIS_KEEP_WIDTH-1:0] from_request_buffer_tkeep,
    input [AXIS_FROM_NB_TDEST_WIDTH-1:0] from_request_buffer_tid,
    input [AXIS_FROM_NB_TDEST_WIDTH-1:0] from_request_buffer_tdest,
    input [AXIS_FROM_NB_TUSER_WIDTH-1:0] from_request_buffer_tuser,
    input from_request_buffer_tlast
);

    // Parameters
    // FSM States
    localparam STATE_IDLE = 0;
    localparam STATE_M_AXIL_WRITE = 1;
    localparam STATE_M_AXIL_WAIT_AWADDR = 2;
    localparam STATE_M_AXIL_WAIT_WDATA = 3;
    localparam STATE_M_AXIL_READ = 4;
    localparam STATE_M_AXIL_WAIT_BRESP = 5;
    localparam STATE_M_AXIL_WAIT_RDATA = 6;
    localparam STATE_PREP_TO_LAN = 7;
    localparam STATE_SEND_TO_LAN = 8;
    localparam STATE_PREP_TO_KIP = 9;
    localparam STATE_SEND_TO_KIP = 10;
    // Message Types
    `include "ctrl_api_message_parameters.vh"
    // Other
    localparam REQUEST_BUFFER_OCCUPANCY_WIDTH = $clog2(REQUEST_BUFFER_CAPACITY);

    // Declarations
    logic [4:0] r_core_state;
    logic [REQUEST_BUFFER_OCCUPANCY_WIDTH-1:0] r_request_buffer_occupancy;
    // The module needs to know where to go after sending a MSG_BUSY. Therefore, track some metadata
    logic [4:0] r_previous_state;
    logic r_must_send_busy_message;
    logic [AXIS_LAN_TDEST_WIDTH-1:0] r_busy_message_tdest;
    logic [IP_ADDRESS_WIDTH-1:0] r_busy_message_dest_ip;    
    logic r_m_axil_awaddr_was_read;
    logic r_m_axil_wdata_was_read;
    logic r_m_axil_araddr_was_read;
    logic r_m_axil_bresp_arrived;
    logic r_m_axil_rdata_arrived;
    // M_AXI-Lite
    logic [AXI_LITE_ADDR_WIDTH-1:0] r_m_axil_awaddr;
    logic [AXI_LITE_DATA_WIDTH-1:0] r_m_axil_wdata;
    logic [AXI_LITE_WSTRB_WIDTH-1:0] r_m_axil_wstrb;
    logic [AXI_LITE_BRESP_WIDTH-1:0] r_m_axil_bresp;
    logic [AXI_LITE_ADDR_WIDTH-1:0] r_m_axil_araddr;
    logic [AXI_LITE_DATA_WIDTH-1:0] r_m_axil_rdata;
    logic [AXIS_LAN_TDEST_WIDTH-1:0] r_m_axil_tid;
    // AXI-Stream to-LAN
    logic [AXIS_LAN_MSG_TYPE_WIDTH-1:0] r_to_LAN_message_type;
    logic [AXIS_LAN_DATA_WIDTH-1:0] r_to_LAN_message_data;
    logic [AXIS_LAN_TDEST_WIDTH-1:0] r_to_LAN_tdest;
    // AXI-Stream to-KnownIP
    logic [AXIS_KIP_MSG_TYPE_WIDTH-1:0] r_to_KIP_message_type;
    logic [AXIS_KIP_DATA_WIDTH-1:0] r_to_KIP_message_data;
    logic [AXIS_KIP_TID_WIDTH-1:0] r_to_KIP_requestor_tid;
    logic [IP_ADDRESS_WIDTH-1:0] r_to_KIP_tuser_dest_IP_addr;
    logic [AXIS_KIP_TUSER_SRC_PORT_WIDTH-1:0] r_to_KIP_tuser_src_port;
    logic [AXIS_KIP_TUSER_DEST_PORT_WIDTH-1:0] r_to_KIP_tuser_dest_port;
    // Store Requestor TID and IP Address for forwarded packets
    logic [AXIS_LAN_TDEST_WIDTH-1:0] r_requestor_tid;
    logic [IP_ADDRESS_WIDTH-1:0] r_requestor_ip_address;
    logic [AXIS_WAN_TDEST_WIDTH-1:0] r_requestor_ctid;
    // Other
    logic [MSG_TYPE_WIDTH-1:0] w_from_network_bridge_msg_type;
    logic [MSG_TYPE_WIDTH-1:0] w_from_request_buffer_msg_type;
    logic w_m_axil_is_from_gateway; // Tracks whether M_AXIL request came from the gateway or from a local kernel in the same LAN
    logic w_from_nb_tdata_is_from_gateway; // Tracks whether the message currently on the from_nb channel is from the gateway
    logic w_must_send_busy_message; // Indicates whether we need to send a MSG_BUSY response in the next cycle
    logic w_current_state_forbids_nb_reads; // Not every state allows for NB reads
    logic w_current_state_allows_nb_reads;

    // Assignments
    // M_AXI-Lite Interface
    assign M_AXIL_awvalid = ((r_core_state == STATE_M_AXIL_WRITE || r_core_state == STATE_M_AXIL_WAIT_AWADDR) ? 1 : 0);
    assign M_AXIL_awaddr = r_m_axil_awaddr;
    assign M_AXIL_wvalid = ((r_core_state == STATE_M_AXIL_WRITE || r_core_state == STATE_M_AXIL_WAIT_WDATA) ? 1 : 0);
    assign M_AXIL_wdata = r_m_axil_wdata;
    assign M_AXIL_wstrb = r_m_axil_wstrb;
    assign M_AXIL_arvalid = (r_core_state == STATE_M_AXIL_READ ? 1 : 0);
    assign M_AXIL_araddr = r_m_axil_araddr;
    assign M_AXIL_bready = (r_core_state == STATE_M_AXIL_WAIT_BRESP ? 1 : 0);
    assign M_AXIL_rready = (r_core_state == STATE_M_AXIL_WAIT_RDATA ? 1 : 0);
    // to-LAN Interface
    assign to_LAN_tvalid = (r_core_state == STATE_SEND_TO_LAN ? 1 : 0);
    // to-LAN TDATA channel
    assign to_LAN_tdata[AXIS_LAN_MSG_TYPE_WIDTH-1:0] = r_to_LAN_message_type;
    assign to_LAN_tdata[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] = r_to_LAN_message_data;
    assign to_LAN_tdata[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] = 0; // Only send responses
    assign to_LAN_tdata[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] = 0; // Only send Responses
    assign to_LAN_tdata[AXIS_DATA_WIDTH-1:(AXIS_LAN_WSTRB_OFFSET+AXIS_LAN_WSTRB_WIDTH)] = 0;
    assign to_LAN_tkeep = 'hFFFFFFFFFFFFFFFF;
    assign to_LAN_tid = i_kernel_id;
    assign to_LAN_tdest = r_to_LAN_tdest;
    assign to_LAN_tuser = 1; // Indicates that this is a control message
    assign to_LAN_tlast = 1;
    // to-KnownIP Interface
    assign to_KIP_tvalid = (r_core_state == STATE_SEND_TO_KIP ? 1 : 0);
    // to-KnownIP TDATA channel
    assign to_KIP_tdata[AXIS_KIP_MSG_TYPE_WIDTH-1:0] = r_to_KIP_message_type;
    assign to_KIP_tdata[AXIS_KIP_DATA_OFFSET+:AXIS_KIP_DATA_WIDTH] = r_to_KIP_message_data;
    assign to_KIP_tdata[AXIS_KIP_TID_OFFSET+:AXIS_KIP_TID_WIDTH] = r_to_KIP_requestor_tid;
    assign to_KIP_tdata[AXIS_KIP_SENDER_TID_OFFSET+:AXIS_KIP_SENDER_TID_WIDTH] = i_kernel_id;
    assign to_KIP_tdata[AXIS_KIP_CTDEST_OFFSET+:AXIS_KIP_CTDEST_WIDTH] = r_requestor_ctid;
    assign to_KIP_tdata[AXIS_DATA_WIDTH-1:(AXIS_KIP_CTDEST_OFFSET+AXIS_KIP_CTDEST_WIDTH)] = 0;
    assign to_KIP_tkeep = 'hFFFFFFFFFFFFFFFF;
    // to-KnownIP TUSER channel
    assign to_KIP_tuser[IP_ADDRESS_WIDTH-1:0] = r_to_KIP_tuser_dest_IP_addr;
    assign to_KIP_tuser[AXIS_KIP_TUSER_SRC_PORT_OFFSET+:AXIS_KIP_TUSER_SRC_PORT_WIDTH] = r_to_KIP_tuser_src_port;
    assign to_KIP_tuser[AXIS_KIP_TUSER_DEST_PORT_OFFSET+:AXIS_KIP_TUSER_DEST_PORT_WIDTH] = r_to_KIP_tuser_dest_port;
    assign to_KIP_tlast = 1;
    // From-Network-Bridge Interface
    // Network Bridge interface is almost always on, except for the following:
    // 1. In STATE_IDLE, if the buffer is not-empty, prioritize the buffer
    // 2. When prepping or sending to LAN
    // 3. When prepping or sending to KIP
    assign from_network_bridge_tready = ((r_core_state == STATE_IDLE && r_request_buffer_occupancy > 0) 
                                      || w_current_state_forbids_nb_reads == 1
                                      ) ? 0 : 1;
    // to-Request-Buffer Interface
    // Only external requests coming from the network bridge will be written to the request buffer
    assign to_request_buffer_tvalid = (r_core_state != STATE_IDLE
                                    && w_current_state_allows_nb_reads == 1
                                    && from_network_bridge_tvalid == 1
                                    && r_request_buffer_occupancy < REQUEST_BUFFER_CAPACITY
                                    ) ? 1 : 0;
    assign to_request_buffer_tdata = from_network_bridge_tdata;
    assign to_request_buffer_tkeep = from_network_bridge_tkeep;
    assign to_request_buffer_tid = from_network_bridge_tid;
    assign to_request_buffer_tdest = from_network_bridge_tdest;
    assign to_request_buffer_tuser = from_network_bridge_tuser;
    assign to_request_buffer_tlast = from_network_bridge_tlast;
    // from-Request-Buffer Interface
    assign from_request_buffer_tready = (r_core_state == STATE_IDLE && r_request_buffer_occupancy > 0) ? 1 : 0; 
    // Other
    assign w_from_network_bridge_msg_type = from_network_bridge_tdata[MSG_TYPE_WIDTH-1:0];
    assign w_from_request_buffer_msg_type = from_request_buffer_tdata[MSG_TYPE_WIDTH-1:0];
    assign w_m_axil_is_from_gateway = (r_requestor_tid != 0) ? 1 : 0; // Forwarded LAN requests will have requestor TID field filled out, whereas direct LAN requests will leave that field blank (there is no kernel 0)
    assign w_from_nb_tdata_is_from_gateway = (from_network_bridge_tdata[AXIS_LAN_TID_OFFSET+:AXIS_LAN_TID_WIDTH] != 0) ? 1 : 0; // Forwarded LAN requests will have requestor TID field filled out, whereas direct LAN requests will leave that field blank (there is no kernel 0)
    // A MSG_BUSY response has to be sent if an incoming message has arrived, but the request buffer is full.
    assign w_must_send_busy_message = (from_network_bridge_tvalid == 1
                                    && r_request_buffer_occupancy == REQUEST_BUFFER_CAPACITY
                                    ) ? 1 : 0;
    assign w_current_state_forbids_nb_reads = (r_core_state == STATE_PREP_TO_LAN 
                                         || r_core_state == STATE_SEND_TO_LAN
                                         || r_core_state == STATE_PREP_TO_KIP 
                                         || r_core_state == STATE_SEND_TO_KIP
                                         ) ? 1 : 0;
    assign w_current_state_allows_nb_reads = (r_core_state != STATE_PREP_TO_LAN
                                           && r_core_state != STATE_SEND_TO_LAN
                                           && r_core_state != STATE_PREP_TO_KIP
                                           && r_core_state != STATE_SEND_TO_KIP
                                           ) ? 1 : 0;

    // Core State FSM
    always_ff @(posedge i_clk, negedge i_ap_rst_n) begin
        if (i_ap_rst_n == 0) begin
            r_core_state <= STATE_IDLE;
        end
        else begin
            case (r_core_state)
                STATE_IDLE: begin
                    // Buffered network requests have the highest priority
                    if (r_request_buffer_occupancy > 0) begin
                        if (from_request_buffer_tvalid == 1) begin
                            r_core_state <= (w_from_request_buffer_msg_type == MSG_WRITE) ? STATE_M_AXIL_WRITE : STATE_M_AXIL_READ;
                        end
                        else begin
                            r_core_state <= r_core_state;
                        end
                    end
                    else if (from_network_bridge_tvalid == 1) begin
                        r_core_state <= (w_from_network_bridge_msg_type == MSG_WRITE) ? STATE_M_AXIL_WRITE : STATE_M_AXIL_READ;
                    end
                end
                STATE_M_AXIL_WRITE: begin
                    // Sending MSG_BUSY takes priority
                    if (w_must_send_busy_message == 1) begin
                        r_core_state <= (w_from_nb_tdata_is_from_gateway == 1) ? STATE_PREP_TO_KIP : STATE_PREP_TO_LAN;
                    end
                    else if (M_AXIL_awready == 1 && M_AXIL_wready == 1) begin
                        r_core_state <= STATE_M_AXIL_WAIT_BRESP;
                    end
                    // If only address or data is sent, wait for the other.
                    else if (M_AXIL_awready == 1) begin
                        r_core_state <= STATE_M_AXIL_WAIT_WDATA;
                    end
                    else if (M_AXIL_wready == 1) begin
                        r_core_state <= STATE_M_AXIL_WAIT_AWADDR;
                    end
                    else begin
                        r_core_state <= r_core_state;
                    end
                end
                STATE_M_AXIL_WAIT_AWADDR: begin
                    // Sending MSG_BUSY takes priority
                    if (w_must_send_busy_message == 1) begin
                        r_core_state <= (w_from_nb_tdata_is_from_gateway == 1) ? STATE_PREP_TO_KIP : STATE_PREP_TO_LAN;
                    end
                    else begin
                        r_core_state <= (M_AXIL_awready == 1 ? STATE_M_AXIL_WAIT_BRESP : r_core_state);
                    end
                end
                STATE_M_AXIL_WAIT_WDATA: begin
                    // Sending MSG_BUSY takes priority
                    if (w_must_send_busy_message == 1) begin
                        r_core_state <= (w_from_nb_tdata_is_from_gateway == 1) ? STATE_PREP_TO_KIP : STATE_PREP_TO_LAN;
                    end
                    else begin
                        r_core_state <= (M_AXIL_wready == 1 ? STATE_M_AXIL_WAIT_BRESP : r_core_state);
                    end
                end
                STATE_M_AXIL_READ: begin
                    // Sending MSG_BUSY takes priority
                    if (w_must_send_busy_message == 1) begin
                        r_core_state <= (w_from_nb_tdata_is_from_gateway == 1) ? STATE_PREP_TO_KIP : STATE_PREP_TO_LAN;
                    end
                    else begin
                        r_core_state <= (M_AXIL_arready == 1 ? STATE_M_AXIL_WAIT_RDATA : r_core_state);
                    end
                end
                STATE_M_AXIL_WAIT_BRESP: begin
                    // Sending MSG_BUSY takes priority
                    if (w_must_send_busy_message == 1) begin
                        r_core_state <= (w_from_nb_tdata_is_from_gateway == 1) ? STATE_PREP_TO_KIP : STATE_PREP_TO_LAN;
                    end
                    else if (M_AXIL_bvalid == 1) begin
                        // If the request was forwarded from the gateway, send back directly to requestor
                        r_core_state <= (w_m_axil_is_from_gateway == 1) ? STATE_PREP_TO_KIP : STATE_PREP_TO_LAN;
                    end
                    else begin
                        r_core_state <= r_core_state;
                    end
                end
                STATE_M_AXIL_WAIT_RDATA: begin
                    // Sending MSG_BUSY takes priority
                    if (w_must_send_busy_message == 1) begin
                        r_core_state <= (w_from_nb_tdata_is_from_gateway == 1) ? STATE_PREP_TO_KIP : STATE_PREP_TO_LAN;
                    end
                    else if (M_AXIL_rvalid == 1) begin
                        // If the request was forwarded from the gateway, send back directly to requestor
                        r_core_state <= (w_m_axil_is_from_gateway == 1) ? STATE_PREP_TO_KIP : STATE_PREP_TO_LAN;
                    end
                    else begin
                        r_core_state <= r_core_state;
                    end
                end
                STATE_PREP_TO_LAN: begin
                    // Use this cycle to set the data on the to-LAN interface
                    r_core_state <= STATE_SEND_TO_LAN;
                end
                STATE_SEND_TO_LAN: begin
                    if (to_LAN_tready == 1) begin
                        // Case 1: Just sent a busy message. Return to previous state, or advance to the next state in the process if data was received
                        if (r_to_LAN_message_type == MSG_BUSY) begin
                            case(r_previous_state)
                                STATE_M_AXIL_WRITE: begin
                                    if (r_m_axil_awaddr_was_read == 1
                                     && r_m_axil_wdata_was_read == 1) begin
                                        r_core_state <= STATE_M_AXIL_WAIT_BRESP;
                                    end
                                    else if (r_m_axil_awaddr_was_read == 1) begin
                                        r_core_state <= STATE_M_AXIL_WAIT_WDATA;
                                    end
                                    else if (r_m_axil_wdata_was_read == 1) begin
                                        r_core_state <= STATE_M_AXIL_WAIT_AWADDR;
                                    end
                                    else begin
                                        r_core_state <= STATE_M_AXIL_WRITE;
                                    end
                                end
                                STATE_M_AXIL_WAIT_AWADDR: begin
                                    r_core_state <= (r_m_axil_awaddr_was_read == 1) ? STATE_M_AXIL_WAIT_BRESP : STATE_M_AXIL_WAIT_AWADDR;
                                end
                                STATE_M_AXIL_WAIT_WDATA: begin
                                    r_core_state <= (r_m_axil_wdata_was_read == 1) ? STATE_M_AXIL_WAIT_BRESP : STATE_M_AXIL_WAIT_WDATA;
                                end
                                STATE_M_AXIL_READ: begin
                                    r_core_state <= (r_m_axil_araddr_was_read == 1) ? STATE_M_AXIL_WAIT_RDATA : STATE_M_AXIL_READ;
                                end
                                STATE_M_AXIL_WAIT_BRESP: begin
                                    // If BRESP was received before sending BUSY message, send it out
                                    if (r_m_axil_bresp_arrived == 1) begin
                                        r_core_state <= (w_m_axil_is_from_gateway == 1) ? STATE_PREP_TO_KIP : STATE_PREP_TO_LAN;
                                    end
                                    else begin
                                        r_core_state <= STATE_M_AXIL_WAIT_BRESP;
                                    end
                                end
                                STATE_M_AXIL_WAIT_RDATA: begin
                                    // If RDATA was received before sending BUSY message, send it out
                                    if (r_m_axil_rdata_arrived == 1) begin
                                        r_core_state <= (w_m_axil_is_from_gateway == 1) ? STATE_PREP_TO_KIP : STATE_PREP_TO_LAN;
                                    end
                                    else begin
                                        r_core_state <= STATE_M_AXIL_WAIT_RDATA;
                                    end
                                end
                            endcase
                        end
                        // Case 2: Remote performed AXIL_Write/Read, Control just transmitted a BRESP or RDATA. Transaction is complete.
                        else begin
                            r_core_state <= STATE_IDLE;
                        end
                    end
                    else begin
                        r_core_state <= r_core_state;
                    end
                end
                STATE_PREP_TO_KIP: begin
                    // Use this cycle to set the data on the to-KIP interface
                    r_core_state <= STATE_SEND_TO_KIP;
                end
                STATE_SEND_TO_KIP: begin
                    if (to_KIP_tready == 1) begin
                        // Case 1: Just sent a busy message. Return to previous state, or advance to the next state in the process if data was received
                        if (r_to_KIP_message_type == MSG_BUSY) begin
                            case(r_previous_state)
                                STATE_M_AXIL_WRITE: begin
                                    if (r_m_axil_awaddr_was_read == 1
                                     && r_m_axil_wdata_was_read == 1) begin
                                        r_core_state <= STATE_M_AXIL_WAIT_BRESP;
                                    end
                                    else if (r_m_axil_awaddr_was_read == 1) begin
                                        r_core_state <= STATE_M_AXIL_WAIT_WDATA;
                                    end
                                    else if (r_m_axil_wdata_was_read == 1) begin
                                        r_core_state <= STATE_M_AXIL_WAIT_AWADDR;
                                    end
                                    else begin
                                        r_core_state <= STATE_M_AXIL_WRITE;
                                    end
                                end
                                STATE_M_AXIL_WAIT_AWADDR: begin
                                    r_core_state <= (r_m_axil_awaddr_was_read == 1) ? STATE_M_AXIL_WAIT_BRESP : STATE_M_AXIL_WAIT_AWADDR;
                                end
                                STATE_M_AXIL_WAIT_WDATA: begin
                                    r_core_state <= (r_m_axil_wdata_was_read == 1) ? STATE_M_AXIL_WAIT_BRESP : STATE_M_AXIL_WAIT_WDATA;
                                end
                                STATE_M_AXIL_READ: begin
                                    r_core_state <= (r_m_axil_araddr_was_read == 1) ? STATE_M_AXIL_WAIT_RDATA : STATE_M_AXIL_READ;
                                end
                                STATE_M_AXIL_WAIT_BRESP: begin
                                    // If BRESP was received before sending BUSY message, send it out
                                    if (r_m_axil_bresp_arrived == 1) begin
                                        r_core_state <= (w_m_axil_is_from_gateway == 1) ? STATE_PREP_TO_KIP : STATE_PREP_TO_LAN;
                                    end
                                    else begin
                                        r_core_state <= STATE_M_AXIL_WAIT_BRESP;
                                    end
                                end
                                STATE_M_AXIL_WAIT_RDATA: begin
                                    // If RDATA was received before sending BUSY message, send it out
                                    if (r_m_axil_rdata_arrived == 1) begin
                                        r_core_state <= (w_m_axil_is_from_gateway == 1) ? STATE_PREP_TO_KIP : STATE_PREP_TO_LAN;
                                    end
                                    else begin
                                        r_core_state <= STATE_M_AXIL_WAIT_RDATA;
                                    end
                                end
                            endcase
                        end
                        // Case 2: Remote performed AXIL_Write/Read, Control just transmitted a BRESP or RDATA. Transaction is complete.
                        else begin
                            r_core_state <= STATE_IDLE;
                        end
                    end
                    else begin
                        r_core_state <= r_core_state;
                    end
                end
                default: begin
                    r_core_state <= r_core_state;
                end
            endcase
        end
    end

    // Store previous state, so we know whether the sent message is a busy response or a reply to a remote M_AXIL request
    always_ff @(posedge i_clk, negedge i_ap_rst_n) begin
        if (i_ap_rst_n == 0) begin
            r_previous_state <= STATE_IDLE;
        end
        else if (w_current_state_allows_nb_reads == 1) begin
            r_previous_state <= r_core_state;
        end
        else begin
            r_previous_state <= r_previous_state;
        end
    end

    // Send Messages over the to-LAN interface 
    always_ff @(posedge i_clk, negedge i_ap_rst_n) begin
        if (i_ap_rst_n == 0) begin
            r_to_LAN_message_type <= 0;
            r_to_LAN_message_data <= 0;
            r_to_LAN_tdest <= 0;
        end
        // Clear when IDLE
        else if (r_core_state == STATE_IDLE) begin
            r_to_LAN_message_type <= 0;
            r_to_LAN_message_data <= 0;
            r_to_LAN_tdest <= 0;
        end
        // to-LAN only gets set in PREP_TO_LAN state
        else if (r_core_state == STATE_PREP_TO_LAN) begin
            // Case 1: A BUSY message must be sent
            if (r_must_send_busy_message == 1) begin
                r_to_LAN_message_type <= MSG_BUSY;
                r_to_LAN_message_data <= 0;
                r_to_LAN_tdest <= r_busy_message_tdest;
            end
            // Case 2: Send BRESP back to write requestor
            else if (r_m_axil_bresp_arrived == 1) begin
                r_to_LAN_message_type <= MSG_BRESP;
                r_to_LAN_message_data[AXI_LITE_BRESP_WIDTH-1:0] <= r_m_axil_bresp;
                r_to_LAN_message_data[AXI_LITE_DATA_WIDTH-1:AXI_LITE_BRESP_WIDTH] <= 0;
                r_to_LAN_tdest <= r_m_axil_tid;
            end
            // Case 3: Send RDATA back to read requestor
            else if (r_m_axil_rdata_arrived == 1) begin
                r_to_LAN_message_type <= MSG_RDATA;
                r_to_LAN_message_data <= r_m_axil_rdata;
                r_to_LAN_tdest <= r_m_axil_tid;
            end
            // This isn't possible
            else begin
                r_to_LAN_message_type <= 0;
                r_to_LAN_message_data <= 0;
                r_to_LAN_tdest <= 0;
            end
        end
        else begin
            r_to_LAN_message_type <= r_to_LAN_message_type;
            r_to_LAN_message_data <= r_to_LAN_message_data;
            r_to_LAN_tdest <= r_to_LAN_tdest;
        end
    end

    // Send Messages over the to-KnownIP Interface
    always_ff @(posedge i_clk, negedge i_ap_rst_n) begin
        if (i_ap_rst_n == 0) begin
            r_to_KIP_message_type <= 0;
            r_to_KIP_message_data <= 0;
            r_to_KIP_requestor_tid <= 0;
            r_to_KIP_tuser_dest_IP_addr <= 0;
            r_to_KIP_tuser_src_port <= 0;
            r_to_KIP_tuser_dest_port <= 0;
        end
        // Case 1: Clear when idle
        else if (r_core_state == STATE_IDLE) begin
            r_to_KIP_message_type <= 0;
            r_to_KIP_message_data <= 0;
            r_to_KIP_requestor_tid <= 0;
            r_to_KIP_tuser_dest_IP_addr <= 0;
            r_to_KIP_tuser_src_port <= 0;
            r_to_KIP_tuser_dest_port <= 0;
        end
        // to-KIP only gets set in STATE_PREP_TO_KIP
        else if (r_core_state == STATE_PREP_TO_KIP) begin
            // Case 1: A BUSY message must be sent
            if (r_must_send_busy_message == 1) begin
                r_to_KIP_message_type <= MSG_BUSY;
                r_to_KIP_message_data <= 0;
                r_to_KIP_requestor_tid <= r_busy_message_tdest;
                r_to_KIP_tuser_dest_IP_addr <= r_busy_message_dest_ip;
                r_to_KIP_tuser_src_port <= i_KIP_port_number;
                r_to_KIP_tuser_dest_port <= i_KIP_port_number;
            end
            // Case 2: Send BRESP back to write requestor
            else if (r_m_axil_bresp_arrived == 1) begin
                r_to_KIP_message_type <= MSG_BRESP;
                r_to_KIP_message_data[AXI_LITE_BRESP_WIDTH-1:0] <= r_m_axil_bresp;
                r_to_KIP_message_data[AXI_LITE_DATA_WIDTH-1:AXI_LITE_BRESP_WIDTH] <= 0;
                r_to_KIP_requestor_tid <= r_requestor_tid;
                r_to_KIP_tuser_dest_IP_addr <= r_requestor_ip_address;
                r_to_KIP_tuser_src_port <= i_KIP_port_number;
                r_to_KIP_tuser_dest_port <= i_KIP_port_number;
            end
            // Case 3: Send RDATA back to read requestor
            else if (r_m_axil_rdata_arrived == 1) begin
                r_to_KIP_message_type <= MSG_RDATA;
                r_to_KIP_message_data <= r_m_axil_rdata;
                r_to_KIP_requestor_tid <= r_requestor_tid;
                r_to_KIP_tuser_dest_IP_addr <= r_requestor_ip_address;
                r_to_KIP_tuser_src_port <= i_KIP_port_number;
                r_to_KIP_tuser_dest_port <= i_KIP_port_number;
            end
            // This isn't possible
            else begin
                r_to_KIP_message_type <= 0;
                r_to_KIP_message_data <= 0;
                r_to_KIP_requestor_tid <= 0;
                r_to_KIP_tuser_dest_IP_addr <= 0;
                r_to_KIP_tuser_src_port <= 0;
                r_to_KIP_tuser_dest_port <= 0;
            end
        end
        else begin
            r_to_KIP_message_type <= r_to_KIP_message_type;
            r_to_KIP_message_data <= r_to_KIP_message_data;
            r_to_KIP_requestor_tid <= r_to_KIP_requestor_tid;
            r_to_KIP_tuser_dest_IP_addr <= r_to_KIP_tuser_dest_IP_addr;
            r_to_KIP_tuser_src_port <= r_to_KIP_tuser_src_port;
            r_to_KIP_tuser_dest_port <= r_to_KIP_tuser_dest_port;
        end
    end

    // Read remote AXI-Lite Read/Write requests from the network
    always_ff @(posedge i_clk, negedge i_ap_rst_n) begin
        if (i_ap_rst_n == 0) begin
            r_m_axil_awaddr <= 0;
            r_m_axil_wdata <= 0;
            r_m_axil_wstrb <= 'hF;            
            r_m_axil_araddr <= 0;
            r_m_axil_tid <= 0;
            r_requestor_tid <= 0;
            r_requestor_ip_address <= 0;
            r_requestor_ctid <= 0;
        end
        else if (r_core_state == STATE_IDLE) begin
            // Case 1: There are already buffered network requests
            if (r_request_buffer_occupancy > 0) begin
                if (from_request_buffer_tvalid == 1) begin
                    if (w_from_request_buffer_msg_type == MSG_WRITE) begin
                        // Strip kernel numbers from the register address
                        r_m_axil_awaddr <= from_request_buffer_tdata[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH];
                        r_m_axil_wdata <= from_request_buffer_tdata[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH];
                        r_m_axil_wstrb <= (AXI_LITE_WSTRB_ENABLED == 1) ? from_request_buffer_tdata[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] : 'hF;
                        r_m_axil_araddr <= 0;
                    end
                    else begin
                        // Strip kernel numbers from the register address
                        r_m_axil_araddr <= from_request_buffer_tdata[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH];
                        r_m_axil_awaddr <= 0;
                        r_m_axil_wdata <= 0;
                        r_m_axil_wstrb <= 0;
                    end
                    r_m_axil_tid <= from_request_buffer_tid;
                    // Read requestor TID and IP Address. If this is a forwarded LAN packet, these values will be non-zero
                    r_requestor_tid <= from_request_buffer_tdata[AXIS_LAN_TID_OFFSET+:AXIS_LAN_TID_WIDTH];
                    r_requestor_ip_address <= from_request_buffer_tdata[AXIS_LAN_IP_OFFSET+:AXIS_LAN_IP_WIDTH];
                    r_requestor_ctid <= from_request_buffer_tdata[AXIS_LAN_CTID_OFFSET+:AXIS_LAN_CTID_WIDTH];
                end
                else begin
                    r_m_axil_awaddr <= 0;
                    r_m_axil_wdata <= 0;
                    r_m_axil_wstrb <= 'hF;
                    r_m_axil_araddr <= 0;
                    r_m_axil_tid <= 0;
                    r_requestor_tid <= 0;
                    r_requestor_ip_address <= 0;
                    r_requestor_ctid <= 0;
                end
            end
            // Case 2: No buffered requests, so read from the network
            else if (from_network_bridge_tvalid == 1) begin
                if (w_from_network_bridge_msg_type == MSG_WRITE) begin
                    // Strip kernel numbers from the register address
                    r_m_axil_awaddr <= from_network_bridge_tdata[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH];
                    r_m_axil_wdata <= from_network_bridge_tdata[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH];
                    r_m_axil_wstrb <= (AXI_LITE_WSTRB_ENABLED == 1) ? from_network_bridge_tdata[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] : 'hF;
                    r_m_axil_araddr <= 0;
                end
                else begin
                    // Strip kernel numbers from the register address
                    r_m_axil_araddr <= from_network_bridge_tdata[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH];
                    r_m_axil_awaddr <= 0;
                    r_m_axil_wdata <= 0;
                    r_m_axil_wstrb <= 0;
                end
                r_m_axil_tid <= from_network_bridge_tid;
                // Read requestor TID and IP Address. If this is a forwarded LAN packet, these values will be non-zero
                r_requestor_tid <= from_network_bridge_tdata[AXIS_LAN_TID_OFFSET+:AXIS_LAN_TID_WIDTH];
                r_requestor_ip_address <= from_network_bridge_tdata[AXIS_LAN_IP_OFFSET+:AXIS_LAN_IP_WIDTH];
                r_requestor_ctid <= from_network_bridge_tdata[AXIS_LAN_CTID_OFFSET+:AXIS_LAN_CTID_WIDTH];
            end
            else begin
                r_m_axil_awaddr <= 0;
                r_m_axil_wdata <= 0;
                r_m_axil_wstrb <= 'hF;
                r_m_axil_araddr <= 0;
                r_m_axil_tid <= 0;
                r_requestor_tid <= 0;
                r_requestor_ip_address <= 0;
                r_requestor_ctid <= 0;
           end
        end
        else begin
            r_m_axil_awaddr <= r_m_axil_awaddr;
            r_m_axil_wdata <= r_m_axil_wdata;
            r_m_axil_wstrb <= r_m_axil_wstrb;
            r_m_axil_araddr <= r_m_axil_araddr;
            r_m_axil_tid <= r_m_axil_tid;
            r_requestor_tid <= r_requestor_tid;
            r_requestor_ip_address <= r_requestor_ip_address;
            r_requestor_ctid <= r_requestor_ctid;
        end
    end

    // Track when AXI-Lite requests are read by the user
    always_ff @(posedge i_clk, negedge i_ap_rst_n) begin
        if (i_ap_rst_n == 0) begin
            r_m_axil_awaddr_was_read <= 0;
            r_m_axil_wdata_was_read <= 0;
            r_m_axil_araddr_was_read <= 0;
        end
        // Clear in IDLE
        else if (r_core_state <= STATE_IDLE) begin
            r_m_axil_awaddr_was_read <= 0;
            r_m_axil_wdata_was_read <= 0;
            r_m_axil_araddr_was_read <= 0;
        end
        // Case 1: AXIL Write
        else if (r_core_state <= STATE_M_AXIL_WRITE) begin
            r_m_axil_awaddr_was_read <= (M_AXIL_awready == 1) ? 1 : 0;
            r_m_axil_wdata_was_read <= (M_AXIL_wready == 1) ? 1 : 0;
            r_m_axil_araddr_was_read <= 0;
        end
        else if (r_core_state <= STATE_M_AXIL_WAIT_AWADDR && M_AXIL_awready == 1) begin
            r_m_axil_awaddr_was_read <= 1;
            r_m_axil_wdata_was_read <= 1;
            r_m_axil_araddr_was_read <= 0;
        end
        else if (r_core_state <= STATE_M_AXIL_WAIT_WDATA && M_AXIL_wready == 1) begin
            r_m_axil_awaddr_was_read <= 1;
            r_m_axil_wdata_was_read <= 1;
            r_m_axil_araddr_was_read <= 0;
        end
        // Case 2: AXIL Read
        else if (r_core_state <= STATE_M_AXIL_READ && M_AXIL_arready == 1) begin
            r_m_axil_awaddr_was_read <= 0;
            r_m_axil_wdata_was_read <= 0;
            r_m_axil_araddr_was_read <= 1;
        end
        else begin
            r_m_axil_awaddr_was_read <= r_m_axil_awaddr_was_read;
            r_m_axil_wdata_was_read <= r_m_axil_wdata_was_read;
            r_m_axil_araddr_was_read <= r_m_axil_araddr_was_read;
        end
    end

    // Read AXI-Lite responses from the user
    always_ff @(posedge i_clk, negedge i_ap_rst_n) begin
        if (i_ap_rst_n == 0) begin
            r_m_axil_bresp_arrived <= 0;
            r_m_axil_bresp <= 0;
            r_m_axil_rdata_arrived <= 0;
            r_m_axil_rdata <= 0;
        end
        // Reset in IDLE
        else if (r_core_state == STATE_IDLE) begin
            r_m_axil_bresp_arrived <= 0;
            r_m_axil_bresp <= 0;
            r_m_axil_rdata_arrived <= 0;
            r_m_axil_rdata <= 0;
        end
        // Case 1: Read BRESP
        else if (r_core_state == STATE_M_AXIL_WAIT_BRESP && M_AXIL_bvalid == 1) begin
            r_m_axil_bresp_arrived <= 1;
            r_m_axil_bresp <= M_AXIL_bresp;
            r_m_axil_rdata_arrived <= 0;
            r_m_axil_rdata <= 0;
        end
        // Case 2: Read RDATA
        else if (r_core_state == STATE_M_AXIL_WAIT_RDATA && M_AXIL_rvalid == 1) begin
            r_m_axil_bresp_arrived <= 0;
            r_m_axil_bresp <= 0;
            r_m_axil_rdata_arrived <= 1;
            r_m_axil_rdata <= M_AXIL_rdata;
        end
        else begin
            r_m_axil_bresp_arrived <= r_m_axil_bresp_arrived;
            r_m_axil_bresp <= r_m_axil_bresp;
            r_m_axil_rdata_arrived <= r_m_axil_rdata_arrived;
            r_m_axil_rdata <= r_m_axil_rdata;
        end
    end

    // Track the number of requests in the request buffer
    always_ff @(posedge i_clk, negedge i_ap_rst_n) begin
        if (i_ap_rst_n == 0) begin
            r_request_buffer_occupancy <= 0;
        end
        // Case 1: Core is now IDLE, but the buffer is non-empty. This means a remote message will be read from the buffer.
        else if (r_core_state == STATE_IDLE 
              && r_request_buffer_occupancy > 0
              && from_request_buffer_tvalid == 1) begin
            r_request_buffer_occupancy <= r_request_buffer_occupancy - 1;
        end
        // Case 2: Remote AXI-Lite Read/Write requests are received from the network during an operation in progress, store them into the buffer if buffer isn't full
        else if (r_core_state != STATE_IDLE 
              && r_request_buffer_occupancy < REQUEST_BUFFER_CAPACITY
              && from_network_bridge_tvalid == 1
              && from_network_bridge_tready == 1
              && to_request_buffer_tready == 1
              ) begin
            // Requests will only be stored if the buffer isn't already full. If the buffer is full, the MSG_BUSY will be sent instead
            r_request_buffer_occupancy <= r_request_buffer_occupancy + 1;
        end
        // Otherwise, do nothing
        else begin
            r_request_buffer_occupancy <= r_request_buffer_occupancy;
        end
    end

    // Track whether a busy message has to be sent. This signal is ignored in STATE_IDLE and STATE_PREP/SEND_to_LAN/KIP
    always_ff @(posedge i_clk, negedge i_ap_rst_n) begin
        if (i_ap_rst_n == 0) begin
            r_must_send_busy_message <= 0;
        end
        // The only places when a message could be read are not IDLE or LAN or KIP
        else if (r_core_state != STATE_IDLE
              && w_current_state_allows_nb_reads == 1) begin
            r_must_send_busy_message <= w_must_send_busy_message;
        end
        // Reset sending busy message if we just sent one
        else if (((r_core_state == STATE_SEND_TO_LAN && to_LAN_tready == 1)
              || (r_core_state == STATE_SEND_TO_KIP && to_KIP_tready == 1))
              && r_must_send_busy_message == 1) begin
            r_must_send_busy_message <= 0;
        end
        else begin
            r_must_send_busy_message <= r_must_send_busy_message;
        end
    end


    // When a busy message comes in, track the destination ID and IP
    always_ff @(posedge i_clk, negedge i_ap_rst_n) begin
        if (i_ap_rst_n == 0) begin
            r_busy_message_tdest <= 0;
            r_busy_message_dest_ip <= 0;
        end
        // Reset when IDLE or sending to LAN or KIP (not used here)
        else if (r_core_state == STATE_IDLE
              || w_current_state_forbids_nb_reads == 1) begin
            r_busy_message_tdest <= 0;
            r_busy_message_dest_ip <= 0;
        end
        // In all other states, receiving a message could result in sending a BUSY response
        else if (w_must_send_busy_message == 1) begin
            r_busy_message_tdest <= (w_from_nb_tdata_is_from_gateway == 1) ? from_network_bridge_tdata[AXIS_LAN_TID_OFFSET+:AXIS_LAN_TID_WIDTH] : from_network_bridge_tid;
            r_busy_message_dest_ip <= from_network_bridge_tdata[AXIS_LAN_IP_OFFSET+:AXIS_LAN_IP_WIDTH];
        end
        else begin
            r_busy_message_tdest <= r_busy_message_tdest;
            r_busy_message_dest_ip <= r_busy_message_dest_ip;
        end
    end
endmodule