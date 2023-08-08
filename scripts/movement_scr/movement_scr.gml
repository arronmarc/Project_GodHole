function movement_scr() {
	
	moveX = 0;
	moveY = 0;
	
	// Update input
	input_left = keyboard_check(ord("A"));
	input_right = keyboard_check(ord("D"));
	input_up = keyboard_check(ord("W"));
	input_down = keyboard_check(ord("S"));
	input_walk = keyboard_check(vk_control);
	input_sprint = keyboard_check(vk_shift);

	// Your character should face the direction of the mouse at all times
	dir = point_direction(x, y, mouse_x, mouse_y);
	
	// Alter speed
	if (input_walk || input_sprint) {
		spd = abs((input_walk * w_spd) - (input_sprint * r_spd));
	} else {
		spd = n_spd;
	}

	// Intended movement using motion_add
	if (input_left) {
	    motion_add(180, spd);
	}
	if (input_right) {
	    motion_add(0, spd);
	}
	if (input_up) {
	    motion_add(90, spd);
	}
	if (input_down) {
	    motion_add(270, spd);
	}
	
	speed = min(speed, spd);


	// Apply friction (to make sure the character slows down if no keys are pressed)
	if (!input_left && !input_right && !input_up && !input_down) {
	    speed *= 0.9; // You can adjust the 0.9 value to change how quickly the player stops
	}

	// Convert speed and direction to x and y components
var h_move = lengthdir_x(speed, direction);
var v_move = lengthdir_y(speed, direction);

// Collision checks
// Horizontal
if (h_move != 0) {
    if (place_meeting(x + h_move, y, obj_collision)) {
        repeat(abs(round(h_move))) {
            if (!place_meeting(x + sign(h_move), y, obj_collision)) { 
                x += sign(h_move); 
            } else { 
                h_move = 0; 
                break; 
            }
        }
    }
}

// Vertical
if (v_move != 0) {
    if (place_meeting(x, y + v_move, obj_collision)) {
        repeat(abs(round(v_move))) {
            if (!place_meeting(x, y + sign(v_move), obj_collision)) { 
                y += sign(v_move); 
            } else { 
                v_move = 0; 
                break; 
            }
        }
    }
}

// Apply collision-adjusted speeds to actual object speeds
speed = point_distance(0, 0, h_move, v_move);
direction = point_direction(0, 0, h_move, v_move);


	// Apply movement
	x += moveX;
	y += moveY;

	// Sprinting Logic (You already have it right)
	keySprint = keyboard_check(vk_shift);

	if (keySprint && (global.stamina > 0)) {
		global.stamina -= 1;
		spd = r_spd;
	} else {
		spd = n_spd;
	}

	if (!keySprint) {
		global.stamina += 0.35;
	}

	if (global.stamina > 100) {
		global.stamina = 100;	
	}

	if (global.stamina < 0) {
		global.stamina = 0;	
	}
}
