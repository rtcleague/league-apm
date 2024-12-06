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
    absl::types
    absl::optional
    ${JNI_LIBRARIES}
    pthread
    dl
    rt
    m
    stdc++
)

# Set output directory
set_target_properties(care_audio_processing PROPERTIES
    LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib
)

# Enable CMake caching
set(CMAKE_C_COMPILER_LAUNCHER ccache)
set(CMAKE_CXX_COMPILER_LAUNCHER ccache)
