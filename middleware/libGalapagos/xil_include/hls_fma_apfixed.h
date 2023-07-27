#ifndef _X_HLS_GENERIC_FMA_H_
#define _X_HLS_GENERIC_FMA_H_

#include "utils/x_hls_defines.h"
#include "utils/x_hls_utils.h"
#include "utils/x_hls_traits.h"

namespace hls_fma {
//fma for ap_fixed
template <int W_, int I_>
ap_fixed<W_,I_> generic_fma(ap_fixed<W_,I_> x, ap_fixed<W_,I_> y, ap_fixed<W_,I_> z){
	ap_fixed<2*W_,2*I_> x1=x;
	ap_fixed<2*W_,2*I_> y1=y;
	return x1*y1+z;
}
//fma for ap_ufixed
template <int W_, int I_>
ap_ufixed<W_,I_> generic_fma(ap_ufixed<W_,I_> x, ap_ufixed<W_,I_> y, ap_ufixed<W_,I_> z){
	ap_ufixed<2*W_,2*I_> x1=x;
	ap_ufixed<2*W_,2*I_> y1=y;
	return x1*y1+z;
}
//fma for ap_int
template <int I_>
ap_int<I_> generic_fma(ap_int<I_> x, ap_int<I_> y, ap_int<I_> z){
	ap_fixed<I_,I_> x1 = x;
	ap_fixed<I_,I_> y1 = y;
	ap_fixed<I_,I_> z1 = z;
	return generic_fma(x1,y1,z1);
}
//fma for ap_uint
template <int I_>
ap_uint<I_> generic_fma(ap_uint<I_> x, ap_uint<I_> y, ap_uint<I_> z){
	ap_ufixed<I_,I_> x1 = x;
	ap_ufixed<I_,I_> y1 = y;
	ap_ufixed<I_,I_> z1 = z;
	return generic_fma(x1,y1,z1);
}
}
#endif

// 67d7842dbbe25473c3c32b93c0da8047785f30d78e8a024de1b57352245f9689
