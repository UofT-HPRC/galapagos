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

#include <stdint.h>
#include <stdlib.h>
#include <iostream>
#include <iomanip>
#include <string.h>
#include <stdio.h>


//#include "ap_int.h"
//#include "ap_axi_sdata.h"
//#include <hls_stream.h>
#include "galapagos_bridge.hpp"
//#include "ip.hpp"
//#include "allocator.h"
//#include "eth_interface.h"
//#include "hls_math.h"
//#include <tuple>



void g2N_ingress(
            galapagos_interface * input,
            ap_uint<8*BYTESPERCYCLE> buffer_storage[MAX_SIZE/BYTESPERCYCLE],
            hls::stream< ap_uint<MAX_LENGTH_BITS> > &length_stream,
            hls::stream< ap_uint<DEST_LENGTH> > &dest_stream, 
            hls::stream< ap_uint<ID_LENGTH> > &src_stream 
        ){
//#pragma HLS interface port=return ap_ctrl_none
//#pragma HLS interface port=length_stream axis
//#pragma HLS interface port=dest_stream axis
//#pragma HLS interface port=src_stream axis
//#pragma HLS interface port=buffer_storage bram
    galapagos::stream_packet<64> t;

   // std::cout << std::hex << "IN G2N_INGRESS BEFORE LOOP " << std::endl;

write_loop:
	for(int i=0; i<MAX_SIZE/BYTESPERCYCLE; i++){
#pragma HLS pipeline II=1
        t = input->read();
#ifdef CPU
        std::cout << std::hex << "IN G2N_INGRESS " <<  t.data << std::endl;
#endif
        buffer_storage[i] = t.data;
        if(t.last){
            length_stream.write(i+1);
            dest_stream.write(t.dest);
            src_stream.write(t.id);
        	break;
        }
    }
}


void g2N_egress(hls::stream<netStream> *output,
                ap_uint<8*BYTESPERCYCLE>buffer_storage[MAX_SIZE/BYTESPERCYCLE],
                hls::stream< ap_uint<MAX_LENGTH_BITS> > &length_stream,
                hls::stream< ap_uint<DEST_LENGTH> > &dest_stream, 
                hls::stream< ap_uint<ID_LENGTH> > &src_stream 
        ){
//#pragma HLS interface port=return ap_ctrl_none
//#pragma HLS interface port=output axis
//#pragma HLS interface port=length_stream axis
//#pragma HLS interface port=dest_stream axis
//#pragma HLS interface port=src_stream axis
//#pragma HLS interface port=buffer_storage bram


    ap_uint<MAX_LENGTH_BITS> length = length_stream.read();
    ap_uint<DEST_LENGTH> dest = dest_stream.read();
    ap_uint<DEST_LENGTH> src = src_stream.read();
    netStream n;
    n.data.range(63,ID_LENGTH+DEST_LENGTH+MAX_LENGTH_BITS) = 0; //unused
    n.data.range(ID_LENGTH+DEST_LENGTH+MAX_LENGTH_BITS-1, ID_LENGTH+MAX_LENGTH_BITS) = dest; //unused
    n.data.range(ID_LENGTH+MAX_LENGTH_BITS-1, MAX_LENGTH_BITS) = src; 
    n.data.range(MAX_LENGTH_BITS-1, 0) = length << 3; //length in bytes

#ifdef CPU
    std::cout << "DST BEING WRITTEN IS " << std::hex << dest << std::endl;
    std::cout << "SRC BEING WRITTEN IS " << std::hex << src << std::endl;
    std::cout << "LENGTH BEING WRITTEN IS " << std::hex << (length << 3) << std::endl;
    std::cout << std::hex << "IN G2N_EGRESS HEADER " <<  g.data << std::endl;
#endif


    output->write(n);
    n.keep = 0xff;
    n.last = 1;

read_loop:
    for(int i=0; i<(length);i++){
#pragma HLS pipeline II=1
        n.data = buffer_storage[i];
        n.last = (i == (length-1));
        output->write(n);
#ifdef CPU
        std::cout << std::hex << "IN G2N_EGRESS " <<  g.data << std::endl;
#endif
    }

}



void n2G(
            hls::stream<netStream> *input,
			galapagos_interface * output
        ){
//#pragma HLS interface port=return ap_ctrl_none
//#pragma HLS interface port=input axis
//#pragma HLS interface port=output axis
    static netStream np;
    static galapagos::stream_packet<64> gp;

    //input >> np;
    np= input->read();
    gp.id = np.data.range(ID_LENGTH+MAX_LENGTH_BITS-1, MAX_LENGTH_BITS);
    gp.dest =  np.data.range(ID_LENGTH+DEST_LENGTH+MAX_LENGTH_BITS-1, ID_LENGTH+MAX_LENGTH_BITS);
#ifdef CPU
    std::cout << std::hex << "IN N2G SRC " <<  gp.id << " DEST " << gp.dest <<  std::endl;
#endif

write_n2G_loop:
    for(int i=0; i<MAX_SIZE/BYTESPERCYCLE; i++){
#pragma HLS pipeline II=1
    	np=input->read();
    	gp.data = np.data;
    	gp.keep = np.keep;
    	gp.last = np.last;
#ifdef CPU
    	std::cout << std::hex << "IN N2G DATA: " <<  gp.data << std::endl;
#endif
    	//output << gp;
    	output->write(gp);
    	if(gp.last)
    		break;


    }

}


void galapagos_bridge(
          galapagos_interface *g2N_input,
          hls::stream<netStream> *g2N_output,
          ap_uint<8*BYTESPERCYCLE>buffer_storage_A[MAX_SIZE/BYTESPERCYCLE],
		  ap_uint<8*BYTESPERCYCLE>buffer_storage_B[MAX_SIZE/BYTESPERCYCLE],
		  hls::stream<netStream> * n2G_input,
          galapagos_interface * n2G_output
          ){

#pragma HLS dataflow

#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS resource core=AXI4Stream variable=g2N_output metadata="-bus_bundle m_axis_g2N" 
#pragma HLS resource core=AXI4Stream variable=g2N_input metadata="-bus_bundle s_axis_g2N" 
#pragma HLS resource core=AXI4Stream variable=n2G_output metadata="-bus_bundle m_axis_n2G" 
#pragma HLS resource core=AXI4Stream variable=n2G_input metadata="-bus_bundle s_axis_n2G" 

#pragma HLS DATA_PACK variable=g2N_output 
#pragma HLS DATA_PACK variable=g2N_input 
#pragma HLS DATA_PACK variable=n2G_output 
#pragma HLS DATA_PACK variable=n2G_input 



//#pragma HLS interface port=buffer_storage_A bram
#pragma HLS RESOURCE variable=buffer_storage_A core=RAM_1P
//#pragma HLS interface port=buffer_storage_B bram
#pragma HLS RESOURCE variable=buffer_storage_B core=RAM_1P
    hls::stream< ap_uint<MAX_LENGTH_BITS> > length_stream;
    hls::stream< ap_uint<DEST_LENGTH> > dest_stream;
    hls::stream< ap_uint<ID_LENGTH> > src_stream;

#pragma HLS stream variable=length_stream depth=256
#pragma HLS stream variable=dest_stream depth=256
#pragma HLS stream variable=src_stream depth=256


    g2N_ingress(g2N_input,
                buffer_storage_A,
                length_stream,
                dest_stream, 
                src_stream 
            );
    
    g2N_egress(g2N_output,
                buffer_storage_B,
                length_stream,
                dest_stream, 
                src_stream 
            );

    n2G(
    	n2G_input,
    	n2G_output
         );




}
