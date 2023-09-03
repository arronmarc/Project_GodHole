roomWidth = room_width;
roomHeight = room_height;

if(surface_exists(debrisSurf)){
	surface_free(debrisSurf)
	debrisSurf = surface_create(room_width,room_height)
}

global.Particle1 = part_type_create();
part_type_shape(global.Particle1, pt_shape_explosion);
part_type_scale(global.Particle1, 1, 1)
part_type_size(global.Particle1, 0.3, 0.3, 0, 0);
part_type_color3(global.Particle1, c_yellow, c_orange, c_red);
part_type_alpha3(global.Particle1, 0.5, 1, 0);
part_type_speed(global.Particle1, 1.5, 1.5, 0.005, 0);
part_type_direction(global.Particle1, 80, 100, 0, 0);
part_type_blend(global.Particle1, true);
part_type_life(global.Particle1, 10, 60);


global.Emitter1 = part_emitter_create(global.P_System);
global.Emitter2 = part_emitter_create(global.P_System);
part_emitter_region(global.P_System, global.Emitter1, 1, 5, 1, 5, ps_shape_rectangle, ps_distr_invgaussian);
part_emitter_region(global.P_System, global.Emitter2, x, x, y, y, ps_shape_ellipse, ps_distr_gaussian);
part_emitter_stream(global.P_System, global.Emitter1, global.Particle1, 10);
alarm[0] = room_speed;