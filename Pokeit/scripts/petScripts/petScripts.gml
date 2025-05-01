function petArray() {
    pets = [
        ["Glowstoat", "Lumen Slime", spr_stout, "Absorbs magical energy by day and emits gentle light by night, making it a charming companion and a living magical detector."],
        ["Ashclaw", "Ember Slime", spr_crestedGecko, "Born of the blood of Chuthga during the first cleave. Burns with both frost and flame, prized companions of high ranking giants and trained for hunting tasks"],
        ["SeaBunny", "Fortune Slime", spr_rabbit, "Konrads estimed pet, a lucky rabbit taken into the sea in ages past, elegant, poised, they draw his chariots through the waves."],
        ["Dustmew", "Veil Slime", spr_cat, " Known for phasing through thin barriers like fabric or mist, these aloof, nocturnal creatures are prized by those seeking a touch of mystery."],
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
        var sprite_x = screen_width / 2;
        var sprite_y = screen_height / 2 - 200;

        // Draw the selected pet sprite with scaling
        draw_sprite_ext(pets[selected_slot][2], 0, sprite_x - 130, sprite_y - 180, 3, 3, 0, c_white, 1);

        // Center-align the confirmation text
        draw_set_halign(fa_center);
        draw_text_color(screen_width / 2, sprite_y + 220, "Are you sure?", c_white, c_white, c_white, c_white, 1);

        // Define button properties
        var button_width = 100;
        var button_height = 50;
        var yes_x = screen_width / 2 - 120;
        var no_x = screen_width / 2 + 20;
        var button_y = sprite_y + 280;

        // Check for hover and selection for "Yes" button
        if (is_hovered(yes_x, button_y, button_width, button_height)) 
        {
            drawHighlight(yes_x, button_y, button_width, button_height); // Highlight button
            if (mouse_check_button_pressed(mb_left)) 
            {
                global.pet = pets[selected_slot][0]; // Assign selected pet
                room_goto_next(); // Move to next room
            }
        }

        // Check for hover and selection for "No" button
        if (is_hovered(no_x, button_y, button_width, button_height)) 
        {
            drawHighlight(no_x, button_y, button_width, button_height); // Highlight button
            if (mouse_check_button_pressed(mb_left)) 
            {
                selected_slot = -1; // Deselect pet
            }
        }

        // Draw the Yes button with green color
        draw_rectangle_color(yes_x, button_y, yes_x + button_width, button_y + button_height, c_green, c_green, c_green, c_green, false);
        draw_text_color(yes_x + button_width / 2, button_y + button_height / 2 - 10, "Yes", c_white, c_white, c_white, c_white, 1);

        // Draw the No button with red color
        draw_rectangle_color(no_x, button_y, no_x + button_width, button_y + button_height, c_red, c_red, c_red, c_red, false);
        draw_text_color(no_x + button_width / 2, button_y + button_height / 2 - 10, "No", c_white, c_white, c_white, c_white, 1);
    } 
    else 
    {
        // Define inventory layout positions
        var column1_x = 30;
        var column2_x = 200;
        var spacing_y = 200;

        // Define title position
        var title_x = screen_width / 2;
        var title_y = 10;

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
            draw_sprite(pets[i][2], 0, x_pos, y_pos );

            // Check for hover and selection
            if (is_hovered(x_pos, y_pos , 128, 128)) 
            {
                drawHighlight(x_pos, y_pos, 128, 128); // Highlight hovered pet
                hovered_slot = i;

                if (mouse_check_button_pressed(mb_left)) 
                {
                    selected_slot = i; // Select pet
                }
            }

            // Draw pet name below sprite
            draw_text(x_pos, y_pos + 130, pets[i][0]);
        }

        // If a pet is hovered and has additional information, display it
        if (hovered_slot != -1 && pets[hovered_slot][3] != noone) 
        {
            var x_draw = screen_width * 2 / 3;
            var y_draw = top_offset + 30;
            var max_text_width = screen_width / 3 - 20;

            draw_wrapped_text(x_draw, y_draw, string(pets[hovered_slot][3]), max_text_width);
        }
    }

    // Restore text alignment to left
    draw_set_halign(fa_left);
}