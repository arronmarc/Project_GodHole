function DirectionalVisibility(){
var dir_to_mouse = point_direction(x, y, mouse_x, mouse_y);

if ((dir_to_mouse >= 0) && (dir_to_mouse < 90)) || ((dir_to_mouse > 225) && (dir_to_mouse <= 360))
{
    depth = -100;
}
else
{
    depth = 0;
}
}