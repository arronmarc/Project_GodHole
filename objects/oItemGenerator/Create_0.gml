randomize();
repeat(20) {
	instance_create_layer(irandom_range(0, room_width), irandom_range(0, room_height), "Breakable", oRock);
}

repeat(10) {
	instance_create_layer(irandom_range(0, room_width), irandom_range(0, room_height), "Breakable", oIronOre);
}

repeat(50) {
	instance_create_layer(irandom_range(0, room_width), irandom_range(0, room_height), "Breakable", oTree);
}

repeat(50) {
	instance_create_layer(irandom_range(0, room_width), irandom_range(0, room_height), "Breakable", oBush);
}

repeat(50) {
	instance_create_layer(irandom_range(0, room_width), irandom_range(0, room_height), "DepthGrass", oGrass);
}