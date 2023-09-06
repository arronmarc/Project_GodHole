// Function to get the smallest angle difference
function angle_difference(angle1, angle2) {
    return ((((angle1 - angle2) % 360) + 540) % 360) - 180;
}

function UpdateTorch() {
    if (obj_player.light_active = true) {
        
        var target_dir = 0;
        var lerp_speed = 0.2;  // Adjust speed as needed (0-1)
        
        if (input_check("aim")) {
            target_dir = point_direction(obj_player.x, obj_player.y, crosshair.x, crosshair.y);
        } else {
            target_dir = obj_player.lastMovedDirection;
        }
        
        // Calculate the smallest angle difference
        var angle_diff = angle_difference(target_dir, obj_player.currentTorchDir);
        
        // Smoothly transition from the current direction to the target direction
        obj_player.currentTorchDir += angle_diff * lerp_speed;
        
        // Ensure the current torch direction is within 0-360 degrees
        obj_player.currentTorchDir = (obj_player.currentTorchDir + 360) % 360;

        gpu_set_blendmode(bm_subtract);
        draw_sprite_ext(spr_torch, 0, obj_player.x, obj_player.y, glowSize, glowSize, obj_player.currentTorchDir, c_white, 1);
        gpu_set_blendmode(bm_normal);
    }
}
