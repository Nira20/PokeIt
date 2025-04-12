
function petArray(){
pets = [
    ["Glowstoat", "Lumen Slime", spr_stout, "A sleek, ferret-like creature with softly glowing fur in enchanting hues of blue, green, or purple. Absorbs magical energy by day and emits gentle light by night, making it a charming companion and a living magical detector."],
    ["Ashclaw", "Ember Slime", spr_crestedGecko, "A sleek, cat-sized lizard with obsidian-like scales veined in glowing orange or red. Emits gentle warmth and harmless embers when relaxed, making it a reliable and cozy companion for travelers and those in colder climates."],
    ["Whimwhisker", "Fortune Slime", spr_rabbit, "A delicate hybrid of rabbit and fox, with oversized ears and a tail that scatters sparkling dust as it runs. Hyper-attuned to probability shifts, it alerts its owner to impending misfortune, making it a prized companion for gamblers, spellcasters, and adventurers alike."],
    ["Dustmew", "Veil Slime", spr_cat, "A graceful feline with delicate, batlike wings and shimmering, smoke-colored fur. Known for phasing through thin barriers like fabric or mist, these aloof, nocturnal creatures are prized by spies, thieves, and nobles seeking a touch of mystery."],
    ["Skelpling", "Mirebone Slime", spr_shrew, "A rat-like creature with scruffy fur and a skull-like mask over its face. Immune to necrotic magic, it instinctively seeks out cursed or undead areas, making it a favored companion for necromancers and healers as a magical warning or detoxifier."],
    ["Inkpecker", "Script Slime", spr_crow, "A small, crow-like bird with iridescent black feathers that shimmer like oil spills. Its beak continuously drips magical ink, useful for spellwriting. Intelligent and mischievous, it’s a favorite among scribes and arcane researchers for both companionship and a sustainable source of ink."]
]
}

function createPets() {
    global.pet = noone;
    rows = 2;
    hovered_slot = -1;
    selected_slot = -1;
    inventory_slots = array_length(pets);
    text1 = "Select your Slime Base";
}
function draw_wrapped_text(x, y, text, max_width) {
    var words = string_split(text, " "); // Split the text into words
    var current_line = "";
    var line_height = 20; // Adjust as needed for text spacing

    for (var i = 0; i < array_length(words); i++) {
        var test_line = current_line + (current_line == "" ? "" : " ") + words[i];
        if (string_width(test_line) > max_width) {
            // Draw the current line if the width exceeds max_width
            draw_text(x, y, current_line);
            y += line_height; // Move to the next line
            current_line = words[i]; // Start a new line
        } else {
            // Add the word to the current line
            current_line = test_line;
        }
    }
    // Draw the last line
    if (current_line != "") {
        draw_text(x, y, current_line);
    }
}
function drawPets() {
    var screen_width = room_width; // Get screen width
    var screen_height = room_height; // Get screen height

    // Check if a pet is selected
    if (selected_slot != -1) {
        // Clear everything else and focus on the confirmation
        var sprite_x = screen_width / 2 ; // Center the sprite horizontally
        var sprite_y = screen_height / 2 - 200 ; // Center the sprite vertically (adjusted to be above the buttons)

        // Draw the selected sprite at 3x size
        draw_sprite_ext(pets[selected_slot][2], 0, sprite_x-130 , sprite_y - 180, 3, 3, 0, c_white, 1);

        // Draw "Are you sure?" text below the sprite
        draw_set_halign(fa_center); // Center-align the text
		draw_set_color(c_white)
        draw_text(screen_width / 2, sprite_y + 220, "Are you sure?");
        
        // Draw "Yes" and "No" buttons
        var button_width = 100; // Button width
        var button_height = 50; // Button height
        var yes_x = screen_width / 2 - 120; // Position for "Yes" button
        var no_x = screen_width / 2 + 20; // Position for "No" button
        var button_y = sprite_y + 280; // Y position for buttons (below the text)

        // Check if the mouse is hovering over the "Yes" button
        if (mouse_x > yes_x && mouse_x < yes_x + button_width && mouse_y > button_y && mouse_y < button_y + button_height) {
            // Draw a rectangle over the "Yes" button
            draw_set_color(c_white); // Set rectangle color
            draw_rectangle(yes_x - 2, button_y - 2, yes_x + button_width + 2, button_y + button_height + 2, false);
            
            // Check if the mouse clicks the "Yes" button
            if (mouse_check_button_pressed(mb_left)) {
                global.pet = pets[selected_slot][0]; // Update global.pet
                room_goto_next(); // Go to the next room
            }
        }

        // Check if the mouse is hovering over the "No" button
        if (mouse_x > no_x && mouse_x < no_x + button_width && mouse_y > button_y && mouse_y < button_y + button_height) {
            // Draw a rectangle over the "No" button
            draw_set_color(c_white); // Set rectangle color
            draw_rectangle(no_x - 2, button_y - 2, no_x + button_width + 2, button_y + button_height + 2, false);
            
            // Check if the mouse clicks the "No" button
            if (mouse_check_button_pressed(mb_left)) {
                selected_slot = -1; // Reset selected_slot
            }
        }

        // Draw the "Yes" button
        draw_set_color(c_green);
        draw_rectangle(yes_x, button_y, yes_x + button_width, button_y + button_height, false);
        draw_set_color(c_white);
        draw_text(yes_x + button_width / 2, button_y + button_height / 2 - 10, "Yes");

        // Draw the "No" button
        draw_set_color(c_red);
        draw_rectangle(no_x, button_y, no_x + button_width, button_y + button_height, false);
        draw_set_color(c_white);
        draw_text(no_x + button_width / 2, button_y + button_height / 2 - 10, "No");

        // Reset color
        draw_set_color(c_white);
    } else {
        // Regular pets drawing logic here (unchanged)
        var column1_x = 30; // X position for the first column
        var column2_x = 200; // X position for the second column
        var spacing_y = 150; // Vertical spacing between rows

        // Draw the title text at the top middle of the screen
        var title_x = screen_width / 2; // Center of the screen
        var title_y = 10; // Top margin for the title

        draw_set_halign(fa_center); // Center-align the text
        draw_text(title_x, title_y, text1); // Draw the title
		draw_set_halign(fa_left)
        var top_offset = 50; // Adjust spacing below the title text

        for (var i = 0; i < inventory_slots; i++) {
            var x_pos = (i % 2 == 0) ? column1_x : column2_x;
            var y_pos = top_offset + 10 + (floor(i / 2) * spacing_y);

            draw_sprite(pets[i][2], 0, x_pos, y_pos);

            if (mouse_x > x_pos && mouse_x < x_pos + 128 && mouse_y > y_pos && mouse_y < y_pos + 128) {
                draw_set_color(c_white);
                draw_set_alpha(0.5);
                draw_rectangle(x_pos, y_pos, x_pos + 128, y_pos + 128, true);
                draw_set_alpha(1);
                
                hovered_slot = i;

                if (mouse_check_button_pressed(mb_left)) {
                    selected_slot = i;
                }
            }

            draw_text(x_pos, y_pos + 130, pets[i][0]);
        }

        if (hovered_slot != -1 && pets[hovered_slot][3] != noone) {
            var x_draw = screen_width * 2 / 3;
            var y_draw = top_offset + 10;
            var max_text_width = screen_width / 3 - 20;

            draw_wrapped_text(x_draw, y_draw, string(pets[hovered_slot][3]), max_text_width);
        }
    }

    draw_set_halign(fa_left); // Reset alignment
}
