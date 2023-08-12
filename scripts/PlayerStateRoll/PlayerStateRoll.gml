function PlayerStateRoll() {
    if (!isRolling) {
        isRolling = true;
        spd = rollSpd;
        moveDistanceRemaining = rollDistance; 
        skeleton_animation_set("Roll");
        rollTimer = 40; 
    }

    // Check for movement and update the direction
    if (moveX != 0 || moveY != 0) {
        lastMovedDirection = point_direction(0, 0, moveX, moveY);  // Update the global direction based on movement
    }

    // Use lastMovedDirection for rolling
    lastMoveDir = GetEightDirection(lastMovedDirection);

    // Use the 'lastMoveDir' direction for movement during roll
    var rollMoveX = lengthdir_x(spd, lastMoveDir);
    var rollMoveY = lengthdir_y(spd, lastMoveDir);

    // Check for collisions
    var move_values = CollisionCheck(rollMoveX, rollMoveY);

    // Apply the movement
    x += move_values[0];
    y += move_values[1];

    moveDistanceRemaining = max(0, moveDistanceRemaining - spd);

    rollTimer -= 1;
    if (rollTimer <= 0) {
        isRolling = false;
        state = PlayerFinishRoll;
    }

    show_debug_message("Rolling in direction: " + string(lastMoveDir));
}
