/// @description scr_zombie_hunt_step(targetobect,wallobject,speed,view_cone_angle,max_view_dist)
/// @param targetobect
/// @param wallobject
/// @param speed
/// @param view_cone_angle
/// @param max_view_dist
function scr_zombie_hunt_step(argument0, argument1, argument2, argument3, argument4) {

    var target = argument0; //initialize temp variable for target

    //////SEARCH STATE///////

    if (state == 0) {
        scr_scan();  //scan the view cone
    
        scr_search(0.7);   //search randomly
    
        if (instance_exists(target) && !collision_line(x, y, target.x, target.y, argument1, 1, 1))   //if line of sight to enemy...
        && distance_to_point(target.x, target.y) < argument4       //and within a certain distance....
        && (abs(angle_difference(look_dir, point_direction(x, y, target.x, target.y))) < argument3 //and within the view cone
        || distance_to_point(target.x, target.y) < sprite_width / 2)  //or just really close!
        {
            state = 1;  //switch to the hunt state
        }
    }

    ////////HUNT STATE/////////

    if (state == 1) {
        // Check if target is visible
        var canSeeTarget = !collision_line(x, y, target.x, target.y, argument1, 1, 0);
        
        if (canSeeTarget) {
            seenx = target.x;  // Update the last seen location
            seeny = target.y;
        }

        if (distance_to_point(seenx, seeny) > 0) {  //if not at the last seen location...
            if (isAttacking) {
                // Perform the attack logic
                if (attackTimer == 0) {
                    // Play attack animation
                    skeleton_animation_set("Lunge", false);
                }
                
                attackTimer += 1;
                if (attackTimer == 8) {
                    // Perform attack action
                    // Reset the timer and cooldown
                    attackTimer = 0;
                    attackCooldown = room_speed * 10; // 5 seconds cooldown
                    isAttacking = false; // Reset the attack state after attacking
                }
            } else if (distance_to_point(target.x, target.y) <= 30) {
                isAttacking = true; // Start attacking
                spd = 0;  // Stop movement during attack
            } else {
                // Move towards target
                isFollowing = true;
                spd = argument2;
                move_towards_point(target.x, target.y, spd);
            }
        } else {
            isFollowing = true;
            // Move towards last seen location
            mp_potential_step(seenx, seeny, argument2, 1);
            // If we are close to the last seen location, switch to searching
            if (point_distance(x, y, seenx, seeny) < 5) {
                isFollowing = false;
                state = 0;  // Switch back to search mode
            }
        }
    }
}
