// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_buttonCheck()
{
//check if the left mouse button is pressed 
var mouseX = mouse_x;
var mouseY = mouse_y;

	if (point_in_rectangle(mouseX, mouseY, x,y, x +sprite_width, y + sprite_height)) {
	//check if the mouse click is within the buttons area
	obj_store.button_pressed = true 
	}
}