    // SLAVE INTERFACE
    clk,
    resetn,
    s0_axi_awaddr,
    s0_axi_awburst,
    s0_axi_awcache,
    s0_axi_awid,
    s0_axi_awlen,
    s0_axi_awlock,
    s0_axi_awprot,
    s0_axi_awqos,
    s0_axi_awvalid,
    s0_axi_awsize,
    s0_axi_awready,
    
    s0_axi_wdata,
    s0_axi_wlast,
    s0_axi_wstrb,
    s0_axi_wvalid,
    s0_axi_wready,
    
    s0_axi_bresp,
    s0_axi_bid,
    s0_axi_bvalid,
    s0_axi_bready,
    
    s0_axi_araddr,
    s0_axi_arburst,
    s0_axi_arcache,
    s0_axi_arid,
    s0_axi_arlen,
    s0_axi_arlock,
    s0_axi_arprot,
    s0_axi_arqos,
    s0_axi_arvalid,
    s0_axi_arsize,
    s0_axi_arready,
    
    s0_axi_rdata,
    s0_axi_rid,
    s0_axi_rlast,
    s0_axi_rresp,
    s0_axi_rvalid,
    s0_axi_rready,
    
    // MASTER INTERFACE
    m0_axi_awaddr,
    m0_axi_awburst,
    m0_axi_awcache,
    m0_axi_awid,
    m0_axi_awlen,
    m0_axi_awlock,
    m0_axi_awprot,
    m0_axi_awqos,
    m0_axi_awvalid,
    m0_axi_awsize,
    m0_axi_awready,
    
    m0_axi_wdata,
    m0_axi_wlast,
    m0_axi_wstrb,
    m0_axi_wvalid,
    m0_axi_wready,
    
    m0_axi_bresp,
    m0_axi_bid,
    m0_axi_bvalid,
    m0_axi_bready,
    
    m0_axi_araddr,
    m0_axi_arburst,
    m0_axi_arcache,
    m0_axi_arid,
    m0_axi_arlen,
    m0_axi_arlock,
    m0_axi_arprot,
    m0_axi_arqos,
    m0_axi_arvalid,
    m0_axi_arsize,
    m0_axi_arready,
    
    m0_axi_rdata,
    m0_axi_rid,
    m0_axi_rlast,
    m0_axi_rresp,
    m0_axi_rvalid,
    m0_axi_rready
);

    // SLAVE INTERFACE
    input wire clk;
    input wire resetn;
    input wire [33:0] s0_axi_awaddr;
    input wire [1:0] s0_axi_awburst;
    input wire [3:0] s0_axi_awcache;
    input wire [7:0] s0_axi_awlen;
    input wire [0:0] s0_axi_awlock;
    input wire [2:0] s0_axi_awprot;
    input wire [3:0] s0_axi_awqos;
    input wire s0_axi_awvalid;
    input wire [2:0] s0_axi_awsize;
    output wire s0_axi_awready;
    
    input wire [511:0] s0_axi_wdata;
    input wire s0_axi_wlast;
    input wire [63:0] s0_axi_wstrb;
    input wire s0_axi_wvalid;
    output wire s0_axi_wready;
    
    output wire [1:0] s0_axi_bresp;
    output wire s0_axi_bvalid;
    input wire s0_axi_bready;
    
    input wire [33:0] s0_axi_araddr;
    input wire [1:0] s0_axi_arburst;
    input wire [3:0] s0_axi_arcache;
    input wire [7:0] s0_axi_arlen;
    input wire [0:0] s0_axi_arlock;
    input wire [2:0] s0_axi_arprot;
    input wire [3:0] s0_axi_arqos;
    input wire s0_axi_arvalid;
    input wire [2:0] s0_axi_arsize;
    output wire s0_axi_arready;
    
    output wire [511:0] s0_axi_rdata;
    output wire s0_axi_rlast;
    output wire [1:0] s0_axi_rresp;
    output wire s0_axi_rvalid;
    input wire s0_axi_rready;
    
    // MASTER INTERFACE
    output wire [33:0] m0_axi_araddr;
    output wire [1:0] m0_axi_arburst;
    output wire [3:0] m0_axi_arcache;
    output wire [7:0] m0_axi_arlen;
    output wire [0:0] m0_axi_arlock;
    output wire [2:0] m0_axi_arprot;
    output wire [3:0] m0_axi_arqos;
    input wire m0_axi_arready;
    output wire [2:0] m0_axi_arsize;
    output wire  m0_axi_arvalid;
    
    output wire [33:0] m0_axi_awaddr;
    output wire [1:0] m0_axi_awburst;
    output wire [3:0] m0_axi_awcache;
    output wire [7:0] m0_axi_awlen;
    output wire [0:0] m0_axi_awlock;
    output wire [2:0] m0_axi_awprot;
    output wire [3:0] m0_axi_awqos;
    input wire m0_axi_awready;
    output wire [2:0] m0_axi_awsize;
    output wire  m0_axi_awvalid;
    
    output wire m0_axi_bready;
    input wire [1:0] m0_axi_bresp;
    input wire m0_axi_bvalid;
    
    input wire [511:0] m0_axi_rdata;
    input wire m0_axi_rlast;
    output wire m0_axi_rready;
    input wire [1:0] m0_axi_rresp;
    input wire m0_axi_rvalid;
    
    output wire [511:0] m0_axi_wdata;
    output wire m0_axi_wlast;
    input wire m0_axi_wready;
    output wire [63:0] m0_axi_wstrb;
    output wire m0_axi_wvalid;

