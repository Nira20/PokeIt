// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_buyItem(itemName, itemPrice) {
    if (playerMoney >= itemPrice) {
        // Deduct money
        playerMoney -= itemPrice;
        
        // Add item to inventory
        array_push(playerInventory, itemName);
        
        show_debug_message("Item bought: " + itemName);
    } else {
        show_debug_message("Not enough money to buy " + itemName);
    }
}
