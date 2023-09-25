

//Crafting animation
if (craftAnim > 0) {
	craftAnim += 0.02;
	
	if (craftAnim >= 1) {
		event_user(0);
		craftAnim = 0;
	}
}
else {
	craftAnim = 0;
}