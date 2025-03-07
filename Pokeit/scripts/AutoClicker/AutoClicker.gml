// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function AutoClickerSetup(){
acamount = 1
global.acspeed = 1
accost =1
acq =1
radius = 0
angle =0
xx = 0
yy= 0


}

function drawClickers(){
	radius = (obj_slime.spriteWidth*obj_slime.sizeMultiplier)
	for(i =0; i <= acq; i++){
		angle = (i/acq) * 2 * pi
		var rot = point_direction(obj_slime.x,obj_slime.y,xx,yy)
xx= x + cos(angle) *radius
yy= y + sin(angle) *radius	
draw_sprite_ext(spr_apprenticeSticks,0,xx,yy,1,1,rot,c_white,1)

}}

function drawMagic(){
	var scroll_speed = 2
	var magicsprite =spr_markings
	var coin = spr_effect
	var xPos = 
	randomize()
	



}