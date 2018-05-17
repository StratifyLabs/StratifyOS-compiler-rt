

#Add sources to the project
set(SOURCES_PREFIX ${CMAKE_SOURCE_DIR}/src)
add_subdirectory(src)
set(SOS_LIB_SOURCELIST ${SOURCES})


# Lib C
set(SOS_LIB_TYPE release)
set(SOS_LIB_OPTION kernel)
set(SOS_LIB_INCLUDE_DIRECTORIES include)
include(${SOS_TOOLCHAIN_CMAKE_PATH}/sos-lib-std.cmake)
