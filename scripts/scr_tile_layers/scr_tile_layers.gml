/*
-----------------------
	Alpha2.5D Engine
	- By REVEAM
-----------------------
*/

// Setup tile layer shader
function init_tile_layers() {
	var layers = layer_get_all();
	for (var i = 0; i < array_length(layers); ++i)
	   if(layer_get_element_type(layers[i]) == layerelementtype_tilemap) {
			layer_script_begin(layers[i], tile_layer_begin);   
			layer_script_end(layers[i], tile_layer_end);  
	   }
}

global.layer_shader_uniform = shader_get_uniform(sha_layer_shader, "posz");

// Setup shader
function tile_layer_begin() {
	shader_set(sha_layer_shader);
	shader_set_uniform_f(global.layer_shader_uniform, layer_get_depth(layer));
}

// Reset shader
function tile_layer_end() {
	shader_reset();
}