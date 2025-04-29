function backButtonF(variableToReset) {
/// @function backButtonF(variableToReset)
/// @desc sets choosen variable to False.
    variableToReset = 0; // Reset to default value
    return variableToReset; // Return the reset value
}


function backButtonT(variableToReset) {
/// @function backButtonT(variableToReset)
/// @desc sets choosen variable to True.
    variableToReset = 1; // Reset to default value
    return variableToReset; // Return the reset value

}

function backButtonA(variableToReset) {
/// @function backButtonA(variableToReset)
/// @desc sets choosen variable to -1
    variableToReset = -1; // Reset to default value
    return variableToReset; // Return the reset value
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
	
function yn(){
var button_width = 100; 
var button_height = 50; 
var yes_x = room_width / 2 - 120; 
var no_x = room_width / 2 + 20; 
var button_y = sprite_y + 280; 

// Check if the mouse is hovering over the "Yes" button
if (is_hovered(yes_x, button_y, button_width, button_height)) {
    drawHighlight(yes_x, button_y, button_width, button_height);

    // Check if the mouse clicks the "Yes" button
    if (mouse_check_button_pressed(mb_left)) {
      
    }
}

// Check if the mouse is hovering over the "No" button
if (is_hovered(no_x, button_y, button_width, button_height)) {
    drawHighlight(no_x, button_y, button_width, button_height);

    // Check if the mouse clicks the "No" button
    if (mouse_check_button_pressed(mb_left)) {
        
    }
}

// Draw "Yes" button
draw_rectangle_color(yes_x, button_y, yes_x + button_width, button_y + button_height, c_green, c_green, c_green, c_green, false);
draw_text_color(yes_x + button_width / 2, button_y + button_height / 2 - 10, "Yes", c_white, c_white, c_white, c_white, 1);

// Draw "No" button
draw_rectangle_color(no_x, button_y, no_x + button_width, button_y + button_height, c_red, c_red, c_red, c_red, false);
draw_text_color(no_x + button_width / 2, button_y + button_height / 2 - 10, "No", c_white, c_white, c_white, c_white, 1);

        // Check if the mouse is hovering over the "No" button
        if is_hovered(no_x, button_y,button_width,button_height) {
            // Draw a rectangle over the "No" button
          
            drawHighlight(no_x, button_y,button_width,button_height) 
            
            // Check if the mouse clicks the "No" button
            if (mouse_check_button_pressed(mb_left)) {
                
            }
        }

       // Draw the "Yes" button
draw_rectangle_color(yes_x, button_y, yes_x + button_width, button_y + button_height, c_green,c_green,c_green,c_green, false);
draw_text_color(yes_x + button_width / 2, button_y + button_height / 2 - 10, "Yes", c_white,c_white,c_white,c_white,1);

// Draw the "No" button
draw_rectangle_color(no_x, button_y, no_x + button_width, button_y + button_height, c_red,c_red,c_red,c_red, false);
draw_text_color(no_x + button_width / 2, button_y + button_height / 2 - 10, "No", c_white, c_white,c_white,c_white,1);
}


function drawButtons(buttons, start_x, start_y, button_width, button_height, spacing) {
/// @function draw_buttons(buttons, start_x, start_y, button_width, button_height, spacing)
/// @desc Draws a set of buttons with hover and click interactions.
/// @param Array of button labels.
/// @param Starting X position for buttons.
/// @param Starting Y position for buttons.
/// @param Width of each button.
/// @param Height of each button.
/// @param Gap between buttons.
    for (var i = 0; i < array_length(buttons); i++) {
        var button_x = start_x + i * (button_width + spacing); // Calculate X position for each button

        // Draw button background
        draw_rectangle_color(button_x, start_y, button_x + button_width, start_y + button_height, c_gray, c_gray, c_gray, c_gray, false);

        // Display button text
        var button_text = (buttons[i] == "iPay") ? string(ipay) : string(buttons[i]);
        draw_text_color(button_x - 30 + (button_width / 2), start_y + button_height / 2, button_text, c_black, c_black, c_black, c_black, 1);

       if (is_hovered(button_x, start_y, button_width, button_height)) {
    hslot = i; // Highlight the hovered button

    // Draw highlight rectangle
    draw_rectangle_color(button_x - 2, start_y - 2, button_x + button_width + 2, start_y + button_height + 2,c_white, c_white, c_white, c_white, true);
	draw_rectangle_color(button_x - 4, start_y - 4, button_x + button_width + 4, start_y + button_height + 4,c_black, c_black, c_black, c_black, true);

    // Check for mouse click interaction
    if (mouse_check_button_pressed(mb_left)) {
        debtIncrements(buttons, hslot); // Pass buttons and hslot to the function
    }
}

            }
        }


     
function is_hovered(button_x, start_y, button_width, button_height) {
	/// @function is_hovered(button_x, start_y, button_width, button_height)
/// @desc Checks if the mouse is hovering over a rectangular area.
/// @param X position of the button.
/// @param Y position of the object.
/// @param  Width of the object.
/// @param Height of the object.
/// @return Boolean (true if hovered, false otherwise).

    return (mouse_x >= button_x && mouse_x <= button_x + button_width && mouse_y >= start_y && mouse_y <= start_y + button_height);

}

function drawHighlight(button_x, start_y, button_width, button_height ) {
// Draw highlight rectangle
    draw_rectangle_color(button_x - 2, start_y - 2, button_x + button_width + 2, start_y + button_height + 2,c_white, c_white, c_white, c_white, true);
	draw_rectangle_color(button_x - 4, start_y - 4, button_x + button_width + 4, start_y + button_height + 4,c_black, c_black, c_black, c_black, true);


}

// Function to increase anger-related counters
function anger() {
    global.slimeSizeCounter++; // Increment the slime size counter
    global.angerCounter++;     // Increment the anger counter
}

// Function to handle poking interactions
function poke() {
    // Increase the global counter based on auto-click amount and quantity
    global.Counter += global.acamount * global.acq;
    
    // Call the anger function to update related variables
    anger();
}
