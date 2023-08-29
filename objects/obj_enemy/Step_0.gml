if (global.pause) {
    image_speed = 0;
    return; // Exit the function early since the game is paused.
}
else {
    image_speed = 1; // Resume the animation. Adjust this value if your standard playback speed is different.
}

if (!global.pause) 
{
	#region Movement and animations
    if (moveX > 0) {
        image_xscale = 0.07; // Facing right
    } else if (moveX < 0) {
        image_xscale = -0.07; // Facing left
    }

    // Check for the death condition first.
    if (hp <= 0) {
		alarm[0] = -1;
        if (skeleton_animation_get() != "Die") {
            skeleton_animation_set("Die", false);
            moveX = 0;
            moveY = 0;
            animation_start_time = current_time;
            animation_playing = true;
        }
		alarm[0] = -1;
    } 
    else if (moveX != 0 or moveY != 0) {
        // Only set walking animation if the character is not dying.
        if skeleton_animation_get() != "Walk" {
            skeleton_animation_set("Walk");
        }
    } 
    else {
        // Only set idle animation if the character is not dying.
        if skeleton_animation_get() != "Idle" {
            skeleton_animation_set("Idle");
        }
    }

    if (animation_playing) {
        var duration = 40 / 30; 
        if (current_time - animation_start_time >= duration * 1000) { // Multiply by 1000 because current_time is in milliseconds
            // Here, the character is already dead, so you don't need to set any other animation.
            animation_playing = false; // Stop tracking the animation
        }
    }

    // Check for collisions
    CollisionCheck(moveX, moveY);

    // Move
    x += moveX;
    y += moveY;
	#endregion


}
