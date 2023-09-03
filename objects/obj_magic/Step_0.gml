part_particles_create(global.P_System, x, y, global.Particle1, 1);
part_emitter_region(global.P_System, global.Emitter2, x, x, y, y, ps_shape_ellipse, ps_distr_gaussian);
part_emitter_burst(global.P_System, global.Emitter2, global.Particle1, 10);
part_emitter_stream(global.P_System, global.Emitter2, global.Particle1, 10);


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
	instance_destroy();	
}

BulletDebris();