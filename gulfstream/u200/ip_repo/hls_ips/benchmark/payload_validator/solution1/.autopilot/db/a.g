#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/kevinliu/Documents/GULF-Stream/ip_repo/hls_ips/benchmark/payload_validator/solution1/.autopilot/db/a.g.bc ${1+"$@"}