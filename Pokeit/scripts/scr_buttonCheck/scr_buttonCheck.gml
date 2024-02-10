
function scr_buttonCheck(object,image_xscale,image_yscale)
{
//check if the left mouse button is pressed 

//debugging
draw_rectangle(x,y, x + image_xscale, y + image_yscale, c_grey)
var mouseX = mouse_x;
var mouseY = mouse_y;

	if (point_in_rectangle(mouseX, mouseY, x,y, x + image_xscale, y + image_yscale)) {
	//check if the mouse click is within the buttons area
	object.button_pressed = true 
	}
}