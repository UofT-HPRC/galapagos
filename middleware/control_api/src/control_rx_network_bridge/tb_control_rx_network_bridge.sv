module tb #(
    `include "ctrl_api_header_parameters.vh"
) ();
    // Parameters
    localparam KIP_PORT_NUMBER = 'hABCD;
    localparam LAN_PORT_NUMBER = 'hEFEF;
    // Message Offsets
    `include "ctrl_api_message_parameters.vh"

    // Declarations
    logic r_clk;
    logic r_resetn;
    // Input from Receptionist
    logic r_from_receptionist_tvalid;
    logic w_from_receptionist_tready;
    logic [AXIS_DATA_WIDTH-1:0] r_from_receptionist_tdata;
    logic [AXIS_KEEP_WIDTH-1:0] r_from_receptionist_tkeep;
    logic [AXIS_RECEP_TDEST_WIDTH-1:0] r_from_receptionist_tdest; // represents Dest port
    logic [AXIS_RECEP_TUSER_WIDTH-1:0] w_from_receptionist_tuser; // Src Port and SRC IP
    logic [IP_ADDRESS_WIDTH-1:0] r_from_recep_tuser_src_ip;
    logic [IP_PORT_WIDTH-1:0] r_from_recep_tuser_src_port;
    logic r_from_receptionist_tlast;
    // Output to Control
    logic w_to_ctrl_tvalid;
    logic r_to_ctrl_tready;
    logic [AXIS_DATA_WIDTH-1:0] w_to_ctrl_tdata;
    logic [AXIS_KEEP_WIDTH-1:0] w_to_ctrl_tkeep;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] w_to_ctrl_tid;
    logic [AXIS_FROM_NB_TDEST_WIDTH-1:0] w_to_ctrl_tdest;
    logic [AXIS_FROM_NB_TUSER_WIDTH-1:0] w_to_ctrl_tuser;
    logic w_to_ctrl_tlast;
    
    // Assignments
    assign w_from_receptionist_tuser[IP_ADDRESS_WIDTH-1:0] = r_from_recep_tuser_src_ip;
    assign w_from_receptionist_tuser[AXIS_KIP_TUSER_SRC_PORT_OFFSET+:AXIS_KIP_TUSER_SRC_PORT_WIDTH] = r_from_recep_tuser_src_port;
    

    // DUT
    control_rx_network_bridge #() DUT (
        .i_clk(r_clk),
        .i_ap_rst_n(r_resetn),
        .i_CTRL_KIP_port_number(KIP_PORT_NUMBER),
        // Input from Receptionist
        .from_receptionist_tvalid(r_from_receptionist_tvalid),
        .from_receptionist_tready(w_from_receptionist_tready),
        .from_receptionist_tdata(r_from_receptionist_tdata),
        .from_receptionist_tkeep(r_from_receptionist_tkeep),
        .from_receptionist_tdest(r_from_receptionist_tdest),
        .from_receptionist_tuser(w_from_receptionist_tuser),
        .from_receptionist_tlast(r_from_receptionist_tlast),
        // Output to Control
        .to_ctrl_tvalid(w_to_ctrl_tvalid),
        .to_ctrl_tready(r_to_ctrl_tready),
        .to_ctrl_tdata(w_to_ctrl_tdata),
        .to_ctrl_tkeep(w_to_ctrl_tkeep),
        .to_ctrl_tid(w_to_ctrl_tid),
        .to_ctrl_tdest(w_to_ctrl_tdest),
        .to_ctrl_tuser(w_to_ctrl_tuser),
        .to_ctrl_tlast(w_to_ctrl_tlast)
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

    // Constant Assignments
    initial begin
        r_from_receptionist_tkeep = 'hFFFFFFFFFFFFFFFF;
        r_to_ctrl_tready = 1;
    end

    // Test Logic
    initial begin
        r_from_receptionist_tvalid <= 0;
        r_from_receptionist_tdata <= 0;
        r_from_receptionist_tdest <= 0;
        r_from_recep_tuser_src_ip <= 0;
        r_from_recep_tuser_src_port <= 0;
        r_from_receptionist_tlast <= 0;
        #100
        // // Send a LAN packet
        // r_from_receptionist_tvalid <= 1;
        // // LAN packet header: send from FE to CD
        // r_from_receptionist_tdata[AXIS_LAN_HDR_TID_OFFSET-1:0] <= 1;
        // r_from_receptionist_tdata[AXIS_LAN_HDR_TID_OFFSET+:AXIS_LAN_HDR_TID_WIDTH] <= 'hFE;
        // r_from_receptionist_tdata[AXIS_LAN_HDR_TDEST_OFFSET+:AXIS_LAN_HDR_TDEST_WIDTH] <= 'hCD;
        // r_from_receptionist_tdest <= LAN_PORT_NUMBER;
        // r_from_recep_tuser_src_ip <= 'h0A030705;
        // r_from_recep_tuser_src_port <= KIP_PORT_NUMBER;
        // // Send LAN Write of 0xABABABAB to kernel 128 address 0xEFEFEFEFEFEFEFEF 
        // #10
        // r_from_receptionist_tdata[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_WRITE;
        // r_from_receptionist_tdata[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 'hABABABAB;
        // r_from_receptionist_tdata[AXIS_LAN_ADDR_OFFSET] <= 0; // LAN Write
        // r_from_receptionist_tdata[(AXIS_LAN_ADDR_OFFSET+AXIL_LAN_TDEST_OFFSET)+:AXIS_LAN_TDEST_WIDTH] <= 'h7F;
        // r_from_receptionist_tdata[(AXIS_LAN_ADDR_OFFSET+AXIL_LAN_FULL_REG_ADDR_OFFSET)+:AXIL_LAN_FULL_REG_ADDR_WIDTH] <= 'hEFEFEFEFEFEFEFEF;
        // r_from_receptionist_tdata[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'hF;
        // r_from_receptionist_tlast <= 1;
        // #10
        // r_from_receptionist_tvalid <= 0;
        // r_from_receptionist_tlast <= 0;
        // #10
        // // Send a LAN packet
        // r_from_receptionist_tvalid <= 1;
        // // LAN packet header: send from FE to CD
        // r_from_receptionist_tdata[AXIS_LAN_HDR_TID_OFFSET-1:0] <= 1;
        // r_from_receptionist_tdata[AXIS_LAN_HDR_TID_OFFSET+:AXIS_LAN_HDR_TID_WIDTH] <= 'hFE;
        // r_from_receptionist_tdata[AXIS_LAN_HDR_TDEST_OFFSET+:AXIS_LAN_HDR_TDEST_WIDTH] <= 'hCD;
        // r_from_receptionist_tdest <= LAN_PORT_NUMBER;
        // r_from_recep_tuser_src_ip <= 'h0A030705;
        // r_from_recep_tuser_src_port <= LAN_PORT_NUMBER;
        // // Send LAN Write of 0xABABABAB to kernel 128 address 0xEFEFEFEFEFEFEFEF 
        // #10
        // r_from_receptionist_tdata[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_WRITE;
        // r_from_receptionist_tdata[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 'hABABABAB;
        // r_from_receptionist_tdata[AXIS_LAN_ADDR_OFFSET] <= 0; // LAN Write
        // r_from_receptionist_tdata[(AXIS_LAN_ADDR_OFFSET+AXIL_LAN_TDEST_OFFSET)+:AXIS_LAN_TDEST_WIDTH] <= 'h7F;
        // r_from_receptionist_tdata[(AXIS_LAN_ADDR_OFFSET+AXIL_LAN_FULL_REG_ADDR_OFFSET)+:AXIL_LAN_FULL_REG_ADDR_WIDTH] <= 'hEFEFEFEFEFEFEFEF;
        // r_from_receptionist_tdata[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'hF;
        // r_from_receptionist_tlast <= 1;

        // // Send a KIP Packet
        // r_from_receptionist_tvalid <= 1;
        // // Send KIP RDATA Message to kernel 255
        // r_from_receptionist_tdata[AXIS_KIP_MSG_TYPE_WIDTH-1:0] <= MSG_RDATA;
        // r_from_receptionist_tdata[AXIS_KIP_DATA_OFFSET+:AXIS_KIP_DATA_WIDTH] <= 'hFFFFEEEE;
        // r_from_receptionist_tdata[AXIS_KIP_TID_OFFSET+:AXIS_KIP_TID_WIDTH] <= 'hFF;
        // r_from_receptionist_tdata[AXIS_KIP_SENDER_TID_OFFSET+:AXIS_KIP_SENDER_TID_WIDTH] <= 'hBA;
        // r_from_receptionist_tdest <= KIP_PORT_NUMBER;
        // r_from_recep_tuser_src_ip <= 'h0A030705;
        // r_from_recep_tuser_src_port <= LAN_PORT_NUMBER;

        // Send Multiple Packets
        // Send a KIP Packet
        r_from_receptionist_tvalid <= 1;
        // Send KIP RDATA Message to kernel 255
        r_from_receptionist_tdata[AXIS_KIP_MSG_TYPE_WIDTH-1:0] <= MSG_RDATA;
        r_from_receptionist_tdata[AXIS_KIP_DATA_OFFSET+:AXIS_KIP_DATA_WIDTH] <= 'hFFFFEEEE;
        r_from_receptionist_tdata[AXIS_KIP_TID_OFFSET+:AXIS_KIP_TID_WIDTH] <= 'hFF;
        r_from_receptionist_tdata[AXIS_KIP_SENDER_TID_OFFSET+:AXIS_KIP_SENDER_TID_WIDTH] <= 'hBA;
        r_from_receptionist_tdest <= KIP_PORT_NUMBER;
        r_from_recep_tuser_src_ip <= 'h0A030705;
        r_from_recep_tuser_src_port <= LAN_PORT_NUMBER;
        r_from_receptionist_tlast <= 1;
        #40
        // Send a LAN packet
        r_from_receptionist_tvalid <= 1;
        // LAN packet header: send from FE to CD
        r_from_receptionist_tdata[AXIS_LAN_HDR_TID_OFFSET-1:0] <= 1;
        r_from_receptionist_tdata[AXIS_LAN_HDR_TID_OFFSET+:AXIS_LAN_HDR_TID_WIDTH] <= 'hFE;
        r_from_receptionist_tdata[AXIS_LAN_HDR_TDEST_OFFSET+:AXIS_LAN_HDR_TDEST_WIDTH] <= 'hCD;
        r_from_receptionist_tdest <= LAN_PORT_NUMBER;
        r_from_recep_tuser_src_ip <= 'h0A030705;
        r_from_recep_tuser_src_port <= KIP_PORT_NUMBER;
        r_from_receptionist_tlast <= 0;
        // Send LAN Write of 0xABABABAB to kernel 128 address 0xEFEFEFEFEFEFEFEF 
        #10
        r_from_receptionist_tdata[AXIS_LAN_MSG_TYPE_WIDTH-1:0] <= MSG_WRITE;
        r_from_receptionist_tdata[AXIS_LAN_DATA_OFFSET+:AXIS_LAN_DATA_WIDTH] <= 'hABABABAB;
        r_from_receptionist_tdata[AXIS_LAN_ADDR_OFFSET] <= 0; // LAN Write
        r_from_receptionist_tdata[(AXIS_LAN_ADDR_OFFSET+AXIL_LAN_TDEST_OFFSET)+:AXIS_LAN_TDEST_WIDTH] <= 'h7F;
        r_from_receptionist_tdata[(AXIS_LAN_ADDR_OFFSET+AXIL_LAN_FULL_REG_ADDR_OFFSET)+:AXIL_LAN_FULL_REG_ADDR_WIDTH] <= 'hEFEFEFEFEFEFEFEF;
        r_from_receptionist_tdata[AXIS_LAN_WSTRB_OFFSET+:AXIS_LAN_WSTRB_WIDTH] <= 'hF;
        r_from_receptionist_tlast <= 1;
        #10
        r_from_receptionist_tvalid <= 0;
        r_from_receptionist_tlast <= 0;
        // Send a KIP Packet
        r_from_receptionist_tvalid <= 1;
        // Send KIP RDATA Message to kernel 255
        r_from_receptionist_tdata[AXIS_KIP_MSG_TYPE_WIDTH-1:0] <= MSG_RDATA;
        r_from_receptionist_tdata[AXIS_KIP_DATA_OFFSET+:AXIS_KIP_DATA_WIDTH] <= 'hFFFFEEEE;
        r_from_receptionist_tdata[AXIS_KIP_TID_OFFSET+:AXIS_KIP_TID_WIDTH] <= 'hFF;
        r_from_receptionist_tdata[AXIS_KIP_SENDER_TID_OFFSET+:AXIS_KIP_SENDER_TID_WIDTH] <= 'hBA;
        r_from_receptionist_tdest <= KIP_PORT_NUMBER;
        r_from_recep_tuser_src_ip <= 'h0A030705;
        r_from_recep_tuser_src_port <= LAN_PORT_NUMBER;
        #1000
        $finish;
    end
endmodule