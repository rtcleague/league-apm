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
CMAKE_SOURCE_DIR = /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-subbuild

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-subbuild

# Utility rule file for abseil-populate.

# Include any custom commands dependencies for this target.
include CMakeFiles/abseil-populate.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/abseil-populate.dir/progress.make

CMakeFiles/abseil-populate: CMakeFiles/abseil-populate-complete

CMakeFiles/abseil-populate-complete: abseil-populate-prefix/src/abseil-populate-stamp/abseil-populate-install
CMakeFiles/abseil-populate-complete: abseil-populate-prefix/src/abseil-populate-stamp/abseil-populate-mkdir
CMakeFiles/abseil-populate-complete: abseil-populate-prefix/src/abseil-populate-stamp/abseil-populate-download
CMakeFiles/abseil-populate-complete: abseil-populate-prefix/src/abseil-populate-stamp/abseil-populate-update
CMakeFiles/abseil-populate-complete: abseil-populate-prefix/src/abseil-populate-stamp/abseil-populate-patch
CMakeFiles/abseil-populate-complete: abseil-populate-prefix/src/abseil-populate-stamp/abseil-populate-configure
CMakeFiles/abseil-populate-complete: abseil-populate-prefix/src/abseil-populate-stamp/abseil-populate-build
CMakeFiles/abseil-populate-complete: abseil-populate-prefix/src/abseil-populate-stamp/abseil-populate-install
CMakeFiles/abseil-populate-complete: abseil-populate-prefix/src/abseil-populate-stamp/abseil-populate-test
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Completed 'abseil-populate'"
	/usr/bin/cmake -E make_directory /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-subbuild/CMakeFiles
	/usr/bin/cmake -E touch /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-subbuild/CMakeFiles/abseil-populate-complete
	/usr/bin/cmake -E touch /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-subbuild/abseil-populate-prefix/src/abseil-populate-stamp/abseil-populate-done

abseil-populate-prefix/src/abseil-populate-stamp/abseil-populate-update:
.PHONY : abseil-populate-prefix/src/abseil-populate-stamp/abseil-populate-update

abseil-populate-prefix/src/abseil-populate-stamp/abseil-populate-build: abseil-populate-prefix/src/abseil-populate-stamp/abseil-populate-configure
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "No build step for 'abseil-populate'"
	cd /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-build && /usr/bin/cmake -E echo_append
	cd /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-build && /usr/bin/cmake -E touch /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-subbuild/abseil-populate-prefix/src/abseil-populate-stamp/abseil-populate-build

abseil-populate-prefix/src/abseil-populate-stamp/abseil-populate-configure: abseil-populate-prefix/tmp/abseil-populate-cfgcmd.txt
abseil-populate-prefix/src/abseil-populate-stamp/abseil-populate-configure: abseil-populate-prefix/src/abseil-populate-stamp/abseil-populate-patch
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "No configure step for 'abseil-populate'"
	cd /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-build && /usr/bin/cmake -E echo_append
	cd /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-build && /usr/bin/cmake -E touch /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-subbuild/abseil-populate-prefix/src/abseil-populate-stamp/abseil-populate-configure

abseil-populate-prefix/src/abseil-populate-stamp/abseil-populate-download: abseil-populate-prefix/src/abseil-populate-stamp/abseil-populate-gitinfo.txt
abseil-populate-prefix/src/abseil-populate-stamp/abseil-populate-download: abseil-populate-prefix/src/abseil-populate-stamp/abseil-populate-mkdir
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Performing download step (git clone) for 'abseil-populate'"
	cd /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps && /usr/bin/cmake -P /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-subbuild/abseil-populate-prefix/tmp/abseil-populate-gitclone.cmake
	cd /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps && /usr/bin/cmake -E touch /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-subbuild/abseil-populate-prefix/src/abseil-populate-stamp/abseil-populate-download

abseil-populate-prefix/src/abseil-populate-stamp/abseil-populate-install: abseil-populate-prefix/src/abseil-populate-stamp/abseil-populate-build
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "No install step for 'abseil-populate'"
	cd /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-build && /usr/bin/cmake -E echo_append
	cd /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-build && /usr/bin/cmake -E touch /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-subbuild/abseil-populate-prefix/src/abseil-populate-stamp/abseil-populate-install

abseil-populate-prefix/src/abseil-populate-stamp/abseil-populate-mkdir:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Creating directories for 'abseil-populate'"
	/usr/bin/cmake -E make_directory /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-src
	/usr/bin/cmake -E make_directory /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-build
	/usr/bin/cmake -E make_directory /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-subbuild/abseil-populate-prefix
	/usr/bin/cmake -E make_directory /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-subbuild/abseil-populate-prefix/tmp
	/usr/bin/cmake -E make_directory /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-subbuild/abseil-populate-prefix/src/abseil-populate-stamp
	/usr/bin/cmake -E make_directory /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-subbuild/abseil-populate-prefix/src
	/usr/bin/cmake -E make_directory /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-subbuild/abseil-populate-prefix/src/abseil-populate-stamp
	/usr/bin/cmake -E touch /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-subbuild/abseil-populate-prefix/src/abseil-populate-stamp/abseil-populate-mkdir

abseil-populate-prefix/src/abseil-populate-stamp/abseil-populate-patch: abseil-populate-prefix/src/abseil-populate-stamp/abseil-populate-update
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "No patch step for 'abseil-populate'"
	/usr/bin/cmake -E echo_append
	/usr/bin/cmake -E touch /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-subbuild/abseil-populate-prefix/src/abseil-populate-stamp/abseil-populate-patch

abseil-populate-prefix/src/abseil-populate-stamp/abseil-populate-update:
.PHONY : abseil-populate-prefix/src/abseil-populate-stamp/abseil-populate-update

abseil-populate-prefix/src/abseil-populate-stamp/abseil-populate-test: abseil-populate-prefix/src/abseil-populate-stamp/abseil-populate-install
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "No test step for 'abseil-populate'"
	cd /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-build && /usr/bin/cmake -E echo_append
	cd /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-build && /usr/bin/cmake -E touch /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-subbuild/abseil-populate-prefix/src/abseil-populate-stamp/abseil-populate-test

abseil-populate-prefix/src/abseil-populate-stamp/abseil-populate-update: abseil-populate-prefix/src/abseil-populate-stamp/abseil-populate-download
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-subbuild/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Performing update step for 'abseil-populate'"
	cd /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-src && /usr/bin/cmake -P /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-subbuild/abseil-populate-prefix/tmp/abseil-populate-gitupdate.cmake

abseil-populate: CMakeFiles/abseil-populate
abseil-populate: CMakeFiles/abseil-populate-complete
abseil-populate: abseil-populate-prefix/src/abseil-populate-stamp/abseil-populate-build
abseil-populate: abseil-populate-prefix/src/abseil-populate-stamp/abseil-populate-configure
abseil-populate: abseil-populate-prefix/src/abseil-populate-stamp/abseil-populate-download
abseil-populate: abseil-populate-prefix/src/abseil-populate-stamp/abseil-populate-install
abseil-populate: abseil-populate-prefix/src/abseil-populate-stamp/abseil-populate-mkdir
abseil-populate: abseil-populate-prefix/src/abseil-populate-stamp/abseil-populate-patch
abseil-populate: abseil-populate-prefix/src/abseil-populate-stamp/abseil-populate-test
abseil-populate: abseil-populate-prefix/src/abseil-populate-stamp/abseil-populate-update
abseil-populate: CMakeFiles/abseil-populate.dir/build.make
.PHONY : abseil-populate

# Rule to build all files generated by this target.
CMakeFiles/abseil-populate.dir/build: abseil-populate
.PHONY : CMakeFiles/abseil-populate.dir/build

CMakeFiles/abseil-populate.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/abseil-populate.dir/cmake_clean.cmake
.PHONY : CMakeFiles/abseil-populate.dir/clean

CMakeFiles/abseil-populate.dir/depend:
	cd /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-subbuild && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-subbuild /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-subbuild /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-subbuild /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-subbuild /mnt/d/Projects/DND/caretalk-webrtc-apm/src/main/cpp/build/_deps/abseil-subbuild/CMakeFiles/abseil-populate.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/abseil-populate.dir/depend
