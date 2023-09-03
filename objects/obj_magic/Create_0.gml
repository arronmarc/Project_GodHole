direction = point_direction(obj_player.x, obj_player.y, crosshair.x, crosshair.y);

light = new BulbLight(objLightController.renderer, spr_bulletLight, 0, x, y);
light.angle = point_direction(x, y, crosshair.x, crosshair.y);

// Initialize alpha and fade speed for light
alphaValue = 1; // Start fully opaque
fadeSpeed = 0.05; // Adjust this value to control the fade speed of the light

global.mana --;



