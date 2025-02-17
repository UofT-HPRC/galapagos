module axi_lite_test_subordinate #(
    parameter AXI_LITE_ADDR_WIDTH = 32,
    parameter AXI_LITE_DATA_WIDTH = 32,
    parameter AXI_LITE_WSTRB_WIDTH = 4,
    parameter AXI_LITE_BRESP_WIDTH = 2,
    parameter AXI_LITE_RRESP_WIDTH = 2
) (
    input logic clk,
    input logic ap_rst_n,
    // AXI-Lite Write Address Interface
    input logic S_AXIL_awvalid,
    output logic S_AXIL_awready,
    input logic [AXI_LITE_ADDR_WIDTH-1:0] S_AXIL_awaddr,
    input logic [AXI_LITE_WSTRB_WIDTH-1:0] S_AXIL_wstrb,
    // AXI-Lite Write Data Interface
    input logic S_AXIL_wvalid,
    output logic S_AXIL_wready,
    input logic [AXI_LITE_DATA_WIDTH-1:0] S_AXIL_wdata,
    // AXI-Lite Write Response Interface
    output logic S_AXIL_bvalid,
    input logic S_AXIL_bready,
    output logic [AXI_LITE_BRESP_WIDTH-1:0] S_AXIL_bresp,
    // AXI-Lite Read Address Interface
    input logic S_AXIL_arvalid,
    output logic S_AXIL_arready,
    input logic [AXI_LITE_ADDR_WIDTH-1:0] S_AXIL_araddr,
    // AXI-Lite Read Data Interface
    output logic S_AXIL_rvalid,
    input logic S_AXIL_rready,
    output logic [AXI_LITE_DATA_WIDTH-1:0] S_AXIL_rdata,
    // BRAM Interface
    output logic memory_clk,
    output logic memory_rst,
    output logic memory_en,
    output logic [3:0] memory_wen,
    output logic [AXI_LITE_ADDR_WIDTH-1:0] memory_addr,
    output logic [AXI_LITE_DATA_WIDTH-1:0] memory_din,
    input logic [AXI_LITE_DATA_WIDTH-1:0] memory_dout
);

    // Parameters
    localparam STATE_IDLE = 0;
    localparam STATE_WAIT_AWADDR = 1;
    localparam STATE_WAIT_WDATA = 2;
    localparam STATE_WRITE_TO_MEMORY = 3;
    localparam STATE_SEND_BRESP = 4;
    localparam STATE_GET_RDATA_FROM_MEMORY = 5;
    localparam STATE_SEND_RDATA = 6;

    // Declarations
    reg [2:0] r_core_state;
    logic r_awready;
    logic r_wready;
    logic r_memory_en;
    logic [3:0] r_memory_wen;
    logic [AXI_LITE_ADDR_WIDTH-1:0] r_memory_address;
    logic [AXI_LITE_ADDR_WIDTH-1:0] r_memory_din;
    logic w_state_wait_addr_valid;
    logic w_state_wait_data_valid;    

    // Assignments
    assign w_state_wait_addr_valid = (r_core_state == STATE_WAIT_AWADDR) && (S_AXIL_awvalid == 1);
    assign w_state_wait_data_valid = (r_core_state == STATE_WAIT_WDATA) && (S_AXIL_wvalid == 1);
    assign S_AXIL_awready = ((r_core_state == STATE_IDLE || r_core_state == STATE_WAIT_AWADDR) ? 1 : 0);
    assign S_AXIL_wready = ((r_core_state == STATE_IDLE || r_core_state == STATE_WAIT_WDATA) ? 1 : 0);
    assign S_AXIL_bvalid = (r_core_state == STATE_SEND_BRESP ? 1 : 0);
    assign S_AXIL_bresp = ((r_core_state == STATE_SEND_BRESP && memory_dout == r_memory_din) ? 0 : 2); // BRAM interface spits out the value stored at the recently-written address. If the write went correctly, this will match din.
    assign S_AXIL_arready = ((r_core_state == STATE_IDLE && S_AXIL_awvalid == 0 && S_AXIL_wvalid == 0) ? 1 : 0);
    //assign S_AXIL_arready = ((r_core_state == STATE_IDLE) ? 1 : 0);
    assign S_AXIL_rvalid = (r_core_state == STATE_SEND_RDATA ? 1 : 0); 
    assign S_AXIL_rdata = memory_dout; // Read directly from memory interface
    assign memory_clk = clk;
    assign memory_rst = ~ap_rst_n;
    assign memory_en = r_memory_en;
    assign memory_wen = r_memory_wen;
    assign memory_addr = (r_memory_address << 2); // Address is byte-addressable, therefore entry 1 = 0x4, entry 2 = 0x8, etc
    assign memory_din = r_memory_din;

    // Core state FSM
    always_ff @(posedge clk, negedge ap_rst_n) begin
        if (ap_rst_n == 0) begin
            r_core_state <= STATE_IDLE;
        end
        else begin
            case (r_core_state)
                STATE_IDLE: begin
                    if (S_AXIL_awvalid == 1 && S_AXIL_wvalid == 1) begin
                        r_core_state <= STATE_WRITE_TO_MEMORY;
                    end
                    else if (S_AXIL_awvalid == 1) begin
                        r_core_state <= STATE_WAIT_WDATA;
                    end
                    else if (S_AXIL_wvalid == 1) begin
                        r_core_state <= STATE_WAIT_AWADDR;
                    end
                    else if (S_AXIL_arvalid == 1) begin
                        r_core_state <= STATE_GET_RDATA_FROM_MEMORY;
                    end
                    else begin
                        r_core_state <= r_core_state;
                    end
                end
                STATE_WAIT_AWADDR: begin
                    r_core_state <= (S_AXIL_awvalid == 1 ? STATE_WRITE_TO_MEMORY : r_core_state);
                end
                STATE_WAIT_WDATA: begin
                    r_core_state <= (S_AXIL_wvalid == 1 ? STATE_WRITE_TO_MEMORY : r_core_state);
                end
                STATE_WRITE_TO_MEMORY: begin
                    // Writing data to BRAM always takes 1 cycle
                    r_core_state <= STATE_SEND_BRESP;
                end
                STATE_SEND_BRESP: begin
                    r_core_state <= (S_AXIL_bready == 1 ? STATE_IDLE : r_core_state);
                end
                STATE_GET_RDATA_FROM_MEMORY: begin
                    // Reading data from BRAM always takes 1 cycle
                    r_core_state <= STATE_SEND_RDATA;
                end
                STATE_SEND_RDATA: begin
                    r_core_state <= (S_AXIL_rready == 1 ? STATE_IDLE : r_core_state);
                end
                default: begin
                    r_core_state <= r_core_state;
                end
            endcase
        end
    end

    // Reading address and data from Manager
    always_ff @(posedge clk, negedge ap_rst_n) begin
        if (ap_rst_n == 0) begin
            r_memory_address <= 0;
            r_memory_din <= 0;
        end
        else if (r_core_state == STATE_IDLE) begin
            // Case 1: Both AXI-Lite write addr and data are present
            if (S_AXIL_awvalid == 1 && S_AXIL_wvalid == 1) begin
                r_memory_address <= S_AXIL_awaddr;
                r_memory_din <= S_AXIL_wdata;
            end
            // Case 2: 1 of the write addr/write data are present
            else if (S_AXIL_awvalid == 1) begin
                r_memory_address <= S_AXIL_awaddr;
                r_memory_din <= 0;
            end
            else if (S_AXIL_wvalid == 1) begin
                r_memory_address <= 0;
                r_memory_din <= S_AXIL_wdata;
            end
            // Case 3: Read is present
            else if (S_AXIL_arvalid == 1) begin
                r_memory_address <= S_AXIL_araddr;
                r_memory_din <= 0;
            end
            else begin
                r_memory_address <= 0;
                r_memory_din <= 0;
            end
        end
        else if (w_state_wait_addr_valid == 1) begin
            r_memory_address <= S_AXIL_awaddr;
            r_memory_din <= r_memory_din;
        end
        else if (w_state_wait_data_valid == 1) begin
            r_memory_address <= r_memory_address;            
            r_memory_din <= S_AXIL_wdata;
        end
        else begin
            r_memory_address <= r_memory_address;
            r_memory_din <= r_memory_din;
        end
    end

    // Setting memory control signals
    always_ff @(posedge clk, negedge ap_rst_n) begin
        if (ap_rst_n == 0) begin
            r_memory_en <= 0;
            r_memory_wen <= 0;
        end
        else begin
            if (r_memory_en == 1) begin
                // Only activate the memory access for one cycle
                r_memory_en <= 0;
                r_memory_wen <= 0;
            end
            else if (r_core_state == STATE_IDLE) begin
                if (S_AXIL_awvalid == 1 && S_AXIL_wvalid == 1) begin
                    // AXI-Lite Write, both data and address are present
                    r_memory_en <= 1;
                    r_memory_wen <= S_AXIL_wstrb;
                end
                else if (S_AXIL_arvalid == 1) begin
                    // AXI-Lite Read
                    r_memory_en <= 1;
                    r_memory_wen <= 0;
                end
                else begin
                    r_memory_en <= 0;
                    r_memory_wen <= 0;
                end
            end
            else if (w_state_wait_addr_valid == 1 || w_state_wait_data_valid == 1) begin
                // In this case, we were waiting for either waddr or wdata to arrive, which has just occurred
                r_memory_en <= 1;
                r_memory_wen <= 'hF;
            end
            else begin
                r_memory_en <= 0;
                r_memory_wen <= 0;
            end
        end
    end
endmodule