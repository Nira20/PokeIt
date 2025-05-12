function createStore(){
inventory_slots = 0
selectedType = -1
rowLength =1;
randomize()
selected_slot =-1
scroll_speed = 2; 
y_pos = room_height/3 
motiveCounter = 0
inventoryToDraw = noone
staY = room_height / 3 +100
slimeJars = [//color,	 size,	value
			// 0		1		2
]
inventoryConsumables= [
    // [name,          initial_quantity, sprite,         image_index, image_index_2, color,    base_price, current_price, buyable, isPowerUp, price_increase, text, 0 = consumable, 1 = upgrade]
   // [0,					1				2				3				4			5			6			7			8			9		10
    ["Restart",       0,                 spr_priceUp,    0,           0,             c_white,  2,          2,             true,    false,      0, "restart the game", 0 ],   // Low impact, slightly higher starting price
	["Fix Cage 10%",  0,                 spr_shieldGlif, 0,           1,            c_teal,  5,          5,             true,    false,      5, "restore 10% of your shields durability",0],   // Early-game affordability
    ["Fix Cage 30%",  0,                 spr_shieldGlif, 0,           1,             c_red,  8,          8,             true,    false,      10,"restore 30% of your shields durability",0],  // Scaled price for mid-game
    ["Fix Cage 50%",  0,                 spr_shieldGlif, 0,           1,             c_deepPurple,  16,         16,            true,    false,      15,"restore 50% of your shields durability",0],  // Mid-tier repair, balanced
    ["Fix Cage 80%",  0,                 spr_shieldGlif, 0,           1,             c_desertAmber,  32,         32,            true,    false,      20,"restore 80% of your shields durability",0],  // Significant repair, premium cost
	["Calm Slime",    0,				 spr_priceUp,    0,           0,           c_white ,  5,          5,             true,    true,       5, "Calm down slime for a time",0 ],   // Temporary effect, reasonable cost
    ["Overcharge",      0,                 spr_gem,		 0,           1,             c_white,  5,          5,             true,    true,       5, "Make your men work faster",0]   // Short boost, affordable for early use

];


inventoryUpgrades  = [
	["More Zaps",          0,                 spr_gem,		 0,           1,             c_softSaffron,  10,         10,            true,    false,      10, "Increase your Zapper Points",1],  // Scales well with `global.acamount`
	["Upgrade Zaps", 0,                 spr_gem,		0,           1,             c_desertAmber,  10,         10,            true,    false,      15, "Increase the irritability of your zaps",1],   // Long-term investment, adjusted to fairer scaling
    ["Upgrade Forcefield",  0,                 spr_shieldGlif, 0,           2,              c_maroon,  50,         50,            true,    false,      50, "increase forcefields durability",1],  // High-cost upgrade for lasting impact
    ["Market",        0,                 spr_priceUp,    0,           0,             c_white,  15,         15,            true,    false,      12, "improve market price" ,1],  // Boosts income, balanced cost
    ["Split",         0,                 spr_priceUp,    0,           0,             c_white,  30,         30,            true,    false,      30, "split your slime",1],  // High impact, higher cost
	["Improve Regen",         0,          spr_priceUp,    0,           0,             c_white,  30,         30,            true,    false,      30, "improve shield regeneration rate",1]
];

activeQuests = [//quest name, description, prize, script
//0,1,2,3,4
["noone"]
];

hovered_slot = 0
mouseX = mouse_y
mouseY = mouse_x
visable = false
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
function drawInventory1() {
    inventory_slots = array_length(inventoryToDraw);
    
    switch (selectedType) {
        case 1: // Upgrades
            inventoryToDraw = inventoryUpgrades;
            break;
            
        case 0: // Consumables
            inventoryToDraw = inventoryConsumables;
            break;

        case 2: // Quests
            inventoryToDraw = activeQuests;
            break;

        case 3: // Paying Debt
            payDebt();
			return;
            
          

        default:
            inventoryToDraw = []; // Handle unexpected cases
            break;
    }

    update_motivation();



    // Calculate inventory slot width and height as a percentage of room
    var slot_width = room_width * 0.12;  // Each item takes up 12% of room width
    var slot_height = room_height * 0.1; // Each item takes up 10% of room height

    var total_rows = (inventory_slots + 4) div 5; // Round up for every 5 items
    var inventory_height = max(100, total_rows * (slot_height + 16)); // Ensure height is not too small

    var start_x = room_width * 0.05;  // 5% margin from left
    var start_y = ym +  0.2; // Start at 20% of room height

    // Draw background panel
    draw_sprite_stretched(spr_button, 0, start_x, start_y - 50, room_width * 0.9, inventory_height +100);

    for (var i = 0; i < array_length(inventoryToDraw); i++) {
        var row = i div 5;  // 5 items per row
        var column = i mod 5; // Determine the column number

        // Calculate positions dynamically
        var xx = start_x + column * (slot_width + 40);
        var yy = start_y + row * (slot_height + 24);

        var col = c_white;

        // Determine if the item is affordable or meets conditions
        if (inventoryToDraw[i][7] > playerMoney || (inventoryToDraw[i][9] == 1 && spdup == true)) {
            col = c_red;
            inventoryToDraw[i][8] = 0; // Mark as unavailable
        } else {
            col = c_white;
            inventoryToDraw[i][8] = 1; // Mark as available
        }

        // Draw item sprite with scaled size
        draw_sprite_stretched(inventoryToDraw[i][2], inventoryToDraw[i][3], xx, yy, slot_width, slot_height);

        if (!inventoryToDraw[i][4] == 0) {
            draw_sprite_stretched_ext(inventoryToDraw[i][2], inventoryToDraw[i][4], xx, yy, slot_width, slot_height, inventoryToDraw[i][5], 1);
        }

        // Draw item cost
        draw_text_color(xx, yy + slot_height + 8, string(inventoryToDraw[i][7]), col, col, col, col, 1);

        // Mouse interaction
        if (point_in_rectangle(mouse_x, mouse_y, xx, yy, xx + slot_width, yy + slot_height)) {
            draw_rectangle_color(xx - 2, yy - 2, xx + slot_width, yy + slot_height, c_glossyWhite, c_glossyWhite, c_glossyWhite, c_glossyWhite, true);

            hovered_slot = i;
            selected_slot = i;

            if (mouse_check_button_released(mb_left) && inventoryToDraw[i][8] == 1) {
                whatsHovered(); // Trigger item selection
            }
        }

        // Item description display when hovered
        if (hovered_slot >= 0 && hovered_slot < array_length(inventoryToDraw)) {
            var desc_text = inventoryToDraw[hovered_slot][11];
            var text_x = room_width * 0.05;
            var text_y = room_height * 0.85;
            var text_width = room_width * 0.9;

            draw_set_color(c_white);
            draw_text_ext(text_x, text_y, desc_text, -1, text_width);
            draw_set_color(c_white);
        }
    }
}
function setToInvisable(){
visable = false
selectedType = -1}
function setToVisable(){
visable = true
}
 function regenerate(){
global.cage += global.regen 
tTimer = 0
  if (global.cage > global.maxPlatformHP) {
        global.cage = global.maxPlatformHP;
    }
}		
function purchasePlus() {
    // Add the current price to the total spent money
    spentMoney += inventoryToDraw[hovered_slot][7];

    // Increase the current price by the price increase
    inventoryToDraw[hovered_slot][7] += inventoryToDraw[hovered_slot][10]; // Current price + Price increase

    // Increase the item's quantity
    inventoryToDraw[hovered_slot][1] += 1;
}   
function whatsHovered() {
    switch (inventoryToDraw[hovered_slot][0]) { // Use the item name from the inventoryToDraw
        case "Restart":
		error()
            purchasePlus()
			
            break;

case "Improve Regen":
global.regen += 1 

 purchasePlus()
break; 

        case "Overcharge":
			motivate()
            purchasePlus()
			
            break;

        case "More Zaps":
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
			
		case "Upgrade Forcefield":
		global.maxPlatformHP +=50
		purchasePlus()
		
			break;
			
		 case "Fix Cage 10%":
			fixCage(10)
           purchasePlus()
		   
            break;
			
			case "Fix Cage 30%":
			fixCage(30)
          purchasePlus()
		  
            break;
			
			case "Fix Cage 50%":
			fixCage(50)
           purchasePlus()
		   
            break;
			
			case "Fix Cage 80%":
			fixCage(80)
           purchasePlus()
		   
            break;
			
		case "Calm Slime":
		pacify()
	purchasePlus()
	
		break;
		
		case "Upgrade Zaps":
       improveHirelings();
	 purchasePlus()
	   break;
	   
	   default:
            // Handle unknown item
            show_debug_message("Unknown item: " + inventoryToDraw[hovered_slot][0]);
            break;
    }
}
function pacify(){
    global.pacify = true; // Activate pacify
    global.pacifyCounter = room_speed * 10; // Set pacify duration (10 seconds)
}
function fixCage(amount) {

    var increment = global.maxPlatformHP * (amount / 100);
    global.cage += increment;

    if (global.cage > global.maxPlatformHP) {
        global.cage = global.maxPlatformHP;
    }
}
function money(){

var middle_x = room_width / 2;

instance_create_depth(irandom_range(middle_x - 64, middle_x + 64), obj_slime.y, obj_slime.depth - 10, obj_money);

}
function motivate(){
    spdup = true; // Set the speed-up flag
    global.acspeed *= 2; // Double the pokespeed of hirelings
    global.motivate_timer = room_speed * 30; // Set the timer for 30 seconds (room_speed determines frames per second)
}
function error(){
game_restart()
}
function improveHirelings(){
global.acamount ++
}
function update_motivation(){
    // Check if the motivation effect is active
    if (spdup) {
        global.motivate_timer -= 1; // Decrease the timer by 1 frame

        // If the timer reaches 0, reset the speed
        if (global.motivate_timer <= 0) {
            global.acspeed /= 2; // Reset the pokespeed to its original value
            spdup = false; // Clear the speed-up flag
            global.motivate_timer = 0; // Ensure the timer is reset
        }
    }
}
