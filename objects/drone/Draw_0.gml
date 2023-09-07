draw_self()


if (isDead != true) {
	if state = 0 {  //if in the search state then draw the view cone with an alpha of 0.1	
		//draw the view cone
		gpu_set_blendmode(bm_subtract);
        draw_sprite_ext(spr_torch, 0, xx, yy, 0.5, 1, look_dir, c_white, 0.4);
        gpu_set_blendmode(bm_normal);
		
		
		//draw_sprite_ext(spr_torch, 0, xx, yy, 0.5, 1, look_dir, c_white, 0.4);
		//draw_triangle_color(xx,yy-20+5*sin(degtorad(b)),x+lengthdir_x(200,look_dir-30),y+lengthdir_y(250,look_dir-30),x+lengthdir_x(200,look_dir+30),y+lengthdir_y(250,look_dir+30),col_look,col,col,0)
		} 
		
		else {
			//if in the alert state then draw it with an alpha of 0.8
			draw_sprite_ext(spr_torch, 0, xx, yy, 0.5, 1, look_dir, c_white, 0.8);
		
		}
		
		draw_set_alpha(1)
}
