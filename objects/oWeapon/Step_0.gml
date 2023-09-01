if (!global.pause) 
{


bulletDirection = point_direction(x, y, crosshair.x, crosshair.y);

var mouseb;
if (automatic)
{ mouseb = input_check("shoot");}
else { mouseb = input_check_pressed("shoot"); }
if (mouseb)
{ if (current_cd == 0) { current_cd = cooldown; current_delay = startup; } }

if (current_delay == 0) && (projectile != -1) && (input_check("aim")) && (input_check("shoot"))
{
    var player_angle = point_direction(obj_player.x, obj_player.y, crosshair.x, crosshair.y);
    var offsetDistance = 40; // Distance from the player to spawn the bullet

    var bullet_x = obj_player.x + lengthdir_x(offsetDistance, player_angle);
    var bullet_y = obj_player.y + lengthdir_y(offsetDistance, player_angle);

    if (ammo[weapon] != 0)
    {
        // Spawn the projectile at the calculated endpoint
        with (instance_create_layer(bullet_x, bullet_y, "Instances", projectile)) {
            speed = other.bulletspeed;
            Screenshake(10, 5);
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


/*
curvePos += curveSpd;//move the animation along
var curveStruct = animcurve_get(acRecoil);

//change the guns angle
var channel = animcurve_get_channel(curveStruct,"angle");
var angvalue = animcurve_channel_evaluate(channel,curvePos);

if (input_check("aim") && input_check("shoot")) {
	var aim = point_direction(x, y, crosshair.x, crosshair.y);

	//Use this line for random angles
	//_imgAngle = image_angle - (angvalue*sign(image_yscale)) + random_range(aim-5,aim+5);
	_imgAngle = image_angle - (angvalue*sign(image_yscale));
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

*/

if (input_check_pressed("weapon1") && ammo[1] > 0) ChangeWeapon(1);
if (input_check_pressed("weapon2") && ammo[2] > 0) ChangeWeapon(2);
if input_check_pressed("weapon0") ChangeWeapon(0);

//For depth sorting based on direction
var dir_to_mouse = point_direction(x, y, crosshair.x, crosshair.y);


if ((dir_to_mouse >= 0) && (dir_to_mouse < 90)) || ((dir_to_mouse > 225) && (dir_to_mouse <= 360))
{
    depth = -100;
}
else
{
    depth = 0;
}


}