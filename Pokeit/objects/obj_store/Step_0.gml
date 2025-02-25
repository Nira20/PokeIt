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
	
	
 if (point_in_rectangle(mouse_x, mouse_y, x+ 60,
y+120,
room_width/2,
room_height/3)) {
 
is_hovered = true
        
        
       
    }
	else { 
		is_hovered = false}
		
		if (is_hovered) {
 scr_zoom(1.4);
} else {scr_zoomReset()}
	