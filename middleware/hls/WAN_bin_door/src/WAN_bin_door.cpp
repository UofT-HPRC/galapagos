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

#include "WAN_bin_door.hpp"



void WAN_bin_door(
    netStream         &bin_in,
    gulfstream_interface_extend 		&lbTxDataOut,
    fetch_bin_reply_interface &fetch_in)
{
	#pragma HLS INTERFACE ap_ctrl_none port=return
	#pragma HLS DATAFLOW
  #pragma HLS INTERFACE axis port=bin_in register_mode=off
  #pragma HLS INTERFACE axis port=lbTxDataOut register_mode=off
  #pragma HLS INTERFACE axis port=fetch_in register_mode=off


    static enum sState {AWAITING_FETCH = 0,FORWARD} sinkState;
    ap_axis_net packet;
    axis_gulfstream_extend_t packet_out;
    static ap_uint<16> cnt_to_pass;
    static ap_uint<32> ip;
    fetch_bin_reply cur_fetch;
    switch(sinkState)
    {
    case AWAITING_FETCH:
    	if (!fetch_in.empty())
    	{
    		cur_fetch=fetch_in.read();
    		ip = cur_fetch.data;
    		if (!bin_in.empty() && !lbTxDataOut.full())
    		{
    			packet = bin_in.read();
    			packet_out = extender(packet,cur_fetch.data);
    			if (packet_out.last == 1)
    			{
    				sinkState = (cur_fetch.user==1) ? AWAITING_FETCH: FORWARD;
    				cnt_to_pass=cur_fetch.user - 1;
    			}
    			else
    			{
    				cnt_to_pass=cur_fetch.user;
    				sinkState = FORWARD;
    			}
    			lbTxDataOut.write(packet_out);
    		}
    		else
    		{
    			cnt_to_pass=cur_fetch.user;
    			sinkState = FORWARD;
    		}
    	}
    	break;
    case FORWARD:
    	if (!bin_in.empty() && !lbTxDataOut.full())
    	{
    		packet = bin_in.read();
    		packet_out = extender(packet,ip);
    		if (packet_out.last == 1)
    		{
    			sinkState = (cnt_to_pass==1) ? AWAITING_FETCH: FORWARD;
    			cnt_to_pass = cnt_to_pass- 1;
    		}
    		lbTxDataOut.write(packet_out);
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