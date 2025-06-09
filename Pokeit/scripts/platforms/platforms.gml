function platformCreate(){
    // Create Event
    shimmer_surface = -1;
    /*shimmer_speed = 0.002;  // Slower shimmer movement (reduce the speed)
    shimmer_offset = 0;
    */
	hcolor = c_white
    rpulse = 3;
    ppulse = -0.001;
    shimmer_color_cycle = 0;  // Initialize shimmer cycle variable
	platformHPPercent = 0
}
function get_shimmer_color(shimmer_color_cycle, shimmer_speed, col1, col2, col3, col4,) {
    // Increment and cycle shimmer_color_cycle continuously between 0 and 1
    shimmer_color_cycle = (shimmer_color_cycle + shimmer_speed) % 1;

    if (shimmer_color_cycle < 0.25) {
        return lerp_color(col1, col2, shimmer_color_cycle * 4); // Between col1 and col2
    } else if (shimmer_color_cycle < 0.5) {
        return lerp_color(col2, col3, (shimmer_color_cycle - 0.25) * 4); // Between col2 and col3
    } else if (shimmer_color_cycle < 0.75) {
        return lerp_color(col3, col4, (shimmer_color_cycle - 0.5) * 4); // Between col3 and col4
    } else {
        return lerp_color(col4, col1, (shimmer_color_cycle - 0.75) * 4); // Between col4 and back to col1
    }
}
function drawPlatforms(){
  

   // draw_sprite_ext(spr_funnel, 0, x, y - 86, 3, 3, 0, c_white, 1);
  
	eyeLocation()
    draw_sprite_ext(spr_arcanePlatform, 0, x, y, 1, 1,0,c_white,1);

	
}
function lerp_color(color1, color2, t) {
    // Extract RGB components of color1 and color2
    var r1 = color_get_red(color1);
    var g1 = color_get_green(color1);
    var b1 = color_get_blue(color1);
    
    var r2 = color_get_red(color2);
    var g2 = color_get_green(color2);
    var b2 = color_get_blue(color2);
    
    // Interpolate between the components
    var r = lerp(r1, r2, t);
    var g = lerp(g1, g2, t);
    var b = lerp(b1, b2, t);
    
    // Combine interpolated components into a single color
    return make_color_rgb(r, g, b);
}
	
