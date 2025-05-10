 function gameOverSlime(){
 draw_clear(c_black);
    draw_set_font(fn_paintDrips);
menu = -1
    var txt = "The Slime has broken free, it destroyed everything";
    var max_width = 400;
    var line_height = string_height("A"); // Get font height
    var x_start = room_width / 2 - max_width / 2;
    var y_start = room_height / 2 - 70;

    // Wrap text manually
    var wrapped_lines = word_wrap(txt, max_width);

    for (var line = 0; line < array_length(wrapped_lines); line++) {
        var y_pos = y_start + line * line_height;
        var x_pos = x_start; // Start position for letters

        // Loop through each letter in the current line
        for (var i = 0; i < string_length(wrapped_lines[line]); i++) {
            var letter = string_char_at(wrapped_lines[line], i + 1);
            var letter_width = string_width(letter); // Get the width of the letter
            var letter_y = y_pos + 5 * sin(current_time / 250 + i); // Floating effect

            draw_text(x_pos, letter_y, letter);
            x_pos += letter_width; // Adjust spacing dynamically
        }
    }

    // Create restart button
    var button_x = room_width / 2 - 50;
    var button_y = room_height / 2 + (array_length(wrapped_lines) * line_height) + 30;
    var button_w = 100;
    var button_h = 40;

    draw_set_color(c_gray);
    draw_rectangle(button_x, button_y, button_x + button_w, button_y + button_h, false);

    draw_set_color(c_white);
    draw_text(button_x + 15, button_y + 10, "Restart");

    if mouse_check_button(mb_left) &&
       mouse_x > button_x && mouse_x < button_x + button_w &&
       mouse_y > button_y && mouse_y < button_y + button_h {
        game_restart();
    } }
	
function GameOverM(){
	 draw_clear(c_black);
    draw_set_font(fn_abbadon);
menu = -1
    var txt = "You have disrepected me for the first and final time. Your soul is forfiet.";
    var max_width = 400;
    var line_height = string_height("A"); // Get font height
    var x_start = room_width / 2 - max_width / 2;
    var y_start = room_height / 2 - 70;

    // Wrap text manually
    var wrapped_lines = word_wrap(txt, max_width);

    for (var line = 0; line < array_length(wrapped_lines); line++) {
        var y_pos = y_start + line * line_height;
        var x_pos = x_start; // Start position for letters

        // Loop through each letter in the current line
        for (var i = 0; i < string_length(wrapped_lines[line]); i++) {
            var letter = string_char_at(wrapped_lines[line], i + 1);
            var letter_width = string_width(letter); // Get the width of the letter
            var letter_y = y_pos + 5 * sin(current_time / 250 + i); // Floating effect

            draw_text(x_pos, letter_y, letter);
            x_pos += letter_width; // Adjust spacing dynamically
        }
    }

    // Create restart button
    var button_x = room_width / 2 - 50;
    var button_y = room_height / 2 + (array_length(wrapped_lines) * line_height) + 30;
    var button_w = 100;
    var button_h = 40;

    draw_set_color(c_gray);
    draw_rectangle(button_x, button_y, button_x + button_w, button_y + button_h, false);

    draw_set_color(c_white);
    draw_text(button_x + 15, button_y + 10, "Restart");

    if mouse_check_button(mb_left) &&
       mouse_x > button_x && mouse_x < button_x + button_w &&
       mouse_y > button_y && mouse_y < button_y + button_h {
        game_restart();
    } }
	
	