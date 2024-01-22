/// @description Insert description here
// You can write your code in this editor
draw_sprite_stretched(spr_rmBg,1,0,0,room_width,room_height)
draw_rectangle(0,0,100,50,c_blue)
draw_set_color(c_white) 
draw_text(0,0, "clicks: " + string(global.Counter))
draw_sprite(spr_arcanePlatform,1, room_height/3,room_width/3)
if inventoryOpen = true
{scr_displayInventory()}

//debugging

draw_text(20,20, "slimescore =" + string(global.slimescore))
 