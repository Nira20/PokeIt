/// @description Insert description here
// You can write your code in this editor
if ( mouse_check_button_pressed(mb_left))
{scr_buttonCheck(obj_store,image_xscale,image_yscale)}

if (button_pressed = true) && !instance_exists(obj_storeGui)
{ 
	instance_create_layer(x,y,layer,obj_storeGui) 
	button_pressed = false

} 
if(button_pressed = true) && instance_exists(obj_storeGui) {instance_destroy(obj_storeGui)
	button_pressed = false}
if (instance_exists(obj_storeGui))
{ visible= false
	
	} else {visible = true} 
	
	