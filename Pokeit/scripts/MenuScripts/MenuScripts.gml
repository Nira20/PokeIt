function menuCreate(){
	menu =0 
	selectedType = -1
	
}

function menuLoops(){
selectedTypeSwitch()
menuSwitch()

}

 function drawMenu() {
    // Define button properties
    var button_width = room_width * 0.4;
    var button_height = room_height * 0.1;
    var y_position = room_height * 0.4;

    // Initialize button_texts array dynamically based on menu value
    var button_texts = ["Consumables", "Permanents", "Quests", "Payments"];
     


    // Draw menu buttons dynamically
    for (var ii = 0; ii < array_length(button_texts); ii++) {
        var x_position = room_width / 2 - button_width / 2;
        var current_y = y_position + ii * (button_height + room_height * 0.02);

        var hover = point_in_rectangle(mouse_x, mouse_y, x_position, current_y, x_position + button_width, current_y + button_height);
        var scale_x = hover ? 1.1 : 1.0;
        var scale_y = hover ? 1.1 : 1.0;
        var text_scale = hover ? 1.2 : 1.0;

        draw_sprite_stretched_ext(spr_button1, 0, x_position - (button_width * (scale_x - 1) / 2), current_y - (button_height * (scale_y - 1) / 2), button_width * scale_x, button_height * scale_y, global.colors[ii], 1);
        draw_text_transformed(x_position, current_y , button_texts[ii], text_scale, text_scale, 0);

        if (hover && mouse_check_button_pressed(mb_left)) {
            selectedType = ii; }
	}
  }
			

function menuSwitch(){
	switch(menu){
		case -1: 
	break;
		
	case 0: 
	drawMenu()
	break;
	
	case 1:
	selectedType = -1
	break;
	
	
	case 2:
	selectedType = -1
	break;
	
	case 3:
	selectedType = -1
	break;

	case 4:
	debtPaymentsInterface()
	selectedType = -1
	break;
	
	case 5:
	break;
	
	case 6:
	break;
	
	case 7:
	break;
	}


}

function menuStart(){
menu= 0
}


		
		
		
function drawArray(start_x,start_y,arrayToDraw){
  for (var i = 0; i < array_length(arrayToDraw); i++) {
         var xx = xm *i 
		 var yy = ym *i

        // Determine if the item is affordable or meets conditions
        if (arrayToDraw[i][7] > playerMoney || (arrayToDraw[i][9] == 1 && spdup == true)) {
            col = c_red;
            arrayToDraw[i][8] = 0; // Mark as unavailable
        } else {
            col = c_white;
            arrayToDraw[i][8] = 1; // Mark as available
        }

        // Draw item sprite with scaled size
        draw_sprite_stretched(arrayToDraw[i][2], arrayToDraw[i][3], xx, yy, slot_width, slot_height);

        if (!arrayToDraw[i][4] == 0) {
            draw_sprite_stretched_ext(arrayToDraw[i][2], arrayToDraw[i][4], xx, yy, slot_width, slot_height, arrayToDraw[i][5], 1);
        }

        // Draw item cost
        draw_text_color(xx, yy + slot_height + 8, string(arrayToDraw[i][7]), col, col, col, col, 1);

        // Mouse interaction
        if (point_in_rectangle(mouse_x, mouse_y, xx, yy, xx + slot_width, yy + slot_height)) {
            draw_rectangle_color(xx - 2, yy - 2, xx + slot_width, yy + slot_height, c_glossyWhite, c_glossyWhite, c_glossyWhite, c_glossyWhite, true);

            hovered_slot = i;
            selected_slot = i;

            if (mouse_check_button_released(mb_left) && arrayToDraw[i][8] == 1) {
                whatsHovered(); // Trigger item selection
            }
        }

        // Item description display when hovered
        if (hovered_slot >= 0 && hovered_slot < array_length(arrayToDraw)) {
            var desc_text = arrayToDraw[hovered_slot][11];
            var text_x = room_width * 0.05;
            var text_y = room_height * 0.85;
            var text_width = room_width * 0.9;

            draw_set_color(c_white);
            draw_text_ext(text_x, text_y, desc_text, -1, text_width);
            draw_set_color(c_white);
        }
    }
}