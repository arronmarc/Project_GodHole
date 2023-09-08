//Step event
if (global.pause) {
    image_speed = 0;
    return; // Exit the function early since the game is paused.
}
else {
    image_speed = 1; // Resume the animation. Adjust this value if your standard playback speed is different.
}

if (!global.pause) 
{


//fear control - in order to work with the shooter AI
scr_fear_control(red_bullet)
fear-=1

//Regenerate health
if (global.health < 50) {
    if (!start_timer) {
        start_timer = true;
        timer = room_speed * 30;
    }
}

if (timer > 0) {
    timer--;
} else if (global.health < 50) {
    global.health = clamp(global.health + 1, 0, 50);
    timer = room_speed; // Reset timer to 1 second for the next regeneration step
}

//Regenerate mana
if (global.mana < 50) {
    if (!start_timer) {
        start_timer = true;
        timer = room_speed * 30;
    }
}

if (timer > 0) {
    timer--;
} else if (global.mana < 50) {
    global.mana = clamp(global.mana + 1, 0, 50);
    timer = room_speed; // Reset timer to 1 second for the next regeneration step
}


//Update input
input_left = input_check("left");
input_right = input_check("right");
input_up = input_check("up");
input_down = input_check("down");
keySprint = input_check("sprint");
keyRoll = input_check("roll");
keyCrouch = input_check_pressed("crouch");
keyAttack = input_check("attack");

script_execute(state);

if (input_check_pressed("weapon1")) {
	skeleton_attachment_set("Weapon", "Gun")
}
if (input_check_pressed("weapon2")) {
	skeleton_attachment_set("Weapon", "Gun2")
}
if (input_check_pressed("weapon3")) {
	skeleton_attachment_set("Weapon", "Sword")
}
if (input_check_pressed("weapon4")) {
	skeleton_attachment_set("Weapon", "Shotgun")
}
if input_check_pressed("weapon0") { 
	skeleton_attachment_set("Weapon", "Unarmed")
}

// Toggle light_active when the "light" key is first pressed
if (input_check_pressed("light")) {
    light_active = !light_active;
}



}