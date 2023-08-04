//Resize the grid
var inst_num = instance_number(par_depthobject);
var dgrid = ds_depthgrid;

if(ds_grid_height(dgrid) != inst_num){
ds_grid_resize(dgrid, 2, inst_num);
}

//Add instances to the grid
var yy = 0; with(par_depthobject){
	dgrid[# 0, yy] = id;
	dgrid[# 1, yy] = y;
	yy += 1;
}

//Sort the grid in ascending order
ds_grid_sort(dgrid, 1, true);

//Loop through the grid and draw all the instances
var inst; yy = 0; repeat(inst_num){
	//Pull out an ID
	inst = dgrid[# 0, yy];
	//Draw yourself
	with(inst){
		//Check if instance is of oWeapon type
        event_perform(ev_draw, 0);
	}
	yy += 1;
}


if(!surface_exists(shadowSurface)){
	shadowSurface = surface_create(750, 420);	
}

var viewX = camera_get_view_x(view_camera[0]);
var viewY = camera_get_view_y(view_camera[0]);

surface_set_target(shadowSurface);
draw_clear_alpha(c_black, 0);

/*
var sx = 10;
var sy = 15;

gpu_set_fog(true, c_navy, 0, 1);
with(oWeaponPickup){
draw_sprite_pos(sprite_index, image_index,
x-(sprite_width/2)-viewX-sx,
y-viewY-sy,
x+(sprite_width/2)-viewX-sx,
y-viewY-sy,
x+(sprite_width/2)-viewX,
y-viewY,
x-(sprite_width/2)-viewX,
y-viewY,
1);
}
*/

gpu_set_fog(false, c_white, 0, 0);

surface_reset_target();

draw_set_alpha(0.5);
draw_surface(shadowSurface, viewX, viewY);
draw_set_alpha(1);