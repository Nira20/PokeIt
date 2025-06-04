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
function yn(yscr, noscr) {
    var button_width = sprite_get_width(spr_yes), button_height = sprite_get_height(spr_yes);
    var yes_x = room_width / 2 - 120, no_x = room_width / 2 + 20;
    var button_y = room_height / 2;

    var yes_hovered = is_hovered(yes_x, button_y, button_width, button_height);
    var no_hovered = is_hovered(no_x, button_y, button_width, button_height);

    // Handle "Yes" button interaction
    if (yes_hovered) {
        drawHighlight(yes_x, button_y, button_width, button_height);
        if (mouse_check_button_pressed(mb_left)) yscr();
    }

    // Handle "No" button interaction
    if (no_hovered) {
        drawHighlight(no_x, button_y, button_width, button_height);
        if (mouse_check_button_pressed(mb_left)) noscr();
    }

    // Draw Yes and No buttons with hover effects
   
    draw_sprite(spr_no, 0, no_x, button_y);
	 draw_sprite(spr_yes, 0, yes_x, button_y);
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
    draw_rectangle_color(button_x , start_y , button_x + button_width, start_y + button_height , c_white, c_white, c_white, c_white, true);
    draw_rectangle_color(button_x , start_y , button_x + button_width , start_y + button_height , c_black, c_black, c_black, c_black, true);
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

function singleButton(sX,sY,spr,scr){
	var sX2 = sprite_get_width(spr)
	var sY2 = sprite_get_height(spr)
	var sX3 = sX + sX2
	var sY3 = sY + sY2

draw_rectangle(sX, sY,sX3,sY3,0)	
draw_sprite(spr,0,sX, sY)


 if (is_hovered(sX, sY, sX2, sY2)) {
            
            drawHighlight(sX, sY, sX2, sY2);

            if (mouse_check_button_pressed(mb_left)) {
				scr()
              



}}}
