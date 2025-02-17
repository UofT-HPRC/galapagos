//hls_ssr_fft_fork_merge_utils.h
#ifndef HLS_SSR_FFT_FORK_MERGE_UTILS_H_
#define HLS_SSR_FFT_FORK_MERGE_UTILS_H_
#ifdef __HLS_SSR_FFT_LOCAL_LIB_DEVLOPMENT_PROJECT__

#include <hls_stream.h>
	//======================================================================
	// If source files are used for development of hls ssr fft IP locally
	// then set the files path as local.
	//=======================================================================
	#include "hls_ssr_fft_utilities.h"
	#include "hls_ssr_fft_super_sample.h"
#else //__HLS_SSR_FFT_LOCAL_LIB_DEVLOPMENT_PROJECT__ not defied
	//======================================================================
	// if the ssr fft source files are to be used in vivado_hls library with
	// released version of the tool then set path according to the placement
	// of the library
	//=======================================================================
	#include "hls/ssr_lib/fft/hls_ssr_fft_utilities.h"
	#include "hls/ssr_lib/fft/hls_ssr_fft_super_sample.h"
#endif
/*
=========================================================================================
-_-                                                                                   -_-
-_-                                                                                   -_-
-_-                                                                                   -_-
-_-                                                                                   -_-
-_-                                                                                   -_-
-_-                                                                                   -_-
-_-

			SSR FFT in last few stages break its kernel into small FFT kernel
			by factor called forking factor. Generally most of the SSR FFT
			block in dataflow pipeline process blocks of data sized [tp_R][tp_L/tp_R]
			but for certain special cases when tp_L is not integer power of tp_R
			in last stage the large FFT kernel block breaks in small kernels of
			whose size is smaller by factor called forking factor. So dataflow pipeline
			that is processing blocks of [tp_R][tp_L/tp_R] forks into multiple
			streams each of size [tp_R/tp_forkingFactor][tp_L/tp_R]. This forking
			happens is fft stage kernel and also in blocks that do data re oredering.
			These utility functions are used to create a smaller forked stream
			and also to merge a small stream into big one for final output.

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

namespace hls
{
namespace ssr_fft
{
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


	template <int tp_L, int tp_R,int tp_forkNumber, int tp_forkingFactor, typename tt_T>
	void copyToLocalBuff(tt_T in[tp_R][tp_L/tp_R],tt_T out[tp_R/tp_forkingFactor][tp_L/tp_R])
	{
	#pragma HLS INLINE off

		const int fork_width = tp_R/tp_forkingFactor;
		const int offset     = (tp_forkNumber-1) * fork_width;

		//CHECK_COVEARAGE;


		for (int t = 0; t < tp_L/tp_R;t++)
		{
	#pragma HLS PIPELINE II=1 rewind
			for (int r = 0; r < tp_R/tp_forkingFactor; r++)
			{
	#pragma HLS UNROLL

				out[r][t]=in[offset + r][t];
			}
		}

	}

	template <int tp_L, int tp_R,int tp_forkNumber, int tp_forkingFactor, typename tt_T>
	void copyFromLocalBuffToOuput(tt_T in[tp_R/tp_forkingFactor][tp_L/tp_R],tt_T out[tp_R][tp_L/tp_R])
	{
	#pragma HLS INLINE off

		const int fork_width = tp_R/tp_forkingFactor;
		const int offset     = (tp_forkNumber-1) * fork_width;
		//CHECK_COVEARAGE;
		for (int t = 0; t < tp_L/tp_R;t++)
		{
	#pragma HLS PIPELINE II=1 rewind
			for (int r = 0; r < tp_R/tp_forkingFactor; r++)
			{
	#pragma HLS UNROLL

				//out[t][2*tp_forkNumber-1-r]=in[t][tp_R/tp_forkingFactor-1-r];
	//			out[t][offset+r]=in[t][r];
				out[(r<<(ssr_fft_log2<tp_forkingFactor>::val)) + tp_forkNumber-1][t]=in[r][t];


			}
		}

	}


	template <int tp_L, int tp_R,int tp_forkNumber, int tp_forkingFactor, typename tt_T>
	void copyFromLocalBuffToOuput_NI(tt_T in[tp_R/tp_forkingFactor][tp_L/tp_R],tt_T out[tp_R][tp_L/tp_R])
	{
	#pragma HLS INLINE off
		const int fork_width = tp_R/tp_forkingFactor;
		const int offset     = (tp_forkNumber-1) * fork_width;

		//CHECK_COVEARAGE;

		for (int t = 0; t < tp_L/tp_R;t++)
		{
	#pragma HLS PIPELINE II=1 rewind
			for (int r = 0; r < tp_R/tp_forkingFactor; r++)
			{
	#pragma HLS UNROLL

				out[fork_width*(tp_forkNumber-1) + r][t]=in[r][t];
	//			out[t][offset+r]=in[t][r];
				//out[t][tp_forkingFactor*r + tp_forkNumber-1]=in[t][r];


			}
		}

		}

	template <int stage, int id, int tp_L, int tp_R, typename tt_T>
			void convertArrayToSuperStream(tt_T inArr[tp_R][tp_L/tp_R], hls::stream< super_sample_container<tp_R,tt_T> > &out)
			{
			#pragma HLS INLINE off
			//#pragma HLS STREAM variable=inArr dim=2
			#pragma HLS ARRAY_PARTITION variable=inArr complete dim=1


				for (int i = 0; i < tp_L/tp_R; i++)
				{
					#pragma HLS PIPELINE II=1 rewind
					super_sample_container<tp_R,tt_T> temp;
			#pragma HLS ARRAY_PARTITION variable=temp.superSample complete dim=1
					for (int r = 0; r < tp_R; r++)
					{
			#pragma HLS UNROLL
					   temp.superSample[r]=inArr[r][i];
					}
					out.write(temp);
				}
			}


			template <int stage, int id, int tp_L, int tp_R, typename tt_T, typename tt_T1>
			void convertSuperStreamToArray(hls::stream< super_sample_container<tp_R,tt_T> > &in, tt_T1 outArr[tp_R][tp_L/tp_R])
			{
			#pragma HLS INLINE off
				super_sample_container<tp_R,tt_T> temp;
			#pragma HLS ARRAY_PARTITION variable=temp.superSample complete dim=1
			//#pragma HLS STREAM variable=outArr dim=2
			#pragma HLS ARRAY_PARTITION variable=outArr complete dim=1

				for (int i = 0; i < tp_L/tp_R; i++)
				{
			#pragma HLS PIPELINE II=1 rewind
					//std::cout<<"L="<<tp_L<<"R="<<tp_R<<std::endl;
					//assert(in.empty());

					in.read(temp);

					//super_sample_store< tp_R,tt_T > sumperSampleContainer;
					for (int r = 0; r < tp_R; r++)
					{
			#pragma HLS UNROLL
						outArr[r][i] = temp.superSample[r];//in[r].read();
					}
				}
			}




	template <int tp_L, int tp_R,typename tt_T>
	void streamJoinUtility(tt_T in[tp_R][tp_L/tp_R],tt_T out[tp_R][tp_L/tp_R])
	{
	#pragma HLS INLINE off
		for (int t = 0; t < tp_L/tp_R;t++)
		{
	#pragma HLS PIPELINE II=1 rewind
			for (int r = 0; r < tp_R; r++)
			{
	#pragma HLS UNROLL
				out[r][t]=in[r][t];
			}
		}

	}
	template <int tp_L, int tp_R,typename tt_T>
	void streamJoinUtility_s2s(hls::stream<super_sample_container<tp_R,tt_T> > &in,tt_T out[tp_R][tp_L/tp_R])
	{
	#pragma HLS INLINE off
		for (int t = 0; t < tp_L/tp_R;t++)
		{
	#pragma HLS PIPELINE II=1 rewind
			super_sample_container<tp_R,tt_T> temp_super_sample_in;
			temp_super_sample_in=in.read();
			for (int r = 0; r < tp_R; r++)
			{
	#pragma HLS UNROLL
				//out[r][t]=in[r][t];
				out[r][t]=temp_super_sample_in.superSample[r];
			}
		}

	}


	template <int tp_L, int tp_R,int tp_forkNumber, int tp_forkingFactor, typename tt_T>
	void forkSuperSampleStream(hls::stream< super_sample_container< tp_R , tt_T > > &in, hls::stream< super_sample_container< tp_R/tp_forkingFactor , tt_T > > outStreamArray[tp_forkingFactor])
	{
#pragma HLS INLINE off
//#pragma HLS DATA_PACK variable=in
//#pragma HLS DATA_PACK variable=outStreamArray

		const unsigned int fork_size = tp_R/tp_forkingFactor;

		super_sample_container< tp_R , tt_T > temp_in_super_sample;
//#pragma HLS DATA_PACK variable=temp_in_super_sample

		//super_sample_container< tp_R/tp_forkingFactor , tt_T > temp_factored_array[tp_forkingFactor];
//#pragma HLS DATA_PACK variable=temp_factored_array
//#pragma HLS ARRAY_PARTITION variable=temp_factored_array complete dim=1


		super_sample_container< tp_R/tp_forkingFactor , tt_T > temp_factored;
//#pragma HLS DATA_PACK variable=temp_factored



		/////////////////////// Read input Sample Stream of size tp_R ////////////////////
		//////////////////////////////////////////////////////////////////////////////////


		////////////////////// Split tp_R size single stream to tp_forkingFactor streamS //////

		for (int t = 0; t < tp_L/tp_R; ++t)
		{

#pragma HLS PIPELINE II=1 rewind
			temp_in_super_sample = in.read();

			for (int fork_no = 0; fork_no < tp_forkingFactor; fork_no++)
			{
	#pragma HLS UNROLL

				for (int sample_no = 0; sample_no < tp_R/tp_forkingFactor; sample_no++)
				{
	#pragma HLS UNROLL
					temp_factored.superSample[sample_no] = temp_in_super_sample.superSample[fork_no*fork_size + sample_no];
				}
				//temp_factored_array[fork_no]=temp_factored;
				outStreamArray[fork_no].write(temp_factored);
			}
		}

	}


	template <int tp_L, int tp_R,int tp_forkNumber, int tp_forkingFactor, typename tt_T>
	void mergeSuperSampleStream(hls::stream< super_sample_container< tp_R/tp_forkingFactor , tt_T > > in[tp_forkingFactor], hls::stream< super_sample_container< tp_R, tt_T > > &outSuperStream)
	{
#pragma HLS INLINE off
		super_sample_container< tp_R/tp_forkingFactor , tt_T > sub_sample_in;
		super_sample_container< tp_R , tt_T > super_sample_sample_out;
		const unsigned int fork_size = tp_R/tp_forkingFactor;

		for (int t = 0; t < tp_L/tp_R; ++t)
		{
#pragma HLS PIPELINE II=1 rewind
			for (int fork_no = 0; fork_no < tp_forkingFactor; fork_no++)
			{
#pragma HLS UNROLL
				sub_sample_in = in[fork_no].read();
				for (int sample_no = 0; sample_no < tp_R/tp_forkingFactor; sample_no++)
				{
#pragma HLS UNROLL
					//super_sample_sample_out.superSample[fork_no*fork_size + sample_no]=sub_sample_in.superSample[sample_no];
					super_sample_sample_out.superSample[ (sample_no<<(ssr_fft_log2<tp_forkingFactor>::val))  +  fork_no]=sub_sample_in.superSample[sample_no];

					//out[(r<<(ssr_fft_log2<tp_forkingFactor>::val)) + tp_forkNumber-1]=in[r];

				}
			}
			outSuperStream.write(super_sample_sample_out);
		}
	}

	template <int tp_L, int tp_R,int tp_forkNumber, int tp_forkingFactor, typename tt_T>
	void mergeSuperSampleStream_NI(hls::stream< super_sample_container< tp_R/tp_forkingFactor , tt_T > > in[tp_forkingFactor], hls::stream< super_sample_container< tp_R, tt_T > > &outSuperStream)
	{
#pragma HLS INLINE off
		super_sample_container< tp_R/tp_forkingFactor , tt_T > sub_sample_in;
		super_sample_container< tp_R , tt_T > super_sample_sample_out;
		const unsigned int fork_size = tp_R/tp_forkingFactor;

		for (int t = 0; t < tp_L/tp_R; ++t)
		{
#pragma HLS PIPELINE II=1 rewind
			for (int fork_no = 0; fork_no < tp_forkingFactor; fork_no++)
			{
#pragma HLS UNROLL
				sub_sample_in = in[fork_no].read();
				for (int sample_no = 0; sample_no < fork_size; sample_no++)
				{
#pragma HLS UNROLL
					super_sample_sample_out.superSample[fork_no*fork_size + sample_no]=sub_sample_in.superSample[sample_no];
				}
			}
			outSuperStream.write(super_sample_sample_out);
		}
	}

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
} //namespace hls
} //namespace ssr_fft

#endif //HLS_SSR_FFT_FORK_MERGE_UTILS_H_




