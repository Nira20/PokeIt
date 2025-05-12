function createConsumables(){
	inventoryConsumables= [
    // [name,          initial_quantity, sprite,         image_index, image_index_2, color,    base_price, current_price, buyable, isPowerUp, price_increase, text, 0 = consumable, 1 = upgrade]
   // [0,					1				2				3				4			5			6			7			8			9		10
   	["Fix Cage 10%", 0,  "restore 10% of your shields durability",],   // Early-game affordability
    ["Fix Cage 30%",0,  "restore 30% of your shields durability",],  // Scaled price for mid-game
    ["Fix Cage 50%",0, "restore 50% of your shields durability",],  // Mid-tier repair, balanced
    ["Fix Cage 80%",0, "restore 80% of your shields durability"],  // Significant repair, premium cost
	["Calm Slime",  0,  "Calm down slime for a time" ],   // Temporary effect, reasonable cost
    ["Overcharge",    0, "Make your men work faster"]   // Short boost, affordable for early use

];

}
function drawInventory(item_array) {
    var button_height = string_height("Sample Text") + 10;
    var button_width = tr_mid_x / 2;
    
    for (var i = 0; i < array_length(item_array); i++) {
        var start_x = tr_mid_x / 4;
        var start_y = tr_mid_y * 2 + (i * button_height);
        
        // Draw item name and quantity
        draw_text(start_x, start_y, string(item_array[i][0]));
        draw_text(tr_mid_x, start_y, "x" + string(item_array[i][1]));

        // Check for hover and interaction
        if (is_hovered(start_x, start_y, button_width, button_height)) {
            drawHighlight(start_x, start_y, button_width, button_height); // Highlight button
            if (mouse_check_button_pressed(mb_left)) {
               selected_slot = i
            }
        }
    }
}