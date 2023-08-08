depth= -1;
scale = 2;
show_inventory = false;

inv_slots = 17;
inv_slots_width = 8;
inv_slots_height = 3;

selected_slot = 0;
pickup_slot = -1;
m_slotx = 0;
m_sloty = 0;

x_buffer = 2;
y_buffer = 4;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

cell_size = 32;

inv_UI_width = 288;
inv_UI_height = 192;

spr_inv_UI = spr_inventory_UI;
spr_inv_items = spr_inventory_items;

spr_inv_items_columns = sprite_get_width(spr_inv_items)/cell_size;
spr_inv_items_rows = sprite_get_height(spr_inv_items)/cell_size;

inv_UI_x = (gui_width * 0.5) - (inv_UI_width * 0.5 * scale);
inv_UI_y = (gui_height * 0.5) - (inv_UI_height * 0.5 * scale);

info_x = inv_UI_x + (9 * scale);
info_y = inv_UI_y + (9 * scale);

slots_x = info_x;
slots_y = inv_UI_y + (40 * scale);

desc_x = info_x;
desc_y = inv_UI_y + (156 * scale);

//Player info
//0 = GOLD
//1 = SILVER
//2 = BRONZE
//3 = NAME

ds_player_info = ds_grid_create(2, 4);
ds_player_info[# 0, 0] = "Gold";
ds_player_info[# 0, 1] = "Silver";
ds_player_info[# 0, 2] = "Bronze";
ds_player_info[# 0, 3] = "Name";

ds_player_info[# 1, 0] = irandom_range(0,99);
ds_player_info[# 1, 1] = irandom_range(0,99);
ds_player_info[# 1, 2] = irandom_range(0,99);
ds_player_info[# 1, 3] = "Player";

//Inventory
//0 = ITEM
//1 = NUMBER

ds_inventory = ds_grid_create(2, inv_slots);

//Items
enum item {
	none = 0,
	tomato = 1,
	potato = 2,
	carrot = 3,
	artichoke = 4,
	chilli = 5,
	gourd = 6,
	corn = 7,
	wood = 8,
	stone = 9,
	bucket = 10,
	chair = 11,
	picture = 12,
	axe = 13,
	potion = 14,
	starfish = 15,
	mushroom = 16,
	height = 17
	
}

#region Create items info grid

ds_items_info = ds_grid_create(2, item.height);

//Item names
var z = 0, i = 0;
ds_items_info[# z, i++] = "Nothing";
ds_items_info[# z, i++] = "Tomato";
ds_items_info[# z, i++] = "Potato";
ds_items_info[# z, i++] = "Carrot";
ds_items_info[# z, i++] = "Artichoke";
ds_items_info[# z, i++] = "Chilli";
ds_items_info[# z, i++] = "Gourd";
ds_items_info[# z, i++] = "Corn";
ds_items_info[# z, i++] = "Wood";
ds_items_info[# z, i++] = "Stone";
ds_items_info[# z, i++] = "Bucket";
ds_items_info[# z, i++] = "Chair";
ds_items_info[# z, i++] = "Picture";
ds_items_info[# z, i++] = "Axe";
ds_items_info[# z, i++] = "Potion";
ds_items_info[# z, i++] = "Starfish";
ds_items_info[# z, i++] = "Mushroom";

//Item descriptions
var z = 1, i = 0;
ds_items_info[# z, i++] = "Empty slot.";
ds_items_info[# z, i++] = "It's a fruit.";
ds_items_info[# z, i++] = "It's a vegetable.";
ds_items_info[# z, i++] = "It's a vegetable.";
ds_items_info[# z, i++] = "It's a vegetable.";
ds_items_info[# z, i++] = "It's a vegetable.";
ds_items_info[# z, i++] = "It's a vegetable.";
ds_items_info[# z, i++] = "It's a vegetable.";
ds_items_info[# z, i++] = "It came from a tree.";
ds_items_info[# z, i++] = "Found in the ground.";
ds_items_info[# z, i++] = "Great for holding water. Great for holding water. Great for holding water.";
ds_items_info[# z, i++] = "For sitting etc.";
ds_items_info[# z, i++] = "For looking at.";
ds_items_info[# z, i++] = "Chops real nice.";
ds_items_info[# z, i++] = "Doesn't do anything.";
ds_items_info[# z, i++] = "Sea boy.";
ds_items_info[# z, i++] = "It's a fungi.";

#endregion

var yy = 0; repeat(inv_slots){
	ds_inventory[# 0, yy] = irandom_range(1, item.height-1);
	ds_inventory[# 1, yy] = irandom_range(1, 10);
	
	yy += 1;
}
	