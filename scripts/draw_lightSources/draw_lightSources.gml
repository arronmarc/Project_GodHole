function draw_lightSources() {
	if global.lightingCycle = false then exit;
	//THIS WILL UPDATE THE SURFACE SIZE IF THE VIEW SIZE CHANGES TO MAKE SURE IT ALWAYS FITS
	if !surface_exists(cycleSurf) then cycleSurf = surface_create(room_width,room_height); //Create the surface in case if somehow gets destroyed.
   
	surface_set_target(cycleSurf); //This sets the surface to send the lights too.
	draw_clear(cycleColor); //THIS SETS THE SHADING COLOR OF YOUR SURFACE

	//-----------------------------------------------------------------------------------------------------
	//Examples of possible light sources such as torches or fireballs or headlights
	//REMOVE or COMMENT OUTSIDE OF EXAMPLE SCENE
	if alpha > 0  { //This just stops the resource use during the middle of the day. Adjust as needed.
	    with(obj_fireTest) {
	        gpu_set_blendmode(bm_subtract);
	        draw_sprite_ext(spr_lightSource_four,image_index,x,y,glowSize,glowSize,0,c_white,1);
	        gpu_set_blendmode(bm_normal);
	        }
	    with(obj_fireTest_dead) {
	        gpu_set_blendmode(bm_subtract);
	        draw_sprite_ext(spr_lightSource_three,image_index,x,y,glowSize,glowSize,0,c_white,.5);
	        gpu_set_blendmode(bm_normal);
	        }
	    with(obj_lightTest) {
	        gpu_set_blendmode(bm_subtract);
	        draw_sprite_ext(spr_lightSource_two,image_index,x,y,glowSize,glowSize,0,lightColor,.5);
	        gpu_set_blendmode(bm_normal);
	        }

	    with(oTorch) {
	        UpdateTorch()
	    }
		
		with(oPlayerLight) {
	        gpu_set_blendmode(bm_subtract);
	        draw_sprite_ext(sprLightPlayer,image_index,obj_player.x,obj_player.y,glowSize,glowSize,0,lightColor,1);
	        gpu_set_blendmode(bm_normal);
	    }
		
		with(oBulletLight) {
	        gpu_set_blendmode(bm_subtract);
	        draw_sprite_ext(spr_bulletLight,image_index,x,y,glowSize,glowSize,objDir,lightColor,1);
	        gpu_set_blendmode(bm_normal);
	    }

			
	    }
	//-----------------------------------------------------------------------------------------------------
	surface_reset_target();
	draw_surface_ext(cycleSurf, 0,0,1,1,0,c_white,alpha); //THIS DRAWS THE SURFACE WITH THE CURRENT ALPHA IN THE ROOM







}
