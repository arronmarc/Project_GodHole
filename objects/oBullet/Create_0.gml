/// @description Essential entity setup
audio_play_sound(sound_machinegun,1,false);
aim = point_direction(x,y,mouse_x,mouse_y);

//direction = point_direction(x,y,mouse_x,mouse_y);
direction = random_range(aim-2.5,aim+2.5);
image_angle = direction;
image_xscale = max(1,sprite_width)

