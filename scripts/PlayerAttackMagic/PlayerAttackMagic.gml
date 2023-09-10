function PlayerAttackMagic() {	
	if (input_check("aim"))
	{
		
	if (rollTimer == 0) and (global.mana > 0) {
	    // Initialize the attack
	    skeleton_animation_set("Magic fire");  // Assuming "Attack" is your animation
	    rollTimer = 14;  // Set the timer
	}

	// Decrement the timer
	rollTimer -= 1;

	if (rollTimer <= 0) {
	    state = PlayerStateFree;  // Return to the free state
	}
		
		var player_angle = point_direction(obj_player.x, obj_player.y, crosshair.x, crosshair.y);
		var offsetDistance = 40; // Distance from the player to spawn the bullet

		var bullet_x = obj_player.x + lengthdir_x(offsetDistance, player_angle);
		var bullet_y = obj_player.y + lengthdir_y(offsetDistance, player_angle);
			
		if (global.mana > 0) {
			with (instance_create_layer(bullet_x, bullet_y, "Assets_1", obj_magic)) {
			    speed = 10;
			    //Screenshake(10, 5);
			}
			
		}
	}
}
