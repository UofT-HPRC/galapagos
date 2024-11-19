// This module acts as an AXI-Lite subordinate, forwarding commands from AXI-Lite Managers over the network

module axi_lite_to_network_converter #(
    parameter AXI_LITE_WSTRB_ENABLED = 1, // 1 means enabled, 0 means disabled
    parameter BUSY_RESPONSE_PAUSE_DURATION = 1000, // Number of cycles to wait before retransmitting a request to a busy destination
    `include "ctrl_api_header_parameters.vh"
) (
    input i_clk,
    input i_ap_rst_n,
    input [AXIS_LAN_TDEST_WIDTH-1:0] i_kernel_id,
    input [IP_ADDRESS_WIDTH-1:0] i_kernel_ip_address, // In decimal form
    input [CLUSTER_ID_WIDTH-1:0] i_cluster_id,
    // Input AXI-Lite Write Address Interface
    input S_AXIL_awvalid,
    output S_AXIL_awready,
    input [AXI_LITE_ADDR_WIDTH-1:0] S_AXIL_awaddr,
    // Input AXI-Lite Write Data Interface
    input S_AXIL_wvalid,
    output S_AXIL_wready,
    input [AXI_LITE_DATA_WIDTH-1:0] S_AXIL_wdata,
    input [AXI_LITE_WSTRB_WIDTH-1:0] S_AXIL_wstrb,
    // Input AXI-Lite Write Response Interface
    output S_AXIL_bvalid,
    input S_AXIL_bready,
    output [AXI_LITE_BRESP_WIDTH-1:0] S_AXIL_bresp,
    // Input AXI-Lite Read Address Interface
    input S_AXIL_arvalid,
    output S_AXIL_arready,
    input [AXI_LITE_ADDR_WIDTH-1:0] S_AXIL_araddr,
    // Input AXI-Lite Read Data Interface
    output S_AXIL_rvalid,
    input S_AXIL_rready,
    output [AXI_LITE_DATA_WIDTH-1:0] S_AXIL_rdata,
    // AXI-Stream to-LAN Interface
    output to_LAN_tvalid,
    input to_LAN_tready,
    output [AXIS_DATA_WIDTH-1:0] to_LAN_tdata,
    output [AXIS_KEEP_WIDTH-1:0] to_LAN_tkeep,
    output [AXIS_LAN_TDEST_WIDTH-1:0] to_LAN_tid,
    output [AXIS_LAN_TDEST_WIDTH-1:0] to_LAN_tdest,
    output [AXIS_LAN_TUSER_WIDTH-1:0] to_LAN_tuser,
    output to_LAN_tlast,
    // AXI-Stream to-WAN Interface
    output to_WAN_tvalid,
    input to_WAN_tready,
    output [AXIS_DATA_WIDTH-1:0] to_WAN_tdata,
    output [AXIS_KEEP_WIDTH-1:0] to_WAN_tkeep,
    output [AXIS_WAN_TDEST_WIDTH-1:0] to_WAN_tdest,
    output [AXIS_WAN_TUSER_WIDTH-1:0] to_WAN_tuser,
    output to_WAN_tlast,
    // AXI-Stream from-Network-Bridge Interface
    input from_network_bridge_tvalid,
    output from_network_bridge_tready,
    input [AXIS_DATA_WIDTH-1:0] from_network_bridge_tdata,
    input [AXIS_KEEP_WIDTH-1:0] from_network_bridge_tkeep,
    input [AXIS_FROM_NB_TDEST_WIDTH-1:0] from_network_bridge_tid,
    input [AXIS_FROM_NB_TDEST_WIDTH-1:0] from_network_bridge_tdest,
    input [AXIS_FROM_NB_TUSER_WIDTH-1:0] from_network_bridge_tuser,
    input from_network_bridge_tlast
);

    // Parameters
    // FSM States
    localparam STATE_IDLE = 0;
    localparam STATE_S_AXIL_WAIT_AWADDR = 1;
    localparam STATE_S_AXIL_WAIT_WDATA = 2;
    localparam STATE_SEND_TO_LAN = 3;
    localparam STATE_SEND_TO_WAN = 4;
    localparam STATE_NETWORK_RESPONSE_WAIT = 7;
    localparam STATE_S_AXIL_SEND_BRESP = 8;
    localparam STATE_S_AXIL_SEND_READ_RETURN = 9;
    localparam STATE_PAUSE_BEFORE_RETRANSMISSION = 15;
    // Message Types
    `include "ctrl_api_message_parameters.vh"
    // Other
    localparam MAX_PAUSE_DURATION_WIDTH = $clog2(BUSY_RESPONSE_PAUSE_DURATION);

    // Declarations
    logic [4:0] r_core_state;
    logic [3:0] r_previous_state;
    logic [MAX_PAUSE_DURATION_WIDTH-1:0] r_current_pause_duration;
    // S_AXI-Lite
    logic [AXI_LITE_DATA_WIDTH-1:0] r_s_axil_wdata; // Used to store WDATA if it arrives before AWADDR
    logic [AXI_LITE_WSTRB_WIDTH-1:0] r_s_axil_wstrb; // Used to store WSTRB if it arrives before AWADDR
    logic [AXI_LITE_BRESP_WIDTH-1:0] r_s_axil_bresp;
    logic [AXI_LITE_DATA_WIDTH-1:0] r_s_axil_rdata;  
    // AXI-Stream to-LAN
    logic [AXIS_LAN_MSG_TYPE_WIDTH-1:0] r_to_LAN_message_type;
    logic [AXIS_LAN_DATA_WIDTH-1:0] r_to_LAN_message_data;
    logic [AXIS_LAN_ADDR_WIDTH-1:0] r_to_LAN_address;
    logic [AXIS_LAN_WSTRB_WIDTH-1:0] r_to_LAN_wstrb;
    logic [AXIS_LAN_TDEST_WIDTH-1:0] r_to_LAN_tdest;
    // AXI-Stream to-WAN
    logic [AXIS_WAN_MSG_TYPE_WIDTH-1:0] r_to_WAN_message_type;
    logic [AXIS_WAN_DATA_WIDTH-1:0] r_to_WAN_message_data;
    logic [AXIS_WAN_DEST_PORT_WIDTH-1:0] r_to_WAN_dest_port;
    logic [AXIS_WAN_CTDEST_WIDTH-1:0] r_to_WAN_ctdest;
    logic [AXIS_WAN_CREG_ADDR_WIDTH-1:0] r_to_WAN_creg_addr;
    logic [AXIS_WAN_WSTRB_WIDTH-1:0] r_to_WAN_wstrb;
    logic [AXIS_WAN_TID_WIDTH-1:0] r_to_WAN_requestor_tid;
    logic [AXIS_WAN_IP_WIDTH-1:0] r_to_WAN_requestor_ip_addr;
    // Other
    logic r_current_transaction_is_write; // tracks whether the current transaction is a read or write
    logic w_state_idle_and_network_idle; // Core is in STATE_IDLE and no remote packets have arrived
    logic [MSG_TYPE_WIDTH-1:0] w_from_network_bridge_msg_type;
    logic w_network_request_has_arrived;
    logic w_network_response_has_arrived;
    logic r_s_axil_write_is_wan; // Write address could appear at different cycle from data, so when address is read save if is_wan or not
    logic w_s_axil_write_is_wan; // Represents is_wan bit of the message on awaddr in the current cycle
    logic w_s_axil_read_is_wan;
    logic r_s_axil_message_is_wan; // Tracks whether the current S_AXIL READ/WRITE request being sent out is a WAN or LAN request
    logic w_from_nb_tdata_is_from_gateway; // Tracks whether the message currently on the from_nb channel is from the gateway
    logic [AXIS_WAN_TDEST_WIDTH-1:0] w_wan_read_ctdest; // Used to construct CTDEST from read address
    logic [AXIS_WAN_TUSER_WIDTH-1:0] w_wan_read_dest_port; // Used to construct destination port from read address
    logic [AXIL_MAX_CREG_ADDR_WIDTH-1:0] w_wan_read_creg_addr; // Used to construct cluster register address from read address
    logic [AXIS_WAN_TDEST_WIDTH-1:0] w_wan_write_ctdest; // Used to construct CTDEST from write address
    logic [AXIS_WAN_TUSER_WIDTH-1:0] w_wan_write_dest_port; // Used to construct destination port from write address
    logic [AXIL_MAX_CREG_ADDR_WIDTH-1:0] w_wan_write_creg_addr; // Used to construct cluster register address from write address

    // Assignments
    // S_AXI-Lite Interface
    assign S_AXIL_awready = (((r_core_state == STATE_IDLE && S_AXIL_arvalid == 0) || r_core_state == STATE_S_AXIL_WAIT_AWADDR) ? 1 : 0);
    assign S_AXIL_wready = (((r_core_state == STATE_IDLE && S_AXIL_arvalid == 0) || r_core_state == STATE_S_AXIL_WAIT_WDATA) ? 1 : 0);
    assign S_AXIL_bvalid = (r_core_state == STATE_S_AXIL_SEND_BRESP ? 1 : 0);
    assign S_AXIL_bresp = r_s_axil_bresp;
    assign S_AXIL_arready = (r_core_state == STATE_IDLE ? 1 : 0);
    assign S_AXIL_rvalid = (r_core_state == STATE_S_AXIL_SEND_READ_RETURN ? 1 : 0);
    assign S_AXIL_rdata = r_s_axil_rdata;
    // to-LAN Interface
    assign to_LAN_tvalid = (r_core_state == STATE_SEND_TO_LAN ? 1 : 0);
    // to-LAN TDATA channel
    assign to_LAN_tdata[AXIS_LAN_MSG_TYPE_WIDTH-1:0] = r_to_LAN_message_type;
    assign to_LAN_tdata[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] = r_to_LAN_message_data;
    assign to_LAN_tdata[AXIS_LAN_ADDR_OFFSET+:AXIS_LAN_ADDR_WIDTH] = r_to_LAN_address;
    assign to_LAN_tdata[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] = r_to_LAN_wstrb;
    assign to_LAN_tdata[AXIS_DATA_WIDTH-1:(AXIS_LAN_WSTRB_OFFSET+AXIS_LAN_WSTRB_WIDTH)] = 0;
    assign to_LAN_tkeep = 'hFFFFFFFFFFFFFFFF;
    assign to_LAN_tid = i_kernel_id;
    assign to_LAN_tdest = r_to_LAN_tdest;
    assign to_LAN_tuser = 1; // Indicates that this is a control message
    assign to_LAN_tlast = 1;
    // to-WAN Interface
    assign to_WAN_tvalid = (r_core_state == STATE_SEND_TO_WAN ? 1 : 0);
    // to-WAN TDATA channel
    assign to_WAN_tdata[AXIS_WAN_MSG_TYPE_WIDTH-1:0] = r_to_WAN_message_type;
    assign to_WAN_tdata[AXIS_WAN_DATA_OFFSET+:AXIS_WAN_DATA_WIDTH] = r_to_WAN_message_data;
    assign to_WAN_tdata[AXIS_WAN_DEST_PORT_OFFSET+:AXIS_WAN_DEST_PORT_WIDTH] = r_to_WAN_dest_port;
    assign to_WAN_tdata[AXIS_WAN_CTDEST_OFFSET+:AXIS_WAN_CTDEST_WIDTH] = r_to_WAN_ctdest;
    assign to_WAN_tdata[AXIS_WAN_CREG_ADDR_OFFSET+:AXIS_WAN_CREG_ADDR_WIDTH] = r_to_WAN_creg_addr;
    assign to_WAN_tdata[AXIS_WAN_WSTRB_OFFSET+:AXIS_WAN_WSTRB_WIDTH] = r_to_WAN_wstrb;
    assign to_WAN_tdata[AXIS_WAN_TID_OFFSET+:AXIS_WAN_TID_WIDTH] = r_to_WAN_requestor_tid;
    assign to_WAN_tdata[AXIS_WAN_IP_OFFSET+:AXIS_WAN_IP_WIDTH] = r_to_WAN_requestor_ip_addr;
    assign to_WAN_tdata[AXIS_WAN_CTID_OFFSET+:AXIS_WAN_CTID_WIDTH] = i_cluster_id;
    assign to_WAN_tdata[AXIS_DATA_WIDTH-1:(AXIS_WAN_CTID_OFFSET+AXIS_WAN_CTID_WIDTH)] = 0;
    assign to_WAN_tkeep = 'hFFFFFFFFFFFFFFFF;
    assign to_WAN_tdest = r_to_WAN_ctdest;
    assign to_WAN_tuser = r_to_WAN_dest_port;
    assign to_WAN_tlast = 1;
    // From-Network-Bridge Interface
    // Only read packets from the network bridge in one of 3 cases:
    // 1. In State IDLE, there are no outstanding buffer requests
    // 2. When waiting for a NETWORK response, a response is received
    // 3. When waiting for a network response, a request is received and the buffer is ready to receive data
    assign from_network_bridge_tready = (r_core_state == STATE_NETWORK_RESPONSE_WAIT
                                      && w_network_response_has_arrived
                                        ) ? 1 : 0;
    // Other
    assign w_state_idle_and_network_idle = ((r_core_state == STATE_IDLE && from_network_bridge_tvalid == 0) ? 1 : 0);
    assign w_from_network_bridge_msg_type = from_network_bridge_tdata[MSG_TYPE_WIDTH-1:0];
    assign w_network_request_has_arrived = (from_network_bridge_tvalid == 1 
                                          && (  w_from_network_bridge_msg_type == MSG_WRITE
                                             || w_from_network_bridge_msg_type == MSG_READ
                                            )) ? 1 : 0;
    assign w_network_response_has_arrived = (from_network_bridge_tvalid == 1 
                                          && (  w_from_network_bridge_msg_type == MSG_BRESP
                                             || w_from_network_bridge_msg_type == MSG_RDATA
                                             || w_from_network_bridge_msg_type == MSG_BUSY
                                            )) ? 1 : 0;
    // Bit 0 of AXI-Lite addresses indicates if the destination address is a cluster or kernel ID
    assign w_s_axil_write_is_wan = S_AXIL_awaddr[AXIL_IS_WAN_OFFSET];
    assign w_s_axil_read_is_wan = S_AXIL_araddr[AXIL_IS_WAN_OFFSET];
    assign w_from_nb_tdata_is_from_gateway = (from_network_bridge_tdata[AXIS_LAN_TID_OFFSET+:AXIS_LAN_TID_WIDTH] != 0) ? 1 : 0; // Forwarded LAN requests will have requestor TID field filled out, whereas direct LAN requests will leave that field blank (there is no kernel 0)
    // Reconstruct ctdest and destination ports
    // CTDEST Cluster ID based on WAN Read Address
    assign w_wan_read_ctdest[AXIL_WAN_BASE_CTDEST_WIDTH-1:0] = S_AXIL_araddr[AXIL_WAN_BASE_CTDEST_OFFSET+:AXIL_WAN_BASE_CTDEST_WIDTH];
    generate
        if (AXIL_EXTENDED_CTDEST_EXISTS == 1) begin
            assign w_wan_read_ctdest[AXIL_WAN_BASE_CTDEST_WIDTH+:AXIL_WAN_EXTENDED_CTDEST_WIDTH] = S_AXIL_araddr[AXIL_WAN_EXTENDED_CTDEST_OFFSET+:AXIL_WAN_EXTENDED_CTDEST_WIDTH];
            // If Extended Width does not fill AXIS_WAN_CTDEST, pad with zero's
            if (AXIL_WAN_EXTENDED_CTDEST_WIDTH != AXIL_MAX_EXTENDED_CTDEST_WIDTH) begin
                assign w_wan_read_ctdest[AXIS_WAN_TDEST_WIDTH-1:(AXIL_WAN_BASE_CTDEST_WIDTH+AXIL_WAN_EXTENDED_CTDEST_WIDTH)] = 0;
            end
        end
        else begin
            assign w_wan_read_ctdest[AXIS_WAN_TDEST_WIDTH-1:AXIL_WAN_BASE_CTDEST_WIDTH] = 0;
        end
    endgenerate
    // Destination Port based on WAN Read Address
    assign w_wan_read_dest_port[AXIL_WAN_BASE_PORT_WIDTH-1:0] = S_AXIL_araddr[AXIL_WAN_BASE_PORT_OFFSET+:AXIL_WAN_BASE_PORT_WIDTH];
    generate
        if (AXIL_EXTENDED_PORT_EXISTS) begin
            assign w_wan_read_dest_port[IP_PORT_WIDTH-1] = S_AXIL_araddr[AXIL_WAN_EXTENDED_PORT_OFFSET];
        end
        else begin
            assign w_wan_read_dest_port[IP_PORT_WIDTH-1] = 1;
        end
    endgenerate
    // Cluster Register Address based on WAN Read Address
    generate
        if (AXIL_CREG_ADDR_EXISTS == 1) begin
            assign w_wan_read_creg_addr[AXIL_CREG_ADDR_WIDTH-1:0] = S_AXIL_araddr[AXIL_CREG_ADDR_OFFSET+:AXIL_CREG_ADDR_WIDTH];
            // If Cluster Address Width does not fill full Cluster Reg Address, pad with zero's
            if (AXIL_CREG_ADDR_WIDTH != AXIL_MAX_CREG_ADDR_WIDTH) begin
                assign w_wan_read_creg_addr[AXIL_MAX_CREG_ADDR_WIDTH-1:AXIL_CREG_ADDR_WIDTH] = 0;
            end
        end
        else begin
            assign w_wan_read_creg_addr = 0;
        end
    endgenerate
    // CTDEST Cluster ID based on WAN Write Address
    assign w_wan_write_ctdest[AXIL_WAN_BASE_CTDEST_WIDTH-1:0] = S_AXIL_awaddr[AXIL_WAN_BASE_CTDEST_OFFSET+:AXIL_WAN_BASE_CTDEST_WIDTH];
    generate
        if (AXIL_EXTENDED_CTDEST_EXISTS == 1) begin
            assign w_wan_write_ctdest[AXIL_WAN_BASE_CTDEST_WIDTH+:AXIL_WAN_EXTENDED_CTDEST_WIDTH] = S_AXIL_awaddr[AXIL_WAN_EXTENDED_CTDEST_OFFSET+:AXIL_WAN_EXTENDED_CTDEST_WIDTH];
            // If Extended Width does not fill AXIS_WAN_CTDEST, pad with zero's
            if (AXIL_WAN_EXTENDED_CTDEST_WIDTH != AXIL_MAX_EXTENDED_CTDEST_WIDTH) begin
                assign w_wan_write_ctdest[AXIS_WAN_TDEST_WIDTH-1:(AXIL_WAN_BASE_CTDEST_WIDTH+AXIL_WAN_EXTENDED_CTDEST_WIDTH)] = 0;
            end
        end
        else begin
            assign w_wan_write_ctdest[AXIS_WAN_TDEST_WIDTH-1:AXIL_WAN_BASE_CTDEST_WIDTH] = 0;
        end
    endgenerate
    // Destination Port based on WAN Write Address
    assign w_wan_write_dest_port[AXIL_WAN_BASE_PORT_WIDTH-1:0] = S_AXIL_awaddr[AXIL_WAN_BASE_PORT_OFFSET+:AXIL_WAN_BASE_PORT_WIDTH];
    generate
        if (AXIL_EXTENDED_PORT_EXISTS) begin
            assign w_wan_write_dest_port[IP_PORT_WIDTH-1] = S_AXIL_awaddr[AXIL_WAN_EXTENDED_PORT_OFFSET];
        end
        else begin
            assign w_wan_write_dest_port[IP_PORT_WIDTH-1] = 1;
        end
    endgenerate
    // Cluster Register Address based on WAN Write Address
    generate
        if (AXIL_CREG_ADDR_EXISTS == 1) begin
            assign w_wan_write_creg_addr[AXIL_CREG_ADDR_WIDTH-1:0] = S_AXIL_awaddr[AXIL_CREG_ADDR_OFFSET+:AXIL_CREG_ADDR_WIDTH];
            // If Cluster Address Width does not fill full Cluster Reg Address, pad with zero's
            if (AXIL_CREG_ADDR_WIDTH != AXIL_MAX_CREG_ADDR_WIDTH) begin
                assign w_wan_write_creg_addr[AXIL_MAX_CREG_ADDR_WIDTH-1:AXIL_CREG_ADDR_WIDTH] = 0;
            end
        end
        else begin
            assign w_wan_write_creg_addr = 0;
        end
    endgenerate

    // Core State FSM
    always_ff @(posedge i_clk, negedge i_ap_rst_n) begin
        if (i_ap_rst_n == 0) begin
            r_core_state <= STATE_IDLE;
        end
        else begin
            case (r_core_state)
                STATE_IDLE: begin
                    // Reads take priority over Writes. 
                    if (S_AXIL_arvalid == 1) begin
                        r_core_state <= (w_s_axil_read_is_wan == 1) ? STATE_SEND_TO_WAN : STATE_SEND_TO_LAN; 
                    end
                    // If address and data are present, send to network
                    else if (S_AXIL_awvalid == 1 && S_AXIL_wvalid == 1) begin
                        r_core_state <= (w_s_axil_write_is_wan == 1) ? STATE_SEND_TO_WAN : STATE_SEND_TO_LAN;
                    end
                    // If only address or data is sent, wait for the other.
                    else if (S_AXIL_awvalid == 1) begin
                        r_core_state <= STATE_S_AXIL_WAIT_WDATA;
                    end
                    else if (S_AXIL_wvalid == 1) begin
                        r_core_state <= STATE_S_AXIL_WAIT_AWADDR;
                    end
                    else begin
                        r_core_state <= r_core_state;
                    end
                end
                STATE_S_AXIL_WAIT_AWADDR: begin
                    if (S_AXIL_awvalid == 1) begin
                        r_core_state <= (w_s_axil_write_is_wan == 1) ? STATE_SEND_TO_WAN : STATE_SEND_TO_LAN;
                    end
                    else begin
                        r_core_state <= r_core_state;
                    end
                end
                STATE_S_AXIL_WAIT_WDATA: begin
                    if (S_AXIL_wvalid == 1) begin
                        r_core_state <= (r_s_axil_write_is_wan == 1) ? STATE_SEND_TO_WAN : STATE_SEND_TO_LAN;
                    end
                    else begin
                        r_core_state <= r_core_state;
                    end                
                end
                STATE_SEND_TO_LAN: begin
                    r_core_state <= (to_LAN_tready == 1) ? STATE_NETWORK_RESPONSE_WAIT : r_core_state;
                end
                STATE_SEND_TO_WAN: begin
                    // WAN messages will result in LAN response messages
                    r_core_state <= (to_WAN_tready == 1) ? STATE_NETWORK_RESPONSE_WAIT : r_core_state;
                end
                STATE_NETWORK_RESPONSE_WAIT: begin
                    // Data here could have been sent from LAN or from LAN response
                    if (from_network_bridge_tvalid == 1) begin
                        // Case 1: Response has arrived
                        if (r_current_transaction_is_write == 1 && w_from_network_bridge_msg_type == MSG_BRESP)
                            r_core_state <= STATE_S_AXIL_SEND_BRESP;
                        else if (r_current_transaction_is_write == 0 && w_from_network_bridge_msg_type == MSG_RDATA)
                            r_core_state <= STATE_S_AXIL_SEND_READ_RETURN;
                        // Case 2: A Busy Response has arrived
                        else if (w_from_network_bridge_msg_type == MSG_BUSY)
                            r_core_state <= STATE_PAUSE_BEFORE_RETRANSMISSION;
                        // Case 3: A BRESP has arrived when an RDATA is expected. This should not happen
                        else begin
                            r_core_state <= r_core_state;
                         end
                    end
                    else begin
                        r_core_state <= r_core_state;
                    end
                end
                STATE_S_AXIL_SEND_BRESP: begin
                    r_core_state <= (S_AXIL_bready == 1 ? STATE_IDLE : r_core_state);
                end
                STATE_S_AXIL_SEND_READ_RETURN: begin
                    r_core_state <= (S_AXIL_rready == 1 ? STATE_IDLE : r_core_state);
                end
                STATE_PAUSE_BEFORE_RETRANSMISSION: begin
                    if (r_current_pause_duration == (BUSY_RESPONSE_PAUSE_DURATION-1)) begin
                        r_core_state <= (r_s_axil_message_is_wan == 1) ? STATE_SEND_TO_WAN : STATE_SEND_TO_LAN;
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

    // Track if current S_AXIL operation is a READ or WRITE operation
    always_ff @(posedge i_clk, negedge i_ap_rst_n) begin
        if (i_ap_rst_n == 0) begin
            r_current_transaction_is_write <= 0;
        end
        else if (r_core_state == STATE_IDLE) begin
            if (S_AXIL_arvalid == 1)
                r_current_transaction_is_write <= 0;
            else if (S_AXIL_awvalid == 1 || S_AXIL_wvalid == 1)
                r_current_transaction_is_write <= 1;
            else
                r_current_transaction_is_write <= 0;
        end
        else begin
            r_current_transaction_is_write <= r_current_transaction_is_write;
        end
    end
    
    // Track if current S_AXIL operation is a LAN or WAN operation
    always_ff @(posedge i_clk, negedge i_ap_rst_n) begin
        if (i_ap_rst_n == 0) begin
            r_s_axil_message_is_wan <= 0;
        end
        else if (r_core_state == STATE_IDLE) begin
            // Reads take priority over writes
            if (S_AXIL_arvalid == 1)
                r_s_axil_message_is_wan <= w_s_axil_read_is_wan;
            // For Writes, we only know if it's WAN after receiving S_AXIL_AWADDR
            else if (S_AXIL_awvalid == 1)
                r_s_axil_message_is_wan <= w_s_axil_write_is_wan;
            else
                r_s_axil_message_is_wan <= 0;
        end
        // If S_AXIL_AWADDR arrives after, set the signal when it arrives
        else if (r_core_state == STATE_S_AXIL_WAIT_AWADDR == 1 
              && S_AXIL_awvalid == 1) begin
            r_s_axil_message_is_wan <= w_s_axil_write_is_wan;
        end
        else begin
            r_s_axil_message_is_wan <= r_s_axil_message_is_wan;
        end
    end

    // If S_AXIL_wdata arrives before S_AXIL_awaddr, save it until we know whether it should be sent as a LAN or WAN message
    // WSTRB only tracked if AXI_LITE_WSTRB_ENABLED is 1
    always_ff @(posedge i_clk, negedge i_ap_rst_n) begin
        if (i_ap_rst_n == 0) begin
            r_s_axil_wdata <= 0;
            r_s_axil_wstrb <= 'hF;
        end
        else if (r_core_state == STATE_IDLE) begin
            if (S_AXIL_wvalid == 1 && S_AXIL_awvalid == 0) begin
                r_s_axil_wdata <= S_AXIL_wdata;
                r_s_axil_wstrb <= (AXI_LITE_WSTRB_ENABLED == 1) ? S_AXIL_wstrb : 'hF;
            end
            else begin
                r_s_axil_wdata <= 0;
                r_s_axil_wstrb <= 'hF;
            end
        end
        else begin
            r_s_axil_wdata <= r_s_axil_wdata;
            r_s_axil_wstrb <= r_s_axil_wstrb;
        end
    end

    // If S_AXIL_awaddr arrives before S_AXIL_wdata, store whether the write is a LAN or WAN until after data arrives
    always_ff @(posedge i_clk, negedge i_ap_rst_n) begin
        if (i_ap_rst_n == 0) begin
            r_s_axil_write_is_wan <= 0;
        end
        else if (r_core_state == STATE_IDLE && S_AXIL_awvalid == 1) begin
            r_s_axil_write_is_wan <= w_s_axil_write_is_wan;
        end
        // Clear the value when sending data to LAN or WAN
        else if (r_core_state == STATE_SEND_TO_LAN || r_core_state == STATE_SEND_TO_WAN) begin
            r_s_axil_write_is_wan <= 0;
        end
        else begin
            r_s_axil_write_is_wan <= r_s_axil_write_is_wan;
        end
    end

    // Send Messages over the to-LAN interface 
    always_ff @(posedge i_clk, negedge i_ap_rst_n) begin
        if (i_ap_rst_n == 0) begin
            r_to_LAN_message_type <= 0;
            r_to_LAN_message_data <= 0;
            r_to_LAN_address <= 0;
            r_to_LAN_wstrb <= 'hF;
            r_to_LAN_tdest <= 0;
        end
        // to-LAN Case 1: Control sends AXI-Lite LAN Reads/Writes to the network in IDLE
        else if (r_core_state == STATE_IDLE) begin
            // Reads take priority over writes
            if (S_AXIL_arvalid == 1 && w_s_axil_read_is_wan == 0) begin
                r_to_LAN_message_type <= MSG_READ;
                r_to_LAN_message_data <= 0;
                r_to_LAN_address <= S_AXIL_araddr[AXIL_LAN_BASE_REG_ADDR_OFFSET+:AXIL_LAN_FULL_REG_ADDR_WIDTH];
                r_to_LAN_wstrb <= 0;
                r_to_LAN_tdest <= S_AXIL_araddr[AXIL_LAN_TDEST_OFFSET+:AXIS_LAN_TDEST_WIDTH];
            end
            // Only setup to-LAN if we know that the Write will be over the LAN
            else if (S_AXIL_awvalid == 1 && w_s_axil_write_is_wan == 0) begin
                r_to_LAN_message_type <= MSG_WRITE;
                r_to_LAN_address <= S_AXIL_awaddr[AXIL_LAN_BASE_REG_ADDR_OFFSET+:AXIL_LAN_FULL_REG_ADDR_WIDTH];
                // If wdata and is also present, save it. Otherwise, wait for wdata to be transferred
                r_to_LAN_message_data <= (S_AXIL_wvalid == 1) ? S_AXIL_wdata : 0;
                // Same thing for wstrb, if wstrb is enabled
                r_to_LAN_wstrb <= (AXI_LITE_WSTRB_ENABLED == 1 && S_AXIL_wvalid == 1) ? S_AXIL_wstrb : 'hF;
                r_to_LAN_tdest <= S_AXIL_awaddr[AXIL_LAN_TDEST_OFFSET+:AXIS_LAN_TDEST_WIDTH];
            end
            else begin
                r_to_LAN_message_type <= 0;
                r_to_LAN_message_data <= 0;
                r_to_LAN_address <= 0;
                r_to_LAN_wstrb <= 'hF;
                r_to_LAN_tdest <= 0;
            end
        end
        // to-LAN Case 2: S_AXIL_AWADDR arrives and specifies a LAN write. Setup to-LAN and use pre-saved WDATA to create message
        else if (r_core_state == STATE_S_AXIL_WAIT_AWADDR == 1 
              && S_AXIL_awvalid == 1
              && w_s_axil_write_is_wan == 0) begin
            r_to_LAN_message_type <= MSG_WRITE;
            r_to_LAN_address <= S_AXIL_awaddr[AXIL_LAN_BASE_REG_ADDR_OFFSET+:AXIL_LAN_FULL_REG_ADDR_WIDTH];
            r_to_LAN_message_data <= r_s_axil_wdata;
            r_to_LAN_wstrb <= r_s_axil_wstrb;
            r_to_LAN_tdest <= S_AXIL_awaddr[AXIL_LAN_TDEST_OFFSET+:AXIS_LAN_TDEST_WIDTH];
        end
        // to-LAN Case 3: S_AXIL_WDATA arrives. to-LAN has already been setup except for DATA, so only insert WDATA
        else if (r_core_state == STATE_S_AXIL_WAIT_WDATA == 1 
              && S_AXIL_wvalid == 1
              && r_s_axil_write_is_wan == 0) begin
            r_to_LAN_message_type <= r_to_LAN_message_type;
            r_to_LAN_message_data <= S_AXIL_wdata;
            // WSTRB only written if enabled
            r_to_LAN_wstrb <= (AXI_LITE_WSTRB_ENABLED == 1) ? S_AXIL_wstrb : 'hF;
            r_to_LAN_address <= r_to_LAN_address;
            r_to_LAN_tdest <= r_to_LAN_tdest;
        end
        else begin
            r_to_LAN_message_type <= r_to_LAN_message_type;
            r_to_LAN_message_data <= r_to_LAN_message_data;
            r_to_LAN_address <= r_to_LAN_address;
            r_to_LAN_wstrb <= r_to_LAN_wstrb;
            r_to_LAN_tdest <= r_to_LAN_tdest;
        end
    end
        
    // Send Messages over the to-WAN interface 
    always_ff @(posedge i_clk, negedge i_ap_rst_n) begin
        if (i_ap_rst_n == 0) begin
            r_to_WAN_message_type <= 0;
            r_to_WAN_message_data <= 0;
            r_to_WAN_creg_addr <= 0;
            r_to_WAN_wstrb <= 'hF;
            r_to_WAN_requestor_tid <= 0;
            r_to_WAN_requestor_ip_addr <= 0;
            r_to_WAN_ctdest <= 0;
            r_to_WAN_dest_port <= 0;
        end
        // to-WAN Case 1: Control sends AXI-Lite WAN Reads/Writes to the network in IDLE
        else if (r_core_state == STATE_IDLE) begin
            // Reads take priority over writes
            if (S_AXIL_arvalid == 1 && w_s_axil_read_is_wan == 1) begin
                r_to_WAN_message_type <= MSG_READ;
                r_to_WAN_message_data <= 0;
                r_to_WAN_creg_addr <= w_wan_read_creg_addr;
                r_to_WAN_wstrb <= 0;
                // Write Requesting kernel's IP address and TID for LAN Response
                r_to_WAN_requestor_tid <= i_kernel_id;
                r_to_WAN_requestor_ip_addr <= i_kernel_ip_address;
                // Write Destination ID and port
                r_to_WAN_ctdest <= w_wan_read_ctdest;
                r_to_WAN_dest_port <= w_wan_read_dest_port;
            end
            // Only setup to-WAN if we know that the Write will be over the WAN
            else if (S_AXIL_awvalid == 1 && w_s_axil_write_is_wan == 1) begin
                r_to_WAN_message_type <= MSG_WRITE;
                r_to_WAN_creg_addr <= w_wan_write_creg_addr;
                // If wdata is also present, save it. Otherwise, wait for wdata to be transferred
                r_to_WAN_message_data <= (S_AXIL_wvalid == 1) ? S_AXIL_wdata : 0;
                r_to_WAN_wstrb <= (AXI_LITE_WSTRB_ENABLED == 1 && S_AXIL_wvalid == 1) ? S_AXIL_wstrb : 'hF;
                // Write Requesting kernel's IP address and TID for LAN Response
                r_to_WAN_requestor_tid <= i_kernel_id;
                r_to_WAN_requestor_ip_addr <= i_kernel_ip_address;
                // Write Destination ID and port
                r_to_WAN_ctdest <= w_wan_write_ctdest;
                r_to_WAN_dest_port <= w_wan_write_dest_port;
            end
            else begin
                r_to_WAN_message_type <= 0;
                r_to_WAN_message_data <= 0;
                r_to_WAN_creg_addr <= 0;
                r_to_WAN_wstrb <= 'hF;
                r_to_WAN_requestor_tid <= 0;
                r_to_WAN_requestor_ip_addr <= 0;
                r_to_WAN_ctdest <= 0;
                r_to_WAN_dest_port <= 0;
            end
        end
        // to-WAN Case 2: S_AXIL_AWADDR arrives and specifies a WAN write. Setup to-WAN and use pre-saved WDATA to create message
        else if (r_core_state == STATE_S_AXIL_WAIT_AWADDR == 1 
              && S_AXIL_awvalid == 1
              && w_s_axil_write_is_wan == 1) begin
            r_to_WAN_message_type <= MSG_WRITE;
            r_to_WAN_creg_addr <= w_wan_write_creg_addr;
            // Use pre-saved WDATA
            r_to_WAN_message_data <= r_s_axil_wdata;
            r_to_WAN_wstrb <= r_s_axil_wstrb;
            // Write Requesting kernel's IP address and TID for LAN Response
            r_to_WAN_requestor_tid <= i_kernel_id;
            r_to_WAN_requestor_ip_addr <= i_kernel_ip_address;
            // Write Destination ID and port
            r_to_WAN_ctdest <= w_wan_write_ctdest;
            r_to_WAN_dest_port <= w_wan_write_dest_port;
        end
        // to-WAN Case 3: S_AXIL_WDATA arrives. to-WAN has already been setup except for DATA, so only insert WDATA
        else if (r_core_state == STATE_S_AXIL_WAIT_WDATA == 1 
              && S_AXIL_wvalid == 1
              && r_s_axil_write_is_wan == 1) begin
            r_to_WAN_message_type <= r_to_WAN_message_type;
            r_to_WAN_creg_addr <= r_to_WAN_creg_addr;
            // Only set WDATA
            r_to_WAN_message_data <= S_AXIL_wdata;
            r_to_WAN_wstrb <= (AXI_LITE_WSTRB_ENABLED == 1) ? S_AXIL_wstrb : 'hF;
            r_to_WAN_requestor_tid <= r_to_WAN_requestor_tid;
            r_to_WAN_requestor_ip_addr <= r_to_WAN_requestor_ip_addr;
            r_to_WAN_ctdest <= r_to_WAN_ctdest;
            r_to_WAN_dest_port <= r_to_WAN_dest_port;
        end
        else begin
            r_to_WAN_message_type <= r_to_WAN_message_type;
            r_to_WAN_message_data <= r_to_WAN_message_data;
            r_to_WAN_wstrb <= r_to_WAN_wstrb;
            r_to_WAN_creg_addr <= r_to_WAN_creg_addr;
            r_to_WAN_requestor_tid <= r_to_WAN_requestor_tid;
            r_to_WAN_requestor_ip_addr <= r_to_WAN_requestor_ip_addr;
            r_to_WAN_ctdest <= r_to_WAN_ctdest;
            r_to_WAN_dest_port <= r_to_WAN_dest_port;
        end
    end

    // Read response from the network
    always_ff @(posedge i_clk, negedge i_ap_rst_n) begin
        if (i_ap_rst_n == 0) begin
            r_s_axil_bresp <= 0;
            r_s_axil_rdata <= 0;
        end
        else if (r_core_state == STATE_NETWORK_RESPONSE_WAIT) begin
            if (from_network_bridge_tvalid == 1) begin
                if (r_current_transaction_is_write == 1 && w_from_network_bridge_msg_type == MSG_BRESP) begin
                    r_s_axil_bresp <= from_network_bridge_tdata[AXIS_LAN_DATA_OFFSET+:AXI_LITE_BRESP_WIDTH];
                    r_s_axil_rdata <= 0;     
                end
                else if (r_current_transaction_is_write == 0 && w_from_network_bridge_msg_type == MSG_RDATA) begin
                    r_s_axil_bresp <= 0;
                    r_s_axil_rdata <= from_network_bridge_tdata[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH];
                end
                // If incorrect response was received, write nothing
                else begin
                    r_s_axil_bresp <= 0;
                    r_s_axil_rdata <= 0;
                end
            end
            else begin
                r_s_axil_bresp <= 0;
                r_s_axil_rdata <= 0;
            end
        end
        else begin
            r_s_axil_bresp <= r_s_axil_bresp;
            r_s_axil_rdata <= r_s_axil_rdata;
        end
    end

    // Count the number of cycles spent waiting until retransmission
    always_ff @(posedge i_clk, negedge i_ap_rst_n) begin
        if (i_ap_rst_n == 0) begin
            r_current_pause_duration <= 0;
        end
        else if (r_core_state == STATE_PAUSE_BEFORE_RETRANSMISSION) begin
            if (r_current_pause_duration == (BUSY_RESPONSE_PAUSE_DURATION-1))
                r_current_pause_duration <= 0;
            else
                r_current_pause_duration <= r_current_pause_duration + 1;
        end
        // Otherwise, do nothing
        else begin
            r_current_pause_duration <= 0;
        end
    end
endmodule