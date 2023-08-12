	function GetEightDirection(dir) {
    var eightDirection = round(dir * (8/360)) * 45;
    if(eightDirection == 360) eightDirection = 0; // Reset 360 to 0
    return eightDirection;
	}