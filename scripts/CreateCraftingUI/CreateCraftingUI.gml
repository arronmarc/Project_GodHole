function CreateCraftingUI(){
self.draw_crafting = function(_destroy_preemptively=false) {

    // Destroy if already exists and parameter has been passed - useful for redrawing/updating
    if (_destroy_preemptively && UI.exists("CraftingPanel")) UI.get("CraftingPanel").destroy();

    if (!UI.exists("CraftingPanel")) {
        
		// Create panel and set properties
        var _panel = new UIPanel("CraftingPanel", 600, 200, 400, 600, grey_panel);
		_panel.setCloseButtonSprite(red_cross).setTitle("[fnt_text_24][c_white]CRAFTING").setTitleOffset({x:0, y:15}).setResizable(false);
		
        // Create grid with two rows, one column and 80%-20% proportions 
        var _grid_meta = _panel.add(new UIGrid("CraftingMetaGrid", 1, 2));
        _grid_meta.setMarginTop(_panel.getDragBarHeight()).setColumnProportions([0.2,0.8]).setShowGridOverlay(true).scroll(UI_ORIENTATION.VERTICAL, 1, 1);

        var _infoGroup = _grid_meta.addToCell(new UIGroup("InfoGroup", 0, 0, 100, 100, noone, UI_RELATIVE_TO.TOP_LEFT), 0, 1);
        _infoGroup.add(new UIText("ItemName", 100, 20, "[fnt_text_24][c_white]Name:", UI_RELATIVE_TO.TOP_LEFT));
        _infoGroup.add(new UIText("ItemDescription", 100, 60, "[fnt_text_18][c_white]Description:", UI_RELATIVE_TO.TOP_LEFT));
        _infoGroup.add(new UIText("ItemRecipe", 100, 110, "[fnt_text_18][c_white]Required Items:", UI_RELATIVE_TO.TOP_LEFT));
		
		// Button
		var _button = _grid_meta.addToCell(new UIButton("CraftButton", 0, -20, 250, 50, "Craft", blue_button00, UI_RELATIVE_TO.BOTTOM_CENTER), 0, 1);
		
		with (_button) {
        setTextFormat("[c_black]");
        setSpriteMouseover(blue_button01);
        setTextFormatMouseover("[c_white]");
		
		setCallback(UI_EVENT.LEFT_CLICK, CraftItem)
		}
		
        // Add inventory grid to upper part of meta-grid
        var _rows = 10;
        var _cols = 1;
        var _grid = _grid_meta.addToCell(new UIGrid("CraftingGrid", _rows, _cols), 0, 0);
        _grid.setMarginTop(_panel.getDragBarHeight()).setMarginLeft(20);

        // Add crafting options here
        for (var _i = 0; _i < _rows; _i++) {
            var _col = 0;  // Only one column
            var _row = _i;  // Row will be equal to _i

            var _craftingItem = global.craftingMenu[_i];

            if (is_string(_craftingItem)) {
                var _titleGroup = _grid.addToCell(new UIGroup("TitleGroup" + string(_i), 0, 0, 48, 48, noone, UI_RELATIVE_TO.MIDDLE_LEFT), _row, _col);
                _titleGroup.add(new UIText("TitleText" + string(_i), 0, 0, "[c_white][fnt_text_18]" + _craftingItem, UI_RELATIVE_TO.MIDDLE_CENTER));
            } else {
                var _group = _grid.setSpacings(58).addToCell(new UIGroup("ItemGroup" + string(_i), 0, 0, 48, 48, spr_Slot, UI_RELATIVE_TO.MIDDLE_LEFT), _row, _col);
                var _sprKey = _craftingItem;

                // Check if the player has this item in their inventory
                var _inventoryIndex = ds_list_find_index(obj_manager.invList, _sprKey);
                var _quantity = -1;
                if (_inventoryIndex != -1 && is_array(obj_manager.invList[| _inventoryIndex])) {
                    var _itemData = obj_manager.invList[| _inventoryIndex];
                    _quantity = _itemData[1];
                }

                var _spr = _group.add(new UISprite("ItemSprite" + string(_i), 0, 0, global.itemSprite[_sprKey], , , , UI_RELATIVE_TO.MIDDLE_CENTER));
                if (_quantity > 1) {
                    _group.add(new UIText("ItemCount" + string(_i), -10, -10, "[c_white][fnt_text_18]" + string(_quantity), UI_RELATIVE_TO.BOTTOM_RIGHT));
                }



                // Setting click callback for updating item details
                _spr.setCallback(UI_EVENT.LEFT_CLICK, method({_item: _craftingItem}, function() {
                    var itemName = global.itemName[_item];
                    var itemDesc = global.itemDescription[_item];
                    var itemRecipe = global.itemRecipe[_item];

                    var recipeStr = "";
                    for (var _j = 0; _j < array_length_1d(itemRecipe); _j++) {
                        var ingItem = itemRecipe[_j][0];
                        var ingCount = itemRecipe[_j][1];
                        recipeStr += global.itemName[ingItem] + " x" + string(ingCount) + "\n";
                    }

                    // Now update the UI
                    UI.get("ItemName").setText("[fnt_text_24][c_white]" + itemName);
                    UI.get("ItemDescription").setText("[fnt_text_18][c_white]" + itemDesc);
                    UI.get("ItemRecipe").setText("[fnt_text_18][c_white]Required Items:\n" + recipeStr);
					
					global.selectedCraftingItem = _item;

					
                }));
            }
        }

        // Display the first item's details by default
        if (array_length_1d(global.craftingMenu) > 0 && !is_string(global.craftingMenu[0])) {
            var firstItem = global.craftingMenu[0];
            var itemName = global.itemName[firstItem];
            var itemDesc = global.itemDescription[firstItem];
            var itemRecipe = global.itemRecipe[firstItem];

            var recipeStr = "";
            for (var _j = 0; _j < array_length_1d(itemRecipe); _j++) {
                var ingItem = itemRecipe[_j][0];
                var ingCount = itemRecipe[_j][1];
                recipeStr += global.itemName[ingItem] + " x" + string(ingCount) + "\n";
            }

            UI.get("ItemName").setText("[fnt_text_24][c_white]" + itemName);
            UI.get("ItemDescription").setText("[fnt_text_18][c_white]" + itemDesc);
            UI.get("ItemRecipe").setText("[fnt_text_18][c_white]Required Items:\n" + recipeStr);
        }
    } else {
        // If the inventory already exists, destroy it
        UI.get("CraftingPanel").destroy();
		
    }
}

if (input_check_pressed("crafting")) {
    self.draw_crafting();
}
}