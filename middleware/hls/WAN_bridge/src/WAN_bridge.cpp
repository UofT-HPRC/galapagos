
#include "WAN_bridge.hpp"

ap_axis_net gp_to_net (galapagos_packet in_data)
{
	ap_axis_net out_data;
	out_data.data = in_data.data;
	out_data.keep = in_data.keep;
	out_data.last = in_data.last;
	out_data.user = in_data.user;
	return out_data;
}


void WAN_bridge(
          galapagos_interface &g2N_input,
          netStream &g2N_output
          ){

#pragma HLS DATAFLOW
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS INTERFACE axis port=g2N_input register_mode=off
#pragma HLS INTERFACE axis port=g2N_output register_mode=off

	static ap_axis_net old_packet;
	galapagos_packet packetin;
	ap_axis_net packetout;
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
			packetout.user = packetin.user;
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
