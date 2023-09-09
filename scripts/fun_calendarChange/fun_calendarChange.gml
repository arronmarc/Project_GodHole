function fun_calendarChange() {
	//This 

	var date = argument[0] //This is the DAY/WEEK/MONTH/YEAR

	switch (date)   {
	    /*-----------------------------------------------------------/
	    / Place any code you want to fire off at the beginning of a 
	    / new hour just below this comment block and case statement.
	    /-----------------------------------------------------------*/
	    case "hour":
        
        
	    /*-----------------------------------------------------------/
	    / Place any code you want to fire off at the beginning of a 
	    / new day just below this comment block and case statement.
	    /-----------------------------------------------------------*/
	        break;
	    case "day":
                
				if (instance_exists(oTomato)) {
                    with (oTomato) {
                        if (growthStage < maxGrowthStage) {
                            daysOld += 1;
            
                            var firstGrowth = 0;
                            if (daysOld > 0) { firstGrowth = 1; }
            
                            growthStage = firstGrowth + (daysOld div growthStageDuration);
                            if (growthStage >= maxGrowthStage) {
                                growthStage = maxGrowthStage;
                                fullyGrown = true;
                                alarm[1] = 1;
                            }
                        }
                    }
                }
            

	    /*-----------------------------------------------------------/
	    / Place any code you want to fire off at the beginning of a 
	    / new week just below this comment block and case statement.
	    /-----------------------------------------------------------*/
	        break;
	    case "week":
        
    
	    /*-----------------------------------------------------------/
	    / Place any code you want to fire off at the beginning of a 
	    / new month just below this comment block and case statement.
	    /-----------------------------------------------------------*/
	        break;
	    case "month":
        
    
	    /*-----------------------------------------------------------/
	    / Place any code you want to fire off at the beginning of a 
	    / new year just below this comment block and case statement.
	    /-----------------------------------------------------------*/
	        break;
	    case "year":
    
    
	        break;
	    }
    




}
