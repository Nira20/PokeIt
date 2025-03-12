// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function AutoClickerSetup(){

radius = 0
angle =0
xx = 0
yy= 0


}
function drawClickers() {
     radius = (obj_slime.spriteWidth * obj_slime.sizeMultiplier); // Circle radius
    for (var i = 0; i < global.acq; i++) {
        angle = (i / global.acq) * 2 * pi; // Angle for each stick
        xx = obj_slime.x + cos(angle) * radius; // X position in the circle
        yy = obj_slime.y + sin(angle) * radius; // Y position in the circle

        // Calculate rotation for each stick
        
        var rot = point_direction(xx, yy, obj_slime.x, obj_slime.y)

        // Draw the sprite with rotation
        draw_sprite_ext(spr_apprenticeSticks, 0, xx, yy, 1, 1, rot, c_white, 1);
    }
}


function drawClickers1(){
	radius = (obj_slime.spriteWidth*obj_slime.sizeMultiplier)
	for(i =0; i <= global.acq; i++){
		angle = (i/global.acq) * 2 * pi
		var rot = point_direction(obj_slime.x,obj_slime.y,xx,yy)
xx= x + cos(angle) *radius
yy= y + sin(angle) *radius	
draw_sprite_ext(spr_apprenticeSticks,4,xx,yy,1,1,rot,c_white,1)

}}

function globalVars(){
global.acamount = 1
global.acspeed = 1
global.accost =1
global.acq =1


}
	



