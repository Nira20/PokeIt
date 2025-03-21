//color Macros
#macro c_gold  #bf9b30
#macro c_goldenEarth make_color_rgb(166, 124, 0)  // #a67c00
#macro c_desertAmber make_color_rgb(191, 155, 48) // #bf9b30
#macro c_blazingSun make_color_rgb(255, 191, 0)   // #ffbf00
#macro c_honeyGlow make_color_rgb(255, 207, 64)   // #ffcf40
#macro c_softSaffron make_color_rgb(255, 220, 115) // #ffdc73


function timeCounter(){
// Step Event
elapsed_time += delta_time / 1000000; // Add real-world seconds passed
if (elapsed_time >= 40) {
    hcounter += 1; // Increase counter by 1
    elapsed_time -= 40; // Reset elapsed time, keeping any overflow
}
if (hcounter >= 24) {
    dcounter += 1; // Increase counter by 1
    hcounter -= 24; // Reset elapsed time, keeping any overflow 
	
}}