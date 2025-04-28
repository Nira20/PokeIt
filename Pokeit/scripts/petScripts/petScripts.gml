function petArray() {
    pets = [
        ["Glowstoat", "Lumen Slime", spr_stout, "A sleek, ferret-like creature with softly glowing fur in enchanting hues of blue, green, or purple. Absorbs magical energy by day and emits gentle light by night, making it a charming companion and a living magical detector."],
        ["Ashclaw", "Ember Slime", spr_crestedGecko, "A sleek, cat-sized lizard with obsidian-like scales veined in glowing orange or red. Emits gentle warmth and harmless embers when relaxed, making it a reliable and cozy companion for travelers and those in colder climates."],
        ["Whimwhisker", "Fortune Slime", spr_rabbit, "A delicate hybrid of rabbit and fox, with oversized ears and a tail that scatters sparkling dust as it runs. Hyper-attuned to probability shifts, it alerts its owner to impending misfortune, making it a prized companion for gamblers, spellcasters, and adventurers alike."],
        ["Dustmew", "Veil Slime", spr_cat, "A graceful feline with delicate, batlike wings and shimmering, smoke-colored fur. Known for phasing through thin barriers like fabric or mist, these aloof, nocturnal creatures are prized by spies, thieves, and nobles seeking a touch of mystery."],
        ["Skelpling", "Mirebone Slime", spr_shrew, "A rat-like creature with scruffy fur and a skull-like mask over its face. Immune to necrotic magic, it instinctively seeks out cursed or undead areas, making it a favored companion for necromancers and healers as a magical warning or detoxifier."],
        ["Inkpecker", "Script Slime", spr_crow, "A small, crow-like bird with iridescent black feathers that shimmer like oil spills. Its beak continuously drips magical ink, useful for spellwriting. Intelligent and mischievous, it’s a favorite among scribes and arcane researchers for both companionship and a sustainable source of ink."]
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

function drawPets() {
    var screen_width = room_width;
    var screen_height = room_height;
    draw_set_font(fn_arialBig);

    if (selected_slot != -1) {
        var sprite_x = screen_width / 2;
        var sprite_y = screen_height / 2 - 200;

        draw_sprite_ext(pets[selected_slot][2], 0, sprite_x - 130, sprite_y - 180, 3, 3, 0, c_white, 1);

        draw_set_halign(fa_center);
        draw_text_color(screen_width / 2, sprite_y + 220, "Are you sure?", c_white, c_white, c_white, c_white, 1);

        var button_width = 100;
        var button_height = 50;
        var yes_x = screen_width / 2 - 120;
        var no_x = screen_width / 2 + 20;
        var button_y = sprite_y + 280;

        if (is_hovered(yes_x, button_y, button_width, button_height)) {
            drawHighlight(yes_x, button_y, button_width, button_height);
            if (mouse_check_button_pressed(mb_left)) {
                global.pet = pets[selected_slot][0];
                room_goto_next();
            }
        }

        if (is_hovered(no_x, button_y, button_width, button_height)) {
            drawHighlight(no_x, button_y, button_width, button_height);
            if (mouse_check_button_pressed(mb_left)) {
                selected_slot = -1;
            }
        }

        draw_rectangle_color(yes_x, button_y, yes_x + button_width, button_y + button_height, c_green, c_green, c_green, c_green, false);
        draw_text_color(yes_x + button_width / 2, button_y + button_height / 2 - 10, "Yes", c_white, c_white, c_white, c_white, 1);

        draw_rectangle_color(no_x, button_y, no_x + button_width, button_y + button_height, c_red, c_red, c_red, c_red, false);
        draw_text_color(no_x + button_width / 2, button_y + button_height / 2 - 10, "No", c_white, c_white, c_white, c_white, 1);
    } else {
        var column1_x = 30;
        var column2_x = 200;
        var spacing_y = 150;

        var title_x = screen_width / 2;
        var title_y = 10;

        draw_set_halign(fa_center);
        draw_text(title_x, title_y, text1);

        draw_set_halign(fa_left);
        var top_offset = 50;

        for (var i = 0; i < inventory_slots; i++) {
            var x_pos = (i % 2 == 0) ? column1_x : column2_x;
            var y_pos = top_offset + 10 + (floor(i / 2) * spacing_y);

            draw_sprite(pets[i][2], 0, x_pos, y_pos);

            if (is_hovered(x_pos, y_pos, 128, 128)) {
                drawHighlight(x_pos, y_pos, 128, 128);
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

    draw_set_halign(fa_left);
}