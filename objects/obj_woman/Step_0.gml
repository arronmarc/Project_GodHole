
if (global.pause) {
    image_speed = 0;
    return; // Exit the function early since the game is paused.
}
else {
    image_speed = 1; // Resume the animation. Adjust this value if your standard playback speed is different.
}

if (!global.pause) 
{

if (moveX > 0) {
    image_xscale = 1; // Facing right
} else if (moveX < 0) {
    image_xscale = -1; // Facing left
}


if (moveX != 0 or moveY != 0) {
      
        if skeleton_animation_get() != "Walk" {
            skeleton_animation_set("Walk");
        }
    } else {
        if skeleton_animation_get() != "Idle" {
            skeleton_animation_set("Idle");
        }
}

	
// Check for collisions
CollisionCheck(moveX, moveY);


// Move
x += moveX;
y += moveY;

}