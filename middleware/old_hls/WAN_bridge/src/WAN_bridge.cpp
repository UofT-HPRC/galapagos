
#include "WAN_bridge.hpp"

netStream gp_to_net (galapagos_packet in_data)
{
	netStream out_data;
	out_data.data = in_data.data;
	out_data.keep = in_data.keep;
	out_data.last = in_data.last;
    out_data.user = in_data.user;
	return out_data;
}


void WAN_bridge(
          galapagos_interface &g2N_input,
          hls::stream<netStream> &g2N_output
          ){

#pragma HLS DATAFLOW
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS resource core=AXI4Stream variable = g2N_input
#pragma HLS resource core=AXI4Stream variable = g2N_output
#pragma HLS DATA_PACK variable=g2N_input
#pragma HLS DATA_PACK variable=g2N_output
	static netStream old_packet;
	galapagos_packet packetin;
	netStream packetout;
	static ap_uint<2> stage = 0;
	switch (stage)
	{
	case 0:
		if (!g2N_input.empty() && !g2N_output.full())
		{
			packetin= g2N_input.read();
			old_packet = gp_to_net(packetin);
			packetout.data = get_header(packetin.dest, packetin.user);
			packetout.keep = KEEP_ALL;
			packetout.last = 0;
			g2N_output.write(packetout);
			stage = 1;
		}
		break;
	case 1: 
		if (!g2N_output.full())
		{
			stage = (old_packet.last==1)? 0:2;
			g2N_output.write(old_packet);
		}
		break;
	case 2:
		if (!g2N_input.empty() && !g2N_output.full())
		{
			packetin= g2N_input.read();
			stage = (packetin.last==1)? 0:2;
			packetout = gp_to_net(packetin);
			g2N_output.write(packetout);
		}
		break;
	}


}
