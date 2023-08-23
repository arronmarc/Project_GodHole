if (!collected && place_meeting(x, y, obj_player)) {
	
	//Add to inventory
	var _added = inv_add(type, 1);

	//Collected
	collected = _added;
	}

//Collected: fade away
if (collected) {
	
	image_alpha -= 0.05;
	y -= 0.5;
	
	if (image_alpha < 0.1) {
		instance_destroy();
	}
	
}

if (z < 0) {
	zspd += 0.5;
	z += zspd;
	
	//Ground collision
	if (z >= 0) {
		z = 0;
		zspd = 0;
	}
}




