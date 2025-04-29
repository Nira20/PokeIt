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
function draw_lightning_arch(x1, y1, x2, y2, color1, color2, alpha1, alpha2, minSize, maxSize, angle1, angle2, numLines) 
{
    /// Assign arguments to variables for legibility
    var xx1 = x1;
    var yy1 = y1;
    var xx2 = x2;
    var yy2 = y2;

    // Color and alpha values
    var c1 = color1;
    var c2 = color2;
    var a1 = alpha1;
    var a2 = alpha2;

    // Lightning thickness range
    var minT = minSize;
    var maxT = maxSize;

    // Angle variations
    var aDiff1 = angle1;
    var aDiff2 = angle2;

    // Number of lightning bolts
    var numL = numLines;

    // Calculate the midpoint for the arc
    var midX = (xx1 + xx2) / 2;
    var midY = (yy1 + yy2) / 2;
    var controlX = midX;
    var controlY = midY - point_distance(xx1, yy1, xx2, yy2) * 0.5; // Adjust height of the arc

    // Make sure alpha is full
    draw_set_alpha(1);

    repeat(numL)
    {
        // Temp angle variables
        var useAngle1 = point_direction(xx1, yy1, xx2 + random_range(-aDiff1, aDiff1), yy2 + random_range(-aDiff1, aDiff1));
        var useAngle2 = point_direction(xx1, yy1, xx2 - random_range(-aDiff2, aDiff2), yy2 - random_range(-aDiff2, aDiff2));

        // Distance variables follow a curved path
        var dist1 = point_distance(xx1, yy1, xx2, yy2) * 0.2;
        var dist2 = point_distance(xx1, yy1, xx2, yy2) * 0.4;
        var dist3 = point_distance(xx1, yy1, xx2, yy2) * 0.6;
        var dist4 = point_distance(xx1, yy1, xx2, yy2) * 0.8;

        // Calculate arched path points using interpolation
        var p1x = xx1 + lengthdir_x(dist1, useAngle1);
        var p1y = xx1 + lengthdir_y(dist1, useAngle1);

        var p2x = lerp(p1x, controlX, 0.5);
        var p2y = lerp(p1y, controlY, 0.5);

        var p3x = lerp(controlX, xx2, 0.5);
        var p3y = lerp(controlY, yy2, 0.5);

        var p4x = xx2 + lengthdir_x(dist4, useAngle2);
        var p4y = yy2 + lengthdir_y(dist4, useAngle2);

        // Set width per line
        var tempWidth = irandom_range(minT, maxT);

        // Set alpha fade
        draw_set_alpha(random_range(a1, a2));

        // Draw curved lightning segments
        draw_line_width_color(xx1, yy1, p1x, p1y, tempWidth, c1, c1);
        draw_line_width_color(p1x, p1y, p2x, p2y, tempWidth, c1, c1);
        draw_line_width_color(p2x, p2y, p3x, p3y, tempWidth, c1, c2);
        draw_line_width_color(p3x, p3y, p4x, p4y, tempWidth, c2, c2);
        draw_line_width_color(p4x, p4y, xx2, yy2, tempWidth, c2, c2);
    }
}