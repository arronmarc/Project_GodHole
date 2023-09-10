if (isDead != true) 
{
    // Create the ds_map for the bone state
    var _map_left_arm = ds_map_create();
    skeleton_bone_state_get("Gun bone", _map_left_arm);

    // Calculate direction to obj_player
    var gun_direction = point_direction(x, y, obj_player.x, obj_player.y);

    // Adjust for default gun orientation
    gun_direction -= 95;
    
    // If obj_player is on the left side of the enemy, flip the enemy's image
	if (isDead != true) {
	    if (obj_player.x < x) {
	        image_xscale = -0.07;  // Face left
        
	        // Correct the gun direction
	        gun_direction = 180 + (180 - gun_direction);
	    } else {
	        image_xscale = 0.07;   // Face right
	    }
	}

    ds_map_replace(_map_left_arm, "angle", gun_direction);

    // Set the bone state and destroy the ds_map just once at the end
    skeleton_bone_state_set("Gun bone", _map_left_arm);
    ds_map_destroy(_map_left_arm);
	
}

    if (isDead) {
        if (skeleton_animation_get() != "Die") {
            skeleton_animation_set("Die", false);
        }
    } else if (spd) {
        if (skeleton_animation_get() != "Walk") {
            skeleton_animation_set("Walk");
        }
    } else {
        if (skeleton_animation_get() != "Idle") {
            skeleton_animation_set("Idle");
        }
    }
