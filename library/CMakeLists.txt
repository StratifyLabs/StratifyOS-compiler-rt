
#Add sources to the project
sos_sdk_add_subdirectory(PRIVATE_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/src)

set(COMPILER_RT_NAME ${PROJECT_NAME})

sos_sdk_library_target(RELEASE ${COMPILER_RT_NAME} "" release ${SOS_ARCH})

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

sos_sdk_library_target(DEBUG ${COMPILER_RT_NAME} "" debug ${SOS_ARCH})
add_library(${DEBUG_TARGET} STATIC)
sos_sdk_copy_target(${RELEASE_TARGET} ${DEBUG_TARGET})
sos_sdk_library_add_arch_targets("${DEBUG_OPTIONS}" ${SOS_ARCH} "")
sos_sdk_library_add_arch_targets("${RELEASE_OPTIONS}" ${SOS_ARCH} "")

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


