/// @description Progress transition


if (leading == OUT)
{
	percent = min(1, percent + TRANSITION_SPEED);
	if (percent >= 1) //If screen fully obscured
	{
		room_goto(target);
		leading = IN;
	}
}
else //Leading == IN
{
	percent = max(0, percent - TRANSITION_SPEED);
	if (percent <= 0) //If screen fully revealed
	{
		
		instance_destroy();	
	}
}

