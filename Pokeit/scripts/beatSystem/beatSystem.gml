
function beatSystem() {
    var movement_step = 3; // Movement step
    var min_x = 100; // Left boundary
    var max_x = 300; // Right boundary
    var cy = room_height / 2; // Fixed Y position
    var rect_height = 10; // Height of rectangles

    // Green zone positions
    var green_zone_start = 180;
    var green_zone_end = 220;

    // Update indicator movement
    position_x += movement_step * rdirection;

    // Reverse direction when hitting boundaries
    if (position_x >= max_x || position_x <= min_x) {
        rdirection *= -1;
    }

    // Detect button press timing
    if (mouse_check_button_pressed(mb_left)) {
        if (position_x >= green_zone_start && position_x <= green_zone_end) {
            show_message("Success! You hit the green zone.");
        } else {
            show_message("Missed! Try again.");
        }
    }

    // Draw event
    draw_set_color(c_white);
    draw_rectangle(min_x, cy - rect_height / 2, max_x, cy + rect_height / 2, false); // Draw movement path

    // Draw indicator
    draw_set_color(c_red);
    draw_rectangle(position_x - 5, cy - 5, position_x + 5, cy + 5, false); // Indicator as a rectangle

    // Draw green zone (visual aid)
    draw_set_color(c_green);
    draw_rectangle(green_zone_start, cy - rect_height / 2, green_zone_end, cy + rect_height / 2, false); // Green zone as a rectangle
}


function drawSpiral(center_x, center_y, expansion_rate, rotation_speed, circle_radius) {
    // Update angle and radius
    spiral_angle += rotation_speed;
    spiral_radius += expansion_rate;

    // Calculate new position using polar coordinates
     x = center_x + lengthdir_x(spiral_radius, spiral_angle);
     y = center_y + lengthdir_y(spiral_radius, spiral_angle);

    // Draw small circle at the calculated position
    draw_set_color(c_red);
    draw_circle(x, y, circle_radius, false);
}