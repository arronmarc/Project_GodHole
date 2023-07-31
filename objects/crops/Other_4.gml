//If the grid hasn't already been created, create it
//Add below line to lock farming to a room
// if (room == r_demo and ds_crops_instances == 0) {
if (ds_crops_instances == -1) {
	ds_crops_instances = ds_grid_create(room_width div cellSize, room_height div cellSize);
}