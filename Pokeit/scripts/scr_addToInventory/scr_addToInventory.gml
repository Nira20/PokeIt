// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_addToInventory(itemName, itemInventory, itemDescription ){
// Arguments
var itemName = argument0;      // Name of the item
var itemInventory = argument1; // Number of items in inventory
var itemDescription = argument2; // Description of the item

// Create a new struct for item details
var newItem = itemDetails;
newItem.Item = itemName;
newItem.Inventory = itemInventory;
newItem.Description = itemDescription;

// Add the item details struct to the player's inventory array
playerInventory[array_length_1d(playerInventory)] = newItem;
