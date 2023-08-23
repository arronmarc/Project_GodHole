//Step event
if (!global.pause) 
{

//Update input
input_left = input_check("left");
input_right = input_check("right");
input_up = input_check("up");
input_down = input_check("down");
keySprint = input_check("sprint");
keyRoll = input_check("roll");
keyCrouch = input_check_pressed("crouch");

if (input_check_pressed("light")) {
    light_active = !light_active;  // Toggle the light state
    
    if (light_active) {
        light.AddToRenderer(objLightController.renderer);  // Turn the light on
    } else {
        light.RemoveFromRenderer(objLightController.renderer);  // Turn the light off
    }
}

light.x = x;
light.y = y-30;
light.angle = point_direction(x, y, crosshair.x, crosshair.y);

script_execute(state);

if (rollTimer > 0) {
    rollTimer -= 1;
}


//Update the position of the occluder to match this instance's position
occluder.x = x;
occluder.y = y;

}