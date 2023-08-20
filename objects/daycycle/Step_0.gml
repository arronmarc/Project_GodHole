//Step event for daycycle

//Pause the day/night cycle
if(keyboard_check_pressed(ord("T"))){ time_pause = !time_pause; }
if(time_pause) exit;

//Increment the time
seconds += time_increment;
minutes = seconds/60;
hours = minutes/60;

if(draw_daylight){
	
	#region Phases and variables
	var darks, pstart, pend;
	
	if (hours > phase.sunrise and hours <= phase.daytime){ //sunrise
			darks = [max_darkness, 0.2];
			pstart = phase.sunrise;
			pend = phase.daytime;
	} 
	else if (hours > phase.daytime and hours <= phase.sunset){ //day
			darks = [0.2, 0];
			pstart = phase.daytime;
			pend = phase.sunset;
	} 
	else if (hours > phase.sunset and hours <= phase.nighttime){ //sunset
			darks = [0, max_darkness];
			pstart = phase.sunset;
			pend = phase.nighttime;
	} 
	else {	//night
			darks = [max_darkness];
			pstart = phase.nighttime;
			pend = phase.sunrise;
	}
#endregion
}

#region Alter darkness depending on time
	//Darkness
	if (pstart == phase.nighttime){ 
		global.darkness = darks[0]; 
	}
	else {
		var dd = ((hours - pstart) / (pend - pstart)) * (array_length_1d(darks) - 1);
		var d1 = darks[floor(dd)];
		var d2 = darks[ceil(dd)];
		global.darkness = lerp(d1, d2, dd-floor(dd));
	}
#endregion

// Set day or night based on darkness value
global.isDay = (global.darkness <= 0.5);



#region Cycle check
if(hours >= 24) {
	seconds = 0;
	day += 1;
	with(crops){ event_perform(ev_other, ev_user1); }
	if(day > 30){
		day = 1;
		season += 1;
		if(season > 4){
			season = 1;
			year += 1;
		}
	}
}
#endregion
