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

	include( ${CMAKE_CURRENT_LIST_DIR}/tools/${ARG_NAME}.cmake )
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
	string( TOUPPER "${TOOL}" TYPE )
	option( BGFX_BUILD_TOOL_${TYPE} "Build bgfx tool ${TYPE}." ON  )

	if( BGFX_BUILD_TOOL_${TYPE} )
		add_tool( ${TOOL} )
	endif()
endforeach() 
