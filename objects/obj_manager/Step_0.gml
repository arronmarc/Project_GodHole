//Pause the game
if (input_check("pause")) {
	if (!global.pause) {
		global.pause = true;
		pauseSurf = surface_create(RES_W, RES_H);
		surface_copy(pauseSurf, 0, 0, application_surface);
	}
	else {
		global.pause = false;
		if(surface_exists(pauseSurf)) {
			surface_free(pauseSurf);
		}
	}
}