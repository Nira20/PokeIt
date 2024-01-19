/// @description Insert description here
// You can write your code in this editor

draw_rectangle(0,0,100,50,c_blue)
draw_set_color(c_white) 
draw_text(0,0, "clicks: " + string(global.Counter))

if inventoryOpen = true
{scr_displayInventory()}