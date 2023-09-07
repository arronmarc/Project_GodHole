//Placing mode
if (placingMode and instance_exists(placingInst)) {
	var _colliding = false;
	
	//Move instance
	with (placingInst) {
		x = round(mouse_x/ PLACING_GRID_SIZE) * PLACING_GRID_SIZE;
		y = round(mouse_y/ PLACING_GRID_SIZE) * PLACING_GRID_SIZE;
		
		//Collision
		_colliding = place_meeting(x, y, oBreakableParent) 
					 or place_meeting(x, y, obj_player)
					 or place_meeting(x, y, drone)
					 or place_meeting(x, y, red_obj);
	}
	
	//Colliding
	if (_colliding) placingInst.image_blend = c_red;
	else placingInst.image_blend = c_white;
	
	//Place
	if (!_colliding && mouse_check_button_pressed(mb_left)) {
		event_user(1);
	}
}