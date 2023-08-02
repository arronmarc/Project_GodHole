#region MOVEMENT
//Update input
input_left = keyboard_check(keyboard_check(ord("A")));
input_right = keyboard_check(keyboard_check(ord("D")));
input_up = keyboard_check(keyboard_check(ord("W")));
input_down = keyboard_check(keyboard_check(ord("S")));
input_sprint = keyboard_check(keyboard_check(vk_shift));

moveX = 0;
moveY = 0;

// Update speed
moveX = (keyboard_check(ord("D")) - keyboard_check(ord("A"))) * spd;
moveY = (keyboard_check(ord("S")) - keyboard_check(ord("W"))) * spd;



moveY = (input_down - input_up) * spd;
if(moveY == 0){ moveX = (input_right - input_left) * spd; }

//Collision checks
//Horizontal
if(moveX != 0){
if(place_meeting(x+moveX, y, obj_collision)){
	repeat(abs(moveX)){
if(!place_meeting(x+sign(moveX), y, obj_collision)){
	x += sign(moveX);
		} else {
			break;
		}
	}
	moveX = 0;
}
}
//Vertical
if(moveY != 0){
if(place_meeting(x, y+moveY, obj_collision)){
	repeat(abs(moveY)){
if(!place_meeting(x, y+sign(moveY), obj_collision)){
	y += sign(moveY);
		} else {
			break;
		}
	}
	moveY = 0;
}
}

#region Sprinting
keySprint = keyboard_check(vk_shift);

if(keySprint) && (global.stamina > 0)
{
	global.stamina -= 1
	spd = sprintSpeed
}
else 
{
	spd = 4;
}


if!(keySprint)
{
	global.stamina += 0.35
}

if(global.stamina > 100)
{
	global.stamina = 100	
}

if(global.stamina < 0)
{
	global.stamina = 0	
}
#endregion

#region Right mouse button point direction
if (mouse_check_button(mb_right)) {
    var dir_to_mouse = point_direction(x, y, mouse_x, mouse_y);
    y_frame = round(dir_to_mouse / 45) % 8; // Calculate the row in the spritesheet, 0-7 for 8 directions.

    if(moveX != 0 || moveY != 0) {
        // Compare the direction of movement and the direction to the mouse
        var move_dir = point_direction(0, 0, moveX, moveY);
        var dir_diff = abs((move_dir - dir_to_mouse + 180) % 360 - 180);

        // Reverse animation if moving in the opposite direction to the mouse
        if (dir_diff > 90) {
            anim_counter -= 1; // Decrement the counter when moving in the opposite direction
            if (anim_counter <= -anim_length * room_speed / anim_speed) {
                anim_counter = -1;
            }
        } else {
            anim_counter += 1; // Increment the counter when moving in the same direction
            if (anim_counter >= anim_length * room_speed / anim_speed) {
                anim_counter = 0;
            }
        }
        
        x_frame = abs(anim_counter / (room_speed / anim_speed));
    }
    
} else if(moveX != 0 || moveY != 0) {
    anim_counter += 1;
    if (anim_counter >= anim_length * room_speed / anim_speed) {
        anim_counter = 0;
    }
    
    x_frame = abs(anim_counter / (room_speed / anim_speed));
} else {
    x_frame = 0.9;
}

if(moveX != 0 or moveY != 0) {
	dir = point_direction(0,0,moveX,moveY);
	moveX = lengthdir_x(spd, dir);
	moveY = lengthdir_y(spd, dir);
}
#endregion

// Move
x += moveX;
y += moveY;

#endregion

