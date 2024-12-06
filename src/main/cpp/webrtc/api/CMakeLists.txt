cmake_minimum_required(VERSION 3.4.1)

set(SRC_FILES
    audio/audio_frame.cc
    audio/channel_layout.cc
    audio/echo_canceller3_config.cc
    audio/echo_canceller3_factory.cc
    audio/echo_detector_creator.cc
    audio_codecs/audio_decoder.cc
    audio_codecs/audio_encoder.cc
    audio_codecs/audio_format.cc
    audio_codecs/builtin_audio_decoder_factory.cc
    audio_codecs/builtin_audio_encoder_factory.cc
    audio_options.cc
    task_queue/task_queue_base.cc
)

add_library(webrtc_api STATIC ${SRC_FILES})

target_include_directories(webrtc_api PUBLIC 
    ${CMAKE_CURRENT_SOURCE_DIR}/..
    ${CMAKE_CURRENT_SOURCE_DIR}
)

target_link_libraries(webrtc_api
    PUBLIC
    webrtc_rtc_base
    webrtc_system_wrappers
)