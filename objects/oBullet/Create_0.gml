/// @description Essential entity setup
audio_play_sound(sound_machinegun,1,false);
aim = point_direction(x, y, crosshair.x, crosshair.y);

//direction = point_direction(x, y, crosshair.x, crosshair.y);
direction = random_range(aim-2.5,aim+2.5);
image_angle = direction;
image_xscale = max(1,sprite_width)

my_light = instance_create_layer(x, y, "Instances", oBulletLight);

Screenshake(20, 5);

/*
//For creating casings on fire
with (instance_create_depth(obj_player.x, obj_player.y-30, depth-1, oParticle)) {
    debris = true;
    sprite_index = sCasing;
    
    // Random rotation on spawn
    image_angle = random(180);
    
    // Random friction to make some particles slow down after ejecting
    fric = random_range(3, 6); // This should be a small value to slow down the casing gradually.
    
    // Assign a random speed and direction to eject in a limited arc.
    speed = random_range(1, 4); 
    direction = point_direction(x, y, crosshair.x, crosshair.y) -170 + random_range(-10, 10); 
    
    // No gravity for now, let's see how it behaves without it.
    gravity = 0;
}
*/