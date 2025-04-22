function payDebt() {
    var button_labels = ["Max", "Min", "100", "Other"];
    var button_width = 120; // Button width
    var button_height = 50; // Button height
    var spacing = 20; // Gap between buttons
    var start_x = (room_width - button_width) / 2; // Center the buttons horizontally
    var start_y = room_height -400 ; // Starting Y position for the first button

    for (var i = 0; i < array_length(button_labels); i++) {
        var button_y = start_y + i * (button_height + spacing); // Calculate Y position of each button

        // Check if the mouse is hovering over the current button
        if (mouse_x > start_x && mouse_x < start_x + button_width && mouse_y > button_y && mouse_y < button_y + button_height) {
            // Highlight the button
        
            draw_rectangle_color(start_x - 2, button_y - 2, start_x + button_width + 2, button_y + button_height + 2,c_white,c_white,c_white,c_white, false);

            // Handle button click
            if (mouse_check_button_pressed(mb_left)) {
                var pay = 0;

                switch (button_labels[i]) {
                    case "Max":
                        pay = playerMoney; // Pay all available money
                        break;
                    case "Min":
                        pay = 10; // Set a minimum pay amount (example)
                        break;
                    case "100":
                        pay = 100; // Pay a fixed amount of 100
                        break;
                    case "Other":
                      othr = true
					  visable = false
                            break;
                        
                       
                }

                // Ensure playerMoney does not go below 0
                if (playerMoney >= pay && pay > 0) {
                    playerMoney -= pay;
                    spentMoney += pay;
                    global.debt -= pay;
                } else if (pay > 0) {
                    show_message("Not enough money to pay!");
                }
            }
        }

        // Draw button background and text
        draw_sprite_stretched(spr_button, 0, start_x, button_y, button_width, button_height); // Draw button background
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_text(start_x + button_width / 2, button_y + button_height / 2, button_labels[i]); // Draw button text
    }
}
function checkDebt(payment){
if payment >= playerMoney {
payment = playerMoney
}

}

function debtIncrements(buttons, hslot) {
    switch (buttons[hslot]) {
        case "<<<":
            ipay += 100;
            break;

        case "<<":
            ipay += 10;
            break;

        case "<":
            ipay += 1;
            break;

        case "iPay":
            // No increment for "iPay" button
            break;

        case ">":
            ipay -= 1;
            break;

        case ">>":
            ipay -= 10;
            break;

        case ">>>":
            ipay -= 100;
            break;
    }
}
function draw_interface() {
    // Define button settings
    var spacing = 20; // Gap between buttons
    var buttons = ["<<<", "<<", "<", "iPay", ">", ">>", ">>>"];
    var button_width = (room_width - ((array_length(buttons) + 1) * spacing)) / array_length(buttons);
    var button_height = 64; // Button height
    var start_x = 30; // Starting X position for buttons
    var start_y = yb - 300; // Starting Y position for all buttons

    // Iterate through the buttons
    for (var i = 0; i < array_length(buttons); i++) {
        var button_x = start_x + i * (button_width + spacing); // Calculate X position for each button

        // Draw button background
        draw_rectangle_color(button_x , start_y , button_x + button_width , start_y + button_height, c_gray, c_gray, c_gray, c_gray, false);

        // Display button text
        var button_text = (buttons[i] == "iPay") ? string(ipay) : string(buttons[i]);
        draw_text_color(button_x -30 +( button_width / 2), start_y + button_height / 2, button_text, c_black, c_black, c_black, c_black, 1);

        // Check for hover interaction
        if (mouse_x >= button_x && mouse_x <= button_x + button_width && mouse_y >= start_y && mouse_y <= start_y + button_height) {
            hslot = i; // Highlight the hovered button

            // Draw highlight rectangle
            draw_rectangle_color(button_x - 2, start_y - 2, button_x + button_width + 2, start_y + button_height + 2, c_blue, c_brightCyan, c_dullCyan, c_vividWhite, true);

            // Check for mouse click interaction
            if (mouse_check_button_pressed(mb_left)) {
                debtIncrements(buttons, hslot); // Pass buttons and hslot to the function
            }
        }
    }
}