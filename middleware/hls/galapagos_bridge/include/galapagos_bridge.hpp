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

#include "galapagos_packet.h"
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

template<int D>
struct ap_axis_net{
	ap_uint <D> data;
    ap_uint<D/8> keep;
	ap_uint<1> last;

};
//
//
//typedef ap_axiu<8*BYTESPERCYCLE,1,ID_LENGTH,DEST_LENGTH> galapagosStream;
////typedef ap_axis_galapagos<8*BYTESPERCYCLE,DEST_LENGTH> galapagosStream;
//

//typedef ap_axis_net<8*BYTESPERCYCLE,1,8,8> netStream;
typedef ap_axis_net<8*BYTESPERCYCLE> netStream;

void galapagos_bridge(
          galapagos_stream *g2N_input,
          hls::stream<netStream> &g2N_output,
          ap_uint<8*BYTESPERCYCLE>buffer_storage_A[MAX_SIZE/BYTESPERCYCLE],
		  ap_uint<8*BYTESPERCYCLE>buffer_storage_B[MAX_SIZE/BYTESPERCYCLE],
		  hls::stream<netStream> &n2G_input,
          galapagos_stream *n2G_output
          );
#endif
