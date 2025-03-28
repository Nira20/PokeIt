function createStore(){
inventory_slots = 0
rowLength =1;
randomize()
global.maxPlatformHP = 100
scroll_speed = 2; 
y_pos = room_height/3 
motiveCounter = 0
slimeJars = [//color,	 size,	value
			// 0		1		2


]
inventory = [
    // [name,         initial quantity, sprite,       image_index, base price, current price, effect, isPowerUp]
    // [0,            1,                2,            3,           4,          5,             6,      7]
    ["Restart",      0,                spr_priceUp,  0,           0,          0,             1,      0],
    ["Motivate",     0,                spr_priceUp,  1,           1,          1,             0,      1],
    ["Hire",         0,                spr_priceUp,  2,           2,          2,             1,      0],
    ["Market",       0,                spr_priceUp,  3,           3,          1,             1,      0],
    ["Split",        0,                spr_priceUp,  4,           4,          4,             1,      0],
    ["Fix Cage 10%", 0,                spr_priceUp,  5,           1,          1,             1,      0],
	["Fix Cage 30%", 0,                spr_priceUp,  5,           3,          1,             1,      0],
	["Fix Cage 50%", 0,                spr_priceUp,  5,           5,          1,             1,      0],
	["Fix Cage 80%", 0,                spr_priceUp,  5,           8,          1,             1,      0],
    ["Upgrade Cage", 0,                spr_priceUp,  1,           1,          1,             1,      0],
    ["Pacify",       0,                spr_priceUp,  1,           1,          1,             1,      1],
    ["Upgrade Hires",0,                spr_priceUp,  1,           1,          1,             1,      0]
];

hovered_slot = 0
mouseX = mouse_y
mouseY = mouse_x

button_pressed = false
is_hovered = false
spdup = false
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
if spdup = true {
{motiveCounter ++
	global.acspeed = global.oacspeed /2
}
if motiveCounter >= 100
	{motiveCounter = 0
		spdup = false
		global.acspeed = global.oacspeed
	}
}
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
		if inventory[i][5] > playerMoney || inventory[i][7] = 1 && spdup = true  {
		col = c_red}
		else 
		{col= c_white}
		
		
        draw_sprite_ext(inventory[i][2], inventory[i][3], xx, yy, .5, .5, 0, c_white, 1);
        draw_text_color(xx + 64, yy, string(inventory[i][0]) + " - " + string(inventory[i][5])+ " - " + string(inventory[i][1]),col,col,col,col,1);

			
               
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

function purchasePlus(){
				spentMoney = spentMoney+ inventory[hovered_slot][5]
				inventory[hovered_slot][5] = inventory[hovered_slot][4] + inventory[hovered_slot][1]
				inventory[hovered_slot][1] += 1
           }
		   
function purchaseMult(){
				spentMoney = spentMoney+ inventory[hovered_slot][5]
				inventory[hovered_slot][5] = inventory[hovered_slot][4] * inventory[hovered_slot][1]
				inventory[hovered_slot][1] += 1
           }
		   
function purchaseExp(){
				spentMoney = spentMoney+ inventory[hovered_slot][5]
				inventory[hovered_slot][5] = power(inventory[hovered_slot][4], inventory[hovered_slot][1])
				inventory[hovered_slot][1] += 1
           }
		   
		   
function whatsHovered() {
    switch (inventory[hovered_slot][0]) { // Use the item name from the inventory
        case "Restart":
		error()
            purchasePlus()
            break;

        case "Motivate":
			motivate()
            purchaseMult()
            break;

        case "Hire":
            global.acq +=1
			purchasePlus()
           
            break;

        case "Market":
		 global.acamount += global.acamount
           purchasePlus()
            break;

        case "Split":
				split()
          purchasePlus()
            break;
			
		case "Upgrade Cage":
		global.maxPlatformHP +=50
		purchaseMult()
			break;
			
		 case "Fix Cage 10%":
			fixCage(10)
            purchaseMult()
            break;
			
			case "Fix Cage 30%":
			fixCage(30)
            purchaseMult()
            break;
			
			case "Fix Cage 50%":
			fixCage(50)
            purchaseMult()
            break;
			
			case "Fix Cage 80%":
			fixCage(80)
            purchaseMult()
            break;
			
		case "Pacify":
		pacify()
		purchaseMult();
		break;
		
		case "Upgrade Hires":
       improveHirelings();
	   purchaseMult();
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
	
	
/*function fixCage(amount){
	var p = global.cage/global.maxPlatformHP *100
	if p <= ( 100 - amount )
	{global.cage += global.maxPlatformHP/amount}
	else{ global.cage = global.maxPlatformHP
	}}*/
	
	function fixCage(amount) {
    // Calculate the new cage value based on the percentage increase
    var increment = global.maxPlatformHP * (amount / 100);
    global.cage += increment;
    
    // If the updated cage value exceeds maxPlatformHP, cap it
    if (global.cage > global.maxPlatformHP) {
        global.cage = global.maxPlatformHP;
    }
}

function money(){
/// Calculate the middle of the room
// Calculate the middle of the room
var middle_x = room_width / 2;

// Create the instance within 64 pixels of the middle of the room
instance_create_depth(irandom_range(middle_x - 64, middle_x + 64), obj_slime.y, obj_slime.depth - 10, obj_money);

}
function motivate(){

spdup = true

}	
function error(){
game_restart()
}
function improveHirelings(){
global.acamount ++
}