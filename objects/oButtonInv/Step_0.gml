if (hover && input_check("shoot")) {
	var _arr = obj_manager.invList[| slotID];
	
	if (is_array(_arr)) {
		var _item = _arr[0];
		var _count = _arr[1];
		
		var _used = false;
		
		switch (_item) {
			case ITEM.POTION:
			with (obj_player) {
				if (global.health < global.healthmax) {
					global.health += 20;
					_used = true;
					
					if (global.health > global.healthmax) global.health = global.healthmax;
				}
			}
			break;
			
			case ITEM.APPLE:
			with (obj_player) {
				if (global.health < global.healthmax) {
					global.health ++ ;
					_used = true;
					
					if (global.health > global.healthmax) global.health = global.healthmax;
				}
			}
			break;
			
			case ITEM.BLOCK_WOOD:
				TogglePause();
				
				with (obj_player) {
					placingObj = global.itemPlaceable[_item];
					
					event_user(0);
				}
				_used = true;
			
			break;
		}
		
		//Used
		if (_used) {
			//Reduce count
			_arr[@ 1] --;
			
			show_debug_message("The item was used");
		}
		else {
			show_debug_message("The item couldn't be used");
		}
	}
}

if (hover && input_check("aim")) {
	var _arr = obj_manager.invList[| slotID];
	
	if (is_array(_arr)) {
		var _item = _arr[0];
		var _count = _arr[1];
		
		repeat (_count) {
			var _x = obj_player.x + irandom_range(32, 64);
			var _y = obj_player.y + irandom_range(32, 64);
			
			var _inst = instance_create_layer(_x, _y, "Instances", oItem);
			
			with (_inst) {
				type = _item;
				
				sprite_index = global.itemSprite[_item];
				
				z = -20;
			}
		}
		
		inv_remove(slotID);
	}
}
