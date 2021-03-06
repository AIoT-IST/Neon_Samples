# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


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
CMAKE_SOURCE_DIR = /home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/build

# Include any dependencies generated for this target.
include tools/trt-bench/CMakeFiles/trt-bench.dir/depend.make

# Include the progress variables for this target.
include tools/trt-bench/CMakeFiles/trt-bench.dir/progress.make

# Include the compile flags for this target's objects.
include tools/trt-bench/CMakeFiles/trt-bench.dir/flags.make

tools/trt-bench/CMakeFiles/trt-bench.dir/trt-bench.cpp.o: tools/trt-bench/CMakeFiles/trt-bench.dir/flags.make
tools/trt-bench/CMakeFiles/trt-bench.dir/trt-bench.cpp.o: ../tools/trt-bench/trt-bench.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tools/trt-bench/CMakeFiles/trt-bench.dir/trt-bench.cpp.o"
	cd /home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/build/tools/trt-bench && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/trt-bench.dir/trt-bench.cpp.o -c /home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/tools/trt-bench/trt-bench.cpp

tools/trt-bench/CMakeFiles/trt-bench.dir/trt-bench.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/trt-bench.dir/trt-bench.cpp.i"
	cd /home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/build/tools/trt-bench && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/tools/trt-bench/trt-bench.cpp > CMakeFiles/trt-bench.dir/trt-bench.cpp.i

tools/trt-bench/CMakeFiles/trt-bench.dir/trt-bench.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/trt-bench.dir/trt-bench.cpp.s"
	cd /home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/build/tools/trt-bench && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/tools/trt-bench/trt-bench.cpp -o CMakeFiles/trt-bench.dir/trt-bench.cpp.s

tools/trt-bench/CMakeFiles/trt-bench.dir/trt-bench.cpp.o.requires:

.PHONY : tools/trt-bench/CMakeFiles/trt-bench.dir/trt-bench.cpp.o.requires

tools/trt-bench/CMakeFiles/trt-bench.dir/trt-bench.cpp.o.provides: tools/trt-bench/CMakeFiles/trt-bench.dir/trt-bench.cpp.o.requires
	$(MAKE) -f tools/trt-bench/CMakeFiles/trt-bench.dir/build.make tools/trt-bench/CMakeFiles/trt-bench.dir/trt-bench.cpp.o.provides.build
.PHONY : tools/trt-bench/CMakeFiles/trt-bench.dir/trt-bench.cpp.o.provides

tools/trt-bench/CMakeFiles/trt-bench.dir/trt-bench.cpp.o.provides.build: tools/trt-bench/CMakeFiles/trt-bench.dir/trt-bench.cpp.o


# Object files for target trt-bench
trt__bench_OBJECTS = \
"CMakeFiles/trt-bench.dir/trt-bench.cpp.o"

# External object files for target trt-bench
trt__bench_EXTERNAL_OBJECTS =

aarch64/bin/trt-bench: tools/trt-bench/CMakeFiles/trt-bench.dir/trt-bench.cpp.o
aarch64/bin/trt-bench: tools/trt-bench/CMakeFiles/trt-bench.dir/build.make
aarch64/bin/trt-bench: /usr/local/cuda-10.2/lib64/libcudart_static.a
aarch64/bin/trt-bench: /usr/lib/aarch64-linux-gnu/librt.so
aarch64/bin/trt-bench: aarch64/lib/libjetson-inference.so
aarch64/bin/trt-bench: aarch64/lib/libjetson-utils.so
aarch64/bin/trt-bench: /usr/local/cuda-10.2/lib64/libcudart_static.a
aarch64/bin/trt-bench: /usr/lib/aarch64-linux-gnu/librt.so
aarch64/bin/trt-bench: /usr/lib/aarch64-linux-gnu/libopencv_calib3d.so.4.1.1
aarch64/bin/trt-bench: /usr/lib/aarch64-linux-gnu/libopencv_features2d.so.4.1.1
aarch64/bin/trt-bench: /usr/lib/aarch64-linux-gnu/libopencv_flann.so.4.1.1
aarch64/bin/trt-bench: /usr/lib/aarch64-linux-gnu/libopencv_imgproc.so.4.1.1
aarch64/bin/trt-bench: /usr/lib/aarch64-linux-gnu/libopencv_core.so.4.1.1
aarch64/bin/trt-bench: /usr/lib/aarch64-linux-gnu/libQtGui.so
aarch64/bin/trt-bench: /usr/lib/aarch64-linux-gnu/libQtCore.so
aarch64/bin/trt-bench: tools/trt-bench/CMakeFiles/trt-bench.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../aarch64/bin/trt-bench"
	cd /home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/build/tools/trt-bench && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/trt-bench.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tools/trt-bench/CMakeFiles/trt-bench.dir/build: aarch64/bin/trt-bench

.PHONY : tools/trt-bench/CMakeFiles/trt-bench.dir/build

tools/trt-bench/CMakeFiles/trt-bench.dir/requires: tools/trt-bench/CMakeFiles/trt-bench.dir/trt-bench.cpp.o.requires

.PHONY : tools/trt-bench/CMakeFiles/trt-bench.dir/requires

tools/trt-bench/CMakeFiles/trt-bench.dir/clean:
	cd /home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/build/tools/trt-bench && $(CMAKE_COMMAND) -P CMakeFiles/trt-bench.dir/cmake_clean.cmake
.PHONY : tools/trt-bench/CMakeFiles/trt-bench.dir/clean

tools/trt-bench/CMakeFiles/trt-bench.dir/depend:
	cd /home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference /home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/tools/trt-bench /home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/build /home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/build/tools/trt-bench /home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/build/tools/trt-bench/CMakeFiles/trt-bench.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tools/trt-bench/CMakeFiles/trt-bench.dir/depend

