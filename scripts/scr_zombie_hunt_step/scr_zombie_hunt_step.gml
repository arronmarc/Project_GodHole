/// @description scr_zombie_hunt_step(targetobect,wallobject,speed,view_cone_angle,max_view_dist)
/// @param targetobect
/// @param wallobject
/// @param speed
/// @param view_cone_angle
/// @param max_view_dist

function scr_zombie_hunt_step(argument0, argument1, argument2, argument3, argument4) {

    // Don't proceed if the enemy is dead
    if (isDead) return;

    var target = argument0; // Initialize temp variable for target

    //////SEARCH STATE///////

    if (state == States.HUNT && !hasSpottedPlayer) {  // Notice the check for hasSpottedPlayer here
        scr_scan();  // Scan the view cone
        scr_search(0.7);   // Search randomly

        if (instance_exists(target)
            && !collision_line(x, y, target.x, target.y, argument1, 1, 1)  // If line of sight to enemy...
            && distance_to_point(target.x, target.y) < argument4  // And within a certain distance...
            && (abs(angle_difference(look_dir, point_direction(x, y, target.x, target.y))) < argument3  // And within the view cone
            || distance_to_point(target.x, target.y) < sprite_width / 2))  // Or just really close!
        {
            state = States.HUNT;  // Switch to the hunt state
            hasSpottedPlayer = true;  // Remember that we've spotted the player
        }
    }

    ////////HUNT STATE/////////

    if (state == States.HUNT && hasSpottedPlayer) {  // Checking hasSpottedPlayer here too
        // Check if target is visible
        var canSeeTarget = !collision_line(x, y, target.x, target.y, argument1, 1, 0);
        
        if (canSeeTarget) {
            seenx = target.x;  // Update the last seen location
            seeny = target.y;
        }

        if (distance_to_point(seenx, seeny) > 0) {  // If not at the last seen location...
            // Move towards target
            spd = argument2;
            move_towards_point(target.x, target.y, spd);
        } else {
            isFollowing = true;
            // Move towards last seen location
            mp_potential_step(seenx, seeny, argument2, 1);
        }
    }
}
