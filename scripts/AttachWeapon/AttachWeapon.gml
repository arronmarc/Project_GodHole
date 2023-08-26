function AttachWeapon(){
    // 1. Handle orientation based on mouse or movement direction
    if (input_check("aim")) {
        if (mouse_x < x) {
            image_xscale = -1;  // Face left
        } else if (mouse_x > x) {
            image_xscale = 1;   // Face right
        }
    } else {
        // If not adjusting for mouse input, then check the movement direction
        if (moveX != 0) {
            image_xscale = sign(moveX);
        }
    }

    // 2. Calculate direction to crosshair
    var _dir = point_direction(x, y, crosshair.x, crosshair.y);

    // 3. Adjust for default gun orientation
    _dir -= 90;

    // 4. Handle the character flip
    if (image_xscale < 0) {
        var dx = lengthdir_x(1, _dir);
        var dy = lengthdir_y(1, _dir);
        
        // Flip the x component
        dx = -dx;
        
        _dir = point_direction(0, 0, dx, dy);
    }

    // Return the calculated direction
    return _dir;
}