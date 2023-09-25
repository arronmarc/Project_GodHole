function CreateHotbarUI() {
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

        // Draw the slot background based on whether it's selected
        if (i == global.selectedSlot) {
            draw_sprite(spr_SlotSelected, 0, currentX + (slotWidth / 2), hotbarY + (slotHeight / 2));
        } else {
            draw_sprite(spr_Slot, 0, currentX + (slotWidth / 2), hotbarY + (slotHeight / 2));
        }

        // If there's an item in this slot of the inventory, draw it
        if (i < ds_list_size(obj_manager.invList) && is_array(obj_manager.invList[| i])) {
            var itemData = obj_manager.invList[| i];
            var sprKey = itemData[0];
            var quantity = itemData[1];

            // Draw item sprite centered in the slot
            draw_sprite(global.itemSprite[sprKey], 0, currentX + (slotWidth), hotbarY + (hotbarHeight / 1.8));

            // If there's more than one item, draw the quantity
            if (quantity > 1) {
                var itemCountX = currentX + slotWidth + 20;
                var itemCountY = hotbarY + slotHeight - 70;
                draw_text_color(itemCountX, itemCountY, string(quantity), c_white, c_white, c_white, c_white, 1);
            }
        }
    }
}
