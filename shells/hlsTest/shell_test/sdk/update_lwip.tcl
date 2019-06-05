proc update_lwip { workspace_path bsp app processor src_path } {

  set lib_path $workspace_path/$bsp/$processor/libsrc/lwip141_v2_0/src

  set etharp_h_path $lib_path/lwip-1.4.1/src/include/netif

  file copy -force $src_path/etharp.c $lib_path/lwip-1.4.1/src/netif/etharp.c
  file copy -force $src_path/etharp.h $etharp_h_path/etharp.h
  file copy -force $src_path/xemacpsif.c $lib_path/contrib/ports/xilinx/netif/xemacpsif.c

  exec bash -c "line=\$(grep '#define ETHTYPE_CUSTOM' \
    $workspace_path/$app/src/user_options.h) && awk -v line=\"\$line\" \
    '/#define ETHTYPE_PPPOE/ { \$0 = \$0 \"\\n\" line } 1' \
    $etharp_h_path/etharp.h > $etharp_h_path/etharp2.h"
  
  file delete -force $etharp_h_path/etharp.h
  file rename -force $etharp_h_path/etharp2.h $etharp_h_path/etharp.h
  
  return 0

}
