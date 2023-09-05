if (!global.pause && !isDead) {
    if (hp > 0) {
        // Determine direction based on player's position
        if (obj_player.x < x) {
            image_xscale = -0.07;  // Face left
        } else {
            image_xscale = 0.07;   // Face right
        }
        
        var last_animation = "";
        var current_animation = skeleton_animation_get();
        
        if (isAttacking) {
            if (current_animation != "Sword stab") {
                skeleton_animation_set("Sword stab", false);
            }
        } else if (isDead) {
            if (skeleton_animation_get() != "Die") {
                skeleton_animation_set("Die", false);
                // At this point, the "Die" animation is playing, so you might want to do nothing else here
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
        
        if (current_animation != last_animation) {
            last_animation = current_animation;
            if (last_animation == "Sword stab" && isAttacking) {
                // Don't set cooldown here
            }
            
            if (last_animation == "Sword stab" && !isAttacking) {
                // Set the attack cooldown after the animation is completed
                attackCooldown = room_speed * 5; // 5 seconds cooldown
                isAttacking = false; // Reset the isAttacking flag
            }
        }
    } else {
        // HP is zero, so play "Die" animation and do nothing else
        skeleton_animation_set("Die", false);
    }
}
