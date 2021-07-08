`ifndef MACROS_VH_INCLUDE_GUARD
`define MACROS_VH_INCLUDE_GUARD 1

`ifdef ICARUS_VERILOG
`define localparam parameter
`else /*For Vivado*/
`define localparam localparam
`endif

`define logic reg

`define CLOG2(x) (\
    (((x) <= 1) ? 0 : \
    (((x) <= 2) ? 1 : \
    (((x) <= 4) ? 2 : \
    (((x) <= 8) ? 3 : \
    (((x) <= 16) ? 4 : \
    (((x) <= 32) ? 5 : \
    (((x) <= 64) ? 6 : \
    (((x) <= 128) ? 7 : \
    (((x) <= 256) ? 8 : \
    (((x) <= 512) ? 9 : \
    (((x) <= 1024) ? 10 : \
    (((x) <= 2048) ? 11 : \
    (((x) <= 4096) ? 12 : \
    (((x) <= 8192) ? 13 : \
    (((x) <= 16384) ? 14 : \
    (((x) <= 32768) ? 15 : \
    (((x) <= 65536) ? 16 : \
    -1))))))))))))))))))

//Helper macros to declare AXI Streams nicely in Verilog
//The "_reg" versions are because Verilog forces you to use reg in always
//blocks (which is really awful!)
//The "sim_" versions are used when writing testbenches
`define in_axis(name, width) \
    input wire [width -1:0] name``_TDATA,\
    input wire name``_TVALID,\
    output wire name``_TREADY

`define in_axis_reg(name, width) \
    input wire [width -1:0] name``_TDATA,\
    input wire name``_TVALID,\
    output reg name``_TREADY
    
`define out_axis(name, width) \
    output wire [width -1:0] name``_TDATA,\
    output wire name``_TVALID,\
    input wire name``_TREADY

`define out_axis_reg(name, width) \
    output reg [width -1:0] name``_TDATA,\
    output reg name``_TVALID,\
    input wire name``_TREADY
    
`define wire_axis(name, width) \
    wire [width -1:0] name``_TDATA;\
    wire name``_TVALID;\
    wire name``_TREADY
    
`define sim_in_axis(name, width) \
    reg [width -1:0] name``_TDATA = 0;\
    reg name``_TVALID = 0;\
    wire name``_TREADY
    
`define sim_out_axis(name, width) \
    wire [width -1:0] name``_TDATA;\
    wire name``_TVALID;\
    reg name``_TREADY = 1

`define ports_axis(name) name``_TDATA, name``_TVALID, name``_TREADY

`define inst_axis(lname, rname) \
        .lname``_TDATA(rname``_TDATA),\
        .lname``_TVALID(rname``_TVALID),\
        .lname``_TREADY(rname``_TREADY)

//Same, but with TLAST signal
`define in_axis_l(name, width) \
    `in_axis(name, width),\
    input wire name``_TLAST
    
`define in_axis_l_reg(name, width) \
    `in_axis_reg(name, width),\
    input wire name``_TLAST

`define out_axis_l(name, width) \
    `out_axis(name, width),\
    output wire name``_TLAST

`define out_axis_l_reg(name, width) \
    `out_axis_reg(name, width),\
    output reg name``_TLAST

`define wire_axis_l(name, width) \
    `wire_axis(name, width);\
    wire name``_TLAST
    
`define sim_in_axis_l(name, width) \
    `sim_in_axis(name, width);\
    reg name``_TLAST = 0
    
`define sim_out_axis_l(name, width) \
    `sim_out_axis(name, width);\
    wire name``_TLAST

`define ports_axis_l(name) `ports_axis(name), name``_TLAST

`define inst_axis_l(lname, rname) \
        `inst_axis(lname, rname),\
        .lname``_TLAST(rname``_TLAST)

//Same, but with TKEEP signal
`define in_axis_k(name, width) \
    `in_axis(name, width),\
    input wire [(width/8) -1:0] name``_TKEEP
    
`define in_axis_k_reg(name, width) \
    `in_axis_reg(name, width),\
    input wire [(width/8) -1:0] name``_TKEEP

`define out_axis_k(name, width) \
    `out_axis(name, width),\
    output wire [(width/8) -1:0] name``_TKEEP

`define out_axis_k_reg(name, width) \
    `out_axis_reg(name, width),\
    output reg [(width/8) -1:0] name``_TKEEP

`define wire_axis_k(name, width) \
    `wire_axis(name, width);\
    wire [(width/8) -1:0] name``_TKEEP
    
`define sim_in_axis_k(name, width) \
    `sim_in_axis(name, width);\
    reg [(width/8) -1:0] name``_TKEEP = 0
    
`define sim_out_axis_k(name, width) \
    `sim_out_axis(name, width);\
    wire [(width/8) -1:0] name``_TKEEP

`define ports_axis_k(name) `ports_axis(name), name``_TKEEP

`define inst_axis_k(lname, rname) \
        `inst_axis(lname, rname),\
        .lname``_TKEEP(rname``_TKEEP)

//Same, but with TLAST and TKEEP signals
`define in_axis_kl(name, width) \
    `in_axis_l(name, width),\
    input wire [(width/8) -1:0] name``_TKEEP
`define in_axis_lk(n, w) `in_axis_kl(n, w)

`define in_axis_kl_reg(name, width) \
    `in_axis_l_reg(name, width),\
    input wire [(width/8) -1:0] name``_TKEEP
`define in_axis_lk_reg(n, w) `in_axis_kl_reg(n, w)

`define out_axis_kl(name, width) \
    `out_axis_l(name, width),\
    output wire [(width/8) -1:0] name``_TKEEP
`define out_axis_lk(n, w) `out_axis_kl(n, w)

`define out_axis_kl_reg(name, width) \
    `out_axis_l_reg(name, width),\
    output reg [(width/8) -1:0] name``_TKEEP
`define out_axis_lk_reg(n, w) `out_axis_kl_reg(n, w)

`define wire_axis_kl(name, width) \
    `wire_axis_l(name, width);\
    wire [(width/8) -1:0] name``_TKEEP
`define wire_axis_lk(n, w) `wire_axis_kl(n, w)
    
`define sim_in_axis_kl(name, width) \
    `sim_in_axis_l(name, width);\
    reg [(width/8) -1:0] name``_TKEEP = 0
`define sim_in_axis_lk(n, w) `sim_in_axis_kl(n, w)
    
`define sim_out_axis_kl(name, width) \
    `sim_out_axis_l(name, width);\
    wire [(width/8) -1:0] name``_TKEEP
`define sim_out_axis_lk(n, w) `sim_out_axis_kl(n, w)

`define ports_axis_kl(name) `ports_axis_l(name), name``_TKEEP
`define ports_axis_lk(name) `ports_axis_kl(name)

`define inst_axis_kl(lname, rname) \
        `inst_axis_l(lname, rname),\
        .lname``_TKEEP(rname``_TKEEP)
`define inst_axis_lk(lname, rname) `inst_axis_kl(lname, rname)

//Some helper macros to neaten up code dealing with AXI Streams VALID and READY
`define axis_flit(name) (name``_TVALID && name``_TREADY)
`define axis_last(name) (name``_TVALID && name``_TREADY && name``_TLAST)

`define NO_RESET 0
`define ACTIVE_HIGH 1
`define ACTIVE_LOW 2

`define genif generate if
`define else_genif end else if
`define else_gen end else begin
`define endgen end endgenerate

//Common construct I use in my desgins
`define wire_rst_sig \
    wire rst_sig; \
`genif (RESET_TYPE == `ACTIVE_HIGH) begin \
    assign rst_sig = rst; \
end else begin \
    assign rst_sig = ~rst; \
`endgen \
wire unused_dummy_in_wire_rst_sig_macro

//This makes the ternary operator look a little more friendly
//"if" was already taken
`define si(x) ((x) ?
`define prendre (
`define autrement ) : (
`define fin ))


`endif
