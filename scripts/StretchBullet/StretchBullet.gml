function StretchBullet(){
var scale = max(1, bulletspeed*sprite_width);
draw_sprite_ext(sprite_index, image_index, x, y, scale, image_yscale, image_angle, image_blend, image_alpha);
}