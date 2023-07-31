/// @desc Cleanup tilemap
// REQUIRED TO PREVENT MEMORY LEAK

if (tilemap != -1) {
	tilemap.destroy();
	delete tilemap;
}