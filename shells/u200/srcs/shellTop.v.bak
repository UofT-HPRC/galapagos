`timescale 1 ps / 1 ps

module shellTop
   (
    gt_ref_clk_n,
    gt_ref_clk_p,
    init_clk_n,
    init_clk_p);


  input gt_ref_clk_n;
  input gt_ref_clk_p;
  input [0:0]init_clk_n;
  input [0:0]init_clk_p;

  wire [0:0]ARESETN;
  wire CLK;
  wire CLK_300;
  wire [511:0]M_AXIS_tdata;
  wire [63:0]M_AXIS_tkeep;
  wire [0:0]M_AXIS_tlast;
  wire [0:0]M_AXIS_tready;
  wire [0:0]M_AXIS_tvalid;
  wire [511:0]S_AXIS_tdata;
  wire [63:0]S_AXIS_tkeep;
  wire [0:0]S_AXIS_tlast;
  wire [0:0]S_AXIS_tvalid;
  wire [39:0]S_AXI_CONTROL_araddr;
  wire [2:0]S_AXI_CONTROL_arprot;
  wire [0:0]S_AXI_CONTROL_arready;
  wire [0:0]S_AXI_CONTROL_arvalid;
  wire [39:0]S_AXI_CONTROL_awaddr;
  wire [2:0]S_AXI_CONTROL_awprot;
  wire [0:0]S_AXI_CONTROL_awready;
  wire [0:0]S_AXI_CONTROL_awvalid;
  wire [0:0]S_AXI_CONTROL_bready;
  wire [1:0]S_AXI_CONTROL_bresp;
  wire [0:0]S_AXI_CONTROL_bvalid;
  wire [31:0]S_AXI_CONTROL_rdata;
  wire [0:0]S_AXI_CONTROL_rready;
  wire [1:0]S_AXI_CONTROL_rresp;
  wire [0:0]S_AXI_CONTROL_rvalid;
  wire [31:0]S_AXI_CONTROL_wdata;
  wire [0:0]S_AXI_CONTROL_wready;
  wire [3:0]S_AXI_CONTROL_wstrb;
  wire [0:0]S_AXI_CONTROL_wvalid;
  wire [31:0]S_AXI_MEM_0_araddr;
  wire [1:0]S_AXI_MEM_0_arburst;
  wire [3:0]S_AXI_MEM_0_arcache;
  wire [7:0]S_AXI_MEM_0_arlen;
  wire [0:0]S_AXI_MEM_0_arlock;
  wire [2:0]S_AXI_MEM_0_arprot;
  wire [3:0]S_AXI_MEM_0_arqos;
  wire S_AXI_MEM_0_arready;
  wire [2:0]S_AXI_MEM_0_arsize;
  wire S_AXI_MEM_0_arvalid;
  wire [31:0]S_AXI_MEM_0_awaddr;
  wire [1:0]S_AXI_MEM_0_awburst;
  wire [3:0]S_AXI_MEM_0_awcache;
  wire [7:0]S_AXI_MEM_0_awlen;
  wire [0:0]S_AXI_MEM_0_awlock;
  wire [2:0]S_AXI_MEM_0_awprot;
  wire [3:0]S_AXI_MEM_0_awqos;
  wire S_AXI_MEM_0_awready;
  wire [2:0]S_AXI_MEM_0_awsize;
  wire S_AXI_MEM_0_awvalid;
  wire S_AXI_MEM_0_bready;
  wire [1:0]S_AXI_MEM_0_bresp;
  wire S_AXI_MEM_0_bvalid;
  wire [511:0]S_AXI_MEM_0_rdata;
  wire S_AXI_MEM_0_rlast;
  wire S_AXI_MEM_0_rready;
  wire [1:0]S_AXI_MEM_0_rresp;
  wire S_AXI_MEM_0_rvalid;
  wire [511:0]S_AXI_MEM_0_wdata;
  wire S_AXI_MEM_0_wlast;
  wire S_AXI_MEM_0_wready;
  wire [63:0]S_AXI_MEM_0_wstrb;
  wire S_AXI_MEM_0_wvalid;
  wire [31:0]S_AXI_MEM_1_araddr;
  wire [1:0]S_AXI_MEM_1_arburst;
  wire [3:0]S_AXI_MEM_1_arcache;
  wire [7:0]S_AXI_MEM_1_arlen;
  wire [0:0]S_AXI_MEM_1_arlock;
  wire [2:0]S_AXI_MEM_1_arprot;
  wire [3:0]S_AXI_MEM_1_arqos;
  wire S_AXI_MEM_1_arready;
  wire [2:0]S_AXI_MEM_1_arsize;
  wire S_AXI_MEM_1_arvalid;
  wire [31:0]S_AXI_MEM_1_awaddr;
  wire [1:0]S_AXI_MEM_1_awburst;
  wire [3:0]S_AXI_MEM_1_awcache;
  wire [7:0]S_AXI_MEM_1_awlen;
  wire [0:0]S_AXI_MEM_1_awlock;
  wire [2:0]S_AXI_MEM_1_awprot;
  wire [3:0]S_AXI_MEM_1_awqos;
  wire S_AXI_MEM_1_awready;
  wire [2:0]S_AXI_MEM_1_awsize;
  wire S_AXI_MEM_1_awvalid;
  wire S_AXI_MEM_1_bready;
  wire [1:0]S_AXI_MEM_1_bresp;
  wire S_AXI_MEM_1_bvalid;
  wire [511:0]S_AXI_MEM_1_rdata;
  wire S_AXI_MEM_1_rlast;
  wire S_AXI_MEM_1_rready;
  wire [1:0]S_AXI_MEM_1_rresp;
  wire S_AXI_MEM_1_rvalid;
  wire [511:0]S_AXI_MEM_1_wdata;
  wire S_AXI_MEM_1_wlast;
  wire S_AXI_MEM_1_wready;
  wire [63:0]S_AXI_MEM_1_wstrb;
  wire S_AXI_MEM_1_wvalid;
  wire gt_ref_clk_n;
  wire gt_ref_clk_p;
  wire [0:0]init_clk_n;
  wire [0:0]init_clk_p;

  shell shell_i
       (.ARESETN(ARESETN),
        .CLK(CLK),
        .CLK_300(CLK_300),
        .M_AXIS_tdata(M_AXIS_tdata),
        .M_AXIS_tkeep(M_AXIS_tkeep),
        .M_AXIS_tlast(M_AXIS_tlast),
        .M_AXIS_tready(M_AXIS_tready),
        .M_AXIS_tvalid(M_AXIS_tvalid),
        .S_AXIS_tdata(S_AXIS_tdata),
        .S_AXIS_tkeep(S_AXIS_tkeep),
        .S_AXIS_tlast(S_AXIS_tlast),
        .S_AXIS_tvalid(S_AXIS_tvalid),
        .S_AXI_CONTROL_araddr(S_AXI_CONTROL_araddr),
        .S_AXI_CONTROL_arprot(S_AXI_CONTROL_arprot),
        .S_AXI_CONTROL_arready(S_AXI_CONTROL_arready),
        .S_AXI_CONTROL_arvalid(S_AXI_CONTROL_arvalid),
        .S_AXI_CONTROL_awaddr(S_AXI_CONTROL_awaddr),
        .S_AXI_CONTROL_awprot(S_AXI_CONTROL_awprot),
        .S_AXI_CONTROL_awready(S_AXI_CONTROL_awready),
        .S_AXI_CONTROL_awvalid(S_AXI_CONTROL_awvalid),
        .S_AXI_CONTROL_bready(S_AXI_CONTROL_bready),
        .S_AXI_CONTROL_bresp(S_AXI_CONTROL_bresp),
        .S_AXI_CONTROL_bvalid(S_AXI_CONTROL_bvalid),
        .S_AXI_CONTROL_rdata(S_AXI_CONTROL_rdata),
        .S_AXI_CONTROL_rready(S_AXI_CONTROL_rready),
        .S_AXI_CONTROL_rresp(S_AXI_CONTROL_rresp),
        .S_AXI_CONTROL_rvalid(S_AXI_CONTROL_rvalid),
        .S_AXI_CONTROL_wdata(S_AXI_CONTROL_wdata),
        .S_AXI_CONTROL_wready(S_AXI_CONTROL_wready),
        .S_AXI_CONTROL_wstrb(S_AXI_CONTROL_wstrb),
        .S_AXI_CONTROL_wvalid(S_AXI_CONTROL_wvalid),
        .S_AXI_MEM_0_araddr(S_AXI_MEM_0_araddr),
        .S_AXI_MEM_0_arburst(S_AXI_MEM_0_arburst),
        .S_AXI_MEM_0_arcache(S_AXI_MEM_0_arcache),
        .S_AXI_MEM_0_arlen(S_AXI_MEM_0_arlen),
        .S_AXI_MEM_0_arlock(S_AXI_MEM_0_arlock),
        .S_AXI_MEM_0_arprot(S_AXI_MEM_0_arprot),
        .S_AXI_MEM_0_arqos(S_AXI_MEM_0_arqos),
        .S_AXI_MEM_0_arready(S_AXI_MEM_0_arready),
        .S_AXI_MEM_0_arsize(S_AXI_MEM_0_arsize),
        .S_AXI_MEM_0_arvalid(S_AXI_MEM_0_arvalid),
        .S_AXI_MEM_0_awaddr(S_AXI_MEM_0_awaddr),
        .S_AXI_MEM_0_awburst(S_AXI_MEM_0_awburst),
        .S_AXI_MEM_0_awcache(S_AXI_MEM_0_awcache),
        .S_AXI_MEM_0_awlen(S_AXI_MEM_0_awlen),
        .S_AXI_MEM_0_awlock(S_AXI_MEM_0_awlock),
        .S_AXI_MEM_0_awprot(S_AXI_MEM_0_awprot),
        .S_AXI_MEM_0_awqos(S_AXI_MEM_0_awqos),
        .S_AXI_MEM_0_awready(S_AXI_MEM_0_awready),
        .S_AXI_MEM_0_awsize(S_AXI_MEM_0_awsize),
        .S_AXI_MEM_0_awvalid(S_AXI_MEM_0_awvalid),
        .S_AXI_MEM_0_bready(S_AXI_MEM_0_bready),
        .S_AXI_MEM_0_bresp(S_AXI_MEM_0_bresp),
        .S_AXI_MEM_0_bvalid(S_AXI_MEM_0_bvalid),
        .S_AXI_MEM_0_rdata(S_AXI_MEM_0_rdata),
        .S_AXI_MEM_0_rlast(S_AXI_MEM_0_rlast),
        .S_AXI_MEM_0_rready(S_AXI_MEM_0_rready),
        .S_AXI_MEM_0_rresp(S_AXI_MEM_0_rresp),
        .S_AXI_MEM_0_rvalid(S_AXI_MEM_0_rvalid),
        .S_AXI_MEM_0_wdata(S_AXI_MEM_0_wdata),
        .S_AXI_MEM_0_wlast(S_AXI_MEM_0_wlast),
        .S_AXI_MEM_0_wready(S_AXI_MEM_0_wready),
        .S_AXI_MEM_0_wstrb(S_AXI_MEM_0_wstrb),
        .S_AXI_MEM_0_wvalid(S_AXI_MEM_0_wvalid),
        .S_AXI_MEM_1_araddr(S_AXI_MEM_1_araddr),
        .S_AXI_MEM_1_arburst(S_AXI_MEM_1_arburst),
        .S_AXI_MEM_1_arcache(S_AXI_MEM_1_arcache),
        .S_AXI_MEM_1_arlen(S_AXI_MEM_1_arlen),
        .S_AXI_MEM_1_arlock(S_AXI_MEM_1_arlock),
        .S_AXI_MEM_1_arprot(S_AXI_MEM_1_arprot),
        .S_AXI_MEM_1_arqos(S_AXI_MEM_1_arqos),
        .S_AXI_MEM_1_arready(S_AXI_MEM_1_arready),
        .S_AXI_MEM_1_arsize(S_AXI_MEM_1_arsize),
        .S_AXI_MEM_1_arvalid(S_AXI_MEM_1_arvalid),
        .S_AXI_MEM_1_awaddr(S_AXI_MEM_1_awaddr),
        .S_AXI_MEM_1_awburst(S_AXI_MEM_1_awburst),
        .S_AXI_MEM_1_awcache(S_AXI_MEM_1_awcache),
        .S_AXI_MEM_1_awlen(S_AXI_MEM_1_awlen),
        .S_AXI_MEM_1_awlock(S_AXI_MEM_1_awlock),
        .S_AXI_MEM_1_awprot(S_AXI_MEM_1_awprot),
        .S_AXI_MEM_1_awqos(S_AXI_MEM_1_awqos),
        .S_AXI_MEM_1_awready(S_AXI_MEM_1_awready),
        .S_AXI_MEM_1_awsize(S_AXI_MEM_1_awsize),
        .S_AXI_MEM_1_awvalid(S_AXI_MEM_1_awvalid),
        .S_AXI_MEM_1_bready(S_AXI_MEM_1_bready),
        .S_AXI_MEM_1_bresp(S_AXI_MEM_1_bresp),
        .S_AXI_MEM_1_bvalid(S_AXI_MEM_1_bvalid),
        .S_AXI_MEM_1_rdata(S_AXI_MEM_1_rdata),
        .S_AXI_MEM_1_rlast(S_AXI_MEM_1_rlast),
        .S_AXI_MEM_1_rready(S_AXI_MEM_1_rready),
        .S_AXI_MEM_1_rresp(S_AXI_MEM_1_rresp),
        .S_AXI_MEM_1_rvalid(S_AXI_MEM_1_rvalid),
        .S_AXI_MEM_1_wdata(S_AXI_MEM_1_wdata),
        .S_AXI_MEM_1_wlast(S_AXI_MEM_1_wlast),
        .S_AXI_MEM_1_wready(S_AXI_MEM_1_wready),
        .S_AXI_MEM_1_wstrb(S_AXI_MEM_1_wstrb),
        .S_AXI_MEM_1_wvalid(S_AXI_MEM_1_wvalid),
        .gt_ref_clk_n(gt_ref_clk_n),
        .gt_ref_clk_p(gt_ref_clk_p),
        .init_clk_n(init_clk_n),
        .init_clk_p(init_clk_p));
        
        
  pr pr_i
       (.ARESETN(ARESETN),
        .CLK(CLK),
        .CLK_300(CLK_300),
        .M_AXIS_tdata(M_AXIS_tdata),
        .M_AXIS_tkeep(M_AXIS_tkeep),
        .M_AXIS_tlast(M_AXIS_tlast),
        .M_AXIS_tready(M_AXIS_tready),
        .M_AXIS_tvalid(M_AXIS_tvalid),
        .S_AXIS_tdata(S_AXIS_tdata),
        .S_AXIS_tkeep(S_AXIS_tkeep),
        .S_AXIS_tlast(S_AXIS_tlast),
        .S_AXIS_tvalid(S_AXIS_tvalid),
        .S_AXI_CONTROL_araddr(S_AXI_CONTROL_araddr),
        .S_AXI_CONTROL_arprot(S_AXI_CONTROL_arprot),
        .S_AXI_CONTROL_arready(S_AXI_CONTROL_arready),
        .S_AXI_CONTROL_arvalid(S_AXI_CONTROL_arvalid),
        .S_AXI_CONTROL_awaddr(S_AXI_CONTROL_awaddr),
        .S_AXI_CONTROL_awprot(S_AXI_CONTROL_awprot),
        .S_AXI_CONTROL_awready(S_AXI_CONTROL_awready),
        .S_AXI_CONTROL_awvalid(S_AXI_CONTROL_awvalid),
        .S_AXI_CONTROL_bready(S_AXI_CONTROL_bready),
        .S_AXI_CONTROL_bresp(S_AXI_CONTROL_bresp),
        .S_AXI_CONTROL_bvalid(S_AXI_CONTROL_bvalid),
        .S_AXI_CONTROL_rdata(S_AXI_CONTROL_rdata),
        .S_AXI_CONTROL_rready(S_AXI_CONTROL_rready),
        .S_AXI_CONTROL_rresp(S_AXI_CONTROL_rresp),
        .S_AXI_CONTROL_rvalid(S_AXI_CONTROL_rvalid),
        .S_AXI_CONTROL_wdata(S_AXI_CONTROL_wdata),
        .S_AXI_CONTROL_wready(S_AXI_CONTROL_wready),
        .S_AXI_CONTROL_wstrb(S_AXI_CONTROL_wstrb),
        .S_AXI_CONTROL_wvalid(S_AXI_CONTROL_wvalid),
        .S_AXI_MEM_0_araddr(S_AXI_MEM_0_araddr),
        .S_AXI_MEM_0_arburst(S_AXI_MEM_0_arburst),
        .S_AXI_MEM_0_arcache(S_AXI_MEM_0_arcache),
        .S_AXI_MEM_0_arlen(S_AXI_MEM_0_arlen),
        .S_AXI_MEM_0_arlock(S_AXI_MEM_0_arlock),
        .S_AXI_MEM_0_arprot(S_AXI_MEM_0_arprot),
        .S_AXI_MEM_0_arqos(S_AXI_MEM_0_arqos),
        .S_AXI_MEM_0_arready(S_AXI_MEM_0_arready),
        .S_AXI_MEM_0_arregion(S_AXI_MEM_0_arregion),
        .S_AXI_MEM_0_arsize(S_AXI_MEM_0_arsize),
        .S_AXI_MEM_0_arvalid(S_AXI_MEM_0_arvalid),
        .S_AXI_MEM_0_awaddr(S_AXI_MEM_0_awaddr),
        .S_AXI_MEM_0_awburst(S_AXI_MEM_0_awburst),
        .S_AXI_MEM_0_awcache(S_AXI_MEM_0_awcache),
        .S_AXI_MEM_0_awlen(S_AXI_MEM_0_awlen),
        .S_AXI_MEM_0_awlock(S_AXI_MEM_0_awlock),
        .S_AXI_MEM_0_awprot(S_AXI_MEM_0_awprot),
        .S_AXI_MEM_0_awqos(S_AXI_MEM_0_awqos),
        .S_AXI_MEM_0_awready(S_AXI_MEM_0_awready),
        .S_AXI_MEM_0_awregion(S_AXI_MEM_0_awregion),
        .S_AXI_MEM_0_awsize(S_AXI_MEM_0_awsize),
        .S_AXI_MEM_0_awvalid(S_AXI_MEM_0_awvalid),
        .S_AXI_MEM_0_bready(S_AXI_MEM_0_bready),
        .S_AXI_MEM_0_bresp(S_AXI_MEM_0_bresp),
        .S_AXI_MEM_0_bvalid(S_AXI_MEM_0_bvalid),
        .S_AXI_MEM_0_rdata(S_AXI_MEM_0_rdata),
        .S_AXI_MEM_0_rlast(S_AXI_MEM_0_rlast),
        .S_AXI_MEM_0_rready(S_AXI_MEM_0_rready),
        .S_AXI_MEM_0_rresp(S_AXI_MEM_0_rresp),
        .S_AXI_MEM_0_rvalid(S_AXI_MEM_0_rvalid),
        .S_AXI_MEM_0_wdata(S_AXI_MEM_0_wdata),
        .S_AXI_MEM_0_wlast(S_AXI_MEM_0_wlast),
        .S_AXI_MEM_0_wready(S_AXI_MEM_0_wready),
        .S_AXI_MEM_0_wstrb(S_AXI_MEM_0_wstrb),
        .S_AXI_MEM_0_wvalid(S_AXI_MEM_0_wvalid),
        .S_AXI_MEM_1_araddr(S_AXI_MEM_1_araddr),
        .S_AXI_MEM_1_arburst(S_AXI_MEM_1_arburst),
        .S_AXI_MEM_1_arcache(S_AXI_MEM_1_arcache),
        .S_AXI_MEM_1_arlen(S_AXI_MEM_1_arlen),
        .S_AXI_MEM_1_arlock(S_AXI_MEM_1_arlock),
        .S_AXI_MEM_1_arprot(S_AXI_MEM_1_arprot),
        .S_AXI_MEM_1_arqos(S_AXI_MEM_1_arqos),
        .S_AXI_MEM_1_arready(S_AXI_MEM_1_arready),
        .S_AXI_MEM_1_arregion(S_AXI_MEM_1_arregion),
        .S_AXI_MEM_1_arsize(S_AXI_MEM_1_arsize),
        .S_AXI_MEM_1_arvalid(S_AXI_MEM_1_arvalid),
        .S_AXI_MEM_1_awaddr(S_AXI_MEM_1_awaddr),
        .S_AXI_MEM_1_awburst(S_AXI_MEM_1_awburst),
        .S_AXI_MEM_1_awcache(S_AXI_MEM_1_awcache),
        .S_AXI_MEM_1_awlen(S_AXI_MEM_1_awlen),
        .S_AXI_MEM_1_awlock(S_AXI_MEM_1_awlock),
        .S_AXI_MEM_1_awprot(S_AXI_MEM_1_awprot),
        .S_AXI_MEM_1_awqos(S_AXI_MEM_1_awqos),
        .S_AXI_MEM_1_awready(S_AXI_MEM_1_awready),
        .S_AXI_MEM_1_awregion(S_AXI_MEM_1_awregion),
        .S_AXI_MEM_1_awsize(S_AXI_MEM_1_awsize),
        .S_AXI_MEM_1_awvalid(S_AXI_MEM_1_awvalid),
        .S_AXI_MEM_1_bready(S_AXI_MEM_1_bready),
        .S_AXI_MEM_1_bresp(S_AXI_MEM_1_bresp),
        .S_AXI_MEM_1_bvalid(S_AXI_MEM_1_bvalid),
        .S_AXI_MEM_1_rdata(S_AXI_MEM_1_rdata),
        .S_AXI_MEM_1_rlast(S_AXI_MEM_1_rlast),
        .S_AXI_MEM_1_rready(S_AXI_MEM_1_rready),
        .S_AXI_MEM_1_rresp(S_AXI_MEM_1_rresp),
        .S_AXI_MEM_1_rvalid(S_AXI_MEM_1_rvalid),
        .S_AXI_MEM_1_wdata(S_AXI_MEM_1_wdata),
        .S_AXI_MEM_1_wlast(S_AXI_MEM_1_wlast),
        .S_AXI_MEM_1_wready(S_AXI_MEM_1_wready),
        .S_AXI_MEM_1_wstrb(S_AXI_MEM_1_wstrb),
        .S_AXI_MEM_1_wvalid(S_AXI_MEM_1_wvalid));
        
endmodule
