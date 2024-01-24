#ifndef HLS_SSR_FFT_TRIANGLE_DELAY_H_
#define  HLS_SSR_FFT_TRIANGLE_DELAY_H_
#include <ap_shift_reg.h>
namespace hls {
	namespace ssr_fft {


		template <int stage, int id , unsigned int tp_height>
		struct TriangleDelay
		{
				template <typename tt_T, unsigned int tp_PF, bool delay_on_low_index_first>
					void process(tt_T *in, tt_T *out);
		};


		template <int stage, int id >
				struct TriangleDelay<stage,id,1>
				{
						template <typename tt_T, unsigned int tp_PF, bool delay_on_low_index_first>
							void process(tt_T *in, tt_T *out);
				};


		// recursive funtion
		template <int stage, int id , unsigned int tp_height>
		template <typename tt_T, unsigned int tp_PF, bool delay_on_low_index_first>
		void TriangleDelay<stage, id, tp_height>::process(tt_T *in, tt_T *out) {
			static ap_shift_reg<tt_T,(tp_height-1)*tp_PF> delayline;
			if(delay_on_low_index_first)
			{
				out[0] = delayline.shift(in[0]);
				TriangleDelay<stage,id,tp_height-1> next1;
				next1.template process<tt_T,tp_PF,delay_on_low_index_first>(&in[1],&out[1]);
			}
			else
			{ // delay on LSB
				out[tp_height-1] = delayline.shift(in[tp_height-1]);
				TriangleDelay<stage,id,tp_height-1> next0;
				next0.template process<tt_T,tp_PF,delay_on_low_index_first>(&in[0],&out[0]);
			}
		}

		// tail
		template <int stage, int id>
		template <typename T, unsigned int tp_PF, bool delay_on_low_index_first>
		void TriangleDelay<stage,id,1>::process(T *in, T *out) {
			out[0] = in[0];
		}
	} // end name space ssr_ftt
} //end name space hls
#endif //HLS_SSR_FFT_TRIANGLE_DELAY_H_
