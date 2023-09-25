//Step event
if (hover && lclick) {
	
	//Already moving an array
	if (is_array(obj_manager.movingArray)) {
		var _arr = list[| slotID];
		
		//If slot is empty
		if (!is_array(_arr)) {
			list[| slotID] = obj_manager.movingArray;
			obj_manager.movingArray = -1;
		}
		
		//If slot has an item in it
		else {
			var _myItem = _arr[0];
			var _newItem = obj_manager.movingArray[0];
			
			//Same items
			if (_myItem == _newItem) {
				_arr[@ 1] += obj_manager.movingArray[1];
				obj_manager.movingArray = -1;
			}
		}
	}
	else {
		var _arr = list[| slotID];
		
		if (is_array(_arr)) {
			obj_manager.movingArray = _arr;
			list[| slotID] = -1;
		}
	}
	
}