/*
-----------------------
	Alpha2.5D Engine
	- By REVEAM
-----------------------
*/

// Setup 3D rendering
gpu_set_ztestenable(true);
gpu_set_alphatestenable(true);

// create vertex format
vertex_format_begin();

vertex_format_add_position_3d();
vertex_format_add_color();
vertex_format_add_texcoord();

global.vert_format = vertex_format_end();