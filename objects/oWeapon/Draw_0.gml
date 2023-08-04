if (sprite != -1) && (mouse_check_button(mb_right))
{
	/* //Shadow - draws above player
	draw_sprite_ext(
		sprite, 
		image_index, 
		_x-lengthdir_x(current_recoil,direction),
		y-lengthdir_y(current_recoil,direction)-2,
		image_xscale,
		image_yscale,
		_imgAngle,
		c_navy, 
		.5
);
*/
	
	draw_sprite_ext(
	sprite,
	image_index,
	_x-lengthdir_x(current_recoil,direction),
	y-lengthdir_y(current_recoil,direction),
	image_xscale,
	image_yscale,
	_imgAngle,
	image_blend,
	image_alpha
	);
	
}



