sizeUpdate()
sMouseCheck()
updatePacify()
angerGenerate()
shockCounter()
danger = calculateDanger()
posUpdate()

platformHPPercent = global.cage/global.maxPlatformHP
subindex =  sprite_get_number(spr)
// Add this to the Step Event
if (attacking) {
    subindex = sprite_get_number(spr);
	
    if (subbed >= subindex - 1) { // Check if attack animation is complete
        resetSlimeState(); // Reset after animation
		
		
    }
}

if global.shock = true {
shockScript()}

timer += 1;
if (timer >= increment * fpss) {
    subbed += 1;
    timer = 0;
}

rTimer += global.rTimer; 
if rTimer >= fpss
{regenerate()
	rTimer =0}