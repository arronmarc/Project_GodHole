// Inherit the parent event of oButtonParent
event_inherited();

//Get array from slot list
var _list = list;
var _arr = _list[| slotID];

//Draw item
if (is_array(_arr)) {
	var _item = _arr[0];
	var _spr = global.itemSprite[_item];
	
	draw_sprite(_spr, 0, x + width / 2, y + height / 2);
	
	//Draw count
	var _count = _arr[1];
	
	draw_set_font(fnt_text_24);
	draw_text(x + 2, y + 4, _count);
}