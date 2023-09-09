/// @arg <chestID>

function TogglePause(){

if (is_array(obj_manager.movingArray)) {
	return;
}

with (obj_player) {
	if (placingMode) {
		event_user(1);
	}
}

with(obj_manager) {
	if (!global.pause) {
			global.pause = true;
		
			//Chest UI
			if (argument_count > 0) {
				chestID = argument[0];
				event_user(2);
			}
			//UI
			else {
				event_user(0);
			}
		}
		else {
			global.pause = false;
			event_user(1);
		}
	
}

}