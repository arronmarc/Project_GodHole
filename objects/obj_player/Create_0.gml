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
r_spd = 8;
spd = n_spd;
isCrouching = false;
rollSpd = 10;
rollDistance = 10;
rollTimer = 0;
isRolling = false;
skidTimer = 0;
skidFriction = 0.5;  // Adjust this to achieve the desired skidding effect
lastMovedDirection = 0; // default to right (0 degrees in GM:S)


global.stamina = 500;
global.staminamax = 500;


if (global.targetX != -1)
{
	x = global.targetX;
	y= global.targetY;
	direction = global.targetDirection;
}