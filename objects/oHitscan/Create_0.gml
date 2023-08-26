/// @description Essential entity setup
audio_play_sound(sound_bullet,1,false);
aim = point_direction(x, y, crosshair.x, crosshair.y);

//direction = point_direction(x, y, crosshair.x, crosshair.y);
direction = random_range(aim-2.5,aim+2.5);
image_angle = direction;
image_xscale = max(1,sprite_width)

light = new BulbLight(objLightController.renderer, spr_bulletLight, 0, x, y);
light.AddToRenderer(objLightController.renderer); 
light.angle = point_direction(x, y, crosshair.x, crosshair.y);

// Initialize alpha and fade speed
alphaValue = 1; // Start fully opaque
fadeSpeed = 0.02; // Adjust this value to control the fade speed

Screenshake(20, 5);