var tiles = [[[16], [24]], [[32]]];

z = -32;
tilemap = new tilemap3D(global.tilesets[? "Demo"], tiles, x, y, z);
tilemap.generate_tilemaps();