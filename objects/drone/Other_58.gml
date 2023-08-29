if (!global.pause) 
{
// Create the ds_map for the bone state
var _map_left_arm = ds_map_create();
skeleton_bone_state_get("Gun bone", _map_left_arm);


    // Calculate direction to crosshair
    var gun_direction = point_direction(x, y, obj_player.x, obj_player.y);
    
    // Adjust for default gun orientation
    gun_direction -= 95;
    
    // If the crosshair is on the left side of the player, flip the player's image
    if (obj_player.x < x) {
        image_xscale = -0.07;  // Face left

        // Correct the gun direction
        gun_direction = 180 + (180 - gun_direction);
    } else {
        image_xscale = 0.07;   // Face right
    }
    
    // Add randomness for shooting
    if (input_check("shoot")) {
        gun_direction += random_range(-10, 10);
    }

    ds_map_replace(_map_left_arm, "angle", gun_direction);


// Set the bone state and destroy the ds_map just once at the end
skeleton_bone_state_set("Gun bone", _map_left_arm);
ds_map_destroy(_map_left_arm);


}
