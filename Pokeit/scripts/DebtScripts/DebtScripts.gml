function payDebt() {
    var button_labels = ["Max", "Min", "100", "Other"];
    var button_width = 120; // Button width
    var button_height = 50; // Button height
    var spacing = 20; // Gap between buttons
    var start_x = (room_width - button_width) / 2; // Center the buttons horizontally
    var start_y = room_height - 220; // Starting Y position for the first button

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
                        show_message("Custom pay functionality not implemented.");
                        break;
                }

                // Ensure playerMoney does not go below 0
                if (playerMoney >= pay) {
                    playerMoney -= pay;
                    spentMoney += pay;
                    global.debt -= pay;
                } else {
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