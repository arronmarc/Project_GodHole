/// @description Create inv UI

//Dimensions
var _margin = 10;
var _sep = 10;
var _cellSize = 64;

//Inventory items
#region Crafting UI

var _w = 240;
var _h = 52;
var _x = viewWidthHalf;
var _y = viewHeightHalf;

var _titleH = 32;

var _arr = global.craftingMenu;
var _size = array_length_1d(_arr);

for (var i=0; i<_size; i++) {
	var _item = _arr[i];
	
	//Title
	if (is_string(_item)) {
		//Create button title
		createButtonTitle(_x, _y, _w, _titleH, _item);
		
		_y += (_titleH + _sep);
	}
	//Crafting button
	else {
		createButtonCraft(_x, _y, _w, _h, _item);
		
		_y += (_h + _sep);
	}
}

cMenuHeight = _y - RES_H;

#endregion



