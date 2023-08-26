function PlayerStateDie() {
	
    if skeleton_animation_get() != "Die" {
        skeleton_animation_set("Die", true); 
    }
	
    moveX = 0;
    moveY = 0;
	
	global.targetX = -1;
	global.targetY = -1;
	RoomTransition(TRANS_TYPE.FADE, r_demo);




}
