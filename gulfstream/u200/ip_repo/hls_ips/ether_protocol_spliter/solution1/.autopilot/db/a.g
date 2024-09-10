#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/kevinliu/Documents/GULF-Stream/ip_repo/hls_ips/ether_protocol_spliter/solution1/.autopilot/db/a.g.bc ${1+"$@"}
