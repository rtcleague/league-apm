cmake_minimum_required(VERSION 3.4.1)

set(SRC_FILES
    source/clock.cc
    source/cpu_features.cc
    source/field_trial.cc
    source/metrics.cc
    source/rtp_to_ntp_estimator.cc
    source/sleep.cc
)

add_library(webrtc_system_wrappers STATIC ${SRC_FILES})

# Fix the include paths
target_include_directories(webrtc_system_wrappers PUBLIC 
    ${CMAKE_CURRENT_SOURCE_DIR}/..  # This allows includes like "system_wrappers/include/clock.h"
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/include
    ${CMAKE_CURRENT_SOURCE_DIR}/source
)

# Link with abseil if needed
target_link_libraries(webrtc_system_wrappers
    PRIVATE
    absl::base
    absl::strings
)

# Add compile definitions if needed
target_compile_definitions(webrtc_system_wrappers
    PRIVATE
    WEBRTC_POSIX
    WEBRTC_LINUX
)