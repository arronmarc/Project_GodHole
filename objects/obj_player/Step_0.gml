//Step event
//Update input
input_left = keyboard_check(ord("A"));
input_right = keyboard_check(ord("D"));
input_up = keyboard_check(ord("W"));
input_down = keyboard_check(ord("S"));
keySprint = keyboard_check(vk_shift);
keyRoll = keyboard_check(vk_space);
keyCrouch = keyboard_check_pressed(vk_control);




if (keyboard_check_pressed(ord("L"))) {
    light_active = !light_active;  // Toggle the light state
    
    if (light_active) {
        light.AddToRenderer(objLightController.renderer);  // Turn the light on
    } else {
        light.RemoveFromRenderer(objLightController.renderer);  // Turn the light off
    }
}

light.x = x;
light.y = y-30;
light.angle = point_direction(x, y, mouse_x, mouse_y);



script_execute(state);

if (rollTimer > 0) {
    rollTimer -= 1;
}


//Update the position of the occluder to match this instance's position
occluder.x = x;
occluder.y = y;