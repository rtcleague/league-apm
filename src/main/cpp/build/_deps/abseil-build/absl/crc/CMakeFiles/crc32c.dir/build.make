# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build

# Include any dependencies generated for this target.
include _deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include _deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/compiler_depend.make

# Include the progress variables for this target.
include _deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/progress.make

# Include the compile flags for this target's objects.
include _deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/flags.make

_deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/crc32c.cc.o: _deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/flags.make
_deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/crc32c.cc.o: _deps/abseil-src/absl/crc/crc32c.cc
_deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/crc32c.cc.o: _deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object _deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/crc32c.cc.o"
	cd /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-build/absl/crc && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT _deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/crc32c.cc.o -MF CMakeFiles/crc32c.dir/crc32c.cc.o.d -o CMakeFiles/crc32c.dir/crc32c.cc.o -c /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-src/absl/crc/crc32c.cc

_deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/crc32c.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/crc32c.dir/crc32c.cc.i"
	cd /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-build/absl/crc && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-src/absl/crc/crc32c.cc > CMakeFiles/crc32c.dir/crc32c.cc.i

_deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/crc32c.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/crc32c.dir/crc32c.cc.s"
	cd /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-build/absl/crc && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-src/absl/crc/crc32c.cc -o CMakeFiles/crc32c.dir/crc32c.cc.s

_deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/internal/crc_memcpy_fallback.cc.o: _deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/flags.make
_deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/internal/crc_memcpy_fallback.cc.o: _deps/abseil-src/absl/crc/internal/crc_memcpy_fallback.cc
_deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/internal/crc_memcpy_fallback.cc.o: _deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object _deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/internal/crc_memcpy_fallback.cc.o"
	cd /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-build/absl/crc && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT _deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/internal/crc_memcpy_fallback.cc.o -MF CMakeFiles/crc32c.dir/internal/crc_memcpy_fallback.cc.o.d -o CMakeFiles/crc32c.dir/internal/crc_memcpy_fallback.cc.o -c /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-src/absl/crc/internal/crc_memcpy_fallback.cc

_deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/internal/crc_memcpy_fallback.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/crc32c.dir/internal/crc_memcpy_fallback.cc.i"
	cd /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-build/absl/crc && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-src/absl/crc/internal/crc_memcpy_fallback.cc > CMakeFiles/crc32c.dir/internal/crc_memcpy_fallback.cc.i

_deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/internal/crc_memcpy_fallback.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/crc32c.dir/internal/crc_memcpy_fallback.cc.s"
	cd /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-build/absl/crc && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-src/absl/crc/internal/crc_memcpy_fallback.cc -o CMakeFiles/crc32c.dir/internal/crc_memcpy_fallback.cc.s

_deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/internal/crc_memcpy_x86_64.cc.o: _deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/flags.make
_deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/internal/crc_memcpy_x86_64.cc.o: _deps/abseil-src/absl/crc/internal/crc_memcpy_x86_64.cc
_deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/internal/crc_memcpy_x86_64.cc.o: _deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object _deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/internal/crc_memcpy_x86_64.cc.o"
	cd /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-build/absl/crc && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT _deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/internal/crc_memcpy_x86_64.cc.o -MF CMakeFiles/crc32c.dir/internal/crc_memcpy_x86_64.cc.o.d -o CMakeFiles/crc32c.dir/internal/crc_memcpy_x86_64.cc.o -c /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-src/absl/crc/internal/crc_memcpy_x86_64.cc

_deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/internal/crc_memcpy_x86_64.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/crc32c.dir/internal/crc_memcpy_x86_64.cc.i"
	cd /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-build/absl/crc && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-src/absl/crc/internal/crc_memcpy_x86_64.cc > CMakeFiles/crc32c.dir/internal/crc_memcpy_x86_64.cc.i

_deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/internal/crc_memcpy_x86_64.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/crc32c.dir/internal/crc_memcpy_x86_64.cc.s"
	cd /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-build/absl/crc && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-src/absl/crc/internal/crc_memcpy_x86_64.cc -o CMakeFiles/crc32c.dir/internal/crc_memcpy_x86_64.cc.s

_deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/internal/crc_non_temporal_memcpy.cc.o: _deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/flags.make
_deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/internal/crc_non_temporal_memcpy.cc.o: _deps/abseil-src/absl/crc/internal/crc_non_temporal_memcpy.cc
_deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/internal/crc_non_temporal_memcpy.cc.o: _deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object _deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/internal/crc_non_temporal_memcpy.cc.o"
	cd /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-build/absl/crc && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT _deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/internal/crc_non_temporal_memcpy.cc.o -MF CMakeFiles/crc32c.dir/internal/crc_non_temporal_memcpy.cc.o.d -o CMakeFiles/crc32c.dir/internal/crc_non_temporal_memcpy.cc.o -c /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-src/absl/crc/internal/crc_non_temporal_memcpy.cc

_deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/internal/crc_non_temporal_memcpy.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/crc32c.dir/internal/crc_non_temporal_memcpy.cc.i"
	cd /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-build/absl/crc && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-src/absl/crc/internal/crc_non_temporal_memcpy.cc > CMakeFiles/crc32c.dir/internal/crc_non_temporal_memcpy.cc.i

_deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/internal/crc_non_temporal_memcpy.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/crc32c.dir/internal/crc_non_temporal_memcpy.cc.s"
	cd /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-build/absl/crc && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-src/absl/crc/internal/crc_non_temporal_memcpy.cc -o CMakeFiles/crc32c.dir/internal/crc_non_temporal_memcpy.cc.s

# Object files for target crc32c
crc32c_OBJECTS = \
"CMakeFiles/crc32c.dir/crc32c.cc.o" \
"CMakeFiles/crc32c.dir/internal/crc_memcpy_fallback.cc.o" \
"CMakeFiles/crc32c.dir/internal/crc_memcpy_x86_64.cc.o" \
"CMakeFiles/crc32c.dir/internal/crc_non_temporal_memcpy.cc.o"

# External object files for target crc32c
crc32c_EXTERNAL_OBJECTS =

_deps/abseil-build/absl/crc/libabsl_crc32c.a: _deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/crc32c.cc.o
_deps/abseil-build/absl/crc/libabsl_crc32c.a: _deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/internal/crc_memcpy_fallback.cc.o
_deps/abseil-build/absl/crc/libabsl_crc32c.a: _deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/internal/crc_memcpy_x86_64.cc.o
_deps/abseil-build/absl/crc/libabsl_crc32c.a: _deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/internal/crc_non_temporal_memcpy.cc.o
_deps/abseil-build/absl/crc/libabsl_crc32c.a: _deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/build.make
_deps/abseil-build/absl/crc/libabsl_crc32c.a: _deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX static library libabsl_crc32c.a"
	cd /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-build/absl/crc && $(CMAKE_COMMAND) -P CMakeFiles/crc32c.dir/cmake_clean_target.cmake
	cd /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-build/absl/crc && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/crc32c.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
_deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/build: _deps/abseil-build/absl/crc/libabsl_crc32c.a
.PHONY : _deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/build

_deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/clean:
	cd /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-build/absl/crc && $(CMAKE_COMMAND) -P CMakeFiles/crc32c.dir/cmake_clean.cmake
.PHONY : _deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/clean

_deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/depend:
	cd /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-src/absl/crc /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-build/absl/crc /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : _deps/abseil-build/absl/crc/CMakeFiles/crc32c.dir/depend
