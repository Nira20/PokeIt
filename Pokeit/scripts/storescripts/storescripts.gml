function createStore(){
inventory_slots = 0
rowLength =1;
randomize()
selected_slot =-1
scroll_speed = 2; 
y_pos = room_height/3 
motiveCounter = 0
slimeJars = [//color,	 size,	value
			// 0		1		2


]
inventory = [
    // [name,         initial quantity, sprite,       image_index, base price, current price, buyable, isPowerUp, price increase]
    // [0,            1,                2,            3,           4,          5,             6,      7,         8]
    ["Restart",      0,                spr_priceUp,  0,           2,          2,             1,      0,         0],   // Low impact, slightly higher starting price
    ["Motivate",     0,                spr_priceUp,  1,           5,          5,             1,      1,         5],   // Short boost, affordable for early use
    ["Hire",         0,                spr_priceUp,  2,           10,         10,            1,      0,         10],  // Scales well with `global.acamount`
    ["Market",       0,                spr_priceUp,  3,           15,         15,            1,      0,         12],  // Boosts income, balanced cost
    ["Split",        0,                spr_priceUp,  4,           30,         30,            1,      0,         30],  // High impact, higher cost
    ["Fix Cage 10%", 0,                spr_priceUp,  5,           5,          5,             1,      0,         5],   // Early-game affordability
    ["Fix Cage 30%", 0,                spr_priceUp,  5,           8,          8,             1,      0,         10],  // Scaled price for mid-game
    ["Fix Cage 50%", 0,                spr_priceUp,  5,           16,         16,            1,      0,         15],  // Mid-tier repair, balanced
    ["Fix Cage 80%", 0,                spr_priceUp,  5,           32,         32,            1,      0,         20],  // Significant repair, premium cost
    ["Upgrade Cage", 0,                spr_priceUp,  1,           50,         50,            1,      0,         50],  // High-cost upgrade for lasting impact
    ["Pacify",       0,                spr_priceUp,  1,           5,          5,             1,      1,         5],   // Temporary effect, reasonable cost
    ["Upgrade Hires",0,                spr_priceUp,  1,           10,         10,            1,      0,         15]   // Long-term investment, adjusted to fairer scaling
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

    // Check if inventory is less than or equal to 0
    if (inventory_slots <= 0) {
        // Draw spr_priceup with sprite index 0
        draw_sprite(spr_priceUp, 0, room_width / 2, room_height / 2);
        return; // Exit the function early
    }
	update_motivation()
    draw_sprite_stretched(spr_button, 0, 50, room_height / 3 , room_width -100, 12 + (((inventory_slots - 1) div rowLength) + 1) * (32 +16));
  // [name,initial quantity, sprite,image_index, base price, current price, buyable, isPowerUp, price increase]
    for (var i = 0; i < array_length(inventory); i++) {
        xx = 60 + (i mod rowLength) * 36 + 2;
        yy = room_height / 3 + (i div rowLength) * (32 +16) + 2;
		var col =c_white
		if inventory[i][5] > playerMoney || inventory[i][7] = 1 && spdup = true  {
		col = c_red
		inventory[i][6] = 0}
		else 
		{col= c_white
			inventory[i][6] = 1}
		
		
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
			selected_slot = i
	
			

            // Check if the left mouse button is released and the item can be afforded
			if (mouse_check_button_released(mb_left) && inventory[i][6] = 1) {
                whatsHovered();
				
			
    }
            }}
        } 
function purchasePlus() {
    // Add the current price to the total spent money
    spentMoney += inventory[hovered_slot][5];

    // Increase the current price by the price increase
    inventory[hovered_slot][5] += inventory[hovered_slot][8]; // Current price + Price increase

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