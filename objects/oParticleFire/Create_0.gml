/// @description Insert description here
// You can write your code in this editor


particleSystem = part_system_create_layer("Instances", 0);
particleSystemBelow = part_system_create_layer("Instances_below", 0);

#region FIRE

particleType_Fire = part_type_create();
part_type_sprite(particleType_Fire, spr_particle_fire,0,0,0);

part_type_life(particleType_Fire, 70,70);
part_type_alpha3(particleType_Fire,1,1,0.1);
part_type_scale(particleType_Fire,0.8,0.8);

part_type_size(particleType_Fire, 1,1,-0.01,0);
part_type_color1(particleType_Fire, make_colour_rgb(224,169,15));
part_type_blend(particleType_Fire,1);
part_type_gravity(particleType_Fire,0.005,90);

#endregion

#region FIRE OUTLINE

particleType_FireOutline = part_type_create();
part_type_sprite(particleType_FireOutline, spr_particle_fire,0,0,0);

part_type_life(particleType_FireOutline,100,100);
part_type_alpha3(particleType_FireOutline,1,1,0.1);
part_type_scale(particleType_FireOutline,0.8,0.8);

part_type_color1(particleType_FireOutline, make_color_rgb(159,56,4));

part_type_gravity(particleType_FireOutline, 0.005,90);

#endregion

#region SMOKE

particleType_Smoke = part_type_create();
part_type_sprite(particleType_Smoke, spr_particle_fire,0,0,0);

part_type_life(particleType_Smoke,320,400);
part_type_alpha3(particleType_Smoke,0.05,0.05,0.05);
part_type_scale(particleType_Smoke,0.8,0.8);

part_type_size(particleType_Smoke, 0.1,0.4,0.004,0);
part_type_color2(particleType_Smoke, $1f1a1e, $363234);

part_type_direction(particleType_Smoke,48,132,0,0);
part_type_speed(particleType_Smoke,0.05,0.1,-0.001,0);

part_type_gravity(particleType_Smoke,0.001,90);


#endregion




