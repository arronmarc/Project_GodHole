skeleton_skin_set("Enemy");

//Create event
skeleton_animation_mix("Idle","Walk",0.03);
skeleton_animation_mix("Walk","Idle",0.03);
skeleton_animation_mix("Idle","Run",0.03);
skeleton_animation_mix("Run","Idle",0.03);
skeleton_animation_mix("Run","Crouch",0.03);
skeleton_animation_mix("Crouch","Run",0.03);
skeleton_animation_mix("Idle","Crouch",0.03);
skeleton_animation_mix("Crouch","Idle",0.03);
skeleton_animation_mix("Idle crouch","Crouch",0.03);
skeleton_animation_mix("Crouch","Idle crouch",0.03);
skeleton_animation_mix("Idle","Idle crouch",0.03);
skeleton_animation_mix("Idle crouch","Idle",0.03);

hp = 5;

w_spd = 1;
n_spd = 4;
r_spd = 8;
spd = w_spd;
moveX = 0;
moveY = 0;

alarm[1] = 1;

animation_start_time = 0;
animation_playing = false;

