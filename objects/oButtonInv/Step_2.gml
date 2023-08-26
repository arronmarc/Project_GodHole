var _arr = obj_manager.invList[| slotID];

if (is_array(_arr)) {
	var _count = _arr[1];
	
	if (_count <= 0) {
		inv_remove(slotID);
	}
}