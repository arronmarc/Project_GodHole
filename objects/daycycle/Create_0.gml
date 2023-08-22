//Create event for daycycle

seconds = 0;
minutes = 0;
hours = 0;

day = 1;
season = 1;
year = 1;

time_increment = 10 //seconds per step
time_pause = true;

max_darkness = 1;
global.darkness = 0;
draw_daylight = false;

global.isDay = false;

enum phase {
	sunrise = 6,
	daytime = 8.5,
	sunset = 18,
	nighttime = 22,
}