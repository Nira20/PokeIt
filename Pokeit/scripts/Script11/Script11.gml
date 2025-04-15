

function create() {
    user_name = ""; // Initialize the name as an empty string
    keyboard_string = ""; // Clear the keyboard string buffer
	max_length = 20; // Maximum length of the name
}

function step() {
    // Handle user input
    if (keyboard_check_pressed(vk_backspace)) {
        // Remove the last character when backspace is pressed
        if (string_length(user_name) > 0) {
            user_name = string_delete(user_name, string_length(user_name), 1);
        }
    } else if (keyboard_check_pressed(vk_enter)) {
        // Confirm input when Enter is pressed (optional logic for confirming the name)
        show_message("Name your Slime " + user_name);
    } else if (string_length(keyboard_string) > 0) {
        // Add characters typed by the user
        if (string_length(user_name) < max_length) {
            user_name += string_char_at(keyboard_string, 1);
        }
        keyboard_string = ""; // Clear the keyboard string buffer after adding a character
    }
}

function draw() {
    // Display instructions and the typed name on the screen
    draw_text(50, 50, "NAme your Slime:");
    draw_text(50, 100, user_name + "|"); // Add a cursor effect
}