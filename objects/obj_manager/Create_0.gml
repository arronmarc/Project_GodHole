/// @desc Initialize world
// Go to DEMO room
room_goto(r_demo);

global.P_System=part_system_create_layer(layer, true);

global.targetRoom = -1;
global.targetX = -1;
global.targetY = -1;
global.targetDirection = 0;

light_created = false;

invList = ds_list_create();

global.pause = false;

//Crafting menu
cMenuScroll = 0;
cMenuHeight = 0;

viewWidthHalf = camera_get_view_width(view_camera[0]) * 0.5;
viewHeightHalf = camera_get_view_height(view_camera[0]) * 0.1;