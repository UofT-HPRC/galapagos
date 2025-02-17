`timescale 1 ns / 1 ps

module tb();
    parameter AXI_LITE_ADDR_WIDTH = 32;
    parameter AXI_LITE_DATA_WIDTH = 32;
    parameter AXI_LITE_BRESP_WIDTH = 2;
    parameter AXI_LITE_RRESP_WIDTH = 2;
    
    // Declarations
    logic r_clk;
    logic r_reset;
    // Write Address
    logic r_awvalid;
    logic w_awready;
    logic [AXI_LITE_ADDR_WIDTH-1:0] r_awaddr;
    // Write Data
    logic r_wvalid;
    logic w_wready;
    logic [AXI_LITE_DATA_WIDTH-1:0] r_wdata;
    // Write Response
    logic w_bvalid;
    logic r_bready;
    logic [AXI_LITE_BRESP_WIDTH-1:0] w_bresp;
    // AXI-Lite Read Interface
    // Read Address
    logic r_arvalid;
    logic w_arready;
    logic [AXI_LITE_ADDR_WIDTH-1:0] r_araddr;
    // Read Data
    logic w_rvalid;
    logic r_rready;
    logic [AXI_LITE_DATA_WIDTH-1:0] w_rdata;

    design_1_wrapper DUT (
        .i_araddr(r_araddr),
        .i_aresetn(r_reset),
        .i_arvalid(r_arvalid),
        .i_awaddr(r_awaddr),
        .i_awvalid(r_awvalid),
        .i_bready(r_bready),
        .i_clk(r_clk),
        .i_rready(r_rready),
        .i_wdata(r_wdata),
        .i_wvalid(r_wvalid),
        .o_arready(w_arready),
        .o_awready(w_awready),
        .o_bresp(w_bresp),
        .o_bvalid(w_bvalid),
        .o_rdata(w_rdata),
        .o_rvalid(w_rvalid),
        .o_wready(w_wready)
    );

     // clock generator (100MHz)
	initial begin
		r_clk = 1;
		forever
		  #5 r_clk = ~r_clk;
	end 

    // Reset Logic (for 10 cycles)
    initial begin
        r_reset = 0;
        #100 r_reset = 1;
    end

    // Constant Assignments
    initial begin
        // All Ready Signals
        r_bready = 1;
        r_rready = 1;
    end

    // Test Logic
    initial begin
        // // Test AXI-Lite Write
        //r_awvalid = 0;
        //r_awaddr = 0;
        //r_wvalid = 0;
        //r_wdata = 0;
        //r_arvalid = 0;
        //#205
        //r_awvalid = 1;
        //r_awaddr = 6;
        //r_wvalid = 1;
        //r_wdata = 30;
        ////r_arvalid = 1;
        ////r_araddr = 8;
        //#100
        //r_wdata = 'hFFFF0000;
        //#1000
        //$finish;

        // Test AXI-Lite delayed write
        //r_awvalid = 0;
        //r_awaddr = 0;
        //r_wvalid = 0;
        //r_wdata = 0;
        //r_arvalid = 0;
        //#210
        //r_awvalid <= 1;
        //r_awaddr <= 6;
        //#20
        //r_awvalid <= 0;
        //r_wvalid <= 1;
        //r_wdata <= 'hFFFF0000;
        //#10
        //r_wdata <= 'hAABBCCDD;
        //#30
        //r_awvalid <= 1;
        //r_awaddr <= 3;
        //#1000
        //$finish;

        // // Test AXI-Lite Read
        // r_awvalid = 0;
        // r_awaddr = 0;
        // r_wvalid = 0;
        // r_wdata = 0;
        // r_arvalid = 0;
        // #200
        // r_araddr = 10;
        // #10
        // r_arvalid = 1;
        // r_araddr = 8;
        // #10
        // r_araddr = 12;
        // #1000
        // $finish;

    end


endmodule