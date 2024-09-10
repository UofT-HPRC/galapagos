#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/kevinliu/Documents/GULF-Stream/ip_repo/hls_ips/lbus_axis_converter/lbus_fifo_read/solution1/.autopilot/db/a.g.bc ${1+"$@"}
