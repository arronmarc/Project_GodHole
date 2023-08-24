if (global.pause) {
	
	var _wheel = mouse_wheel_up() - mouse_wheel_down();
	_wheel *= 32;
	
	cMenuScroll += _wheel;
	
	//Limit
	cMenuScroll = clamp(cMenuScroll, -cMenuHeight, 0);
	
	//Apply
	with (oButtonCraft) {
		y = ystart + other.cMenuScroll;
	}
	with (oButtonTitle) {
		y = ystart + other.cMenuScroll;
	}
	
}