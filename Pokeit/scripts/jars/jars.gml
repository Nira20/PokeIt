function drawJars(){ 
	draw_sprite_stretched(spr_shelf,0,45,110,156,192)
  for (var ii = 0; ii < global.jarred; ii++) {
        
        jx = 50 + ((32 +16) *ii)
        jy = 120
		var tcolor = slimeJars[ii][0]
		draw_set_color(tcolor)
			draw_set_color(c_white)
        draw_sprite(spr_Jar, 0, jx , jy);
  
    }

}

function split(){
	var tempColor = global.slimeColor
	var size = global.slimeSizeCounter/2
	var value = global.accost
   array_push(slimeJars, [tempColor, size, value]);

global.slimeSizeCounter = size
global.jarred +=1
}


