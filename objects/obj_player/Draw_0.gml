//obj_player draw event

//flip the gun image depending on which side it's on
var flippo = 1;
if (facingdirection > 90) && (facingdirection < 270) { flippo = -1; } else { flippo = 1; }



//draw the gun below if facing direction <180deg (depth ordering)
//if (facingdirection<180) {
//draw_sprite_ext(sprite3,0,hipx+lengthdir_x(2,facingdirection),hipy,1,flippo,point_direction(x,y,mouse_x,mouse_y),c_white,1) }



//drawing the body
//draw_sprite_ext(sprite0,0,hipx,hipy+2*sin(degtorad(b))-6,1.8+abs(lengthdir_x(0.5,facingdirection+90)),3,0,c_white,1)

//drawing the head
//draw_sprite_ext(sprite0,0,hipx+lengthdir_x(3,facingdirection),hipy+sin(degtorad(b)+0.5)-16,0.7,1,0,c_white,1)

///drawing the IK legs
draw_set_color(c_white)
draw_leg(hipx,hipy,thigh,calf,motion_counter,4)
draw_leg(hipx,hipy,thigh,calf,motion_counter+180,-4)

//Body
for ( var i=0; i<image_number; i++ ){
	draw_sprite_ext(spr_player_body, i, x-hspeed, y-vspeed-i-20, 0.5, 0.5, facingdirection, image_blend, image_alpha);
}

// Head
for ( var i=0; i<image_number; i++ ){
	draw_sprite_ext(sprite_index, i, x-hspeed, y-vspeed-i-30, 0.3, 0.3, facingdirection, image_blend, image_alpha);
}

arm_draw()

//draw the gun above if facing direction >=180deg (depth ordering)
//if (facingdirection>=180) {
//draw_sprite_ext(sprite3,0,hipx+lengthdir_x(2,facingdirection),hipy,1,flippo,point_direction(x,y,mouse_x,mouse_y),c_white,1) }
