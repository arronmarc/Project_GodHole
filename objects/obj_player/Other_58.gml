if (!global.pause) 
{

if (input_check("aim")) {
    var _map_left_arm = ds_map_create();
    skeleton_bone_state_get("Left arm bone bottom", _map_left_arm);

    var _dir = point_direction(x, y-25, crosshair.x, crosshair.y);

    // Adjust the angle based on the character's orientation
    if (image_xscale < 0) {
        _dir = 180 - _dir;
    }

    // If the shoot button is pressed, add a random jitter to the angle
    if (input_check("shoot")) {
        _dir += random_range(-10, 10);  // Adjust the range as needed for your desired amount of jitter
    }

    ds_map_replace(_map_left_arm, "angle", _dir-260);
    skeleton_bone_state_set("Left arm bone bottom", _map_left_arm);
    ds_map_destroy(_map_left_arm);
}



var _map_left_arm = ds_map_create();
skeleton_bone_state_get("Left arm bone bottom", _map_left_arm);
var currentX = _map_left_arm[? "x"];

if (input_check("shoot")) {
    // Apply recoil
    if (recoil_time <= 0) {
        ds_map_replace(_map_left_arm, "y", original_bone_y - recoil_amount);
        recoil_time = recoil_duration;
    } else {
        // Reduce recoil_time
        recoil_time--;
        // If half the duration has passed, reset the bone to the original position
        if (recoil_time <= recoil_duration / 2) {
            ds_map_replace(_map_left_arm, "y", original_bone_y);
        }
    }
} else {
    // If not shooting, ensure bone is at its original position
    if (currentX != original_bone_y) {
        ds_map_replace(_map_left_arm, "y", original_bone_y);
    }
    recoil_time = 0; // Reset recoil_time if not shooting
}

skeleton_bone_state_set("Left arm bone bottom", _map_left_arm);
ds_map_destroy(_map_left_arm);





}


	
