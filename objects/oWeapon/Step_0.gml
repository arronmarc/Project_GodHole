//oWeapon step event
yoffset = -20;

x = obj_player.x;
y = obj_player.y + yoffset;

image_angle = direction;
direction = point_direction(x,y,mouse_x,mouse_y);


if (direction > 90) && (direction < 270) 
{
	image_yscale = -1; 
}
else 
{
	image_yscale = 1;
}




var mouseb;
if (automatic)
{
	mouseb = mouse_check_button(mb_left); 
	
}
else 
{
	mouseb = mouse_check_button_pressed(mb_left);
	
}

if (mouseb)
{
	if (current_cd == 0)
	{
		current_cd = cooldown;
		current_delay = startup;
		
	}
}


if (current_delay == 0) && (projectile != -1)  && (mouse_check_button(mb_right))
{
	if (ammo[weapon] != 0)
	{
		with (instance_create_layer(x+lengthdir_x(other.length, direction), y + lengthdir_y(other.length, direction), "Instances", projectile)) {
		    //direction = other.direction;
		    speed = other.bulletspeed;
		}

		ammo[weapon] -= 1;
	}
	current_recoil = _x;
	curvePos = 0;
	curveSpd = 0.01;
	
}

current_delay = max(-1,current_delay-1);
if (current_delay == -1) current_cd = max(0,current_cd-1);
current_recoil = max(0,floor(current_recoil*0.005));



curvePos += curveSpd;//move the animation along
var curveStruct = animcurve_get(acRecoil);

//change the guns angle
var channel = animcurve_get_channel(curveStruct,"angle");
var angvalue = animcurve_channel_evaluate(channel,curvePos);


if (mouse_check_button(mb_right) && mouse_check_button(mb_left)) {
	var aim = point_direction(x,y,mouse_x,mouse_y);
	_imgAngle = image_angle - (angvalue*sign(image_yscale)) + random_range(aim-5,aim+5);
} else {
	_imgAngle = image_angle - (angvalue*sign(image_yscale));
}



//move the guns x pos
var channel = animcurve_get_channel(curveStruct,"x");
var xvalue = animcurve_channel_evaluate(channel,curvePos);
_x = x-lengthdir_x(xvalue,_imgAngle);


//reset at the end of the animation
if curvePos >= 1 {
	curveSpd = 0;
	curvePos = 0;
}


//For depth sorting based on direction
var dir_to_mouse = point_direction(x, y, mouse_x, mouse_y);

if ((dir_to_mouse >= 0) && (dir_to_mouse < 90)) || ((dir_to_mouse > 225) && (dir_to_mouse <= 360))
{
    depth = -100;
}
else
{
    depth = 0;
}

if (keyboard_check_pressed(ord("1")) && ammo[1] > 0) ChangeWeapon(1);
if (keyboard_check_pressed(ord("2")) && ammo[2] > 0) ChangeWeapon(2);
if (keyboard_check_pressed(ord("0"))) ChangeWeapon(0);