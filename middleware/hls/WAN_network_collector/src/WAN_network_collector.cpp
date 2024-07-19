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

#include "WAN_network_collector.hpp"



void WAN_network_collector(
                 netStream                                      &lbTxDataIn,
				 gulfstream_interface_extend                    &lbTxDataOut,
				 netStream                                      &bin_1,
				 netStream                                      &bin_2,
				 netStream                                      &bin_3,
				 fetch_reply_interface                          &fetch_in,
                 ap_uint<8> *                                   state_out
                 )
{
	#pragma HLS INTERFACE ap_ctrl_none port=return
	#pragma HLS DATAFLOW
	#pragma HLS INTERFACE axis port=lbTxDataIn register_mode=off
	#pragma HLS INTERFACE axis port=lbTxDataOut register_mode=off
	#pragma HLS INTERFACE axis port=fetch_in register_mode=off
	#pragma HLS INTERFACE axis port=bin_1 register_mode=off
	#pragma HLS INTERFACE axis port=bin_2 register_mode=off
	#pragma HLS INTERFACE axis port=bin_3 register_mode=off


    static enum sState {TX_IDLE = 0,FORWARD_NET, FORWARD_1, FORWARD_2, FORWARD_3, NET_Wait, F1_Wait, F2_Wait, F3_Wait} sinkState;
    * state_out = sinkState;
    ap_axis_net packet;
    axis_gulfstream_extend_t packet_out;
    static axis_gulfstream_extend_t last_packet;
    fetch_reply cur_fetch;
    switch(sinkState)
    {
    case TX_IDLE:
    	if (!lbTxDataIn.empty() && !fetch_in.empty())
    	{
    		packet = lbTxDataIn.read();
    		cur_fetch = fetch_in.read();
    		packet_out = extender(packet,cur_fetch.data);
    		last_packet = packet_out;
    		switch (cur_fetch.dest)
    		{
    		case 0:
    			if (!lbTxDataOut.full())
    			{
    				lbTxDataOut.write(packet_out);
    				sinkState = (packet_out.last==1) ? TX_IDLE : FORWARD_NET;
    			}
    			else
    			{
    				sinkState = NET_Wait;
    			}
    			break;
    		case 1:
    			if (!bin_1.full())
    			{
    				bin_1.write(packet);
    				sinkState = (packet.last==1) ? TX_IDLE : FORWARD_1;
    			}
    			else
    			{
    				sinkState = F1_Wait;
    			}
    			break;
    		case 2:
    			if (!bin_2.full())
    			{
    				bin_2.write(packet);
    				sinkState = (packet.last==1) ? TX_IDLE : FORWARD_2;
    			}
    			else
    			{
    				sinkState = F2_Wait;
    			}
    			break;
    		case 3:
    			if (!bin_3.full())
    			{
    				bin_3.write(packet);
    				sinkState = (packet.last==1) ? TX_IDLE : FORWARD_3;
    			}
    			else
    			{
    				sinkState = F3_Wait;
    			}
    			break;
    		}
    	}
    	break;
    case FORWARD_NET:
    	if (!lbTxDataOut.full() && !lbTxDataIn.empty())
    	{
    		packet = lbTxDataIn.read();
    		packet_out = extender(packet,last_packet.user);
			lbTxDataOut.write(packet_out);
			sinkState = (packet.last==1) ? TX_IDLE : FORWARD_NET;
    	}
    	break;
    case FORWARD_1:
    	if (!bin_1.full() && !lbTxDataIn.empty())
    	{
    		packet = lbTxDataIn.read();
    		bin_1.write(packet);
    		sinkState = (packet.last==1) ? TX_IDLE : FORWARD_1;
    	}
    	break;
    case FORWARD_2:
    	if (!bin_2.full() && !lbTxDataIn.empty())
    	{
    		packet = lbTxDataIn.read();
    		bin_2.write(packet);
    		sinkState = (packet.last==1) ? TX_IDLE : FORWARD_2;
    	}
    	break;
    case FORWARD_3:
    	if (!bin_3.full() && !lbTxDataIn.empty())
    	{
    		packet = lbTxDataIn.read();
    		bin_3.write(packet);
    		sinkState = (packet.last==1) ? TX_IDLE : FORWARD_3;
    	}
    	break;
    case NET_Wait:
    	if (!lbTxDataOut.full())
    	{
    		lbTxDataOut.write(last_packet);
    		sinkState = (last_packet.last==1) ? TX_IDLE : FORWARD_NET;
    	}
    	break;
    case F1_Wait:
    	if (!bin_1.full())
    	{
    		packet= shrinker(last_packet);
    		bin_1.write(packet);
    		sinkState = (packet.last==1) ? TX_IDLE : FORWARD_1;
    	}
    	break;
    case F2_Wait:
    	if (!bin_2.full())
    	{
    		packet= shrinker(last_packet);
    		bin_2.write(packet);
    		sinkState = (packet.last==1) ? TX_IDLE : FORWARD_2;
    	}
    	break;
    case F3_Wait:
    	if (!bin_3.full())
    	{
    		packet= shrinker(last_packet);
    		bin_3.write(packet);
    		sinkState = (packet.last==1) ? TX_IDLE : FORWARD_3;
    	}
    	break;
    }
}

axis_gulfstream_extend_t extender(ap_axis_net in_data, ap_uint<IP_LENGTH> ip)
{
    axis_gulfstream_extend_t out_data;
    out_data.data = in_data.data;
    out_data.keep = in_data.keep;
    out_data.last = in_data.last;
    out_data.user.range(31,0) = ip;
    out_data.user.range(47,32) = WAN_SRC_PORT;
    out_data.user.range(63,48) = in_data.user;
    return out_data;
}

ap_axis_net shrinker(axis_gulfstream_extend_t in_data)
{
	ap_axis_net out_data;
    out_data.data = in_data.data;
    out_data.keep = in_data.keep;
    out_data.last = in_data.last;
    out_data.user = in_data.user.range(63,48);
    return out_data;
}
