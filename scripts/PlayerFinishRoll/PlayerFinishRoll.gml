function PlayerFinishRoll(){
    if (skeleton_animation_get() != "Crouch idle") {
        skeleton_animation_set("Crouch idle");
        skidTimer = 120; 
        spd = abs(rollSpd); // Make sure speed is positive
    }

    skidTimer -= 1;

    // Calculate the intended movement
    var _moveX = lengthdir_x(spd, lastMoveDir);
    var _moveY = lengthdir_y(spd, lastMoveDir);
	
	// Reduce the speed by friction
    spd = max(0, spd - skidFriction);

    // Check for collisions
    var move_values = CollisionCheck(_moveX, _moveY);

    // Apply the movement
    x += move_values[0];
    y += move_values[1];

    if (skidTimer <= 0 || spd == 0) {
        state = PlayerStateFree;
    }
	
    if (isCrouching) {
        state = PlayerStateCrouch;
    }
}
