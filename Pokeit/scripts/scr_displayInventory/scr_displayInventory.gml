// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_displayInventory(){

var currentItem = inventory[i];
for (var i = 0; i < array_length(inventory); i++) {
    draw_text(20,45*i,"Index " + string(i) + ": " + string(inventory[i]));
}
}