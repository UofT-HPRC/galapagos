# These procs are used to automatically insert dbg_guvs into a design

# Replaces the bd_intf_net n with a dbg_guv core named "inst"
proc add_dbg_core_to_net {n inst} {
    # Get the two endpoints of this net
    set pins [get_bd_intf_pins -of_objects $n -quiet]
    set ports [get_bd_intf_ports -of_objects $n -quiet]
    
    set npins [llength $pins]
    set nports [llength $ports]
    
    # Check if it has the right number of endpoints
    if {[expr $npins + $nports] != 2} {
        puts "Warning: invalid net"
        return -1
    }
    
    # Name the two endpoints left and right
    if {$npins == 2} {
        set left [lindex $pins 0]
        set right [lindex $pins 1]
    } elseif {$npins == 1} {
        set left [lindex $pins 0]
        set right [lindex $ports 0]
    } else {
        set left [lindex $ports 0]
        set right [lindex $ports 1]
    }
    
    # Double-check that they are in fact AXI Stream
    if {[string compare [get_property VLNV $left] "xilinx.com:interface:axis_rtl:1.0"] != 0} {
        puts "Warning: this is not an AXI Stream interface"
        return -1
    }
    if {[string compare [get_property VLNV $right] "xilinx.com:interface:axis_rtl:1.0"] != 0} {
        puts "Warning: this is not an AXI Stream interface"
        return -1
    }
    
    # Quit early if there is already a dbg_guv at one endpoint of this net
    if {$npins > 0} {
        set left_vlnv [get_property VLNV [get_bd_cells -of_objects $left]]
        if {$left_vlnv == "mmerlini:yov:dbg_guv:1.0"} {
            puts "INFO: net already has a dbg_guv"
            return 0
        }
    }
    
    if {$npins == 2} {
        set right_vlnv [get_property VLNV [get_bd_cells -of_objects $right]]
        if {$right_vlnv == "mmerlini:yov:dbg_guv:1.0"} {
            puts "INFO: net already has a dbg_guv"
            return 0
        }
    }
    
    # Delete the original net
    delete_bd_objs $n
    
    # Instantiate the dbg_guv
    set g [create_bd_cell -vlnv mmerlini:yov:dbg_guv $inst]

    # Connect the dbg_guv to the loose endpoints
    if ![string compare [get_property MODE $left] Master] {
        connect_bd_intf_net -intf_net GUV_${inst}_mst $g/out $right
        connect_bd_intf_net -intf_net GUV_${inst}_slv $left $g/in
    } else {
        connect_bd_intf_net -intf_net GUV_${inst}_mst $g/out $left
        connect_bd_intf_net -intf_net GUV_${inst}_slv $right $g/in
    }
    
    return $g
}

# Searches current BD to get next ID to use for a dbg_guv
proc get_next_dbg_core_id {} {
    set cells [get_bd_cells -hierarchical -filter {VLNV == mmerlini:yov:dbg_guv:1.0} -quiet]
    set next_id 0
    foreach c $cells {
        set name [get_property NAME $c]
        if {[string first "GUV_" $name] == 0} {
            set idnum [string range $name 4 [string length $name]]
            if [string is integer $idnum] {
                set next_id [expr max($next_id,$idnum+1)]
            }
        }
    }
    return $next_id
}

# Given a list of AXI Stream masters (with only TDATA, TREADY, TVALID, and TLAST)
# hooks up an automatically sized arbiter tree
# TODO?: Special case for n=1
proc rr_tree {msts} {
    startgroup
    set nnodes [expr ([llength $msts]+1)/3]    
    
    set slvs {}
    set nodes {}
    while {$nnodes > 0} {
        set node [create_bd_cell -vlnv Marco_Merlini:fpga_bpf:rr4 -name node_$nnodes]
        
        set_property CONFIG.RESET_TYPE 0 $node
        
        lappend nodes $node
        lappend slvs [get_bd_intf_pins $node/s0]
        lappend slvs [get_bd_intf_pins $node/s1]
        lappend slvs [get_bd_intf_pins $node/s2]
        lappend slvs [get_bd_intf_pins $node/s3]
        incr nnodes -1
        if {$nnodes > 0} {
            lappend msts [get_bd_intf_pins $node/o ]
        }
    }
    
    while {[llength $msts] > 0 && [llength $slvs] > 0} {
        connect_bd_intf_net [lindex $msts 0] [lindex $slvs 0]
        set msts [lreplace $msts 0 0]
        set slvs [lreplace $slvs 0 0]
    }
    
    if {[llength $nodes] > 0} {
        # The user is not allowed to use this name
        set h [create_bd_cell -type hier -name DBG_GUV_TREE]
        
        move_bd_cells $h $nodes
        
        create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 DBG_GUV_TREE/o
        connect_bd_intf_net [get_bd_intf_pins DBG_GUV_TREE/o] [get_bd_intf_pins DBG_GUV_TREE/node_1/o]
        create_bd_pin -dir I DBG_GUV_TREE/clk
        
        connect_bd_net [list [get_bd_pins /DBG_GUV_TREE/*/clk] [get_bd_pins /DBG_GUV_TREE/clk]]
    }
    
    endgroup
}


proc del_dbg_core {c} {
    startgroup
    
    set left [get_bd_intf_nets -of_objects [get_bd_intf_pins $c/in]]
    set mst [get_bd_intf_pins -of_objects $left -filter "PATH !~ $c/in" -quiet]
    if {[llength $mst] == 0} {
        set mst [get_bd_intf_ports -of_objects $left -filter "PATH !~ $c/in" -quiet]
    }
    
    set right [get_bd_intf_nets -of_objects [get_bd_intf_pins $c/out]]
    set slv [get_bd_intf_pins -of_objects $right -filter "PATH !~ $c/out" -quiet]
    if {[llength $slv] == 0} {
        set slv [get_bd_intf_ports -of_objects $right -filter "PATH !~ $c/in" -quiet]
    }
    
    delete_bd_objs [get_bd_intf_nets $left] [get_bd_intf_nets $right]
    delete_bd_objs $c
    
    connect_bd_intf_net $mst $slv
    
    highlight_objects -color_index 3 [get_bd_intf_nets -of_objects $mst]
    
    endgroup
}

proc del_all_dbg_cores {} {
    startgroup
    delete_bd_objs [get_bd_cells DBG_GUV_TREE -quiet] -quiet
    set dbg_guvs [get_bd_cells -filter {VLNV =~ "*dbg_guv*"} -quiet]
    foreach d $dbg_guvs {
        set nets [get_bd_intf_nets -of_objects $d -quiet]
        delete_bd_objs [get_bd_intf_nets $d/log_catted -quiet] -quiet
        delete_bd_objs [get_bd_intf_nets $d/cmd_out -quiet] -quiet
        del_dbg_core $d
    }
    endgroup
}

proc add_dbg_core_to_highlighted {{safe_mode 1}} {
    startgroup
    
    if {$safe_mode} {
        del_all_dbg_cores
    }
    
    # Stores the list of log outputs to run through the arbiter tree
    set log_outs {}
    
    # Stores the previous cmd_out
    set last_cmd {}
    
    
    # Get all highlihgted nets
    set nets [get_bd_intf_nets [get_highlighted_objects]]
    
    foreach n $nets {
        # Choose an ID. get_next_dbg_core_id guarantees it will be unique, and 
        # if some dbg_guvs don't get added (e.g. if the highlighted net was 
        # invalid), it also makes sure that IDs don't get skipped
        set next_id [get_next_dbg_core_id]
        
        # g holds a reference to the newly create dbg_guv cell
        set g [add_dbg_core_to_net $n GUV_$next_id]
        
        set_property CONFIG.ADDR $next_id $g
        
        # Add $g/log to the list of log outputs
        lappend log_outs $g/log_catted
        
        # If last_cmd is not empty, connect its cmd_out to $g/cmd_in
        if {[llength $last_cmd] == 1} {
            connect_bd_intf_net [get_bd_intf_pins $last_cmd] [get_bd_intf_pins $g/cmd_in]
        }
        
        # Update last_cmd
        set last_cmd $g/cmd_out
    }
    
    # Put in the arbiter tree
    rr_tree $log_outs
    
    # Connect up the clocks
    # TODO: If I ever plan to allow multiple clock domains, this will have to 
    # change
    connect_bd_net [list [get_bd_pins -of_objects [get_bd_cells -hierarchical  -filter {VLNV == mmerlini:yov:dbg_guv:1.0}] -filter {NAME == clk}] [get_bd_pins /DBG_GUV_TREE/clk]]
    endgroup
}

proc del_highlighted_dbg_cores {} {
    startgroup
    set cores [get_highlighted_objects]
    foreach c $cores {
        if {[get_property VLNV $c] != "mmerlini:yov:dbg_guv:1.0"} {
            puts "Warning, trying to delete an IP which is not a dbg_guv"
            continue
        }
        
        del_dbg_core $c

    }
    endgroup
}
