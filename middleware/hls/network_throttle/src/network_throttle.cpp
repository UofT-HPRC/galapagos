#include "network_throttle.hpp"

//Network Throttler
//If you want an output bitrate of BW (in bits/s), with a clock rate of CR (Hz), and
//   a BYTE_WIDTH_OF_DATA (width of the data in bytes) of DW, then set the Penalty (P) as:
//   P = (CR * DW * 8000 / BW) - 1000
//      Note a penalty of 0 allows for the output bitrate to match the input (if P=0 then BW = CR * DW * 8)
//         This core will not block any packets if penalty is 0
//         The penalty can change in real time, with the new value taking effect the next packet.
//    The penalty must be a natural number (whole number that is positive or zero).
//       The X800 factor allows for finer tuning the desired bandwidth.
//  Inversely one can determine the bandwidth a certain penalty represents as:
//   BW = CR * PW * 8000  / (P + 1000) This is useful if searching for the lowest bitrate that fails for instance to ramp down the penalty.


void network_throttle(
	network_data &data_in,
	network_data &data_out,
	ap_uint<width_of_penalty> penalty
)
{
#pragma HLS DATAFLOW

#pragma HLS INTERFACE ap_ctrl_none port=return

#pragma HLS INTERFACE axis port=data_in register_mode=off
#pragma HLS INTERFACE axis port=data_out register_mode=off
	network_data_t temp_data;
	static ap_uint<width_of_penalty> accumulated_penalty = 0;
	static ap_uint<1> active = 0;
	if (((active == 1) || (accumulated_penalty<1000)) && !data_in.empty() && !data_out.full())
	{
		temp_data = data_in.read();
		accumulated_penalty = accumulated_penalty + penalty;
		active = temp_data.last == 1 ? 0 : 1;
		data_out.write(temp_data);
	}
	else
	{
		accumulated_penalty = (accumulated_penalty > 1000U) ? (ap_uint<width_of_penalty> )(accumulated_penalty - 1000) : (ap_uint<width_of_penalty> )(0);
	}

}
