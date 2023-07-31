/*
-----------------------
	Alpha2.5D Engine
	- By REVEAM
-----------------------
*/

// Tileset data
function tileset3D(sprite, sizeX, sizeY, offX, offY, sepX, sepY) constructor {
	self.sprite = sprite;
	self.texture = sprite_get_texture(sprite, 0);
	
	self.sizeX = sizeX;
	self.sizeY = sizeY;
	
	self.offX = offX;
	self.offY = offY;
	
	self.sepX = sepX;
	self.sepY = sepY;
	
	uvs = [];
	
	static generate_uvs = function() {
		// Generate uvs
		var texUVs = sprite_get_uvs(sprite, 0);
		var texelSize = [texture_get_texel_width(texture), texture_get_texel_height(texture)];
		texUVs[0] -= texUVs[4] * texelSize[0];
		texUVs[1] -= texUVs[5] * texelSize[1];
		
		// Loop over sprite
		var ty = offY;
		while (ty + sizeY <= sprite_get_height(sprite)) {
			var tx = offX;
			while (tx + sizeX <= sprite_get_width(sprite)) {
				// Get coords and add to uvs
				var tileUVs = [texUVs[0] + tx * texelSize[0],
					texUVs[1] + ty * texelSize[1],
					texUVs[0] + (tx + sizeX) * texelSize[0],
					texUVs[1] + (ty + sizeY) * texelSize[1]];
				array_push(uvs, tileUVs);
				
				tx += sizeX + sepX;
			}
			ty += sizeY + sepY;
		}
	}
}

// Tilemap data
function tilemap3D(tileset, tiles, x, y, z) constructor {
	self.tileset = tileset;
	self.tiles = tiles;
	top_buffer = -1;
	wall_buffer = -1;
	
	self.x = x;
	self.y = y;
	self.z = z;
	
	static generate_tilemaps = function() {
		// Generate buffer
		top_buffer = generate_tilemap(tileset, x, y, z, tiles[0], false);
		
		var yOff = 0;
		if (array_length(tiles) != 0) yOff = array_length(tiles[0]) * tileset.sizeY;
		wall_buffer = generate_tilemap(tileset, x, y + yOff, z, tiles[1], true);
	}
	
	static draw = function() {
		// Draw buffers if used
		if (top_buffer != -1)
			vertex_submit(top_buffer, pr_trianglelist, tileset.texture);
			
		if (wall_buffer != -1)
			vertex_submit(wall_buffer, pr_trianglelist, tileset.texture);
	}
	
	static destroy = function() {
		// Delete buffers if used
		if (top_buffer != -1) vertex_delete_buffer(top_buffer);
		if (wall_buffer != -1) vertex_delete_buffer(wall_buffer);
	}
}

// Generate tilemap vertex buffer
function generate_tilemap(tileset, x, y, z, tiles, isWall) {
	if (array_length(tiles) == 0 || array_length(tiles[0]) == 0) return -1;
	
	// Create vertex buffer
	var vbuff = vertex_create_buffer();
	
	
	vertex_begin(vbuff, global.vert_format);
	
	// Add vertices
	var yy = y + z;
	var zz = z;
	
	for (i = 0; i < array_length(tiles); ++i) {
		var xx = x;
		
		for (j = 0; j < array_length(tiles[0]); ++j) {
			if (tiles[i][j] == -1) {
				xx += tileset.sizeX;
				continue;
			}
			
			var uvs = tileset.uvs[tiles[i][j]];
			
			// Triangle 1
			// top left
			vertex_position_3d(vbuff, xx, yy, zz);
			vertex_color(vbuff, c_white, 1);
			vertex_texcoord(vbuff, uvs[0], uvs[1]);
			
			// top right
			vertex_position_3d(vbuff, xx + tileset.sizeX, yy, zz);
			vertex_color(vbuff, c_white, 1);
			vertex_texcoord(vbuff, uvs[2], uvs[1]);
			
			// bottom left
			vertex_position_3d(vbuff, xx, yy + tileset.sizeY, zz + tileset.sizeY * isWall);
			vertex_color(vbuff, c_white, 1);
			vertex_texcoord(vbuff, uvs[0], uvs[3]);
			
			// Triangle 2
			// top right
			vertex_position_3d(vbuff, xx + tileset.sizeX, yy, zz);
			vertex_color(vbuff, c_white, 1);
			vertex_texcoord(vbuff, uvs[2], uvs[1]);
			
			// bottom left
			vertex_position_3d(vbuff, xx, yy + tileset.sizeY, zz + tileset.sizeY * isWall);
			vertex_color(vbuff, c_white, 1);
			vertex_texcoord(vbuff, uvs[0], uvs[3]);
			
			// bottom right
			vertex_position_3d(vbuff, xx + tileset.sizeX, yy + tileset.sizeY, zz + tileset.sizeY * isWall);
			vertex_color(vbuff, c_white, 1);
			vertex_texcoord(vbuff, uvs[2], uvs[3]);
			
			xx += tileset.sizeX;
		}
		
		yy += tileset.sizeY;
		zz += tileset.sizeY * isWall;
	}
	show_debug_message("");
	
	// Stop buffer
	vertex_end(vbuff);
	//vertex_freeze(vbuff);
	
	// Draw
	return vbuff;
}