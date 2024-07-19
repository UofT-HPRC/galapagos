/*
Copyright (c) 2016-2018, Xilinx, Inc.
All rights reserved.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

#ifndef APPH
#define APPH

#include <stdint.h>
#include <stdlib.h>
#include <iostream>
#include <iomanip>
#include <string.h>
#include <stdio.h>

#include "wan_packet.h"
#include "hls_stream.h"


#define BYTESPERCYCLE 8
#define ID_LENGTH 8
#define DEST_LENGTH 8
#define MAX_SIZE 4096
#define MAX_LENGTH_BITS 16


static ap_uint<64>byteSwap64(ap_uint<64> inputVector){
    return (inputVector.range(7,0),
            inputVector(15, 8),
            inputVector(23, 16),
            inputVector(31, 24),
            inputVector(39, 32),
            inputVector(47, 40),
            inputVector(55, 48),
            inputVector(63, 56)
            );


}


enum n2g_state_t {
    N2G_STATE_READ_HEADER = 0, // Read network header
    N2G_STATE_READ_DATA = 1    // Read data packets
};

void WAN_bridge(
          galapagos_interface &g2N_input,
          netStream &g2N_output
          );
#endif
