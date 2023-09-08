var pr = oParticleFire;
var direction_ = irandom_range(50,130);
var speed_ = random_range(0.05,0.1);
var size = random_range(1,1.5);

//Sync
part_type_direction(pr.particleType_Fire, direction_,direction_,0,0);
part_type_speed(pr.particleType_Fire, speed_,speed_,0,0);
part_type_size(pr.particleType_Fire, size,size,-0.01,0);

part_type_direction(pr.particleType_FireOutline, direction_,direction_,0,0);
part_type_speed(pr.particleType_FireOutline, speed_,speed_,0,0);
part_type_size(pr.particleType_FireOutline, size+0.2,size+0.2,-0.01,0);

//spawn
part_emitter_region(pr.particleSystem, emitterFire,x,x,y,y,ps_shape_line,ps_distr_linear);
part_emitter_burst(pr.particleSystem, emitterFire, pr.particleType_Fire,1);

part_emitter_region(pr.particleSystemBelow, emitterFireOutline,x,x,y,y,ps_shape_line,ps_distr_linear);
part_emitter_burst(pr.particleSystemBelow, emitterFireOutline, pr.particleType_FireOutline,1);

part_emitter_region(pr.particleSystemBelow, emitterFireOutline,x,x,y,y,ps_shape_line,ps_distr_linear);
part_emitter_burst(pr.particleSystemBelow, emitterFireOutline, pr.particleType_Smoke,1);


//Destroy if we leave the camera bounds
var _cam = view_camera[0];
var _camX = camera_get_view_x(_cam);
var _camY = camera_get_view_y(_cam);

if (!point_in_rectangle(x,y,_camX,_camY,_camX+camera_get_view_width(_cam),_camY+camera_get_view_height(_cam)))
{
	instance_destroy();	
}

// Update light position
with (my_light) {
    x = other.x;
    y = other.y;
}

BulletDebris();