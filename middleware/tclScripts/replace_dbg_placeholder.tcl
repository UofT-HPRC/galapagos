# This script is specific to Galapagos.

# First of all, in the python middleware, I added a few lines that always put
# a placeholder dbg_guv IP in every node (with TDEST address 0). 

# Now that the placeholder is there and everything is wired up, it's time to
# replace it with what should go there. So this proc does three things:

# 1. Save the port connected to placeholder/cmd_in as "in_port" and the port
#    connected to placeholder/log_catted as "out_port" (see the code below)
# 2. Delete the placeholder core
# 3. Rewire in_port to connect to the golbal cmd_in of the dbg_guv daisy chain,
#    and rewire out_port to connect to the output of the global dbg_guv log 
#    output

proc replace_dbg_placeholder {first_cmd_in tree_out} {
    puts "replace_dbg_placeholder args:"
    puts "first_cmd_in = $first_cmd_in"
    puts "tree_out = $tree_out"
    puts "----"
    # First, get a reference to the placeholder. This is really janky, but one
    # consistent way to do is to assume that Galapagos named it "dbg_guv_inst_0"
    set placeholder [get_bd_cells -hierarchical -filter {NAME == "dbg_guv_inst_0"}]
    
    # Get nets connected to the placeholder cell
    set left [get_bd_intf_nets -of_objects [get_bd_intf_pins $placeholder/cmd_in]]
    set right [get_bd_intf_nets -of_objects [get_bd_intf_pins $placeholder/log_catted]]
    
    # Now save references to the ports that were originally connected
    set in_port [get_bd_intf_pins -of_objects $left -filter {PATH !~ *cmd_in}]
    set out_port [get_bd_intf_pins -of_objects $right -filter {PATH !~ *log_catted}]
    
    # We can now safely delete the original placeholder
    delete_bd_objs $placeholder
    
    # Rewire the input
    connect_bd_intf_net [get_bd_intf_pins $first_cmd_in] $in_port
    
    # Rewire the output
    connect_bd_intf_net [get_bd_intf_pins $tree_out] [get_bd_intf_pins $out_port]
    
    # It's ugly, but it works!
}
