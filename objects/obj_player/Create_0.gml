/// @desc Variables
w_spd = 2;
n_spd = 4;
r_spd = 8;
spd = n_spd;
//image_speed = .4;


x_offset = sprite_get_xoffset(mask_index);
y_offset = sprite_get_yoffset(mask_index);

x_frame = 1;
y_frame = 8;

spr_base = spr_base_male_1;
spr_torso = spr_torso_male_shirt_white;
spr_legs = spr_legs_male_green;
spr_hair = spr_hair_male_messy_raven;
spr_feet = spr_feet_male_boots_brown;

anim_length = 4;
anim_speed = 8;
dir = 0;
image_xscale = 1;
anim_counter = 0; 



global.stamina = 100;
global.staminamax = 100;


if (global.targetX != -1)
{
	x = global.targetX;
	y= global.targetY;
	direction = global.targetDirection;
}