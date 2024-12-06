cmake_minimum_required(VERSION 3.10)
project(care_audio_processing)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

# Include configurations
include(cmake/abseil.cmake)

# Add WebRTC as a subdirectory
add_subdirectory(webrtc)

# Find required packages
find_package(JNI REQUIRED)
find_package(Threads REQUIRED)

# Add include directories
include_directories(
    ${JNI_INCLUDE_DIRS}
    ${CMAKE_CURRENT_SOURCE_DIR}/main_driver/include
    ${CMAKE_CURRENT_SOURCE_DIR}/main_driver/jni
    ${CMAKE_CURRENT_SOURCE_DIR}/webrtc
    ${CMAKE_CURRENT_SOURCE_DIR}/webrtc_include
    ${CMAKE_CURRENT_SOURCE_DIR}/webrtc/common_audio/include
    ${CMAKE_CURRENT_SOURCE_DIR}/webrtc/modules/audio_processing/include
    ${CMAKE_CURRENT_SOURCE_DIR}/webrtc/modules/interface
    ${abseil_SOURCE_DIR}
)

# Add library target
add_library(care_audio_processing SHARED
    main_driver/jni/AudioProcessor_jni.cpp
    main_driver/jni/APMConfig_jni.cpp
    main_driver/src/Apm_Wrapper.cpp
)

# Link libraries
target_link_libraries(care_audio_processing PRIVATE
    webrtc_internal
    absl::base
    absl::synchronization
    absl::strings
    ${JNI_LIBRARIES}
    pthread
    dl
    rt
    m
    stdc++
    _deps/abseil-build/absl/types/libabsl_bad_optional_access.a
    _deps/abseil-build/absl/synchronization/libabsl_graphcycles_internal.a
    _deps/abseil-build/absl/debugging/libabsl_stacktrace.a
    _deps/abseil-build/absl/debugging/libabsl_symbolize.a
    _deps/abseil-build/absl/base/libabsl_malloc_internal.a
    _deps/abseil-build/absl/debugging/libabsl_debugging_internal.a
    _deps/abseil-build/absl/debugging/libabsl_demangle_internal.a
    _deps/abseil-build/absl/time/libabsl_time.a
    _deps/abseil-build/absl/strings/libabsl_strings_internal.a
    _deps/abseil-build/absl/base/libabsl_spinlock_wait.a
    _deps/abseil-build/absl/base/libabsl_throw_delegate.a
    _deps/abseil-build/absl/base/libabsl_raw_logging_internal.a
    _deps/abseil-build/absl/base/libabsl_log_severity.a
    _deps/abseil-build/absl/numeric/libabsl_int128.a
    _deps/abseil-build/absl/time/libabsl_civil_time.a
    _deps/abseil-build/absl/time/libabsl_time_zone.a
)

# Set output directory
set_target_properties(care_audio_processing PROPERTIES
    LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib
)

# Enable CMake caching
set(CMAKE_C_COMPILER_LAUNCHER ccache)
set(CMAKE_CXX_COMPILER_LAUNCHER ccache)
