function AutoClickerSetup(){
radiusDirection = 1;
radius = (obj_slime.spriteWidth*obj_slime.sizeMultiplier)
angle =0
xx = 0
yy= 0
click = false
touched = false
istouch = false
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
		


if  point_in_rectangle(xx, yy, obj_slime.bbox_left, obj_slime.bbox_top, obj_slime.bbox_right, obj_slime.bbox_bottom)

{
	istouch = true
	if istouch && !touched {
	 radiusDirection = 1;
    money()
	poke()
	touched = true
	
	}
} else {istouch = false
	touched = false}




    for (i = 0; i < global.acq; i++) {
        angle = (i / global.acq) * 2 * pi;
        xx = x + cos(angle) * radius;
        yy = y + sin(angle) * radius;

        rot = point_direction(xx, yy, x, y);
        rot -= 90;

        draw_sprite_ext(spr_gem, 0, xx, yy, 1, 1, rot, c_white, 1);
        draw_sprite_ext(spr_apprenticeSticks, 0, xx, yy, 1, 1, rot, c_white, 1);
    }
}

function drawJars(){
  for (var ii = 0; ii < global.jarred; ii++) {
        
        jx = 50 + ((32 +16) *ii)
        jy = 120
		draw_set_color(c_lime)
		draw_rectangle(jx+2,jy +10,jx+35,jy+59,0)
		draw_set_color(c_gray)
		draw_rectangle(jx+1,jy +24,jx+36,jy+40,0)
		draw_set_color(c_white)
        draw_sprite(spr_Jar, 0, jx , jy);
  
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

function globalVars(){
global.Counter = 100
global.acamount = 1
global.acspeed = 1
global.accost = 1
global.acq = 1
global.pYScale = 3
global.pXScale = 3
global.jarred = 0
global.slimeSizeCounter = 1
global.angerCounter = 0

}