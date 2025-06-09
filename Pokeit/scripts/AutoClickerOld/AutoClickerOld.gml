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
       angle = (i / 8) * 2 * pi;
        
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


function payDebt1() {
    var button_labels = ["Max", "Min", "100", "Other"];
    var button_width = 120, button_height = 50;
    var spacing = 20;
    var start_x = (room_width - button_width) / 2;
    var start_y = room_height - 400;

    for (var i = 0; i < array_length(button_labels); i++) {
        var button_y = start_y + i * (button_height + spacing);

        if (is_hovered(start_x, button_y, button_width, button_height)) {
            drawHighlight(start_x, button_y, button_width, button_height);

            if (mouse_check_button_pressed(mb_left)) {
                var pay = 0;

                switch (button_labels[i]) {
                    case "Max": pay = playerMoney; break;
					
                    case "Min": if playerMoney >= global.nextPayRemaining 
					{pay =  global.nextPayRemaining; }break; 
					
                    case "100": if playerMoney >= global.nextPayRemaining { pay = 100;} break;
					
                    case "Other": othr = true; visable = false; break;
                }

                if (playerMoney >= pay && pay > 0) {
                    
                    spentMoney += pay;
                    global.debt -= pay;
                
                }
            }
        }

        draw_sprite_stretched(spr_button, 0, start_x, button_y, button_width, button_height);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_text(start_x + button_width / 2, button_y + button_height / 2, button_labels[i]);
    }
}

  /* // Apply shimmer color only to funnel runes
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
    draw_sprite(spr_arcanePlatform, 0, x, y);


	draw_sprite_general(spr_funnelRunes, 0, 0, 0, sprite_get_width(spr_funnelRunes), sprite_get_height(spr_funnelRunes), 
                        x - 80, y - 286, 3, 3, 0, col1, col2, col3, col4, rpulse);