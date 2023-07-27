#ifndef _X_HLS_GENERIC_MAD_H_
#define _X_HLS_GENERIC_MAD_H_

#include "utils/x_hls_defines.h"
#include "utils/x_hls_utils.h"
#include "utils/x_hls_traits.h"

namespace hls_mad {
//mad for ap_fixed
template <int W_, int I_>
ap_fixed<W_,I_> generic_mad(ap_fixed<W_,I_> x, ap_fixed<W_,I_> y, ap_fixed<W_,I_> z){
	ap_fixed<2*W_,2*I_> x1=x;
	ap_fixed<2*W_,2*I_> y1=y;
	ap_fixed<2*W_,2*I_> result;
	ap_fixed<2*W_,2*I_> temp=x1<<(-2*W_+2*I_);
	int i=0;//2*W_-1;
	while(i!=2*W_){
		result += temp*y1[i];
		temp = temp << 1;
		i++;
	}
	result+=z;
	return result;
}
//mad for ap_ufixed
template <int W_, int I_>
ap_ufixed<W_,I_> generic_mad(ap_ufixed<W_,I_> x, ap_ufixed<W_,I_> y, ap_ufixed<W_,I_> z){
	ap_fixed<W_+1,I_+1> x1=x;
	ap_fixed<W_+1,I_+1> y1=y;
	ap_fixed<W_+1,I_+1> z1=z;
	return generic_mad(x1,y1,z1);
}
//mad for ap_int
template <int I_>
ap_int<I_> generic_mad(ap_int<I_> x, ap_int<I_> y, ap_int<I_> z){
	ap_fixed<I_,I_> x1 = x;
	ap_fixed<I_,I_> y1 = y;
	ap_fixed<I_,I_> z1 = z;
	return generic_mad(x1,y1,z1);
}
//mad for ap_uint
template <int I_>
ap_uint<I_> generic_mad(ap_uint<I_> x, ap_uint<I_> y, ap_uint<I_> z){
	ap_ufixed<I_,I_> x1 = x;
	ap_ufixed<I_,I_> y1 = y;
	ap_ufixed<I_,I_> z1 = z;
	return generic_mad(x1,y1,z1);
}
}
#endif

// 67d7842dbbe25473c3c32b93c0da8047785f30d78e8a024de1b57352245f9689
