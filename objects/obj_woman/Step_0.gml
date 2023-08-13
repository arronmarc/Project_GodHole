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
var move_values = CollisionCheck(moveX, moveY);


// Move
x += moveX;
y += moveY;

