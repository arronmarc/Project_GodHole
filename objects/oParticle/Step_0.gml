speed*=fric

switch(debris){
	case false:
	
		if(image_index >= image_number-1){
			instance_destroy()
		}
		break;
		case true:
		if(speed<=0){
			surface_set_target(debrisSurf)
			draw_self()
			surface_reset_target()
			instance_destroy()
		}
		break;
}
