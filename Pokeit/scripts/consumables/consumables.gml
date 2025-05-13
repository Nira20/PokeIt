function createConsumables(){
	inventoryConsumables= [
    // [name,          initial_quantity, description,        ]
   // [0,					1				2				
   	["Fix Cage 10%", 0,  "restore 10% of your shields durability",10],   // Early-game affordability
    ["Fix Cage 30%",0,  "restore 30% of your shields durability",10],  // Scaled price for mid-game
    ["Fix Cage 50%",0, "restore 50% of your shields durability",10],  // Mid-tier repair, balanced
    ["Fix Cage 80%",0, "restore 80% of your shields durability",10],  // Significant repair, premium cost
	["Calm Slime",  0,  "Calm down slime for a time",10 ],   // Temporary effect, reasonable cost
    ["Overcharge",  0, "Make your men work faster",10]   // Short boost, affordable for early use

];

}
function drawInventory(item_array) {
    var button_height = string_height("Sample Text") + 10;
    var button_width = string_width("Fix Cage 80% st")
    
    for (var i = 0; i < array_length(item_array); i++) {
        var start_x = tr_mid_x / 4;
        var start_y = tr_mid_y * 2 + (i * button_height);
        
        // Draw item name and quantity
        draw_text(start_x, start_y, string(item_array[i][0]));
        draw_text(start_x + button_width , start_y, "x" + string(item_array[i][1]));
		draw_text(start_x + button_width +  string_width("x 1000") , start_y, "$" + string(item_array[i][3]));


        // Check for hover and interaction
        if (is_hovered(start_x, start_y, button_width, button_height)) {
            drawHighlight(start_x, start_y, button_width, button_height); // Highlight button
            if (mouse_check_button_pressed(mb_left)) {
               selected_slot = i
			   
            }
        }
    }
}