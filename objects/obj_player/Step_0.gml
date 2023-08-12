//Step event
//Update input
input_left = keyboard_check(ord("A"));
input_right = keyboard_check(ord("D"));
input_up = keyboard_check(ord("W"));
input_down = keyboard_check(ord("S"));
keySprint = keyboard_check(vk_shift);
keyRoll = keyboard_check(vk_space);
keyCrouch = keyboard_check_pressed(vk_control);


script_execute(state);

if (rollTimer > 0) {
    rollTimer -= 1;
}


