// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_removeFromInventory(itemName, quantity){
// Argument
var itemName = argument0; // Name of the item to remove

// Loop through the inventory to find the item
for (var i = 0; i < array_length_1d(playerInventory); i++) {
    if (playerInventory[i].Item == itemName) {
        // Remove the item from the inventory
        array_delete(playerInventory, i);
        break;
    }
}