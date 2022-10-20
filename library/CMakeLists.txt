cmsdk2_add_library(
	NAME ${PROJECT_NAME}
	CONFIG release
	ARCH ${CMSDK_ARCH}
	TARGET RELEASE_TARGET)
cmsdk2_add_sources(
	TARGET ${RELEASE_TARGET}
	DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/src
	VISIBILITY PRIVATE)
target_compile_options(${RELEASE_TARGET}
	PUBLIC
	PRIVATE
	-Os)
cmsdk2_add_library(
	NAME ${PROJECT_NAME}
	CONFIG debug
	ARCH ${CMSDK_ARCH}
	TARGET DEBUG_TARGET)
cmsdk2_copy_target(
	SOURCE ${RELEASE_TARGET}
	DESTINATION ${DEBUG_TARGET})
cmsdk2_library_add_dependencies(
	TARGET ${RELEASE_TARGET})
cmsdk2_library_add_dependencies(
	TARGET ${DEBUG_TARGET})
install(FILES
	${CMAKE_CURRENT_SOURCE_DIR}/compiler_rt.cmake
	DESTINATION
	${CMSDK_PATH}/cmake/targets)

