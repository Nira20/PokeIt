// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_addToInventory(id, name, quantity) {
    // Create a new item using the item structure
    var newItem = instance_create_layer(0, 0, obj_item);
    newItem.item_data = item_struct;
    
    // Set item properties
    newItem.item_data.id = id;
    newItem.item_data.name = name;
    newItem.item_data.quantity = quantity;
    
    // Add the item to the inventory array
    array_push(inventory, newItem);
}
