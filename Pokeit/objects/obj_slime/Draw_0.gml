eyeLocation()

drawRadial()

draw_sprite_ext(spr,subbed,x,y,sizeMultiplier+1, sizeMultiplier+1,0,c_white,1)
if attacking {draw_sprite_ext(sprDam,subbed,x,y,3,3,0,color2,1)
	draw_radial_progress(tr_mid_x, tr_mid_y /2 +50, 1, 50, c_red, 10);}


//Debugging Text Block

//draw_text(50 , 30 *3, "shook phase " + string(shockphase))
//draw_text(50, 30 *4, "Dam " + string((global.slimeSizeCounter + global.angerCounter)))