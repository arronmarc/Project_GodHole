//Create event
image_xscale = 0.07;
image_yscale = 0.07;
gun_bone_adjusted = false;

fear=0; //player's fear level (used to interact with the shooter ai)
fear_max=400;

global.enemyfearmax=100;  //set the enemy's max fear when they spawn in

global.health = 10;
global.healthmax = 50;

global.mana = 50;
global.manamax = 50;

global.stamina = 10;
global.staminamax = 100;

start_timer = false;
timer = 0;

state = PlayerStateFree;

skeleton_skin_set("Human");
global.currentWeaponAttachment = "Unarmed";

SmoothAnimTrans()

w_spd = 2;
n_spd = 4;
r_spd = 8;
spd = n_spd;

isCrouching = false;

rollSpd = 10;
rollDistance = 8;
rollTimer = 0;
isRolling = false;

skidTimer = 0;
skidFriction = 0.5;
lastMovedDirection = 0; 

animation_start_time = 0;
animation_playing = false;

//Placing mode
placingMode = false;
placingObj = noone;
placingInst = noone;

aSpeed = 0.6; // Acceleration speed
dSpeed = 0.4; // Deceleration speed
currentSpeed = 0;

if (global.targetX != -1)
{
	x = global.targetX;
	y= global.targetY;
	direction = global.targetDirection;
}

currentTorchDir = 0;
light_active = false;

gun_bone_adjusted = false;

//Show key
showKey = -1;