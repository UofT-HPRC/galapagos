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

#include "WAN_network_dispatch.hpp"

void WAN_network_dispatch(
                 netStream         &rxGalapagosBridge,
				 netStream 		&lbTxDataOut,
                 ip_fetch_interface& fetch_out
                 ) {
    #pragma HLS INTERFACE ap_ctrl_none port=return
    #pragma HLS DATAFLOW
#pragma HLS INTERFACE axis port=rxGalapagosBridge
#pragma HLS INTERFACE axis port=lbTxDataOut
#pragma HLS INTERFACE axis port=fetch_out

    static enum sState {TX_IDLE = 0,FORWARD_REST} sinkState;
    ap_axis_net packet;

    ip_fetch_packet_t fetch_packet_out;

    switch(sinkState){
        case TX_IDLE:
            if(!rxGalapagosBridge.empty() && !fetch_out.full() && !lbTxDataOut.full())
            {
                packet = rxGalapagosBridge.read();
                fetch_packet_out.data = packet.data.range(2*PACKET_DEST_LENGTH + PACKET_USER_LENGTH - 1, PACKET_DEST_LENGTH + PACKET_USER_LENGTH);
                fetch_out.write(fetch_packet_out);
                sinkState = (packet.last==1) ? TX_IDLE:FORWARD_REST;
                lbTxDataOut.write(packet);
            }
            break;
        case FORWARD_REST:
          if(!rxGalapagosBridge.empty() && !fetch_out.full() && !lbTxDataOut.full())
          {
            packet = rxGalapagosBridge.read();
            sinkState = (packet.last==1) ? TX_IDLE:FORWARD_REST;
            lbTxDataOut.write(packet);
          }
        	break;
        default:
            sinkState = TX_IDLE;
            break;

    }


}
