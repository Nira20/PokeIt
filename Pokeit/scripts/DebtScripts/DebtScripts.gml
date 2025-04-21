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
            draw_set_color(c_white);
            draw_rectangle(start_x - 2, button_y - 2, start_x + button_width + 2, button_y + button_height + 2, false);

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
                      draw_interface()
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
function draw_interface() {
  
    

    // Button layout properties
    var buttons = [
        {x: 200, y: 300, text: "Decrease by 1", value: -1},
        {x: 200, y: 350, text: "Decrease by 10", value: -10},
        {x: 200, y: 400, text: "Decrease by 100", value: -100},
        {x: 600, y: 300, text: "Increase by 1", value: 1},
        {x: 600, y: 350, text: "Increase by 10", value: 10},
        {x: 600, y: 400, text: "Increase by 100", value: 100}
    ];

    // Draw interface
    draw_set_color(c_white);
    draw_text(room_width / 2 - 50, 100, "Player Money: " + string(playerMoney));
    draw_text(room_width / 2 - 50, 150, "ipay: " + string(ipay));

    // Draw and check button functionality
    for (var i = 0; i < array_length(buttons); i++) {
        var btn = buttons[i];
        draw_rectangle(btn.x - 10, btn.y - 10, btn.x + 120, btn.y + 40, false); // Button background
        draw_text(btn.x, btn.y, btn.text); // Button text

        // Check for mouse click interaction
        if (mouse_check_button_pressed(mb_left) &&
            point_in_rectangle(mouse_x, mouse_y, btn.x - 10, btn.y - 10, btn.x + 120, btn.y + 40)) {
            ipay += btn.value; // Adjust ipay based on button click
        }
    }
}
