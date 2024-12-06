include(FetchContent)

FetchContent_Declare(
    abseil
    GIT_REPOSITORY https://github.com/abseil/abseil-cpp.git
    GIT_TAG 20230125.3
)

set(ABSL_PROPAGATE_CXX_STD ON)
set(ABSL_ENABLE_INSTALL ON)
set(BUILD_TESTING OFF)
set(ABSL_USE_EXTERNAL_GOOGLETEST OFF)
set(ABSL_FIND_GOOGLETEST OFF)

FetchContent_MakeAvailable(abseil)

# Add include directories for Abseil
include_directories(${abseil_SOURCE_DIR} ${abseil_BINARY_DIR}) 