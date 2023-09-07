if (crops.planting = true) {
var xx = 0;
var cs = crops.cellSize;

draw_set_alpha(0);

var r = roomWidth div cs;
repeat (r) {
	draw_line_colour(xx, 0, xx, roomHeight, c_white, c_white);
	xx += cs;
}

var yy = 0;

var r = roomHeight div cs;
repeat (r) {
	draw_line_colour(0, yy, roomWidth, yy, c_white, c_white);
	yy += cs;
}

draw_set_alpha(1);
}