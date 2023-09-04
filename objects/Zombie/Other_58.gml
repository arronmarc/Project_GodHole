if (!global.pause) and (isDead != true) 
{    

// If obj_player is on the left side of the enemy, flip the enemy's image
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


}

