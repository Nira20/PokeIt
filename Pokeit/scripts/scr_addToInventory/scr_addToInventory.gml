// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_addToInventory(itemName, quantity){
    //check to see if the item exists in inventory
    var index = ds_list_find_index(global.playerInventory, itemName)
    if (index == -1)
    {
    //Item doesn't exist, add it to the inventory with quantity 
    ds_list_add(global.playerInventory, itemName);
    ds_list_add(global.playerInventory, quantity); 
    } else {
    //Item already exists, update its quantity
    currentQuantity = ds_list_find_index(global.playerInventory, index +1  ) + quantity;
    ds_list_replace(global.playerInventory, index +1 , currentQuantity);
    

    }

}