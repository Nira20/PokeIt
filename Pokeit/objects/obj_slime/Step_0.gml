sizeUpdate()
sMouseCheck()

attackCounter()
platformHPPercent = global.cage/global.maxPlatformHP
subindex =  sprite_get_number(spr)
if attacking = true {
spr = spr_slimeAttack
if subbed >= subindex -1
{subbed =0
	spr=spr_slimebase
	attacking = false
	angerGenerate()
	}
}




// Step Event
timer += 1;

if (timer >= increment * fpss) {
    subbed += 1;
    timer = 0;
}
