module axi_lite_test_manager #(
    parameter AXI_LITE_ADDR_WIDTH = 32,
    parameter AXI_LITE_DATA_WIDTH = 32,
    parameter AXI_LITE_WSTRB_WIDTH = 4,
    parameter AXI_LITE_BRESP_WIDTH = 2,
    parameter AXI_LITE_RRESP_WIDTH = 2,
    parameter TIMEOUT_DELAY = 1000 // cycles
) (
    input logic clk,
    input logic ap_rst_n,
    // VIO Control
    input wire i_vio_enable,
    input wire i_vio_transaction_mode,
    input wire [AXI_LITE_ADDR_WIDTH-1:0] i_vio_address,
    input wire [AXI_LITE_DATA_WIDTH-1:0] i_vio_data,
    input wire [AXI_LITE_WSTRB_WIDTH-1:0] i_vio_wstrb,
    output wire [AXI_LITE_DATA_WIDTH-1:0] o_vio_output,
    output wire [2:0] o_core_state,
    output wire [63:0] o_bresp_waiting_time,
    output wire [63:0] o_rdata_waiting_time,
    output wire [63:0] o_num_transactions_completed,
    // AXI-Lite Write Address Interface
    output logic M_AXIL_awvalid,
    input logic M_AXIL_awready,
    output logic [AXI_LITE_ADDR_WIDTH-1:0] M_AXIL_awaddr,
    // AXI-Lite Write Data Interface
    output logic M_AXIL_wvalid,
    input logic M_AXIL_wready,
    output logic [AXI_LITE_DATA_WIDTH-1:0] M_AXIL_wdata,
    output logic [AXI_LITE_WSTRB_WIDTH-1:0] M_AXIL_wstrb,
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
    input logic [AXI_LITE_DATA_WIDTH-1:0] M_AXIL_rdata
);
    // Parameters
    localparam STATE_IDLE = 0;
    localparam STATE_WRITE = 1;
    localparam STATE_READ = 2;
    localparam STATE_WAIT_BRESP = 3;
    localparam STATE_BRESP_TIMEOUT = 5;
    localparam STATE_WAIT_RDATA = 4;
    localparam STATE_RDATA_TIMEOUT = 6;
    localparam MODE_READ = 0;
    localparam MODE_WRITE = 1;

    // Declarations
    logic [2:0] r_core_state;
    logic [AXI_LITE_DATA_WIDTH-1:0] r_vio_output;
    logic r_awvalid;
    logic [AXI_LITE_ADDR_WIDTH-1:0] r_awaddr;
    logic r_wvalid;
    logic [AXI_LITE_DATA_WIDTH-1:0] r_wdata;
    logic [AXI_LITE_WSTRB_WIDTH-1:0] r_wstrb;
    logic r_bready;
    logic r_arvalid;
    logic [AXI_LITE_ADDR_WIDTH-1:0] r_araddr;
    logic [1:0] r_write_ready_semaphore;
    logic [63:0] r_bresp_waiting_time;
    logic [63:0] r_rdata_waiting_time;
    logic [63:0] r_num_transactions_completed;

    // Assignments
    assign o_core_state = r_core_state;
    assign o_bresp_waiting_time = r_bresp_waiting_time;
    assign o_rdata_waiting_time = r_rdata_waiting_time;
    assign o_vio_output = r_vio_output;
    assign o_num_transactions_completed = r_num_transactions_completed;
    assign M_AXIL_awvalid = r_awvalid;
    assign M_AXIL_awaddr = r_awaddr;
    assign M_AXIL_wvalid = r_wvalid;
    assign M_AXIL_wdata = r_wdata;
    assign M_AXIL_wstrb = r_wstrb;
    assign M_AXIL_bready = (r_core_state == STATE_WAIT_BRESP ? 1 : 0);
    assign M_AXIL_arvalid = (r_core_state == STATE_READ ? 1 : 0);
    assign M_AXIL_araddr = r_araddr;
    assign M_AXIL_rready = (r_core_state == STATE_WAIT_RDATA ? 1 : 0);

    // Core State FSM
    always_ff @(posedge clk, negedge ap_rst_n) begin
        if (ap_rst_n == 0) begin
            r_core_state <= STATE_IDLE;
        end
        else begin
            case (r_core_state)
                STATE_IDLE: begin
                    if (i_vio_enable == 1) begin
                        r_core_state <= (i_vio_transaction_mode == MODE_WRITE ? STATE_WRITE : STATE_READ);
                    end
                    else begin
                        r_core_state <= r_core_state;
                    end
                end
                STATE_WRITE: begin
                    r_core_state <= (r_write_ready_semaphore == 2 ? STATE_WAIT_BRESP : r_core_state);
                end
                STATE_READ: begin
                    r_core_state <= (M_AXIL_arready == 1 ? STATE_WAIT_RDATA : r_core_state);
                end
                STATE_WAIT_BRESP: begin
                    //r_core_state <= (M_AXIL_bvalid == 1 ? STATE_IDLE : r_core_state);
                    if (r_bresp_waiting_time == TIMEOUT_DELAY) begin
                        r_core_state <= STATE_BRESP_TIMEOUT;
                    end
                    else begin
                        r_core_state <= (M_AXIL_bvalid == 1 ? STATE_IDLE : r_core_state);
                    end
                end
                STATE_WAIT_RDATA: begin
                    //r_core_state <= (M_AXIL_rvalid == 1 ? STATE_IDLE : r_core_state);
                    if (r_rdata_waiting_time == TIMEOUT_DELAY) begin
                        r_core_state <= STATE_RDATA_TIMEOUT;
                    end
                    else begin
                        r_core_state <= (M_AXIL_rvalid == 1 ? STATE_IDLE : r_core_state);
                    end
                end
                default: begin
                    r_core_state <= r_core_state;
                end
            endcase
        end
    end

    // Read from VIO
    always_ff @(posedge clk, negedge ap_rst_n) begin
        if (ap_rst_n == 0) begin
            r_araddr <= 0;
            r_awaddr <= 0;
            r_wdata <= 0;
            r_wstrb <= 0;
        end
        else if (r_core_state == STATE_IDLE && i_vio_enable == 1) begin
            case (i_vio_transaction_mode)
                MODE_READ: begin
                    r_araddr <= i_vio_address;
                    r_awaddr <= 0;
                    r_wdata <= 0;
                    r_wstrb <= 0;
                end
                MODE_WRITE: begin
                    r_araddr <= 0;
                    r_awaddr <= i_vio_address;
                    r_wdata <= i_vio_data;
                    r_wstrb <= i_vio_wstrb;
                end
            endcase
        end
        else begin
            r_araddr <= r_araddr;
            r_awaddr <= r_awaddr;
            r_wdata <= r_wdata;
            r_wstrb <= r_wstrb;
        end
    end

    // AXI-Lite Write valid and semaphore signals
    // A write transaction involves sending data over address and data lines. We can only change state from STATE_WRITE to STATE_WAIT_BRESP when both writes are complete, so setup a semaphore to record both writes
    always_ff @(posedge clk, negedge ap_rst_n) begin
        if (ap_rst_n == 0) begin
            r_awvalid <= 0;
            r_wvalid <= 0;
            r_write_ready_semaphore <= 0;
        end
        else if (r_core_state == STATE_IDLE && i_vio_enable == 1 && i_vio_transaction_mode == MODE_WRITE) begin
            // Preparing for a Write Transaction
            r_awvalid <= 1;
            r_wvalid <= 1;
            r_write_ready_semaphore <= 0;
        end
        else if (r_core_state == STATE_WRITE) begin
            if (M_AXIL_awready == 1 && M_AXIL_wready == 1) begin
                // Both data lines have received their data
                r_awvalid <= 0;
                r_wvalid <= 0;
                r_write_ready_semaphore <= 2;
            end
            else if (M_AXIL_awready == 1) begin
                // Data sent successfully over write address line
                r_awvalid <= 0;
                r_wvalid <= r_wvalid;
                r_write_ready_semaphore <= r_write_ready_semaphore + 1;
            end
            else if (M_AXIL_wready == 1) begin
                // Data sent successfully over write data line
                r_awvalid <= r_awvalid;
                r_wvalid <= 0;
                r_write_ready_semaphore <= r_write_ready_semaphore + 1;
            end
            else begin
                r_awvalid <= r_awvalid;
                r_wvalid <= r_wvalid;
                r_write_ready_semaphore <= r_write_ready_semaphore;
            end
        end
        else begin
            r_awvalid <= r_awvalid;
            r_wvalid <= r_wvalid;
            r_write_ready_semaphore <= r_write_ready_semaphore;
        end
    end 

    // AXI-Lite Write Response / Read Data signals
    always_ff @(posedge clk, negedge ap_rst_n) begin
        if (ap_rst_n == 0) begin
            r_vio_output <= 0;
        end
        else if (r_core_state == STATE_WAIT_BRESP && M_AXIL_bvalid == 1) begin
            r_vio_output[AXI_LITE_BRESP_WIDTH-1:0] <= M_AXIL_bresp;
            r_vio_output[AXI_LITE_DATA_WIDTH-1:AXI_LITE_BRESP_WIDTH] <= 0;
        end
        else if (r_core_state == STATE_WAIT_RDATA && M_AXIL_rvalid == 1) begin
            r_vio_output[AXI_LITE_DATA_WIDTH-1:0] <= M_AXIL_rdata;
        end
        else begin
            r_vio_output <= r_vio_output;
        end
    end

    // Timeout check
    always_ff @(posedge clk, negedge ap_rst_n) begin
        if (ap_rst_n == 0) begin
            r_bresp_waiting_time <= 0;
        end
        else if (r_core_state == STATE_WAIT_BRESP && M_AXIL_bvalid == 0) begin
            r_bresp_waiting_time <= r_bresp_waiting_time + 1;
        end
        else begin
            r_bresp_waiting_time <= 0;
        end
    end
    always_ff @(posedge clk, negedge ap_rst_n) begin
        if (ap_rst_n == 0) begin
            r_rdata_waiting_time <= 0;
        end
        else if (r_core_state == STATE_WAIT_RDATA && M_AXIL_rvalid == 0) begin
            r_rdata_waiting_time <= r_rdata_waiting_time + 1;
        end
        else begin
            r_rdata_waiting_time <= 0;
        end
    end

    // Count number of successful transactions
     always_ff @(posedge clk, negedge ap_rst_n) begin
        if (ap_rst_n == 0) begin
            r_num_transactions_completed <= 0;
        end
        else if (r_core_state == STATE_WAIT_RDATA && M_AXIL_rvalid == 1) begin
            r_num_transactions_completed <= r_num_transactions_completed + 1;
        end
        else if (r_core_state == STATE_WAIT_BRESP && M_AXIL_bvalid == 1) begin
            r_num_transactions_completed <= r_num_transactions_completed + 1;
        end
        else begin
            r_num_transactions_completed <= r_num_transactions_completed;
        end
    end
endmodule