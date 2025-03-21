//color Macros
#macro c_gold  #bf9b30
#macro c_goldenEarth make_color_rgb(166, 124, 0)  // #a67c00
#macro c_desertAmber make_color_rgb(191, 155, 48) // #bf9b30
#macro c_blazingSun make_color_rgb(255, 191, 0)   // #ffbf00
#macro c_honeyGlow make_color_rgb(255, 207, 64)   // #ffcf40
#macro c_softSaffron make_color_rgb(255, 220, 115) // #ffdc73


function timeCounter(){
// Step Event
global.elapsed_time += delta_time / 1000000; // Add real-world seconds passed
if (global.elapsed_time >= 40) {
    global.hcounter += 1; // Increase counter by 1
	global.elapsed_time -= 40; // Reset elapsed time, keeping any overflow
	slimeattack();
}
if (global.hcounter >= 24) {
    global.dcounter += 1; // Increase counter by 1
    global.hcounter -= 24; // Reset elapsed time, keeping any overflow 
	
}
}