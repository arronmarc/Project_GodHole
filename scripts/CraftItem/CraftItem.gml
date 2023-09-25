// CraftItem function
function CraftItem() {
	if (global.selectedCraftingItem == -1) {
        show_message("No item selected!");
        return;
    }
    var item = global.selectedCraftingItem;
	// Get the item that is currently selected in your UI (assuming it's stored in a variable named item)
	var _recipe = global.itemRecipe[item];
	var _recipeSize = array_length_1d(_recipe);

	// Check ingredients
	var _canCraft = true;
	for (var i = 0; i < _recipeSize; i++) {
		// Get ingredient data 
		var _ingr = _recipe[i];
		var _item = _ingr[0];
		var _count = _ingr[1];

		// Get item array
		var _arr = inv_get_item_array(_item);

		if (!is_array(_arr) || (_arr[1] < _count)) {
			_canCraft = false;
			break;
		}
	}

	// If the ingredients are available, craft the item
	if (_canCraft) {
		// Deplete ingredients
		for (var i = 0; i < _recipeSize; i++) {
			// Get ingredient data
			var _ingr = _recipe[i];
			var _item = _ingr[0];
			var _count = _ingr[1];
			
			// Get item array and reduce count
			var _arr = inv_get_item_array(_item);
			_arr[@ 1] -= _count;
		}
		
		// Add crafted item to inventory
		inv_add(item, 1);

		// Here, you might want to add additional feedback like playing a sound or showing an animation
		// sound_play(snd_item_crafted);
	}
	else {
		// Handle the case where the item can't be crafted, for example by showing an error message
		// show_message("Not enough ingredients!");
	}
}
