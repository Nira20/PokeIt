function createStore(){
inventory_slots = 0
rowLength =1;
randomize()
selected_slot =-1
scroll_speed = 2; 
y_pos = room_height/3 
motiveCounter = 0
 count_0 = 0;
 count_1 = 0;
slimeJars = [//color,	 size,	value
			// 0		1		2
]
inventory = [
    // [name,          initial_quantity, sprite,         image_index, image_index_2, color,    base_price, current_price, buyable, isPowerUp, price_increase, text, 0 = consumable, 1 = upgrade]
   // [0,					1				2				3				4			5			6			7			8			9		10
   ["Restart",       0,                 spr_priceUp,    0,           0,             c_white,  2,          2,             true,    false,      0, "restart the game", 0 ],   // Low impact, slightly higher starting price
    
    ["Market",        0,                 spr_priceUp,    0,           0,             c_white,  15,         15,            true,    false,      12, "improve market price" ,1],  // Boosts income, balanced cost
    ["Split",         0,                 spr_priceUp,    0,           0,             c_white,  30,         30,            true,    false,      30, "split your slime",1],  // High impact, higher cost
    ["Fix Cage 10%",  0,                 spr_shieldGlif, 0,           1,            c_teal,  5,          5,             true,    false,      5, "restore 10% of your shields durability",0],   // Early-game affordability
    ["Fix Cage 30%",  0,                 spr_shieldGlif, 0,           1,             c_red,  8,          8,             true,    false,      10,"restore 30% of your shields durability",0],  // Scaled price for mid-game
    ["Fix Cage 50%",  0,                 spr_shieldGlif, 0,           1,             c_deepPurple,  16,         16,            true,    false,      15,"restore 50% of your shields durability",0],  // Mid-tier repair, balanced
    ["Fix Cage 80%",  0,                 spr_shieldGlif, 0,           1,             c_desertAmber,  32,         32,            true,    false,      20,"restore 80% of your shields durability",0],  // Significant repair, premium cost
    ["Upgrade Cage",  0,                 spr_shieldGlif, 0,           2,              c_maroon,  50,         50,            true,    false,      50, "increase shields durability",1],  // High-cost upgrade for lasting impact
    ["Calm Slime",    0,				 spr_priceUp,    0,           0,           c_white ,  5,          5,             true,    true,       5, "Calm down slime for a time",0 ],   // Temporary effect, reasonable cost
    ["Motivate",      0,                 spr_gem,		 0,           1,             c_white,  5,          5,             true,    true,       5, "Make your men work faster",0],   // Short boost, affordable for early use
	["Hire",          0,                 spr_gem,		 0,           1,             c_softSaffron,  10,         10,            true,    false,      10, "Hire another person",1],  // Scales well with `global.acamount`
	["Upgrade Hires", 0,                 spr_gem,		0,           1,             c_desertAmber,  10,         10,            true,    false,      15, "Give your men better pokers",1]   // Long-term investment, adjusted to fairer scaling
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
function drawInventory() {
   inventory_slots = array_length(inventory);

for (var i = 0; i < array_length(inventory); i++) {
    var status = inventory[i][12]; // Assuming column 12 is intended

    if (status == 0) {
        count_0 += 1;
    } else if (status == 1) {
        count_1 += 1;
    } else if (status == 2) {
        count_2 += 1;
    }
}

update_motivation();

// Calculate the new height for the background stretch based on the number of rows
var total_rows = (inventory_slots + 4) div 5; // Calculate rows (rounding up every 5 items)
var new_height = total_rows * 100; // Adjust height based on row spacing

// Draw the background stretch for inventory slots
draw_sprite_stretched(spr_button, 0, 50, room_height / 3, room_width - 100, new_height);
  // Loop through inventory items
for (var i = 0; i < array_length(inventory); i++) {
    // Calculate row and column based on index
    var row = i div 6; // Determine the row number
    var column = i mod 6; // Determine the column number

    // Calculate horizontal and vertical positions for each sprite
    xx = 60 + column * 90; // Horizontal spacing for sprites
    yy = (room_height / 3) + (row * (64 + 72 + 16)); // Vertical spacing for rows, accounting for sprite and text

    var col = c_white;

    // Determine color and availability logic for inventory item
    if (inventory[i][7] > playerMoney || (inventory[i][9] == 1 && spdup == true)) {
        col = c_red; // Not affordable or conditions not met
        inventory[i][8] = 0; // Mark as unavailable
    } else {
        col = c_white; // Affordable and conditions met
        inventory[i][8] = 1; // Mark as available
    }

    // Draw the sprite
    draw_sprite_stretched(inventory[i][2], inventory[i][3], xx, yy, 64, 64);
    if (!inventory[i][4] == 0) {
        draw_sprite_stretched_ext(inventory[i][2], inventory[i][4], xx, yy, 64, 64, inventory[i][5], 1);
    }

    // Draw text directly beneath the sprite
    draw_text_color(
        xx, yy + 64 + 8, // Leave space for the sprite and position text below
        string(inventory[i][7]), col, col, col, col, 1
    );

    // Check if the mouse is hovering over the inventory slot or text
    if (mouse_x >= xx && mouse_x <= xx + 64 && mouse_y >= yy && mouse_y <= yy + 64 + 16) {
        // Draw a grey rectangle around the hovered inventory slot
        draw_set_color(c_gray);
        draw_rectangle(xx - 2, yy - 2, xx +64, yy + 64, true);
        draw_set_color(c_white); // Reset color to white for other drawings

        // Update hovered and selected slots
        hovered_slot = i;
        selected_slot = i;

        // Check if the left mouse button is released and the item can be afforded
        if (mouse_check_button_released(mb_left) && inventory[i][8] == 1) {
            whatsHovered(); // Trigger logic for hovered item
        }
		if (hovered_slot >= 0 && hovered_slot < array_length(inventory)) {
    // Define the description text
    var desc_text = inventory[hovered_slot][11];

    // Define the position and dimensions for the text box
    var text_x = 50; // Starting x position
    var text_y = room_height - 100; // Near the bottom of the screen
    var text_width = room_width - 100; // Width of the word wrap area

    // Set the color for the text
    draw_set_color(c_white);

    // Draw the text with word wrapping
    draw_text_ext(text_x, text_y, desc_text, -1, text_width);

    // Reset color to default (white)
    draw_set_color(c_white);
}
    }
}
   
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
    spentMoney += inventory[hovered_slot][7];

    // Increase the current price by the price increase
    inventory[hovered_slot][7] += inventory[hovered_slot][10]; // Current price + Price increase

    // Increase the item's quantity
    inventory[hovered_slot][1] += 1;
}   
function whatsHovered() {
    switch (inventory[hovered_slot][0]) { // Use the item name from the inventory
        case "Restart":
		error()
            purchasePlus()
            break;

        case "Motivate":
			motivate()
            purchasePlus()
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
			
		case "Pacify":
		pacify()
	purchasePlus()
		break;
		
		case "Upgrade Hires":
       improveHirelings();
	 purchasePlus()
	   break;
	   
	   default:
            // Handle unknown item
            show_debug_message("Unknown item: " + inventory[hovered_slot][0]);
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
	
function menuButtons() {    
    var spw = xr; // Keep the button width the same
    var sph = sprite_get_height(spr_button1); // Use the sprite's original height
    var y_position = yb - (sph * 6 * 4) - (24 * 3); // Adjust overall position to fit all buttons
    
    for (var ii = 0; ii < 4; ii++) {
        var x_position = xr / 2 - spw / 2; // Center the buttons horizontally
        var current_y = y_position + ii * (sph * 6 + 24); // Stack vertically with 24px spacing

        // Draw the sprite stretched with the assigned color
        draw_sprite_stretched_ext(spr_button1, 0, x_position, current_y, spw, sph * 6, global.colors[ii], 1);
    }
}
