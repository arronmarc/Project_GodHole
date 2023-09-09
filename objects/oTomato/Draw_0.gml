if (obj_player.placingMode && !initialDraw) {
    draw_self();
    initialDraw = true;
} else {
    draw_sprite_part(
        spr_crops, 0, growthStage*frameWidth,
        0, 32, 64, x-16, y-52
    );
}

//Draw sparkle
if(sparkle >= 0){
	draw_sprite(spr_sparkle, sparkle, x, y);
	sparkle += .1;
	if(sparkle >= sprite_get_number(spr_sparkle)){
		sparkle = -1;
		alarm[1] = random_range(4,5)*room_speed;
	}
}