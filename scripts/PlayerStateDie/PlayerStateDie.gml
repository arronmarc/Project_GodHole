function PlayerStateDie() {
	
	var deathTimer = -1;
	
    if skeleton_animation_get() != "Die" {
        skeleton_animation_set("Die", false);
        deathTimer = 30;  // Initialize the timer for 5 seconds
    }
	
    spd = 0;
	moveX = 0;
	moveY = 0;
	speed = 0;
	x = 0;
	y = 0;

	animation_start_time = current_time;
    animation_playing = true;

    // When the timer reaches zero, transition the room.
    if (deathTimer == 0) {
	    global.targetX = -1;
	    global.targetY = -1;
	    RoomTransition(TRANS_TYPE.FADE, r_demo);
    }
}
