function TogglePause(){

if (!global.pause) {
		global.pause = true;
		
		pauseSurf = surface_create(RESOLUTION_W, RESOLUTION_H);
		
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