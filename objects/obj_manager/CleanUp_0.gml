/// @desc Cleanup tilesets
keys = ds_map_keys_to_array(global.tilesets);
for (i = 0; i < array_length(keys); ++i)
	delete global.tilesets[? keys[i]];
	
ds_map_destroy(global.tilesets);