
if(NOT DEFINED IS_SDK)
	set(COMPILER_RT_CONFIG_LIST release debug)
	cmsdk_include_target(compiler_rt "${COMPILER_RT_CONFIG_LIST}")
endif()
