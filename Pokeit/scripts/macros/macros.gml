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

// Glowstoat → Lumen Slime
#macro c_softCyan #6FE7DB
#macro c_paleLavender #C2B9FF
#macro c_charcoalGray #333333
#macro c_warmCream #FFF6E5

#macro c_brightCyan #00CFC1
#macro c_whiteGlow #FFFFFF
#macro c_deepIndigo #4B0082
#macro c_silverSparkle #B0BEC5

// Ashclaw → Ember Slime
#macro c_obsidianBlack #0D0D0D
#macro c_moltenOrange #FF6B00
#macro c_smolderingRed #D72638
#macro c_lavaGray #5A5A5A

#macro c_fieryRed #E63946
#macro c_brightGold #FFD700
#macro c_coalBlack #1C1C1C
#macro c_ashGray #B2B2B2

// Whimwhisker → Fortune Slime
#macro c_dustyRose #D46A6A
#macro c_softBeige #F5E6CC
#macro c_mistyBlue #84A9C0
#macro c_midnightPlum #4C2A4B

#macro c_amethystPurple #9966CC
#macro c_paleGold #F4E285
#macro c_tealGreen #009688
#macro c_matteBlack #212121

// Dustmew → Veil Slime
#macro c_smokyGray #8E8E8E
#macro c_midnightBlue #2E3B55
#macro c_faintSilver #D9D9D9
#macro c_dullViolet #7A6FA7

#macro c_stormGray #595959
#macro c_ghostWhite #F8F8FF
#macro c_mistBlue #A2C4E0

// Skelpling → Mirebone Slime
#macro c_boneWhite #EDEAE0
#macro c_paleCyan #AEEEEE
#macro c_glowingLime #BFFF00
#macro c_softPink #E49B9B

#macro c_boneGray #D6D6D6
#macro c_toxicGreen #7FFF00
#macro c_dullCyan #76C7C0
#macro c_deathBlack #0A0A0A

// Inkpecker → Script Slime
#macro c_inkBlack #1C1C1C
#macro c_iridescentBlue #3F88C5
#macro c_glossyWhite #FAFAFA
#macro c_burntGold #CC9933

#macro c_deepBlack #0D0D0D
#macro c_electricBlue #00BFF6
#macro c_antiqueGold #D4AF37
#macro c_vividWhite #FFFFFF



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
function timeCounter() {
    // Step Event
    global.elapsed_time += delta_time * 0.000001; // Convert microseconds to seconds

    while (global.elapsed_time >= 40) {
        global.hcounter += 1; // Increase counter by 1
        global.elapsed_time -= 40; // Reset elapsed time, keeping any overflow
    }

    while (global.hcounter >= 24) {
        global.dcounter += 1; // Increase day counter by 1
        global.hcounter -= 24; // Reset hour counter, keeping overflow
    }
}


function drawClock() {
    var hh = global.hcounter; // Get the current hour in military time

    // Set the position for the clock display
    var x_pos = 100;
    var y_pos = 100;

   
    // Draw the military time on the screen
     draw_text(x_pos, y_pos,string(hh) + ":" + string(global.elapsed_time))

}

