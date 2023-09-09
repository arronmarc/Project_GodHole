function GrowCrop(){
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