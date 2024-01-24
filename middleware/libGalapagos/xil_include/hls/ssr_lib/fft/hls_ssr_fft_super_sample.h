//File Name : hls_ssr_fft_super_sample.h
#ifndef HLS_SSR_FFT_SUPER_SAMPLE_H_
#define HLS_SSR_FFT_SUPER_SAMPLE_H_
template <typename tt_T>
struct tagged_sample
{
	tt_T sample;
	bool valid;
};
template < int tp_R, typename tt_T >
struct super_sample_container
{
   	tt_T superSample[tp_R];
};
#endif //HLS_SSR_FFT_SUPER_SAMPLE_H_
