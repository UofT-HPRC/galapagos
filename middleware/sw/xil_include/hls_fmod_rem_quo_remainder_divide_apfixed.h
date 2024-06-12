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
 *     (c) Copyright 2012-2016 Xilinx Inc.
 *     All rights reserved.
 *
 *****************************************************************************/

/**
 * @file hls_fmod_rem_quo.h
 *
 */
#ifndef _X_HLS_FMOD_REM_QUO_H_
#define _X_HLS_FMOD_REM_QUO_H_

#include "ap_int.h"
#include "ap_fixed.h"
#include "utils/x_hls_defines.h"
#include "utils/x_hls_utils.h"
#ifndef __SYNTHESIS__
#include "utils/x_hls_traits.h"
#include <stdio.h>
#include <stdlib.h>
#endif

namespace hls_my{
	//divide for ap_fixed numerator and denominator
	template <int W_, int I_>
	ap_fixed<W_,I_> generic_divide(ap_fixed<W_,I_> x, ap_fixed<W_,I_> y){
		if(y==0){//case y==0, return error and stop
#ifndef __SYNTHESIS__
		printf("ERROR:hls_math.h:divisor cannot be zero");
		exit(1);
#endif
		}
		else{
			return(x/y);
		}
	}
	//divide for ap_ufixed numerator and denominator
	template <int W_, int I_>
	ap_ufixed<W_,I_> generic_divide(ap_ufixed<W_,I_> x, ap_ufixed<W_,I_> y){
		ap_fixed<W_+1,I_+1> x1 = x;
		ap_fixed<W_+1,I_+1> y1 = y;
		return generic_divide(x1,y1);
	}
	//divide for ap_int
	template <int I_>
	ap_int<I_> generic_divide(ap_int<I_> x, ap_int<I_> y){
		ap_fixed<I_,I_> x1 = x;
		ap_fixed<I_,I_> y1 = y;
		return generic_divide(x1,y1);
	}
	//divide for ap_uint
	template <int I_>
	ap_uint<I_> generic_divide(ap_uint<I_> x, ap_uint<I_> y){
		ap_ufixed<I_,I_> x1 = x;
		ap_ufixed<I_,I_> y1 = y;
		return generic_divide(x1,y1);
	}
	//fmod for ap_fixed
	template <int W_, int I_>
	ap_fixed<W_,I_> generic_fmod(ap_fixed<W_,I_> x, ap_fixed<W_,I_> y){
		if((x==y)||(x==-y))
			return 0;
		return (x-ap_int<2*W_+2>(x/y)*y);
	}

	//fmod for ap_ufixed
	template <int W_, int I_>
	ap_ufixed<W_,I_> generic_fmod(ap_ufixed<W_,I_> x, ap_ufixed<W_,I_> y){
		if(x==y)
			return 0;
		return (x-ap_uint<2*W_+2>(x/y)*y);
	}
	//fmod for ap_int
	template <int I_>
	ap_int<I_> generic_fmod(ap_int<I_> x, ap_int<I_> y){
		ap_fixed<I_,I_> x1 = x;
		ap_fixed<I_,I_> y1 = y;
		return generic_fmod(x1,y1);
	}
	//fmod for ap_uint
	template <int I_>
	ap_uint<I_> generic_fmod(ap_uint<I_> x, ap_uint<I_> y){
		ap_ufixed<I_,I_> x1 = x;
		ap_ufixed<I_,I_> y1 = y;
		return generic_fmod(x1,y1);
	}
	//remainder for ap_fixed
	template <int W_, int I_>
	ap_fixed<W_,I_> generic_remainder(ap_fixed<W_,I_> x, ap_fixed<W_,I_> y){
		if(y==0){//case y==0, return error and stop
		#ifndef __SYNTHESIS__
					printf("ERROR:hls_math.h:divisor cannot be zero");
					exit(1);
		#endif
		}
		else if((x==y)||(x==-y)||(x==0))
			return 0;
		else{
			ap_fixed<2*W_,2*I_> temp_quotient = x/y;//get the full precision quotient
			ap_fixed<2*(W_-I_)+1,1> temp = 0;//initiate a temp value for decimal part of quotient
			//calculate the absolute value of quotient and save the decimal part to temp
			if(temp_quotient[2*W_-1]==1){
				ap_fixed<2*W_,2*I_> temp_quotient2=-temp_quotient;
				temp=temp_quotient2;
			}
			else {
				temp=temp_quotient;
			}
			//calculate the integer value of quotient
			if(((temp>0.5)&&(temp_quotient[2*W_-1]==0))||((temp==0.5)&&(temp_quotient[2*W_-1]==0)&&(temp_quotient[2*W_-2*I_]==1))){
				return (x-(ap_int<2*W_+2>(temp_quotient)+ap_int<2>(1))*y);
			}
			else if (((temp>0.5)&&(temp_quotient[2*W_-1]==1))||((temp==0.5)&&(temp_quotient[2*W_-1]==1)&&(temp_quotient[2*W_-2*I_]==1))){
				return (x-(ap_int<2*W_+2>(temp_quotient)-ap_int<2>(1))*y);
			}
			else return (x-ap_int<2*W_+2>(temp_quotient)*y);
		}
	}

	//remainder for ap_ufixed
	template <int W_, int I_>
	ap_ufixed<W_,I_> generic_remainder(ap_ufixed<W_,I_> x, ap_ufixed<W_,I_> y){
		if(y==0){//case y==0, return error and stop
		#ifndef __SYNTHESIS__
					printf("ERROR:hls_math.h:divisor cannot be zero");
					exit(1);
		#endif
		}
		else if((x==y)||(x==0))
			return 0;
		else{
			return (x-ap_uint<2*W_+2>(x/y)*y);//return the remainder
		}
	}
	//remainder for ap_int
	template <int I_>
	ap_int<I_> generic_remainder(ap_int<I_> x, ap_int<I_> y){
		ap_fixed<I_,I_> x1 = x;
		ap_fixed<I_,I_> y1 = y;
		return generic_remainder(x1,y1);
	}
	//remainder for ap_uint
	template <int I_>
	ap_uint<I_> generic_remainder(ap_uint<I_> x, ap_uint<I_> y){
		ap_ufixed<I_,I_> x1 = x;
		ap_ufixed<I_,I_> y1 = y;
		return generic_remainder(x1,y1);
	}
	//remquo for ap_fixed
	template <int W_, int I_>
	ap_fixed<W_,I_> generic_remquo(ap_fixed<W_,I_> x, ap_fixed<W_,I_> y, int* quo){
		ap_fixed<W_,I_> x22 = x;
		ap_fixed<W_,I_> y22 = y;
		ap_fixed<W_,I_> z;
		ap_fixed<W_+1,I_+1> x33;
		ap_fixed<W_+1,I_+1> y33;
		ap_int<(I_>(W_-I_))?I_:(W_-I_)> x_exp;
		ap_int<(I_>(W_-I_))?I_:(W_-I_)> y_exp;
		ap_uint<W_-1> x_sig;
		ap_uint<W_-1> y_sig;
		if(y==0){////if 1
		#ifndef __SYNTHESIS__
					printf("ERROR:hls_math.h:divisor cannot be zero");
					exit(1);
		#endif
		}
		else if(x==0){
			*quo =0;
			return 0;
		}
		else if((x==y)||(x==-y)){
			*quo = (x==y)?1:-1;
			return 0;
		}
		// get abs(x) and abs(y)
		if(x[W_-1]){
			x33=-x;
		}
		else{
			x33=x;
		}
		if(y[W_-1]){
			y33=-y;
		}
		else{
			y33=y;
		}
		/// change x,y to scientific notation 1.xxx*2^xxx
		ap_uint<9> flag_x = x33.countLeadingZeros();//get the 0 numbers before 1
		ap_uint<9> flag_y = y33.countLeadingZeros();
		if(flag_x==W_){
			x_exp=I_+1-flag_x-1;;
			x_sig=0;
		}else {
			x_exp=I_+1-flag_x-1;
			x_sig=x33(W_+1-flag_x-1-1,0);
		}
		if(flag_y==W_){
			y_exp=I_+1-flag_y-1;;
			y_sig=0;
		}else {
			y_exp=I_+1-flag_y-1;
			y_sig=y33(W_+1-flag_y-1-1,0);
		}
		// boundary conditions
		ap_uint<W_> FF_max = ((ap_uint<W_>(1)<<(W_-1))-1);
		ap_uint<W_-1> FF_M = ((ap_uint<W_>(1)<<(W_-1))-1);
		ap_uint<1> isE_s = y[W_-1]==x[W_-1]?1:0;
		if ((y_exp-x_exp)>1){////if 3.2
			z = x;
			*quo =0;
			return z;
		}else if ((y_exp-x_exp)==1){//////if 3.3
			ap_uint<W_> sigx_2;
			sigx_2(W_-1,1) =x_sig(W_-2,0);
			if(x_exp==0){///if 3.3.1
				if(sigx_2(W_-2,0)<=y_sig){//// if 3.3.1.1
					z = x;
					*quo =0;
					return z;
				}
			}else if (y_sig>x_sig){////if 3.3.2
				z = x;
				*quo =0;
				return z;
			}else if (x_sig==y_sig){/////if 3.3.3
				z = x;
				*quo =0;// to be even
				return z;
			}
		}else if ((x_exp==y_exp)&&(y_exp==0)){/////if 3.4
			ap_uint<W_> sigx_2;
			sigx_2(W_-1,1) =x_sig(W_-2,0);
			if(y_sig>=sigx_2){////////////if 3.4.1
				z = x;
				*quo =0;// to be even
				return z;
			}
		}
		//main part of algorithm
		ap_fixed<W_+2,I_+1> x11 = x;
		ap_fixed<W_+2,I_+1> y11 = y;
		ap_fixed<2*W_+2,W_+1> temp_quotient = x11/y11;//get the full precision quotient
		ap_fixed<W_+2,1> temp = 0;//initiate a temp value for decimal part of quotient
		ap_fixed<2*W_+2,W_+1> temp_quotient2=-temp_quotient;
		//calculate the absolute value of quotient and save the decimal part to temp
		if(temp_quotient[2*W_+1]==1){
			temp(W_,0)=temp_quotient2(W_,0);
		}
		else {
			temp(W_,0)=temp_quotient(W_,0);
		}
		//calculate the integer value of quotient
		ap_int<2*W_+2> temp_quo;
		if(((temp>0.5)&&(temp_quotient[2*W_+1]==0))||((temp==0.5)&&(temp_quotient[2*W_+1]==0)&&(temp_quotient[W_+1]==1))){
			temp_quo = (ap_int<2*W_+2>(temp_quotient)+ap_int<2>(1));
		}
		else if (((temp>0.5)&&(temp_quotient[2*W_+1]==1))||((temp==0.5)&&(temp_quotient[2*W_+1]==1)&&(temp_quotient2[W_+1]==1))){
			temp_quo = (ap_int<2*W_+2>(temp_quotient)-ap_int<2>(1));
		}
		else{
			temp_quo = (ap_int<2*W_+2>(temp_quotient));
		}
	  ///calculate *quo
      if((x_exp-y_exp)>=32){///std's limitation
    	  *quo = 0;
      }
      else{
          ap_int<4> temquo1;
          temquo1(2,0)=temp_quo(2,0);
          temquo1[3]=temp_quotient[2*W_+1];
          if(temquo1==-8) temquo1=0;
          *quo = temquo1;
      }
		  return (x-(temp_quo)*y);//return the remainder
	}
	//, y, quoremquo for ap_ufixed
	template <int W_, int I_>
	ap_ufixed<W_,I_> generic_remquo(ap_ufixed<W_,I_> x, ap_ufixed<W_,I_> y, int* quo){
		ap_fixed<W_+1,I_+1> x1 = x;
		ap_fixed<W_+1,I_+1> y1 = y;
		return generic_remquo(x1,y1,quo);
	}
	//remquo for ap_int
	template <int I_>
	ap_int<I_> generic_remquo(ap_int<I_> x, ap_int<I_> y, int*quo){
		ap_fixed<I_,I_> x1 = x;
		ap_fixed<I_,I_> y1 = y;
		return generic_remquo(x1,y1,quo);
	}
	//remquo for ap_uint
	template <int I_>
	ap_uint<I_> generic_remquo(ap_uint<I_> x, ap_uint<I_> y, int*quo){
		ap_ufixed<I_,I_> x1 = x;
		ap_ufixed<I_,I_> y1 = y;
		return generic_remquo(x1,y1,quo);
	}
}
#endif // entire file

// 67d7842dbbe25473c3c32b93c0da8047785f30d78e8a024de1b57352245f9689
