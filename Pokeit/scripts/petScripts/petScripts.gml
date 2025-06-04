function petArray() {
    pets = [
        ["GlowStout", "Lumen Slime", spr_stout, "Absorbs magical energy by day and emits gentle light by night, making it a charming companion and a living magical detector."],
        ["AshClaw", "Ember Slime", spr_crestedGecko, "Born of the blood of Chuthga during the first cleave. Burns with both frost and flame, prized companions of high ranking giants and trained for hunting tasks"],
        ["SeaBunny ", "Fortune Slime", spr_rabbit, "Konrads estimed pet, a lucky rabbit taken into the sea in ages past, elegant, poised, they draw his chariots through the waves."],
        ["DustMew", "Veil Slime", spr_cat, " Known for phasing through thin barriers like fabric or mist, these aloof, nocturnal creatures are prized by those seeking a touch of mystery."],
        ["Skelpling", "Mirebone Slime", spr_shrew, "Immune to necrotic magic, it instinctively seeks out cursed or undead areas, making it a favored as a magical warning or detoxifier."],
        ["Inkpecker", "Script Slime", spr_crow, "Its beak continuously drips magical ink. Intelligent and mischievous, it’s a favorite among scribes and arcane researchers for both companionship and a sustainable source of ink."]
    ];
}

function createPets() {
    global.pet = noone;
    global.slime = noone; 
    global.idlesprite = noone;
    global.attacksprite = noone;
    rows = 2;
    hovered_slot = -1;
    selected_slot = -1;
    inventory_slots = array_length(pets);
    text1 = "Select your Slime Base";
}
function ypet(){ global.pet = pets[selected_slot][0]; // Assign selected pet
                room_goto_next(); // Move to next room
				}
function npet(){selected_slot = -1;
 }
function drawPets() 
{
    // Get the screen dimensions based on room size
    var screen_width = room_width;
    var screen_height = room_height;
    
    // Set the font for text rendering
    draw_set_font(fn_arialBig);

    // Check if a pet is selected (not -1)
    if (selected_slot != -1) 
    {
        // Define the position for drawing the selected pet
        var sprite_x = xm;
        var sprite_y = ym - 200;

        // Draw the selected pet sprite with scaling
        draw_sprite_ext(pets[selected_slot][2], 0, sprite_x - 130, sprite_y - 180, 3, 3, 0, c_white, 1);
        draw_sprite_ext(spr_photoframe, 0, sprite_x - 130, sprite_y - 180, 3, 3, 0, c_silver, 1 );
        // Center-align the confirmation text
        draw_set_halign(fa_center);
		
        draw_text_color(screen_width / 2, sprite_y + 220, "Are you sure?", c_white, c_white, c_white, c_white, 1);
yn(ypet,npet)
     
    } 
    else 
    {
        // Define inventory layout positions
        var column1_x = xten;
        var column2_x = xm;
        var spacing_y = 200;

        // Define title position
        var title_x = xm;
        var title_y = yb/10;

        // Draw title centered
        draw_set_halign(fa_center);
        draw_text(title_x, title_y, text1);

        // Left-align text for inventory items
        draw_set_halign(fa_left);
        var top_offset = 50;

        // Loop through inventory slots to display pets
        for (var i = 0; i < inventory_slots; i++) 
        {
            var x_pos = (i % 2 == 0) ? column1_x : column2_x; // Alternates columns
            var y_pos = top_offset + 10 + (floor(i / 2) * spacing_y); // Adjust Y position

            // Draw pet sprite
            draw_sprite(pets[i][2], 0, x_pos + ((xm - xten -15)/2) - 64, y_pos );
			 draw_sprite_ext(spr_photoframe, 0, x_pos + ((xm - xten -15)/2) - 64, y_pos,1,1,0,c_silverSparkle,1 );

            // Check for hover and selection
            if (is_hovered(x_pos, y_pos , x_pos + ((xm - xten -15)/2) - 64, 128)) 
            {
                drawHighlight(x_pos, y_pos,  x_pos + ((xm - xten -15)/2) - 64, 128); // Highlight hovered pet
                hovered_slot = i;

                if (mouse_check_button_pressed(mb_left)) 
                {
                    selected_slot = i; // Select pet
                }
            }

            // Draw pet name below sprite
			draw_sprite_stretched(spr_namePlate, 0, x_pos, y_pos + 130, xm - xten -15,sprite_get_height(spr_namePlate));

			draw_set_font(fn_abbadon)
		
            draw_text_color(x_pos + (((xm - xten -15)/2) - (string_width(pets[i][0])/2)), y_pos + ( (sprite_get_height(spr_namePlate)/2)- (string_height(pets[i][0])/2))+ 130, pets[i][0],c_black,c_black,c_black,c_black,1)
        }

      // If a pet is hovered and has additional information, display it
        if (hovered_slot != -1 && pets[hovered_slot][3] != noone) 
        {
			draw_set_color(c_burntGold)
			draw_set_alpha(.2)
			draw_set_font(fn_abbadon)
            var x_draw = xten;
            var y_draw = top_offset + 30;
            var max_text_width = xr -( xten *2);

            draw_wrapped_text(x_draw, y_draw, string(pets[hovered_slot][3]), max_text_width);
        }
    }draw_set_color(c_black)
			draw_set_alpha(1)
			draw_set_font(fn_arialBig)

    // Restore text alignment to left
    draw_set_halign(fa_left);
}