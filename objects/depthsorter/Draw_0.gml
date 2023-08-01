//Resize the grid
var inst_num = instance_number(par_depthobject);
var dgrid = ds_depthgrid;

if(ds_grid_height(dgrid) != inst_num){
ds_grid_resize(dgrid, 2, inst_num);
}

//Add instances to the grid
var yy = 0; with(par_depthobject){
	dgrid[# 0, yy] = id;
	dgrid[# 1, yy] = y;
	yy += 1;
}

//Sort the grid in ascending order
ds_grid_sort(dgrid, 1, true);

//Loop through the grid and draw all the instances
var inst; yy = 0; repeat(inst_num){
	//Pull out an ID
	inst = dgrid[# 0, yy];
	//Draw yourself
	with(inst){
		//Check if instance is of oWeapon type
        if(object_index == oWeapon){
            var dir_to_mouse = point_direction(x, y, mouse_x, mouse_y);

            if ((dir_to_mouse >= 0) && (dir_to_mouse < 90)) || ((dir_to_mouse > 225) && (dir_to_mouse <= 360))
            {
                depth = -1000;
            }
            else
            {
                depth = 1000;
            }
        }
        event_perform(ev_draw, 0);
	}
	yy += 1;
}