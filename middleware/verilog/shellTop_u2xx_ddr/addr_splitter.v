`timescale 1 ps / 1ps

module addr_splitter(
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
    m0_axi_rready,

    // MASTER INTERFACE
    m1_axi_awaddr,
    m1_axi_awburst,
    m1_axi_awcache,
    m1_axi_awid,
    m1_axi_awlen,
    m1_axi_awlock,
    m1_axi_awprot,
    m1_axi_awqos,
    m1_axi_awvalid,
    m1_axi_awsize,
    m1_axi_awready,
    
    m1_axi_wdata,
    m1_axi_wlast,
    m1_axi_wstrb,
    m1_axi_wvalid,
    m1_axi_wready,
    
    m1_axi_bresp,
    m1_axi_bid,
    m1_axi_bvalid,
    m1_axi_bready,
    
    m1_axi_araddr,
    m1_axi_arburst,
    m1_axi_arcache,
    m1_axi_arid,
    m1_axi_arlen,
    m1_axi_arlock,
    m1_axi_arprot,
    m1_axi_arqos,
    m1_axi_arvalid,
    m1_axi_arsize,
    m1_axi_arready,
    
    m1_axi_rdata,
    m1_axi_rid,
    m1_axi_rlast,
    m1_axi_rresp,
    m1_axi_rvalid,
    m1_axi_rready,

    // MASTER INTERFACE
    m2_axi_awaddr,
    m2_axi_awburst,
    m2_axi_awcache,
    m2_axi_awid,
    m2_axi_awlen,
    m2_axi_awlock,
    m2_axi_awprot,
    m2_axi_awqos,
    m2_axi_awvalid,
    m2_axi_awsize,
    m2_axi_awready,
    
    m2_axi_wdata,
    m2_axi_wlast,
    m2_axi_wstrb,
    m2_axi_wvalid,
    m2_axi_wready,
    
    m2_axi_bresp,
    m2_axi_bid,
    m2_axi_bvalid,
    m2_axi_bready,
    
    m2_axi_araddr,
    m2_axi_arburst,
    m2_axi_arcache,
    m2_axi_arid,
    m2_axi_arlen,
    m2_axi_arlock,
    m2_axi_arprot,
    m2_axi_arqos,
    m2_axi_arvalid,
    m2_axi_arsize,
    m2_axi_arready,
    
    m2_axi_rdata,
    m2_axi_rid,
    m2_axi_rlast,
    m2_axi_rresp,
    m2_axi_rvalid,
    m2_axi_rready
);

    // SLAVE INTERFACE
    input wire clk;
    input wire resetn;
    input wire [35:0] s0_axi_awaddr;
    input wire [1:0] s0_axi_awburst;
    input wire [3:0] s0_axi_awcache;
    input wire [7:0] s0_axi_awlen;
    input wire [0:0] s0_axi_awlock;
    input wire [2:0] s0_axi_awprot;
    input wire [3:0] s0_axi_awqos;
    input wire s0_axi_awvalid;
    input wire [2:0] s0_axi_awsize;
    output reg s0_axi_awready;
    
    input wire [511:0] s0_axi_wdata;
    input wire s0_axi_wlast;
    input wire [63:0] s0_axi_wstrb;
    input wire s0_axi_wvalid;
    output reg s0_axi_wready;
    
    output reg [1:0] s0_axi_bresp;
    output reg s0_axi_bvalid;
    input wire s0_axi_bready;
    
    input wire [35:0] s0_axi_araddr;
    input wire [1:0] s0_axi_arburst;
    input wire [3:0] s0_axi_arcache;
    input wire [7:0] s0_axi_arlen;
    input wire [0:0] s0_axi_arlock;
    input wire [2:0] s0_axi_arprot;
    input wire [3:0] s0_axi_arqos;
    input wire s0_axi_arvalid;
    input wire [2:0] s0_axi_arsize;
    output reg s0_axi_arready;
    
    output reg [511:0] s0_axi_rdata;
    output reg s0_axi_rlast;
    output reg [1:0] s0_axi_rresp;
    output reg s0_axi_rvalid;
    input wire s0_axi_rready;

    input wire [6:0] s0_axi_awid;
    input wire [6:0] s0_axi_arid;
    output reg [6:0] s0_axi_bid;
    output reg [6:0] s0_axi_rid;
    
    // MASTER INTERFACE
    output reg [33:0] m0_axi_araddr;
    output reg [1:0] m0_axi_arburst;
    output reg [3:0] m0_axi_arcache;
    output reg [7:0] m0_axi_arlen;
    output reg [0:0] m0_axi_arlock;
    output reg [2:0] m0_axi_arprot;
    output reg [3:0] m0_axi_arqos;
    input wire m0_axi_arready;
    output reg [2:0] m0_axi_arsize;
    output reg  m0_axi_arvalid;
    
    output reg [33:0] m0_axi_awaddr;
    output reg [1:0] m0_axi_awburst;
    output reg [3:0] m0_axi_awcache;
    output reg [7:0] m0_axi_awlen;
    output reg [0:0] m0_axi_awlock;
    output reg [2:0] m0_axi_awprot;
    output reg [3:0] m0_axi_awqos;
    input wire m0_axi_awready;
    output reg [2:0] m0_axi_awsize;
    output reg  m0_axi_awvalid;
    
    output reg m0_axi_bready;
    input wire [1:0] m0_axi_bresp;
    input wire m0_axi_bvalid;
    
    input wire [511:0] m0_axi_rdata;
    input wire m0_axi_rlast;
    output reg m0_axi_rready;
    input wire [1:0] m0_axi_rresp;
    input wire m0_axi_rvalid;
    
    output reg [511:0] m0_axi_wdata;
    output reg m0_axi_wlast;
    input wire m0_axi_wready;
    output reg [63:0] m0_axi_wstrb;
    output reg m0_axi_wvalid;

    output reg [6:0] m0_axi_awid;
    output reg [6:0] m0_axi_arid;
    input wire [6:0] m0_axi_bid;
    input wire [6:0] m0_axi_rid;

    // MASTER INTERFACE
    output reg [33:0] m1_axi_araddr;
    output reg [1:0] m1_axi_arburst;
    output reg [3:0] m1_axi_arcache;
    output reg [7:0] m1_axi_arlen;
    output reg [0:0] m1_axi_arlock;
    output reg [2:0] m1_axi_arprot;
    output reg [3:0] m1_axi_arqos;
    input wire m1_axi_arready;
    output reg [2:0] m1_axi_arsize;
    output reg  m1_axi_arvalid;
    
    output reg [33:0] m1_axi_awaddr;
    output reg [1:0] m1_axi_awburst;
    output reg [3:0] m1_axi_awcache;
    output reg [7:0] m1_axi_awlen;
    output reg [0:0] m1_axi_awlock;
    output reg [2:0] m1_axi_awprot;
    output reg [3:0] m1_axi_awqos;
    input wire m1_axi_awready;
    output reg [2:0] m1_axi_awsize;
    output reg  m1_axi_awvalid;
    
    output reg m1_axi_bready;
    input wire [1:0] m1_axi_bresp;
    input wire m1_axi_bvalid;
    
    input wire [511:0] m1_axi_rdata;
    input wire m1_axi_rlast;
    output reg m1_axi_rready;
    input wire [1:0] m1_axi_rresp;
    input wire m1_axi_rvalid;
    
    output reg [511:0] m1_axi_wdata;
    output reg m1_axi_wlast;
    input wire m1_axi_wready;
    output reg [63:0] m1_axi_wstrb;
    output reg m1_axi_wvalid;

    output reg [6:0] m1_axi_awid;
    output reg [6:0] m1_axi_arid;
    input wire [6:0] m1_axi_bid;
    input wire [6:0] m1_axi_rid;
  
    // MASTER INTERFACE
    output reg [33:0] m2_axi_araddr;
    output reg [1:0] m2_axi_arburst;
    output reg [3:0] m2_axi_arcache;
    output reg [7:0] m2_axi_arlen;
    output reg [0:0] m2_axi_arlock;
    output reg [2:0] m2_axi_arprot;
    output reg [3:0] m2_axi_arqos;
    input wire m2_axi_arready;
    output reg [2:0] m2_axi_arsize;
    output reg  m2_axi_arvalid;
    
    output reg [33:0] m2_axi_awaddr;
    output reg [1:0] m2_axi_awburst;
    output reg [3:0] m2_axi_awcache;
    output reg [7:0] m2_axi_awlen;
    output reg [0:0] m2_axi_awlock;
    output reg [2:0] m2_axi_awprot;
    output reg [3:0] m2_axi_awqos;
    input wire m2_axi_awready;
    output reg [2:0] m2_axi_awsize;
    output reg  m2_axi_awvalid;
    
    output reg m2_axi_bready;
    input wire [1:0] m2_axi_bresp;
    input wire m2_axi_bvalid;
    
    input wire [511:0] m2_axi_rdata;
    input wire m2_axi_rlast;
    output reg m2_axi_rready;
    input wire [1:0] m2_axi_rresp;
    input wire m2_axi_rvalid;
    
    output reg [511:0] m2_axi_wdata;
    output reg m2_axi_wlast;
    input wire m2_axi_wready;
    output reg [63:0] m2_axi_wstrb;
    output reg m2_axi_wvalid;

    output reg [6:0] m2_axi_awid;
    output reg [6:0] m2_axi_arid;
    input wire [6:0] m2_axi_bid;
    input wire [6:0] m2_axi_rid;

    always @(*) begin
	case (s0_axi_awaddr[35:34])
        2'b00: begin
            m0_axi_awaddr = s0_axi_awaddr[33:0];
		    m0_axi_awaddr = s0_axi_awaddr;
    		m0_axi_araddr = s0_axi_araddr;
	        m0_axi_awid = s0_axi_awid;
	     	m0_axi_awlen = s0_axi_awlen;
	     	m0_axi_awsize = s0_axi_awsize;
	     	m0_axi_awburst = s0_axi_awburst;
	     	m0_axi_awlock = s0_axi_awlock;
	     	m0_axi_awcache = s0_axi_awcache;
	     	m0_axi_awprot = s0_axi_awprot;
	     	m0_axi_awqos = s0_axi_awqos;
	     	m0_axi_awvalid = s0_axi_awvalid;
	     	s0_axi_awready = m0_axi_awready;

	     	m0_axi_arid = s0_axi_arid;
	     	m0_axi_arlen = s0_axi_arlen;
	     	m0_axi_arsize = s0_axi_arsize;
	     	m0_axi_arburst = s0_axi_arburst;
	     	m0_axi_arlock = s0_axi_arlock;
	     	m0_axi_arcache = s0_axi_arcache;
	     	m0_axi_arprot = s0_axi_arprot;
	     	m0_axi_arqos = s0_axi_arqos;
	     	m0_axi_arvalid = s0_axi_arvalid;
	     	s0_axi_arready = m0_axi_arready;

	     	s0_axi_bid = m0_axi_bid;
	     	s0_axi_bresp = m0_axi_bresp;
	     	s0_axi_bvalid = m0_axi_bvalid;
	     	m0_axi_bready = s0_axi_bready;

	     	m0_axi_wdata = s0_axi_wdata;
	     	m0_axi_wstrb = s0_axi_wstrb;
	     	m0_axi_wlast = s0_axi_wlast;
	     	m0_axi_wvalid = s0_axi_wvalid;
	     	s0_axi_wready = m0_axi_wready;

	     	s0_axi_rid = m0_axi_rid;
	     	s0_axi_rdata = m0_axi_rdata;
	     	s0_axi_rresp = m0_axi_rresp;
	     	s0_axi_rlast = m0_axi_rlast;
	     	s0_axi_rvalid = m0_axi_rvalid;
	     	m0_axi_rready = s0_axi_rready;
	    end
        2'b01: begin
		    m1_axi_awaddr = s0_axi_awaddr[33:0];
		    m1_axi_awaddr = s0_axi_awaddr;
    		m1_axi_araddr = s0_axi_araddr;
	        m1_axi_awid = s0_axi_awid;
	     	m1_axi_awlen = s0_axi_awlen;
	     	m1_axi_awsize = s0_axi_awsize;
	     	m1_axi_awburst = s0_axi_awburst;
	     	m1_axi_awlock = s0_axi_awlock;
	     	m1_axi_awcache = s0_axi_awcache;
	     	m1_axi_awprot = s0_axi_awprot;
	     	m1_axi_awqos = s0_axi_awqos;
	     	m1_axi_awvalid = s0_axi_awvalid;
	     	s0_axi_awready = m1_axi_awready;

	     	m1_axi_arid = s0_axi_arid;
	     	m1_axi_arlen = s0_axi_arlen;
	     	m1_axi_arsize = s0_axi_arsize;
	     	m1_axi_arburst = s0_axi_arburst;
	     	m1_axi_arlock = s0_axi_arlock;
	     	m1_axi_arcache = s0_axi_arcache;
	     	m1_axi_arprot = s0_axi_arprot;
	     	m1_axi_arqos = s0_axi_arqos;
	     	m1_axi_arvalid = s0_axi_arvalid;
	     	s0_axi_arready = m1_axi_arready;

	     	s0_axi_bid = m1_axi_bid;
	     	s0_axi_bresp = m1_axi_bresp;
	     	s0_axi_bvalid = m1_axi_bvalid;
	     	m1_axi_bready = s0_axi_bready;

	     	m1_axi_wdata = s0_axi_wdata;
	     	m1_axi_wstrb = s0_axi_wstrb;
	     	m1_axi_wlast = s0_axi_wlast;
	     	m1_axi_wvalid = s0_axi_wvalid;
	     	s0_axi_wready = m1_axi_wready;

	     	s0_axi_rid = m1_axi_rid;
	     	s0_axi_rdata = m1_axi_rdata;
	     	s0_axi_rresp = m1_axi_rresp;
	     	s0_axi_rlast = m1_axi_rlast;
	     	s0_axi_rvalid = m1_axi_rvalid;
	     	m1_axi_rready = s0_axi_rready;
	    end
        2'b10: begin
		    m2_axi_awaddr = s0_axi_awaddr[33:0];
            m2_axi_awaddr = s0_axi_awaddr;
    		m2_axi_araddr = s0_axi_araddr;
	        m2_axi_awid = s0_axi_awid;
	     	m2_axi_awlen = s0_axi_awlen;
	     	m2_axi_awsize = s0_axi_awsize;
	     	m2_axi_awburst = s0_axi_awburst;
	     	m2_axi_awlock = s0_axi_awlock;
	     	m2_axi_awcache = s0_axi_awcache;
	     	m2_axi_awprot = s0_axi_awprot;
	     	m2_axi_awqos = s0_axi_awqos;
	     	m2_axi_awvalid = s0_axi_awvalid;
	     	s0_axi_awready = m2_axi_awready;

	     	m2_axi_arid = s0_axi_arid;
	     	m2_axi_arlen = s0_axi_arlen;
	     	m2_axi_arsize = s0_axi_arsize;
	     	m2_axi_arburst = s0_axi_arburst;
	     	m2_axi_arlock = s0_axi_arlock;
	     	m2_axi_arcache = s0_axi_arcache;
	     	m2_axi_arprot = s0_axi_arprot;
	     	m2_axi_arqos = s0_axi_arqos;
	     	m2_axi_arvalid = s0_axi_arvalid;
	     	s0_axi_arready = m2_axi_arready;

	     	s0_axi_bid = m2_axi_bid;
	     	s0_axi_bresp = m2_axi_bresp;
	     	s0_axi_bvalid = m2_axi_bvalid;
	     	m2_axi_bready = s0_axi_bready;

	     	m2_axi_wdata = s0_axi_wdata;
	     	m2_axi_wstrb = s0_axi_wstrb;
	     	m2_axi_wlast = s0_axi_wlast;
	     	m2_axi_wvalid = s0_axi_wvalid;
	     	s0_axi_wready = m2_axi_wready;

	     	s0_axi_rid = m2_axi_rid;
	     	s0_axi_rdata = m2_axi_rdata;
	     	s0_axi_rresp = m2_axi_rresp;
	     	s0_axi_rlast = m2_axi_rlast;
	     	s0_axi_rvalid = m2_axi_rvalid;
	     	m2_axi_rready = s0_axi_rready;
	     end
    endcase	
    end
  endmodule