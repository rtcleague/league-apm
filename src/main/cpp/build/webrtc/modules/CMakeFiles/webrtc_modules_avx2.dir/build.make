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
include webrtc/modules/CMakeFiles/webrtc_modules_avx2.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include webrtc/modules/CMakeFiles/webrtc_modules_avx2.dir/compiler_depend.make

# Include the progress variables for this target.
include webrtc/modules/CMakeFiles/webrtc_modules_avx2.dir/progress.make

# Include the compile flags for this target's objects.
include webrtc/modules/CMakeFiles/webrtc_modules_avx2.dir/flags.make

webrtc/modules/CMakeFiles/webrtc_modules_avx2.dir/audio_processing/aec3/vector_math_avx2.cc.o: webrtc/modules/CMakeFiles/webrtc_modules_avx2.dir/flags.make
webrtc/modules/CMakeFiles/webrtc_modules_avx2.dir/audio_processing/aec3/vector_math_avx2.cc.o: ../webrtc/modules/audio_processing/aec3/vector_math_avx2.cc
webrtc/modules/CMakeFiles/webrtc_modules_avx2.dir/audio_processing/aec3/vector_math_avx2.cc.o: webrtc/modules/CMakeFiles/webrtc_modules_avx2.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object webrtc/modules/CMakeFiles/webrtc_modules_avx2.dir/audio_processing/aec3/vector_math_avx2.cc.o"
	cd /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/webrtc/modules && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT webrtc/modules/CMakeFiles/webrtc_modules_avx2.dir/audio_processing/aec3/vector_math_avx2.cc.o -MF CMakeFiles/webrtc_modules_avx2.dir/audio_processing/aec3/vector_math_avx2.cc.o.d -o CMakeFiles/webrtc_modules_avx2.dir/audio_processing/aec3/vector_math_avx2.cc.o -c /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/webrtc/modules/audio_processing/aec3/vector_math_avx2.cc

webrtc/modules/CMakeFiles/webrtc_modules_avx2.dir/audio_processing/aec3/vector_math_avx2.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/webrtc_modules_avx2.dir/audio_processing/aec3/vector_math_avx2.cc.i"
	cd /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/webrtc/modules && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/webrtc/modules/audio_processing/aec3/vector_math_avx2.cc > CMakeFiles/webrtc_modules_avx2.dir/audio_processing/aec3/vector_math_avx2.cc.i

webrtc/modules/CMakeFiles/webrtc_modules_avx2.dir/audio_processing/aec3/vector_math_avx2.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/webrtc_modules_avx2.dir/audio_processing/aec3/vector_math_avx2.cc.s"
	cd /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/webrtc/modules && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/webrtc/modules/audio_processing/aec3/vector_math_avx2.cc -o CMakeFiles/webrtc_modules_avx2.dir/audio_processing/aec3/vector_math_avx2.cc.s

# Object files for target webrtc_modules_avx2
webrtc_modules_avx2_OBJECTS = \
"CMakeFiles/webrtc_modules_avx2.dir/audio_processing/aec3/vector_math_avx2.cc.o"

# External object files for target webrtc_modules_avx2
webrtc_modules_avx2_EXTERNAL_OBJECTS =

webrtc/modules/libwebrtc_modules_avx2.a: webrtc/modules/CMakeFiles/webrtc_modules_avx2.dir/audio_processing/aec3/vector_math_avx2.cc.o
webrtc/modules/libwebrtc_modules_avx2.a: webrtc/modules/CMakeFiles/webrtc_modules_avx2.dir/build.make
webrtc/modules/libwebrtc_modules_avx2.a: webrtc/modules/CMakeFiles/webrtc_modules_avx2.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libwebrtc_modules_avx2.a"
	cd /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/webrtc/modules && $(CMAKE_COMMAND) -P CMakeFiles/webrtc_modules_avx2.dir/cmake_clean_target.cmake
	cd /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/webrtc/modules && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/webrtc_modules_avx2.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
webrtc/modules/CMakeFiles/webrtc_modules_avx2.dir/build: webrtc/modules/libwebrtc_modules_avx2.a
.PHONY : webrtc/modules/CMakeFiles/webrtc_modules_avx2.dir/build

webrtc/modules/CMakeFiles/webrtc_modules_avx2.dir/clean:
	cd /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/webrtc/modules && $(CMAKE_COMMAND) -P CMakeFiles/webrtc_modules_avx2.dir/cmake_clean.cmake
.PHONY : webrtc/modules/CMakeFiles/webrtc_modules_avx2.dir/clean

webrtc/modules/CMakeFiles/webrtc_modules_avx2.dir/depend:
	cd /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/webrtc/modules /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/webrtc/modules /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/webrtc/modules/CMakeFiles/webrtc_modules_avx2.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : webrtc/modules/CMakeFiles/webrtc_modules_avx2.dir/depend
