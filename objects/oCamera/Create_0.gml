//Create event
// Resolution
#macro RES_W 1920
#macro RES_H 1080
#macro RES_SCALE 1
#macro CAM_SMOOTH 0.1

view_enabled = true;
view_visible[0] = true;

aSpeed = 5; // Acceleration rate
mSpeed = 40;   // Maximum speed
threshold = 20;

shakeLength = 0;
shakeMagnitude = 0;
shakeRemain = 0;

currentZoom = 1;

camXSpeed = 0;
camYSpeed = 0;

//Create camera
camera = camera_create_view(0, 0, RES_W, RES_H);

view_set_camera(0, camera);

viewWidthHalf = camera_get_view_width(camera) * 0.5;
viewHeightHalf = camera_get_view_height(camera) * 0.5;

//Resize window & application surface
window_set_size(RES_W * RES_SCALE, RES_H * RES_SCALE);
surface_resize(application_surface, RES_W * RES_SCALE, RES_H * RES_SCALE);

display_set_gui_size(RES_W, RES_H);

//Center window
var display_width = display_get_width();
var display_height = display_get_height();

var window_width = RES_W * RES_SCALE;
var window_height = RES_H * RES_SCALE;

window_set_position(display_width/2 - window_width/2, display_height/2 - window_height/2);

//Mouse previous
mouse_x_previous = device_mouse_x_to_gui(0);
mouse_y_previous = device_mouse_y_to_gui(0);

