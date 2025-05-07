/// Functions for resetting variables
function backButtonF(variableToReset) { return 0; }
function backButtonT(variableToReset) { return 1; }
function backButtonA(variableToReset) { return -1; }
function word_wrap(text, max_width) {
    var words = string_split(text, " ");
    var result = [];
    var line = "";
    
    for (var i = 0; i < array_length(words); i++) {
        var test_line = line + words[i] + " ";
        if (string_width(test_line) > max_width) {
            array_push(result, line);
            line = words[i] + " ";
        } else {
            line = test_line;
        }
    }
    array_push(result, line);
    return result;
}
/// Function to draw wrapped text within a max width
function draw_wrapped_text(x, y, text, max_width) {
    var words = string_split(text, " "), current_line = "", line_height = 20;
    
    for (var i = 0; i < array_length(words); i++) {
        var test_line = current_line + (current_line == "" ? "" : " ") + words[i];

        if (string_width(test_line) > max_width) {
            draw_text(x, y, current_line);
            y += line_height;
            current_line = words[i];
        } else {
            current_line = test_line;
        }
    }
    
    if (current_line != "") draw_text(x, y, current_line);
}

/// Function to draw Yes/No selection buttons
function yn(yscr, noscr, t1, t2) {
    var button_width = 100, button_height = 50;
    var yes_x = room_width / 2 - 120, no_x = room_width / 2 + 20;
    var button_y = room_height / 2; // Fixed undefined variable `ym`

    // Handle "Yes" button interaction
    if (is_hovered(yes_x, button_y, button_width, button_height)) {
        drawHighlight(yes_x, button_y, button_width, button_height);
        if (mouse_check_button_pressed(mb_left)) yscr();
    }

    // Handle "No" button interaction
    if (is_hovered(no_x, button_y, button_width, button_height)) {
        drawHighlight(no_x, button_y, button_width, button_height);
        if (mouse_check_button_pressed(mb_left)) noscr();
    }

    // Draw Yes and No buttons
    draw_rectangle_color(yes_x, button_y, yes_x + button_width, button_y + button_height, c_green, c_green, c_green, c_green, false);
    draw_text_color(yes_x, button_y, string(t1), c_white, c_white, c_white, c_white, 1);

    draw_rectangle_color(no_x, button_y, no_x + button_width, button_y + button_height, c_red, c_red, c_red, c_red, false);
    draw_text_color(no_x, button_y, string(t2), c_white, c_white, c_white, c_white, 1);
}

/// Function to draw multiple buttons with hover interactions
function drawButtons(buttons, start_x, start_y, button_width, button_height, spacing) {
    for (var i = 0; i < array_length(buttons); i++) {
        var button_x = start_x + i * (button_width + spacing);
        
        draw_rectangle_color(button_x, start_y, button_x + button_width, start_y + button_height, c_gray, c_gray, c_gray, c_gray, false);
        var button_text = (buttons[i] == "iPay") ? string(iPay) : string(buttons[i]);
        draw_text_color(button_x - 30 + (button_width / 2), start_y + button_height / 2, button_text, c_black, c_black, c_black, c_black, 1);

        if (is_hovered(button_x, start_y, button_width, button_height)) {
            hslot = i;
            drawHighlight(button_x, start_y, button_width, button_height);
            if (mouse_check_button_pressed(mb_left)) debtIncrements(buttons, hslot);
        }
    }
}

/// Function to check if the mouse is hovering over a rectangular area
function is_hovered(button_x, start_y, button_width, button_height) {
    return (mouse_x >= button_x && mouse_x <= button_x + button_width && mouse_y >= start_y && mouse_y <= start_y + button_height);
}

/// Function to draw a highlight effect around a button
function drawHighlight(button_x, start_y, button_width, button_height) {
    draw_rectangle_color(button_x - 2, start_y - 2, button_x + button_width + 2, start_y + button_height + 2, c_white, c_white, c_white, c_white, true);
    draw_rectangle_color(button_x - 4, start_y - 4, button_x + button_width + 4, start_y + button_height + 4, c_black, c_black, c_black, c_black, true);
}

/// Function to increase anger-related counters
function anger() {
    global.slimeSizeCounter++;
    global.angerCounter++;
}

/// Function to handle poking interactions
function poke() {
    global.Counter += global.acamount * global.acq;
    anger();
}
	
	function adjust_screen_ui() {
   
    var screen_width = display_get_width();
    var screen_height = display_get_height();

    // Calculate scaling factors
    var scale_x = screen_width / room_width;
    var scale_y = screen_height / room_height;
    
    // Choose the smaller scale factor to maintain aspect ratio
    var final_scale = min(scale_x, scale_y);

    // Apply scaling to the view
    view_xport[0] = 0;
    view_yport[0] = 0;
    view_wport[0] = room_width * final_scale;
    view_hport[0] = room_height * final_scale;

    // Adjust the camera or GUI scaling
    display_set_gui_size(room_width, room_height);
}

function adjust_screen_ui_web() {
   


    // Calculate scaling factors
    var scale_x = browser_width / room_width;
    var scale_y = browser_height / room_height;

    // Choose the smaller scale to maintain aspect ratio
    var final_scale = min(scale_x, scale_y);

    // Adjust viewport dynamically
    view_xport[0] = 0;
    view_yport[0] = 0;
    view_wport[0] = room_width * final_scale;
    view_hport[0] = room_height * final_scale;

    // Adjust HTML5 canvas scaling (IMPORTANT for web)
    display_set_gui_size(room_width * final_scale, room_height * final_scale);
    
    // Ensuring full-screen adaptability
    window_set_size(room_width * final_scale, room_height * final_scale);
}
	
