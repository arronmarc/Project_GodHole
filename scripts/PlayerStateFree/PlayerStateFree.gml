function PlayerStateFree() {
    if (!global.pause) 
    {
        // 1. INPUT HANDLING
        HandleInput();

        // 2. SPEED ADJUSTMENTS BASED ON STATE
        AdjustSpeed();

        // 3. CALCULATE AND APPLY MOVEMENT
        CalculateMove();

        // 4. HANDLE ANIMATIONS AND SOUNDS
        HandleAnimations();

        // 5. CROUCH TOGGLE
        HandleCrouchToggle();

        // 6. HANDLE ROLL STATE
        HandleRollState();
		
		// 6. HANDLE STAB ATTACK
        HandleAttackStab();

        // 8. SAVE LAST MOVED DIRECTION
        SaveLastMoveDirection();


    }
	
	
}


function HandleInput() {
    self._inputX = input_right - input_left;
    self._inputY = input_down - input_up;

    if (any_gamepad_button_pressed() || abs(input_check("aim_left")) > 0.1 || abs(input_check("aim_right")) > 0.1 || abs(input_check("aim_up")) > 0.1 || abs(input_check("aim_down")) > 0.1) {
        self._inputX += gamepad_axis_value(0, gp_axislh); 
        self._inputY += gamepad_axis_value(0, gp_axislv); 
    }
}

function AdjustSpeed() {
    if (keySprint && global.stamina > 0) {
        global.stamina -= 1;
        spd = r_spd;
    } 
    else if (isCrouching) {
        spd = w_spd;
    } 
    else {
        spd = n_spd;
    }

    if(!keySprint) {
        global.stamina = clamp(global.stamina + 1, 0, 500);
    }
}

function CalculateMove() {
    var targetSpeed = (self._inputX != 0 || self._inputY != 0) ? spd : 0;
    currentSpeed += clamp(targetSpeed - currentSpeed, -dSpeed, aSpeed);
    
    moveX = self._inputX * currentSpeed;
    moveY = self._inputY * currentSpeed;

    if (moveX != 0 && moveY != 0) {
        moveX /= sqrt(2);
        moveY /= sqrt(2);
    }

    var move_values = CollisionCheck(moveX, moveY);
    x += move_values[0];
    y += move_values[1];
}

function HandleAnimations() {
    var desired_sound = noone;
    
    if (state == PlayerAttackStab) {
        return; // Exit the function early if an attack animation is playing.
    }

    if (moveX != 0 or moveY != 0) {
        desired_sound = HandleMovementAnimations();
    } else {
        HandleIdleAnimations();
    }

    ManageSounds(desired_sound);
}


function HandleMovementAnimations() {
    var sound_to_play;
	
    if (isCrouching) {
        SetAnimationIfDifferent("Crouch");
    } 
    else if (keySprint && global.stamina > 0) {
        SetAnimationIfDifferent("Run");
        sound_to_play = sound_run;
    } 
    else {
        SetAnimationIfDifferent("Walk");
        sound_to_play = sound_walk;
    }

    return sound_to_play;
	}

function HandleIdleAnimations() {
    if (isCrouching) {
        SetAnimationIfDifferent("Crouch idle");
    } else {
        SetAnimationIfDifferent("Idle");
    }
}

function SetAnimationIfDifferent(anim_name) {
    if (skeleton_animation_get() != anim_name) {
        skeleton_animation_set(anim_name);
    }
}

function ManageSounds(desired_sound) {
    var all_sounds = [sound_walk, sound_run, sound_crouch];
    for (var i = 0; i < array_length(all_sounds); i++) {
        var s = all_sounds[i];
        if (s == desired_sound && !audio_is_playing(s)) {
            audio_play_sound(s, 1, true);
        } else if (s != desired_sound && audio_is_playing(s)) {
            audio_stop_sound(s);
        }
    }
}

function HandleCrouchToggle() {
    if (keyCrouch) {
        if (!isCrouching) {
            state = PlayerStateCrouch;
            isCrouching = true;
        } else {
            isCrouching = false;
        }
    }
}

function HandleRollState() {
    if (keyRoll) {
        state = PlayerStateRoll;
    }
}

//function HandleAttackStab() {
//    if (keyAttack) {
//        state = PlayerAttackStab;
//    }
//}

function HandleAttackStab() {
    if (keyAttack) {
        state = PlayerAttackMagic;
    }
}


function SaveLastMoveDirection() {
    if (moveX != 0 || moveY != 0) {
        lastMovedDirection = point_direction(0, 0, moveX, moveY);
    }
}
