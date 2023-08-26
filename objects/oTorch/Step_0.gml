if (input_check_pressed("light")) {
    light_active = !light_active;  // Toggle the light state
    
    if (light_active) {
		light.RemoveFromRenderer(objLightController.renderer);
        light = new BulbLight(objLightController.renderer, spr_torch, 0, x, y);
		

    } else {
        light.RemoveFromRenderer(objLightController.renderer);
    }
	
}

light.x = x;
light.y = y-30;
light.angle = point_direction(x, y, crosshair.x, crosshair.y);
	
x = obj_player.x;
y = obj_player.y-30;