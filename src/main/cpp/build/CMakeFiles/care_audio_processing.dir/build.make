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
include CMakeFiles/care_audio_processing.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/care_audio_processing.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/care_audio_processing.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/care_audio_processing.dir/flags.make

CMakeFiles/care_audio_processing.dir/main_driver/jni/AudioProcessor_jni.cpp.o: CMakeFiles/care_audio_processing.dir/flags.make
CMakeFiles/care_audio_processing.dir/main_driver/jni/AudioProcessor_jni.cpp.o: ../main_driver/jni/AudioProcessor_jni.cpp
CMakeFiles/care_audio_processing.dir/main_driver/jni/AudioProcessor_jni.cpp.o: CMakeFiles/care_audio_processing.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/care_audio_processing.dir/main_driver/jni/AudioProcessor_jni.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/care_audio_processing.dir/main_driver/jni/AudioProcessor_jni.cpp.o -MF CMakeFiles/care_audio_processing.dir/main_driver/jni/AudioProcessor_jni.cpp.o.d -o CMakeFiles/care_audio_processing.dir/main_driver/jni/AudioProcessor_jni.cpp.o -c /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/main_driver/jni/AudioProcessor_jni.cpp

CMakeFiles/care_audio_processing.dir/main_driver/jni/AudioProcessor_jni.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/care_audio_processing.dir/main_driver/jni/AudioProcessor_jni.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/main_driver/jni/AudioProcessor_jni.cpp > CMakeFiles/care_audio_processing.dir/main_driver/jni/AudioProcessor_jni.cpp.i

CMakeFiles/care_audio_processing.dir/main_driver/jni/AudioProcessor_jni.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/care_audio_processing.dir/main_driver/jni/AudioProcessor_jni.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/main_driver/jni/AudioProcessor_jni.cpp -o CMakeFiles/care_audio_processing.dir/main_driver/jni/AudioProcessor_jni.cpp.s

CMakeFiles/care_audio_processing.dir/main_driver/jni/APMConfig_jni.cpp.o: CMakeFiles/care_audio_processing.dir/flags.make
CMakeFiles/care_audio_processing.dir/main_driver/jni/APMConfig_jni.cpp.o: ../main_driver/jni/APMConfig_jni.cpp
CMakeFiles/care_audio_processing.dir/main_driver/jni/APMConfig_jni.cpp.o: CMakeFiles/care_audio_processing.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/care_audio_processing.dir/main_driver/jni/APMConfig_jni.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/care_audio_processing.dir/main_driver/jni/APMConfig_jni.cpp.o -MF CMakeFiles/care_audio_processing.dir/main_driver/jni/APMConfig_jni.cpp.o.d -o CMakeFiles/care_audio_processing.dir/main_driver/jni/APMConfig_jni.cpp.o -c /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/main_driver/jni/APMConfig_jni.cpp

CMakeFiles/care_audio_processing.dir/main_driver/jni/APMConfig_jni.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/care_audio_processing.dir/main_driver/jni/APMConfig_jni.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/main_driver/jni/APMConfig_jni.cpp > CMakeFiles/care_audio_processing.dir/main_driver/jni/APMConfig_jni.cpp.i

CMakeFiles/care_audio_processing.dir/main_driver/jni/APMConfig_jni.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/care_audio_processing.dir/main_driver/jni/APMConfig_jni.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/main_driver/jni/APMConfig_jni.cpp -o CMakeFiles/care_audio_processing.dir/main_driver/jni/APMConfig_jni.cpp.s

CMakeFiles/care_audio_processing.dir/main_driver/src/Apm_Wrapper.cpp.o: CMakeFiles/care_audio_processing.dir/flags.make
CMakeFiles/care_audio_processing.dir/main_driver/src/Apm_Wrapper.cpp.o: ../main_driver/src/Apm_Wrapper.cpp
CMakeFiles/care_audio_processing.dir/main_driver/src/Apm_Wrapper.cpp.o: CMakeFiles/care_audio_processing.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/care_audio_processing.dir/main_driver/src/Apm_Wrapper.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/care_audio_processing.dir/main_driver/src/Apm_Wrapper.cpp.o -MF CMakeFiles/care_audio_processing.dir/main_driver/src/Apm_Wrapper.cpp.o.d -o CMakeFiles/care_audio_processing.dir/main_driver/src/Apm_Wrapper.cpp.o -c /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/main_driver/src/Apm_Wrapper.cpp

CMakeFiles/care_audio_processing.dir/main_driver/src/Apm_Wrapper.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/care_audio_processing.dir/main_driver/src/Apm_Wrapper.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/main_driver/src/Apm_Wrapper.cpp > CMakeFiles/care_audio_processing.dir/main_driver/src/Apm_Wrapper.cpp.i

CMakeFiles/care_audio_processing.dir/main_driver/src/Apm_Wrapper.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/care_audio_processing.dir/main_driver/src/Apm_Wrapper.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/main_driver/src/Apm_Wrapper.cpp -o CMakeFiles/care_audio_processing.dir/main_driver/src/Apm_Wrapper.cpp.s

# Object files for target care_audio_processing
care_audio_processing_OBJECTS = \
"CMakeFiles/care_audio_processing.dir/main_driver/jni/AudioProcessor_jni.cpp.o" \
"CMakeFiles/care_audio_processing.dir/main_driver/jni/APMConfig_jni.cpp.o" \
"CMakeFiles/care_audio_processing.dir/main_driver/src/Apm_Wrapper.cpp.o"

# External object files for target care_audio_processing
care_audio_processing_EXTERNAL_OBJECTS =

lib/libcare_audio_processing.so: CMakeFiles/care_audio_processing.dir/main_driver/jni/AudioProcessor_jni.cpp.o
lib/libcare_audio_processing.so: CMakeFiles/care_audio_processing.dir/main_driver/jni/APMConfig_jni.cpp.o
lib/libcare_audio_processing.so: CMakeFiles/care_audio_processing.dir/main_driver/src/Apm_Wrapper.cpp.o
lib/libcare_audio_processing.so: CMakeFiles/care_audio_processing.dir/build.make
lib/libcare_audio_processing.so: webrtc/libwebrtc_internal.a
lib/libcare_audio_processing.so: _deps/abseil-build/absl/base/libabsl_base.a
lib/libcare_audio_processing.so: _deps/abseil-build/absl/synchronization/libabsl_synchronization.a
lib/libcare_audio_processing.so: _deps/abseil-build/absl/strings/libabsl_strings.a
lib/libcare_audio_processing.so: /usr/lib/jvm/java-21-openjdk-amd64/lib/libjawt.so
lib/libcare_audio_processing.so: /usr/lib/jvm/java-21-openjdk-amd64/lib/server/libjvm.so
lib/libcare_audio_processing.so: webrtc/modules/libwebrtc_modules.a
lib/libcare_audio_processing.so: webrtc/rtc_base/libwebrtc_rtc_base.a
lib/libcare_audio_processing.so: webrtc/api/libwebrtc_api.a
lib/libcare_audio_processing.so: webrtc/rtc_base/libwebrtc_rtc_base.a
lib/libcare_audio_processing.so: webrtc/api/libwebrtc_api.a
lib/libcare_audio_processing.so: webrtc/system_wrappers/libwebrtc_system_wrappers.a
lib/libcare_audio_processing.so: _deps/abseil-build/absl/synchronization/libabsl_graphcycles_internal.a
lib/libcare_audio_processing.so: _deps/abseil-build/absl/debugging/libabsl_stacktrace.a
lib/libcare_audio_processing.so: _deps/abseil-build/absl/debugging/libabsl_symbolize.a
lib/libcare_audio_processing.so: _deps/abseil-build/absl/base/libabsl_malloc_internal.a
lib/libcare_audio_processing.so: _deps/abseil-build/absl/debugging/libabsl_debugging_internal.a
lib/libcare_audio_processing.so: _deps/abseil-build/absl/debugging/libabsl_demangle_internal.a
lib/libcare_audio_processing.so: _deps/abseil-build/absl/time/libabsl_time.a
lib/libcare_audio_processing.so: _deps/abseil-build/absl/strings/libabsl_strings.a
lib/libcare_audio_processing.so: _deps/abseil-build/absl/strings/libabsl_strings_internal.a
lib/libcare_audio_processing.so: _deps/abseil-build/absl/base/libabsl_base.a
lib/libcare_audio_processing.so: _deps/abseil-build/absl/base/libabsl_spinlock_wait.a
lib/libcare_audio_processing.so: _deps/abseil-build/absl/base/libabsl_throw_delegate.a
lib/libcare_audio_processing.so: _deps/abseil-build/absl/base/libabsl_raw_logging_internal.a
lib/libcare_audio_processing.so: _deps/abseil-build/absl/base/libabsl_log_severity.a
lib/libcare_audio_processing.so: _deps/abseil-build/absl/numeric/libabsl_int128.a
lib/libcare_audio_processing.so: _deps/abseil-build/absl/time/libabsl_civil_time.a
lib/libcare_audio_processing.so: _deps/abseil-build/absl/time/libabsl_time_zone.a
lib/libcare_audio_processing.so: CMakeFiles/care_audio_processing.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX shared library lib/libcare_audio_processing.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/care_audio_processing.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/care_audio_processing.dir/build: lib/libcare_audio_processing.so
.PHONY : CMakeFiles/care_audio_processing.dir/build

CMakeFiles/care_audio_processing.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/care_audio_processing.dir/cmake_clean.cmake
.PHONY : CMakeFiles/care_audio_processing.dir/clean

CMakeFiles/care_audio_processing.dir/depend:
	cd /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/CMakeFiles/care_audio_processing.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/care_audio_processing.dir/depend

