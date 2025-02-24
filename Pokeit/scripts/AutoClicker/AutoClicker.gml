// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function AutoClickerSetup(){
acamount = 1
acspeed = 1
accost =1
acq =1
radius = 0
angle =0
xx = 0
yy= 0
}

function drawClickers(){
	radius = obj_slime.spriteWidth*obj_slime.sizeMultiplier
	for(i =0; i <= acq; i++){
		angle = (i/acq) * 2 * pi
xx= room_width/2 + cos(angle) *radius
yy= room_height/2.52+sin(angle) *radius	
draw_sprite(spr_apprenticeSticks,0,xx ,yy)}

}


