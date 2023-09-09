if(instance_exists(obj_player))
{
	draw_sprite(sBackstamina,1,8,16)
	draw_sprite_ext(sFrontHealth,1,8,16,
	max(0,global.health/global.healthmax),1,0,c_white,1);
	
	draw_sprite(sBackstamina,1,8,24)
	draw_sprite_ext(sFrontMana,1,8,24,
	max(0,global.mana/global.manamax),1,0,c_white,1);
	
	draw_sprite(sBackstamina,1,8,32)
	draw_sprite_ext(sFrontstamina,1,8,32,
	max(0,global.stamina/global.staminamax),1,0,c_white,1);
}

if instance_exists(red_obj) {
draw_text(0,0,string_hash_to_newline("Enemy aggression: "+string((1100-global.enemyfearmax)/100)))
}

if (is_array(movingArray)) {
	//Item data
	var _item = movingArray[0]
	var _spr = global.itemSprite[_item];
	
	//Mouse position
	var _mouseX = device_mouse_x_to_gui(0);
	var _mouseY = device_mouse_y_to_gui(0);
	
	//Draw item
	draw_sprite(_spr, 0, _mouseX, _mouseY);
}