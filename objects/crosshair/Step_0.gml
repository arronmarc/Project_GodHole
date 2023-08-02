x = mouse_x;
y = mouse_y;

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
