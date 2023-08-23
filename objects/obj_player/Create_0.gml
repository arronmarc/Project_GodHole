//Create event
state = PlayerStateFree;

skeleton_animation_mix("Idle","Walk",0.03);
skeleton_animation_mix("Walk","Idle",0.03);
skeleton_animation_mix("Idle","Run",0.03);
skeleton_animation_mix("Run","Idle",0.03);
skeleton_animation_mix("Run","Crouch",0.03);
skeleton_animation_mix("Crouch","Run",0.03);
skeleton_animation_mix("Idle","Crouch",0.03);
skeleton_animation_mix("Crouch","Idle",0.03);
skeleton_animation_mix("Idle crouch","Crouch",0.03);
skeleton_animation_mix("Crouch","Idle crouch",0.03);
skeleton_animation_mix("Idle","Idle crouch",0.03);
skeleton_animation_mix("Idle crouch","Idle",0.03);

skeleton_attachment_set("Arm_bottom2", "Arm_bottom")

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
skidFriction = 0.5;  // Adjust this to achieve the desired skidding effect
lastMovedDirection = 0; // default to right (0 degrees in GM:S)

heldItem = instance_create_layer(x, y, "Instances", oPickaxe);

aSpeed = 0.4; // Acceleration speed
dSpeed = 1; // Deceleration speed
currentSpeed = 0; // Current speed of the player, which will change due to acceleration and deceleration


global.stamina = 500;
global.staminamax = 500;


if (global.targetX != -1)
{
	x = global.targetX;
	y= global.targetY;
	direction = global.targetDirection;
}



var _map_left_arm = ds_map_create();
skeleton_bone_state_get("Left arm bone bottom", _map_left_arm);
original_bone_y = _map_left_arm[? "y"];
ds_map_destroy(_map_left_arm);

recoil_amount = 20;      // Amount the bone will move during recoil
recoil_time = 0;        // Counter to keep track of recoil effect duration
recoil_duration = 5;    // Number of frames the recoil effect should last
