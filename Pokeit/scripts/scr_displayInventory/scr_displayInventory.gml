// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_displayInventory(){
    var inventorySize = ds_list_size(global.playerInventory);
    var inventoryX = 100
    var inventoryY = 100
    var itemHeight = 20
    if(inventorySize > 0) {
        for(var i = 0; i < inventorySize; i += 2)
        {
            var itemName = ds_list_find_value(global.playerInventory, i) ;
            var currentQuantity = ds_list_find_value(global.playerInventory, i+1);
            draw_set_color(c_aqua)
            draw_text(inventoryX, inventoryY +1 * itemHeight, itemName + ":" + string(global.currentQuantity));
        }
    } else {
    draw_text(inventoryX, inventoryY, "Players inventory is empty");
    }

}
