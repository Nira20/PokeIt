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
    // Update rpulse based on ppulse
    rpulse += ppulse;
	
	
    if (rpulse >= .5) { 
        ppulse = -0.001; // Start decreasing radius
    } else if (rpulse <= .05) {
        ppulse = 0.01; // Start increasing radius
    }

    draw_sprite_ext(spr_funnel, 0, x, y - 86, 3, 3, 0, c_white, 1);
  
    // Apply shimmer color only to funnel runes
    var shimmer_color = get_shimmer_color(0,.002,#fc3032,#76167c,#00fffe,#08ff2e);
    var col1 = get_shimmer_color(1,.04,c_neonLime,c_deepPurple,c_luminousBlue,c_vibrantRed);
	var col2 = get_shimmer_color(1,.032,c_vibrantRed,c_luminousBlue,c_neonLime,c_deepPurple);
	var col3 = get_shimmer_color(1,.042,c_vibrantRed,c_deepPurple,c_luminousBlue,c_neonLime);
	var col4 = get_shimmer_color(1,.092,c_gold,c_goldenEarth,c_softSaffron,c_desertAmber)

       // Draw Event
    if (!surface_exists(shimmer_surface)) {
        shimmer_surface = surface_create(room_width, room_height);
    }
	hcolor =merge_color(c_vibrantRed,c_neonLime,platformHPPercent)
    surface_set_target(shimmer_surface);
    draw_clear_alpha(c_black, 0);
    surface_reset_target();
    draw_surface(shimmer_surface, 0, 0);

	draw_set_color(c_white) 
    draw_sprite_ext(spr_arcanePlatform, 0, x, y, global.pXScale, global.pYScale, 0, c_white, 1);
	draw_sprite_ext(spr_pillars,0, x, y, 1, 1, 0, c_gray, 1);	
	draw_sprite_ext(spr_pillars,0, x, y, 1, 1, 0, c_burntCienna, 1);

	draw_sprite_general(spr_funnelRunes, 0, 0, 0, sprite_get_width(spr_funnelRunes), sprite_get_height(spr_funnelRunes), 
                        x - 80, y - 286, 3, 3, 0, col1, col2, col3, col4, rpulse);
	draw_sprite_ext(spr_field, 0, x, y-80, global.pXScale, global.pYScale, 0, hcolor, rpulse);

	
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
	
