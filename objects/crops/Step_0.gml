#region Planting
if(keyboard_check_pressed(ord("P"))) {
	planting = !planting 
	}
	
if(planting){
	mx = clamp(mouse_x, 0, (room_width div cellSize-1)*cellSize);
	my = clamp(mouse_y, 0, (room_height div cellSize-1)*cellSize);
	
	if(mouse_wheel_up()) selectCrop += 1;
	if(mouse_wheel_down()) selectCrop -= 1;
	
	if(selectCrop > sprite_get_number(spr_crops_picked)-1) {
		selectCrop = 0;
	} else if (selectCrop < 0) {
		selectCrop = sprite_get_number(spr_crops_picked)-1 
	}
	
	if(mouse_check_button_pressed(mb_middle)) {
		instance_create_crop(mx, my, selectCrop);
	}
}
#endregion

#region Growing

if(instance_exists(obj_crop) and keyboard_check_pressed(ord("G"))){
	with(obj_crop){
		if(growthStage < maxGrowthStage){
			daysOld += 1;
			
			//First growth
			var firstGrowth = 0;
			if(daysOld > 0){ firstGrowth = 1; }
			
			growthStage = firstGrowth + (daysOld div growthStageDuration);
		} else {
			growthStage = maxGrowthStage;
			fullyGrown = true;
			alarm[1] = 1;
		}
	}
}

#endregion