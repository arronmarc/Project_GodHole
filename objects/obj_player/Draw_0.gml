xpart = floor(x_frame) * frame_size;
ypart = floor(y_frame) * frame_size;
xx = x - x_offset;
yy = y - y_offset;

draw_sprite_part_ext(
		spr_spritesheet, 
		0, 
		xpart+2, 
		ypart+2,
		frame_size, 
		frame_size, 
		xx, 
		yy, 
		image_xscale, 
		image_yscale, 
		c_navy, 
		.2
);




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


if(moveX != 0 or moveY != 0) {
	y_frame = dir/45;
	x_frame += anim_speed/room_speed;
	if(x_frame >= anim_length) x_frame = 0;
} else {
	x_frame = 0.9;
}
