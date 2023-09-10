function PlayerStateRoll() {
    if (!isRolling) {
        global.stamina -= 100;
        isRolling = true;
        spd = rollSpd;
        moveDistanceRemaining = rollDistance; 

        // Determine the direction to the mouse (crosshair)
        var mouseDir = point_direction(x, y, mouse_x, mouse_y);

        // Determine if we are moving in the opposite direction of the mouse
        var movingAwayFromMouse = abs(angle_difference(lastMovedDirection, mouseDir)) > 90 && abs(angle_difference(lastMovedDirection, mouseDir)) < 270;

        // Check if "aim" input is active
        if (input_check("aim")) {
            // Check if player is moving upwards, downwards, or away from the mouse's direction
            if (self._inputY != 0 || movingAwayFromMouse) {
                skeleton_animation_set("Jump backwards");
            } else {
                skeleton_animation_set("Roll");
            }
        } else {
            skeleton_animation_set("Roll");
        }

        rollTimer = 14; 
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
}
