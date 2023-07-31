/// @desc Initialize world

/*

	Game Maker doesn't allow for using tileset assets so you have to create
	3D tilesets throught code.
	
	To make a tileset, create a new tileset3D instance and call generate_uvs.
	Generate uvs is necessary to rendering.
	
	Make sure to delete the tileset to prevent memory leaks.

*/

global.tilesets = ds_map_create();
ds_map_add(global.tilesets, "Demo", new tileset3D(spr_tileset, 32, 32, 0, 0, 0, 0));

keys = ds_map_keys_to_array(global.tilesets);
for (i = 0; i < array_length(keys); ++i)
	global.tilesets[? keys[i]].generate_uvs();

// Go to DEMO room
room_goto(r_demo);

global.iUI = instance_create_layer(0,0,layer,oUI);


global.targetRoom = -1;
global.targetX = -1;
global.targetY = -1;
global.targetDirection = 0;