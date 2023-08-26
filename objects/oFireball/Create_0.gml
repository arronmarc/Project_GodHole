/// @description Essential entity setup
audio_play_sound(sound_machinegun,1,false);
aim = point_direction(x, y, crosshair.x, crosshair.y);

direction = point_direction(x, y, crosshair.x, crosshair.y);
direction = random_range(aim-2.5,aim+2.5);
image_angle = aim;
//image_xscale = 2;

light = new BulbLight(objLightController.renderer, spr_bulletLight, 0, x, y);
light.angle = point_direction(x, y, crosshair.x, crosshair.y);

// Initialize alpha and fade speed for light
alphaValue = 1; // Start fully opaque
fadeSpeed = 0.05; // Adjust this value to control the fade speed of the light

Screenshake(10, 5);


