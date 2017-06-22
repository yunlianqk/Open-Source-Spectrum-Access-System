# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.2

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
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
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/build

# Include any dependencies generated for this target.
include lib/CMakeFiles/gnuradio-sas.dir/depend.make

# Include the progress variables for this target.
include lib/CMakeFiles/gnuradio-sas.dir/progress.make

# Include the compile flags for this target's objects.
include lib/CMakeFiles/gnuradio-sas.dir/flags.make

lib/CMakeFiles/gnuradio-sas.dir/psql_insert_impl.cc.o: lib/CMakeFiles/gnuradio-sas.dir/flags.make
lib/CMakeFiles/gnuradio-sas.dir/psql_insert_impl.cc.o: ../lib/psql_insert_impl.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object lib/CMakeFiles/gnuradio-sas.dir/psql_insert_impl.cc.o"
	cd /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/build/lib && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/gnuradio-sas.dir/psql_insert_impl.cc.o -c /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/lib/psql_insert_impl.cc

lib/CMakeFiles/gnuradio-sas.dir/psql_insert_impl.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gnuradio-sas.dir/psql_insert_impl.cc.i"
	cd /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/build/lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/lib/psql_insert_impl.cc > CMakeFiles/gnuradio-sas.dir/psql_insert_impl.cc.i

lib/CMakeFiles/gnuradio-sas.dir/psql_insert_impl.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gnuradio-sas.dir/psql_insert_impl.cc.s"
	cd /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/build/lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/lib/psql_insert_impl.cc -o CMakeFiles/gnuradio-sas.dir/psql_insert_impl.cc.s

lib/CMakeFiles/gnuradio-sas.dir/psql_insert_impl.cc.o.requires:
.PHONY : lib/CMakeFiles/gnuradio-sas.dir/psql_insert_impl.cc.o.requires

lib/CMakeFiles/gnuradio-sas.dir/psql_insert_impl.cc.o.provides: lib/CMakeFiles/gnuradio-sas.dir/psql_insert_impl.cc.o.requires
	$(MAKE) -f lib/CMakeFiles/gnuradio-sas.dir/build.make lib/CMakeFiles/gnuradio-sas.dir/psql_insert_impl.cc.o.provides.build
.PHONY : lib/CMakeFiles/gnuradio-sas.dir/psql_insert_impl.cc.o.provides

lib/CMakeFiles/gnuradio-sas.dir/psql_insert_impl.cc.o.provides.build: lib/CMakeFiles/gnuradio-sas.dir/psql_insert_impl.cc.o

lib/CMakeFiles/gnuradio-sas.dir/sas_buffer_impl.cc.o: lib/CMakeFiles/gnuradio-sas.dir/flags.make
lib/CMakeFiles/gnuradio-sas.dir/sas_buffer_impl.cc.o: ../lib/sas_buffer_impl.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object lib/CMakeFiles/gnuradio-sas.dir/sas_buffer_impl.cc.o"
	cd /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/build/lib && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/gnuradio-sas.dir/sas_buffer_impl.cc.o -c /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/lib/sas_buffer_impl.cc

lib/CMakeFiles/gnuradio-sas.dir/sas_buffer_impl.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gnuradio-sas.dir/sas_buffer_impl.cc.i"
	cd /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/build/lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/lib/sas_buffer_impl.cc > CMakeFiles/gnuradio-sas.dir/sas_buffer_impl.cc.i

lib/CMakeFiles/gnuradio-sas.dir/sas_buffer_impl.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gnuradio-sas.dir/sas_buffer_impl.cc.s"
	cd /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/build/lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/lib/sas_buffer_impl.cc -o CMakeFiles/gnuradio-sas.dir/sas_buffer_impl.cc.s

lib/CMakeFiles/gnuradio-sas.dir/sas_buffer_impl.cc.o.requires:
.PHONY : lib/CMakeFiles/gnuradio-sas.dir/sas_buffer_impl.cc.o.requires

lib/CMakeFiles/gnuradio-sas.dir/sas_buffer_impl.cc.o.provides: lib/CMakeFiles/gnuradio-sas.dir/sas_buffer_impl.cc.o.requires
	$(MAKE) -f lib/CMakeFiles/gnuradio-sas.dir/build.make lib/CMakeFiles/gnuradio-sas.dir/sas_buffer_impl.cc.o.provides.build
.PHONY : lib/CMakeFiles/gnuradio-sas.dir/sas_buffer_impl.cc.o.provides

lib/CMakeFiles/gnuradio-sas.dir/sas_buffer_impl.cc.o.provides.build: lib/CMakeFiles/gnuradio-sas.dir/sas_buffer_impl.cc.o

lib/CMakeFiles/gnuradio-sas.dir/ed_threshold_impl.cc.o: lib/CMakeFiles/gnuradio-sas.dir/flags.make
lib/CMakeFiles/gnuradio-sas.dir/ed_threshold_impl.cc.o: ../lib/ed_threshold_impl.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/build/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object lib/CMakeFiles/gnuradio-sas.dir/ed_threshold_impl.cc.o"
	cd /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/build/lib && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/gnuradio-sas.dir/ed_threshold_impl.cc.o -c /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/lib/ed_threshold_impl.cc

lib/CMakeFiles/gnuradio-sas.dir/ed_threshold_impl.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gnuradio-sas.dir/ed_threshold_impl.cc.i"
	cd /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/build/lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/lib/ed_threshold_impl.cc > CMakeFiles/gnuradio-sas.dir/ed_threshold_impl.cc.i

lib/CMakeFiles/gnuradio-sas.dir/ed_threshold_impl.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gnuradio-sas.dir/ed_threshold_impl.cc.s"
	cd /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/build/lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/lib/ed_threshold_impl.cc -o CMakeFiles/gnuradio-sas.dir/ed_threshold_impl.cc.s

lib/CMakeFiles/gnuradio-sas.dir/ed_threshold_impl.cc.o.requires:
.PHONY : lib/CMakeFiles/gnuradio-sas.dir/ed_threshold_impl.cc.o.requires

lib/CMakeFiles/gnuradio-sas.dir/ed_threshold_impl.cc.o.provides: lib/CMakeFiles/gnuradio-sas.dir/ed_threshold_impl.cc.o.requires
	$(MAKE) -f lib/CMakeFiles/gnuradio-sas.dir/build.make lib/CMakeFiles/gnuradio-sas.dir/ed_threshold_impl.cc.o.provides.build
.PHONY : lib/CMakeFiles/gnuradio-sas.dir/ed_threshold_impl.cc.o.provides

lib/CMakeFiles/gnuradio-sas.dir/ed_threshold_impl.cc.o.provides.build: lib/CMakeFiles/gnuradio-sas.dir/ed_threshold_impl.cc.o

# Object files for target gnuradio-sas
gnuradio__sas_OBJECTS = \
"CMakeFiles/gnuradio-sas.dir/psql_insert_impl.cc.o" \
"CMakeFiles/gnuradio-sas.dir/sas_buffer_impl.cc.o" \
"CMakeFiles/gnuradio-sas.dir/ed_threshold_impl.cc.o"

# External object files for target gnuradio-sas
gnuradio__sas_EXTERNAL_OBJECTS =

lib/libgnuradio-sas-1.0.0git.so.0.0.0: lib/CMakeFiles/gnuradio-sas.dir/psql_insert_impl.cc.o
lib/libgnuradio-sas-1.0.0git.so.0.0.0: lib/CMakeFiles/gnuradio-sas.dir/sas_buffer_impl.cc.o
lib/libgnuradio-sas-1.0.0git.so.0.0.0: lib/CMakeFiles/gnuradio-sas.dir/ed_threshold_impl.cc.o
lib/libgnuradio-sas-1.0.0git.so.0.0.0: lib/CMakeFiles/gnuradio-sas.dir/build.make
lib/libgnuradio-sas-1.0.0git.so.0.0.0: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
lib/libgnuradio-sas-1.0.0git.so.0.0.0: /usr/lib/x86_64-linux-gnu/libboost_system.so
lib/libgnuradio-sas-1.0.0git.so.0.0.0: /home/wireless/GNURadio_2/lib/libgnuradio-runtime.so
lib/libgnuradio-sas-1.0.0git.so.0.0.0: /home/wireless/GNURadio_2/lib/libgnuradio-pmt.so
lib/libgnuradio-sas-1.0.0git.so.0.0.0: /usr/lib/libpqxx.so
lib/libgnuradio-sas-1.0.0git.so.0.0.0: lib/CMakeFiles/gnuradio-sas.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared library libgnuradio-sas-1.0.0git.so"
	cd /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/build/lib && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/gnuradio-sas.dir/link.txt --verbose=$(VERBOSE)
	cd /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/build/lib && $(CMAKE_COMMAND) -E cmake_symlink_library libgnuradio-sas-1.0.0git.so.0.0.0 libgnuradio-sas-1.0.0git.so.0.0.0 libgnuradio-sas-1.0.0git.so
	cd /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/build/lib && /usr/bin/cmake -E create_symlink libgnuradio-sas-1.0.0git.so.0.0.0 /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/build/lib/libgnuradio-sas.so
	cd /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/build/lib && /usr/bin/cmake -E create_symlink libgnuradio-sas-1.0.0git.so.0.0.0 /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/build/lib/libgnuradio-sas-1.0.0git.so.0
	cd /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/build/lib && /usr/bin/cmake -E touch libgnuradio-sas-1.0.0git.so.0.0.0

lib/libgnuradio-sas-1.0.0git.so: lib/libgnuradio-sas-1.0.0git.so.0.0.0
	@$(CMAKE_COMMAND) -E touch_nocreate lib/libgnuradio-sas-1.0.0git.so

# Rule to build all files generated by this target.
lib/CMakeFiles/gnuradio-sas.dir/build: lib/libgnuradio-sas-1.0.0git.so
.PHONY : lib/CMakeFiles/gnuradio-sas.dir/build

lib/CMakeFiles/gnuradio-sas.dir/requires: lib/CMakeFiles/gnuradio-sas.dir/psql_insert_impl.cc.o.requires
lib/CMakeFiles/gnuradio-sas.dir/requires: lib/CMakeFiles/gnuradio-sas.dir/sas_buffer_impl.cc.o.requires
lib/CMakeFiles/gnuradio-sas.dir/requires: lib/CMakeFiles/gnuradio-sas.dir/ed_threshold_impl.cc.o.requires
.PHONY : lib/CMakeFiles/gnuradio-sas.dir/requires

lib/CMakeFiles/gnuradio-sas.dir/clean:
	cd /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/build/lib && $(CMAKE_COMMAND) -P CMakeFiles/gnuradio-sas.dir/cmake_clean.cmake
.PHONY : lib/CMakeFiles/gnuradio-sas.dir/clean

lib/CMakeFiles/gnuradio-sas.dir/depend:
	cd /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/lib /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/build /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/build/lib /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/build/lib/CMakeFiles/gnuradio-sas.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : lib/CMakeFiles/gnuradio-sas.dir/depend

