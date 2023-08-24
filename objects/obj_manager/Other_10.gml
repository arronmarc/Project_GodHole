/// @description Create inv UI
#region Inventory
//Dimensions
var _margin = 10;
var _sep = 10;
var _cellSize = 64;

//Inventory items
var _sizeX = 6;
var _sizeY = 2;

//Coordinates
var _invX = _margin;
var _invY = RES_H - (_margin + _sep + _cellSize * _sizeY);

//Create buttons
var _x = 0;
var _y = 0;

for(var i=0; i<INV_SIZE; i++) {
	//Button coordinates
	var _buttonX = _invX + (_sep + _cellSize) * _x;
	var _buttonY = _invY + (_sep + _cellSize) * _y;
	
	//Create button
	var _button = instance_create_depth(_buttonX, _buttonY, 0, oButtonInv);
	
	//Set properties
	with (_button) {
		slotID = i;
		
		width = _cellSize;
		height = _cellSize;
	}
	
	//Move position
	_x ++;
	
	if (_x == _sizeX) {
		_x = 0;
		_y ++;
	}
}
#endregion

#region Crafting

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



