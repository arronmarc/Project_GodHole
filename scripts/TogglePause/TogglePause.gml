function TogglePause(){

with (obj_player) {
	if (placingMode) {
		event_user(1);
	}
}

with(obj_manager) {
	if (!global.pause) {
			global.pause = true;
		
			//UI call
			event_user(0);
		}
		else {
			global.pause = false;
			event_user(1);
		}
	
}

}