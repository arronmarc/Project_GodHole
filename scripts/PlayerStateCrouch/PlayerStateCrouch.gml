function PlayerStateCrouch() {
if (!global.pause) 
{
    if (!isCrouching) {
        isCrouching = true;
        spd = w_spd;
    }

    // 1. INPUT HANDLING (copied from PlayerStateFree)
    var _inputX = input_right - input_left;
    var _inputY = input_down - input_up;

    moveX = _inputX * w_spd;
    moveY = _inputY * w_spd;

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


  // 3. HANDLE ANIMATIONS
        if (moveX != 0 or moveY != 0) {
            if skeleton_animation_get() != "Crouch" {
                skeleton_animation_set("Crouch");
            }
            // Handle sound for moving while crouched
            if (!audio_is_playing(sound_crouch)) {
                audio_play_sound(sound_crouch, 1, true);
            }
        } else {
            if skeleton_animation_get() != "Crouch idle" {
                skeleton_animation_set("Crouch idle");
            }
            // Stop the sound if not moving
            if (audio_is_playing(sound_crouch)) {
                audio_stop_sound(sound_crouch);
            }
        }

    // 4. HANDLE SPRITE DIRECTION

    // Set the direction based on mouse input first
    if (input_check("aim")) {
        if (mouse_x < x) {
            image_xscale = -1;  // Face left
        } else if (mouse_x > x) {
            image_xscale = 1;   // Face right
			skeleton_attachment_set("Arm_bottom2", "6af34888-93e4-4ce6-8f04-3758bbca36f4");
        }
    } else {
		skeleton_attachment_set("Arm_bottom2", "Arm_bottom");
        // If not adjusting for mouse input, then check the movement direction
        if (moveX != 0) {
            image_xscale = sign(moveX);
        }
    }

    // 5. HANDLE STATE TRANSITIONS

    // Stand up when Control is pressed again
    if (keyCrouch) {
        state = PlayerStateFree;
        isCrouching = false;
    }

    // Check for roll or sprint while crouching
    if (keyRoll) {
        state = PlayerStateRoll;
    }
}
}
