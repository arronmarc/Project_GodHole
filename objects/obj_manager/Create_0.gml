/// @desc Initialize world
// Go to DEMO room
room_goto(r_demo);

global.iUI = instance_create_layer(0,0,layer,oUI);

global.P_System=part_system_create_layer(layer, true);

global.targetRoom = -1;
global.targetX = -1;
global.targetY = -1;
global.targetDirection = 0;

debrisSurf = surface_create(room_width,room_height);

light_created = false;

invList = ds_list_create();

global.pause = false;
pauseSurf = -1;

//Crafting menu
cMenuScroll = 0;
cMenuHeight = 0;

show_debug_message("Application Surface: " + string(surface_get_width(application_surface)) + "x" + string(surface_get_height(application_surface)));
show_debug_message("Pause Surface: " + string(surface_get_width(pauseSurf)) + "x" + string(surface_get_height(pauseSurf)));

viewWidthHalf = camera_get_view_width(view_camera[0]) * 0.5;
viewHeightHalf = camera_get_view_height(view_camera[0]) * 0.1;