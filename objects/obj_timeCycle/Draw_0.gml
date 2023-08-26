script_execute(draw_lightSources,0,0,0,0,0);

if (light_active) {
    with(oTorch) {
		var _dir = point_direction(x, y, crosshair.x, crosshair.y);
        draw_set_blend_mode(c_yellow);
        draw_sprite_ext(spr_torch, image_index, obj_player.x, obj_player.y-50, glowSize, glowSize, _dir, c_white, .4);
        draw_set_blend_mode(bm_normal);
    }
}