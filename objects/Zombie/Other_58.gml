// Animation update event
if (!global.pause) {
    if (isDead) {
        if (skeleton_animation_get() != "Die") {
            skeleton_animation_set("Die", false);
        }
        return;  // Skip the rest of the code
    }

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

        if (last_animation == "Lunge" && !isAttacking) {
            attackCooldown = global.curSec + 5;  // 5 seconds cooldown using new timing system
            isAttacking = false; // Reset the isAttacking flag
        }

        if (isAttacking && global.curSec >= attackCooldown) {
            isAttacking = false;  // Reset the isAttacking flag
        }
    }
}
