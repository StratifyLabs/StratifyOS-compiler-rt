cmake_minimum_required (VERSION 3.12)
cmsdk2_minimum_required(2.1.2)

project(compiler_rt
  LANGUAGES C ASM
  VERSION 1.2.1)

add_subdirectory(library library)
