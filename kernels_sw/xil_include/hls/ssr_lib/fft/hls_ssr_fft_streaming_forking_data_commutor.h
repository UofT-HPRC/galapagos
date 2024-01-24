// File Name : hls_ssr_fft_streaming_forking_data_commutor.h
#ifndef HLS_SSR_FFT_STREAMING_FORKING_DATA_COMMUTOR_H_
#define HLS_SSR_FFT_STREAMING_FORKING_DATA_COMMUTOR_H_

#ifdef __HLS_SSR_FFT_LOCAL_LIB_DEVLOPMENT_PROJECT__
	//======================================================================
	// If source files are used for development of hls ssr fft IP locally
	// then set the files path as local.
	//=======================================================================
	#include "hls_ssr_fft_fork_merge_utils.h"
	#include "hls_ssr_fft_streaming_data_commutor.h"
	#include "hls_ssr_fft_fork_merge_utils.h"
#else //__HLS_SSR_FFT_LOCAL_LIB_DEVLOPMENT_PROJECT__ not defied
	//======================================================================
	// if the ssr fft source files are to be used in vivado_hls library with
	// released version of the tool then set path according to the placement
	// of the library
	//=======================================================================
	#include "hls/ssr_lib/fft/hls_ssr_fft_fork_merge_utils.h"
	#include "hls/ssr_lib/fft/hls_ssr_fft_streaming_data_commutor.h"
	#include "hls/ssr_lib/fft/hls_ssr_fft_fork_merge_utils.h"
#endif

namespace hls
{
	namespace ssr_fft
	{
			//////////////////////////////////////////New class for FORKING-STREAMING data commutor////////////////////////////////
			/* streamingDataCommutorFork : This class will take a [L/R][R] type stream with R sample stream and
			 * break it down to R/F streams creating F new streams. Functionally it will take [L/R][R] 2 dimensional array
			 * and break it down to F new 2 dimensional arrays of size [L/R][R/F] to be used by F dataflow processes
			*/

			template<int stage,int tp_forkNumber, int tp_forkingFactor>
			struct streamingDataCommutorFork
			{
				template<int tp_PF,int tp_L, int tp_R,typename tt_T>
				void copyForkCommuteAndMerge(tt_T in[tp_R][tp_L/tp_R],tt_T out[tp_R][tp_L/tp_R]);

			};

			template<int stage,int tp_forkingFactor>
			struct streamingDataCommutorFork<stage,1,tp_forkingFactor>
			{
				template<int tp_PF,int tp_L, int tp_R,typename tt_T>
				void copyForkCommuteAndMerge(tt_T in[tp_R][tp_L/tp_R],tt_T out[tp_R][tp_L/tp_R]);

			};

			// Important Comments :::
			/* Forking Function: Copies data tp_R/Forking Factor Buffers for forking out the output
			* The input is [tp_L][tp_R] array and output is a also [tp_L][tp_R] array , but internally
			* The input array is split into smaller arrays like : [tp_L][tp_R/forking_factor] to create
			* tp_R/forking factor input arrays, each of these arrays is assumed to be a seperate function
			* and finally in hardware every such function will map to a seperate process. Essentially it will
			* create a fork, once process feeding multiple processes;
			*/
			/*
													   :ossooooss+.
													 `oy/`        .oh/
											   .+::/+ds/::::::::::::/yd/::::::::/+o::::::::::::://
											   -/`--mo----------------hy---------/:-------------`s
											   -/:/:m`````````````````.M`````````..````````````+-s
											   -/:/.N    PROCESS-1.1  .N                       +-s
						   -+ssoos+-           -/:/ ys               `h/                       +-s
						`oy+.     ./ys.        -/:/  oy.   `  ``    :h/                        +-s
					   +h-           .ys       -/:/   .sy+-`    `:oy+`                         +-s
					  yo               /d`     -/:/      ./oooooo:`                            +-s
					 h+                 :d`    -/:/                                            +-s
					oy    PROCESS-1      +y    -/:/                                            +-+:::::::::::::.
				   `N`                    m:   -/:/                                            :/::::::::::::::
			`::::::yh:::::::::::::::::::::yd:::+::/                                            ``````````````
			`//////ms/////////////////////+N//////-                                           .s-------------
			`::::::N+:::::::::::::::::::::/M/::::+-                                           .+/::::::::::::::.
			`::::::N+:::::::::::::::::::::/M/:/. ::                                           .+s
				   h/                     .N  :: ::                                           .+s
				   +y                     +y  :: ::                                           .+s
				   `N.                    m-  :: ::           ./ooooo+:`                      .+s
					+h                   oy   :: ::        -sy+--.``..:oy+`                   .+s
					 yo                 /d`   :: ::      `ys`   :..-:.   :d:                  .+s
					  ss               +h`    :: :o::::::dy:::::::::::::::/N+::++-::::::::::::/+s
					   /h:           -h+      :/  ``````/d`````````````````:m``..```````````````s
						 +yo-`    -+yo`       `:::::::::sd:::::::::::::::::+N:://:::::::::::::::.
						   ./ooooo/.                    .m.   PROCESS-1.2  ss
														 :d-              sy
														  `sy:`        .oh/
															`/sssooooss+.

			 */

			template<int stage,int tp_forkNumber, int tp_forkingFactor>
			template<int tp_PF,int tp_L, int tp_R,typename tt_T>
			void streamingDataCommutorFork<stage,tp_forkNumber,tp_forkingFactor>::copyForkCommuteAndMerge(tt_T in[tp_R][tp_L/tp_R],tt_T out[tp_R][tp_L/tp_R])
			{
#pragma HLS INLINE
				tt_T localFactoredInputBuff[tp_R/tp_forkingFactor][tp_L/tp_R];
#pragma HLS DATA_PACK variable=localFactoredInputBuff
#pragma HLS STREAM variable=localFactoredInputBuff depth=8 dim=1
#pragma HLS RESOURCE variable=localFactoredInputBuff core=FIFO_LUTRAM

#ifdef SSR_FFT_PARTITION_INTERFACE_ARRAYS
		#pragma HLS ARRAY_PARTITION variable=localFactoredInputBuff complete dim=1
#else
		#pragma HLS ARRAY_RESHAPE variable=localFactoredInputBuff complete dim=1
#endif
				tt_T localFactoredOutputBuff[tp_R/tp_forkingFactor][tp_L/tp_R];
#pragma HLS DATA_PACK variable=localFactoredOutputBuff
#pragma HLS STREAM variable=localFactoredOutputBuff depth=8 dim=1
#pragma HLS RESOURCE variable=localFactoredOutputBuff core=FIFO_LUTRAM

//#pragma HLS ARRAY_RESHAPE variable=localFactoredOutputBuff complete dim=1
#ifdef SSR_FFT_PARTITION_INTERFACE_ARRAYS
	#pragma HLS ARRAY_PARTITION variable=localFactoredOutputBuff complete dim=1
#else
	#pragma HLS ARRAY_RESHAPE variable=localFactoredOutputBuff complete dim=1
#endif


				/*
				 * Function Signature :
				 * template <int tp_L, int tp_R,int tp_forkNumber, int tp_forkingFactor, typename tt_T>
				 *
				 *			void copyToLocalBuff(tt_T in[tp_R][tp_L/tp_R],tt_T out[tp_L/tp_R][tp_R/tp_forkingFactor])
				 */
				static const int isLargeMemFlag = (  (tp_PF*(tp_R/tp_forkingFactor) > SSR_FFT_URAM_SELECTION_THRESHHOLD ) && SSR_FFT_USE_URAMS ) ;

				copyToLocalBuff<tp_L,tp_R,tp_forkNumber,tp_forkingFactor,tt_T>(in,localFactoredInputBuff);
				streamingDataCommutations<stage,tp_forkNumber,tp_PF,isLargeMemFlag> commutor;
				commutor.template streamingDataCommutor<tp_L/tp_forkingFactor,tp_R/tp_forkingFactor,tt_T>(localFactoredInputBuff,localFactoredOutputBuff);

				/* Function Signature:
				 * template <int tp_L, int tp_R,int tp_forkNumber, int tp_forkingFactor, typename tt_T>
				 *				void copyFromLocalBuffToOuput(tt_T in[tp_L/tp_R][tp_R/tp_forkingFactor],tt_T out[tp_R][tp_L/tp_R])
				 */
				copyFromLocalBuffToOuput<tp_L,tp_R,tp_forkNumber,tp_forkingFactor,tt_T>(localFactoredOutputBuff,out);

				// Create a New Fork to Commute next factor of the output
				/* Function Signature:
				 * 	template<int tp_forkNumber, int tp_forkingFactor>
					template<int tp_PF,int tp_L, int tp_R,typename tt_T>
					void streamingDataCommutorFork<tp_forkNumber,tp_forkingFactor>::copyForkCommuteAndMerge(tt_T in[tp_R][tp_L/tp_R],tt_T out[tp_R][tp_L/tp_R])
				 */
				streamingDataCommutorFork<stage,tp_forkNumber-1,tp_forkingFactor> streamingDataCommutorFork_obj;
				streamingDataCommutorFork_obj.template copyForkCommuteAndMerge<tp_PF,tp_L,tp_R,tt_T>(in,out);
			}



			// copyForkCommuteAndMerge base case specialization for fork number = 1, terminates forking/recursion
			template<int stage,int tp_forkingFactor>
			template<int tp_PF,int tp_L, int tp_R,typename tt_T>
			void streamingDataCommutorFork<stage,1,tp_forkingFactor>::copyForkCommuteAndMerge(tt_T in[tp_R][tp_L/tp_R],tt_T out[tp_R][tp_L/tp_R])
			{
			#pragma HLS INLINE
				tt_T localFactoredInputBuff[tp_R/tp_forkingFactor][tp_L/tp_R];
#pragma HLS DATA_PACK variable=localFactoredInputBuff
#pragma HLS STREAM variable=localFactoredInputBuff depth=8 dim=1
#pragma HLS RESOURCE variable=localFactoredInputBuff core=FIFO_LUTRAM
//#pragma HLS ARRAY_RESHAPE variable=localFactoredInputBuff complete dim=1


#ifdef SSR_FFT_PARTITION_INTERFACE_ARRAYS
		#pragma HLS ARRAY_PARTITION variable=localFactoredInputBuff complete dim=1
#else
		#pragma HLS ARRAY_RESHAPE variable=localFactoredInputBuff complete dim=1
#endif

				tt_T localFactoredOutputBuff[tp_R/tp_forkingFactor][tp_L/tp_R];
#pragma HLS DATA_PACK variable=localFactoredOutputBuff
#pragma HLS STREAM variable=localFactoredOutputBuff depth=8 dim=1
#pragma HLS RESOURCE variable=localFactoredOutputBuff core=FIFO_LUTRAM
//#pragma HLS ARRAY_RESHAPE variable=localFactoredOutputBuff complete dim=1
#ifdef SSR_FFT_PARTITION_INTERFACE_ARRAYS
		#pragma HLS ARRAY_PARTITION variable=localFactoredOutputBuff complete dim=1
#else
		#pragma HLS ARRAY_RESHAPE variable=localFactoredOutputBuff complete dim=1
#endif
				static const int isLargeMemFlag = (  (tp_PF*(tp_R/tp_forkingFactor) > SSR_FFT_URAM_SELECTION_THRESHHOLD ) && SSR_FFT_USE_URAMS ) ;

				copyToLocalBuff<tp_L,tp_R,1,tp_forkingFactor,tt_T>(in,localFactoredInputBuff);
				streamingDataCommutations<stage,1,tp_PF,isLargeMemFlag> commutor;
				commutor.template streamingDataCommutor<tp_L/tp_forkingFactor,tp_R/tp_forkingFactor,tt_T>(localFactoredInputBuff,localFactoredOutputBuff);
				copyFromLocalBuffToOuput<tp_L,tp_R,1,tp_forkingFactor,tt_T>(localFactoredOutputBuff,out);
			}

			/* DataCommutorFork : This class will take a [L/R][R] type stream with R sample stream and
			 * break it down to R/F streams creating F new streams. Functionally it will take [L/R][R] 2 dimensional array
			 * and break it down to F new 2 dimensional arrays of size [L/R][R/F] to be used by F dataflow processes
			*/
			template<int stage,int tp_forkNumber, int tp_forkingFactor>
			struct streamingDataCommutorFork_NI
			{
				template<int tp_PF,int tp_L, int tp_R,typename tt_T>
				void copyForkCommuteAndMerge_NI(tt_T in[tp_R][tp_L/tp_R],tt_T out[tp_R][tp_L/tp_R]);

			};

			template<int stage,int tp_forkingFactor>
			struct streamingDataCommutorFork_NI<stage,1,tp_forkingFactor>
			{
				template<int tp_PF,int tp_L, int tp_R,typename tt_T>
				void copyForkCommuteAndMerge_NI(tt_T in[tp_R][tp_L/tp_R],tt_T out[tp_R][tp_L/tp_R]);

			};

			// Important Comments :::
			/* Forking Function: Copies data tp_R/Forking Factor Buffers for forking out the output
			* The input is [tp_L][tp_R] array and output is a also [tp_L][tp_R] array , but internally
			* The input array is split into smaller arrays like : [tp_L][tp_R/forking_factor] to create
			* tp_R/forking factor input arrays, each of these arrays is assumed to be a seperate function
			* and finally in hardware every such function will map to a seperate process. Essentially it will
			* create a fork, once process feeding multiple processes;
			*/
			/*
													   :ossooooss+.
													 `oy/`        .oh/
											   .+::/+ds/::::::::::::/yd/::::::::/+o::::::::::::://
											   -/`--mo----------------hy---------/:-------------`s
											   -/:/:m`````````````````.M`````````..````````````+-s
											   -/:/.N    PROCESS-1.1  .N                       +-s
						   -+ssoos+-           -/:/ ys               `h/                       +-s
						`oy+.     ./ys.        -/:/  oy.   `  ``    :h/                        +-s
					   +h-           .ys       -/:/   .sy+-`    `:oy+`                         +-s
					  yo               /d`     -/:/      ./oooooo:`                            +-s
					 h+                 :d`    -/:/                                            +-s
					oy    PROCESS-1      +y    -/:/                                            +-+:::::::::::::.
				   `N`                    m:   -/:/                                            :/::::::::::::::
			`::::::yh:::::::::::::::::::::yd:::+::/                                            ``````````````
			`//////ms/////////////////////+N//////-                                           .s-------------
			`::::::N+:::::::::::::::::::::/M/::::+-                                           .+/::::::::::::::.
			`::::::N+:::::::::::::::::::::/M/:/. ::                                           .+s
				   h/                     .N  :: ::                                           .+s
				   +y                     +y  :: ::                                           .+s
				   `N.                    m-  :: ::           ./ooooo+:`                      .+s
					+h                   oy   :: ::        -sy+--.``..:oy+`                   .+s
					 yo                 /d`   :: ::      `ys`   :..-:.   :d:                  .+s
					  ss               +h`    :: :o::::::dy:::::::::::::::/N+::++-::::::::::::/+s
					   /h:           -h+      :/  ``````/d`````````````````:m``..```````````````s
						 +yo-`    -+yo`       `:::::::::sd:::::::::::::::::+N:://:::::::::::::::.
						   ./ooooo/.                    .m.   PROCESS-1.2  ss
														 :d-              sy
														  `sy:`        .oh/
															`/sssooooss+.

			 */

			template<int stage,int tp_forkNumber, int tp_forkingFactor>
			template<int tp_PF,int tp_L, int tp_R,typename tt_T>
			void streamingDataCommutorFork_NI<stage,tp_forkNumber,tp_forkingFactor>::copyForkCommuteAndMerge_NI(tt_T in[tp_R][tp_L/tp_R],tt_T out[tp_R][tp_L/tp_R])
			{
#pragma HLS INLINE
				tt_T localFactoredInputBuff[tp_R/tp_forkingFactor][tp_L/tp_R];
#pragma HLS DATA_PACK variable=localFactoredInputBuff
#pragma HLS STREAM variable=localFactoredInputBuff depth=8 dim=1
#pragma HLS RESOURCE variable=localFactoredInputBuff core=FIFO_LUTRAM
//#pragma HLS ARRAY_RESHAPE variable=localFactoredInputBuff complete dim=1
#ifdef SSR_FFT_PARTITION_INTERFACE_ARRAYS
		#pragma HLS ARRAY_PARTITION variable=localFactoredInputBuff complete dim=1
#else
		#pragma HLS ARRAY_RESHAPE variable=localFactoredInputBuff complete dim=1
#endif
				tt_T localFactoredOutputBuff[tp_R/tp_forkingFactor][tp_L/tp_R];
#pragma HLS DATA_PACK variable=localFactoredOutputBuff
#pragma HLS STREAM variable=localFactoredOutputBuff depth=8 dim=1
#pragma HLS RESOURCE variable=localFactoredOutputBuff core=FIFO_LUTRAM
//#pragma HLS ARRAY_RESHAPE variable=localFactoredOutputBuff complete dim=1
#ifdef SSR_FFT_PARTITION_INTERFACE_ARRAYS
	#pragma HLS ARRAY_PARTITION variable=localFactoredOutputBuff complete dim=1
#else
	#pragma HLS ARRAY_RESHAPE variable=localFactoredOutputBuff complete dim=1
#endif


				/*
				 * Function Signature :
				 * template <int tp_L, int tp_R,int tp_forkNumber, int tp_forkingFactor, typename tt_T>
				 *
				 *			void copyToLocalBuff(tt_T in[tp_R][tp_L/tp_R],tt_T out[tp_L/tp_R][tp_R/tp_forkingFactor])
				 */
				copyToLocalBuff<tp_L,tp_R,tp_forkNumber,tp_forkingFactor,tt_T>(in,localFactoredInputBuff);
				static const int isLargeMemFlag = (  (tp_PF*(tp_R/tp_forkingFactor) > SSR_FFT_URAM_SELECTION_THRESHHOLD ) && SSR_FFT_USE_URAMS ) ;
				streamingDataCommutations<stage,tp_forkNumber,tp_PF,isLargeMemFlag> commutor;
				commutor.template streamingDataCommutor<tp_L/tp_forkingFactor,tp_R/tp_forkingFactor,tt_T>(localFactoredInputBuff,localFactoredOutputBuff);
				/* Function Signature:
				 * template <int tp_L, int tp_R,int tp_forkNumber, int tp_forkingFactor, typename tt_T>
				 *				void copyFromLocalBuffToOuput(tt_T in[tp_L/tp_R][tp_R/tp_forkingFactor],tt_T out[tp_R][tp_L/tp_R])
				 */
				copyFromLocalBuffToOuput_NI<tp_L,tp_R,tp_forkNumber,tp_forkingFactor,tt_T>(localFactoredOutputBuff,out);
				 // Create a New Fork to Commute next factor of the output
				/* Function Signature:
				 * 	template<int tp_forkNumber, int tp_forkingFactor>
					template<int tp_PF,int tp_L, int tp_R,typename tt_T>
					void DataCommutorFork<tp_forkNumber,tp_forkingFactor>::copyForkCommuteAndMerge(tt_T in[tp_R][tp_L/tp_R],tt_T out[tp_R][tp_L/tp_R])
				 */
				streamingDataCommutorFork_NI<stage,tp_forkNumber-1,tp_forkingFactor> streamingDataCommutorFork_obj_NI;
				streamingDataCommutorFork_obj_NI.template copyForkCommuteAndMerge_NI<tp_PF,tp_L,tp_R,tt_T>(in,out);
			}

			// copyForkCommuteAndMerge base case specialization for fork number = 1, terminates forking/recursion
			template<int stage,int tp_forkingFactor>
			template<int tp_PF,int tp_L, int tp_R,typename tt_T>
			void streamingDataCommutorFork_NI<stage,1,tp_forkingFactor>::copyForkCommuteAndMerge_NI(tt_T in[tp_R][tp_L/tp_R],tt_T out[tp_R][tp_L/tp_R])
			{
			#pragma HLS INLINE

				tt_T localFactoredInputBuff[tp_R/tp_forkingFactor][tp_L/tp_R];
#pragma HLS DATA_PACK variable=localFactoredInputBuff
#pragma HLS STREAM variable=localFactoredInputBuff depth=8 dim=1
#pragma HLS RESOURCE variable=localFactoredInputBuff core=FIFO_LUTRAM
//#pragma HLS ARRAY_RESHAPE variable=localFactoredInputBuff complete dim=1
#ifdef SSR_FFT_PARTITION_INTERFACE_ARRAYS
	#pragma HLS ARRAY_PARTITION variable=localFactoredInputBuff complete dim=1
#else
	#pragma HLS ARRAY_RESHAPE variable=localFactoredInputBuff complete dim=1
#endif

				tt_T localFactoredOutputBuff[tp_R/tp_forkingFactor][tp_L/tp_R];
#pragma HLS DATA_PACK variable=localFactoredOutputBuff
#pragma HLS STREAM variable=localFactoredOutputBuff depth=8 dim=1
#pragma HLS RESOURCE variable=localFactoredOutputBuff core=FIFO_LUTRAM



#pragma HLS ARRAY_RESHAPE variable=localFactoredOutputBuff complete dim=1
#ifdef SSR_FFT_PARTITION_INTERFACE_ARRAYS
	#pragma HLS ARRAY_PARTITION variable=localFactoredOutputBuff complete dim=1
#else
	#pragma HLS ARRAY_RESHAPE variable=localFactoredOutputBuff complete dim=1
#endif
				static const int isLargeMemFlag = (  (tp_PF*(tp_R/tp_forkingFactor) > SSR_FFT_URAM_SELECTION_THRESHHOLD ) && SSR_FFT_USE_URAMS ) ;
				copyToLocalBuff<tp_L,tp_R,1,tp_forkingFactor,tt_T>(in,localFactoredInputBuff);
				streamingDataCommutations<stage,1,tp_PF,isLargeMemFlag> commutor;
				commutor.template streamingDataCommutor<tp_L/tp_forkingFactor,tp_R/tp_forkingFactor,tt_T>(localFactoredInputBuff,localFactoredOutputBuff);
				copyFromLocalBuffToOuput_NI<tp_L,tp_R,1,tp_forkingFactor,tt_T>(localFactoredOutputBuff,out);
			}
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	} //namespace hls
} //namespace ssr_fft

/////////////////////////////////////// New Class Purely Streaming : without conversion from array to stream //////////////////////
/////////////////////////////////////// New Class Purely Streaming : without conversion from array to stream //////////////////////

#if 1
namespace hls
{
	namespace ssr_fft
	{
			//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

			//////////////////////////////////////////New class for FORKING-STREAMING data commutor////////////////////////////////


			/* streamingDataCommutorFork_s2s : This class will take a [L/R][R] type stream with R sample stream and
			 * break it down to R/F streams creating F new streams. Functionally it will take [L/R][R] 2 dimensional array
			 * and break it down to F new 2 dimensional arrays of size [L/R][R/F] to be used by F dataflow processes
			*/
			template<int stage,int tp_forkNumber, int tp_forkingFactor>
			struct streamingDataCommutorFork_s2s
			{
				template<int tp_PF,int tp_L, int tp_R,typename tt_T>
				void forkedCompute(
									hls::stream< super_sample_container< tp_R/tp_forkingFactor , tt_T > > in[tp_forkingFactor],
									hls::stream< super_sample_container< tp_R/tp_forkingFactor , tt_T > > out[tp_forkingFactor]
						          )
				{
#pragma HLS INLINE

					static const int isLargeMemFlag = (  (tp_PF*(tp_R/tp_forkingFactor) > SSR_FFT_URAM_SELECTION_THRESHHOLD ) && SSR_FFT_USE_URAMS ) ;

					DataCommutations_s2streaming<stage,tp_forkNumber,tp_PF,isLargeMemFlag> commutor;
					commutor.template streamingDataCommutor<tp_L/tp_forkingFactor,tp_R/tp_forkingFactor,tt_T>(in[tp_forkNumber-1],out[tp_forkNumber-1]);
					streamingDataCommutorFork_s2s<stage,tp_forkNumber-1,tp_forkingFactor> streamingDataCommutorFork_obj;
					streamingDataCommutorFork_obj.template forkedCompute<tp_PF,tp_L,tp_R,tt_T>(in,out);
				}

			};

			template<int stage,int tp_forkingFactor>
			struct streamingDataCommutorFork_s2s<stage,1,tp_forkingFactor>
			{
				template<int tp_PF,int tp_L, int tp_R,typename tt_T>
				void forkedCompute(
									hls::stream< super_sample_container< tp_R/tp_forkingFactor , tt_T > > in[tp_forkingFactor],
									hls::stream< super_sample_container< tp_R/tp_forkingFactor , tt_T > > out[tp_forkingFactor]
								  )
				{
#pragma HLS INLINE
					static const int isLargeMemFlag = (  (tp_PF*(tp_R/tp_forkingFactor) > SSR_FFT_URAM_SELECTION_THRESHHOLD ) && SSR_FFT_USE_URAMS ) ;
					DataCommutations_s2streaming<stage,1,tp_PF,isLargeMemFlag> commutor;
					commutor.template streamingDataCommutor<tp_L/tp_forkingFactor,tp_R/tp_forkingFactor,tt_T>(in[1-1],out[1-1]);
				}

			};
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	} //namespace hls
} //namespace ssr_fft

#endif








#endif //HLS_SSR_FFT_STREAMING_FORKING_DATA_COMMUTOR_H_
