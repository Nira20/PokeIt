//color Macros Gold
#macro c_gold  #bf9b30
#macro c_goldenEarth make_color_rgb(166, 124, 0)  // #a67c00
#macro c_desertAmber make_color_rgb(191, 155, 48) // #bf9b30
#macro c_blazingSun make_color_rgb(255, 191, 0)   // #ffbf00
#macro c_honeyGlow make_color_rgb(255, 207, 64)   // #ffcf40
#macro c_softSaffron make_color_rgb(255, 220, 115) // #ffdc73

#macro c_vibrantRed      #fc3032  // Bright, eye-catching red
#macro c_deepPurple      #76167c  // Rich, dark purple
#macro c_luminousBlue     #00fffe  // Luminous aqua blue
#macro c_neonLime  #08ff2e  // Radiant lime green





#macro xt 0
#macro yt 0
#macro xr room_width 
#macro yb room_height 

#macro xm room_width/2
#macro ym room_height/2

#macro tl_x xt         // Top-left X position
#macro tl_y yt         // Top-left Y position

#macro tr_x xm         // Top-right X position
#macro tr_y yt         // Top-right Y position

#macro bl_x xt         // Bottom-left X position
#macro bl_y ym         // Bottom-left Y position

#macro br_x xm         // Bottom-right X position
#macro br_y ym         // Bottom-right Y position

#macro tr_mid_x (xm + xr) / 2    // Midpoint X of top-right quadrant
#macro tr_mid_y (yt + ym) / 2    // Midpoint Y of top-right quadrant
#macro tr_mid_u_y (yt + ym) - tr_mid_y    // Midpoint Y of top-right quadrant

/// Positions in the room with their coordinates:
// Top Left: (xt, yt)
// Middle Top: (xm, yt)
// Top Right: (xr, yt)
// Middle Left: (xt, ym)
// Middle Middle: (xm, ym)
// Middle Right: (xr, ym)
// Bottom Left: (xt, yb)
// Bottom Middle: (xm, yb)
// Bottom Right: (xr, yb)

function timeCounter(){
// Step Event
global.elapsed_time += delta_time / 1000000; // Add real-world seconds passed
if (global.elapsed_time >= 40) {
    global.hcounter += 1; // Increase counter by 1
	global.elapsed_time -= 40; // Reset elapsed time, keeping any overflow
	
}

if (global.hcounter >= 24) {
    global.dcounter += 1; // Increase counter by 1
    global.hcounter -= 24; // Reset elapsed time, keeping any overflow 
	
}
}
