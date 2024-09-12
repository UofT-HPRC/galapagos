#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/kevinliu/Documents/gulf_stream/u280/GULF-Stream/ip_repo/hls_ips/udp_ip_server/action_excecutor/solution1/.autopilot/db/a.g.bc ${1+"$@"}
