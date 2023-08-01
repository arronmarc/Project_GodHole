//Cause a room transition

if (instance_exists(obj_player)) && (position_meeting(obj_player.x,obj_player.y,id))
{
	if (!instance_exists(oTransition))
	{
	global.targetRoom = targetRoom;
	global.targetX = targetX;
	global.targetY = targetY;
	global.targetDirection = obj_player.direction;
	RoomTransition(TRANS_TYPE.FADE, targetRoom);
	instance_destroy();
	}
}