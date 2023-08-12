if (mouse_check_button(mb_right)) {
    var _map_left_arm = ds_map_create();

    skeleton_bone_state_get("Left arm bone bottom", _map_left_arm);

    var _dir = point_direction(x, y-25, mouse_x, mouse_y);

	//draw_line(x, y-40, mouse_x, mouse_y);

    // Adjust the angle based on the character's orientation
    if (image_xscale < 0) {
        _dir = 180 - _dir;
    }

    ds_map_replace(_map_left_arm, "angle", _dir-260);

    skeleton_bone_state_set("Left arm bone bottom", _map_left_arm);

    ds_map_destroy(_map_left_arm);
}
