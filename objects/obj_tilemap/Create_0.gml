/// @desc Variables and tilemap creation

/*

	Note: The first array contains the arrays for creating the top face and the wall face
	The second array are the rows and contain array for collums
	
	tiles: [top [row [col, col]], wall [row [col, col]]]
	
	To not use the top or the wall, leave the array empty.
	
	ex: tiles = [[], [[32, 33, 34], [48, 49, 50]]] - Only draws a wall
	ex: tiles = [[[8, 9, 10], [24, 25, 26]], []] - Only draws the top
	
	Note: The smaller z is, the closer it is to the camera

*/

var tiles = [[[8, 9, 10],
	[16, 17, 18],
	[24, 25, 26]],

	[[32, 33, 34],
	[40, 41, 42],
	[48, 49, 50]]];

z = -96;

tilemap = new tilemap3D(global.tilesets[? "Demo"], tiles, x, y, z);

/*

	Generates the tilemap
	
	Tilemap will not be drawn unless called
	
	Note : If you call this function twice or more, make sure to destroy the tilemap
	before doing so to avoid a memory leak.

*/
tilemap.generate_tilemaps();