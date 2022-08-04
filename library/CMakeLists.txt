
#Add sources to the project
cmsdk_add_subdirectory(PRIVATE_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/src)

set(COMPILER_RT_NAME ${PROJECT_NAME})

cmsdk_library_target(RELEASE ${COMPILER_RT_NAME} "" release ${CMSDK_ARCH})

add_library(${RELEASE_TARGET} STATIC)

target_sources(${RELEASE_TARGET}
	PUBLIC
	PRIVATE
	${PRIVATE_SOURCES}
	)

target_compile_definitions(${RELEASE_TARGET}
	PUBLIC
	PRIVATE
	)

target_compile_options(${RELEASE_TARGET}
	PUBLIC
	PRIVATE
	-Os
	)


target_include_directories(${RELEASE_TARGET}
	PUBLIC
	PRIVATE
	)

cmsdk_library_target(DEBUG ${COMPILER_RT_NAME} "" debug ${CMSDK_ARCH})
add_library(${DEBUG_TARGET} STATIC)
cmsdk_copy_target(${RELEASE_TARGET} ${DEBUG_TARGET})
cmsdk_library_add_arch_targets("${DEBUG_OPTIONS}" ${CMSDK_ARCH} "")
cmsdk_library_add_arch_targets("${RELEASE_OPTIONS}" ${CMSDK_ARCH} "")

install(FILES
	${CMAKE_CURRENT_SOURCE_DIR}/compiler_rt.cmake
	DESTINATION
	${SOS_SDK_PATH}/cmake/targets)

add_custom_target(
	format
	COMMAND /usr/local/bin/clang-format
	-i
	--verbose
	${FORMAT_LIST}
	)


