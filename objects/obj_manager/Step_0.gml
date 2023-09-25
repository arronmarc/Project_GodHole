if (global.inventoryUpdated) {
    gooeyUI.draw_inventory(true);  // Assuming gooeyUI is accessible and has the draw_inventory method
    global.inventoryUpdated = false;
}
	
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
	
if (input_check_pressed("roll")) {
	GiveSelfItems();
}
	


if (keyboard_check_pressed(ord("Y"))) {
    global.lightingCycle = !global.lightingCycle;
}
if (keyboard_check_pressed(ord("M"))) {
fun_changeTime(1,1,1,false, false, true)
}
