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
	drawInventory(global.inventoryConsumables)
	selectedType = -1
	
	break;
	
	
	case 2:
	
	drawInventory(global.inventoryUpgrades)
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


		
		
		
