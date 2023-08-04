if(!surface_exists(shadowSurface)){
	shadowSurface = surface_create(750, 420);	
}

var viewX = camera_get_view_x(view_camera[0]);
var viewY = camera_get_view_y(view_camera[0]);

surface_set_target(shadowSurface);
draw_clear_alpha(c_black, 0);

var sx = 5;
var sy = 10;

gpu_set_fog(true, c_navy, 0, 1);

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


gpu_set_fog(false, c_white, 0, 0);

surface_reset_target();

draw_set_alpha(0.5);
draw_surface(shadowSurface, viewX, viewY);
draw_set_alpha(1);