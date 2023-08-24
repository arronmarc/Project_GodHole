function createButtonCraft(){

var _x = argument[0];
var _y = argument[1];
var _w = argument[2];
var _h = argument[3];
var _item = argument[4];

//Create button
var _inst = instance_create_depth(_x, _y, 0, oButtonCraft);

with (_inst) {
	width = _w;
	height = _h;
	item = _item;
}
return _inst;

}