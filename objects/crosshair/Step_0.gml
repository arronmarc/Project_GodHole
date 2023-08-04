var camera = view_camera[0];
var view_x = camera_get_view_x(camera);
var view_y = camera_get_view_y(camera);
var view_width = camera_get_view_width(camera);
var view_height = camera_get_view_height(camera);

// Get the mouse position
var _mouse_x = mouse_x;
var _mouse_y = mouse_y;

// Constrain the mouse position to the view's dimensions
_mouse_x = clamp(_mouse_x, view_x, view_x + view_width);
_mouse_y = clamp(_mouse_y, view_y, view_y + view_height);

// Update the position of the object
x = _mouse_x;
y = _mouse_y;



if (mouse_check_button(mb_right)) {
    visible = true;
    if (mouse_check_button(mb_left)) {
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



if(mouse_check_button(mb_right)) {
    window_set_cursor(cr_none);
} else {
    window_set_cursor(cr_default);
}
