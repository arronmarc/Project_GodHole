yoffset = 17;
xoffset = 16;

x = obj_player.x + xoffset;
y = obj_player.y + yoffset;

direction = point_direction(x,y,mouse_x,mouse_y);

if (direction > 90) && (direction < 270) 
{
	image_yscale = -1; 
}
else 
{
	image_yscale = 1;
}


image_angle = direction;

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
		with (instance_create_layer(x+lengthdir_x(length,direction),y+lengthdir_y(length,direction),"Player",projectile))
		{
			direction = other.direction;
			speed = other.bulletspeed;
		}
		ammo[weapon] -= 1;
	}
	with (obj_player)
	{
		hsp -= lengthdir_x(other.recoil_push,other.direction);
		vsp -= lengthdir_y(other.recoil_push,other.direction);
	}
	current_recoil = recoil;
}

current_delay = max(-1,current_delay-1);
if (current_delay == -1) current_cd = max(0,current_cd-1);
current_recoil = max(0,floor(current_recoil*0.8));



var dir_to_mouse = point_direction(x, y, mouse_x, mouse_y);

if ((dir_to_mouse >= 0) && (dir_to_mouse < 90)) || ((dir_to_mouse > 225) && (dir_to_mouse <= 360))
{
    depth = -1000;
}
else
{
    depth = -100;
}


if (keyboard_check_pressed(ord("1")) && ammo[1] > 0) ChangeWeapon(1);
if (keyboard_check_pressed(ord("2")) && ammo[2] > 0) ChangeWeapon(2);
if (keyboard_check_pressed(ord("0"))) ChangeWeapon(0);