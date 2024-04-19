#include "hls_stream.h"
#include "ap_int.h"
#include "ap_utils.h"

//Parameters
#define BYTE_WIDTH_OF_DATA 64
#define width_of_penalty 32
//  select width_of_penalty such that 2^width_of_penalty > max_penalty * max_packet_size / DW

//Calculated pre-processed values
#define bitwidth (BYTE_WIDTH_OF_DATA * 8)
#define flits 10
struct net_data
{
	ap_uint<bitwidth> data;
	ap_uint<BYTE_WIDTH_OF_DATA> keep;
	ap_uint<1> last;
	ap_uint<24> dest;
	ap_uint<24> id;
	ap_uint<16> user;
	//Add any other necessary sideband signals
};
void receiver(hls::stream<net_data> &pkt_in);