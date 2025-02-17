#ifndef HLS_SSR_FFT_H_
#define HLS_SSR_FFT_H_

//#define HLS_SSR_FFT_DISABLE_NATURAL_ORDER_172836475866778896
#ifndef __SYNTHESIS__
#include <assert.h>
#endif
#include <complex>
#include <hls_stream.h>
#ifdef __HLS_SSR_FFT_LOCAL_LIB_DEVLOPMENT_PROJECT__
	//======================================================================
	// If source files are used for development of hls ssr fft IP locally
	// then set the files path as local.
	//=======================================================================
	#include "hls_ssr_fft_fork_merge_utils.h"
	#include "hls_ssr_fft_pragma_controls.h"
	#include "hls_ssr_fft_enums.h"
	#include "hls_ssr_fft_data_reorder.h"
	#include "hls_ssr_fft_traits.h"
	#include "hls_ssr_fft_twiddle_table.h"
	#include "hls_ssr_fft_complex_exp_table.h"
	#include "hls_ssr_fft_complex_exp_table_last_stage.h"
	#include "hls_ssr_fft_streaming_transposer.h"
	#include "hls_ssr_fft_streaming_data_commutor.h"
	#include "hls_ssr_fft_adder_tree.h"
	#include "hls_ssr_fft_input_traits.h"
	#include "hls_ssr_fft_parallel_fft_kernel.h"
	#include "hls_ssr_fft_multiplication_traits.h"
#else //__HLS_SSR_FFT_LOCAL_LIB_DEVLOPMENT_PROJECT__ not defied
	//======================================================================
	// if the ssr fft source files are to be used in vivado_hls library with
	// released version of the tool then set path according to the placement
	// of the library
	//=======================================================================
	#include "hls/ssr_lib/fft/hls_ssr_fft_fork_merge_utils.h"
	#include "hls/ssr_lib/fft/hls_ssr_fft_pragma_controls.h"
	#include "hls/ssr_lib/fft/hls_ssr_fft_enums.h"
	#include "hls/ssr_lib/fft/hls_ssr_fft_data_reorder.h"
	#include "hls/ssr_lib/fft/hls_ssr_fft_traits.h"
	#include "hls/ssr_lib/fft/hls_ssr_fft_twiddle_table.h"
	#include "hls/ssr_lib/fft/hls_ssr_fft_complex_exp_table.h"
	#include "hls/ssr_lib/fft/hls_ssr_fft_complex_exp_table_last_stage.h"
	#include "hls/ssr_lib/fft/hls_ssr_fft_streaming_transposer.h"
	#include "hls/ssr_lib/fft/hls_ssr_fft_streaming_data_commutor.h"
	#include "hls/ssr_lib/fft/hls_ssr_fft_adder_tree.h"
	#include "hls/ssr_lib/fft/hls_ssr_fft_input_traits.h"
	#include "hls/ssr_lib/fft/hls_ssr_fft_parallel_fft_kernel.h"
	#include "hls/ssr_lib/fft/hls_ssr_fft_multiplication_traits.h"
#endif

#if 1
namespace hls
{
	namespace ssr_fft
	{
		/*
		 * Convert a 2-D array interface to hls::streaming interface for connection with next
		 * stages which are all stream based.
		 */
		template <int tp_L, int tp_R,typename tt_T_in,typename tt_T_out>
		void castArray_s2streaming(tt_T_in inData[tp_R][tp_L/tp_R], hls::stream< super_sample_container < tp_R, tt_T_out > > &outData)
		{
#pragma HLS INLINE off
			for (int t = 0; t < tp_L/tp_R; t++)
			{
#pragma HLS PIPELINE II=1 rewind
				super_sample_container < tp_R, tt_T_out > temp;

				for (int r = 0; r < tp_R; r++)
				{
					temp.superSample[r] = inData[r][t];

				}
				outData.write(temp);
			}
		}

	template <		int tp_L, int tp_R,
					typename T_exp,
					typename T_twf_in,
					typename T_twf_out
			 >
	void twiddleFactorMul_s2s(
						    T_twf_in p_inData[tp_R],
							T_twf_out p_outData[tp_R],
							T_exp p_complexExpTable[],
							int p_k

						 )
	{
//#pragma HLS INLINE recursive
//#pragma HLS INLINE
#pragma HLS INLINE off
		typedef T_twf_in inType;
		typedef T_twf_out outType;
		#pragma HLS DATA_PACK variable=p_outData
		#pragma HLS DATA_PACK variable=p_inData

		L_TWIDDLE_FACTOR_MUL:
		for (int n = 0; n < tp_R; n++)
		{
	#pragma HLS UNROLL  /// Unroll Twiddle Factor Multiplication loop, required for proper implementation of SSR FFT

			//=================================================================================================
			// Style::1 :: cosim FAILs snr is good QoR is BEST
			//=================================================================================================
			//T_twf_in  in_sample;
			/*T_exp  exp_factor;
			ap_uint < ssr_fft_log2< tp_L>::val > index=n*p_k;
			exp_factor = readQuaterTwiddleTable<tp_L,tp_R,ssr_fft_log2<tp_L>::val,T_exp>(index,p_complexExpTable);
			p_outData[n].real( p_inData[n].real()*exp_factor.real() - p_inData[n].imag()*exp_factor.imag()) ;
			p_outData[n].imag( p_inData[n].real()*exp_factor.imag() + p_inData[n].imag()*exp_factor.real()) ;*/
			//CHECK_COVEARAGE;
			//=================================================================================================
			// Style::2 :: cosim passes snr is good QoR is 2nd best
			//=================================================================================================
			/*typedef typename ssr_fft_multiplication_traits<T_exp,T_twf_in>::TTR_product_op t_product_op;
			T_twf_in  in_sample;
			T_exp  exp_factor;
			in_sample = p_inData[n];
			ap_uint < ssr_fft_log2< tp_L>::val > index=n*p_k;
			//exp_factor = readTwiddleTable<tp_L,tp_R,ssr_fft_log2<tp_L>::val,T_exp>(index,p_complexExpTable);
			exp_factor = readQuaterTwiddleTable<tp_L,tp_R,ssr_fft_log2<tp_L>::val,T_exp>(index,p_complexExpTable);
			//exp_factor = p_complexExpTable[n*p_k];
			p_outData[n] = (t_product_op)in_sample * (t_product_op)exp_factor;*/
			//=================================================================================================
			// Style::3 :: cosim passes snr is lowest
			//=================================================================================================
			/*T_twf_in  in_sample;
			T_twf_in  exp_factor;
			in_sample = p_inData[n];
			ap_uint < ssr_fft_log2< tp_L>::val > index=n*p_k;
			//exp_factor = readTwiddleTable<tp_L,tp_R,ssr_fft_log2<tp_L>::val,T_exp>(index,p_complexExpTable);
			exp_factor = readQuaterTwiddleTable<tp_L,tp_R,ssr_fft_log2<tp_L>::val,T_exp>(index,p_complexExpTable);
			//exp_factor = p_complexExpTable[n*p_k];
			p_outData[n] = in_sample * exp_factor;*/
			//=================================================================================================
			// Style::4 :: It has issue cosim failure
			//=================================================================================================
			ap_uint < ssr_fft_log2< tp_L>::val > index=n*p_k;
			T_exp exp_factor =  readQuaterTwiddleTable<tp_L,tp_R,ssr_fft_log2<tp_L>::val,T_exp>(index,p_complexExpTable);
			complex_multiply(p_inData[n],exp_factor,p_outData[n]);
			//CHECK_COVEARAGE;
		}
	}




	template <
				int tp_L, //1
				int tp_R, //2
				scaling_mode_enum tp_scaling_mode,
				int stage, //3
				typename tt_complexMulOutType,  //4
				typename tt_complexExpTableType,//5
				typename tt_fftTwiddleType,//6
				typename tt_in,//7
				typename tt_out//8
			 >

	void fft_stage_kernel_s2s(
			tt_complexExpTableType complexExpTable[],
			tt_fftTwiddleType twiddleTable[twiddle_traits_len<tp_L,tp_R>::TWIDDLE_TALBE_LENGTH],
			hls::stream< super_sample_container<tp_R,tt_in > > &fftReOrderedInput,
			hls::stream< super_sample_container<tp_R,tt_out > > &fftOutData_local
						 )
	{
#pragma HLS INLINE region recursive

		const int NO_OF_FFT_STAGES = ssr_fft_log2<tp_L>::val / ssr_fft_log2<tp_R>::val;
		const unsigned int s = NO_OF_FFT_STAGES - stage;
		const int no_of_ffts_in_stage =  ssr_fft_pow<tp_R,s>::val;			//((int)pow(tp_R, (s)));  // tp_L / ((int)pow(tp_R, (s + 1)));
		const int current_fft_length = tp_L /ssr_fft_pow<tp_R,s>::val;		//tp_L / (int)pow(tp_R, s); ///(int)pow(tp_R, (s + 1));
		const int no_bflys_per_fft = current_fft_length / tp_R; 			//(int)pow(tp_R, (s));


		L_FFTs_LOOP:			// fft_length/(radix^(stage+1)) L=64,R=4, S=0 the FFTs=16
		for (int f = 0;f < no_of_ffts_in_stage;f++)
		{

			L_BFLYs_LOOP: // This loop calculates butterflies in a sub FFT that is part of a stage
			for (int k = 0;k < no_bflys_per_fft;k++) // Here bf is actually the k in FFT : frequency index
			{
#pragma HLS PIPELINE II=1 rewind
				tt_in X_of_ns[tp_R];
				tt_complexMulOutType complexExpMulOut[tp_R];
#pragma HLS DATA_PACK variable=complexExpMulOut
				tt_out bflyOutData[tp_R];
#pragma HLS DATA_PACK variable=bflyOutData

				super_sample_container<tp_R,tt_in > temp_super_sample_in=fftReOrderedInput.read();
				// The following loop should be unrolled for implementation
				L_READ_R_IN_SAMPLES:
				for (int n = 0; n < tp_R; n++)
				{
#pragma HLS UNROLL
					//replaced//X_of_ns[n] = fftReOrderedInput[n][(no_bflys_per_fft*f + k)];
					//X_of_ns[n] = fftReOrderedInput[n][ (  f<<(ssr_fft_log2<no_bflys_per_fft>::val) ) + k];
					X_of_ns[n] = temp_super_sample_in.superSample[n];  //fftReOrderedInput[n][ (  f<<(ssr_fft_log2<no_bflys_per_fft>::val) ) + k];
				}
				Butterfly<tp_R> Butterfly_obj;
				Butterfly_obj.template calcButterFly< tp_L,tp_scaling_mode>
				(X_of_ns, bflyOutData, complexExpTable);
				twiddleFactorMul_s2s<tp_L, tp_R>
				//replaced//(bflyOutData, complexExpMulOut, twiddleTable, k*(tp_L / current_fft_length));
				(bflyOutData, complexExpMulOut, twiddleTable,  ( k<<(ssr_fft_log2<tp_L / current_fft_length>::val) ) );
				super_sample_container<tp_R,tt_out > temp_super_sample_out;
				L_WRITE_R_BUTTERFLY_OUT_SAMPLES:
				for (int r = 0; r < tp_R; r++)
				{
	#pragma HLS UNROLL
					//replaced//fftOutData_local[r][ (f*no_bflys_per_fft) + k] = complexExpMulOut[r];
					//fftOutData_local[r][ ( f<<(ssr_fft_log2<no_bflys_per_fft>::val) ) + k] = complexExpMulOut[r];
					temp_super_sample_out.superSample[r]= complexExpMulOut[r];
				}
				fftOutData_local.write(temp_super_sample_out);
			}//butterflies loop
		}//sub ffts loop
	}

	template <
				int tp_L, //1
				int tp_R, //2
				scaling_mode_enum tp_scaling_mode,
				int stage, //3
				typename tt_complexMulOutType,  //4
				typename tt_complexExpTableType,//5
				typename tt_in,//7
				typename tt_out//8
			 >
	void fft_stage_kernel_last_stage_s2s(
										tt_complexExpTableType complexExpTable[],
										hls::stream< super_sample_container<tp_R,tt_in > > &fftReOrderedInput,
										hls::stream< super_sample_container<tp_R,tt_out > > &fftOutData_local
									 )
	{
#pragma HLS INLINE region recursive

		const int NO_OF_FFT_STAGES = ssr_fft_log2<tp_L>::val / ssr_fft_log2<tp_R>::val;
		const unsigned int s = NO_OF_FFT_STAGES - stage;
		const int no_of_ffts_in_stage =  ssr_fft_pow<tp_R,s>::val;//((int)pow(tp_R, (s)));  // tp_L / ((int)pow(tp_R, (s + 1)));
		const int current_fft_length = tp_L /ssr_fft_pow<tp_R,s>::val;//tp_L / (int)pow(tp_R, s); ///(int)pow(tp_R, (s + 1));
		const int no_bflys_per_fft = current_fft_length / tp_R; //(int)pow(tp_R, (s));
		const int iter_max_count = no_of_ffts_in_stage*no_bflys_per_fft;
        int k =0;
		L_FFTs_LOOP:			// fft_length/(radix^(stage+1)) L=64,R=4, S=0 the FFTs=16
		for (int iter = 0;iter < iter_max_count;iter++)
		{
#pragma HLS PIPELINE II=1 rewind
			{
				tt_in X_of_ns[tp_R];
#pragma HLS DATA_PACK variable=X_of_ns
				tt_out bflyOutData[tp_R];
#pragma HLS DATA_PACK variable=bflyOutData
				super_sample_container<tp_R,tt_in > temp_super_sample_in;
				temp_super_sample_in=fftReOrderedInput.read();
				L_READ_R_IN_SAMPLES:
				for (int n = 0; n < tp_R; n++)
				{
#pragma HLS UNROLL
					//replcaed//X_of_ns[n] = fftReOrderedInput[n][(no_bflys_per_fft*f + k)];
					//X_of_ns[n] = fftReOrderedInput[n][(f<<ssr_fft_log2<no_bflys_per_fft>::val) + k];
					//X_of_ns[n] = fftReOrderedInput[n][iter];
					X_of_ns[n] =temp_super_sample_in.superSample[n]; //fftReOrderedInput[n][iter];
				}
				Butterfly < tp_R > Butterfly_obj;
				Butterfly_obj.template calcButterFly< tp_L,tp_scaling_mode>
				(X_of_ns, bflyOutData, complexExpTable);
				//*******************************************************************************/
				// For last stage there is no need to multiply with twiddles since they are unity.
				//twiddleFactorMul<tp_L, tp_R>
				//(bflyOutData, complexExpMulOut, twiddleTable, k*(tp_L / current_fft_length));
				//Should be unrolled
				//*******************************************************************************/
				super_sample_container<tp_R,tt_out > temp_super_sample_out;
				L_WRITE_R_BUTTERFLY_OUT_SAMPLES:
				for (int r = 0; r < tp_R; r++)
				{
#pragma HLS UNROLL
					//replaced//fftOutData_local[r][no_bflys_per_fft*f + k]=bflyOutData[r];
					//fftOutData_local[r][(f<<ssr_fft_log2<no_bflys_per_fft>::val) + k]=bflyOutData[r];
					//fftOutData_local[r][iter]=bflyOutData[r];
					temp_super_sample_out.superSample[r]=bflyOutData[r];
				}
				fftOutData_local.write(temp_super_sample_out);
			}//butterflies loop
		}//sub ffts loop
	}

	template <
				int tp_L, //1
				int tp_R, //2
				scaling_mode_enum tp_scaling_mode,
				int stage, //3
				typename tt_complexMulOutType,  //4
				typename tt_complexExpTableType,//5
				typename tt_fftTwiddleType,//6
				typename tt_in,//7
				typename tt_out//8
			 >

	void fft_stage_kernel_full_for_forking_s2s(    // stage kernel is for generalized length FFT , where Length of not power of radix
			tt_complexExpTableType complexExpTable[],
			tt_fftTwiddleType twiddleTable[twiddle_traits_len<tp_L,tp_R>::TWIDDLE_TALBE_LENGTH],
			hls::stream< super_sample_container<tp_R,tt_in > > &fftReOrderedInput,
			hls::stream< super_sample_container<tp_R,tt_out > > &fftOutData_local

						 )
	{
#pragma HLS INLINE region recursive

		const int NO_OF_FFT_STAGES = (ssr_fft_log2<tp_L>::val / ssr_fft_log2<tp_R>::val) +1;
		const unsigned int s = NO_OF_FFT_STAGES - stage;
		const int no_of_ffts_in_stage =  ssr_fft_pow<tp_R,s>::val;//((int)pow(tp_R, (s)));  // tp_L / ((int)pow(tp_R, (s + 1)));
		const int current_fft_length = tp_L /ssr_fft_pow<tp_R,s>::val;//tp_L / (int)pow(tp_R, s); ///(int)pow(tp_R, (s + 1));
		/*
		 * This is special modification done to generalize SSR FFT : The Number of Butterfies per fft combiner in a stage
		 * Go Down by forking_factor
		 */
		const int no_bflys_per_fft = current_fft_length / (tp_R); //(int)pow(tp_R, (s));

		L_FFTs_LOOP:			// fft_length/(radix^(stage+1)) L=64,R=4, S=0 the FFTs=16
		for (int f = 0;f < no_of_ffts_in_stage;f++)
		{

			L_BFLYs_LOOP: // This loop calculates butterflies in a sub FFT that is part of a stage
			for (int k = 0;k < no_bflys_per_fft;k++) // Here bf is actually the k in FFT : frequency index
			{
#pragma HLS PIPELINE II=1 rewind

				tt_in X_of_ns[tp_R];
				tt_complexMulOutType complexExpMulOut[tp_R];
#pragma HLS DATA_PACK variable=complexExpMulOut
				tt_out bflyOutData[tp_R];
#pragma HLS DATA_PACK variable=bflyOutData

				// The following loop should be unrolled for implementation
				super_sample_container<tp_R,tt_in > temp_super_sample_in=fftReOrderedInput.read();
				L_READ_R_IN_SAMPLES:
				for (int n = 0; n < tp_R; n++)
				{
#pragma HLS UNROLL
					//replaced//X_of_ns[n] = fftReOrderedInput[n][(no_bflys_per_fft*f + k)];
					//X_of_ns[n] = fftReOrderedInput[n][(f<<ssr_fft_log2<no_bflys_per_fft>::val) + k];
					X_of_ns[n] =temp_super_sample_in.superSample[n]; // fftReOrderedInput[n][(f<<ssr_fft_log2<no_bflys_per_fft>::val) + k];
				}
				Butterfly< tp_R > Butterfly_obj;
				Butterfly_obj.template calcButterFly< tp_L,tp_scaling_mode>
				(X_of_ns, bflyOutData, complexExpTable);

				twiddleFactorMul_s2s<tp_L, tp_R>
				//replaced//(bflyOutData, complexExpMulOut, twiddleTable, k*(tp_L / current_fft_length));
				(bflyOutData, complexExpMulOut, twiddleTable,  k<<( ssr_fft_log2<tp_L / current_fft_length>::val)  );
				//Should be unrolled
				super_sample_container<tp_R,tt_out > temp_super_sample_out;
				L_WRITE_R_BUTTERFLY_OUT_SAMPLES:
				for (int r = 0; r < tp_R; r++)
				{
#pragma HLS UNROLL
					//replaced//fftOutData_local[r][no_bflys_per_fft*f + k] = complexExpMulOut[r];
					//fftOutData_local[r][(f<<(ssr_fft_log2<no_bflys_per_fft>::val)) + k] = complexExpMulOut[r];
					temp_super_sample_out.superSample[r] = complexExpMulOut[r];
				}
				fftOutData_local.write(temp_super_sample_out);
			}//butterflies loop
		}//sub ffts loop
	}


////////////////////////////////////////////////KERNEL Forking Class////////////////////////////////////START
////////////////////////////////////////////////////////////////////////////////////////////////////////////

/* KernelProcessFork : This class will take a [L/R][R] type stream with R-size sample stream and
* break it down to R/F streams creating F new streams of size R/F. Functionally it will take [L/R][R] 2 dimensional array
* and break it down to F new 2-dimensional arrays of size [L/R][R/F] to be used by F dataflow processes : here the processes
* are FFT Kernel processor
*/

			/// Declaration Only
			template<int tp_forkNumber, int tp_forkingFactor>
			struct KernelProcessFork_s2s
			{

				template <
							int tp_L, //1
							int tp_R, //2
							scaling_mode_enum tp_scaling_mode,
							int stage, //3
							typename tt_complexMulOutType,  //4
							typename tt_complexExpTableType,//5
							//typename tt_fftTwiddleType,//6
							typename tt_in,//7
							typename tt_out//8
						 >
				void fft_stage_kernel_last_stage_fork(
													tt_complexExpTableType complexExpTable[],
													//tt_fftTwiddleType twiddleTable[twiddle_traits_len<tp_L,tp_R>::TWIDDLE_TALBE_LENGTH],
													//tt_in fftReOrderedInput[tp_R][tp_L/tp_R],
													hls::stream< super_sample_container<tp_R,tt_in > > &fftReOrderedInput,

													//tt_out fftOutData_local[tp_R][tp_L/tp_R]
													hls::stream< super_sample_container<tp_R,tt_out > > &fftOutData_local

												 );

			};
			/// Definition
			template<int tp_forkNumber, int tp_forkingFactor>
			template <
								int tp_L, //1
								int tp_R, //2
								scaling_mode_enum tp_scaling_mode,
								int stage, //3
								typename tt_complexMulOutType,  //4
								typename tt_complexExpTableType,//5
								//typename tt_fftTwiddleType,//6
								typename tt_in,//7
								typename tt_out//8
							 >
			void KernelProcessFork_s2s<tp_forkNumber,tp_forkingFactor>::fft_stage_kernel_last_stage_fork
				(
					tt_complexExpTableType complexExpTable[],
					hls::stream< super_sample_container<tp_R,tt_in > > &fftReOrderedInput,
					hls::stream< super_sample_container<tp_R,tt_out > > &fftOutData_local
				 )
			{
#pragma HLS INLINE

				hls::stream< super_sample_container<tp_R/tp_forkingFactor,tt_in > > superSampleStreamArray_in[tp_forkingFactor];
#pragma HLS DATA_PACK variable=superSampleStreamArray_in
#pragma HLS RESOURCE variable=superSampleStreamArray_in core=FIFO_LUTRAM
#pragma HLS ARRAY_PARTITION variable=superSampleStreamArray_in complete dim=1
#pragma HLS STREAM variable=superSampleStreamArray_in depth=8

				hls::stream< super_sample_container<tp_R/tp_forkingFactor,tt_out > > superSampleStreamArray_out[tp_forkingFactor];
#pragma HLS DATA_PACK variable=superSampleStreamArray_out
#pragma HLS RESOURCE variable=superSampleStreamArray_out core=FIFO_LUTRAM
#pragma HLS ARRAY_PARTITION variable=superSampleStreamArray_out complete dim=1
#pragma HLS STREAM variable=superSampleStreamArray_out depth=8

				forkSuperSampleStream<tp_L,tp_R,tp_forkingFactor,tp_forkingFactor,tt_in>(fftReOrderedInput,superSampleStreamArray_in);

				for (int fork_no = 0; fork_no < tp_forkingFactor; fork_no++)
				{
	#pragma HLS UNROLL
					fft_stage_kernel_last_stage_s2s< tp_L/tp_forkingFactor, tp_R/tp_forkingFactor,tp_scaling_mode, 1, tt_complexMulOutType >( complexExpTable,superSampleStreamArray_in[fork_no],superSampleStreamArray_out[fork_no]);
				}

				mergeSuperSampleStream<tp_L,tp_R,tp_forkingFactor,tp_forkingFactor,tt_out> (superSampleStreamArray_out, fftOutData_local);

			}

/*
* ======================================================================================================================
* fft_stage_class : Generates SSR FFT stages: This is a specialized version that is useful for generating FFT stages
* in the case when Length of the FFT, tp_L is an integer power of radix i.e.  tp_L = pow ( radix,m), where m is integer
* ======================================================================================================================
*/

			template <int tp_L, int tp_R,scaling_mode_enum tp_scaling_mode,fft_output_order_enum tp_output_data_order, int stage,typename tt_complexExpTableType,typename tt_fftTwiddleType,typename T_fftIn, typename T_fftOut>
			class fft_stage_class_s2s
			{
			public:
				static void ssr_fft_stage(
											typename exp_table_traits<tt_complexExpTableType>::TTR_expTableType 			complexExpTable	[],
											typename twiddle_traits<tt_fftTwiddleType>::TTR_twiddleType  					twiddleTable	[twiddle_traits_len<tp_L,tp_R>::TWIDDLE_TALBE_LENGTH],
											hls::stream < super_sample_container<tp_R,typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,stage,tt_fftTwiddleType,tt_complexExpTableType,T_fftIn,T_fftOut>::TTR_stageInType> > &p_fftInData,
											T_fftOut p_fftOutData[tp_R][tp_L/tp_R]
										 )
				{
#pragma HLS INLINE   /// Stage Level inline pragma required for proper implementation of SSR FFT
					const int NO_OF_FFT_STAGES = ssr_fft_log2<tp_L>::val / ssr_fft_log2<tp_R>::val;
					const int tp_log2R = ssr_fft_log2<tp_R>::val;
					const unsigned int s = NO_OF_FFT_STAGES - stage;
					const int this_stage_pf = ssr_fft_pow<tp_R,stage-2>::val;
					/****************************  Function call : Dataflow Pipeline Part 1 ****************************************/
					L_FFT_DATAFLOW_PIPELINE_FUNC1:
					hls::stream< super_sample_container< tp_R,typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,stage,tt_fftTwiddleType,tt_complexExpTableType,T_fftIn,T_fftOut>::TTR_stageOutType > > fftOutData_local;
#pragma HLS DATA_PACK variable=fftOutData_local
#pragma HLS RESOURCE variable=fftOutData_local core=FIFO_LUTRAM
#pragma HLS STREAM variable=fftOutData_local depth=8

					hls::stream< super_sample_container< tp_R,typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,stage,tt_fftTwiddleType,tt_complexExpTableType,T_fftIn,T_fftOut>::TTR_stageOutType > > fftOutData_local2;
#pragma HLS DATA_PACK variable=fftOutData_local2
#pragma HLS RESOURCE variable=fftOutData_local2 core=FIFO_LUTRAM
#pragma HLS STREAM variable=fftOutData_local2 depth=8
//#pragma HLS RESOURCE variable=fftOutData_local2 core=FIFO_LUTRAM
					fft_stage_kernel_s2s<
										tp_L,
										tp_R,
										tp_scaling_mode,
										stage,
										typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,stage,tt_fftTwiddleType,tt_complexExpTableType,T_fftIn,T_fftOut>::TTR_stageOutType
									>
								   (complexExpTable,twiddleTable,p_fftInData,fftOutData_local);    //**RW Ifno :: Read and Written in order and declared as stream, p_fftInData declared as stream in top level
					typedef typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,stage,tt_fftTwiddleType,tt_complexExpTableType,T_fftIn,T_fftOut>::TTR_stageOutType nType;
					static const int isLargeMemFlag = (  (this_stage_pf*tp_R > SSR_FFT_URAM_SELECTION_THRESHHOLD ) && SSR_FFT_USE_URAMS ) ;
					DataCommutations_s2streaming<stage,1000+this_stage_pf+this_stage_pf,this_stage_pf,isLargeMemFlag> dcomObj;	//orig:dataCommutations<this_stage_pf,isLargeMemFlag> dcomObj;
					dcomObj.template streamingDataCommutor<
													tp_L,
													tp_R,
													nType
												 >(fftOutData_local, fftOutData_local2);
					// Recursive Call !!
					fft_stage_class_s2s<
										tp_L,tp_R,tp_scaling_mode,tp_output_data_order,stage-1,

										typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,stage,tt_fftTwiddleType,tt_complexExpTableType,T_fftIn,T_fftOut>::TTR_expTabType,

										typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,stage,tt_fftTwiddleType,tt_complexExpTableType,T_fftIn,T_fftOut>::TTR_twiddleType,

										typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,stage,tt_fftTwiddleType,tt_complexExpTableType,T_fftIn,T_fftOut>::TTR_stageOutType,

										T_fftOut
										>
								::ssr_fft_stage(complexExpTable,twiddleTable,fftOutData_local2,p_fftOutData);
				}//end ssr_fft_model function
			};
			template <int tp_L, int tp_R,scaling_mode_enum tp_scaling_mode,  typename tt_complexExpTableType,typename tt_fftTwiddleType,typename T_fftIn, typename T_fftOut>
			class fft_stage_class_s2s< tp_L,  tp_R,tp_scaling_mode,SSR_FFT_DIGIT_REVERSED_TRANSPOSED,1,  tt_complexExpTableType, tt_fftTwiddleType,T_fftIn,  T_fftOut> {
			public:
				static void ssr_fft_stage(
											typename exp_table_traits<tt_complexExpTableType>::TTR_expTableType 	complexExpTable	[],
											typename twiddle_traits<tt_fftTwiddleType>::TTR_twiddleType  			twiddleTable	[twiddle_traits_len<tp_L,tp_R>::TWIDDLE_TALBE_LENGTH],
											hls::stream< super_sample_container< tp_R, typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,1,tt_fftTwiddleType,tt_complexExpTableType,T_fftIn,T_fftOut>::TTR_stageInType > > &p_fftInData,
											T_fftOut p_fftOutData[tp_R][tp_L/tp_R]
										 )
			{
#pragma HLS INLINE   /// Stage Level inline pragma required for proper implementation of SSR FFT
					const int stage =1;
					const int NO_OF_FFT_STAGES = ssr_fft_log2<tp_L>::val / ssr_fft_log2<tp_R>::val;
					const int tp_log2R = ssr_fft_log2<tp_R>::val;
					const unsigned int s = NO_OF_FFT_STAGES - stage;
					/****************************  Function call : Dataflow Pipeline Part 1 ****************************************/
					L_FFT_DATAFLOW_PIPELINE_FUNC1:
					hls::stream< super_sample_container<tp_R,typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,stage,tt_fftTwiddleType,tt_complexExpTableType,T_fftIn,T_fftOut>::TTR_stageOutType> >  fftOutData_local;
#pragma HLS DATA_PACK variable=fftOutData_local
#pragma HLS RESOURCE variable=fftOutData_local core=FIFO_LUTRAM
#pragma HLS STREAM variable=fftOutData_local depth=8
					/*typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,stage,tt_fftTwiddleType,tt_complexExpTableType,T_fftIn,T_fftOut>::TTR_stageOutType  fftOutData_local2[tp_R][tp_L / tp_R];
#pragma HLS DATA_PACK variable=fftOutData_local2
#pragma HLS RESOURCE variable=fftOutData_local2 core=FIFO_LUTRAM
#pragma HLS STREAM variable=fftOutData_local2 depth=8 dim=2
//#pragma HLS RESOURCE variable=fftOutData_local core=FIFO_LUTRAM*/
					fft_stage_kernel_last_stage_s2s<	tp_L,
										tp_R,
										tp_scaling_mode,
										stage,
										typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,stage,tt_complexExpTableType,tt_fftTwiddleType,T_fftIn,T_fftOut>::TTR_stageOutType
									>
									(complexExpTable,p_fftInData,fftOutData_local);
					 convertSuperStreamToArray<stage,50000,tp_L,tp_R,typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,stage,tt_fftTwiddleType,tt_complexExpTableType,T_fftIn,T_fftOut>::TTR_stageOutType>(fftOutData_local,p_fftOutData);
					 /*digitReversedDataReOrder<tp_L,tp_R>(fftOutData_local2,p_fftOutData);// p_fftOutData); //last stage so write to fft output to buffer
					 convertSuperStreamToArray<stage,50000,tp_L,tp_R,typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,stage,tt_fftTwiddleType,tt_complexExpTableType,T_fftIn,T_fftOut>::TTR_stageOutType>(fftOutData_local,fftOutData_local2);
					 digitReversedDataReOrder<tp_L,tp_R>(fftOutData_local2,p_fftOutData);// p_fftOutData); //last stage so write to fft output to buffer
					*/

				}//end ssr_fft_model function
			};

			template <int tp_L, int tp_R,scaling_mode_enum tp_scaling_mode,  typename tt_complexExpTableType,typename tt_fftTwiddleType,typename T_fftIn, typename T_fftOut>
			class fft_stage_class_s2s< tp_L,  tp_R,tp_scaling_mode,SSR_FFT_NATURAL,1,  tt_complexExpTableType, tt_fftTwiddleType,T_fftIn,  T_fftOut> {
			public:
				static void ssr_fft_stage(
											typename exp_table_traits<tt_complexExpTableType>::TTR_expTableType 	complexExpTable	[],
											typename twiddle_traits<tt_fftTwiddleType>::TTR_twiddleType  			twiddleTable	[twiddle_traits_len<tp_L,tp_R>::TWIDDLE_TALBE_LENGTH],
											hls::stream< super_sample_container< tp_R, typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,1,tt_fftTwiddleType,tt_complexExpTableType,T_fftIn,T_fftOut>::TTR_stageInType > > &p_fftInData,
											T_fftOut p_fftOutData[tp_R][tp_L/tp_R]
										 )
			{
#pragma HLS INLINE   /// Stage Level inline pragma required for proper implementation of SSR FFT
					const int stage =1;
					const int NO_OF_FFT_STAGES = ssr_fft_log2<tp_L>::val / ssr_fft_log2<tp_R>::val;
					const int tp_log2R = ssr_fft_log2<tp_R>::val;
					const unsigned int s = NO_OF_FFT_STAGES - stage;
					/****************************  Function call : Dataflow Pipeline Part 1 ****************************************/
					L_FFT_DATAFLOW_PIPELINE_FUNC1:
					hls::stream< super_sample_container<tp_R,typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,stage,tt_fftTwiddleType,tt_complexExpTableType,T_fftIn,T_fftOut>::TTR_stageOutType> >  fftOutData_local;
#pragma HLS DATA_PACK variable=fftOutData_local
#pragma HLS RESOURCE variable=fftOutData_local core=FIFO_LUTRAM
#pragma HLS STREAM variable=fftOutData_local depth=8
					typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,stage,tt_fftTwiddleType,tt_complexExpTableType,T_fftIn,T_fftOut>::TTR_stageOutType  fftOutData_local2[tp_R][tp_L / tp_R];
#pragma HLS DATA_PACK variable=fftOutData_local2
#pragma HLS RESOURCE variable=fftOutData_local2 core=FIFO_LUTRAM
#pragma HLS STREAM variable=fftOutData_local2 depth=8 dim=2
//#pragma HLS RESOURCE variable=fftOutData_local core=FIFO_LUTRAM
					fft_stage_kernel_last_stage_s2s<	tp_L,
										tp_R,
										tp_scaling_mode,
										stage,
										typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,stage,tt_complexExpTableType,tt_fftTwiddleType,T_fftIn,T_fftOut>::TTR_stageOutType
									>
									(complexExpTable,p_fftInData,fftOutData_local);

					 convertSuperStreamToArray<stage,50000,tp_L,tp_R,typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,stage,tt_fftTwiddleType,tt_complexExpTableType,T_fftIn,T_fftOut>::TTR_stageOutType>(fftOutData_local,fftOutData_local2);
					 digitReversedDataReOrder<tp_L,tp_R>(fftOutData_local2,p_fftOutData);// p_fftOutData); //last stage so write to fft output to buffer

				}//end ssr_fft_model function
			};

			/*
			 * ======================================================================================================================
			 * 2nd version of  FFT Stages class used for creating generalized SSR FFT for the cases where FFT Length is
			 * not integer power of Radix, It is a fixed specialization of FFT stages classes which will support forking
			 * and also deal with exception that are needed for supporting structural model for SSR FFT
			 * ======================================================================================================================
			 */
			template <int tp_outputForkingFactor,int tp_L, int tp_R,scaling_mode_enum tp_scaling_mode, fft_output_order_enum tp_output_data_order,int stage,typename tt_complexExpTableType,typename tt_fftTwiddleType,typename T_fftIn, typename T_fftOut>
			class fft_stage_class_forkingOutput_s2s
			{
			public:
				static void ssr_fft_stage(
											typename exp_table_traits<tt_complexExpTableType>::TTR_expTableType 			complexExpTable	[],
											typename exp_table_traits<tt_complexExpTableType>::TTR_expTableType 			complexExpTable_forkingStage	[],
											typename twiddle_traits<tt_fftTwiddleType>::TTR_twiddleType  					twiddleTable	[twiddle_traits_len<tp_L,tp_R>::TWIDDLE_TALBE_LENGTH],
											//typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,stage,tt_fftTwiddleType,tt_complexExpTableType,T_fftIn,T_fftOut>::TTR_stageInType 	p_fftInData	[tp_R][tp_L/tp_R],
											hls::stream< super_sample_container<tp_R,typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,stage,tt_fftTwiddleType,tt_complexExpTableType,T_fftIn,T_fftOut>::TTR_stageInType > > 	&p_fftInData,
											T_fftOut  p_fftOutData	[tp_R][tp_L/tp_R]
											//hls::stream< super_sample_container<tp_R,T_fftOut> >  &p_fftOutData
										 )
				{
#pragma HLS INLINE   /// Stage Level inline pragma required for proper implementation of SSR FFT
					const int NO_OF_FFT_STAGES = ssr_fft_log2<tp_L>::val / ssr_fft_log2<tp_R>::val;
					const int tp_log2R = ssr_fft_log2<tp_R>::val;
					const unsigned int s = NO_OF_FFT_STAGES - stage;
					const int this_stage_pf = (ssr_fft_pow<tp_R,stage-2>::val)/tp_outputForkingFactor;
					L_FFT_DATAFLOW_PIPELINE_FUNC1:
					hls::stream < super_sample_container<tp_R, typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,stage,tt_fftTwiddleType,tt_complexExpTableType,T_fftIn,T_fftOut>::TTR_stageOutType> >  fftOutData_local;
#pragma HLS STREAM variable=fftOutData_local depth=8
#pragma HLS RESOURCE variable=fftOutData_local core=FIFO_LUTRAM
#pragma HLS DATA_PACK variable=fftOutData_local
					fft_stage_kernel_full_for_forking_s2s<    //fft_stage_kernel
										tp_L,
										tp_R,
										tp_scaling_mode,
										stage,
										typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,stage,tt_fftTwiddleType,tt_complexExpTableType,T_fftIn,T_fftOut>::TTR_stageOutType
									>
								   (complexExpTable,twiddleTable,p_fftInData,fftOutData_local);    //**RW Ifno :: Read and Written in order and declared as stream, p_fftInData declared as stream in top level
					/****************************  Function call : Dataflow Pipeline Part 2 ****************************************/
					L_FFT_DATAFLOW_PIPELINE_FUNC2:
					//typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,stage,tt_fftTwiddleType,tt_complexExpTableType,T_fftIn,T_fftOut>::TTR_stageOutType  fftOutData_local2[tp_R][tp_L / tp_R];
					hls::stream < super_sample_container<tp_R,typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,stage,tt_fftTwiddleType,tt_complexExpTableType,T_fftIn,T_fftOut>::TTR_stageOutType> >  fftOutData_local2;
#pragma HLS STREAM variable=fftOutData_local2 depth=8
#pragma HLS RESOURCE variable=fftOutData_local2 core=FIFO_LUTRAM
#pragma HLS DATA_PACK variable=fftOutData_local2
					typedef typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,stage,tt_fftTwiddleType,tt_complexExpTableType,T_fftIn,T_fftOut>::TTR_stageOutType nType;
					static const int isLargeMemFlag = (  (this_stage_pf*tp_R > SSR_FFT_URAM_SELECTION_THRESHHOLD ) && SSR_FFT_USE_URAMS ) ;
					DataCommutations_s2streaming<stage,1000+this_stage_pf,this_stage_pf,isLargeMemFlag> dcomObj;//oirg:dataCommutations<this_stage_pf,isLargeMemFlag> dcomObj;
					dcomObj.template streamingDataCommutor<
													tp_L,
													tp_R,
													nType
														  >(fftOutData_local, fftOutData_local2);
					// Recursive Call !!
					fft_stage_class_forkingOutput_s2s<
										tp_outputForkingFactor,
										tp_L,tp_R,tp_scaling_mode,tp_output_data_order,stage-1,
										tt_complexExpTableType,
										tt_fftTwiddleType,
										typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,stage,tt_fftTwiddleType,tt_complexExpTableType,T_fftIn,T_fftOut>::TTR_stageOutType,
										T_fftOut
										>
								::ssr_fft_stage(complexExpTable,complexExpTable_forkingStage,twiddleTable,fftOutData_local2,p_fftOutData);
				}//end ssr_fft_model function
			};
			/*
			 * ======================================================================================================================
			 * stage==2 Template Specialization of "fft_stage_class_forkingOutput" (This specialization will always create 2nd last stage
			 * in the SSR FFT stages and this stage has special construction, the data commutations blocks is not present in this stage)
			 * the 2nd version of  FFT Stages class used for creating generalized SSR FFT for the cases where FFT Length is not integer
			 * power of Radix, It is a fixed specialization of FFT stages classes which will support forking and also deal with exception
			 *  that are needed for supporting structural model for SSR FFT
			 * ======================================================================================================================
			 */
			template <int tp_outputForkingFactor,int tp_L, int tp_R,scaling_mode_enum tp_scaling_mode,fft_output_order_enum tp_output_data_order,typename tt_complexExpTableType,typename tt_fftTwiddleType,typename T_fftIn, typename T_fftOut>
			class fft_stage_class_forkingOutput_s2s< tp_outputForkingFactor,tp_L,  tp_R,tp_scaling_mode,tp_output_data_order, 2,  tt_complexExpTableType, tt_fftTwiddleType, T_fftIn,  T_fftOut>
			{
			public:
				static void ssr_fft_stage(
											typename exp_table_traits<tt_complexExpTableType>::TTR_expTableType 			complexExpTable	[],
											typename exp_table_traits<tt_complexExpTableType>::TTR_expTableType 			complexExpTable_forkingStage	[],
											typename twiddle_traits<tt_fftTwiddleType>::TTR_twiddleType  					twiddleTable	[twiddle_traits_len<tp_L,tp_R>::TWIDDLE_TALBE_LENGTH],
											hls::stream< super_sample_container<tp_R,typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,2,tt_fftTwiddleType,tt_complexExpTableType,T_fftIn,T_fftOut>::TTR_stageInType> > &p_fftInData,
											T_fftOut  p_fftOutData	[tp_R][tp_L/tp_R]
										 )
				{
#pragma HLS INLINE   /// Stage Level inline pragma required for proper implementation of SSR FFT
					const int NO_OF_FFT_STAGES = ssr_fft_log2<tp_L>::val / ssr_fft_log2<tp_R>::val + 1; // +1 is added for rounding in this case, bcoz log L is not multple of log R
					const int tp_log2R = ssr_fft_log2<tp_R>::val;
					const unsigned int s = NO_OF_FFT_STAGES - 2;
					const int this_stage_pf = (ssr_fft_pow<tp_R,2-2>::val/tp_outputForkingFactor)? (ssr_fft_pow<tp_R,2-2>::val/tp_outputForkingFactor):1 ;

					hls::stream< super_sample_container<tp_R,typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,2,tt_fftTwiddleType,tt_complexExpTableType,T_fftIn,T_fftOut>::TTR_stageOutType> >  fftOutData_local;
#pragma HLS STREAM variable=fftOutData_local depth=8
#pragma HLS DATA_PACK variable=fftOutData_local
#pragma HLS RESOURCE variable=fftOutData_local core=FIFO_LUTRAM

					fft_stage_kernel_full_for_forking_s2s<        /// Replaced for : fft_stage_kernel , because of stage calculation exceptions
										tp_L,
										tp_R,
										tp_scaling_mode,
										2,
										typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,2,tt_fftTwiddleType,tt_complexExpTableType,T_fftIn,T_fftOut>::TTR_stageOutType
									>
								   (complexExpTable,twiddleTable,p_fftInData,fftOutData_local);    //**RW Ifno :: Read and Written in order and declared as stream, p_fftInData declared as stream in top level
					// Array of Streams to be used for forking the output into forkingFactor number of arrays
					hls::stream< super_sample_container<tp_R/tp_outputForkingFactor,typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,2,tt_fftTwiddleType,tt_complexExpTableType,T_fftIn,T_fftOut>::TTR_stageOutType> >  superStreamArray[tp_outputForkingFactor];
#pragma HLS STREAM variable=superStreamArray depth=8
#pragma HLS RESOURCE variable=superStreamArray core=FIFO_LUTRAM
#pragma HLS ARRAY_PARTITION variable=superStreamArray complete dim=1
#pragma HLS DATA_PACK variable=superStreamArray

					hls::stream< super_sample_container<tp_R/tp_outputForkingFactor,typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,2,tt_fftTwiddleType,tt_complexExpTableType,T_fftIn,T_fftOut>::TTR_stageOutType> >  superStreamArray_out[tp_outputForkingFactor];
#pragma HLS STREAM variable=superStreamArray_out depth=8
#pragma HLS RESOURCE variable=superStreamArray_out core=FIFO_LUTRAM
#pragma HLS ARRAY_PARTITION variable=superStreamArray_out complete dim=1
#pragma HLS DATA_PACK variable=superStreamArray_out

					hls::stream< super_sample_container<tp_R,typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,2,tt_fftTwiddleType,tt_complexExpTableType,T_fftIn,T_fftOut>::TTR_stageOutType> >  mergedSuperStream;
#pragma HLS STREAM variable=mergedSuperStream depth=8
#pragma HLS DATA_PACK variable=mergedSuperStream
#pragma HLS RESOURCE variable=mergedSuperStream core=FIFO_LUTRAM
					forkSuperSampleStream<tp_L,tp_R,tp_outputForkingFactor,tp_outputForkingFactor,typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,2,tt_fftTwiddleType,tt_complexExpTableType,T_fftIn,T_fftOut>::TTR_stageOutType >(fftOutData_local,superStreamArray);
					streamingDataCommutorFork_s2s<2,tp_outputForkingFactor,tp_outputForkingFactor> dcom_obj;
					dcom_obj.template forkedCompute<this_stage_pf,tp_L,tp_R,typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,2,tt_fftTwiddleType,tt_complexExpTableType,T_fftIn,T_fftOut>::TTR_stageOutType >(superStreamArray,superStreamArray_out);
					mergeSuperSampleStream_NI<tp_L,tp_R,tp_outputForkingFactor,tp_outputForkingFactor,typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,2,tt_fftTwiddleType,tt_complexExpTableType,T_fftIn,T_fftOut>::TTR_stageOutType>(superStreamArray_out,mergedSuperStream);

					// Recursive Call !!
					fft_stage_class_forkingOutput_s2s<
										tp_outputForkingFactor,
										tp_L,tp_R,tp_scaling_mode,tp_output_data_order,2-1,
										tt_complexExpTableType,
										tt_fftTwiddleType,
										typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,2,tt_fftTwiddleType,tt_complexExpTableType,T_fftIn,T_fftOut>::TTR_stageOutType,
										T_fftOut
										>
								::ssr_fft_stage(complexExpTable,complexExpTable_forkingStage,twiddleTable,mergedSuperStream,p_fftOutData);
				}//end ssr_fft_model function

			};

			/*
			 * ======================================================================================================================
			 * STAGE==1 , fft_output_data_order=SSR_FFT_DIGIT_REVERSED_TRANSPOSED, Template Specialization of "fft_stage_class_forkingOutput" (This specialization will always create last stage
			 * in the SSR FFT stages and this stage has special CONSTRUCTION, two blocks are not present the data commutations and ComplexMul
			 * @@ Also this stage will fork kernel computation blocks.
			 * the 2nd version of  FFT Stages class used for creating generalized SSR FFT for the cases where FFT Length is not integer
			 * power of Radix, It is a fixed specialization of FFT stages classes which will support forking and also deal with exception
			 *  that are needed for supporting structural model for SSR FFT
			 * ======================================================================================================================
			 */
			template <int tp_outputForkingFactor,int tp_L, int tp_R,scaling_mode_enum tp_scaling_mode,  typename tt_complexExpTableType,typename tt_fftTwiddleType,typename T_fftIn, typename T_fftOut>
			class fft_stage_class_forkingOutput_s2s<tp_outputForkingFactor,tp_L,  tp_R,tp_scaling_mode,SSR_FFT_DIGIT_REVERSED_TRANSPOSED, 1,  tt_complexExpTableType, tt_fftTwiddleType,T_fftIn,  T_fftOut>
			{
			public:
				static void ssr_fft_stage(
											typename exp_table_traits<tt_complexExpTableType>::TTR_expTableType 	complexExpTable	[],
											typename exp_table_traits<tt_complexExpTableType>::TTR_expTableType 	complexExpTable_forkingStage	[],
											typename twiddle_traits<tt_fftTwiddleType>::TTR_twiddleType  			twiddleTable	[twiddle_traits_len<tp_L,tp_R>::TWIDDLE_TALBE_LENGTH],
											hls::stream< super_sample_container< tp_R, typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,1,tt_fftTwiddleType,tt_complexExpTableType,T_fftIn,T_fftOut>::TTR_stageInType> > &p_fftInData,
											T_fftOut  p_fftOutData[tp_R][tp_L/tp_R]
										 )
				{
#pragma HLS INLINE   /// Stage Level inline pragma required for proper implementation of SSR FFT
						const int stage =1;
						const int NO_OF_FFT_STAGES = ssr_fft_log2<tp_L>::val / ssr_fft_log2<tp_R>::val;
						const int tp_log2R = ssr_fft_log2<tp_R>::val;
						const unsigned int s = NO_OF_FFT_STAGES - stage;

						hls::stream< super_sample_container < tp_R,typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,stage,tt_fftTwiddleType,tt_complexExpTableType,T_fftIn,T_fftOut>::TTR_stageOutType > > fftOutData_local;
#pragma HLS STREAM variable=fftOutData_local depth=8
#pragma HLS DATA_PACK variable=fftOutData_local
#pragma HLS RESOURCE variable=fftOutData_local core=FIFO_LUTRAM

					/*
						 * ==================================================================================================================
						 * Last kernel stage that will create fork of PARFFT or kernel computation block without data commutors and complexMul
						 * ==================================================================================================================
						 */


						//if(tp_output_data_order==SSR_FFT_DIGIT_REVERSED_TRANSPOSED)
						//{
							KernelProcessFork_s2s<tp_outputForkingFactor,tp_outputForkingFactor> KernelProcessFork_obj;

							KernelProcessFork_obj.template fft_stage_kernel_last_stage_fork<
																							tp_L,
																							tp_R,
																							tp_scaling_mode,
																							stage,
																							typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,stage,tt_complexExpTableType,tt_fftTwiddleType,T_fftIn,T_fftOut>::TTR_stageOutType>
																							(complexExpTable_forkingStage,p_fftInData,fftOutData_local);
							 //convertSuperStreamToArray<stage,59999,tp_L,tp_R,typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,stage,tt_fftTwiddleType,tt_complexExpTableType,T_fftIn,T_fftOut>::TTR_stageOutType>(fftOutData_local,p_fftOutData);
							 convertSuperStreamToArray<stage,59999,tp_L,tp_R>(fftOutData_local,p_fftOutData);

							//OutputDataReOrder< (tp_L)/(tp_R*tp_R)> OutputDataReOrder_obj;
							//OutputDataReOrder_obj.template digitReversal2Phase < tp_L,  tp_R>(fftOutData_local, p_fftOutData);
						/*}
						/else
						{
							KernelProcessFork_s2s<tp_outputForkingFactor,tp_outputForkingFactor> KernelProcessFork_obj;


							KernelProcessFork_obj.template fft_stage_kernel_last_stage_fork<
																							tp_L,
																							tp_R,
																							tp_scaling_mode,
																							stage,
																							typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,stage,tt_complexExpTableType,tt_fftTwiddleType,T_fftIn,T_fftOut>::TTR_stageOutType>
																							(complexExpTable_forkingStage,p_fftInData,fftOutData_local);
							OutputDataReOrder< (tp_L)/(tp_R*tp_R)> OutputDataReOrder_obj;
							OutputDataReOrder_obj.template digitReversal2Phase < tp_L,  tp_R>(fftOutData_local, p_fftOutData);
						}*/
				}//end ssr_fft_model function
			};



			/*
			 * ======================================================================================================================
			 * STAGE==1 Template Specialization, fft_output_data_order=SSR_FFT_NATURAL
			 *  of "fft_stage_class_forkingOutput" (This specialization will always create last stage
			 * in the SSR FFT stages and this stage has special CONSTRUCTION, two blocks are not present the data commutations and ComplexMul
			 * @@ Also this stage will fork kernel computation blocks.
			 * the 2nd version of  FFT Stages class used for creating generalized SSR FFT for the cases where FFT Length is not integer
			 * power of Radix, It is a fixed specialization of FFT stages classes which will support forking and also deal with exception
			 *  that are needed for supporting structural model for SSR FFT
			 * ======================================================================================================================
			 */
			template <int tp_outputForkingFactor,int tp_L, int tp_R,scaling_mode_enum tp_scaling_mode ,  typename tt_complexExpTableType,typename tt_fftTwiddleType,typename T_fftIn, typename T_fftOut>
			class fft_stage_class_forkingOutput_s2s<tp_outputForkingFactor,tp_L,  tp_R,tp_scaling_mode,SSR_FFT_NATURAL, 1,  tt_complexExpTableType, tt_fftTwiddleType,T_fftIn,  T_fftOut>
			{
			public:
				static void ssr_fft_stage(
											typename exp_table_traits<tt_complexExpTableType>::TTR_expTableType 	complexExpTable	[],
											typename exp_table_traits<tt_complexExpTableType>::TTR_expTableType 	complexExpTable_forkingStage	[],
											typename twiddle_traits<tt_fftTwiddleType>::TTR_twiddleType  			twiddleTable	[twiddle_traits_len<tp_L,tp_R>::TWIDDLE_TALBE_LENGTH],
											hls::stream< super_sample_container< tp_R, typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,1,tt_fftTwiddleType,tt_complexExpTableType,T_fftIn,T_fftOut>::TTR_stageInType> > &p_fftInData,
											T_fftOut  p_fftOutData[tp_R][tp_L/tp_R]
										 )
				{
#pragma HLS INLINE   /// Stage Level inline pragma required for proper implementation of SSR FFT
						const int stage =1;
						const int NO_OF_FFT_STAGES = ssr_fft_log2<tp_L>::val / ssr_fft_log2<tp_R>::val;
						const int tp_log2R = ssr_fft_log2<tp_R>::val;
						const unsigned int s = NO_OF_FFT_STAGES - stage;

						hls::stream< super_sample_container < tp_R,typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,stage,tt_fftTwiddleType,tt_complexExpTableType,T_fftIn,T_fftOut>::TTR_stageOutType > > fftOutData_local;
#pragma HLS STREAM variable=fftOutData_local depth=8
#pragma HLS DATA_PACK variable=fftOutData_local
#pragma HLS RESOURCE variable=fftOutData_local core=FIFO_LUTRAM

					/*
						 * ==================================================================================================================
						 * Last kernel stage that will create fork of PARFFT or kernel computation block without data commutors and complexMul
						 * ==================================================================================================================
						 */


						/*if(tp_output_data_order==SSR_FFT_DIGIT_REVERSED_TRANSPOSED)
						{
							KernelProcessFork_s2s<tp_outputForkingFactor,tp_outputForkingFactor> KernelProcessFork_obj;

							KernelProcessFork_obj.template fft_stage_kernel_last_stage_fork<
																							tp_L,
																							tp_R,
																							tp_scaling_mode,
																							stage,
																							typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,stage,tt_complexExpTableType,tt_fftTwiddleType,T_fftIn,T_fftOut>::TTR_stageOutType>
																							(complexExpTable_forkingStage,p_fftInData,p_fftOutData);
							//OutputDataReOrder< (tp_L)/(tp_R*tp_R)> OutputDataReOrder_obj;
							//OutputDataReOrder_obj.template digitReversal2Phase < tp_L,  tp_R>(fftOutData_local, p_fftOutData);
						}
						else
						{*/
							KernelProcessFork_s2s<tp_outputForkingFactor,tp_outputForkingFactor> KernelProcessFork_obj;


							KernelProcessFork_obj.template fft_stage_kernel_last_stage_fork<
																							tp_L,
																							tp_R,
																							tp_scaling_mode,
																							stage,
																							typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,stage,tt_complexExpTableType,tt_fftTwiddleType,T_fftIn,T_fftOut>::TTR_stageOutType>
																							(complexExpTable_forkingStage,p_fftInData,fftOutData_local);
							OutputDataReOrder< (tp_L)/(tp_R*tp_R)> OutputDataReOrder_obj;
							OutputDataReOrder_obj.template digitReversal2Phase < tp_L,  tp_R>(fftOutData_local, p_fftOutData);

				}//end ssr_fft_model function
			};



			template <int tp_L, int tp_R,typename tt_T_in,typename tt_T_out>
			void castArray(tt_T_in inData[tp_R][tp_L/tp_R],tt_T_out outData[tp_R][tp_L/tp_R])
			{
#pragma HLS INLINE off
				for (int t = 0; t < tp_L/tp_R; t++)
				{
#pragma HLS PIPELINE II=1 rewind
					for (int r = 0; r < tp_R; r++)
					{
						outData[r][t] =  inData[r][t];
					}
				}
			}

		template <
					int tp_L, //1
					int tp_R, //2
					scaling_mode_enum tp_scaling_mode,
					int stage, //3
					typename tt_complexMulOutType,  //4
					typename tt_complexExpTableType,//5
					typename tt_in,//7
					typename tt_out//8
				 >
		void fft_stage_kernel_last_stage_old(
											tt_complexExpTableType complexExpTable[],
											tt_in fftReOrderedInput[tp_R][tp_L/tp_R],
											tt_out fftOutData_local[tp_R][tp_L/tp_R]
										 )
			{
#pragma HLS INLINE region recursive
				const int NO_OF_FFT_STAGES = ssr_fft_log2<tp_L>::val / ssr_fft_log2<tp_R>::val;
				const unsigned int s = NO_OF_FFT_STAGES - stage;
				const int no_of_ffts_in_stage =  ssr_fft_pow<tp_R,s>::val;//((int)pow(tp_R, (s)));  // tp_L / ((int)pow(tp_R, (s + 1)));
				const int current_fft_length = tp_L /ssr_fft_pow<tp_R,s>::val;//tp_L / (int)pow(tp_R, s); ///(int)pow(tp_R, (s + 1));
				const int no_bflys_per_fft = current_fft_length / tp_R; //(int)pow(tp_R, (s));
				L_FFTs_LOOP:			// fft_length/(radix^(stage+1)) L=64,R=4, S=0 the FFTs=16
				for (int f = 0;f < no_of_ffts_in_stage;f++)
				{
#pragma HLS PIPELINE II=1 rewind    // This rewind created apparent deadlock that are not detected.
					L_BFLYs_LOOP: // This loop calculates butterflies in a sub FFT that is part of a stage
					for (int k = 0;k < no_bflys_per_fft;k++) // Here bf is actually the k in FFT : frequency index
					{
#pragma HLS LOOP_FLATTEN
						tt_in X_of_ns[tp_R];
#pragma HLS DATA_PACK variable=X_of_ns
						tt_out bflyOutData[tp_R];
#pragma HLS DATA_PACK variable=bflyOutData
						L_READ_R_IN_SAMPLES:
						for (int n = 0; n < tp_R; n++)
						{
#pragma HLS UNROLL
							//replcaed//X_of_ns[n] = fftReOrderedInput[n][(no_bflys_per_fft*f + k)];
							X_of_ns[n] = fftReOrderedInput[n][(f<<ssr_fft_log2<no_bflys_per_fft>::val) + k];
						}
						Butterfly < tp_R > Butterfly_obj;
						Butterfly_obj.template calcButterFly< tp_L,tp_scaling_mode>
						(X_of_ns, bflyOutData, complexExpTable);
						//*******************************************************************************/
						// For last stage there is no need to multiply with twiddles since they are unity.
						//twiddleFactorMul<tp_L, tp_R>
						//(bflyOutData, complexExpMulOut, twiddleTable, k*(tp_L / current_fft_length));
						//*******************************************************************************/
						L_WRITE_R_BUTTERFLY_OUT_SAMPLES:
						for (int r = 0; r < tp_R; r++)
						{
							#pragma HLS UNROLL
							//replaced//fftOutData_local[r][no_bflys_per_fft*f + k]=bflyOutData[r];
							fftOutData_local[r][(f<<ssr_fft_log2<no_bflys_per_fft>::val) + k]=bflyOutData[r];
						}
					}//butterflies loop
				}//sub ffts loop
		}


		template  <int t_isForkedFFT, int t_isTiny>
		struct ssr_fft_wrapper // Declaration only
		{
			template < int tp_L,int tp_R,
						   scaling_mode_enum tp_scaling_mode,
						   fft_output_order_enum tp_output_data_order,
						   typename tt_complexExpTableType,
						   typename tt_fftTwiddleType,
						   typename tt_in,
						   typename tt_out
						  >
			static void inner_fft( tt_in p_fftInData[tp_R][tp_L/tp_R],  tt_out p_fftOutData[tp_R][tp_L/tp_R]);
		};

		/*
		 * ===========================================================================================================================================
		 * // The Specialization when the FFT is not forked, tiny does not matter so this specialization is used in all the cases
		 * ===========================================================================================================================================
		 */
		template <>
		struct ssr_fft_wrapper<0,0>     // The Specialization when the FFT is not forked, tiny does not matter so this specialization is used in all the cases
		{

			template < int tp_L,int tp_R,
					   scaling_mode_enum tp_scaling_mode,
					   fft_output_order_enum tp_output_data_order,
					   typename tt_complexExpTableType,
					   typename tt_fftTwiddleType,
					   typename tt_in,
					   typename tt_out
					  >
			static void inner_fft( tt_in p_fftInData[tp_R][tp_L/tp_R],  tt_out p_fftOutData[tp_R][tp_L/tp_R])
			{


#pragma HLS INLINE
#ifndef SSR_FFT_SEPERATE_REAL_IMAG_PARTS

#pragma HLS DATA_PACK variable=p_fftInData
#pragma HLS DATA_PACK variable=p_fftOutData

#endif

#ifdef SSR_FFT_PARTITION_IO_ARRAYS //SSR_FFT_PARTITION_INTERFACE_ARRAYS

#pragma HLS ARRAY_PARTITION variable=p_fftInData complete dim=1
#pragma HLS ARRAY_PARTITION variable=p_fftOutData complete dim=1

#else

#pragma HLS ARRAY_RESHAPE variable=p_fftInData complete dim=1
#pragma HLS ARRAY_RESHAPE variable=p_fftOutData complete dim=1

#endif	

#pragma HLS STREAM variable=p_fftInData depth=8 dim=2
#pragma HLS STREAM variable=p_fftOutData depth=8 dim=2
#pragma HLS RESOURCE variable=p_fftInData core=FIFO_LUTRAM
#pragma HLS RESOURCE variable=p_fftOutData core=FIFO_LUTRAM




		#ifndef __SYNTHESIS__
				assert((tp_R)==(ssr_fft_pow< 2, ssr_fft_log2<tp_R>::val >::val)); // radix should be power of 2 always
				assert((tp_L)==(ssr_fft_pow< 2, ssr_fft_log2<tp_L>::val >::val)); // Length of FFT should be power of 2 always
		#endif
				tt_fftTwiddleType twiddleTable[twiddle_traits_len< tp_L,tp_R> ::TWIDDLE_TALBE_LENGTH];
				tt_complexExpTableType complexExpTable[exp_traits_len<0,tp_L,tp_R>::EXP_TALBE_LENGTH];
				twiddle_table<tp_L,tp_R,tt_fftTwiddleType>::initTwiddleFactors(twiddleTable);
//#pragma HLS DATA_PACK variable=twiddleTable
//#pragma HLS DATA_PACK variable=complexExpTable
#pragma HLS ARRAY_PARTITION variable=complexExpTable complete dim=1
				complex_exp_table<tp_R,typename exp_table_traits<tt_complexExpTableType>::TTR_expTableType>::initComplexExp(complexExpTable);
				const int NO_OF_FFT_STAGES = ssr_fft_log2<tp_L>::val / ssr_fft_log2<tp_R>::val;
				typedef typename ssr_fft_input_traits<tt_in>::TTR_casted_type casted_type;
				hls::stream< super_sample_container < tp_R,casted_type> > p_fftInData_reOrdered;
#pragma HLS DATA_PACK variable=p_fftInData_reOrdered
#pragma HLS STREAM variable=p_fftInData_reOrdered depth=8 dim=2
#pragma HLS RESOURCE variable=p_fftInData_reOrdered core=FIFO_LUTRAM
				hls::stream< super_sample_container<tp_R,casted_type> > casted_output;
#pragma HLS DATA_PACK variable=casted_output
#pragma HLS STREAM variable=casted_output depth=8 dim=2
#pragma HLS RESOURCE variable=casted_output core=FIFO_LUTRAM

				castArray_s2streaming<tp_L,tp_R,tt_in,casted_type>(p_fftInData, casted_output);
				inputSwapStreaming_s2s<NO_OF_FFT_STAGES-1,1> swapObj;
				swapObj.template swap<tp_L,tp_R,1>(casted_output, p_fftInData_reOrdered);
				fft_stage_class_s2s<
								tp_L,tp_R,tp_scaling_mode,tp_output_data_order,NO_OF_FFT_STAGES,
								typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,NO_OF_FFT_STAGES,tt_fftTwiddleType,tt_complexExpTableType,casted_type,tt_out>::TTR_expTabType,
								typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,NO_OF_FFT_STAGES,tt_fftTwiddleType,tt_complexExpTableType,casted_type,tt_out>::TTR_twiddleType,
								typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,NO_OF_FFT_STAGES,tt_fftTwiddleType,tt_complexExpTableType,casted_type,tt_out>::TTR_stageInType,
								typename ssr_fft_output_traits <tp_L,tp_R,tp_scaling_mode,casted_type>::TTR_fftOutType
								>
				::ssr_fft_stage(complexExpTable,twiddleTable,p_fftInData_reOrdered,p_fftOutData);
			}
		};

		template <>
		struct ssr_fft_wrapper<0,1>     // The Specialization when the FFT is not forked, tiny does not matter so this specialization is used in all the cases
		{
			template < int tp_L,int tp_R,
					   scaling_mode_enum tp_scaling_mode,
					   fft_output_order_enum tp_output_data_order,
					   typename tt_complexExpTableType,
					   typename tt_fftTwiddleType,
					   typename tt_in,
					   typename tt_out
					  >
			static void inner_fft( tt_in p_fftInData[tp_R][tp_L/tp_R],  tt_out p_fftOutData[tp_R][tp_L/tp_R])
			{

#pragma HLS INLINE
#ifndef SSR_FFT_SEPERATE_REAL_IMAG_PARTS

#pragma HLS DATA_PACK variable=p_fftInData
#pragma HLS DATA_PACK variable=p_fftOutData

#endif

#ifdef SSR_FFT_PARTITION_IO_ARRAYS//SSR_FFT_PARTITION_INTERFACE_ARRAYS

#pragma HLS ARRAY_PARTITION variable=p_fftInData complete dim=1
#pragma HLS ARRAY_PARTITION variable=p_fftOutData complete dim=1

#else

#pragma HLS ARRAY_RESHAPE variable=p_fftInData complete dim=1
#pragma HLS ARRAY_RESHAPE variable=p_fftOutData complete dim=1

#endif

#pragma HLS STREAM variable=p_fftInData depth=8 dim=2
#pragma HLS STREAM variable=p_fftOutData depth=8 dim=2
#pragma HLS RESOURCE variable=p_fftInData core=FIFO_LUTRAM
#pragma HLS RESOURCE variable=p_fftOutData core=FIFO_LUTRAM


		#ifndef __SYNTHESIS__
				assert((tp_R)==(ssr_fft_pow< 2, ssr_fft_log2<tp_R>::val >::val)); // radix should be power of 2 always
				assert((tp_L)==(ssr_fft_pow< 2, ssr_fft_log2<tp_L>::val >::val)); // Length of FFt should be power of 2 always
		#endif

				tt_fftTwiddleType twiddleTable[twiddle_traits_len< tp_L,tp_R> ::TWIDDLE_TALBE_LENGTH];
				tt_complexExpTableType complexExpTable[exp_traits_len<0,tp_L,tp_R>::EXP_TALBE_LENGTH];

				twiddle_table<tp_L,tp_R,tt_fftTwiddleType>::initTwiddleFactors(twiddleTable);
#pragma HLS ARRAY_PARTITION variable=complexExpTable complete dim=1
				complex_exp_table<tp_R,typename exp_table_traits<tt_complexExpTableType>::TTR_expTableType>::initComplexExp(complexExpTable);
				const int NO_OF_FFT_STAGES = ssr_fft_log2<tp_L>::val / ssr_fft_log2<tp_R>::val;
				typedef typename ssr_fft_input_traits<tt_in>::TTR_casted_type casted_type;
				hls::stream< super_sample_container<tp_R,casted_type> > p_fftInData_reOrdered;
#pragma HLS DATA_PACK variable=p_fftInData_reOrdered
#pragma HLS STREAM variable=p_fftInData_reOrdered depth=8 dim=2
#pragma HLS RESOURCE variable=p_fftInData_reOrdered core=FIFO_LUTRAM
/*#ifdef SSR_FFT_PARTITION_INTERFACE_ARRAYS
#pragma HLS ARRAY_PARTITION variable=p_fftInData_reOrdered complete dim=1
#else
#pragma HLS ARRAY_RESHAPE variable=p_fftInData_reOrdered complete dim=1
#endif*/


				hls::stream< super_sample_container<tp_R,casted_type> > casted_output;
#pragma HLS DATA_PACK variable=casted_output
#pragma HLS STREAM variable=casted_output depth=8 dim=2
#pragma HLS RESOURCE variable=casted_output core=FIFO_LUTRAM
/*#pragma HLS ARRAY_PARTITION variable=casted_output complete dim=1
#ifdef SSR_FFT_PARTITION_INTERFACE_ARRAYS
	#pragma HLS ARRAY_PARTITION variable=casted_output complete dim=1
#else
	#pragma HLS ARRAY_RESHAPE variable=casted_output complete dim=1
#endif*/
			castArray_s2streaming<tp_L,tp_R,tt_in,casted_type>(p_fftInData, casted_output);
			inputSwapStreaming_s2s<NO_OF_FFT_STAGES-1,1> swapObj;
			swapObj.template swap<tp_L,tp_R,1>(casted_output,p_fftInData_reOrdered);
			fft_stage_class_s2s<
							tp_L,tp_R,tp_scaling_mode,tp_output_data_order,NO_OF_FFT_STAGES,
							typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,NO_OF_FFT_STAGES,tt_fftTwiddleType,tt_complexExpTableType,casted_type,tt_out>::TTR_expTabType,
							typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,NO_OF_FFT_STAGES,tt_fftTwiddleType,tt_complexExpTableType,casted_type,tt_out>::TTR_twiddleType,
							typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,NO_OF_FFT_STAGES,tt_fftTwiddleType,tt_complexExpTableType,casted_type,tt_out>::TTR_stageInType,
							typename ssr_fft_output_traits <tp_L,tp_R,tp_scaling_mode,casted_type>::TTR_fftOutType
							>
			::ssr_fft_stage(complexExpTable,twiddleTable,p_fftInData_reOrdered,p_fftOutData);
			}
		};
		// The Specialization when the FFT is Forked and Also Tiny needs special Handling for for input arrays,
		//the reshaping cannot be used for input arrays instead partitioning is required
		// t_isForkedFFT > 0 means it is generalized forked SSR FFT ,this implementation specifically deals with the case when tp_L not power of tp_R
		template <>
		struct ssr_fft_wrapper<1,0>
		{
			template < int tp_L,int tp_R,
					   scaling_mode_enum tp_scaling_mode,
					   fft_output_order_enum tp_output_data_order,
					   typename tt_complexExpTableType,
					   typename tt_fftTwiddleType,
					   typename tt_in,
					   typename tt_out
					  >
			static void inner_fft( tt_in p_fftInData[tp_R][tp_L/tp_R],  tt_out p_fftOutData[tp_R][tp_L/tp_R])
			{
#pragma HLS INLINE

#ifndef SSR_FFT_SEPERATE_REAL_IMAG_PARTS

#pragma HLS DATA_PACK variable=p_fftInData
#pragma HLS DATA_PACK variable=p_fftOutData

#endif

#pragma HLS STREAM variable=p_fftInData depth=8  dim=2
#pragma HLS STREAM variable=p_fftOutData depth=8 dim=2
#pragma HLS RESOURCE variable=p_fftInData core=FIFO_LUTRAM
#pragma HLS RESOURCE variable=p_fftOutData core=FIFO_LUTRAM

#ifdef SSR_FFT_PARTITION_IO_ARRAYS//SSR_FFT_PARTITION_INTERFACE_ARRAYS
        #pragma HLS ARRAY_PARTITION variable=p_fftInData complete dim=1
        #pragma HLS ARRAY_PARTITION variable=p_fftOutData complete dim=1
#else
		#pragma HLS ARRAY_RESHAPE variable=p_fftInData complete dim=1
		#pragma HLS ARRAY_RESHAPE variable=p_fftOutData complete dim=1
#endif
				const int tp_outputForkingFactor = ssr_fft_pow< tp_R ,   ((ssr_fft_log2<tp_L>::val)/(ssr_fft_log2<tp_R>::val) + 1)     >::val   /    (tp_L) ;
				tt_fftTwiddleType twiddleTable[twiddle_traits_len< tp_L,tp_R> ::TWIDDLE_TALBE_LENGTH];
				tt_complexExpTableType complexExpTable[exp_traits_len<tp_outputForkingFactor,tp_L,tp_R>::EXP_TALBE_LENGTH];
#pragma HLS ARRAY_PARTITION variable=complexExpTable complete dim=1
				tt_complexExpTableType complexExpTable_forkingStage[tp_R];
#pragma HLS ARRAY_PARTITION variable=complexExpTable_forkingStage complete dim=1
				twiddle_table<tp_L,tp_R,tt_fftTwiddleType>::initTwiddleFactors(twiddleTable);
				complex_exp_table<exp_traits_len<tp_outputForkingFactor,tp_L,tp_R>::EXP_TALBE_LENGTH,typename exp_table_traits<tt_complexExpTableType>::TTR_expTableType>::initComplexExp(complexExpTable);
				complex_exp_table_last_stage<tp_R,exp_traits_len<tp_outputForkingFactor,tp_L,tp_R>::EXP_TALBE_LENGTH_LAST_STAGE,typename exp_table_traits<tt_complexExpTableType>::TTR_expTableType>::initComplexExp(complexExpTable_forkingStage);
				const int NO_OF_FFT_STAGES = (ssr_fft_log2<tp_L>::val / ssr_fft_log2<tp_R>::val) + 1;
				typedef typename ssr_fft_input_traits<tt_in>::TTR_casted_type casted_type;
				//casted_type p_fftInData_reOrdered[tp_R][tp_L/tp_R];
				hls::stream< super_sample_container< tp_R,casted_type> > p_fftInData_reOrdered;
#pragma HLS STREAM variable=p_fftInData_reOrdered depth=8 dim=2
#pragma HLS DATA_PACK variable=p_fftInData_reOrdered
#pragma HLS RESOURCE variable=p_fftInData_reOrdered core=FIFO_LUTRAM
//#pragma HLS ARRAY_PARTITION variable=p_fftInData_reOrdered complete dim=1
				hls::stream<super_sample_container<tp_R,casted_type> > casted_output;
#pragma HLS DATA_PACK variable=casted_output
#pragma HLS STREAM variable=casted_output depth=8 dim=2
#pragma HLS RESOURCE variable=casted_output core=FIFO_LUTRAM
/*#ifdef SSR_FFT_PARTITION_INTERFACE_ARRAYS
	#pragma HLS ARRAY_PARTITION variable=casted_output complete dim=1
#else
	#pragma HLS ARRAY_RESHAPE variable=casted_output complete dim=1
#endif*/
				castArray_s2streaming<tp_L,tp_R,tt_in,casted_type>(p_fftInData, casted_output);
				inputSwapStreaming_s2s<NO_OF_FFT_STAGES-1,tp_outputForkingFactor> swapObj;

				swapObj.template swap<tp_L,tp_R,1>(casted_output, p_fftInData_reOrdered);

				fft_stage_class_forkingOutput_s2s<
								tp_outputForkingFactor,tp_L,tp_R, tp_scaling_mode,tp_output_data_order, NO_OF_FFT_STAGES,
								typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,NO_OF_FFT_STAGES,tt_fftTwiddleType,tt_complexExpTableType,casted_type,tt_out>::TTR_expTabType,
								typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,NO_OF_FFT_STAGES,tt_fftTwiddleType,tt_complexExpTableType,casted_type,tt_out>::TTR_twiddleType,
								typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,NO_OF_FFT_STAGES,tt_fftTwiddleType,tt_complexExpTableType,casted_type,tt_out>::TTR_stageInType,
								typename ssr_fft_output_traits <tp_L,tp_R,tp_scaling_mode,casted_type>::TTR_fftOutType
								>
				::ssr_fft_stage(complexExpTable,complexExpTable_forkingStage,twiddleTable,p_fftInData_reOrdered,p_fftOutData);
			}
		};



		template <>
		struct ssr_fft_wrapper<1,1>
		{
			template < int tp_L,int tp_R,
					   scaling_mode_enum tp_scaling_mode,
					   fft_output_order_enum tp_output_data_order,
					   typename tt_complexExpTableType,
					   typename tt_fftTwiddleType,
					   typename tt_in,
					   typename tt_out
					  >
			static void inner_fft( tt_in p_fftInData[tp_R][tp_L/tp_R],  tt_out p_fftOutData[tp_R][tp_L/tp_R])
			{
#pragma HLS INLINE
#ifndef SSR_FFT_SEPERATE_REAL_IMAG_PARTS
//////////////////////////////////////////////
#pragma HLS DATA_PACK variable=p_fftInData
#pragma HLS DATA_PACK variable=p_fftOutData
/////////////////////////////////////////////
#endif

#ifdef SSR_FFT_PARTITION_IO_ARRAYS //SSR_FFT_PARTITION_INTERFACE_ARRAYS
////////////////////////////////////////////////////////////////
#pragma HLS ARRAY_PARTITION variable=p_fftInData complete dim=1
#pragma HLS ARRAY_PARTITION variable=p_fftOutData complete dim=1
////////////////////////////////////////////////////////////////
#else
////////////////////////////////////////////////////////////////
#pragma HLS ARRAY_RESHAPE variable=p_fftInData complete dim=1
#pragma HLS ARRAY_RESHAPE variable=p_fftOutData complete dim=1
////////////////////////////////////////////////////////////////
#endif
#pragma HLS STREAM variable=p_fftInData depth=8 dim=2
#pragma HLS STREAM variable=p_fftOutData depth=8 dim=2
#pragma HLS RESOURCE variable=p_fftInData core=FIFO_LUTRAM
#pragma HLS RESOURCE variable=p_fftOutData core=FIFO_LUTRAM

				const int tp_outputForkingFactor = ssr_fft_pow< tp_R ,   ((ssr_fft_log2<tp_L>::val)/(ssr_fft_log2<tp_R>::val) + 1)     >::val   /    (tp_L) ;
				tt_fftTwiddleType twiddleTable[twiddle_traits_len< tp_L,tp_R> ::TWIDDLE_TALBE_LENGTH];
				tt_complexExpTableType complexExpTable[exp_traits_len<tp_outputForkingFactor,tp_L,tp_R>::EXP_TALBE_LENGTH];
#pragma HLS ARRAY_PARTITION variable=complexExpTable complete dim=1
																																// synthesis failure...
				tt_complexExpTableType complexExpTable_forkingStage[tp_R];
		#pragma HLS DATA_PACK variable=complexExpTable_forkingStage
		#pragma HLS ARRAY_PARTITION variable=complexExpTable_forkingStage complete dim=1

				twiddle_table<tp_L,tp_R,tt_fftTwiddleType>::initTwiddleFactors(twiddleTable);
				complex_exp_table<exp_traits_len<tp_outputForkingFactor,tp_L,tp_R>::EXP_TALBE_LENGTH,typename exp_table_traits<tt_complexExpTableType>::TTR_expTableType>::initComplexExp(complexExpTable);
				complex_exp_table_last_stage<tp_R,exp_traits_len<tp_outputForkingFactor,tp_L,tp_R>::EXP_TALBE_LENGTH_LAST_STAGE,typename exp_table_traits<tt_complexExpTableType>::TTR_expTableType>::initComplexExp(complexExpTable_forkingStage);
				const int NO_OF_FFT_STAGES = (ssr_fft_log2<tp_L>::val / ssr_fft_log2<tp_R>::val) + 1;

				typedef typename ssr_fft_input_traits<tt_in>::TTR_casted_type casted_type;

				hls::stream<super_sample_container<tp_R,casted_type> > p_fftInData_reOrdered;
#pragma HLS STREAM variable=p_fftInData_reOrdered depth=8 dim=2
#pragma HLS DATA_PACK variable=p_fftInData_reOrdered
#pragma HLS RESOURCE variable=p_fftInData_reOrdered core=FIFO_LUTRAM
//#pragma HLS ARRAY_PARTITION variable=p_fftInData_reOrdered complete dim=1

				//casted_type casted_output[tp_R][tp_L/tp_R];
				hls::stream<super_sample_container<tp_R,casted_type> > casted_output;
#pragma HLS DATA_PACK variable=casted_output
#pragma HLS STREAM variable=casted_output depth=8 dim=2
#pragma HLS RESOURCE variable=casted_output core=FIFO_LUTRAM



/* The casted output cannot be reshaped in this case because it is the TINY case where the
* casted output will be directly consumed by multiple data commuter processes and when it
* re-shaped it will produced data-flow error of "multiple functions have read accesses to the streamed variable"
*/


//#pragma HLS ARRAY_PARTITION variable=casted_output complete dim=1
//#ifdef SSR_FFT_PARTITION_INTERFACE_ARRAYS
//===================================================================================================
				//#pragma HLS ARRAY_PARTITION variable=casted_output complete dim=1
//===================================================================================================

//#else
//	#pragma HLS ARRAY_RESHAPE variable=casted_output complete dim=1
//#endif
				castArray_s2streaming<tp_L,tp_R,tt_in,casted_type>(p_fftInData, casted_output);


				inputSwapStreaming_s2s<NO_OF_FFT_STAGES-1,tp_outputForkingFactor> swapObj;

				swapObj.template swap<tp_L,tp_R,1>(casted_output, p_fftInData_reOrdered);
				//printComplexNumArray<double, tp_L / tp_R, tp_R>(p_fftInData_reOrdered);


				fft_stage_class_forkingOutput_s2s<
								tp_outputForkingFactor,tp_L,tp_R, tp_scaling_mode,tp_output_data_order, NO_OF_FFT_STAGES,
								typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,NO_OF_FFT_STAGES,tt_fftTwiddleType,tt_complexExpTableType,casted_type,tt_out>::TTR_expTabType,
								typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,NO_OF_FFT_STAGES,tt_fftTwiddleType,tt_complexExpTableType,casted_type,tt_out>::TTR_twiddleType,
								typename ssr_fft_traits<tp_scaling_mode,tp_L,tp_R,NO_OF_FFT_STAGES,tt_fftTwiddleType,tt_complexExpTableType,casted_type,tt_out>::TTR_stageInType,
								typename ssr_fft_output_traits <tp_L,tp_R,tp_scaling_mode,casted_type>::TTR_fftOutType
								>
				::ssr_fft_stage(complexExpTable,complexExpTable_forkingStage,twiddleTable,p_fftInData_reOrdered,p_fftOutData);

			}
		};



#ifndef __SYNTHESIS__
		template <int L, int R, int tw_WL, int tw_IL>
		void check_ssr_fft_params()
		{

			//powerOf2CheckonL<1> L_checker;
			//L_checker.check();
			//powerOf2CheckonRadix<1> R_checker;
			//R_checker.check();
			//powerOf2CheckonRadix<R != ssr_fft_pow<2,(ssr_fft_log2<R>::val)>::val>::check();
			//powerOf2CheckonL<L != ssr_fft_pow<2,(ssr_fft_log2<L>::val)>::val>::check();
			//powerOf2CheckonRadix<R != ssr_fft_pow<2,(ssr_fft_log2<R>::val)>::val>::check();
			if( L < 16 )
			{
				std::cerr<<"\n\n\n====================================================================\n";
				std::cerr<<"The Minimum FFT Length allowed is  : 16\n";
				std::cerr<<"The Provided FFT Length:"<<L<<" is less than 16\n";
				std::cerr<<"====================================================================\n\n\n";

				exit(1);
			}
			if( L > (1024*16) )
			{
				std::cerr<<"\n\n\n====================================================================\n";
				std::cerr<<"The Maximum FFT Length allowed is  : 16384 : 16K \n";
				std::cerr<<"The Provided FFT Length:"<<L<<" is greater than 16384 \n";
				std::cerr<<"====================================================================\n\n\n";

				exit(1);
			}
			if( L != ssr_fft_pow<2,(ssr_fft_log2<L>::val)>::val )
			{
				std::cerr<<"\n\n\n====================================================================\n";
				std::cerr<<"The FFT Length should be an integer power of 2\n";
				std::cerr<<"The Provided FFT Length:"<<L<<" is not a power of 2\n";
				std::cerr<<"====================================================================\n\n\n";

				exit(1);
			}
			if( R != ssr_fft_pow<2,(ssr_fft_log2<R>::val)>::val )
			{
				std::cerr<<"\n\n\n====================================================================\n";
				std::cerr<<"The FFT SSR should be an integer power of 2\n";
				std::cerr<<"The Provided FFT Length:"<<R<<" is not a power of 2\n";
				std::cerr<<"====================================================================\n\n\n";

				exit(1);
			}
			if(tw_IL < 2)
			{
				std::cerr<<"\n\n\n====================================================================\n";
				std::cerr<<"The twiddle table should have at least 2 bits for integer part storage\n";
				std::cerr<<"The provided twiddle integer part width="<<tw_IL<<"\n";
				std::cerr<<"====================================================================\n\n\n";
				exit(1);
			}

			if(R==2 && L < 16)
			{
				std::cerr<<"\n\n\n====================================================================\n";
				std::cerr<<"For Radix/SSR=2 the minimum allowed SIZE or length of FFT is 16\n";
				std::cerr<<"====================================================================\n\n\n";
				exit(1);
			}

			if(R==8 && L < 16)
			{
				std::cerr<<"\n\n\n====================================================================\n";
				std::cerr<<"For Radix/SSR=8 the minimum allowed SIZE or length of FFT is 16\n";
				std::cerr<<"====================================================================\n\n\n";
				exit(1);
			}

			if(R==16 && L < 32)
			{
				std::cerr<<"\n\n\n====================================================================\n";
				std::cerr<<"For Radix/SSR=16 the minimum allowed SIZE or length of FFT is 32\n";
				std::cerr<<"====================================================================\n\n\n";
				exit(1);
			}

			if(R > 32 )
			{
				std::cerr<<"\n\n\n====================================================================\n";
				std::cerr<<"Currently SSR FFT Supports Radix/R/SSR = 2,4,8,16,32.\n The values of Radix/R/SSR larger than 32 values are not supported. \n";
				std::cerr<<"====================================================================\n\n\n";
				exit(1);
			}
		}
		//// Simulation only utility functions added to re order data in the case when the user want to have
		//// fft output in digit reversed transposed form. The utlity function can help to re order the fft out
		//// for simulation and verification purposes, these function wont synthesize. If user need to synthesize
		//// them he should use the fft param struct to have natural order for fft output.
		template <int is_R_x_R_form>
		struct outputTransposer_simOnly
		{
			template < int tp_R, int tp_L, typename tt_T1, typename tt_T2>
			void reOrderOutput(tt_T1 inData[tp_R][tp_L/tp_R], tt_T2 outData[tp_R][tp_L/tp_R]);
		};
		template<>
		struct outputTransposer_simOnly<1>
		{
			template < int tp_R, int tp_L, typename tt_T1, typename tt_T2>
			void reOrderOutput(tt_T1 inData[tp_R][tp_L/tp_R], tt_T2 outData[tp_R][tp_L/tp_R])
			{
				 digitReversedDataReOrder<tp_L,tp_R>(inData,outData);
			}
		};
		template<>
		struct outputTransposer_simOnly<0>
		{
			template < int tp_R, int tp_L, typename tt_T1, typename tt_T2>
			void reOrderOutput(tt_T1 inData[tp_R][tp_L/tp_R], tt_T2 outData[tp_R][tp_L/tp_R])
			{
				hls::stream<super_sample_container<tp_R, tt_T1> > temp_stream;
				OutputDataReOrder<(tp_L) / (tp_R * tp_R)> OutputDataReOrder_obj1;
				convertArrayToSuperStream<1010, 2020, tp_L, tp_R>(inData, temp_stream);
				OutputDataReOrder_obj1.template digitReversal2Phase<tp_L, tp_R>(temp_stream, outData);
			}
		};

		template < int tp_R, int tp_L, typename tt_T1, typename tt_T2>
		void ssr_fft_output_reorder_sim_only(tt_T1 inData[tp_R][tp_L/tp_R], tt_T2 outData[tp_R][tp_L/tp_R])
		{
			static const int is_R_x_R_form = (ssr_fft_log2<tp_L>::val) % (ssr_fft_log2<tp_R>::val) == 0;
			outputTransposer_simOnly<is_R_x_R_form> outputTransposer_simOnly_obj;
			outputTransposer_simOnly_obj.template reOrderOutput<tp_R,tp_L>(inData, outData);

		}

#endif

		template < typename ssr_fft_param_struct,
				   typename tt_in
				   //typename tt_out
				  >
		void fft( tt_in p_fftInData[ssr_fft_param_struct::R][ssr_fft_param_struct::N/ssr_fft_param_struct::R],  typename ssr_fft_output_traits<ssr_fft_param_struct::N,ssr_fft_param_struct::R,ssr_fft_param_struct::scaling_mode,typename ssr_fft_input_traits<tt_in>::TTR_casted_type>::TTR_fftOutType p_fftOutData[ssr_fft_param_struct::R][ssr_fft_param_struct::N/ssr_fft_param_struct::R])
		{
		#pragma HLS INLINE
		#pragma HLS DATAFLOW disable_start_propagation

			static const int tp_L= ssr_fft_param_struct::N;
			static const int tp_R= ssr_fft_param_struct::R;
			static const scaling_mode_enum tp_scaling_mode=ssr_fft_param_struct::scaling_mode;
			static const fft_output_order_enum tp_output_data_order=ssr_fft_param_struct::output_data_order;
			static const int tw_WL= ssr_fft_param_struct::twiddle_table_word_length;
			static const int tw_IL= ssr_fft_param_struct::twiddle_table_intger_part_length;
			typedef typename ssr_fft_input_traits<tt_in>::TTR_casted_type casted_type;

#ifndef __SYNTHESIS__
			check_ssr_fft_params<tp_L,tp_R,tw_WL,tw_IL>();
#endif
			typedef typename input_based_twiddle_traits<ssr_fft_param_struct,casted_type>::TTR_twiddleType tt_fftTwiddleType;
			typedef typename input_based_twiddle_traits<ssr_fft_param_struct,casted_type>::TTR_expTabType tt_complexExpTableType;

		#ifndef __SYNTHESIS__
				assert((tp_R)==(ssr_fft_pow< 2, ssr_fft_log2<tp_R>::val >::val)); // radix should be power of 2 always
				assert((tp_L)==(ssr_fft_pow< 2, ssr_fft_log2<tp_L>::val >::val)); // Length of FFt should be power of 2 always
		#endif
			ssr_fft_wrapper<   ( (  (ssr_fft_log2<tp_L>::val) % (ssr_fft_log2<tp_R>::val)  ) > 0 ), (tp_L) < ((tp_R*tp_R)) > ssr_fft_wrapper_obj;
			// The 1st template arguments select : if the FFT is forked , if it is then a different architecture is required
			// 2nd template argument select if the L < (tp_R^2) , which requires removal of interface bundle pragma
			ssr_fft_wrapper_obj.template inner_fft<tp_L,tp_R,tp_scaling_mode,tp_output_data_order,
				tt_complexExpTableType,
				tt_fftTwiddleType,
				tt_in,
				typename ssr_fft_output_traits<tp_L,tp_R,tp_scaling_mode,casted_type>::TTR_fftOutType
			  >(  p_fftInData,   p_fftOutData);

		}

	} //namespace hls
} //namespace ssr_fft

#endif

#endif // !HLS_SSR_FFT_H


