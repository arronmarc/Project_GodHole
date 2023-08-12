function PlayerStateFree(){

    // 1. INPUT HANDLING

    var _inputX = input_right - input_left;
    var _inputY = input_down - input_up;

    // 2. SPEED ADJUSTMENTS BASED ON STATE

    // Adjust speed based on keys and states
    if (keySprint && global.stamina > 0) {
        global.stamina -= 1;
        spd = r_spd;
    } else if (isCrouching) {
        spd = w_spd;
    } else {
        spd = n_spd;
    }

    // Handle stamina regeneration
    if(!keySprint) {
        global.stamina = clamp(global.stamina + 1, 0, 500);
    }

    // 3. CALCULATE MOVEMENT

    moveX = _inputX * spd;
    moveY = _inputY * spd;

    // Normalize diagonal movement
    if (moveX != 0 && moveY != 0) {
        moveX /= sqrt(2);
        moveY /= sqrt(2);
    }

      // Check for collisions
    var move_values = CollisionCheck(moveX, moveY);

    // Apply the movement
    x += move_values[0];
    y += move_values[1];


    // 5. HANDLE ANIMATIONS

    if (moveX != 0 or moveY != 0) {
        if (keySprint && global.stamina > 0) {
            if skeleton_animation_get() != "Run" {
                skeleton_animation_set("Run");
            }
        } else if (isCrouching) {
            if skeleton_animation_get() != "Crouch" {
                skeleton_animation_set("Crouch");
            }
        } else {
            if skeleton_animation_get() != "Walk" {
                skeleton_animation_set("Walk");
            }
        }
    } else {
        if isCrouching {
            if skeleton_animation_get() != "Crouch idle" {
                skeleton_animation_set("Crouch idle");
            }
        } else {
            if skeleton_animation_get() != "Idle" {
                skeleton_animation_set("Idle");
            }
        }
    }

    // 6. HANDLE ORIENTATION BASED ON MOUSE

    if (mouse_check_button(mb_right)) {
        if (mouse_x < x) {
            image_xscale = -1;  // Face left
        } else if (mouse_x > x) {
            image_xscale = 1;   // Face right
        }
        skeleton_attachment_set("Arm_bottom2", "6af34888-93e4-4ce6-8f04-3758bbca36f4");
    } else {
        skeleton_attachment_set("Arm_bottom2", "Arm_bottom");

        // If not adjusting for mouse input, then check the movement direction
        if (moveX != 0) {
            image_xscale = sign(moveX);
        }
    }

    // 7. CROUCH TOGGLE

    if (keyCrouch) {
        if (!isCrouching) {
            state = PlayerStateCrouch;
            isCrouching = true;
        } else {
            isCrouching = false;  // Reset to stand up
        }
    }

    // 8. HANDLE ROLL STATE

    if (keyRoll) {
        state = PlayerStateRoll;
    }

    // 9. SAVE LAST MOVED DIRECTION

    if (moveX != 0 || moveY != 0) {
        lastMovedDirection = point_direction(0, 0, moveX, moveY);
    }
}
