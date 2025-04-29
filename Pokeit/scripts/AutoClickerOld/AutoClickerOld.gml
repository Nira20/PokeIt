function autoClickerSetup(){
radiusDirection = 1;
radius = (sprite_get_width(spr_field))
angle =0
xx = 0
yy= 0
click = false
touched = 0
istouch = 0
}

function drawClickers() {
    // Ensure radius does not go below 1
    if (radius < 1) {
        radius = 1;
    }

    // Reverse direction when radius reaches limits
    if (radius >= sprite_get_width(spr_field)) {
        radiusDirection = -1; // Start decreasing radius
    } else if (radius <= 1) {
        radiusDirection = 1; // Start increasing radius
    }

    // Update radius dynamically
    radius += radiusDirection * global.acspeed;
    
    // Increment touch counter
    touched++;

    // Reset and trigger action when reaching threshold
    if (touched >= global.acspeed) {
        touched = 0;
        poke();
    }

    // Loop through all auto-click instances
    for (var i = 0; i < global.acq; i++) {
        // Calculate angle for placement
       angle = (i / global.acq) * 2 * pi;
        
        // Move towards origin `(0,0)`
        if (xx > 0) { xx -= global.acspeed; }
        if (yy > 0) { yy -= global.acspeed; }

        // If it reaches `(0,0)`, return to initial position
        if (xx <= 0 && yy <= 0) {
            xx = x + cos(angle) * radius;
            yy = y + sin(angle) * radius;
        }

        // Determine rotation angle
        var rot = point_direction(xx, yy, x, y) - 90;

        // Ensure `spr_gem` exists before drawing
        if (sprite_exists(spr_gem)) {
            draw_sprite_ext(spr_gem, 0, xx, yy, 1, 1, rot, c_white, 1);
            draw_sprite_ext(spr_gem, 1, xx, yy, 1, 1, rot, c_white, 1);
            draw_sprite_ext(spr_gem, 3, xx, yy, 1, 1, rot, c_white, 1);
        }
    }
}
