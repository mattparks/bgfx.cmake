# bgfx.cmake - bgfx building in cmake
# Written in 2017 by Joshua Brookover <joshua.al.brookover@gmail.com>

# To the extent possible under law, the author(s) have dedicated all copyright
# and related and neighboring rights to this software to the public domain
# worldwide. This software is distributed without any warranty.

# You should have received a copy of the CC0 Public Domain Dedication along with
# this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

include( cmake/3rdparty/dear-imgui.cmake )
include( cmake/3rdparty/meshoptimizer.cmake )

include( cmake/example-common.cmake )

# Build all examples target
if( BGFX_CUSTOM_TARGETS )
	add_custom_target( examples )
	set_target_properties( examples PROPERTIES FOLDER "bgfx/examples" )
endif()

# Add examples
set(
	BGFX_EXAMPLES
	00-helloworld
	01-cubes
	02-metaballs
	03-raymarch
	04-mesh
	05-instancing
	06-bump
	07-callback
	08-update
	09-hdr
	10-font
	11-fontsdf
	12-lod
	13-stencil
	14-shadowvolumes
	15-shadowmaps-simple
	16-shadowmaps
	17-drawstress
	18-ibl
	19-oit
	20-nanovg
	21-deferred
	22-windows
	23-vectordisplay
	24-nbody
	25-c99
	26-occlusion
	27-terrain
	28-wireframe
	29-debugdraw
	30-picking
	31-rsm
	32-particles
	33-pom
	34-mvs
	35-dynamic
	36-sky
	37-gpudrivenrendering
	38-bloom
	39-assao
	40-svt
	41-tess
	42-bunnylod
	43-denoise
	44-sss
	45-bokeh
)

foreach( EXAMPLE ${BGFX_EXAMPLES} )
	option( BGFX_BUILD_EXAMPLE_${EXAMPLE} "Build bgfx example ${EXAMPLE}." ON  )

	if( BGFX_BUILD_TOOL_${EXAMPLE} )
		add_example( ${EXAMPLE} )
	endif()
endforeach()
