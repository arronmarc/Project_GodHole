/// @description Insert description here
// You can write your code in this editor

if (!collected && place_meeting(x, y, obj_player)) {
	
	//Add to inventory


	//Collected
	collected = true
	}

//Collected: fade away
if (collected) {
	
	image_alpha -= 0.05;
	y -= 0.5;
	
	if (image_alpha < 0.1) {
		instance_destroy();
	}
	
}






