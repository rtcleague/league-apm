set(WEBRTC_HEADERS
    webrtc/rtc_base/synchronization/mutex.h
)

set(WEBRTC_SOURCES
    # AEC3 (Acoustic Echo Cancellation)
    webrtc/modules/audio_processing/aec3/adaptive_fir_filter.cc
    webrtc/modules/audio_processing/aec3/aec3_common.cc
    webrtc/modules/audio_processing/aec3/block_framer.cc
    webrtc/modules/audio_processing/aec3/block_processor.cc
    webrtc/modules/audio_processing/aec3/comfort_noise_generator.cc
    webrtc/modules/audio_processing/aec3/echo_canceller3.cc
    webrtc/modules/audio_processing/aec3/echo_path_delay_estimator.cc
    webrtc/modules/audio_processing/aec3/echo_remover.cc
    webrtc/modules/audio_processing/aec3/frame_blocker.cc
    webrtc/modules/audio_processing/aec3/render_delay_buffer.cc
    webrtc/modules/audio_processing/aec3/render_delay_controller.cc

    # Common Audio
    webrtc/common_audio/audio_converter.cc
    webrtc/common_audio/audio_util.cc
    webrtc/common_audio/channel_buffer.cc
    webrtc/common_audio/fir_filter_c.cc
    webrtc/common_audio/resampler/push_resampler.cc
    webrtc/common_audio/resampler/resampler.cc
    webrtc/common_audio/resampler/sinc_resampler.cc

    # Audio Processing
    webrtc/modules/audio_processing/audio_processing_impl.cc
    webrtc/modules/audio_processing/audio_buffer.cc
    webrtc/modules/audio_processing/audio_processing_builder_impl.cc
    webrtc/modules/audio_processing/gain_controller2.cc
    webrtc/modules/audio_processing/gain_control_impl.cc
    webrtc/modules/audio_processing/high_pass_filter.cc

    # RTC Base
    webrtc/rtc_base/platform_thread_types.cc

    ${WEBRTC_HEADERS}
) 

set(WEBRTC_INCLUDE_DIRS
    ${CMAKE_CURRENT_SOURCE_DIR}/webrtc
    ${CMAKE_CURRENT_SOURCE_DIR}/webrtc/rtc_base
    ${CMAKE_CURRENT_SOURCE_DIR}/webrtc/rtc_base/synchronization
    ${CMAKE_CURRENT_SOURCE_DIR}/webrtc/rtc_base/system
    ${CMAKE_CURRENT_SOURCE_DIR}/webrtc/modules/audio_processing/include
    ${CMAKE_CURRENT_SOURCE_DIR}/webrtc/common_audio
    ${CMAKE_CURRENT_SOURCE_DIR}/webrtc/common_audio/resampler
)

include_directories(${WEBRTC_INCLUDE_DIRS}) 