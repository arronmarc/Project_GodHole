//obj_player create event
IK_create(10,8) //initialist the IK system

dir=0 //variable used for movement system only but not necessary
b=0 //this is to make the object "bounce" while running - just for game feel

/// @desc Variables
w_spd = 1;
n_spd = 2;
r_spd = 4;
spd = n_spd;

global.stamina = 100;
global.staminamax = 100;

if (global.targetX != -1)
{
	x = global.targetX;
	y= global.targetY;
	direction = global.targetDirection;
}