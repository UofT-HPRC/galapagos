#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/yugao/Research/Kern_v2/kern/layer_0/cluster_0/kern_1/hls_project/kernel_1/.autopilot/db/a.g.bc ${1+"$@"}