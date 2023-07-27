//File Name : hls_ssr_fft_pragma_controls.h

#ifndef HLS_SSR_FFT_PRAGMA_CONTROLS_H_
#define HLS_SSR_FFT_PRAGMA_CONTROLS_H_


//#define SSR_FFT_PARTITION_INTERFACE_ARRAYS      // defining this will partition interface arrays otherwise it will use reshape

//#define SSR_FFT_PARTITION_IO_ARRAYS    // define this if final output SSR=R number of sample needed as Separate ports
//#define SSR_FFT_SEPERATE_REAL_IMAG_PARTS // define this if complex outputs needed Separate as REAL and image ports

#ifndef SSR_FFT_URAM_SELECTION_THRESHHOLD
#define SSR_FFT_URAM_SELECTION_THRESHHOLD 32   // Memories larger then threshold will be implemented using URAMs
#endif //SSR_FFT_URAM_SELECTION_THRESHHOLD

#ifndef SSR_FFT_USE_URAMS
#define SSR_FFT_USE_URAMS 0
#endif //SSR_FFT_USE_URAMS

#endif //HLS_SSR_FFT_PRAGMA_CONTROLS_H_
