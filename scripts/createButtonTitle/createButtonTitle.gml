function createButtonTitle(){

var _x = argument[0];
var _y = argument[1];
var _w = argument[2];
var _h = argument[3];
var _title = argument[4];

//Create button
var _inst = instance_create_depth(_x, _y, 0, oButtonTitle);

with (_inst) {
	width = _w;
	height = _h;
	
	title = _title;
}
return _inst;

}