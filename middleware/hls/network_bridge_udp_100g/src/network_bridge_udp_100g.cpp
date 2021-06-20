/************************************************
Copyright (c) 2016, Xilinx, Inc.
All rights reserved.

Redistribution and use in source and binary forms, with or without modification, 
are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, 
this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, 
this list of conditions and the following disclaimer in the documentation 
and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors 
may be used to endorse or promote products derived from this software 
without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND 
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, 
THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. 
IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, 
INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, 
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) 
HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, 
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, 
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.// Copyright (c) 2015 Xilinx, Inc.
************************************************/

#include <stdio.h>
#include <iostream>
#include <fstream>
#include <string>
#include <math.h>
#include <hls_stream.h>
#include "ap_int.h"
#include <stdint.h>


using namespace hls;


ap_uint<32> byteSwap32(ap_uint<32> & inputVector) {

    return (inputVector.range(7,0), inputVector(15, 8), inputVector(23, 16), inputVector(31, 24));
        
}

//ap_uint<512> byteSwap512(ap_uint<512> & inputVector) {
//
//    //return inputVector;
//    return  (inputVector.range(7,0),    inputVector(15, 8),    inputVector(23, 16),   inputVector(31, 24),   inputVector(39,32),   inputVector(47,40),   inputVector(55,48),  inputVector(63,56),
//            inputVector(71,64),   inputVector(79, 72),   inputVector(87, 80),   inputVector(95, 88),   inputVector(103,96),  inputVector(111,104), inputVector(119,112), inputVector(127,120),
//            inputVector(135,128), inputVector(143, 136), inputVector(151, 144), inputVector(159, 152), inputVector(167,160), inputVector(175,168), inputVector(183,176), inputVector(191,184),
//            inputVector(199,192), inputVector(207, 200), inputVector(215, 208), inputVector(223, 216), inputVector(231,224), inputVector(239,232), inputVector(247,240), inputVector(255,248),
//            inputVector(263,256), inputVector(271, 264), inputVector(279, 272), inputVector(287, 280), inputVector(295,288), inputVector(303,296), inputVector(311,304), inputVector(319,312),
//            inputVector(327,320), inputVector(335, 328), inputVector(343, 336), inputVector(351, 344), inputVector(359,352), inputVector(367,360), inputVector(375,368), inputVector(383,376),
//            inputVector(391,384), inputVector(399, 392), inputVector(407, 400), inputVector(415, 408), inputVector(423,416), inputVector(431,424), inputVector(439,432), inputVector(447,440),
//            inputVector(455,448), inputVector(463, 456), inputVector(471, 464), inputVector(479, 472), inputVector(487,480), inputVector(495,488), inputVector(503,496), inputVector(511,504)
//            );
//        
//}

struct axiWord512{
	ap_uint<512>		data;
	ap_uint<16>		keep;
	ap_uint<1>		last;
};

void rxPath(stream<axiWord512>&       lbRxDataIn,
    		stream<axiWord512>& txGalapagosBridge
            ) {
#pragma HLS PIPELINE II=1

    if (!lbRxDataIn.empty() ) {
        axiWord512 currWord = lbRxDataIn.read();
        //currWord.data = byteSwap512(currWord.data);
        txGalapagosBridge.write(currWord);
    }

}


void txPath(
            stream<axiWord512>& rxGalapagosBridge,
    		stream<axiWord512> 	   &lbTxDataOut,
            ap_uint  <32> * remote_ip_tx,
            const ap_uint<32> ip_table[256]
            ) {
#pragma HLS PIPELINE II=1
	static enum sState {TX_IDLE = 0, TX_WRITE_LENGTH, TX_WRITE_METADATA, TX_WRITE_HEADER, TX_STREAM, TX_LAST} sinkState;
    
    static ap_uint<8> dest;
    static ap_uint<32> dest_ip_addr;
    static axiWord512 header;


    *remote_ip_tx = dest_ip_addr;

    
    switch(sinkState){
        case TX_IDLE:
            if(!rxGalapagosBridge.empty()){

                header = rxGalapagosBridge.read();
                dest = header.data.range(31,24);
                dest_ip_addr = ip_table[dest];
                sinkState = TX_WRITE_HEADER;
            }
            break;
        case TX_WRITE_HEADER:
            {
                //header.data = byteSwap512(header.data);
                lbTxDataOut.write(header);
                sinkState = TX_STREAM;
            }
            break;
        case TX_STREAM:
            if(!rxGalapagosBridge.empty()){
                axiWord512 currWord;
                currWord = rxGalapagosBridge.read();
                //currWord.data = byteSwap512(currWord.data);
                lbTxDataOut.write(currWord);
                if(currWord.last)
                    sinkState = TX_IDLE;
                else
                    sinkState = TX_STREAM;
            }
            break;
        default:
            sinkState = TX_IDLE;
            break;

    }
    

}

void network_bridge_udp_100g(
                 stream<axiWord512>& rxGalapagosBridge,
                 stream<axiWord512>&       lbRxDataIn,
				 stream<axiWord512> 		&lbTxDataOut,
                 stream<axiWord512>& txGalapagosBridge,
                 ap_uint<32> * remote_ip_tx,
                 const ap_uint<32> ip_table[256]
                 ) {
	#pragma HLS INTERFACE ap_ctrl_none port=return
	#pragma HLS INTERFACE ap_none port=remote_ip_tx
	#pragma HLS DATAFLOW


    #pragma HLS INTERFACE AXIS port=lbRxDataIn
    #pragma HLS INTERFACE AXIS port=lbTxDataOut
    #pragma HLS INTERFACE AXIS port=rxGalapagosBridge
    #pragma HLS INTERFACE AXIS port=txGalapagosBridge
    #pragma HLS INTERFACE bram port=ip_table

    rxPath(lbRxDataIn, txGalapagosBridge);
    txPath(rxGalapagosBridge, lbTxDataOut, remote_ip_tx, ip_table);
}
