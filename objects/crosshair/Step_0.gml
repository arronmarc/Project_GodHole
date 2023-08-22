var camera = view_camera[0];
var view_x = camera_get_view_x(camera);
var view_y = camera_get_view_y(camera);
var view_width = camera_get_view_width(camera);
var view_height = camera_get_view_height(camera);

var thumbstick_speed = 5; // Adjust to your preference, this determines the speed of the crosshair movement

// Update position based on input method
if (input_check("aim")) {
    // If aiming with gamepad
    var thumbstick_x = gamepad_axis_value(0, gp_axisrh); // Right Thumbstick Horizontal
    var thumbstick_y = gamepad_axis_value(0, gp_axisrv); // Right Thumbstick Vertical

    // Update the crosshair's position based on thumbstick input
    x += thumbstick_x * thumbstick_speed;
    y += thumbstick_y * thumbstick_speed;

    // Constrain the position to the view's dimensions
    x = clamp(x, view_x, view_x + view_width);
    y = clamp(y, view_y, view_y + view_height);
} else {
    // If not aiming with gamepad, follow mouse position
    var _mouse_x = mouse_x;
    var _mouse_y = mouse_y;

    // Constrain the mouse position to the view's dimensions
    _mouse_x = clamp(_mouse_x, view_x, view_x + view_width);
    _mouse_y = clamp(_mouse_y, view_y, view_y + view_height);

    // Update the position of the object
    x = _mouse_x;
    y = _mouse_y;
}


// Get the mouse position
var _mouse_x = mouse_x;
var _mouse_y = mouse_y;

// Constrain the mouse position to the view's dimensions
_mouse_x = clamp(_mouse_x, view_x, view_x + view_width);
_mouse_y = clamp(_mouse_y, view_y, view_y + view_height);

// Update the position of the object
x = _mouse_x;
y = _mouse_y;



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
} else {
    visible = false;
    scale_counter = 0;
    image_xscale = lerp(image_xscale, 1, 0.1);
    image_yscale = lerp(image_yscale, 1, 0.1);
}



if(input_check("aim")) {
    window_set_cursor(cr_none);
} else {
    window_set_cursor(cr_default);
}
