//Destroy if we leave the camera bounds
var _cam = view_camera[0];
var _camX = camera_get_view_x(_cam);
var _camY = camera_get_view_y(_cam);
if (!point_in_rectangle(x,y,_camX,_camY,_camX+camera_get_view_width(_cam),_camY+camera_get_view_height(_cam)))
{
	instance_destroy();	
}

if(place_meeting(x, y, obj_collision)){
	repeat(6){
	with (instance_create_depth(x,y,depth-1,oParticle)){
		debris = false;
		sprite_index = sDust
		image_angle = random(360)
		fric = 0.8
		motion_add(other.image_angle+random_range(-70,70),random_range(-4,-9))
	}
}

repeat(3){
	with (instance_create_depth(x,y,depth-1,oParticle)){
		debris = false
		sprite_index = sSpark
		fric = 0.9
		motion_add(other.image_angle+random_range(-90,90),random_range(-4,-6))
		image_angle = direction
	}
}

repeat(2){
	with (instance_create_depth(x,y,depth+5,oParticle)){
		debris = true
		sprite_index = sDebris
		image_index = random(image_number-1)
		image_speed = 0;
		fric = 0.8
		motion_add(other.image_angle+random_range(-40,40),random_range(-1,-6))
	}
}
	instance_destroy();
}