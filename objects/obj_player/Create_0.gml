/// @desc Variables
state = PlayerStateFree;

z = 0;
zheight = 32;

zsp = 0;
grav = .8;

spd = 4;
jumpspeed = -8;

ground_height = 0;

image_speed = .4;

x_offset = 10;
y_offset = 12;
frame_size = 52;

x_frame = 0;
y_frame = 0;

anim_length = 4;
anim_speed = 8;
dir = 0;

image_xscale = 1;

anim_counter = 0; 

global.stamina = 100;
global.staminamax = 100;
sprintSpeed = 8;

if (global.targetX != -1)
{
	x = global.targetX;
	y= global.targetY;
	direction = global.targetDirection;
}