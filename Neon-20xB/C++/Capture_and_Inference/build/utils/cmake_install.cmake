# Install script for directory: /home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/utils

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(COPY /home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/utils/data/fontmapA.png DESTINATION /usr/local/bin )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(COPY /home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/utils/data/fontmapB.png DESTINATION /usr/local/bin )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/jetson-utils" TYPE FILE FILES "/home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/utils/XML.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/jetson-utils" TYPE FILE FILES "/home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/utils/commandLine.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/jetson-utils" TYPE FILE FILES "/home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/utils/filesystem.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/jetson-utils" TYPE FILE FILES "/home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/utils/mat33.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/jetson-utils" TYPE FILE FILES "/home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/utils/pi.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/jetson-utils" TYPE FILE FILES "/home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/utils/rand.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/jetson-utils" TYPE FILE FILES "/home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/utils/timespec.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/jetson-utils" TYPE FILE FILES "/home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/utils/camera/gstCamera.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/jetson-utils" TYPE FILE FILES "/home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/utils/camera/indCamera.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/jetson-utils" TYPE FILE FILES "/home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/utils/camera/v4l2Camera.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/jetson-utils" TYPE FILE FILES "/home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/utils/codec/gstDecoder.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/jetson-utils" TYPE FILE FILES "/home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/utils/codec/gstEncoder.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/jetson-utils" TYPE FILE FILES "/home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/utils/codec/gstUtility.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/jetson-utils" TYPE FILE FILES "/home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/utils/cuda/cudaFont.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/jetson-utils" TYPE FILE FILES "/home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/utils/cuda/cudaMappedMemory.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/jetson-utils" TYPE FILE FILES "/home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/utils/cuda/cudaNormalize.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/jetson-utils" TYPE FILE FILES "/home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/utils/cuda/cudaOverlay.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/jetson-utils" TYPE FILE FILES "/home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/utils/cuda/cudaRGB.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/jetson-utils" TYPE FILE FILES "/home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/utils/cuda/cudaResize.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/jetson-utils" TYPE FILE FILES "/home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/utils/cuda/cudaUtility.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/jetson-utils" TYPE FILE FILES "/home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/utils/cuda/cudaWarp.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/jetson-utils" TYPE FILE FILES "/home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/utils/cuda/cudaYUV.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/jetson-utils" TYPE FILE FILES "/home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/utils/display/glDisplay.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/jetson-utils" TYPE FILE FILES "/home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/utils/display/glTexture.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/jetson-utils" TYPE FILE FILES "/home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/utils/display/glUtility.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/jetson-utils" TYPE FILE FILES "/home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/utils/image/imageIO.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/jetson-utils" TYPE FILE FILES "/home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/utils/image/loadImage.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/jetson-utils" TYPE FILE FILES "/home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/utils/input/devInput.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/jetson-utils" TYPE FILE FILES "/home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/utils/input/devJoystick.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/jetson-utils" TYPE FILE FILES "/home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/utils/input/devKeyboard.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/jetson-utils" TYPE FILE FILES "/home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/utils/network/Endian.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/jetson-utils" TYPE FILE FILES "/home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/utils/network/IPv4.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/jetson-utils" TYPE FILE FILES "/home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/utils/network/NetworkAdapter.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/jetson-utils" TYPE FILE FILES "/home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/utils/network/Socket.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/jetson-utils" TYPE FILE FILES "/home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/utils/threads/Event.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/jetson-utils" TYPE FILE FILES "/home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/utils/threads/Mutex.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/jetson-utils" TYPE FILE FILES "/home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/utils/threads/Process.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/jetson-utils" TYPE FILE FILES "/home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/utils/threads/Thread.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libjetson-utils.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libjetson-utils.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libjetson-utils.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/build/aarch64/lib/libjetson-utils.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libjetson-utils.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libjetson-utils.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libjetson-utils.so"
         OLD_RPATH "/opt/pylon5/lib64:/opt/pylon5/bin:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libjetson-utils.so")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/jetson-utils/cmake/jetson-utilsConfig.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/jetson-utils/cmake/jetson-utilsConfig.cmake"
         "/home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/build/utils/CMakeFiles/Export/share/jetson-utils/cmake/jetson-utilsConfig.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/jetson-utils/cmake/jetson-utilsConfig-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/jetson-utils/cmake/jetson-utilsConfig.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/jetson-utils/cmake" TYPE FILE FILES "/home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/build/utils/CMakeFiles/Export/share/jetson-utils/cmake/jetson-utilsConfig.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/jetson-utils/cmake" TYPE FILE FILES "/home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/build/utils/CMakeFiles/Export/share/jetson-utils/cmake/jetson-utilsConfig-noconfig.cmake")
  endif()
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/build/utils/camera/camera-viewer/cmake_install.cmake")
  include("/home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/build/utils/camera/v4l2-console/cmake_install.cmake")
  include("/home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/build/utils/camera/v4l2-display/cmake_install.cmake")
  include("/home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/build/utils/display/gl-display-test/cmake_install.cmake")
  include("/home/adlink/Desktop/Samples/Neon-20xB/C++/Capture_and_Inference/build/utils/python/cmake_install.cmake")

endif()

