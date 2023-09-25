function CreateInventoryUI(){
self.draw_inventory = function(_destroy_preemptively=false) {

    // Destroy if already exists and parameter has been passed - useful for redrawing/updating
    if (_destroy_preemptively && UI.exists("InventoryPanel")) UI.get("InventoryPanel").destroy();


    if (!UI.exists("InventoryPanel")) {
        // Create panel and set properties
        var _panel = new UIPanel("InventoryPanel", 1050, 200, 600, 280, grey_panel);
        _panel.setCloseButtonSprite(red_cross).setTitle("[fnt_text_24][c_white]INVENTORY").setTitleOffset({x:0, y:15}).setResizable(false);
		
		// Create grid with two rows, one column and 80%-20% proportions 
        var _grid_meta = _panel.add(new UIGrid("MetaGrid", 2, 1));
        _grid_meta.setRowProportions([0.8,0.2]).setMarginTop(_panel.getDragBarHeight());
		
		// Add inventory grid to upper part of meta-grid
        var _rows = 3;
        var _cols = 10;
		var _grid = _grid_meta.addToCell(new UIGrid("InventoryGrid", _rows, _cols), 0, 0);
		
		// Add an UIText to display the item descriptions when they are hovered - for now set the default text
		var _text = _grid_meta.addToCell(new UIText("ItemDescription", 0, 0, "[fnt_text_18][c_white]No item selected", UI_RELATIVE_TO.MIDDLE_CENTER), 1, 0);
		
		// Process and draw inventory - for each item, create the icon and set interaction
		for (var _i=0, _n=_rows*_cols; _i<_n; _i++) {
            var _col = _i % 10;
            var _row = _i div 10;
		    var _group = _grid.addToCell(new UIGroup("ItemGroup"+string(_i), 0, 0, 48, 48, spr_Slot, UI_RELATIVE_TO.MIDDLE_CENTER), _row, _col); 

		    if (_i < ds_list_size(obj_manager.invList) && is_array(obj_manager.invList[| _i])) {
				
		        var _itemData = obj_manager.invList[| _i];
		        var _sprKey = _itemData[0];
		        var _quantity = _itemData[1];
		        var _spr = _group.add(new UISprite("ItemSprite"+string(_i), 0, 0, global.itemSprite[_sprKey],,,,UI_RELATIVE_TO.MIDDLE_CENTER));
		        if (_quantity > 1) {
		            _group.add(new UIText("ItemCount"+string(_i), -10, -10, "[c_white][fnt_text_18]"+string(_quantity), UI_RELATIVE_TO.BOTTOM_RIGHT));
		        }
				
	            _spr.setCallback(UI_EVENT.MOUSE_OVER, method({desc: global.itemDescription[_sprKey]}, function() {
	                if (UI.exists("ItemDescription")) UI.get("ItemDescription").setText("[fnt_text_18][c_white]"+desc);
	            }));

	            _spr.setCallback(UI_EVENT.MOUSE_EXIT, function() {
	                if (UI.exists("ItemDescription")) UI.get("ItemDescription").setText("[fnt_text_18][c_white]No item selected");
	            });
				
				
				#region USING ITEMS
				//Use item
				_spr.setCallback(UI_EVENT.LEFT_CLICK, method({_i: _i}, function() {
				    var _arr = obj_manager.invList[| _i];
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
				                obj_manager.invList[| _i] = undefined;
				            }
				            gooeyUI.draw_inventory(true);

				            show_debug_message("The item was used");
				        } else {
				            show_debug_message("The item couldn't be used");
				        }
				    }
				}));
				#endregion
				
				
	            // Remove from inventory
	            _spr.setCallback(UI_EVENT.RIGHT_CLICK, method({_i: _i}, function() {
				// Save x,y position of inventory panel for later redraw
				var _xx = UI.get("InventoryPanel").getDimensions().x;
				var _yy = UI.get("InventoryPanel").getDimensions().y;
					
	                if (UI.exists("ItemSprite"+string(_i))) {
                        var _arr = obj_manager.invList[| _i];
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
                            inv_remove(_i);
                        }
	                }
					// Set it to the previously saved position
					UI.get("InventoryPanel").setDimensions(_xx, _yy);
					gooeyUI.draw_inventory(true);
	            }));
				
            }
        }
    }
    else {
        // If the inventory already exists, destroy it
        UI.get("InventoryPanel").destroy();
		
    }
}

if (input_check_pressed("inventory")) {
    self.draw_inventory();
}
}