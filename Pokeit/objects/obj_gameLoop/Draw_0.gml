draw_sprite_stretched(spr_rmBg,1,0,0,room_width,room_height)
draw_set_font (fn_arialBig)

if (instance_exists(obj_slime) && instance_exists(obj_cageBox))
{
var SW = obj_slime.sprite_width
var CW = obj_cageBox.sprite_width
if SW >= CW 
{draw_text(0,room_height/2,"GAME OVER")}} 

draw_text(20,y,"Current Cash: $" + string(playerMoney))
draw_text(20,y + 45,"Total Earned: $" + string(totalMoney))
drawClickers()