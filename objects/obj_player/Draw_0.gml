/// @desc Draw self in 3D
//draw_sprite_3D(sprite_index, image_index, x, y, z, true);

draw_sprite_3D(sprite_index, image_index, x, y, z, true, x_frame, y_frame, frame_size, x_offset, y_offset);


if(hsp != 0 or vsp != 0) {
	y_frame = dir/45;
	x_frame += anim_speed/room_speed;
	if(x_frame >= anim_length) x_frame = 0;
} else {
	x_frame = 0.9;
}
