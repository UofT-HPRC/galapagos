#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/kevinliu/Documents/GULF-Stream/ip_repo/hls_ips/udp_ip_server/udp_eth_assemble/solution1/.autopilot/db/a.g.bc ${1+"$@"}