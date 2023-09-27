CreateInventoryUI();

CreateCraftingUI();

CreateEquipmentUI();

CreateHotbarUI();

if (global.draggedItemSprite != -1) {
    draw_sprite_ext(global.draggedItemSprite, 0, crosshair.x, crosshair.y, 1, 1, 0, c_white, 0.8);
    // Optionally, draw the quantity as well:
    if (global.draggedItemQuantity > 1) {
        draw_text_color(crosshair.x + 10, crosshair.y + 10, string(global.draggedItemQuantity), c_white, c_white, c_white, c_white, 1);
    }
}


