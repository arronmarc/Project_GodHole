//Check if the slot is empty and then remove it

//Check count
var _arr = obj_manager.invList[| slotID];

if (is_array(_arr)) {
	var _count = _arr[1];
	
	//Remove it
	if (_count <= 0) {
		inv_remove(slotID);
	}
}