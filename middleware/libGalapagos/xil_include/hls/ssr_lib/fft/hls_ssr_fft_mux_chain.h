//Filen Name: hls_ssr_fft_mux_chain.h
/*
=========================================================================================
-_-                                                                                   -_-
-_-                                                                                   -_-
-_-                                                                                   -_-
-_-                                                                                   -_-
-_-                                                                                   -_-
-_-                                                                                   -_-
-_-

	26-sep-2018-: This file defines a MuxChain class that can be used to create
	chain of muxes for construction input swap transposes for SSR FFT

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
#ifndef HLS_SSR_FFT_MUX_CHAIN_H_
#define HLS_SSR_FFT_MUX_CHAIN_H_
#include <ap_shift_reg.h>
namespace hls {
	namespace ssr_fft {


		template <int stage, int id, unsigned int tp_height>
		struct MuxChain
		{
					template <typename tt_T,typename control_T, unsigned int tp_R, unsigned int tp_PF>
					void genChain(control_T control_bits,tt_T *in, tt_T *out);
		};

		template <int stage, int id>
		struct MuxChain<stage,id,1>
		{
					template <typename tt_T,typename control_T, unsigned int tp_R, unsigned int tp_PF>
					void genChain(control_T control_bits,tt_T *in, tt_T *out);
		};


		template <int stage, int id, unsigned int tp_height>
		template <typename tt_T,typename control_T, unsigned int tp_R, unsigned int tp_PF>
		void MuxChain<stage,id,tp_height>::genChain(control_T control_bits,tt_T *in, tt_T *out) {
			static ap_shift_reg<unsigned int,tp_PF> control_delayline;
			unsigned int next_stage_control_bits=control_delayline.shift(control_bits);

			out[tp_R-tp_height]=in[control_bits];


				MuxChain<stage,id,tp_height-1> nextMux;
				nextMux.template genChain<tt_T,control_T,tp_R,tp_PF>(next_stage_control_bits,&in[0],&out[0]);

		}

		template <int stage, int id>
		template <typename tt_T,typename  control_T, unsigned int tp_R, unsigned int tp_PF>
		void MuxChain<stage,id,1>::genChain(control_T control_bits,tt_T *in, tt_T *out) {

			out[tp_R-1]=in[control_bits];


		}
	} // end name space ssr_fft
} // end name space hls

#endif //HLS_SSR_FFT_MUX_CHAIN_H_
