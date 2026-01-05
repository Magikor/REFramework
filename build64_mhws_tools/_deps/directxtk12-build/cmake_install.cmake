# Install script for directory: D:/MHWS/REFramework/build64_mhws_tools/_deps/directxtk12-src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Program Files/reframework")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
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

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/MHWS/REFramework/build64_mhws_tools/lib/Debug/DirectXTK12.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/MHWS/REFramework/build64_mhws_tools/lib/Release/DirectXTK12.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/MHWS/REFramework/build64_mhws_tools/lib/MinSizeRel/DirectXTK12.lib")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/MHWS/REFramework/build64_mhws_tools/lib/RelWithDebInfo/DirectXTK12.lib")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/directxtk12/DirectXTK12-targets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/directxtk12/DirectXTK12-targets.cmake"
         "D:/MHWS/REFramework/build64_mhws_tools/_deps/directxtk12-build/CMakeFiles/Export/dc79b1416ca4e830525952dfb83a96c7/DirectXTK12-targets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/directxtk12/DirectXTK12-targets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/share/directxtk12/DirectXTK12-targets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/directxtk12" TYPE FILE FILES "D:/MHWS/REFramework/build64_mhws_tools/_deps/directxtk12-build/CMakeFiles/Export/dc79b1416ca4e830525952dfb83a96c7/DirectXTK12-targets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/directxtk12" TYPE FILE FILES "D:/MHWS/REFramework/build64_mhws_tools/_deps/directxtk12-build/CMakeFiles/Export/dc79b1416ca4e830525952dfb83a96c7/DirectXTK12-targets-debug.cmake")
  endif()
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/directxtk12" TYPE FILE FILES "D:/MHWS/REFramework/build64_mhws_tools/_deps/directxtk12-build/CMakeFiles/Export/dc79b1416ca4e830525952dfb83a96c7/DirectXTK12-targets-minsizerel.cmake")
  endif()
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/directxtk12" TYPE FILE FILES "D:/MHWS/REFramework/build64_mhws_tools/_deps/directxtk12-build/CMakeFiles/Export/dc79b1416ca4e830525952dfb83a96c7/DirectXTK12-targets-relwithdebinfo.cmake")
  endif()
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/directxtk12" TYPE FILE FILES "D:/MHWS/REFramework/build64_mhws_tools/_deps/directxtk12-build/CMakeFiles/Export/dc79b1416ca4e830525952dfb83a96c7/DirectXTK12-targets-release.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/directxtk12" TYPE FILE FILES
    "D:/MHWS/REFramework/build64_mhws_tools/_deps/directxtk12-src/Inc/BufferHelpers.h"
    "D:/MHWS/REFramework/build64_mhws_tools/_deps/directxtk12-src/Inc/CommonStates.h"
    "D:/MHWS/REFramework/build64_mhws_tools/_deps/directxtk12-src/Inc/DDSTextureLoader.h"
    "D:/MHWS/REFramework/build64_mhws_tools/_deps/directxtk12-src/Inc/DescriptorHeap.h"
    "D:/MHWS/REFramework/build64_mhws_tools/_deps/directxtk12-src/Inc/DirectXHelpers.h"
    "D:/MHWS/REFramework/build64_mhws_tools/_deps/directxtk12-src/Inc/Effects.h"
    "D:/MHWS/REFramework/build64_mhws_tools/_deps/directxtk12-src/Inc/EffectPipelineStateDescription.h"
    "D:/MHWS/REFramework/build64_mhws_tools/_deps/directxtk12-src/Inc/GeometricPrimitive.h"
    "D:/MHWS/REFramework/build64_mhws_tools/_deps/directxtk12-src/Inc/GraphicsMemory.h"
    "D:/MHWS/REFramework/build64_mhws_tools/_deps/directxtk12-src/Inc/Model.h"
    "D:/MHWS/REFramework/build64_mhws_tools/_deps/directxtk12-src/Inc/PostProcess.h"
    "D:/MHWS/REFramework/build64_mhws_tools/_deps/directxtk12-src/Inc/PrimitiveBatch.h"
    "D:/MHWS/REFramework/build64_mhws_tools/_deps/directxtk12-src/Inc/RenderTargetState.h"
    "D:/MHWS/REFramework/build64_mhws_tools/_deps/directxtk12-src/Inc/ResourceUploadBatch.h"
    "D:/MHWS/REFramework/build64_mhws_tools/_deps/directxtk12-src/Inc/ScreenGrab.h"
    "D:/MHWS/REFramework/build64_mhws_tools/_deps/directxtk12-src/Inc/SpriteBatch.h"
    "D:/MHWS/REFramework/build64_mhws_tools/_deps/directxtk12-src/Inc/SpriteFont.h"
    "D:/MHWS/REFramework/build64_mhws_tools/_deps/directxtk12-src/Inc/VertexTypes.h"
    "D:/MHWS/REFramework/build64_mhws_tools/_deps/directxtk12-src/Inc/WICTextureLoader.h"
    "D:/MHWS/REFramework/build64_mhws_tools/_deps/directxtk12-src/Inc/GamePad.h"
    "D:/MHWS/REFramework/build64_mhws_tools/_deps/directxtk12-src/Inc/Keyboard.h"
    "D:/MHWS/REFramework/build64_mhws_tools/_deps/directxtk12-src/Inc/Mouse.h"
    "D:/MHWS/REFramework/build64_mhws_tools/_deps/directxtk12-src/Inc/SimpleMath.h"
    "D:/MHWS/REFramework/build64_mhws_tools/_deps/directxtk12-src/Inc/SimpleMath.inl"
    "D:/MHWS/REFramework/build64_mhws_tools/_deps/directxtk12-src/Inc/Audio.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/directxtk12" TYPE FILE FILES
    "D:/MHWS/REFramework/build64_mhws_tools/_deps/directxtk12-build/directxtk12-config.cmake"
    "D:/MHWS/REFramework/build64_mhws_tools/_deps/directxtk12-build/directxtk12-config-version.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "D:/MHWS/REFramework/build64_mhws_tools/_deps/directxtk12-build/DirectXTK12.pc")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "D:/MHWS/REFramework/build64_mhws_tools/_deps/directxtk12-build/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
