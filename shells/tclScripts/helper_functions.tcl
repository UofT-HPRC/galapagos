proc addIfToClock {clock_name if_name} {
  #This is done because set_property CONFIG.ASSOCIATED_BUSIF requires the full list of all interfaces
  #Get the current configuration as cur_string
  set cur_string [get_property CONFIG.ASSOCIATED_BUSIF [get_bd_ports /${clock_name}]]
  if { $cur_string eq ""} {
    #If nothing is associated already, then the entire entry is just this interface
    set new_string $if_name
  } else {
    #addition will contain what we want to add
    set addition :$if_name
    #Concatenate addition with what was already in the buffer as an array of two strings 
    set concatenated_string [concat $cur_string $addition]
    #join the two with a blank string separator to be left with a long string containing what was there plus 
    #the addition. new_string will have what we want to add
    set new_string [join $concatenated_string ""]
  }
  #Add this new string to the clock association
  set_property CONFIG.ASSOCIATED_BUSIF $new_string [get_bd_ports /${clock_name}]
}

proc addip {ipName displayName} {
  #query the ip repository to find a block called ipName
  set vlnv_version_independent [lindex [get_ipdefs -all *${ipName}:* -filter {UPGRADE_VERSIONS == ""}] end]
  create_bd_cell -type ip -vlnv $vlnv_version_independent $displayName
}