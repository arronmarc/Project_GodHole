#region MOVEMENT
// Update speed
hsp = (keyboard_check(ord("D")) - keyboard_check(ord("A"))) * spd;
vsp = (keyboard_check(ord("S")) - keyboard_check(ord("W"))) * spd;
zsp += grav;

//Sprinting
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



if (mouse_check_button(mb_right)) {
    var dir_to_mouse = point_direction(x, y, mouse_x, mouse_y);
    y_frame = round(dir_to_mouse / 45) % 8; // Calculate the row in the spritesheet, 0-7 for 8 directions.

    if(hsp != 0 || vsp != 0) {
        // Compare the direction of movement and the direction to the mouse
        var move_dir = point_direction(0, 0, hsp, vsp);
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
    
} else if(hsp != 0 || vsp != 0) {
    anim_counter += 1;
    if (anim_counter >= anim_length * room_speed / anim_speed) {
        anim_counter = 0;
    }
    
    x_frame = abs(anim_counter / (room_speed / anim_speed));
} else {
    x_frame = 0.9;
}





// Jump
if ((z >= 0 || place_meeting_3D(x, y, z + 1, obj_collider)) && keyboard_check_pressed(vk_space))
	zsp = jumpspeed;

// Collide
// X
if (place_meeting_3D(x + hsp, y, z, obj_collider)) {
	while (!place_meeting_3D(x + sign(hsp), y, z, obj_collider)) x += sign(hsp);
	hsp = 0;
}

// Y
if (place_meeting_3D(x, y + vsp, z, obj_collider)) {
	while (!place_meeting_3D(x, y + sign(vsp), z, obj_collider)) y += sign(vsp);
	vsp = 0;
}

// Z
if (place_meeting_3D(x, y, z + zsp, obj_collider)) {
	while (!place_meeting_3D(x, y, z + sign(zsp), obj_collider)) z += sign(zsp);
	zsp = 0;
}

if(hsp != 0 or vsp != 0) {
	dir = point_direction(0,0,hsp,vsp);
	hsp = lengthdir_x(spd, dir);
	vsp = lengthdir_y(spd, dir);
}

// Move
x += hsp;
y += vsp;
z += zsp;

// Collide with floor
if (z > ground_height) {
	z = ground_height;
	zsp = 0;
}
#endregion

