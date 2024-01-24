// File Name : hls_ssr_fft_streaming_transposer.h
/*
=========================================================================================
-_-                                                                                   -_-
-_-                                                                                   -_-
-_-                                                                                   -_-
-_-                                                                                   -_-
-_-                                                                                   -_-
-_-                                                                                   -_-
-_-

	21-sep-2018-:This file defines a streaming transposer block. This block
	will perform data.	re oredring on the input to ssr fft. The data re
	ordering is implemented using data commutor blocks which are defined using
	hls::streams as compared to the original version which is based on array
	interfaces and and PIPOs. The streaming	transposer design is intended for
	better QoR in terms block ram usage.

-_-                                                                                   -_-
-_-                                                                                   -_-
-_-                                                                                   -_-
-_-                                                                                   -_-
-_-                                                                                   -_-
-_-                                                                                   -_-
-_-                                                                                   -_-
-_-                                                                                   -_-
 ========================================================================================
 */
#ifndef __HLS_SSR_FFT_STREAMING_TRANSPOSER__
#define __HLS_SSR_FFT_STREAMING_TRANSPOSER__

#ifndef __SYNTHESIS__
	#include <iostream>
	#include <assert.h>
#endif


#ifdef __HLS_SSR_FFT_LOCAL_LIB_DEVLOPMENT_PROJECT__
	//======================================================================
	// If source files are used for development of hls ssr fft IP locally
	// then set the files path as local.
	//=======================================================================
	#include "hls_ssr_fft_utilities.h"
	//#include "hls_ssr_fft_data_commutor.h"
	#include "hls_ssr_fft_streaming_data_commutor.h"
	#include  "hls_ssr_fft_streaming_forking_data_commutor.h"
	#include "hls_ssr_fft_pragma_controls.h"
#else //__HLS_SSR_FFT_LOCAL_LIB_DEVLOPMENT_PROJECT__ not defied
	//======================================================================
	// if the ssr fft source files are to be used in vivado_hls library with
	// released version of the tool then set path according to the placement
	// of the library
	//=======================================================================
	#include "hls/ssr_lib/fft/hls_ssr_fft_utilities.h"
	//#include "hls/ssr_lib/fft/hls_ssr_fft_data_commutor.h"
	#include "hls/ssr_lib/fft/hls_ssr_fft_streaming_data_commutor.h"
	#include  "hls/ssr_lib/fft/hls_ssr_fft_streaming_forking_data_commutor.h"
	#include "hls/ssr_lib/fft/hls_ssr_fft_pragma_controls.h"
#endif

namespace hls
{
	namespace ssr_fft
	{
		template<int tp_stages, int tp_outputForkingFactor>
		struct inputSwapStreaming
		{
			template <int tp_L, int tp_R,int tp_PF, typename tt_T>
			void swap(tt_T in[tp_R][tp_L/tp_R],tt_T out[tp_R][tp_L/tp_R]);
		};
		// These  declarations cover base case for modeling input swap functions were Length of SSR FFT is always integer
		// power of Radix R or SSR
		////////////////////////////////////////////////////////////////////////
		// Specialization for Forking Factor(tp_outputForkingFactor) = 1
		//                         &&
		template<int tp_stages>
		struct inputSwapStreaming<tp_stages,1>
		{
			template <int tp_L, int tp_R,int tp_PF, typename tt_T>
			void swap(tt_T in[tp_R][tp_L/tp_R],tt_T out[tp_R][tp_L/tp_R]);
		};

		template<>
		struct inputSwapStreaming<1,1>
		{
				template <int tp_L, int tp_R,int tp_PF, typename tt_T>
				void swap(tt_T in[tp_R][tp_L/tp_R],tt_T out[tp_R][tp_L/tp_R])
				{
#pragma HLS INLINE
					static const int isLargeMemFlag = (  ( (tp_PF*tp_R) > SSR_FFT_URAM_SELECTION_THRESHHOLD ) && SSR_FFT_USE_URAMS );

					streamingDataCommutations<10000,1,tp_PF,isLargeMemFlag> commutor;
					commutor.template streamingDataCommutor<tp_L,tp_R,tt_T>(in,out);
				}
		};
		/////////////////////////////////////////////////////////////////////////
		// Struct declaration for the case where forking factor is > 1 and stage is 1
		// which is actually the terminal case to stop recursion
		template< int tp_outputForkingFactor>
		struct inputSwapStreaming<1,tp_outputForkingFactor>
		{
			template <int tp_L, int tp_R,int tp_PF, typename tt_T>
			void swap(tt_T in[tp_R][tp_L/tp_R],tt_T out[tp_R][tp_L/tp_R]);
		};
		////////////////////////////////////////////////////////////////////////
		// Base Case Implementation where L is integer power of radix ///start
		template<int tp_stages>
		template <int tp_L, int tp_R, int tp_PF, typename tt_T>
		void inputSwapStreaming<tp_stages,1>::swap(tt_T in[tp_R][tp_L/tp_R],tt_T out[tp_R][tp_L/tp_R])
		{
#pragma HLS INLINE   // The swap is in-lined in a data-flow region to expose dataCommutor to become a process.
					 // Recursion will create a chain of processes....
		tt_T temp[tp_R][tp_L/tp_R];
#pragma HLS DATA_PACK variable=temp
#pragma HLS STREAM variable=temp depth=8 dim=2
#pragma HLS RESOURCE variable=temp core=FIFO_LUTRAM
#ifdef SSR_FFT_PARTITION_INTERFACE_ARRAYS
	#pragma HLS ARRAY_PARTITION variable=temp complete dim=1
#else
	#pragma HLS ARRAY_RESHAPE variable=temp complete dim=1
#endif
			static const int isLargeMemFlag = (  ((tp_PF*tp_R) > SSR_FFT_URAM_SELECTION_THRESHHOLD ) && SSR_FFT_USE_URAMS ) ;

		    streamingDataCommutations<10000+tp_stages,0,tp_PF,isLargeMemFlag> commutor;
			commutor.template streamingDataCommutor<tp_L,tp_R,tt_T>(in,temp);
			// Instantiate Next State....Recursion
			inputSwapStreaming<tp_stages-1,1> nextStage;
			nextStage.template swap<tp_L,tp_R,(tp_PF*tp_R),tt_T>(temp, out);  // Supply Next Stage PF
		}
		//Base Case Implementation where L is integer power of radix ///END
		////////////////////////////////////////////////////////////////////////
		// The generic case where s > 1 and forking factor is > 1 : it structure is same like case when s>1 and f=1
		template<int tp_stages,int tp_outputForkingFactor>
		template <int tp_L, int tp_R, int tp_PF, typename tt_T>
		void inputSwapStreaming<tp_stages,tp_outputForkingFactor>::swap(tt_T in[tp_R][tp_L/tp_R],tt_T out[tp_R][tp_L/tp_R])
		{
#pragma HLS INLINE   // The swap is in-lined in a data-flow region to expose dataCommutor to become a process.
					 // Recursion will create a chain of processes....
			tt_T temp[tp_R][tp_L/tp_R];
#pragma HLS STREAM variable=temp depth=8 dim=2
#pragma HLS RESOURCE variable=temp core=FIFO_LUTRAM
#pragma HLS ARRAY_PARTITION variable=temp complete dim=1
#pragma HLS DATA_PACK variable=temp
			static const int isLargeMemFlag = (  ((tp_PF*tp_R) > SSR_FFT_URAM_SELECTION_THRESHHOLD ) && SSR_FFT_USE_URAMS ) ;

			streamingDataCommutations<10000+tp_stages,0,tp_PF,isLargeMemFlag> commutor;
			commutor.template streamingDataCommutor<tp_L,tp_R,tt_T>(in,temp);
			// Instantiate Next State....Recursion
			inputSwapStreaming<tp_stages-1,tp_outputForkingFactor> nextStage;
			nextStage.template swap<tp_L,tp_R,(tp_PF*tp_R),tt_T>(temp, out);  // Supply Next Stage PF
		}
		////////////////////////////////////////////////////////////////////////
		template<int tp_outputForkingFactor>
		template <int tp_L, int tp_R,int tp_PF, typename tt_T>
		void inputSwapStreaming<1,tp_outputForkingFactor>::swap(tt_T in[tp_R][tp_L/tp_R],tt_T out[tp_R][tp_L/tp_R])
		{
#pragma HLS INLINE
			streamingDataCommutorFork <10000+1,tp_outputForkingFactor,tp_outputForkingFactor > streamingDataCommutorFork_obj;
			streamingDataCommutorFork_obj.template copyForkCommuteAndMerge<tp_PF,tp_L,tp_R,tt_T>(in,out);
		}
#if 1
		template<int tp_stages, int tp_outputForkingFactor>
		struct inputSwapStreaming_s2s
		{
			template <int tp_L, int tp_R,int tp_PF, typename tt_T>
			//void swap(tt_T in[tp_R][tp_L/tp_R],tt_T out[tp_R][tp_L/tp_R]);
			void swap(hls::stream< super_sample_container< tp_R , tt_T > > &in, hls::stream< super_sample_container< tp_R , tt_T > > &out);
		};
		// These  declarations cover base case for modeling input swap functions were Length of SSR FFT is always integer
		// power of Radix R or SSR
		////////////////////////////////////////////////////////////////////////
		// Specialization for Forking Factor(tp_outputForkingFactor) = 1
		//                         &&
		template<int tp_stages>
		struct inputSwapStreaming_s2s<tp_stages,1>
		{
			template <int tp_L, int tp_R,int tp_PF, typename tt_T>
			void swap(hls::stream< super_sample_container< tp_R , tt_T > > &in, hls::stream< super_sample_container< tp_R , tt_T > > &out);
		};
		template<>
		struct inputSwapStreaming_s2s<1,1>
		{
				template <int tp_L, int tp_R,int tp_PF, typename tt_T>
				void swap(hls::stream< super_sample_container< tp_R , tt_T > > &in, hls::stream< super_sample_container< tp_R , tt_T > > &out)
				{
#pragma HLS INLINE
					static const int isLargeMemFlag = (  ( (tp_PF*tp_R) > SSR_FFT_URAM_SELECTION_THRESHHOLD ) && SSR_FFT_USE_URAMS );
					DataCommutations_s2streaming<10000,1,tp_PF,isLargeMemFlag> commutor;
					commutor.template streamingDataCommutor<tp_L,tp_R,tt_T>(in,out);
				}
		};
		/////////////////////////////////////////////////////////////////////////
		// Struct declaration for the case where forking factor is > 1 and stage is 1
		// which is actually the terminal case to stop recursion
		template< int tp_outputForkingFactor>
		struct inputSwapStreaming_s2s<1,tp_outputForkingFactor>
		{
			template <int tp_L, int tp_R,int tp_PF, typename tt_T>
			void swap(hls::stream< super_sample_container< tp_R , tt_T > > &in, hls::stream< super_sample_container< tp_R , tt_T > > &out);
		};
		////////////////////////////////////////////////////////////////////////
		// Base Case Implementation where L is integer power of radix ///start
		template<int tp_stages>
		template <int tp_L, int tp_R, int tp_PF, typename tt_T>
		void inputSwapStreaming_s2s<tp_stages,1>::swap(hls::stream< super_sample_container< tp_R , tt_T > > &in, hls::stream< super_sample_container< tp_R , tt_T > > &out)
		{
#pragma HLS INLINE   // The swap is in-lined in a data-flow region to expose dataCommutor to become a process.
					 // Recursion will create a chain of processes....
			static const int isLargeMemFlag = (  ((tp_PF*tp_R) > SSR_FFT_URAM_SELECTION_THRESHHOLD ) && SSR_FFT_USE_URAMS ) ;
			hls::stream< super_sample_container< tp_R , tt_T > > temp;
#pragma HLS DATA_PACK variable=temp
#pragma HLS RESOURCE variable=temp core=FIFO_LUTRAM
#pragma HLS STREAM variable=temp depth=8

			DataCommutations_s2streaming<10000+tp_stages,0,tp_PF,isLargeMemFlag> commutor;
			commutor.template streamingDataCommutor<tp_L,tp_R,tt_T>(in,temp);
			// Instantiate Next State....Recursion
			inputSwapStreaming_s2s<tp_stages-1,1> nextStage;
			nextStage.template swap<tp_L,tp_R,(tp_PF*tp_R),tt_T>(temp, out);  // Supply Next Stage PF = PF*tp_R
		}
		//Base Case Implementation where L is integer power of radix ///END
		////////////////////////////////////////////////////////////////////////
		// The generic case where s > 1 and forking factor is > 1 : it structure is same like case when s>1 and f=1
		template<int tp_stages,int tp_outputForkingFactor>
		template <int tp_L, int tp_R, int tp_PF, typename tt_T>
		void inputSwapStreaming_s2s<tp_stages,tp_outputForkingFactor>::swap(hls::stream< super_sample_container< tp_R , tt_T > > &in, hls::stream< super_sample_container< tp_R , tt_T > > &out)
		{
#pragma HLS INLINE   // The swap is in-lined in a data-flow region to expose dataCommutor to become a process.
			 	 	 // Recursion will create a chain of processes....
			hls::stream< super_sample_container< tp_R , tt_T > > temp;
#pragma HLS DATA_PACK variable=temp
#pragma HLS RESOURCE variable=temp core=FIFO_LUTRAM
#pragma HLS STREAM variable=temp depth=8

			static const int isLargeMemFlag = (  ((tp_PF*tp_R) > SSR_FFT_URAM_SELECTION_THRESHHOLD ) && SSR_FFT_USE_URAMS ) ;

			DataCommutations_s2streaming<10000+tp_stages,tp_stages+tp_PF,tp_PF,isLargeMemFlag> commutor;
			commutor.template streamingDataCommutor<tp_L,tp_R,tt_T>(in,temp);
			// Instantiate Next State....Recursion
			inputSwapStreaming_s2s<tp_stages-1,tp_outputForkingFactor> nextStage;
			nextStage.template swap<tp_L,tp_R,(tp_PF*tp_R),tt_T>(temp, out);  // Supply Next Stage PF
		}
		////////////////////////////////////////////////////////////////////////
		template<int tp_outputForkingFactor>
		template <int tp_L, int tp_R,int tp_PF, typename tt_T>
		void inputSwapStreaming_s2s<1,tp_outputForkingFactor>::swap(hls::stream< super_sample_container< tp_R , tt_T > > &in, hls::stream< super_sample_container< tp_R , tt_T > > &out)
		{
#pragma HLS INLINE
			hls::stream< super_sample_container< tp_R/tp_outputForkingFactor, tt_T > > temp[tp_outputForkingFactor];
#pragma HLS DATA_PACK variable=temp
#pragma HLS RESOURCE variable=temp core=FIFO_LUTRAM
#pragma HLS ARRAY_PARTITION variable=temp complete dim=1
#pragma HLS STREAM variable=temp depth=8
			hls::stream< super_sample_container< tp_R/tp_outputForkingFactor, tt_T > > temp2[tp_outputForkingFactor];
#pragma HLS DATA_PACK variable=temp2
#pragma HLS RESOURCE variable=temp2 core=FIFO_LUTRAM
#pragma HLS ARRAY_PARTITION variable=temp complete dim=1
#pragma HLS STREAM variable=temp2 depth=8

			forkSuperSampleStream<tp_L,tp_R,20000,tp_outputForkingFactor,tt_T>(in,temp);
			streamingDataCommutorFork_s2s <10000+tp_outputForkingFactor,tp_outputForkingFactor,tp_outputForkingFactor > streamingDataCommutorFork_obj;
			streamingDataCommutorFork_obj.template forkedCompute<tp_PF,tp_L,tp_R,tt_T>(temp,temp2);
			mergeSuperSampleStream<tp_L,tp_R,20000,tp_outputForkingFactor,tt_T>(temp2,out);  //(hls::stream< super_sample_container< tp_R/tp_forkingFactor , tt_T > > in[tp_forkingFactor], hls::stream< super_sample_container< tp_R, tt_T > > &outSuperStream)
		}

#endif

	} //namespace ssr_fft
} //namespace hls

#endif //__HLS_SSR_FFT_STREAMING_TRANSPOSER__
