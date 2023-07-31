/*
-----------------------
	Alpha2.5D Engine
	- By REVEAM
-----------------------
*/

// Simple 3D collision detection for DEMO
function place_meeting_3D(x, y, z, obj) {
	// Loop over all instances
	for (i = 0; i < instance_number(obj); ++i) {
		// Get colliding instance
		var inst = instance_find(obj, i);
		if (place_meeting(x, y, inst)) {
			// Check z coordinate overlap
			if (z >= inst.z - inst.zheight && z - zheight <= inst.z)
				return true;
		}
	}
	
	// return false if no collision was detected
	return false;
}