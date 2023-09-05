// Step event
if (!global.pause) {
    if (hp == 0) {
        isDead = true;
        spd = 0;
		speed = 0;
		xx = 0;
		yy = 0;
        skeleton_animation_set("Die", false);
        animation_start_time = global.curSec;
        animation_playing = true;
        return;  // Skip the rest of the code
    }

    // Lerp the sprite's position. Adjust the divider for more or less smoothing.
    xx += (x - xx) * spd / 20;
    yy += (y - yy) * spd / 20;

    if (global.pause) {
        image_speed = 0;
        return; // Exit the function early since the game is paused.
    } else {
        image_speed = 1; // Resume the animation
    }

    if (animation_playing) {
        var duration = 1.33;
        if (global.curSec - animation_start_time >= duration) {
            animation_playing = false;
        }
    }

    // Determine direction based on "smooth" x position
    if (xx < x) {
        image_xscale = -0.07;  // Facing right
    } else if (xx > x) {
        image_xscale = 0.07;  // Facing left
    }

    // This will only be executed if the enemy is not dead
    if (gamemode == 0) {
        scr_zombie_hunt_step(obj_player, wall_obj, 0.8, 30, 250);  // Run the hunt script
    } else {
        move_towards_point(x, -50, 3);
    }
}
