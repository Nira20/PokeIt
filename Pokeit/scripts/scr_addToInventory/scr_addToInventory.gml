// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_addToInventory(itemName, itemQuantity) {
    var newItem = item_struct;
    newItem.name = itemName;
    newItem.quantity = itemQuantity;

var itemIndex = array_find_index(inventory, newItem, 0);
    
    if (itemIndex == -1) {
        // Add the item to the inventory
        array_push(inventory, newItem);
    } else {
        // Update the quantity if the item already exists
        var existingItem = inventory[itemIndex];
        existingItem.quantity += itemQuantity;
    }
}
