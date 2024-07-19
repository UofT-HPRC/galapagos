#include "hls_stream.h"
#include "ap_int.h"

#include "ap_axi_sdata.h"


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


//Parameters
#define BYTE_WIDTH_OF_DATA 64
#define width_of_penalty 32
//  select width_of_penalty such that 2^width_of_penalty > max_penalty * max_packet_size / DW

//Calculated pre-processed values
#define bitwidth (BYTE_WIDTH_OF_DATA * 8)


typedef ap_axis<bitwidth, 16, 24, 24> network_data_t;
typedef hls::stream<network_data_t> network_data;

void network_throttle(network_data &data_in,network_data &data_out,ap_uint<width_of_penalty> penalty);