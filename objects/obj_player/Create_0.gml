//Create event
image_xscale = 0.07;
image_yscale = 0.07;

fear=0; //player's fear level (used to interact with the shooter ai)
fear_max=400;

global.enemyfearmax=100;  //set the enemy's max fear when they spawn in

state = PlayerStateFree;

skeleton_skin_set("Default body");
skeleton_attachment_set("Gun", "Gun");

SmoothAnimTrans()

w_spd = 1;
n_spd = 4;
r_spd = 10;
spd = n_spd;

isCrouching = false;

rollSpd = 10;
rollDistance = 8;
rollTimer = 0;
isRolling = false;

skidTimer = 0;
skidFriction = 0.5;
lastMovedDirection = 0; 

//heldItem = instance_create_layer(x, y, "Instances", oPickaxe);

aSpeed = 0.6; // Acceleration speed
dSpeed = 0.4; // Deceleration speed
currentSpeed = 0; // Current speed of the player, which will change due to acceleration and deceleration

original_bone_y = 0; // Initial value to be updated once we get the real value
var _map_temp = ds_map_create();
skeleton_bone_state_get("Gun bone", _map_temp);
original_bone_y = _map_temp[? "y"];
ds_map_destroy(_map_temp);

global.health = 1;
global.healthmax = 50;
global.stamina = 500;
global.staminamax = 500;

if (global.targetX != -1)
{
	x = global.targetX;
	y= global.targetY;
	direction = global.targetDirection;
}


light_active = false;
light = 0;