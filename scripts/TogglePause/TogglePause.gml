function TogglePause(){

with (obj_player) {
	if (placingMode) {
		event_user(1);
	}
}

with(obj_manager) {

	var pauseSurf = surface_create(RES_W, RES_H);

	if (!global.pause) {
			global.pause = true;
		
		
		
			surface_copy(pauseSurf, 0, 0, application_surface);
		
			//UI call
			event_user(0);
		}
		else {
			global.pause = false;
		
			if(surface_exists(pauseSurf)) {
				surface_free(pauseSurf);
			}
			event_user(1);
		}
	
}

}