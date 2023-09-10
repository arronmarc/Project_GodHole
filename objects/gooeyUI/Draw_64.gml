if (global.pause = true) { UI.exists("InventoryPanel"); }

// Method to draw the inventory with gooey
self.draw_inventory = function(_destroy_preemptively=false) {
	
	// Destroy if already exists and parameter has been passed - useful for redrawing/updating
	if (_destroy_preemptively) UI.get("InventoryPanel").destroy();

	if (!UI.exists("InventoryPanel")) {
		
		// Create panel and set properties
		var _panel = new UIPanel("InventoryPanel", 20, 20, 220, 300, grey_panel);
		_panel.setCloseButtonSprite(red_cross).setTitle("[fnt_UI][c_black]INVENTORY").setTitleOffset({x:0, y:15}).setResizable(false);

		// Create grid with two rows, one column and 80%-20% proportions (upper part will be the inventory and lower part the description)
		var _grid_meta = _panel.add(new UIGrid("MetaGrid", 2, 1));
		_grid_meta.setRowProportions([0.8,0.2]).setMarginTop(_panel.getDragBarHeight());
		
		// Add inventory grid to upper part of meta-grid
		var _rows = 3;
		var _cols = 3;
		var _grid = _grid_meta.addToCell(new UIGrid("InventoryGrid", _rows, _cols), 0, 0);
		// Add an UIText to display the item descriptions when they are hovered - for now set the default text
		var _text = _grid_meta.addToCell(new UIText("ItemDescription", 0, 0, "[fnt_UI_Mini][c_black]No item selected", UI_RELATIVE_TO.MIDDLE_CENTER), 1, 0);
		
		// Process and draw inventory - for each item, create the icon and set interaction
		var _m = array_length(self.inventory.items)
		for (var _i=0, _n=_rows*_cols; _i<_n; _i++) {
			// Determine what cell of the grid this needs to be drawn in
			var _col = _i % 3;
			var _row = _i div 3;
			// Add UIGroup with the slot sprite
			var _group = _grid.addToCell(new UIGroup("ItemGroup"+string(_i), 0, 0, 48, 48, spr_Slot, UI_RELATIVE_TO.MIDDLE_CENTER), _row, _col);
			
			// If there's an item, draw the sprite and set interaction
			if (_i<_m) {
				// Add the item sprite to the UIGroup
				var _spr = _group.add(new UISprite("ItemSprite"+string(_i), 0, 0, asset_get_index("spr_Gem_"+self.inventory.items[_i].key), ,,,UI_RELATIVE_TO.MIDDLE_CENTER));
				// Add the quantity indicator to the UIGroup (only if > 1)
				if (self.inventory.items[_i].quantity>1) _group.add(new UIText("ItemCount"+string(_i), -10, -10, "[c_black][fnt_UI_Number]"+string(self.inventory.items[_i].quantity), UI_RELATIVE_TO.BOTTOM_RIGHT));
				
				// Set mouse over to display a text on the description label
				_spr.setCallback(UI_EVENT.MOUSE_OVER, method({txt: obj_Game.items[$ self.inventory.items[_i].key+"Gem"].name, value: obj_Game.items[$ self.inventory.items[_i].key+"Gem"].value}, function() {
					if (UI.exists("ItemDescription")) UI.get("ItemDescription").setText("[fnt_UI_Mini][c_black]"+txt+"\nGold value: "+string(value));
				}));
				// Set default text on the description label when exiting the mouse
				_spr.setCallback(UI_EVENT.MOUSE_EXIT, function() {
					if (UI.exists("ItemDescription")) UI.get("ItemDescription").setText("[fnt_UI_Mini][c_black]No item selected");
				});
				// If left clicked, convert gem into gold
				_spr.setCallback(UI_EVENT.LEFT_CLICK, method({key: self.inventory.items[_i].key}, function() {
					// Save x,y position of inventory panel for later redraw
					var _x = UI.get("InventoryPanel").getDimensions().x;
					var _y = UI.get("InventoryPanel").getDimensions().y;
					// Increment player's gold according to gem's value
					obj_Player.gold += obj_Game.items[$ key+"Gem"].value;
					// Reduce the item's quantity in the inventory
					obj_Player.inventory.reduce_quantity(key);
					// Redraw the inventory panel
					obj_Player.draw_inventory(true);
					// Set it to the previously saved position
					UI.get("InventoryPanel").setDimensions(_x, _y);
				}));
				// If right clicked "drop" gem to the ground and free up inventory
				_spr.setCallback(UI_EVENT.RIGHT_CLICK, method({key: self.inventory.items[_i].key}, function() {
					// Save x,y position of inventory panel for later redraw
					var _x = UI.get("InventoryPanel").getDimensions().x;
					var _y = UI.get("InventoryPanel").getDimensions().y;
					// Reduce the item's quantity in the inventory
					obj_Player.inventory.reduce_quantity(key);
					// Create gem on the "ground"
					instance_create_layer(obj_Player.x + choose(-1,1)*irandom_range(-64, -32), obj_Player.y + choose(-1,1)*irandom_range(-64, -32), "Instances", obj_Gem, {color: key})
					// Redraw the inventory panel
					obj_Player.draw_inventory(true);
					// Set it to the previously saved position
					UI.get("InventoryPanel").setDimensions(_x, _y);
				}));
			}
		}
	}
	else {
		// If the inventory already exists, destroy it
		UI.get("InventoryPanel").destroy();
	}
}

// Call the method for drawing/destroying the inventory if we hit TAB
if (keyboard_check_pressed(vk_tab)) {
	self.draw_inventory();
}