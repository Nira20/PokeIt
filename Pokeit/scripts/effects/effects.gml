//slowly rapidly a sprite, put this in the step event
function wiggle(wiggle_frequency,wiggle_amplitude){
   var wiggle_offset = wiggle_amplitude * sin(wiggle_frequency * current_time); // Calculate wiggle offset
 
    x += wiggle_offset; // Apply wiggle offset to x position}
}

//slowly Rotates a sprite, put this in the step event
function rotate(rotation_angle,rotation_speed){

rotation_angle += rotation_speed; // Increment the rotation angle gradually

// Ensure rotation_angle stays within 0 to 359 degrees
if (rotation_angle >= 360) {
    rotation_angle -= 360;
	
}
return(rotation_angle);}


function glow(sprite_index, x, y, glow_radius, glow_intensity, glow_color) {
    var num_passes = 5;                  // Number of glow passes
    var max_scale = 1.5;                 // Maximum scale factor for glow sprites

    // Loop through each pass
    for (var i = 1; i <= num_passes; i++) {
        var scale_factor = max_scale * i / num_passes; // Scale factor for this pass
        var alpha = glow_intensity / i;                // Alpha for this pass
        
        // Set color and alpha
        draw_set_color(c_white);
        draw_set_alpha(alpha);
        
        // Draw sprite with scaled size and centered at (x, y)
        draw_sprite_ext(sprite_index, 0, x, y, scale_factor, scale_factor, 0, glow_color, 1);
    }

    // Reset drawing settings
    draw_set_alpha(1);
}
	
//Rapidly zooms a sprite, put this in the step event
//Be sure to use scr_zoomReset to return sprite to normal size

function zoom(hover_scale_factor){


    image_xscale = hover_scale_factor; // Increase horizontal scale
    image_yscale = hover_scale_factor; // Increase vertical scale
} 
	
function zoomReset(){


    image_xscale = 1 
    image_yscale = 1 
}

