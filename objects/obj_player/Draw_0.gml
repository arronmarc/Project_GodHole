draw_sprite(sShadow,0,floor(x),floor(y)+50);
draw_self()

if (showKey != -1) {	
	draw_sprite_ext(showKey, 0, x-5, y-30, 1, 1, 0, -1, 1);
	showKey = -1;
}