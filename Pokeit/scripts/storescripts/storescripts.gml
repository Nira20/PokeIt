function createStore(){
inventory_slots = 0
rowLength =1;
randomize()
scroll_speed = 2; 
y_pos = room_height/3 
slimeJars = [//color, size, value


]
inventory = [
//[name, intitial quanity, sprite, image_index, base price, current price, effect]
    ["Restart", 0 , spr_priceUp,0,0,0,1],
    ["Motivate", 0, spr_priceUp,1,1,1,0],
    ["Hire", 1, spr_priceUp,2,2,2,1],
	["Market", 1 , spr_priceUp,3,3,3,1],
    ["Split", 1, spr_priceUp,4,4,4,1],
	["Bigger Cage", 1, spr_priceUp, 5, 1,1,1],
	["Fix Cage", 0, spr_priceUp, 5, 1,1,1],
	["Pacify", 0, spr_priceUp, 1, 1,1,1]
  ];

hovered_slot = 0
mouseX = mouse_y
mouseY = mouse_x

button_pressed = false
is_hovered = false

sx = room_width/2
sy = room_height/3

image_xscale = 1
image_yscale = 1

spr = spr_button
xx =0
yy=0
}

function drawInventory() {
    inventory_slots = array_length(inventory);

    // Check if inventory is less than or equal to 0
    if (inventory_slots <= 0) {
        // Draw spr_priceup with sprite index 0
        draw_sprite(spr_priceUp, 0, room_width / 2, room_height / 2);
        return; // Exit the function early
    }

    draw_sprite_stretched(spr_button, 0, 50, room_height / 3 , room_width -100, 12 + (((inventory_slots - 1) div rowLength) + 1) * (32 +16));

    for (var i = 0; i < array_length(inventory); i++) {
        xx = 60 + (i mod rowLength) * 36 + 2;
        yy = room_height / 3 + (i div rowLength) * (32 +16) + 2;
		var col =c_white
		if inventory[i][5] > playerMoney {
		col = c_red}
		else 
		{col= c_white}
        draw_sprite_ext(inventory[i][2], inventory[i][3], xx, yy, .5, .5, 0, c_white, 1);
        draw_text_color(xx + 64, yy, string(inventory[i][0]) + " - " + string(inventory[i][5])+ " - " + string(inventory[i][6]),col,col,col,col,1);

			
               
       	// Check if the mouse is hovering over the inventory slot or text
        if (mouse_x >= xx && mouse_x <= xx + 64 + room_width / 2 -50 && mouse_y >= yy && mouse_y <= yy + 36) {
            // Draw a grey rectangle around the slot and text
            draw_set_color(c_gray);
            draw_sprite_stretched(spr_surround, 0, 50 , yy -2 , room_width -100, 46);
            draw_set_color(c_white); // Reset color to white for other drawings

            // Update the hovered slot
            hovered_slot = i
	
			

            // Check if the left mouse button is released and the item can be afforded
			if (mouse_check_button_released(mb_left) && col == c_white) {
                whatsHovered();
				
			
    }
            }}
        }

function purchase(){
				spentMoney = spentMoney+ inventory[hovered_slot][5]
				inventory[hovered_slot][5] = inventory[hovered_slot][5] *2
				inventory[hovered_slot][6] += 1
           }
	
function whatsHovered() {
    switch (inventory[hovered_slot][0]) { // Use the item name from the inventory
        case "Restart":
		error()
            purchase()
            break;

        case "Motivate":
			motivate()
            purchase()
            break;

        case "Hire":
            global.acq +=1
			purchase()
           
            break;

        case "Market":
		 global.acamount += global.acamount
           purchase()
            break;

        case "Split":
				split()
          purchase()
            break;
			
		case "Bigger Cage":
		global.pXScale ++
		purchase()
			break;
			
		 case "Fix Cage":
			fixCage()
            purchase()
            break;
			
		case "Pacify":
		pacify()
		purchase();
		break;
       
	   default:
            // Handle unknown item
            show_debug_message("Unknown item: " + inventory[hovered_slot][0]);
            break;
    }
}
		function pacify(){
	global.angerCounter = round(global.angerCounter/2)
	}
	
	function fixCage(){
	global.cage += 50
	}
function money(){
/// Calculate the middle of the room
// Calculate the middle of the room
var middle_x = room_width / 2;

// Create the instance within 64 pixels of the middle of the room
instance_create_depth(irandom_range(middle_x - 64, middle_x + 64), obj_slime.y, obj_slime.depth - 10, obj_money);

}

function motivate(){
var motiveCounter =0
var originalACSpeed = global.acspeed

if motiveCounter <= room_speed *60
{
global.acspeed = global.acspeed *1.5
motiveCounter ++
}else {
motiveCounter =0
global.acspeed = originalACSpeed
}

}	

function error(){
game_restart()
}