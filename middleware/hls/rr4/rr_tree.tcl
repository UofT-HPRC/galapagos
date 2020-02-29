# This proc automates the creation of a tree of RR4 modules

proc rr_tree {msts} {
    startgroup
    set nnodes [expr ([llength $msts]+1)/3]
    
    set slvs {}
    set nodes {}
    while {$nnodes > 0} {
        set node [create_bd_cell -vlnv Marco_Merlini:fpga_bpf:rr4 -name node_$nnodes]
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
    
    while {[llength $msts] > 0} {
        connect_bd_intf_net [lindex $msts 0] [lindex $slvs 0]
        set msts [lreplace $msts 0 0]
        set slvs [lreplace $slvs 0 0]
    }
    
    set h [create_bd_cell -type hier -name rr_tree]
    
    move_bd_cells $h $nodes
    
    create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 rr_tree/o
    connect_bd_intf_net [get_bd_intf_pins rr_tree/o] [get_bd_intf_pins rr_tree/node_1/o]
    
    endgroup
}
