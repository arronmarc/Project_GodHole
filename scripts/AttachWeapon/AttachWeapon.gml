function AttachWeapon(){

    //HANDLE ORIENTATION BASED ON MOUSE

    if (mouse_check_button(mb_right)) {
		///Room Start Event for objLight
		
        if (mouse_x < x) {
            image_xscale = -1;  // Face left
        } else if (mouse_x > x) {
            image_xscale = 1;   // Face right
        }
        skeleton_attachment_set("Arm_bottom2", "6af34888-93e4-4ce6-8f04-3758bbca36f4");
    } else {
        skeleton_attachment_set("Arm_bottom2", "Arm_bottom");

        // If not adjusting for mouse input, then check the movement direction
        if (moveX != 0) {
            image_xscale = sign(moveX);
        }
    }
	
	
	

}