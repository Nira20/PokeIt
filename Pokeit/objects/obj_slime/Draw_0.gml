drawPlatforms()
drawClickers()
var danger = calculateDanger()

draw_radial_progress(tr_mid_x , tr_mid_y /2, danger, 50, c_red, 10);
draw_sprite_ext(spr_danger,0,tr_mid_x,tr_mid_y /2 ,3, 3,0,c_red,1)

draw_sprite_ext(spr,subbed,x,y,sizeMultiplier, sizeMultiplier,0,c_white,1)

if attacking {draw_sprite_ext(spr_slimeSlime,subbed,x,y,3,3,0,c_white,1)
	draw_radial_progress(tr_mid_x , tr_mid_y /2 , 1, 50, c_red, 10);}	

//Debugging Text Block
//draw_text(50, 30, "pacify " + string(global.pacify))
//draw_text(50 , 30 *2, "PC " + string(global.pacifyCounter))
//draw_text(50 , 30 *3, "Cage " + string(global.cage))
//draw_text(50, 30 *4, "Dam " + string((global.slimeSizeCounter + global.angerCounter)))