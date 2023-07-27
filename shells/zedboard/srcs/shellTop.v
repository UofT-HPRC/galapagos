//--------------------------------------------------------------------------------
//Galapagos Top Level Module for Pynq Z2
//Author: Varun Sharma, Naif Tarafdar
//Date        : Mar 21 2019
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module shellTop(
    DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    leds,
    btns,
    sw
);

    inout [14:0]DDR_addr;
    inout [2:0]DDR_ba;
    inout DDR_cas_n;
    inout DDR_ck_n;
    inout DDR_ck_p;
    inout DDR_cke;
    inout DDR_cs_n;
    inout [3:0]DDR_dm;
    inout [31:0]DDR_dq;
    inout [3:0]DDR_dqs_n;
    inout [3:0]DDR_dqs_p;
    inout DDR_odt;
    inout DDR_ras_n;
    inout DDR_reset_n;
    inout DDR_we_n;
    inout FIXED_IO_ddr_vrn;
    inout FIXED_IO_ddr_vrp;
    inout [53:0]FIXED_IO_mio;
    inout FIXED_IO_ps_clk;
    inout FIXED_IO_ps_porb;
    inout FIXED_IO_ps_srstb;
    output [7:0] leds;
    input [4:0] btns;
    input [7:0] sw;

    (* keep = "true" *) wire [0:0]ARESETN;
    (* keep = "true" *) wire CLK_DATA;
    (* keep = "true" *) wire [63:0]M_AXIS_tdata;
    (* keep = "true" *) wire [7:0]M_AXIS_tkeep;
    (* keep = "true" *) wire [0:0]M_AXIS_tlast;
    (* keep = "true" *) wire M_AXIS_tready;
    (* keep = "true" *) wire M_AXIS_tvalid;
    (* keep = "true" *) wire [63:0]M_AXI_CONTROL_araddr;
    (* keep = "true" *) wire [2:0]M_AXI_CONTROL_arprot;
    (* keep = "true" *) wire [3:0]M_AXI_CONTROL_arqos;
    (* keep = "true" *) wire M_AXI_CONTROL_arready;
    (* keep = "true" *) wire [3:0]M_AXI_CONTROL_arregion;
    (* keep = "true" *) wire M_AXI_CONTROL_arvalid;
    (* keep = "true" *) wire [63:0]M_AXI_CONTROL_awaddr;
    (* keep = "true" *) wire [2:0]M_AXI_CONTROL_awprot;
    (* keep = "true" *) wire [3:0]M_AXI_CONTROL_awqos;
    (* keep = "true" *) wire M_AXI_CONTROL_awready;
    (* keep = "true" *) wire [3:0]M_AXI_CONTROL_awregion;
    (* keep = "true" *) wire M_AXI_CONTROL_awvalid;
    (* keep = "true" *) wire M_AXI_CONTROL_bready;
    (* keep = "true" *) wire [1:0]M_AXI_CONTROL_bresp;
    (* keep = "true" *) wire M_AXI_CONTROL_bvalid;
    (* keep = "true" *) wire [31:0]M_AXI_CONTROL_rdata;
    (* keep = "true" *) wire M_AXI_CONTROL_rready;
    (* keep = "true" *) wire [1:0]M_AXI_CONTROL_rresp;
    (* keep = "true" *) wire M_AXI_CONTROL_rvalid;
    (* keep = "true" *) wire [31:0]M_AXI_CONTROL_wdata;
    (* keep = "true" *) wire M_AXI_CONTROL_wready;
    (* keep = "true" *) wire [31:0]M_AXI_CONTROL_wstrb;
    (* keep = "true" *) wire M_AXI_CONTROL_wvalid;
    (* keep = "true" *) wire [63:0]S_AXIS_tdata;
    (* keep = "true" *) wire [7:0]S_AXIS_tkeep;
    (* keep = "true" *) wire [0:0]S_AXIS_tlast;
    (* keep = "true" *) wire S_AXIS_tready;
    (* keep = "true" *) wire S_AXIS_tvalid;
    (* keep = "true" *) wire [31:0] S_AXI_MEM_0_araddr;
    (* keep = "true" *) wire [1:0] S_AXI_MEM_0_arburst;
    (* keep = "true" *) wire [3:0] S_AXI_MEM_0_arcache;
    (* keep = "true" *) wire [1:0] S_AXI_MEM_0_arid;
    (* keep = "true" *) wire [7:0] S_AXI_MEM_0_arlen;
    (* keep = "true" *) wire [0:0] S_AXI_MEM_0_arlock;
    (* keep = "true" *) wire [2:0] S_AXI_MEM_0_arprot;
    (* keep = "true" *) wire [3:0] S_AXI_MEM_0_arqos;
    (* keep = "true" *) wire [3:0] S_AXI_MEM_0_arregion;
    (* keep = "true" *) wire [2:0] S_AXI_MEM_0_arsize;
    (* keep = "true" *) wire S_AXI_MEM_0_arvalid;
    (* keep = "true" *) wire [31:0] S_AXI_MEM_0_awaddr;
    (* keep = "true" *) wire [1:0] S_AXI_MEM_0_awburst;
    (* keep = "true" *) wire [3:0] S_AXI_MEM_0_awcache;
    (* keep = "true" *) wire [1:0] S_AXI_MEM_0_awid;
    (* keep = "true" *) wire [7:0] S_AXI_MEM_0_awlen;
    (* keep = "true" *) wire [0:0] S_AXI_MEM_0_awlock;
    (* keep = "true" *) wire [2:0] S_AXI_MEM_0_awprot;
    (* keep = "true" *) wire [3:0] S_AXI_MEM_0_awqos;
    (* keep = "true" *) wire [3:0] S_AXI_MEM_0_awregion;
    (* keep = "true" *) wire [2:0] S_AXI_MEM_0_awsize;
    (* keep = "true" *) wire S_AXI_MEM_0_awvalid;
    (* keep = "true" *) wire [1:0] S_AXI_MEM_0_bid;
    (* keep = "true" *) wire S_AXI_MEM_0_bready;
    (* keep = "true" *) wire S_AXI_MEM_0_rready;
    (* keep = "true" *) wire [63:0] S_AXI_MEM_0_wdata;
    (* keep = "true" *) wire S_AXI_MEM_0_wlast;
    (* keep = "true" *) wire [63:0] S_AXI_MEM_0_wstrb;
    (* keep = "true" *) wire S_AXI_MEM_0_wvalid;
    (* keep = "true" *) wire S_AXI_MEM_0_arready;
    (* keep = "true" *) wire S_AXI_MEM_0_awready;
    (* keep = "true" *) wire [1:0] S_AXI_MEM_0_bresp;
    (* keep = "true" *) wire S_AXI_MEM_0_bvalid;
    (* keep = "true" *) wire [63:0] S_AXI_MEM_0_rdata;
    (* keep = "true" *) wire [1:0]S_AXI_MEM_0_rid;
    (* keep = "true" *) wire S_AXI_MEM_0_rlast;
    (* keep = "true" *) wire [1:0] S_AXI_MEM_0_rresp;
    (* keep = "true" *) wire S_AXI_MEM_0_rvalid;
    (* keep = "true" *) wire S_AXI_MEM_0_wready;
    (* keep = "true" *) wire [31:0] S_AXI_MEM_1_araddr;
    (* keep = "true" *) wire [1:0] S_AXI_MEM_1_arburst;
    (* keep = "true" *) wire [3:0] S_AXI_MEM_1_arcache;
    (* keep = "true" *) wire [1:0] S_AXI_MEM_1_arid;
    (* keep = "true" *) wire [7:0] S_AXI_MEM_1_arlen;
    (* keep = "true" *) wire [0:0] S_AXI_MEM_1_arlock;
    (* keep = "true" *) wire [2:0] S_AXI_MEM_1_arprot;
    (* keep = "true" *) wire [3:0] S_AXI_MEM_1_arqos;
    // (* keep = "true" *) wire [3:0] S_AXI_MEM_1_arregion;
    (* keep = "true" *) wire [2:0] S_AXI_MEM_1_arsize;
    (* keep = "true" *) wire S_AXI_MEM_1_arvalid;
    (* keep = "true" *) wire [31:0] S_AXI_MEM_1_awaddr;
    (* keep = "true" *) wire [1:0] S_AXI_MEM_1_awburst;
    (* keep = "true" *) wire [3:0] S_AXI_MEM_1_awcache;
    (* keep = "true" *) wire [1:0] S_AXI_MEM_1_awid;
    (* keep = "true" *) wire [7:0] S_AXI_MEM_1_awlen;
    (* keep = "true" *) wire [0:0] S_AXI_MEM_1_awlock;
    (* keep = "true" *) wire [2:0] S_AXI_MEM_1_awprot;
    (* keep = "true" *) wire [3:0] S_AXI_MEM_1_awqos;
    // (* keep = "true" *) wire [3:0] S_AXI_MEM_1_awregion;
    (* keep = "true" *) wire [2:0] S_AXI_MEM_1_awsize;
    (* keep = "true" *) wire S_AXI_MEM_1_awvalid;
    (* keep = "true" *) wire [1:0] S_AXI_MEM_1_bid;
    (* keep = "true" *) wire S_AXI_MEM_1_bready;
    (* keep = "true" *) wire S_AXI_MEM_1_rready;
    (* keep = "true" *) wire [63:0] S_AXI_MEM_1_wdata;
    (* keep = "true" *) wire S_AXI_MEM_1_wlast;
    (* keep = "true" *) wire [63:0] S_AXI_MEM_1_wstrb;
    (* keep = "true" *) wire S_AXI_MEM_1_wvalid;
    (* keep = "true" *) wire S_AXI_MEM_1_arready;
    (* keep = "true" *) wire S_AXI_MEM_1_awready;
    (* keep = "true" *) wire [1:0] S_AXI_MEM_1_bresp;
    (* keep = "true" *) wire S_AXI_MEM_1_bvalid;
    (* keep = "true" *) wire [63:0] S_AXI_MEM_1_rdata;
    (* keep = "true" *) wire [1:0]S_AXI_MEM_1_rid;
    (* keep = "true" *) wire S_AXI_MEM_1_rlast;
    (* keep = "true" *) wire [1:0] S_AXI_MEM_1_rresp;
    (* keep = "true" *) wire S_AXI_MEM_1_rvalid;
    (* keep = "true" *) wire S_AXI_MEM_1_wready;

  
    shell shell_i (
        .ARESETN(ARESETN),
        .CLK_DATA(CLK_DATA),
        .M_AXIS_tdata(M_AXIS_tdata),
        .M_AXIS_tkeep(M_AXIS_tkeep),
        .M_AXIS_tlast(M_AXIS_tlast),
        .M_AXIS_tready(M_AXIS_tready),
        .M_AXIS_tvalid(M_AXIS_tvalid),
        .M_AXI_CONTROL_araddr(M_AXI_CONTROL_araddr),
        .M_AXI_CONTROL_arprot(M_AXI_CONTROL_arprot),
        ////.M_AXI_CONTROL_arqos(M_AXI_CONTROL_arqos),
        .M_AXI_CONTROL_arready(M_AXI_CONTROL_arready),
        ////.M_AXI_CONTROL_arregion(M_AXI_CONTROL_arregion),
        ////.M_AXI_CONTROL_arsize(M_AXI_CONTROL_arsize),
        .M_AXI_CONTROL_arvalid(M_AXI_CONTROL_arvalid),
        .M_AXI_CONTROL_awaddr(M_AXI_CONTROL_awaddr),
        ////.M_AXI_CONTROL_awburst(M_AXI_CONTROL_awburst),
        ////.M_AXI_CONTROL_awcache(M_AXI_CONTROL_awcache),
        ////.M_AXI_CONTROL_awlen(M_AXI_CONTROL_awlen),
        ////.M_AXI_CONTROL_awlock(M_AXI_CONTROL_awlock),
        .M_AXI_CONTROL_awprot(M_AXI_CONTROL_awprot),
        ////.M_AXI_CONTROL_awqos(M_AXI_CONTROL_awqos),
        .M_AXI_CONTROL_awready(M_AXI_CONTROL_awready),
        ////.M_AXI_CONTROL_awregion(M_AXI_CONTROL_awregion),
        ////.M_AXI_CONTROL_awsize(M_AXI_CONTROL_awsize),
        .M_AXI_CONTROL_awvalid(M_AXI_CONTROL_awvalid),
        .M_AXI_CONTROL_bready(M_AXI_CONTROL_bready),
        .M_AXI_CONTROL_bresp(M_AXI_CONTROL_bresp),
        .M_AXI_CONTROL_bvalid(M_AXI_CONTROL_bvalid),
        .M_AXI_CONTROL_rdata(M_AXI_CONTROL_rdata),
        ////.M_AXI_CONTROL_rlast(M_AXI_CONTROL_rlast),
        .M_AXI_CONTROL_rready(M_AXI_CONTROL_rready),
        .M_AXI_CONTROL_rresp(M_AXI_CONTROL_rresp),
        .M_AXI_CONTROL_rvalid(M_AXI_CONTROL_rvalid),
        .M_AXI_CONTROL_wdata(M_AXI_CONTROL_wdata),
        ////.M_AXI_CONTROL_wlast(M_AXI_CONTROL_wlast),
        .M_AXI_CONTROL_wready(M_AXI_CONTROL_wready),
        .M_AXI_CONTROL_wstrb(M_AXI_CONTROL_wstrb),
        .M_AXI_CONTROL_wvalid(M_AXI_CONTROL_wvalid),
        .S_AXIS_tdata(S_AXIS_tdata),
        .S_AXIS_tkeep(S_AXIS_tkeep),
        .S_AXIS_tlast(S_AXIS_tlast),
        .S_AXIS_tready(S_AXIS_tready),
        .S_AXIS_tvalid(S_AXIS_tvalid),
        .S_AXI_MEM_0_araddr(S_AXI_MEM_0_araddr),
        .S_AXI_MEM_0_arburst(S_AXI_MEM_0_arburst),
        .S_AXI_MEM_0_arcache(S_AXI_MEM_0_arcache),
        .S_AXI_MEM_0_arid(S_AXI_MEM_0_arid),
        .S_AXI_MEM_0_arlen(S_AXI_MEM_0_arlen),
        .S_AXI_MEM_0_arlock(S_AXI_MEM_0_arlock),
        .S_AXI_MEM_0_arprot(S_AXI_MEM_0_arprot),
        .S_AXI_MEM_0_arqos(S_AXI_MEM_0_arqos),
        .S_AXI_MEM_0_arregion(S_AXI_MEM_0_arregion),
        .S_AXI_MEM_0_arsize(S_AXI_MEM_0_arsize),
        .S_AXI_MEM_0_arvalid(S_AXI_MEM_0_arvalid),
        .S_AXI_MEM_0_awaddr(S_AXI_MEM_0_awaddr),
        .S_AXI_MEM_0_awburst(S_AXI_MEM_0_awburst),
        .S_AXI_MEM_0_awcache(S_AXI_MEM_0_awcache),
        .S_AXI_MEM_0_awid(S_AXI_MEM_0_awid),
        .S_AXI_MEM_0_awlen(S_AXI_MEM_0_awlen),
        .S_AXI_MEM_0_awlock(S_AXI_MEM_0_awlock),
        .S_AXI_MEM_0_awprot(S_AXI_MEM_0_awprot),
        .S_AXI_MEM_0_awqos(S_AXI_MEM_0_awqos),
        .S_AXI_MEM_0_awregion(S_AXI_MEM_0_awregion),
        .S_AXI_MEM_0_awsize(S_AXI_MEM_0_awsize),
        .S_AXI_MEM_0_awvalid(S_AXI_MEM_0_awvalid),
        .S_AXI_MEM_0_bid(S_AXI_MEM_0_bid),
        .S_AXI_MEM_0_bready(S_AXI_MEM_0_bready),
        .S_AXI_MEM_0_rready(S_AXI_MEM_0_rready),
        .S_AXI_MEM_0_wdata(S_AXI_MEM_0_wdata),
        .S_AXI_MEM_0_wlast(S_AXI_MEM_0_wlast),
        .S_AXI_MEM_0_wstrb(S_AXI_MEM_0_wstrb),
        .S_AXI_MEM_0_wvalid(S_AXI_MEM_0_wvalid),
        .S_AXI_MEM_0_arready(S_AXI_MEM_0_arready),
        .S_AXI_MEM_0_awready(S_AXI_MEM_0_awready),
        .S_AXI_MEM_0_bresp(S_AXI_MEM_0_bresp),
        .S_AXI_MEM_0_bvalid(S_AXI_MEM_0_bvalid),
        .S_AXI_MEM_0_rdata(S_AXI_MEM_0_rdata),
        .S_AXI_MEM_0_rid(S_AXI_MEM_0_rid),
        .S_AXI_MEM_0_rlast(S_AXI_MEM_0_rlast),
        .S_AXI_MEM_0_rresp(S_AXI_MEM_0_rresp),
        .S_AXI_MEM_0_rvalid(S_AXI_MEM_0_rvalid),
        .S_AXI_MEM_0_wready(S_AXI_MEM_0_wready),
        .S_AXI_MEM_1_araddr(S_AXI_MEM_1_araddr),
        .S_AXI_MEM_1_arburst(S_AXI_MEM_1_arburst),
        .S_AXI_MEM_1_arcache(S_AXI_MEM_1_arcache),
        .S_AXI_MEM_1_arid(S_AXI_MEM_1_arid),
        .S_AXI_MEM_1_arlen(S_AXI_MEM_1_arlen),
        .S_AXI_MEM_1_arlock(S_AXI_MEM_1_arlock),
        .S_AXI_MEM_1_arprot(S_AXI_MEM_1_arprot),
        .S_AXI_MEM_1_arqos(S_AXI_MEM_1_arqos),
        //// .S_AXI_MEM_1_arregion(S_AXI_MEM_1_arregion),
        .S_AXI_MEM_1_arsize(S_AXI_MEM_1_arsize),
        .S_AXI_MEM_1_arvalid(S_AXI_MEM_1_arvalid),
        .S_AXI_MEM_1_awaddr(S_AXI_MEM_1_awaddr),
        .S_AXI_MEM_1_awburst(S_AXI_MEM_1_awburst),
        .S_AXI_MEM_1_awcache(S_AXI_MEM_1_awcache),
        .S_AXI_MEM_1_awid(S_AXI_MEM_1_awid),
        .S_AXI_MEM_1_awlen(S_AXI_MEM_1_awlen),
        .S_AXI_MEM_1_awlock(S_AXI_MEM_1_awlock),
        .S_AXI_MEM_1_awprot(S_AXI_MEM_1_awprot),
        .S_AXI_MEM_1_awqos(S_AXI_MEM_1_awqos),
        //// .S_AXI_MEM_1_awregion(S_AXI_MEM_1_awregion),
        .S_AXI_MEM_1_awsize(S_AXI_MEM_1_awsize),
        .S_AXI_MEM_1_awvalid(S_AXI_MEM_1_awvalid),
        .S_AXI_MEM_1_bid(S_AXI_MEM_1_bid),
        .S_AXI_MEM_1_bready(S_AXI_MEM_1_bready),
        .S_AXI_MEM_1_rready(S_AXI_MEM_1_rready),
        .S_AXI_MEM_1_wdata(S_AXI_MEM_1_wdata),
        .S_AXI_MEM_1_wlast(S_AXI_MEM_1_wlast),
        .S_AXI_MEM_1_wstrb(S_AXI_MEM_1_wstrb),
        .S_AXI_MEM_1_wvalid(S_AXI_MEM_1_wvalid),
        .S_AXI_MEM_1_arready(S_AXI_MEM_1_arready),
        .S_AXI_MEM_1_awready(S_AXI_MEM_1_awready),
        .S_AXI_MEM_1_bresp(S_AXI_MEM_1_bresp),
        .S_AXI_MEM_1_bvalid(S_AXI_MEM_1_bvalid),
        .S_AXI_MEM_1_rdata(S_AXI_MEM_1_rdata),
        .S_AXI_MEM_1_rid(S_AXI_MEM_1_rid),
        .S_AXI_MEM_1_rlast(S_AXI_MEM_1_rlast),
        .S_AXI_MEM_1_rresp(S_AXI_MEM_1_rresp),
        .S_AXI_MEM_1_rvalid(S_AXI_MEM_1_rvalid),
        .S_AXI_MEM_1_wready(S_AXI_MEM_1_wready),
        .DDR_addr(DDR_addr),
        .DDR_ba(DDR_ba),
        .DDR_cas_n(DDR_cas_n),
        .DDR_ck_n(DDR_ck_n),
        .DDR_ck_p(DDR_ck_p),
        .DDR_cke(DDR_cke),
        .DDR_cs_n(DDR_cs_n),
        .DDR_dm(DDR_dm),
        .DDR_dq(DDR_dq),
        .DDR_dqs_n(DDR_dqs_n),
        .DDR_dqs_p(DDR_dqs_p),
        .DDR_odt(DDR_odt),
        .DDR_ras_n(DDR_ras_n),
        .DDR_reset_n(DDR_reset_n),
        .DDR_we_n(DDR_we_n),
        .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
        .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
        .FIXED_IO_mio(FIXED_IO_mio),
        .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
        .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),
        .leds(leds),
        .btns(btns),
        .sw(sw)
    );

   pr pr_i(
        .ARESETN(ARESETN),
        .CLK(CLK_DATA),
        .M_AXIS_tdata(S_AXIS_tdata),
        .M_AXIS_tkeep(S_AXIS_tkeep),
        .M_AXIS_tlast(S_AXIS_tlast),
        .M_AXIS_tready(S_AXIS_tready),
        .M_AXIS_tvalid(S_AXIS_tvalid),
        .S_AXIS_tdata(M_AXIS_tdata),
        .S_AXIS_tkeep(M_AXIS_tkeep),
        .S_AXIS_tlast(M_AXIS_tlast),
        .S_AXIS_tready(M_AXIS_tready),
        .S_AXIS_tvalid(M_AXIS_tvalid),
        .S_AXI_CONTROL_araddr(M_AXI_CONTROL_araddr),
        //// .S_AXI_CONTROL_arprot(M_AXI_CONTROL_arprot),
        ////.S_AXI_CONTROL_arqos(M_AXI_CONTROL_arqos),
        .S_AXI_CONTROL_arready(M_AXI_CONTROL_arready),
        .S_AXI_CONTROL_arvalid(M_AXI_CONTROL_arvalid),
        .S_AXI_CONTROL_awaddr(M_AXI_CONTROL_awaddr),
        ////.S_AXI_CONTROL_awprot(M_AXI_CONTROL_awprot),
        ////.S_AXI_CONTROL_awqos(M_AXI_CONTROL_awqos),
        .S_AXI_CONTROL_awready(M_AXI_CONTROL_awready),
        .S_AXI_CONTROL_awvalid(M_AXI_CONTROL_awvalid),
        .S_AXI_CONTROL_bready(M_AXI_CONTROL_bready),
        .S_AXI_CONTROL_bresp(M_AXI_CONTROL_bresp),
        .S_AXI_CONTROL_bvalid(M_AXI_CONTROL_bvalid),
        .S_AXI_CONTROL_rdata(M_AXI_CONTROL_rdata),
        .S_AXI_CONTROL_rready(M_AXI_CONTROL_rready),
        .S_AXI_CONTROL_rresp(M_AXI_CONTROL_rresp),
        .S_AXI_CONTROL_rvalid(M_AXI_CONTROL_rvalid),
        .S_AXI_CONTROL_wdata(M_AXI_CONTROL_wdata),
        .S_AXI_CONTROL_wready(M_AXI_CONTROL_wready),
        .S_AXI_CONTROL_wstrb(M_AXI_CONTROL_wstrb),
        .S_AXI_CONTROL_wvalid(M_AXI_CONTROL_wvalid),
        .S_AXI_MEM_0_araddr(S_AXI_MEM_0_araddr),
        .S_AXI_MEM_0_arburst(S_AXI_MEM_0_arburst),
        .S_AXI_MEM_0_arcache(S_AXI_MEM_0_arcache),
        ////.S_AXI_MEM_0_arid(S_AXI_MEM_0_arid),
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
        ////.S_AXI_MEM_0_awid(S_AXI_MEM_0_awid),
        .S_AXI_MEM_0_awlen(S_AXI_MEM_0_awlen),
        .S_AXI_MEM_0_awlock(S_AXI_MEM_0_awlock),
        .S_AXI_MEM_0_awprot(S_AXI_MEM_0_awprot),
        .S_AXI_MEM_0_awqos(S_AXI_MEM_0_awqos),
        .S_AXI_MEM_0_awready(S_AXI_MEM_0_awready),
        .S_AXI_MEM_0_awsize(S_AXI_MEM_0_awsize),
        .S_AXI_MEM_0_awvalid(S_AXI_MEM_0_awvalid),
        ////.S_AXI_MEM_0_bid(S_AXI_MEM_0_bid),
        .S_AXI_MEM_0_bready(S_AXI_MEM_0_bready),
        .S_AXI_MEM_0_bresp(S_AXI_MEM_0_bresp),
        .S_AXI_MEM_0_bvalid(S_AXI_MEM_0_bvalid),
        .S_AXI_MEM_0_rdata(S_AXI_MEM_0_rdata),
        ////.S_AXI_MEM_0_rid(S_AXI_MEM_0_rid),
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
        ////.S_AXI_MEM_1_arid(S_AXI_MEM_1_arid),
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
        ////.S_AXI_MEM_1_awid(S_AXI_MEM_1_awid),
        .S_AXI_MEM_1_awlen(S_AXI_MEM_1_awlen),
        .S_AXI_MEM_1_awlock(S_AXI_MEM_1_awlock),
        .S_AXI_MEM_1_awprot(S_AXI_MEM_1_awprot),
        .S_AXI_MEM_1_awqos(S_AXI_MEM_1_awqos),
        .S_AXI_MEM_1_awready(S_AXI_MEM_1_awready),
        .S_AXI_MEM_1_awsize(S_AXI_MEM_1_awsize),
        .S_AXI_MEM_1_awvalid(S_AXI_MEM_1_awvalid),
        ////.S_AXI_MEM_1_bid(S_AXI_MEM_1_bid),
        .S_AXI_MEM_1_bready(S_AXI_MEM_1_bready),
        .S_AXI_MEM_1_bresp(S_AXI_MEM_1_bresp),
        .S_AXI_MEM_1_bvalid(S_AXI_MEM_1_bvalid),
        .S_AXI_MEM_1_rdata(S_AXI_MEM_1_rdata),
        ////.S_AXI_MEM_1_rid(S_AXI_MEM_1_rid),
        .S_AXI_MEM_1_rlast(S_AXI_MEM_1_rlast),
        .S_AXI_MEM_1_rready(S_AXI_MEM_1_rready),
        .S_AXI_MEM_1_rresp(S_AXI_MEM_1_rresp),
        .S_AXI_MEM_1_rvalid(S_AXI_MEM_1_rvalid),
        .S_AXI_MEM_1_wdata(S_AXI_MEM_1_wdata),
        .S_AXI_MEM_1_wlast(S_AXI_MEM_1_wlast),
        .S_AXI_MEM_1_wready(S_AXI_MEM_1_wready),
        .S_AXI_MEM_1_wstrb(S_AXI_MEM_1_wstrb),
        .S_AXI_MEM_1_wvalid(S_AXI_MEM_1_wvalid)
    );
endmodule
