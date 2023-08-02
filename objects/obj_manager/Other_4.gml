roomWidth = room_width;
roomHeight = room_height;

if(surface_exists(debrisSurf)){
	surface_free(debrisSurf)
	debrisSurf = surface_create(room_width,room_height)
}