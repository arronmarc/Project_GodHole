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
    look_dir = point_direction(x, y, seenx, seeny); //change the look direction to be looking at the last known location
    
    if (!collision_line(x, y, target.x, target.y, argument1, 1, 0)) //if there is line of sight to the enemy....
    {
        seenx = target.x;  //...then update the last seen location
        seeny = target.y;
    }

    if (distance_to_point(seenx, seeny) > 0) {  //if not at the last seen location...
        if (isFollowing) {
            if (isAttacking) {
                spd = 0;  // Stop movement during attack
            } else {
                mp_potential_step(seenx, seeny, argument2, 1);  //move toward the last seen location
            }
        }
        
        if (isAttacking) {
            // Perform the attack logic
            if (attackTimer == 0) {
                // Play attack animation
                skeleton_animation_set("Sword stab", false);
            }
            
            attackTimer += 1;
            if (attackTimer == 8) {
                // Perform attack action
                // Reset the timer and cooldown
                attackTimer = 0;
                attackCooldown = room_speed * 5; // 5 seconds cooldown
                isAttacking = false; // Reset the attack state after attacking
            }
        } else {
            // Cooldown between attacks
            if (attackCooldown > 0) {
                attackCooldown -= 1;
            }
        }
    } else {
        state = 0;  //if arrived at the last seen location then switch back to search mode
    }
}

}