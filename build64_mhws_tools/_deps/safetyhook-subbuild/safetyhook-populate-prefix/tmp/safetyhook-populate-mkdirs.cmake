# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file LICENSE.rst or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION ${CMAKE_VERSION}) # this file comes with cmake

# If CMAKE_DISABLE_SOURCE_CHANGES is set to true and the source directory is an
# existing directory in our source tree, calling file(MAKE_DIRECTORY) on it
# would cause a fatal error, even though it would be a no-op.
if(NOT EXISTS "D:/MHWS/REFramework/build64_mhws_tools/_deps/safetyhook-src")
  file(MAKE_DIRECTORY "D:/MHWS/REFramework/build64_mhws_tools/_deps/safetyhook-src")
endif()
file(MAKE_DIRECTORY
  "D:/MHWS/REFramework/build64_mhws_tools/_deps/safetyhook-build"
  "D:/MHWS/REFramework/build64_mhws_tools/_deps/safetyhook-subbuild/safetyhook-populate-prefix"
  "D:/MHWS/REFramework/build64_mhws_tools/_deps/safetyhook-subbuild/safetyhook-populate-prefix/tmp"
  "D:/MHWS/REFramework/build64_mhws_tools/_deps/safetyhook-subbuild/safetyhook-populate-prefix/src/safetyhook-populate-stamp"
  "D:/MHWS/REFramework/build64_mhws_tools/_deps/safetyhook-subbuild/safetyhook-populate-prefix/src"
  "D:/MHWS/REFramework/build64_mhws_tools/_deps/safetyhook-subbuild/safetyhook-populate-prefix/src/safetyhook-populate-stamp"
)

set(configSubDirs Debug)
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "D:/MHWS/REFramework/build64_mhws_tools/_deps/safetyhook-subbuild/safetyhook-populate-prefix/src/safetyhook-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "D:/MHWS/REFramework/build64_mhws_tools/_deps/safetyhook-subbuild/safetyhook-populate-prefix/src/safetyhook-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
