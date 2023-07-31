var tiles = [[[8, 10],
	[24, 26]],
	
	[[32, 34],
	[40, 42]]];

z = -64;
tilemap = new tilemap3D(global.tilesets[? "Demo"], tiles, x, y, z);
tilemap.generate_tilemaps();