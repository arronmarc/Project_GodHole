//Step event
if (global.pause) {
    image_speed = 0;
    return; // Exit the function early since the game is paused.
}
else {
    image_speed = 1; // Resume the animation. Adjust this value if your standard playback speed is different.
}

if (!global.pause) 
{

//AI
//fear control - in order to work with the shooter AI
scr_fear_control(red_bullet)
fear-=1

//spawning teammates
if fear<=1 && instance_number(blue_obj)<5 && !instance_exists(drone)
instance_create(irandom(room_width),room_height+30,blue_obj)

//formation
var i;
for (i=0; i<instance_number(blue_obj); i+=1)
{
    var blue=instance_find(blue_obj,i);
    blue.fx = 30* (i div 3)
    blue.fy = 50* (i mod 3)
}

//Update input
input_left = input_check("left");
input_right = input_check("right");
input_up = input_check("up");
input_down = input_check("down");
keySprint = input_check("sprint");
keyRoll = input_check("roll");
keyCrouch = input_check_pressed("crouch");

script_execute(state);

if (rollTimer > 0) {
    rollTimer -= 1;
}

//Update the position of the occluder to match this instance's position
occluder.x = x;
occluder.y = y;

if (input_check_pressed("weapon1")) {

	skeleton_attachment_set("Weapon", "Gun")
}
if (input_check_pressed("weapon2")) {
	
	skeleton_attachment_set("Weapon", "Gun2")
}
if (input_check_pressed("weapon3")) {

	skeleton_attachment_set("Weapon", "Sword")
}
if input_check_pressed("weapon0") { 
	
	skeleton_attachment_set("Weapon", "Unarmed")
	
}



}