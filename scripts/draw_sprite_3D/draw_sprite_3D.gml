//draw_sprite_3D function
function draw_sprite_3D(sprite, image, x, y, x_frame, y_frame, frame_size, x_offset, y_offset) {
    // Calculate which part of the spritesheet to draw.
    var xpart = floor(x_frame) * frame_size;
    var ypart = floor(y_frame) * frame_size;

    var xx = x - x_offset;
    var yy = y - y_offset;

    // Use spr_spritesheet as sprite, 0 as subimage, and xx and yy as coordinates.
    draw_sprite_part(
        spr_spritesheet,
        0,
        xpart,
        ypart,
        frame_size,
        frame_size,
        xx,
        yy
    );
}