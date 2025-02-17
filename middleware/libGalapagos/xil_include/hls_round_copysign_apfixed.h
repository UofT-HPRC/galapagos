/*****************************************************************************
 *
 *     Author: Xilinx, Inc.
 *
 *     This text contains proprietary, confidential information of
 *     Xilinx, Inc. , is distributed by under license from Xilinx,
 *     Inc., and may be used, copied and/or disclosed only pursuant to
 *     the terms of a valid license agreement with Xilinx, Inc.
 *
 *     XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS"
 *     AS A COURTESY TO YOU, SOLELY FOR USE IN DEVELOPING PROGRAMS AND
 *     SOLUTIONS FOR XILINX DEVICES.  BY PROVIDING THIS DESIGN, CODE,
 *     OR INFORMATION AS ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE,
 *     APPLICATION OR STANDARD, XILINX IS MAKING NO REPRESENTATION
 *     THAT THIS IMPLEMENTATION IS FREE FROM ANY CLAIMS OF INFRINGEMENT,
 *     AND YOU ARE RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE
 *     FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY DISCLAIMS ANY
 *     WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE
 *     IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR
 *     REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF
 *     INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 *     FOR A PARTICULAR PURPOSE.
 *
 *     Xilinx products are not intended for use in life support appliances,
 *     devices, or systems. Use in such applications is expressly prohibited.
 *
 *     (c) Copyright 2008-2012 Xilinx Inc.
 *     All rights reserved.
 *
 *****************************************************************************/
#ifndef _X_HLS_ROUND_COPYSIGN_APFIXED_H_
#define _X_HLS_ROUND_COPYSIGN_APFIXED_H_
#include "ap_fixed.h"
#include "ap_int.h"

template <int W_, int I_>
ap_fixed<W_,I_> ceil_fixed(ap_fixed<W_,I_> x)
{
#pragma HLS pipeline
    if(W_ == I_) {
        return x;
    }
    else {
        if ( x(W_-I_-1,0) != 0 ) {
            x(W_-I_-1,0) = 0;
            x += 1;
        }
        return x;
    }
}
template <int W_, int I_>
ap_ufixed<W_,I_> ceil_fixed(ap_ufixed<W_,I_> x)
{
#pragma HLS pipeline
    if(W_ == I_) {
        return x;
    }
    else {
        if ( x(W_-I_-1,0) != 0 ) {
            x(W_-I_-1,0) = 0;
            x += 1;
        }
        return x;
    }
}
template <int I_>
ap_int<I_> ceil_fixed(ap_int<I_> x)
{
    return x;
}
template <int I_>
ap_uint<I_> ceil_fixed(ap_uint<I_> x)
{
    return x;
}

template <int W_, int I_>
ap_fixed<W_,I_> floor_fixed(ap_fixed<W_,I_> x)
{
    if(W_ == I_) {
        return x;
    }
    else {
        if ( x(W_-I_-1,0) != 0 ) x(W_-I_-1,0) = 0;
        return x;
    }
}
template <int W_, int I_>
ap_ufixed<W_,I_> floor_fixed(ap_ufixed<W_,I_> x)
{
    if(W_ == I_) {
        return x;
    }
    else {
        if ( x(W_-I_-1,0) != 0 ) x(W_-I_-1,0) = 0;
        return x;
    }
}
template <int I_>
ap_int<I_> floor_fixed(ap_int<I_> x)
{
    return x;
}
template <int I_>
ap_uint<I_> floor_fixed(ap_uint<I_> x)
{
    return x;
}

template <int W_, int I_>
ap_fixed<W_,I_> trunc_fixed(ap_fixed<W_,I_> x)
{
#pragma HLS pipeline
    if(W_ == I_) {
        return x;
    }
    else {
        if ( x(W_-I_-1,0) != 0 ) {
            x(W_-I_-1,0) = 0;
            if ( x[W_-1] )
                x += 1;
        }
        return x;
    }
}
template <int W_, int I_>
ap_ufixed<W_,I_> trunc_fixed(ap_ufixed<W_,I_> x)
{
#pragma HLS pipeline
    if(W_ == I_) {
        return x;
    }
    else {
        if ( x(W_-I_-1,0) != 0 )
            x(W_-I_-1,0) = 0;
        return x;
    }
}
template <int I_>
ap_int<I_> trunc_fixed(ap_int<I_> x)
{
    return x;
}
template <int I_>
ap_uint<I_> trunc_fixed(ap_uint<I_> x)
{
    return x;
}

template <int W_, int I_>
ap_fixed<W_,I_> copysign_fixed(ap_fixed<W_,I_> x, ap_fixed<W_,I_> y)
{
    x[W_-1] = y[W_-1];
    return x;
}
template <int W_, int I_>
ap_ufixed<W_,I_> copysign_fixed(ap_ufixed<W_,I_> x, ap_ufixed<W_,I_> y)
{
    return x;
}
template <int I_>
ap_int<I_> copysign_fixed(ap_int<I_> x, ap_int<I_> y)
{
    x[I_-1] = y[I_-1];
    return x;
}
template <int I_>
ap_uint<I_> copysign_fixed(ap_uint<I_> x, ap_uint<I_> y)
{
    return x;
}

template <int W_, int I_>
ap_fixed<W_,I_> fabs_fixed(ap_fixed<W_,I_> x)
{
    ap_fixed<W_,I_> xs       = -x;
                    xs[W_-1] = 0;
    return ( ( x[W_-1] ) ? xs : x );
}
template <int W_, int I_>
ap_ufixed<W_,I_> fabs_fixed(ap_ufixed<W_,I_> x)
{
    return x;
}
template <int I_>
ap_int<I_> fabs_fixed(ap_int<I_> x)
{
    ap_int<I_> xs       = -x;
               xs[I_-1] = 0;
    return ( ( x[I_-1] ) ? xs : x );
}
template <int I_>
ap_uint<I_> fabs_fixed(ap_uint<I_> x)
{
    return x;
}

template <int W_, int I_>
ap_fixed<W_,I_> round_fixed(ap_fixed<W_,I_> x)
{
#pragma HLS pipeline
    if(W_ == I_) {
        return x;
    }
    else {
        if ( x(W_-I_-1,0) != 0 ) {
            ap_fixed<W_+1,I_+1> xs = 0;
            ap_fixed<W_, I_> half_val = 0.5;

            if(x[W_-1]) {
                xs = -x;
                xs = xs +  half_val;
                xs(W_-I_-1,0) = 0;
                x = -xs;
            }
            else {
                xs = x + half_val;
                xs(W_-I_-1,0) = 0;
                x = xs;
            }
        }
        return x;
    }
}
template <int W_, int I_>
ap_ufixed<W_,I_> round_fixed(ap_ufixed<W_,I_> x)
{
#pragma HLS pipeline
    if(W_ == I_) {
        return x;
    }
    else {
        if ( x(W_-I_-1,0) != 0 ) {
            ap_fixed<W_, I_> half_val = 0.5;
            x = x + half_val;
            x(W_-I_-1,0) = 0;
        }
        return x;
    }
}
template <int I_>
ap_int<I_> round_fixed(ap_int<I_> x)
{
    return x;
}
template <int I_>
ap_uint<I_> round_fixed(ap_uint<I_> x)
{
    return x;
}

template <int W_, int I_>
ap_fixed<W_,I_> rint_fixed(ap_fixed<W_,I_> x)
{
#pragma HLS pipeline
    if(W_ == I_) {
        return x;
    }
    else {
        if ( x(W_-I_-1,0) != 0 ) {
            ap_fixed<W_+1,I_+1> xs = 0;
            ap_fixed<W_, I_> half_val = 0.5;

            if(x[W_-1]) {
                xs = -x;
                xs = xs +  half_val;
                if (xs(W_-I_-1,0)) {
                    xs(W_-I_-1,0) = 0;
                }
                else {
                    xs[W_-I_] = 0;
                }
                x = -xs;
            }
            else {
                xs = x +  half_val;
                if( xs(W_-I_-1,0) ) {
                    xs(W_-I_-1,0) = 0;
                }
                else {
                    xs[W_-I_] = 0;
                }
                x = xs;
            }
        }
        return x;
    }
}
template <int W_, int I_>
ap_ufixed<W_,I_> rint_fixed(ap_ufixed<W_,I_> x)
{
#pragma HLS pipeline
    if(W_ == I_) {
        return x;
    }
    else {
        if ( x(W_-I_-1,0) != 0 ) {
            ap_fixed<W_, I_> half_val = 0.5;
            x = x + half_val;
            if (x(W_-I_-1,0)) {
                x(W_-I_-1,0) = 0;
            }
            else {
                x[W_-I_] = 0;
            }
        }
        return x;
    }
}
template <int I_>
ap_int<I_> rint_fixed(ap_int<I_> x)
{
    return x;
}
template <int I_>
ap_uint<I_> rint_fixed(ap_uint<I_> x)
{
    return x;
}

template <int W_, int I_>
ap_fixed<W_,I_> nearbyint_fixed(ap_fixed<W_,I_> x)
{
#pragma HLS pipeline
    if(W_ == I_) {
        return x;
    }
    else {
        if ( x(W_-I_-1,0) != 0 ) {
            ap_fixed<W_+1,I_+1> xs = 0;
            ap_fixed<W_, I_> half_val = 0.5;

            if(x[W_-1]) {
                xs = -x;
                xs = xs +  half_val;
                if (xs(W_-I_-1,0)) {
                    xs(W_-I_-1,0) = 0;
                }
                else {
                    xs[W_-I_] = 0;
                }
                x = -xs;
            }
            else {
                xs = x +  half_val;
                if (xs(W_-I_-1,0)) {
                    xs(W_-I_-1,0) = 0;
                }
                else {
                    xs[W_-I_] = 0;
                }
                x = xs;
            }
        }
        return x;
    }
}
template <int W_, int I_>
ap_ufixed<W_,I_> nearbyint_fixed(ap_ufixed<W_,I_> x)
{
#pragma HLS pipeline
    if(W_ == I_) {
        return x;
    }
    else {
        if ( x(W_-I_-1,0) != 0 ) {
            ap_fixed<W_+1,I_+1> xs = 0;
            ap_fixed<W_, I_> half_val = 0.5;
            xs = x + half_val;
            if (xs(W_-I_-1,0) ) {
                xs(W_-I_-1,0) = 0;
            }
            else {
                xs[W_-I_] = 0;
            }
            x = xs;
        }
        return x;
    }
}
template <int I_>
ap_int<I_> nearbyint_fixed(ap_int<I_> x)
{
    return x;
}
template <int I_>
ap_uint<I_> nearbyint_fixed(ap_uint<I_> x)
{
    return x;
}

template <int W_, int I_>
bool signbit_fixed(ap_fixed<W_, I_> x){
    if(x[W_-1]) return true;
    else       return false;
}
template <int W_, int I_>
bool signbit_fixed(ap_ufixed<W_, I_> x){
    return false;
}

template <int I_>
bool signbit_fixed(ap_int<I_> x){
    if(x[I_-1]) return true;
    else        return false;
}

template <int I_>
bool signbit_fixed(ap_uint<I_> x){
    return false;
}
namespace fp_internal {
  template<int W, int I>
  ap_fixed<W, I> nextafter(ap_fixed<W, I> x, ap_fixed<W, I> y){
     const static int F = W - I;
     ap_ufixed<1, -F+1> ulp = 0;
     ulp[0] = 1;
     ap_fixed<W, I> r = 0;
     if(x == y)     r = y;
     else if(x < y) r = x + ulp;
     else           r = x - ulp;
     return r;
  }
  template<int W, int I>
  ap_ufixed<W, I> nextafter(ap_ufixed<W, I> x, ap_ufixed<W, I> y) {
     ap_fixed<W+1, I+1> xi = x;
     ap_fixed<W+1, I+1> yi = y;
     return nextafter(xi, yi);

  }
  template<int I>
  ap_int<I> nextafter(ap_int<I> x, ap_int<I> y) {
     ap_fixed<I, I> xi = x;
     ap_fixed<I, I> yi = y;
     return nextafter(xi, yi);
  }
  template<int I>
  ap_uint<I> nextafter(ap_uint<I> x, ap_uint<I> y) {
     ap_fixed<I+1, I+1> xi = x;
     ap_fixed<I+1, I+1> yi = y;
     return nextafter(xi, yi);
  }
  template<int W, int I>
  ap_fixed<W, I> nexttoward(ap_fixed<W, I> x, ap_fixed<W, I> y){
     return nextafter(x,y);
  }
  template<int W, int I>
  ap_ufixed<W, I> nexttoward(ap_ufixed<W, I> x, ap_ufixed<W, I> y){
     return nextafter(x,y);
  }
  template<int I>
  ap_int<I> nexttoward(ap_int<I> x, ap_int<I> y){
     return  nextafter(x,y);
  }
  template<int I>
  ap_uint<I> nexttoward(ap_uint<I> x, ap_uint<I> y){
     return nextafter(x,y);
  }
}

#endif

// 67d7842dbbe25473c3c32b93c0da8047785f30d78e8a024de1b57352245f9689
