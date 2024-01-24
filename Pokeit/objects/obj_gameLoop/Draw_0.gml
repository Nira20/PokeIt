draw_sprite_stretched(spr_rmBg,1,0,0,room_width,room_height)

if inventoryOpen = true
{scr_displayInventory()}

if (instance_exists(obj_slime) && instance_exists(obj_cageBox))
{
var SW = obj_slime.sprite_width
var CW = obj_cageBox.sprite_width
if SW >= CW 
{draw_text(x,y,"GAME OVER")}} 

if (instance_exists(obj_slime) && instance_exists(obj_cageBox))
{
var SW = obj_slime.sprite_width
var CW = obj_cageBox.sprite_width
if SW >= CW 
{draw_text(x,y,"GAME OVER")}}
