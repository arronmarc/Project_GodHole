var camera = view_camera[0];
var view_x = camera_get_view_x(camera);
var view_y = camera_get_view_y(camera);
var view_width = camera_get_view_width(camera);
var view_height = camera_get_view_height(camera);

thumbstick_speed_factor = 0.1; // This determines the speed of the crosshair movement with thumbstick

var move_x = 0;
var move_y = 0;
var thumbstick_x = gamepad_axis_value(0, gp_axisrh);
var thumbstick_y = gamepad_axis_value(0, gp_axisrv);

// Check if using mouse
if ((input_check("aim")) or (input_check("shoot"))) {  
    using_gamepad = false;
}

// Check if the thumbstick is being moved
if (abs(thumbstick_x) > 0.1 || abs(thumbstick_y) > 0.1) { 
    using_gamepad = true;  // Set flag to true if thumbstick is being used
    // Update crosshair movement values based on thumbstick
    move_x = thumbstick_x * thumbstick_speed_factor;
    move_y = thumbstick_y * thumbstick_speed_factor;
    
    // Apply the movement to the crosshair
    x += move_x;
    y += move_y;
}

// Set crosshair position based on mouse if not using the gamepad
if (!using_gamepad) {
    x = mouse_x;
    y = mouse_y;
}

// Constrain the crosshair to the view's dimensions
x = clamp(x, view_x, view_x + view_width);
y = clamp(y, view_y, view_y + view_height);

// Remaining visual logic for aim animation and cursor setting
if (input_check("aim")) {
    visible = true;
    if (input_check("shoot")) {
        scale_counter += 1;
        var target_scale = (scale_counter mod 7 < 2.5) ? 2 : 1;
        image_xscale = lerp(image_xscale, target_scale, 0.1);
        image_yscale = lerp(image_yscale, target_scale, 0.1);
    } else {
        image_xscale = lerp(image_xscale, 1, 0.1);
        image_yscale = lerp(image_yscale, 1, 0.1);
        scale_counter = 0;
    }
    window_set_cursor(cr_none);
} else {
    visible = false;
    scale_counter = 0;
    image_xscale = lerp(image_xscale, 1, 0.1);
    image_yscale = lerp(image_yscale, 1, 0.1);
    window_set_cursor(cr_default);
}
