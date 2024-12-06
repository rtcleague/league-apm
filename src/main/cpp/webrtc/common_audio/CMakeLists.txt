cmake_minimum_required(VERSION 3.4.1)
set(SRC_FILES
        #        audio_converter.cc
        #        audio_util.cc
        #        channel_buffer.cc
        ##        fir_filter_avx2.cc
        #        fir_filter_c.cc
                fir_filter_factory.cc
        ##        fir_filter_neon.cc
        ##        fir_filter_sse.cc
        #        real_fourier.cc
        #        real_fourier_ooura.cc
        #        resampler/push_resampler.cc
        #        resampler/push_sinc_resampler.cc
        #        resampler/resampler.cc
        #        resampler/sinc_resampler.cc
        ##        resampler/sinc_resampler_avx2.cc
        ##        resampler/sinc_resampler_neon.cc
        ##        resampler/sinc_resampler_sse.cc
        #        resampler/sinusoidal_linear_chirp_source.cc
        #        signal_processing/dot_product_with_scale.cc
        #        smoothing_filter.cc
        third_party/ooura/fft_size_128/ooura_fft.cc
        third_party/spl_sqrt_floor/spl_sqrt_floor.c
        ##        third_party/ooura/fft_size_128/ooura_fft_mips.cc
        ##        third_party/ooura/fft_size_128/ooura_fft_neon.cc
        ##        third_party/ooura/fft_size_128/ooura_fft_sse2.cc
        #        third_party/ooura/fft_size_256/fft4g.cc
        #        vad/vad.cc
        #        wav_file.cc
        #        wav_header.cc
        #        window_generator.cc
        audio_converter.cc
        audio_util.cc
        channel_buffer.cc
        third_party/ooura/fft_size_256/fft4g.cc
        real_fourier.cc
        real_fourier_ooura.cc
        ring_buffer.c
        window_generator.cc
        fir_filter_c.cc
        resampler/push_resampler.cc
        resampler/push_sinc_resampler.cc
        resampler/resampler.cc
        resampler/sinusoidal_linear_chirp_source.cc
        resampler/sinc_resampler.cc
        signal_processing/auto_corr_to_refl_coef.c
        signal_processing/auto_correlation.c
        signal_processing/complex_bit_reverse.c
        signal_processing/complex_fft.c
        signal_processing/copy_set_operations.c
        signal_processing/cross_correlation.c
        signal_processing/division_operations.c
        signal_processing/dot_product_with_scale.cc
        signal_processing/downsample_fast.c
        signal_processing/energy.c
        signal_processing/filter_ar.c
        signal_processing/filter_ma_fast_q12.c
        signal_processing/get_hanning_window.c
        signal_processing/get_scaling_square.c
        signal_processing/ilbc_specific_functions.c
        signal_processing/levinson_durbin.c
        signal_processing/min_max_operations.c
        signal_processing/randomization_functions.c
        signal_processing/real_fft.c
        signal_processing/refl_coef_to_lpc.c
        signal_processing/resample.c
        signal_processing/resample_48khz.c
        signal_processing/resample_by_2.c
        signal_processing/resample_by_2_internal.c
        signal_processing/resample_fractional.c
        signal_processing/spl_init.c
        signal_processing/spl_sqrt.c
        signal_processing/splitting_filter.c
        signal_processing/sqrt_of_one_minus_x_squared.c
        signal_processing/vector_scaling_operations.c
        vad/vad.cc
        vad/vad_core.c
        vad/vad_filterbank.c
        vad/vad_gmm.c
        vad/vad_sp.c
        vad/webrtc_vad.c
        )
add_library(webrtc_common_audio ${SRC_FILES})
target_include_directories(webrtc_common_audio PUBLIC
        include
        mocks
        resampler
        signal_processing
        third_party
        vad
        )