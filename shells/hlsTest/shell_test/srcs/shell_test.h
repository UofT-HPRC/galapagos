#ifndef SHELL_TEST_H_
#define SHELL_TEST_H_

#include "hls_stream.h"
#include "ap_int.h"

struct ap_axis{
    ap_uint<64> data;
    ap_uint<1> last;
    ap_uint<8> keep;
    ap_uint<8> dest;
};

void shell_test(
    long long* mem_0, // global memory pointer
    long long* mem_1,
    hls::stream<ap_axis>* stream_in,
    hls::stream<ap_axis>* stream_out,
    int mode,
    int address,
    char dest
);

#endif // SHELL_TEST_H_
