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
    logic r_from_network_bridge_tvalid;
    logic w_from_network_bridge_tready;
    logic [AXIS_DATA_WIDTH-1:0] r_from_network_bridge_tdata;
    logic [AXIS_KEEP_WIDTH-1:0] r_from_network_bridge_tkeep;
    logic [IP_PORT_WIDTH-1:0] r_from_network_bridge_tid; // represents src port
    logic [IP_PORT_WIDTH-1:0] r_from_network_bridge_tdest; // represents Dest port
    logic [IP_ADDRESS_WIDTH-1:0] r_from_network_bridge_tuser;
    logic r_from_network_bridge_tlast;
    // Output to Control
    logic w_to_ctrl_tvalid;
    logic r_to_ctrl_tready;
    logic [AXIS_DATA_WIDTH-1:0] w_to_ctrl_tdata;
    logic [AXIS_KEEP_WIDTH-1:0] w_to_ctrl_tkeep;
    logic [IP_PORT_WIDTH-1:0] w_to_ctrl_tid;
    logic [IP_PORT_WIDTH-1:0] w_to_ctrl_tdest;
    logic [IP_ADDRESS_WIDTH-1:0] w_to_ctrl_tuser;
    logic w_to_ctrl_tlast;
    
    // Assignments
    // DUT
    control_gw_network_bridge #() DUT (
        .i_clk(r_clk),
        .i_ap_rst_n(r_resetn),
        // Input from Receptionist
        .from_network_bridge_tvalid(r_from_network_bridge_tvalid),
        .from_network_bridge_tready(w_from_network_bridge_tready),
        .from_network_bridge_tdata(r_from_network_bridge_tdata),
        .from_network_bridge_tkeep(r_from_network_bridge_tkeep),
        .from_network_bridge_tid(r_from_network_bridge_tid),
        .from_network_bridge_tdest(r_from_network_bridge_tdest),
        .from_network_bridge_tuser(r_from_network_bridge_tuser),
        .from_network_bridge_tlast(r_from_network_bridge_tlast),
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
        r_from_network_bridge_tkeep = 'hFFFFFFFFFFFFFFFF;
    end

    // Test Logic
    initial begin
        r_from_network_bridge_tvalid <= 0;
        r_from_network_bridge_tdata <= 0;
        r_from_network_bridge_tid <= 0;
        r_from_network_bridge_tdest <= 0;
        r_from_network_bridge_tuser <= 0;
        r_from_network_bridge_tlast <= 0;
        r_to_ctrl_tready <= 0;
        #100
        // Send header
        r_from_network_bridge_tvalid <= 1;
        r_from_network_bridge_tdata <= 'hABABABABCDCDCDCD;
        r_from_network_bridge_tid <= 'hAEAE;
        r_from_network_bridge_tdest <= 'hAFAF;
        r_from_network_bridge_tuser <= 'hA0A0A0A0;
        r_from_network_bridge_tlast <= 0;
        r_to_ctrl_tready <= 0;
        #10
        r_to_ctrl_tready <= 1;
        #10
        r_from_network_bridge_tvalid <= 0;
        r_to_ctrl_tready <= 0;
        #10
        // Send payload packet
        r_from_network_bridge_tvalid <= 1;
        r_from_network_bridge_tdata <= 'hEFEFEFEFEFEFEFEF;
        r_from_network_bridge_tid <= 'hACAC;
        r_from_network_bridge_tdest <= 'hBDBD;
        r_from_network_bridge_tuser <= 'hCECE;
        r_from_network_bridge_tlast <= 1;
        #10
        r_from_network_bridge_tvalid <= 0;
        r_to_ctrl_tready <= 1;
        #10
        r_from_network_bridge_tvalid <= 1;
        #50
        $finish;
    end
endmodule