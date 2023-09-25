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

if (keyboard_check_pressed(ord("1"))) {
    global.selectedSlot = 0;
}
else if (keyboard_check_pressed(ord("2"))) {
    global.selectedSlot = 1;
}
else if (keyboard_check_pressed(ord("3"))) {
    global.selectedSlot = 2;
}
else if (keyboard_check_pressed(ord("4"))) {
    global.selectedSlot = 3;
}
else if (keyboard_check_pressed(ord("5"))) {
    global.selectedSlot = 4;
}
else if (keyboard_check_pressed(ord("6"))) {
    global.selectedSlot = 5;
}
else if (keyboard_check_pressed(ord("7"))) {
    global.selectedSlot = 6;
}
else if (keyboard_check_pressed(ord("8"))) {
    global.selectedSlot = 7;
}
else if (keyboard_check_pressed(ord("9"))) {
    global.selectedSlot = 8;
}
else if (keyboard_check_pressed(ord("0"))) {
    global.selectedSlot = 9;
}

