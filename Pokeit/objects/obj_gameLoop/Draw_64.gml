/// @description Insert description here
// You can write your code in this editor

draw_rectangle(0,0,100,50,c_blue)
draw_set_color(c_white) 
draw_text(0,0, "clicks: " + string(global.Counter))
draw_sprite(spr_arcanePlatform,1, room_height/3,room_width/3)

//draw_sprite_stretched(spr_slimebase, 1, x, y, obj_gameLoop.newWidth, obj_gameLoop.newHeight);
if inventoryOpen = true
{scr_displayInventory()}