var anim_lengtho = 9;
var frame_size = 64;
var anim_speedo = 12;

if		(moveX < 0) y_frame = 9;
else if (moveX > 0) y_frame = 11;
else if (moveY < 0) y_frame = 8;
else if (moveY > 0) y_frame = 10;
else x_frame = 0;

var xx = x-x_offset;
var yy = y-y_offset;

//Increment for animation
if(x_frame + (anim_speedo/60) < anim_lengtho) { x_frame += anim_speedo/60; }
else {x_frame = 1; }

//Draw character base
draw_sprite_part(spr_base, 0, floor(x_frame)*frame_size, y_frame*frame_size, frame_size, frame_size, xx ,yy);

//Draw character feet
draw_sprite_part(spr_feet, 0, floor(x_frame)*frame_size, y_frame*frame_size, frame_size, frame_size, xx ,yy);

//Draw character legs
draw_sprite_part(spr_legs, 0, floor(x_frame)*frame_size, y_frame*frame_size, frame_size, frame_size, xx ,yy);

//Draw character shirt
draw_sprite_part(spr_torso, 0, floor(x_frame)*frame_size, y_frame*frame_size, frame_size, frame_size, xx ,yy);

//Draw character hair
draw_sprite_part(spr_hair, 0, floor(x_frame)*frame_size, y_frame*frame_size, frame_size, frame_size, xx ,yy);


//draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_yellow, c_yellow, c_yellow, c_yellow, true);









/*
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
*/