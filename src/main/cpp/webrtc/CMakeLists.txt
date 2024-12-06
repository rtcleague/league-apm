cmake_minimum_required(VERSION 3.10)

set(LOCAL_CXX_FLAGS "${CMAKE_CXX_FLAGS} std=c++17")
set(CMAKE_CXX_STANDARD 17)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DWEBRTC_POSIX -O0")

# Add Abseil include directories
include_directories(
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${abseil_SOURCE_DIR}
    ${abseil_BINARY_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/abseil-cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/audio
    ${CMAKE_CURRENT_SOURCE_DIR}/api
    ${CMAKE_CURRENT_SOURCE_DIR}/call
    ${CMAKE_CURRENT_SOURCE_DIR}/common_audio
    ${CMAKE_CURRENT_SOURCE_DIR}/logging
    ${CMAKE_CURRENT_SOURCE_DIR}/modules
    ${CMAKE_CURRENT_SOURCE_DIR}/rtc_base
    ${CMAKE_CURRENT_SOURCE_DIR}/system_wrappers
    ${CMAKE_CURRENT_SOURCE_DIR}/third_party
    ${CMAKE_CURRENT_SOURCE_DIR}/media
    ${CMAKE_CURRENT_SOURCE_DIR}/p2p
)

add_definitions(
    -DWEBRTC_POSIX
    -DWEBRTC_LINUX
    -DWEBRTC_X86_64
    -DWEBRTC_APM_DEBUG_DUMP=0
    -DWEBRTC_ENABLE_PROTOBUF=0
    -DWEBRTC_USE_BUILTIN_ISAC_FIX=1
    -DWEBRTC_USE_BUILTIN_ISAC_FLOAT=0
    -DWEBRTC_INCLUDE_INTERNAL_AUDIO_DEVICE
    -DWEBRTC_OPUS_VARIABLE_COMPLEXITY=1
    -DABSL_ALLOCATOR_NOTHROW
)

# Exclude Android-specific files for Linux x86_64 build
list(FILTER webrtc_rtc_base_sources EXCLUDE REGEX ".*android.*")
list(FILTER webrtc_rtc_base_sources EXCLUDE REGEX ".*sdk/android.*")

# Add subdirectories for WebRTC components
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/modules)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/rtc_base)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/system_wrappers)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/api)

# Define WebRTC source files - only include files we have
set(WEBRTC_SOURCES
    "${CMAKE_CURRENT_SOURCE_DIR}/modules/audio_processing/aec3/adaptive_fir_filter.cc"
    "${CMAKE_CURRENT_SOURCE_DIR}/modules/audio_processing/aec3/aec3_common.cc"
    "${CMAKE_CURRENT_SOURCE_DIR}/modules/audio_processing/aec3/block_framer.cc"
    "${CMAKE_CURRENT_SOURCE_DIR}/modules/audio_processing/aec3/block_processor.cc"
    "${CMAKE_CURRENT_SOURCE_DIR}/modules/audio_processing/aec3/comfort_noise_generator.cc"
    "${CMAKE_CURRENT_SOURCE_DIR}/modules/audio_processing/aec3/echo_canceller3.cc"
    "${CMAKE_CURRENT_SOURCE_DIR}/modules/audio_processing/aec3/echo_path_delay_estimator.cc"
    "${CMAKE_CURRENT_SOURCE_DIR}/modules/audio_processing/aec3/echo_remover.cc"
    "${CMAKE_CURRENT_SOURCE_DIR}/modules/audio_processing/aec3/frame_blocker.cc"
    "${CMAKE_CURRENT_SOURCE_DIR}/modules/audio_processing/aec3/render_delay_buffer.cc"
    "${CMAKE_CURRENT_SOURCE_DIR}/modules/audio_processing/aec3/render_delay_controller.cc"
    "${CMAKE_CURRENT_SOURCE_DIR}/common_audio/audio_converter.cc"
    "${CMAKE_CURRENT_SOURCE_DIR}/common_audio/audio_util.cc"
    "${CMAKE_CURRENT_SOURCE_DIR}/common_audio/channel_buffer.cc"
    "${CMAKE_CURRENT_SOURCE_DIR}/common_audio/fir_filter_c.cc"
    "${CMAKE_CURRENT_SOURCE_DIR}/common_audio/resampler/push_resampler.cc"
    "${CMAKE_CURRENT_SOURCE_DIR}/common_audio/resampler/resampler.cc"
    "${CMAKE_CURRENT_SOURCE_DIR}/common_audio/resampler/sinc_resampler.cc"
    "${CMAKE_CURRENT_SOURCE_DIR}/common_audio/signal_processing/auto_correlation.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/common_audio/signal_processing/cross_correlation.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/common_audio/signal_processing/energy.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/common_audio/signal_processing/get_hanning_window.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/common_audio/signal_processing/filter_ar.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/common_audio/signal_processing/spl_inl.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/common_audio/signal_processing/min_max_operations.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/common_audio/signal_processing/resample_48khz.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/common_audio/signal_processing/resample_by_2.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/common_audio/signal_processing/resample_by_2_internal.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/common_audio/signal_processing/resample_fractional.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/common_audio/vad/vad.cc"
    "${CMAKE_CURRENT_SOURCE_DIR}/common_audio/vad/vad_core.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/common_audio/vad/vad_filterbank.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/common_audio/vad/vad_gmm.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/common_audio/vad/vad_sp.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/common_audio/vad/webrtc_vad.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/rtc_base/platform_thread_types.cc"
    "${CMAKE_CURRENT_SOURCE_DIR}/modules/audio_processing/audio_processing_impl.cc"
    "${CMAKE_CURRENT_SOURCE_DIR}/modules/audio_processing/audio_buffer.cc"
    "${CMAKE_CURRENT_SOURCE_DIR}/modules/audio_processing/audio_processing_builder_impl.cc"
    "${CMAKE_CURRENT_SOURCE_DIR}/modules/audio_processing/gain_controller2.cc"
    "${CMAKE_CURRENT_SOURCE_DIR}/modules/audio_processing/gain_control_impl.cc"
    "${CMAKE_CURRENT_SOURCE_DIR}/modules/audio_processing/high_pass_filter.cc"
    "${CMAKE_CURRENT_SOURCE_DIR}/modules/audio_processing/residual_echo_detector.cc"
)

# Filter out Android-specific files
list(FILTER WEBRTC_SOURCES EXCLUDE REGEX ".*android.*")
list(FILTER WEBRTC_SOURCES EXCLUDE REGEX ".*sdk/android.*")

# Create the internal library that combines all WebRTC components
add_library(webrtc_internal STATIC ${WEBRTC_SOURCES})

# Update target properties
target_include_directories(webrtc_internal PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${abseil_SOURCE_DIR}
    ${abseil_BINARY_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/audio
    ${CMAKE_CURRENT_SOURCE_DIR}/api
    ${CMAKE_CURRENT_SOURCE_DIR}/call
    ${CMAKE_CURRENT_SOURCE_DIR}/common_audio
    ${CMAKE_CURRENT_SOURCE_DIR}/logging
    ${CMAKE_CURRENT_SOURCE_DIR}/modules
    ${CMAKE_CURRENT_SOURCE_DIR}/rtc_base
    ${CMAKE_CURRENT_SOURCE_DIR}/system_wrappers
    ${CMAKE_CURRENT_SOURCE_DIR}/third_party
    ${CMAKE_CURRENT_SOURCE_DIR}/media
    ${CMAKE_CURRENT_SOURCE_DIR}/p2p
)

# Set compile options for webrtc_internal
target_compile_options(webrtc_internal PRIVATE
    -fno-rtti
    -fno-exceptions
    -fvisibility=hidden
    -fvisibility-inlines-hidden
    -Wall
    -Wextra
    -Wno-unused-parameter
)

# Link required libraries
target_link_libraries(webrtc_internal
    PUBLIC
    webrtc_modules
    webrtc_rtc_base
    webrtc_api
    webrtc_system_wrappers
    _deps/abseil-build/absl/types/libabsl_bad_optional_access.a
    pthread
    dl
)

# Set different compile options for C files
set_source_files_properties(
    ${WEBRTC_SOURCES}
    PROPERTIES
    COMPILE_FLAGS "-x c++"
)

foreach(source ${WEBRTC_SOURCES})
    if(${source} MATCHES "\\.c$")
        set_source_files_properties(
            ${source}
            PROPERTIES
            COMPILE_FLAGS ""
        )
    endif()
endforeach()

# Print the source files for debugging
message(STATUS "WebRTC source files:")
foreach(source ${WEBRTC_SOURCES})
    message(STATUS "${source}")
endforeach()