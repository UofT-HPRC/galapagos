Now that I have a couple dozen Verilog projects under my belt, I've noticed a
number of things that I'm constantly redoing. So, obviously, I put them in a
Verilog header.


`localparam
-----------

When I use iverilog in my Makefiles, I always add -DICARUS_VERILOG, and I'll 
use that symbol in my preprocessor directives in my code. There's a small 
number of things that must be done differently between Icarus and Vivado.

Vivado allows the "localparam" type where Icarus does not. So, I use the 
`localparam macro in my Verilog code, which gets defined to the right thing.


`logic
------

I don't normally use SystemVerilog because Vivado often chokes on it (at least 
in my experience). However, one of its great features its the "logic" type; 
unfortunately, in regular Verilog, sometimes you have to define an internal 
wire as a "reg", because you wrote some code in an always @(*) block. The 
signal is combinational, but Verilog syntax requires a "reg" type.

Anyway, in SystemVerilog, you can just use "logic" in these cases. I define it 
to be "reg" so that my Verilog code looks like the SystemVerilog "logic" type.


`CLOG2
------

Don't overthink it. This gives you ceil(log_2(x)).


`in_axis and friends
-------------------- 

In my code I'm constantly finding myself writing AXI Stream signals. These 
macros just make my life a little easier. For example,

    `in_axis_l(my_thing, 32)

expands to
    
    input wire [32 -1:0] my_thing_TDATA,
    input wire my_thing_TVALID,
    output wire my_thing_TREADY,
    input wire my_thing_TLAST

There are a bunch of similar macros that have slightly different behaviour.


`axis_flit
----------

A little helper macro that expands to a predicate on an AXI Stream. This 
predicate evaluates to true if that stream is sending a flit.


`NO_RESET, `ACTIVE_HIGH, and `ACTIVE LOW
----------------------------------------

In my newer Verilog modules I use a parameter to determine if it will have a 
reset signal and what polarity it will use. This is usually worth the extra 
trouble; sometimes removing reset logic can fix up timing failures. Also, I 
really hate when reset polarities are inconsistent in your project.


`genif, `else_genif, `else_gen, and `endgen
-------------------------------------------

Little macros that change the syntax of if-generate blocks. There's nothing 
wrong with the original syntax, but I find this makes it easier to visually 
spot places where I'm conditionally generating code.
