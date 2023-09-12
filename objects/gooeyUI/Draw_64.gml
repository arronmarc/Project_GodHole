#region INVENTORY UI
self.draw_inventory = function(_destroy_preemptively=false) {

    // Destroy if already exists and parameter has been passed - useful for redrawing/updating
    if (_destroy_preemptively && UI.exists("InventoryPanel")) UI.get("InventoryPanel").destroy();


    if (!UI.exists("InventoryPanel")) {
        // Create panel and set properties
        var _panel = new UIPanel("InventoryPanel", 20, 20, 250, 300, grey_panel);
        _panel.setCloseButtonSprite(red_cross).setTitle("[fnt_text_24][c_white]INVENTORY").setTitleOffset({x:0, y:15}).setResizable(false);
		
		// Create grid with two rows, one column and 80%-20% proportions 
        var _grid_meta = _panel.add(new UIGrid("MetaGrid", 2, 1));
        _grid_meta.setRowProportions([0.8,0.2]).setMarginTop(_panel.getDragBarHeight());
		
		// Add inventory grid to upper part of meta-grid
        var _rows = 4;
        var _cols = 4;
		var _grid = _grid_meta.addToCell(new UIGrid("InventoryGrid", _rows, _cols), 0, 0);
		
		// Add an UIText to display the item descriptions when they are hovered - for now set the default text
		var _text = _grid_meta.addToCell(new UIText("ItemDescription", 0, 0, "[fnt_text_12][c_white]No item selected", UI_RELATIVE_TO.MIDDLE_CENTER), 1, 0);
		
		// Process and draw inventory - for each item, create the icon and set interaction
		for (var _i=0, _n=_rows*_cols; _i<_n; _i++) {
            var _col = _i % 4;
            var _row = _i div 4;
		    var _group = _grid.addToCell(new UIGroup("ItemGroup"+string(_i), 0, 0, 48, 48, spr_Slot, UI_RELATIVE_TO.MIDDLE_CENTER), _row, _col); 

		    if (_i < ds_list_size(obj_manager.invList) && is_array(obj_manager.invList[| _i])) {
				
		        var _itemData = obj_manager.invList[| _i];
		        var _sprKey = _itemData[0];
		        var _quantity = _itemData[1];
		        var _spr = _group.add(new UISprite("ItemSprite"+string(_i), 0, 0, global.itemSprite[_sprKey],,,,UI_RELATIVE_TO.MIDDLE_CENTER));
		        if (_quantity > 1) {
		            _group.add(new UIText("ItemCount"+string(_i), -10, -10, "[c_white][fnt_text_12]"+string(_quantity), UI_RELATIVE_TO.BOTTOM_RIGHT));
		        }
				
	            _spr.setCallback(UI_EVENT.MOUSE_OVER, method({desc: global.itemDescription[_sprKey]}, function() {
	                if (UI.exists("ItemDescription")) UI.get("ItemDescription").setText("[fnt_text_12][c_white]"+desc);
	            }));

	            _spr.setCallback(UI_EVENT.MOUSE_EXIT, function() {
	                if (UI.exists("ItemDescription")) UI.get("ItemDescription").setText("[fnt_text_12][c_white]No item selected");
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
#endregion


#region CRAFTING UI

self.draw_crafting = function(_destroy_preemptively=false) {

    // Destroy if already exists and parameter has been passed - useful for redrawing/updating
    if (_destroy_preemptively && UI.exists("CraftingPanel")) UI.get("CraftingPanel").destroy();


    if (!UI.exists("CraftingPanel")) {
        // Create panel and set properties
        var _panel = new UIPanel("CraftingPanel", 200, 200, 250, 300, grey_panel);
        _panel.setCloseButtonSprite(red_cross).setTitle("[fnt_text_24][c_white]CRAFTING").setTitleOffset({x:0, y:15}).setResizable(false);
		
		// Create grid with two rows, one column and 80%-20% proportions 
        var _grid_meta = _panel.add(new UIGrid("MetaGrid", 2, 1));
        _grid_meta.setRowProportions([0.8,0.2]).setMarginTop(_panel.getDragBarHeight());
		
		// Add inventory grid to upper part of meta-grid
        var _rows = 4;
        var _cols = 4;
		var _grid = _grid_meta.addToCell(new UIGrid("CraftingGrid", _rows, _cols), 0, 0);
		
		// Add an UIText to display the item descriptions when they are hovered - for now set the default text
		var _text = _grid_meta.addToCell(new UIText("ItemDescription", 0, 0, "[fnt_text_12][c_white]No item selected", UI_RELATIVE_TO.MIDDLE_CENTER), 1, 0);
		
		// Process and draw inventory - for each item, create the icon and set interaction
		for (var _i=0, _n=_rows*_cols; _i<_n; _i++) {
            var _col = _i % 4;
            var _row = _i div 4;
		    var _group = _grid.addToCell(new UIGroup("ItemGroup"+string(_i), 0, 0, 48, 48, spr_Slot, UI_RELATIVE_TO.MIDDLE_CENTER), _row, _col); 

		    if (_i < ds_list_size(obj_manager.invList) && is_array(obj_manager.invList[| _i])) {
				
		        var _itemData = obj_manager.invList[| _i];
        var _mainItem = _itemData[0]; // Rename here

        // Crafting Interaction on Mouse Press
        _spr.setCallback(UI_EVENT.MOUSE_DOWN, method({_mainItem: _mainItem}, function() {
            var _recipe = global.itemRecipe[_mainItem]; // Use renamed variable here
            var _recipeSize = array_length_1d(_recipe);

            var _canCraft = true;
            for (var j = 0; j < _recipeSize; j++) {
                var _ingr = _recipe[j];
                var _item = _ingr[0]; // This remains the same
                var _count = _ingr[1];

                var _arr = inv_get_item_array(_item);
                if (!is_array(_arr) || (_arr[1] < _count)) {
                    _canCraft = false;
                    break;
                }
            }

            if (_canCraft) { 
                craftAnim = 0.02; 
                if (craftAnim >= 1) {
                    craft_item(_mainItem); // Use renamed variable here
                    craftAnim = 0;
                }
            }
        }));

        // Crafting Tooltip on Mouse Hover
        _spr.setCallback(UI_EVENT.MOUSE_OVER, method({_sprKey: _sprKey}, function() {
            var _recipe = global.itemRecipe[_sprKey];
            var _recipeSize = array_length_1d(_recipe);
            var _text = "";
            for (var j = 0; j < _recipeSize; j++) {
                var _ingr = _recipe[j];
                var _item = _ingr[0];
                var _count = _ingr[1];

                var _itemName = global.itemName[_item];
                _text += _itemName + " x" + string(_count) + " ";
            }

            if (UI.exists("ItemDescription")) UI.get("ItemDescription").setText("[fnt_text_12][c_white]" + _text);
        }));

        _spr.setCallback(UI_EVENT.MOUSE_EXIT, function() {
            if (UI.exists("ItemDescription")) UI.get("ItemDescription").setText("[fnt_text_12][c_white]No item selected");
        });
    }
}
	}
}
// Crafting function
function craft_item(_item) {
    var _recipe = global.itemRecipe[_item];
    var _recipeSize = array_length_1d(_recipe);

    for (var j = 0; j < _recipeSize; j++) {
        var _ingr = _recipe[j];
        var _item = _ingr[0];
        var _count = _ingr[1];

        var _arr = inv_get_item_array(_item);
        _arr[@ 1] -= _count;
    }
    
    inv_add(_item, 1);
}
	

// Call this function when necessary
if (input_check_pressed("crafting")) {
    self.draw_crafting();
}

#endregion


#region HOTBAR UI
// 1. Hotbar configuration

var hotbarHeight = 200;  // Height of the hotbar
var hotbarY = display_get_gui_height() - hotbarHeight;  // Y position of the hotbar (at the bottom)
var slotCount = 10;  // Number of slots
var slotWidth = sprite_get_width(spr_Slot);  // Width of each slot based on the slot sprite
var slotHeight = hotbarHeight;  // Height of each slot
var gapBetweenSlots = 20;  // Gap between slots

// 2. Calculate the total width and starting X-coordinate

var totalWidth = slotCount * slotWidth + (slotCount - 1) * gapBetweenSlots;  // Total width of the slots and the gaps
var startX = (display_get_gui_width() - totalWidth) / 2;  // Starting X-coordinate to center slots

// 3. Drawing the hotbar and the items

for (var i = 0; i < slotCount; i++) {
    // Calculate the position for this slot
    var currentX = startX + i * (slotWidth + gapBetweenSlots);

    // Draw the slot background
    draw_sprite(spr_Slot, 0, currentX + (slotWidth / 2), hotbarY + (slotHeight / 2));

    // If there's an item in this slot of the inventory, draw it
    if (i < ds_list_size(obj_manager.invList) && is_array(obj_manager.invList[| i])) {
        var itemData = obj_manager.invList[| i];
        var sprKey = itemData[0];
        var quantity = itemData[1];

        // Draw item sprite centered in the slot
        draw_sprite(global.itemSprite[sprKey], 0, currentX + (slotWidth), hotbarY + (hotbarHeight / 1.8));

        // If there's more than one item, draw the quantity
        if (quantity > 1) {
            var itemCountX = currentX + slotWidth - 10;
            var itemCountY = hotbarY + slotHeight - 10;
            draw_text(itemCountX, itemCountY, string(quantity));
        }
    }
}
#endregion
