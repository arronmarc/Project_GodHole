function inv_get_item_array(){

/// @desc Gets the array for an item
/// @arg item

var _item = argument[0];

var _list = obj_manager.invList;
var _listSize = ds_list_size(_list);

for (var i = 0; i < _listSize; i++) {
	
	var _arr = _list[| i ];
	
	if (is_array(_arr)) {
		var _arrItem = _arr[0];
		
		if (_arrItem == _item) {
			return _arr;
		}
	}
}




}