/// @desc Initialize world
// Go to DEMO room
room_goto(r_demo);

global.iUI = instance_create_layer(0,0,layer,oUI);


global.targetRoom = -1;
global.targetX = -1;
global.targetY = -1;
global.targetDirection = 0;

debrisSurf = surface_create(room_width,room_height);