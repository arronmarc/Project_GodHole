/// @description Essential entity setup
audio_play_sound(sound_bullet,1,false);
bulletspeed = 3;


direction = point_direction(x,y,mouse_x,mouse_y);
image_angle = direction;
//image_xscale = max(1,bulletspeed*sprite_width)