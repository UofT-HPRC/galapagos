// File Name : hls_ssr_fft_streaming_data_commutor.h
#ifndef __HLS_SSR_FFT_STREAMING_DATA_COMMUTOR_H__
#define __HLS_SSR_FFT_STREAMING_DATA_COMMUTOR_H__

#include <complex>
#include <ap_shift_reg.h>
#include <hls_stream.h>
#include <ap_int.h>

#ifdef __HLS_SSR_FFT_LOCAL_LIB_DEVLOPMENT_PROJECT__
	//==========================================================		============
	// If source files are used for development of hls ssr fft IP locally
	// then set the files path as local.
	//=======================================================================
	#include "hls_ssr_fft_mux_chain.h"
	#include "hls_ssr_fft_triangle_delay.h"
	#include "hls_ssr_fft_super_sample.h"
	#include "hls_ssr_fft_utilities.h"
	#include "hls_ssr_fft_fork_merge_utils.h"
#else //__HLS_SSR_FFT_LOCAL_LIB_DEVLOPMENT_PROJECT__ not defied
	//======================================================================
	// if the ssr fft source files are to be used in vivado_hls library with
	// released version of the tool then set path according to the placement
	// of the library
	//=======================================================================
	#include "hls/ssr_lib/fft/hls_ssr_fft_mux_chain.h"
	#include "hls/ssr_lib/fft/hls_ssr_fft_triangle_delay.h"
	#include "hls/ssr_lib/fft/hls_ssr_fft_super_sample.h"
	#include "hls/ssr_lib/fft/hls_ssr_fft_utilities.h"
	#include "hls/ssr_lib/fft/hls_ssr_fft_fork_merge_utils.h"
#endif

namespace hls
{
	namespace ssr_fft
	{
#if 1
		// Streaming data commutor
		template <int stage, int id, typename tt_T, unsigned int tp_L,unsigned int tp_R, unsigned int tp_PF>
		void streamingDataCommutor_inner(
											hls::stream< super_sample_container<tp_R,tt_T> > &sample_in,
											hls::stream< super_sample_container<tp_R,tt_T> > &sample_out
										)
		{
#pragma HLS INLINE off
			typedef tagged_sample< super_sample_container<tp_R,tt_T> > tagged_super_sample;
			typedef tagged_sample< tt_T > taggeg_single_sample;
			const int control_count_width = ( (hls::ssr_fft::ssr_fft_log2<tp_R>::val) > 0  ) ? (hls::ssr_fft::ssr_fft_log2<tp_R>::val) : 1;
			// If tp_PF log2 is smaller then 1 then assign bit width as 1
			const int pf_count_width = (hls::ssr_fft::ssr_fft_log2<tp_PF>::val > 0) ? (hls::ssr_fft::ssr_fft_log2<tp_PF>::val) :1;
			static  ap_uint<control_count_width> control_count = 0;
			static ap_uint<pf_count_width> pf_count=0;
			static ap_uint<control_count_width> control_bits;
		    super_sample_container<tp_R,tt_T> temp_super_sample;
#pragma HLS ARRAY_PARTITION variable=temp_super_sample.superSample complete dim=1

		   tagged_sample< tt_T > temp_tagged_input_triangle_delay_input[tp_R];
#pragma HLS ARRAY_PARTITION variable=temp_tagged_input_triangle_delay_input complete dim=1

		   taggeg_single_sample temp_tagged_mux_chain_input[tp_R];
#pragma HLS ARRAY_PARTITION variable=temp_tagged_mux_chain_input complete dim=1

		   taggeg_single_sample temp_tagged_output_triangle_input[tp_R];
#pragma HLS ARRAY_PARTITION variable=temp_tagged_output_triangle_input complete dim=1

		   taggeg_single_sample commuted_output[tp_R];
#pragma HLS ARRAY_PARTITION variable=commuted_output complete dim=1

		   TriangleDelay<stage,id,tp_R> input_triangle_delay_block;
		   TriangleDelay<stage,id,tp_R> output_triangle_delay_block;
		   MuxChain<stage,id,tp_R>  muxChain_block;
		   tagged_sample< super_sample_container<tp_R,tt_T> > temp_tagged_sample;
		   for (int t = 0; t < tp_L/tp_R + (tp_R-1)*tp_PF ; t++)
		   {
#pragma HLS PIPELINE II=1 rewind
			   /// Read Sample from the input fifo /////////////////////////////////////////////////////////////////////////
			   // If the input fifo has data read it, tag it and push it into the commutor network
			   if(sample_in.read_nb(temp_super_sample))
			   {
				   for (int c = 0; c < tp_R; c++)
				   {
		#pragma HLS UNROLL
					   temp_tagged_input_triangle_delay_input[c].sample=temp_super_sample.superSample[c];
					   temp_tagged_input_triangle_delay_input[c].valid=true;
				   }
				control_bits=(control_count);
				bool pf_tick;
				if(pf_count==tp_PF-1)
				{
				   pf_count=0;
				   pf_tick=true;
				}
				else
				{
				   pf_count++;
				   pf_tick=false;
				}
				if(pf_tick)
				{
				   if(control_count==tp_R-1)
					   control_count=0;
				   else
				   control_count++;
				}
			   }
			   else // if the input fifo has no data push zeros input the commutor with invalid data tag :: here the assumption is that there are no bubbles inside a frame, they can appear between frames
			   {
				   for (int c = 0; c < tp_R; c++)
				   {
		#pragma HLS UNROLL
					   temp_tagged_input_triangle_delay_input[c].sample=0;
					   temp_tagged_input_triangle_delay_input[c].valid=false;
				   }
				   control_bits=0;//(control_count>>2);
				   control_count=0;
				   pf_count=0;
			   }
			   /// Read Sample from the input fifo /////////////////////////////////////////////////////////////////////////
			   input_triangle_delay_block.template process<taggeg_single_sample,tp_PF,false>(temp_tagged_input_triangle_delay_input, temp_tagged_mux_chain_input);
			   muxChain_block.template genChain<taggeg_single_sample,ap_uint<control_count_width>, tp_R, tp_PF>(control_bits, temp_tagged_mux_chain_input, temp_tagged_output_triangle_input);
			   output_triangle_delay_block.template process<taggeg_single_sample,tp_PF,true>(temp_tagged_output_triangle_input, commuted_output);
			   super_sample_container<tp_R,tt_T> temp_output;
		#pragma HLS ARRAY_PARTITION variable=temp_output.superSample complete dim=1
		//#pragma HLS ARRAY_PARTITION variable=temp_output.valid complete dim=1

			   for (int c = 0; c < tp_R; c++)
			   {
		#pragma HLS UNROLL
				temp_output.superSample[c]=commuted_output[c].sample;
			   }
			   bool valid_flag=true;
			   for (int c = 0; c < tp_R; c++)
			   {
		#pragma HLS UNROLL
				   valid_flag = valid_flag && commuted_output[c].valid;
			   }
			   if(valid_flag==true)
			   {
				   sample_out.write(temp_output);
			   }

		   }




		}







		template < int stage, int id , int tp_PF, int isLargeMem>
		struct streamingDataCommutations {
			template < int tp_L , int tp_R , typename tt_T>
			void streamingDataCommutor (tt_T in[tp_R][tp_L/tp_R], tt_T out[tp_R][tp_L/tp_R]);
		};
		template <int stage,int id,int tp_PF, int isLargeMem>
		template <int tp_L, int tp_R, typename tt_T>
		void streamingDataCommutations<stage,id,tp_PF,isLargeMem>::streamingDataCommutor(tt_T in[tp_R][tp_L/tp_R], tt_T out[tp_R][tp_L/tp_R])
		{
		//#pragma HLS DATAFLOW
		#pragma HLS INLINE
		#pragma HLS STREAM variable=in dim=2
		#pragma HLS STREAM variable=out dim=2
#pragma HLS RESOURCE variable=in core=FIFO_LUTRAM
#pragma HLS RESOURCE variable=out core=FIFO_LUTRAM

		#pragma HLS ARRAY_PARTITION variable=in complete dim=1
		#pragma HLS ARRAY_PARTITION variable=out complete dim=1

			 hls::stream <super_sample_container < tp_R, tt_T > > superSample_in;
#pragma HLS STREAM variable=superSample_in depth=8 dim=1
#pragma HLS RESOURCE variable=superSample_in core=FIFO_LUTRAM

		//#pragma HLS DATA_PACK variable=superSample_in

			 hls::stream <super_sample_container < tp_R, tt_T > >  superSample_out;
#pragma HLS STREAM variable=superSample_out depth=8 dim=1
#pragma HLS RESOURCE variable=superSample_out core=FIFO_LUTRAM


		//#pragma HLS DATA_PACK variable=superSample_out


			convertArrayToSuperStream<stage,id,tp_L,tp_R,tt_T>(in,superSample_in);
			streamingDataCommutor_inner<stage,id,tt_T, tp_L,tp_R,tp_PF>(superSample_in,superSample_out);
			convertSuperStreamToArray<stage,id,tp_L,tp_R,tt_T>(superSample_out, out );
		}

#endif
		//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


		template <int stage, int id, typename tt_T, unsigned int tp_L,unsigned int tp_R, unsigned int tp_PF>
				void streamingDataCommutor_inner_s2streaming_NO_STALLS(hls::stream< super_sample_container<tp_R,tt_T> > &sample_in ,  hls::stream< super_sample_container<tp_R,tt_T> > &sample_out)
				{
				#pragma HLS INLINE off
					typedef tagged_sample< super_sample_container<tp_R,tt_T> > tagged_super_sample;
					typedef tagged_sample< tt_T > taggeg_single_sample;
					const int control_count_width = ( (hls::ssr_fft::ssr_fft_log2<tp_R>::val) > 0  ) ? (hls::ssr_fft::ssr_fft_log2<tp_R>::val) : 1;
					// If tp_PF log2 is smaller then 1 then assign bit width as 1
					const int pf_count_width = (hls::ssr_fft::ssr_fft_log2<tp_PF>::val > 0) ? (hls::ssr_fft::ssr_fft_log2<tp_PF>::val) :1;

					static  ap_uint<control_count_width> control_count = 0;
					//static unsigned int control_count = 0;

					static ap_uint<pf_count_width> pf_count=0;
					//static unsigned int pf_count=0;

					//static unsigned int control_bits;
					static ap_uint<control_count_width> control_bits;
				   super_sample_container<tp_R,tt_T> temp_super_sample;
				#pragma HLS ARRAY_PARTITION variable=temp_super_sample.superSample complete dim=1

				   tagged_sample< tt_T > temp_tagged_input_triangle_delay_input[tp_R];
				#pragma HLS ARRAY_PARTITION variable=temp_tagged_input_triangle_delay_input complete dim=1

				   taggeg_single_sample temp_tagged_mux_chain_input[tp_R];
				#pragma HLS ARRAY_PARTITION variable=temp_tagged_mux_chain_input complete dim=1

				   taggeg_single_sample temp_tagged_output_triangle_input[tp_R];
				#pragma HLS ARRAY_PARTITION variable=temp_tagged_output_triangle_input complete dim=1

				   taggeg_single_sample commuted_output[tp_R];
				#pragma HLS ARRAY_PARTITION variable=commuted_output complete dim=1

				   TriangleDelay<stage,id,tp_R> input_triangle_delay_block;
				   TriangleDelay<stage,id,tp_R> output_triangle_delay_block;
				   MuxChain<stage,id,tp_R>  muxChain_block;


				   tagged_sample< super_sample_container<tp_R,tt_T> > temp_tagged_sample;
				   for (int t = 0; t < tp_L/tp_R + (tp_R-1)*tp_PF ; t++)
				   {
				#pragma HLS PIPELINE II=1 rewind
					   /// Read Sample from the input fifo /////////////////////////////////////////////////////////////////////////
					   // If the input fifo has data read it, tag it and push it into the commutor network
					   if(sample_in.read_nb(temp_super_sample))
					   {
						   for (int c = 0; c < tp_R; c++)
						   {
				#pragma HLS UNROLL
							   temp_tagged_input_triangle_delay_input[c].sample=temp_super_sample.superSample[c];
							   temp_tagged_input_triangle_delay_input[c].valid=true;
						   }

						control_bits=(control_count);
						bool pf_tick;
						if(pf_count==tp_PF-1)
						{
						   pf_count=0;
						   pf_tick=true;
						}
						else
						{
						   pf_count++;
						   pf_tick=false;
						}
						if(pf_tick)
						{
						   if(control_count==tp_R-1)
							   control_count=0;
						   else
						   control_count++;
						}

					   }
					   // if the input fifo has no data push zeros input the commutor with invalid data tag here
					   //the assumption is that there are no bubbles inside a frame, they can appear between frames
					   else
					   {
						   for (int c = 0; c < tp_R; c++)
						   {
#pragma HLS UNROLL
							   temp_tagged_input_triangle_delay_input[c].sample=0;
							   temp_tagged_input_triangle_delay_input[c].valid=false;
						   }
						   control_bits=0;//(control_count>>2);
						   control_count=0;
						   pf_count=0;
					   }
					   /// Read Sample from the input fifo /////////////////////////////////////////////////////////////////////////
					   input_triangle_delay_block.template process<taggeg_single_sample,tp_PF,false>(temp_tagged_input_triangle_delay_input, temp_tagged_mux_chain_input);
					   muxChain_block.template genChain<taggeg_single_sample,ap_uint<control_count_width>, tp_R, tp_PF>(control_bits, temp_tagged_mux_chain_input, temp_tagged_output_triangle_input);
					   output_triangle_delay_block.template process<taggeg_single_sample,tp_PF,true>(temp_tagged_output_triangle_input, commuted_output);
					   super_sample_container<tp_R,tt_T> temp_output;
				#pragma HLS ARRAY_PARTITION variable=temp_output.superSample complete dim=1
					   for (int c = 0; c < tp_R; c++)
					   {
				#pragma HLS UNROLL
						temp_output.superSample[c]=commuted_output[c].sample;
					   }
					   bool valid_flag=true;
					   for (int c = 0; c < tp_R; c++)
					   {
				#pragma HLS UNROLL
						   valid_flag = valid_flag && commuted_output[c].valid;
					   }
					   if(valid_flag==true)
					   {
						   sample_out.write(temp_output);
					   }
				   }
				}

#if 1
		template <int stage, int id, typename tt_T, unsigned int tp_L,unsigned int tp_R, unsigned int tp_PF>
				void streamingDataCommutor_inner_s2streaming(hls::stream< super_sample_container<tp_R,tt_T> > &sample_in ,  hls::stream< super_sample_container<tp_R,tt_T> > &sample_out)
				{
				#pragma HLS INLINE off
					typedef tagged_sample< super_sample_container<tp_R,tt_T> > tagged_super_sample;
					typedef tagged_sample< tt_T > taggeg_single_sample;
					const int control_count_width = ( (hls::ssr_fft::ssr_fft_log2<tp_R>::val) > 0  ) ? (hls::ssr_fft::ssr_fft_log2<tp_R>::val) : 1;
					const int sample_count_width = ( (hls::ssr_fft::ssr_fft_log2<tp_L/tp_R>::val) > 0  ) ? (hls::ssr_fft::ssr_fft_log2<tp_L/tp_R>::val) : 1;
					// If tp_PF log2 is smaller then 1 then assign bit width as 1
					const int pf_count_width = (hls::ssr_fft::ssr_fft_log2<tp_PF>::val > 0) ? (hls::ssr_fft::ssr_fft_log2<tp_PF>::val) :1;

					static  ap_uint<control_count_width> control_count = 0;
					static ap_uint<pf_count_width> pf_count=0;
					static ap_uint<sample_count_width> sample_in_read_count=0;
					static bool delay_line_stall = false;
					static ap_uint<control_count_width> control_bits;

				   super_sample_container<tp_R,tt_T> temp_super_sample;
#pragma HLS ARRAY_PARTITION variable=temp_super_sample.superSample complete dim=1
				   tagged_sample< tt_T > temp_tagged_input_triangle_delay_input[tp_R];
#pragma HLS ARRAY_PARTITION variable=temp_tagged_input_triangle_delay_input complete dim=1
				   taggeg_single_sample temp_tagged_mux_chain_input[tp_R];
#pragma HLS ARRAY_PARTITION variable=temp_tagged_mux_chain_input complete dim=1
				   taggeg_single_sample temp_tagged_output_triangle_input[tp_R];
#pragma HLS ARRAY_PARTITION variable=temp_tagged_output_triangle_input complete dim=1
				   taggeg_single_sample commuted_output[tp_R];
#pragma HLS ARRAY_PARTITION variable=commuted_output complete dim=1

				   TriangleDelay<stage,id,tp_R> input_triangle_delay_block;
				   TriangleDelay<stage,id,tp_R> output_triangle_delay_block;
				   MuxChain<stage,id,tp_R>  muxChain_block;


				   tagged_sample< super_sample_container<tp_R,tt_T> > temp_tagged_sample;
				   for (int t = 0; t < tp_L/tp_R + (tp_R-1)*tp_PF ; t++)
				   {
				#pragma HLS PIPELINE II=1 rewind
					   /// Read Sample from the input fifo /////////////////////////////////////////////////////////////////////////
					   // If the input fifo has data read it, tag it and push it into the commutor network
					   bool fifo_has_next_sample = sample_in.read_nb(temp_super_sample);
					   if(fifo_has_next_sample)
					   {

							control_bits=(control_count);
							bool pf_tick;
							if(pf_count==tp_PF-1)
							{
							   pf_count=0;
							   pf_tick=true;
							}
							else
							{
							   pf_count++;
							   pf_tick=false;
							}
							if(pf_tick)
							{
							   if(control_count==tp_R-1)
								   control_count=0;
							   else
							   control_count++;
							}
							if(sample_in_read_count==(tp_L/tp_R)-1)
							{
								sample_in_read_count=0;
								delay_line_stall=false;
							}
							else
							{
								sample_in_read_count++;
								delay_line_stall=true;
							}
					   }
					   if(fifo_has_next_sample)
					   {
						   for (int c = 0; c < tp_R; c++)
						   {
#pragma HLS UNROLL
							   temp_tagged_input_triangle_delay_input[c].sample=temp_super_sample.superSample[c];
							   temp_tagged_input_triangle_delay_input[c].valid=true;
						   }
					   }
					   else
					   {
						   for (int c = 0; c < tp_R; c++)
						   {
   #pragma HLS UNROLL
							   temp_tagged_input_triangle_delay_input[c].sample=0;
							   temp_tagged_input_triangle_delay_input[c].valid=false;
						   }

					   }

					   // Push next sample into the delay line network if the fifo read produced valid sample
					   // else depending on the condition if the stall is needed stall the delay line network
					   // or push a zero sample.
					   if(fifo_has_next_sample || !delay_line_stall)
					   {
						   input_triangle_delay_block.template process<taggeg_single_sample,tp_PF,false>(temp_tagged_input_triangle_delay_input, temp_tagged_mux_chain_input);
						   muxChain_block.template genChain<taggeg_single_sample,ap_uint<control_count_width>, tp_R, tp_PF>(control_bits, temp_tagged_mux_chain_input, temp_tagged_output_triangle_input);
						   output_triangle_delay_block.template process<taggeg_single_sample,tp_PF,true>(temp_tagged_output_triangle_input, commuted_output);
						   super_sample_container<tp_R,tt_T> temp_output;
#pragma HLS ARRAY_PARTITION variable=temp_output.superSample complete dim=1
						   for (int c = 0; c < tp_R; c++)
						   {
#pragma HLS UNROLL
							temp_output.superSample[c]=commuted_output[c].sample;
						   }
						   bool valid_flag=true;
						   for (int c = 0; c < tp_R; c++)
						   {
#pragma HLS UNROLL
							   valid_flag = valid_flag && commuted_output[c].valid;
						   }
						   if(valid_flag==true)
						   {
							   sample_out.write(temp_output);
						   }
					   } // stall if end
				   } // for loop end
				} // function end
#endif
		template < int stage, int id , int tp_PF, int isLargeMem>
				struct DataCommutations_s2streaming
				{
					template < int tp_L , int tp_R , typename tt_T>
					void streamingDataCommutor (
												hls::stream< super_sample_container < tp_R, tt_T > > &in,
												hls::stream< super_sample_container < tp_R, tt_T > > &out
												);
				};
				template <int stage,int id,int tp_PF, int isLargeMem>
				template <int tp_L, int tp_R, typename tt_T>
				void DataCommutations_s2streaming<stage,id,tp_PF,isLargeMem>::streamingDataCommutor(
						hls::stream< super_sample_container<tp_R,tt_T> > &in,
						hls::stream< super_sample_container<tp_R,tt_T> > &out)

				{
#pragma HLS INLINE
				//#pragma HLS DATAFLOW
				/*
				#pragma HLS ARRAY_PARTITION variable=in complete dim=1
				#pragma HLS ARRAY_PARTITION variable=out complete dim=1

				hls::stream <super_sample_container < tp_R, tt_T > > superSample_in;
				#pragma HLS STREAM variable=superSample_in depth=8 dim=1

				hls::stream <super_sample_container < tp_R, tt_T > >  superSample_out;
				#pragma HLS STREAM variable=superSample_in depth=8 dim=1*/


#pragma HLS DATA_PACK variable=in
#pragma HLS DATA_PACK variable=out

					streamingDataCommutor_inner_s2streaming<stage,id,tt_T, tp_L,tp_R,tp_PF>(in,out);
				}


		//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	} // end name space ssr_fft
} // end name space hls

#endif //__HLS_SSR_FFT_STREAMING_DATA_COMMUTOR_H__
