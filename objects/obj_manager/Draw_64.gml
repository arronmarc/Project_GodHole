//Inventory debug
//var _listSize = ds_list_size(invList);

//for (var i=0; i<_listSize; i++) {
	
//	var _arr = invList[| i];
//	var _item = _arr[0];
//	var _count = _arr[1];
	
//	var _x = 8;
//	var _y = 8 +20 * i;
	
//	var _spr = global.itemSprite[_item];
//	draw_sprite(_spr, 0, _x, _y);
	
//	draw_text(_x + 4, _y - 2, _count);
//}

if instance_exists(red_obj) {
draw_text(0,0,string_hash_to_newline("Enemy aggression: "+string((1100-global.enemyfearmax)/100)))
}

