//Crafting animation
if (craftAnim > 0) {
	craftAnim += 0.02;
	
	if (craftAnim >= 1) {
		event_user(0);
		craftAnim = 0;
	}
}
else {
	craftAnim = 0;
}

// Update weapon attachment 
if (global.selectedSlot < ds_list_size(obj_manager.invList)) {
    var _arr = obj_manager.invList[| global.selectedSlot];
    
    if (is_array(_arr)) {
        var _item = _arr[0];

        // Handle skeleton attachment for weapons
        if (ds_map_exists(global.weaponAttachments, _item)) {
            global.currentWeaponAttachment = global.weaponAttachments[? _item];
        } else {
            global.currentWeaponAttachment = "Unarmed";
        }
    }
}




if (keyboard_check_pressed(ord("E")) && global.selectedSlot < ds_list_size(obj_manager.invList)) {
					
					var _arr = obj_manager.invList[| global.selectedSlot];

				    if (is_array(_arr)) {
				        var _item = _arr[0];
				        var _count = _arr[1];
				        var _used = false;

				        switch (_item) {
				            case INVITEMS.POTION:
				                with (obj_player) {
				                    if (global.health < global.healthmax) {
				                        global.health += 20;
				                        _used = true;

				                        if (global.health > global.healthmax) global.health = global.healthmax;
				                    }
				                }
				                break;

				            case INVITEMS.SYRUP:
				                with (obj_player) {
				                    if (global.mana < global.manamax) {
				                        global.mana += 100;
				                        _used = true;

				                        if (global.mana > global.manamax) global.mana = global.manamax;
				                    }
				                }
				                break;

				            case INVITEMS.APPLE:
				                with (obj_player) {
				                    if (global.health < global.healthmax) {
				                        global.health += 5;
				                        _used = true;

				                        if (global.health > global.healthmax) global.health = global.healthmax;
				                    }
				                }
				                break;

				            default:
				                if (global.itemPlaceable[_item] != noone) {
				                    TogglePause();

				                    with (obj_player) {
				                        placingObj = global.itemPlaceable[_item];
				                        event_user(0);
				                    }
				                    _used = true;
				                }
				                break;
				        }

				        // Used
				        if (_used) {
				            // Reduce count
				            _arr[@ 1]--;
            
				            // Check if empty
				            if (_arr[1] <= 0) {
				                obj_manager.invList[| global.selectedSlot] = undefined;

				            }
				            gooeyUI.draw_inventory(true);

				            show_debug_message("The item was used");
				        } else {
				            show_debug_message("The item couldn't be used");
				        }
				    }
				
}
