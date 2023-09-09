/// @description Create chest UI
//Dimensions
var _margin = 10;
var _sep = 10;
var _cellSize = 64;

//Lists to show
var _listArray = [chestID.itemList,invList];
var _sizeArray = [chestID.maxItemCount, INV_SIZE];
var _listCount = 2;

//Create lists
for (var i = 0; i < _listCount; i++) {
	//List ID & inventory size
	var _list = _listArray[i];
	var _invSize = _sizeArray[i];
	
	//Size
	var _sizeX = _invSize / 2;
	var _sizeY = 2;
	
	//Area size
	var _areaWidth = (_cellSize + _sep) * _sizeX;
	var _areaHeight = (_cellSize + _sep) * _sizeY;
	_areaWidth -= _sep;
	_areaHeight -= _sep;
	
	//Area position
	var _areaX = (RES_W / 2) - (_areaWidth / 2);
	var _areaY = _margin;
	
	if (i == 1) _areaY = RES_H - (_margin + _areaHeight);
	
	//Start placing buttons 
	var _x = 0;
	var _y = 0;
	
	for (var j = 0; j < _invSize; j++) {
		var _btnX = _areaX + (_cellSize + _sep) * _x;
		var _btnY = _areaY + (_cellSize + _sep) * _y;
		
		createButtonMoveable(_btnX, _btnY, _cellSize, _cellSize, _list, j);
		
		//Next position
		_x ++;
		
		if (_x == _sizeX) {
			_x = 0;
			_y ++;
		}
	}
}