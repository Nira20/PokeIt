function autoClickerSetup(){
radiusDirection = 1;
radius = (sprite_get_width(spr_field))
angle =0
xx = 0
yy= 0
click = false
touched = 0
istouch = 0
}

function drawClickers() {
	
	if (radius < 1) {
        radius = 1; // Ensure radius does not exceed 1
    }
    if (radius >= (obj_slime.spriteWidth * obj_slime.sizeMultiplier)) {
        radiusDirection = -1; // Start decreasing radius
    } else if (radius <= 1) {
        radiusDirection = 1; // Start increasing radius
    }


        radius += radiusDirection * global.acspeed;
		
touched ++

if touched <= global.acspeed = 100

{touched = 0 
	global.acspeed = 100
	poke()}
	


   for (i = 0; i < global.acq; i++) {
    angle = (i / global.acq) * 2 * pi;
    xx = x + cos(angle) * radius;
    yy = y + sin(angle) * radius;

    rot = point_direction(xx, yy, x, y);
    rot -= 90;

    // Draw the gems
    draw_sprite_ext(spr_gem, 0, xx, yy, 1, 1, rot, c_white, 1);
    draw_sprite_ext(spr_gem, 1, xx, yy, 1, 1, rot, c_white, 1);
    draw_sprite_ext(spr_gem, 3, xx, yy, 1, 1, rot, c_white, 1);

    // Calculate new position for apprentice sticks to align with gem ends
    var apprentice_xx = xx + cos(angle) * sprite_get_width(spr_gem); // Adjust 'gem_length' as needed
    var apprentice_yy = yy + sin(angle) * sprite_get_width(spr_gem); // Adjust 'gem_length' as needed

    // Draw the apprentice sticks at the adjusted position
    draw_sprite_ext(spr_apprenticeSticks, 0, apprentice_xx, apprentice_yy, 1, 1, rot, c_white, 1);
}
    
}

function anger(){
global.slimeSizeCounter ++
global.angerCounter ++
}

function poke()
{
global.Counter +=global.acamount * global.acq;
anger()
}

