`timescale 1 ns / 1 ps

module tb();
    parameter AXI_LITE_ADDR_WIDTH = 32;
    parameter AXI_LITE_DATA_WIDTH = 32;
    parameter AXI_LITE_BRESP_WIDTH = 2;
    parameter AXI_LITE_RRESP_WIDTH = 2;
    parameter TIMEOUT_DELAY = 10;
    parameter MODE_READ = 0;
    parameter MODE_WRITE = 1;

    // Declarations
    logic r_clk;
    logic r_reset;
    logic r_vio_enable;
    logic r_vio_transaction_mode;
    logic [AXI_LITE_ADDR_WIDTH-1:0] r_vio_address;
    logic [AXI_LITE_DATA_WIDTH-1:0] r_vio_data;
    logic [AXI_LITE_DATA_WIDTH-1:0] w_vio_output;
    // AXI-Lite Write Interface
    // Write Address
    logic w_awvalid;
    logic r_awready;
    logic [AXI_LITE_ADDR_WIDTH-1:0] w_awaddr;
    // Write Data
    logic w_wvalid;
    logic r_wready;
    logic [AXI_LITE_DATA_WIDTH-1:0] w_wdata;
    // Write Response
    logic r_bvalid;
    logic w_bready;
    logic [AXI_LITE_BRESP_WIDTH-1:0] r_bresp;
    // AXI-Lite Read Interface
    // Read Address
    logic w_arvalid;
    logic r_arready;
    logic [AXI_LITE_ADDR_WIDTH-1:0] w_araddr;
    // Read Data
    logic r_rvalid;
    logic w_rready;
    logic [AXI_LITE_DATA_WIDTH-1:0] r_rdata;
    logic [31:0] r_awready_counter;
    logic [31:0] r_awready_delay;
    logic [31:0] r_wready_counter;
    logic [31:0] r_wready_delay;
    logic [31:0] r_bresp_delay;
    logic [31:0] r_bresp_delay_counter;
    logic [31:0] r_rvalid_delay;
    logic [31:0] r_rvalid_delay_counter;

    axi_lite_test_manager # (
        .TIMEOUT_DELAY(TIMEOUT_DELAY)
    )
    DUT (
        .clk(r_clk),
        .ap_rst_n(r_reset),
        .i_vio_enable(r_vio_enable),
        .i_vio_transaction_mode(r_vio_transaction_mode),
        .i_vio_address(r_vio_address),
        .i_vio_data(r_vio_data),
        .o_vio_output(w_vio_output),
        .M_AXIL_awvalid(w_awvalid),
        .M_AXIL_awready(r_awready),
        .M_AXIL_awaddr(w_awaddr),
        .M_AXIL_wvalid(w_wvalid),
        .M_AXIL_wready(r_wready),
        .M_AXIL_wdata(w_wdata),
        .M_AXIL_bvalid(r_bvalid),
        .M_AXIL_bready(w_bready),
        .M_AXIL_bresp(r_bresp),
        .M_AXIL_arvalid(w_arvalid),
        .M_AXIL_arready(r_arready),
        .M_AXIL_araddr(w_araddr),
        .M_AXIL_rvalid(r_rvalid),
        .M_AXIL_rready(w_rready),
        .M_AXIL_rdata(r_rdata)
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
        // r_awready = 1;
        // r_wready = 1;
        r_arready = 1;
    end

    // Test logic: Initial signals
    initial begin
        // Test AXI-Lite Write
        r_vio_enable = 0;
        #200
        r_vio_enable = 1;
        //r_vio_transaction_mode = MODE_WRITE;
        //r_vio_address = 4;
        //r_vio_data = 'h0F0F0F0F;
        //#100
        r_vio_transaction_mode = MODE_READ;
        r_vio_address = 4;
        #1000
        $finish;

        //r_vio_enable = 0;
        //#200
        //r_vio_enable = 1;
        //r_vio_transaction_mode = MODE_WRITE;
        //r_vio_address = 6;
        //r_vio_data = 'h0F0F0F0F;
        //#1000
        //$finish;
    end    

     // Test Logic: Simulate being AXI-Lite subordinate
    always_ff @(posedge r_clk) begin
        if (r_reset == 0) begin
            // Write Response
            r_bvalid <= 0;
            r_bresp <= 2;
            r_bresp_delay <= 2*TIMEOUT_DELAY;
            r_bresp_delay_counter <= 0;
            // Read Data
            r_rvalid <= 0;
            r_rdata <= 'hABCDABCD;
            r_rvalid_delay <= 2*TIMEOUT_DELAY;
            r_rvalid_delay_counter <= 0;
        end
        else if (w_awvalid == 1'b1 && w_wvalid == 1'b1) begin
            r_bresp_delay_counter <= 1;
        end
        else if (r_bresp_delay_counter == r_bresp_delay) begin
            r_bresp_delay_counter <= 0;
            r_bvalid <= 1;
        end
        else if (r_bresp_delay_counter > 0) begin
            r_bresp_delay_counter <= r_bresp_delay_counter + 1;
        end
        else if (r_bvalid == 1'b1 && w_bready == 1'b1) begin
            r_bvalid <= 0;
        end
        else if (w_arvalid == 1'b1) begin
            r_rvalid_delay_counter <= 1;
        end
        else if (r_rvalid_delay_counter == r_rvalid_delay) begin
            r_rvalid_delay_counter <= 0;
            r_rvalid <= 1;
        end
        else if (r_bresp_delay_counter > 0) begin
            r_rvalid_delay_counter <= r_rvalid_delay_counter + 1;
        end        
        else if (r_rvalid == 1'b1 && w_rready == 1'b1) begin
            r_rvalid <= 0;
        end
    end

    // Test: Delay awready and wready so that they are out of sync
    always_ff @(posedge r_clk, negedge r_reset) begin
        if (r_reset == 0) begin
            r_awready <= 0;
            r_awready_counter <= 0;
            r_awready_delay <= 0;
        end
        else begin
            if (r_awready == 1) begin
                r_awready <= 0;
            end
            else if (w_awvalid == 1 && r_awready_counter == r_awready_delay) begin
                r_awready <= 1;
                r_awready_counter <= 0;
            end
            else if (w_awvalid == 1) begin
                r_awready_counter <= r_awready_counter + 1;
            end
            else begin
                r_awready <= r_awready;
                r_awready_counter <= r_awready_counter;
            end
        end
    end

    always_ff @(posedge r_clk, negedge r_reset) begin
        if (r_reset == 0) begin
            r_wready <= 0;
            r_wready_counter <= 0;
            r_wready_delay <= 0;
        end
        else begin
            if (r_wready == 1) begin
                r_wready <= 0;
            end
            else if (w_wvalid == 1 && r_wready_counter == r_wready_delay) begin
                r_wready <= 1;
                r_wready_counter <= 0;
            end
            else if (w_wvalid == 1) begin
                r_wready_counter <= r_wready_counter + 1;
            end
            else begin
                r_wready <= r_wready;
                r_wready_counter <= r_wready_counter;
            end
        end
    end
endmodule