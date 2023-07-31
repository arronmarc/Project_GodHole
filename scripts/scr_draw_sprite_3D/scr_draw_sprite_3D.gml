/*
-----------------------
	Alpha2.5D Engine
	- By REVEAM
-----------------------
*/

// Draw sprite in 3D

function draw_sprite_3D(sprite, image, x, y, z, isWall, x_frame, y_frame, frame_size, x_offset, y_offset) {
    // Calculate which part of the spritesheet to draw.
    var xpart = floor(x_frame) * frame_size;
    var ypart = floor(y_frame) * frame_size;

    var xx = x - x_offset;
    var yy = y - y_offset + z * isWall;

    // Use spr_spritesheet as sprite, 0 as subimage, and xx and yy as coordinates.
    draw_sprite_part(
        spr_spritesheet,
        0,
        xpart,
        ypart,
        frame_size,
        frame_size,
        xx,
        yy
    );
}

// Draw sprite in 3D with extensions
function draw_sprite_3D_ext(sprite, image, x, y, z, xscale, yscale, rot, col, alpha, isWall) {
	// Create vertex buffer
	var vbuff = vertex_create_buffer();
	
	vertex_begin(vbuff, global.vert_format);
	
	// Setup sprite rendering
	var texture = sprite_get_texture(sprite, image);
	
	var uvs = sprite_get_uvs(sprite, image);
	
	var spriteSize = [(uvs[2] - uvs[0]) / texture_get_texel_width(texture),
		(uvs[3] - uvs[1]) / texture_get_texel_height(texture)];
	
	var origin = [sprite_get_xoffset(sprite) - uvs[4], sprite_get_yoffset(sprite) - uvs[5]];
	
	var bounds = [[-origin[0] * xscale, -origin[1] * yscale], [(-origin[0] + spriteSize[0]) * xscale, -origin[1] * yscale],
		[-origin[0] * xscale, (-origin[1] + spriteSize[1]) * yscale], [(-origin[0] + spriteSize[0]) * xscale, (-origin[1] + spriteSize[1]) * yscale]];
	
	// Rotate vertices
	var norm = [-cos(degtorad(rot)), -sin(degtorad(rot))];
	var matrix = [[norm[0], norm[1]], [norm[1], -norm[0]]];
	bounds[0] = rotate_vert(matrix, bounds[0]);
	bounds[1] = rotate_vert(matrix, bounds[1]);
	bounds[2] = rotate_vert(matrix, bounds[2]);
	bounds[3] = rotate_vert(matrix, bounds[3]);
	
	// Add vertices
	vertex_position_3d(vbuff, x + bounds[0][0], y + bounds[0][1] + z, z + bounds[0][1] * isWall);
	vertex_color(vbuff, col, alpha);
	vertex_texcoord(vbuff, uvs[0], uvs[1]);
	
	vertex_position_3d(vbuff, x + bounds[1][0], y + bounds[1][1] + z, z + bounds[1][1] * isWall);
	vertex_color(vbuff, col, alpha);
	vertex_texcoord(vbuff, uvs[2], uvs[1]);
	
	vertex_position_3d(vbuff, x + bounds[2][0], y + bounds[2][1] + z, z + bounds[2][1] * isWall);
	vertex_color(vbuff, col, alpha);
	vertex_texcoord(vbuff, uvs[0], uvs[3]);
	
	vertex_position_3d(vbuff, x + bounds[3][0], y + bounds[3][1] + z, z + bounds[3][1] * isWall);
	vertex_color(vbuff, col, alpha);
	vertex_texcoord(vbuff, uvs[2], uvs[3]);
	
	// Stop buffer
	vertex_end(vbuff);
	
	// Draw
	vertex_submit(vbuff, pr_trianglestrip, texture);
	
	vertex_delete_buffer(vbuff);
}

// Rotate vertice using 2x2 rotation matrix
function rotate_vert(matrix, point) {
	var newPoint = [point[0] * matrix[0][0] + point[1] * matrix[0][1],
		point[0] * matrix[1][0] + point[1] * matrix[1][1]];
		
	return newPoint;
}