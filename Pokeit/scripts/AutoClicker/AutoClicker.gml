function AutoClickerSetup(){
radiusDirection = 1;
radius = (obj_slime.spriteWidth*obj_slime.sizeMultiplier)
angle =0
xx = 0
yy= 0
click = false
}

function drawClickers(){
if (radius >= (obj_slime.spriteWidth * obj_slime.sizeMultiplier)) {
        radiusDirection = -1; // Start decreasing radius
    } else if (radius <= 0) {
        radiusDirection = 1; // Start increasing radius
    } 	
var clickTimer = 0
var clickReset = 0
if click =true {
clickTimer = clickTimer *global.acspeed
 radius += radiusDirection *global.acspeed
 
 }
}

if click = false {
	
radius = (obj_slime.spriteWidth*obj_slime.sizeMultiplier)
}

if clickTimer >=10{
{
clickTimer =0
click = false}

}


for(i =0; i < global.acq; i++){

angle = (i/global.acq) * 2 * pi		
xx= x + cos(angle) *radius 
yy= y + sin(angle) *radius	

 var rot = point_direction(xx, yy, x, y);
 rot -= 90; 
 
draw_sprite_ext(spr_gem,0,xx,yy,2,2,rot,c_white,1)
draw_sprite_ext(spr_apprenticeSticks,0,xx,yy,2,2,rot,c_white,1)

}}



function globalVars(){
global.acamount = 1
global.acspeed = 1
global.accost = 1
global.acq = 1
global.pYScale = 3
global.pXScale = 3

}