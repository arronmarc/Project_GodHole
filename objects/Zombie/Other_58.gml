if (!global.pause) {
	
	if (isDead) {
        if (skeleton_animation_get() != "Die") {
            skeleton_animation_set("Die", false);
        }
        return;
    }  else {
	
    // Determine direction based on player's position
    if (obj_player.x < x) {
        image_xscale = -0.07;  // Face left
    } else {
        image_xscale = 0.07;   // Face right
    }
    
    var last_animation = "";
    var current_animation = skeleton_animation_get();
    
	if (isAttacking) {
        if (current_animation != "Lunge") {
            skeleton_animation_set("Lunge", false);
        }
    } else if (spd) {
        if (skeleton_animation_get() != "Walk") {
            skeleton_animation_set("Walk");
        }
    } 
    
    if (current_animation != last_animation) {
        last_animation = current_animation;
        if (last_animation == "Lunge" && isAttacking) {
            // Don't set cooldown here
        }
        
        if (last_animation == "Lunge" && !isAttacking) {
            // Set the attack cooldown after the animation is completed
            attackCooldown = room_speed * 5; // 5 seconds cooldown
            isAttacking = false; // Reset the isAttacking flag
        }
    }
}
}