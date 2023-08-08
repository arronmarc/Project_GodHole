function IK_step() {
	motion_counter+=5.2*power(legspeed*3,0.4)//this is the counting variable for the animation
	motion_counter=motion_counter mod 360  //limit the variable between 0 and 360



}
