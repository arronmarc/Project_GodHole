script_execute(draw_lightSources,0,0,0,0,0);

if (light_active) {
    with(oTorch) {
		var _dir = point_direction(x, y, crosshair.x, crosshair.y);
        gpu_set_blendmode(bm_normal);
        draw_sprite_ext(spr_torch, image_index, obj_player.x, obj_player.y, glowSize, glowSize, _dir, c_white, .2);
		gpu_set_blendmode(bm_subtract);
    }
}
