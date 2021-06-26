# bgfx.cmake - bgfx building in cmake
# Written in 2017 by Joshua Brookover <joshua.al.brookover@gmail.com>

# To the extent possible under law, the author(s) have dedicated all copyright
# and related and neighboring rights to this software to the public domain
# worldwide. This software is distributed without any warranty.

# You should have received a copy of the CC0 Public Domain Dedication along with
# this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

if( BGFX_CUSTOM_TARGETS )
	add_custom_target( tools )
	set_target_properties( tools PROPERTIES FOLDER "bgfx/tools" )
endif()

function( add_tool ARG_NAME )
	# Parse arguments
	cmake_parse_arguments( ARG "COMMON" "" "DIRECTORIES;SOURCES" ${ARGN} )
	
	include( cmake/tools/${ARG_NAME}.cmake )
endfunction()

# Add tools
set(
	BGFX_TOOLS
	geometryc
	geometryv
	shaderc
	texturec
	texturev
)

foreach( TOOL ${BGFX_TOOLS} )
	option( BGFX_BUILD_TOOL_${TOOL} "Build bgfx tool ${TOOL}." ON  )

	if( BGFX_BUILD_TOOL_${TOOL} )
		add_tool( ${TOOL} )
	endif()
endforeach()