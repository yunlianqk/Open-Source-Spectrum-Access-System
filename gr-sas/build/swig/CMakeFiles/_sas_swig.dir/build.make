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
include swig/CMakeFiles/_sas_swig.dir/depend.make

# Include the progress variables for this target.
include swig/CMakeFiles/_sas_swig.dir/progress.make

# Include the compile flags for this target's objects.
include swig/CMakeFiles/_sas_swig.dir/flags.make

swig/sas_swigPYTHON_wrap.cxx: swig/sas_swig_swig_2d0df
	$(CMAKE_COMMAND) -E cmake_progress_report /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "dummy command to show sas_swig_swig_2d0df dependency of /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/build/swig/sas_swigPYTHON_wrap.cxx"
	cd /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/build/swig && /usr/bin/cmake -E touch_nocreate /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/build/swig/sas_swigPYTHON_wrap.cxx

swig/sas_swig.py: swig/sas_swig_swig_2d0df
	$(CMAKE_COMMAND) -E cmake_progress_report /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "dummy command to show sas_swig_swig_2d0df dependency of /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/build/swig/sas_swig.py"
	cd /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/build/swig && /usr/bin/cmake -E touch_nocreate /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/build/swig/sas_swig.py

swig/CMakeFiles/_sas_swig.dir/sas_swigPYTHON_wrap.cxx.o: swig/CMakeFiles/_sas_swig.dir/flags.make
swig/CMakeFiles/_sas_swig.dir/sas_swigPYTHON_wrap.cxx.o: swig/sas_swigPYTHON_wrap.cxx
	$(CMAKE_COMMAND) -E cmake_progress_report /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/build/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object swig/CMakeFiles/_sas_swig.dir/sas_swigPYTHON_wrap.cxx.o"
	cd /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/build/swig && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -Wno-unused-but-set-variable -o CMakeFiles/_sas_swig.dir/sas_swigPYTHON_wrap.cxx.o -c /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/build/swig/sas_swigPYTHON_wrap.cxx

swig/CMakeFiles/_sas_swig.dir/sas_swigPYTHON_wrap.cxx.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/_sas_swig.dir/sas_swigPYTHON_wrap.cxx.i"
	cd /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/build/swig && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -Wno-unused-but-set-variable -E /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/build/swig/sas_swigPYTHON_wrap.cxx > CMakeFiles/_sas_swig.dir/sas_swigPYTHON_wrap.cxx.i

swig/CMakeFiles/_sas_swig.dir/sas_swigPYTHON_wrap.cxx.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/_sas_swig.dir/sas_swigPYTHON_wrap.cxx.s"
	cd /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/build/swig && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -Wno-unused-but-set-variable -S /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/build/swig/sas_swigPYTHON_wrap.cxx -o CMakeFiles/_sas_swig.dir/sas_swigPYTHON_wrap.cxx.s

swig/CMakeFiles/_sas_swig.dir/sas_swigPYTHON_wrap.cxx.o.requires:
.PHONY : swig/CMakeFiles/_sas_swig.dir/sas_swigPYTHON_wrap.cxx.o.requires

swig/CMakeFiles/_sas_swig.dir/sas_swigPYTHON_wrap.cxx.o.provides: swig/CMakeFiles/_sas_swig.dir/sas_swigPYTHON_wrap.cxx.o.requires
	$(MAKE) -f swig/CMakeFiles/_sas_swig.dir/build.make swig/CMakeFiles/_sas_swig.dir/sas_swigPYTHON_wrap.cxx.o.provides.build
.PHONY : swig/CMakeFiles/_sas_swig.dir/sas_swigPYTHON_wrap.cxx.o.provides

swig/CMakeFiles/_sas_swig.dir/sas_swigPYTHON_wrap.cxx.o.provides.build: swig/CMakeFiles/_sas_swig.dir/sas_swigPYTHON_wrap.cxx.o

# Object files for target _sas_swig
_sas_swig_OBJECTS = \
"CMakeFiles/_sas_swig.dir/sas_swigPYTHON_wrap.cxx.o"

# External object files for target _sas_swig
_sas_swig_EXTERNAL_OBJECTS =

swig/_sas_swig.so: swig/CMakeFiles/_sas_swig.dir/sas_swigPYTHON_wrap.cxx.o
swig/_sas_swig.so: swig/CMakeFiles/_sas_swig.dir/build.make
swig/_sas_swig.so: /usr/lib/x86_64-linux-gnu/libpython2.7.so
swig/_sas_swig.so: lib/libgnuradio-sas-1.0.0git.so.0.0.0
swig/_sas_swig.so: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
swig/_sas_swig.so: /usr/lib/x86_64-linux-gnu/libboost_system.so
swig/_sas_swig.so: /home/wireless/GNURadio_2/lib/libgnuradio-runtime.so
swig/_sas_swig.so: /home/wireless/GNURadio_2/lib/libgnuradio-pmt.so
swig/_sas_swig.so: /usr/lib/libpqxx.so
swig/_sas_swig.so: swig/CMakeFiles/_sas_swig.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX shared module _sas_swig.so"
	cd /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/build/swig && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/_sas_swig.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
swig/CMakeFiles/_sas_swig.dir/build: swig/_sas_swig.so
.PHONY : swig/CMakeFiles/_sas_swig.dir/build

swig/CMakeFiles/_sas_swig.dir/requires: swig/CMakeFiles/_sas_swig.dir/sas_swigPYTHON_wrap.cxx.o.requires
.PHONY : swig/CMakeFiles/_sas_swig.dir/requires

swig/CMakeFiles/_sas_swig.dir/clean:
	cd /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/build/swig && $(CMAKE_COMMAND) -P CMakeFiles/_sas_swig.dir/cmake_clean.cmake
.PHONY : swig/CMakeFiles/_sas_swig.dir/clean

swig/CMakeFiles/_sas_swig.dir/depend: swig/sas_swigPYTHON_wrap.cxx
swig/CMakeFiles/_sas_swig.dir/depend: swig/sas_swig.py
	cd /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/swig /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/build /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/build/swig /home/wireless/git/Open-Source-Spectrum-Access-System/gr-sas/build/swig/CMakeFiles/_sas_swig.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : swig/CMakeFiles/_sas_swig.dir/depend

