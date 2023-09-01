function BulletDebrisEnemies(){

//Object dust and debris collisions
if(place_meeting(x, y, obj_collision)) or (place_meeting(x, y, oBreakableParent)) or (place_meeting(x, y, wall_obj)){
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
	light.RemoveFromRenderer(objLightController.renderer);
	instance_destroy();
}

with (oBulletEnemy) {
if(place_meeting(x, y, obj_player)){
	repeat(6){
	with (instance_create_depth(x,y,depth-1,oParticle)){
		debris = false;
		sprite_index = sBloodCircles
		image_angle = random(360)
		fric = 0.8
		motion_add(other.image_angle+random_range(-70,70),random_range(-4,-9))
	}
}

repeat(3){
	with (instance_create_depth(x,y,depth-1,oParticle)){
		debris = false
		sprite_index = sBloodSpurts
		fric = 0.9
		motion_add(other.image_angle+random_range(-90,90),random_range(-4,-6))
		image_angle = direction
	}
}

repeat(2){
	with (instance_create_depth(x,y,depth+5,oParticle)){
		debris = true
		sprite_index = sBloodPools
		image_index = random(image_number-1)
		image_speed = 0;
		fric = 0.8
		motion_add(other.image_angle+random_range(-40,40),random_range(-1,-6))
	}
}
	light.RemoveFromRenderer(objLightController.renderer);
	instance_destroy();
}
}

}