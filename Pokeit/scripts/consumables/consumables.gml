function createConsumables(){
	selected_slot = -1
	global.inventoryConsumables= [
    // [name,          initial_quantity, description,   current price     ]
   // [0,					1				2				
   	["Fix Cage 10%", 0,  "restore 10% of your shields durability",10],   // Early-game affordability
    ["Fix Cage 30%",0,  "restore 30% of your shields durability",10],  // Scaled price for mid-game
    ["Fix Cage 50%",0, "restore 50% of your shields durability",10],  // Mid-tier repair, balanced
    ["Fix Cage 80%",0, "restore 80% of your shields durability",10],  // Significant repair, premium cost
	["Calm Slime",  0,  "Calm down slime for a time",10],   // Temporary effect, reasonable cost
    ["Overcharge",  0, "Make your men work faster",10]   // Short boost, affordable for early use

];

}
function drawInventory(item_array) {
	
    var button_height = sprite_get_height(spr_shopButton) +10;
    var button_width = string_width("Fix Cage 80% ");
    
    for (var i = 0; i < array_length(item_array); i++) {
        var start_x = tr_mid_x / 4; 
        var start_y = tr_mid_y * 2 + (i * button_height);
        
        var canBuy = playerMoney >= item_array[i][3];
        draw_set_color(canBuy ? c_white : c_red);
        
        draw_text(start_x, start_y, string(item_array[i][0]));
		draw_sprite(spr_shopButton,0,start_x + button_width + string_width("x"), start_y)
        draw_text(start_x + button_width  + (sprite_get_width(spr_shopButton)/2) - ( string_width( "$" + string(item_array[i][3]))/2), start_y, "$" + string(item_array[i][3]));
        
        if (is_hovered(start_x, start_y, button_width, button_height)) {
            drawHighlight(start_x, start_y, button_width, button_height);
	
			
		if (selected_slot >= 0 && selected_slot < array_length(item_array)) {
                    var desc_text = item_array[selected_slot][2];
                    draw_set_color(c_white);
                    draw_text_ext(tr_mid_x/6, yb - 100, desc_text, -1,tr_mid_x *2);
                }
            if (mouse_check_button_released(mb_left) && canBuy) {
                selected_slot = i;
				payment(item_array[selected_slot][3])
                whatsHovered(item_array, selected_slot);

              
            }
			  
        }
        draw_set_color(c_white);
    }
}

function doublePrice(item_array, selected_slot) {
    if (selected_slot >= 0 && selected_slot < array_length(item_array)) {
        item_array[selected_slot][3] *=2;
		
    }
}

function expPrice(item_array, selected_slot) {
    if (selected_slot >= 0 && selected_slot < array_length(item_array)) {
       
        item_array[selected_slot][3] *=4;
    
}}
function payment(iPay){
 spentMoney += iPay;
}


function whatsHovered(item_array, selected_slot ) {
    switch (item_array[selected_slot][0]) { // Use the item name from the inventoryToDraw
     

case "Improve Regen":
global.regen *= 1.02

 expPrice(item_array, selected_slot)
break; 

        case "Overcharge":
			motivate()
             doublePrice(item_array, selected_slot)
			
            break;

        case "More Zaps":
            global.acq +=1
			expPrice(item_array, selected_slot)
			
           
            break;

            
		case "Upgrade Forcefield":
		global.maxPlatformHP *=1.10
		 doublePrice(item_array, selected_slot)
		
			break;
			
		 case "Fix Cage 10%":
			fixCage(10)
           expPrice(item_array, selected_slot)
		   
            break;
			
			case "Fix Cage 30%":
			fixCage(30)
          doublePrice(item_array, selected_slot)
		  
            break;
			
			case "Fix Cage 50%":
			fixCage(50)
              doublePrice(item_array, selected_slot)
		   
            break;
			
			case "Fix Cage 80%":
			fixCage(80)
       doublePrice(item_array, selected_slot)
		   
            break;
			
		case "Calm Slime":
		pacify()
	   doublePrice(item_array, selected_slot)
	
		break;
		
		case "Upgrade Zaps":
       improveHirelings();
	   doublePrice(item_array, selected_slot)
	   break;
	   
	  
    }
}