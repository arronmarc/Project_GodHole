//Destroy if we leave the camera bounds
var _cam = view_camera[0];
var _camX = camera_get_view_x(_cam);
var _camY = camera_get_view_y(_cam);

light.AddToRenderer(objLightController.renderer); 
light.x = x;
light.y = y;

alphaValue -= fadeSpeed; 
if (alphaValue < 0) alphaValue = 0; // Ensure the alpha doesn't go below 0

// Assuming the BulbLight object has a property or method to set alpha:
light.alpha = alphaValue;



if (!point_in_rectangle(x,y,_camX,_camY,_camX+camera_get_view_width(_cam),_camY+camera_get_view_height(_cam)))
{
	light.RemoveFromRenderer(objLightController.renderer);
	instance_destroy();	
}


BulletDebrisEnemies();