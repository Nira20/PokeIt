function sMouseCheck(){
	
	if (mouse_check_button_released(mb_left)) {
    // Check if the mouse click is within the boundaries of the sprite
    if (point_in_rectangle(mouse_x, mouse_y,bbox_left,bbox_top,bbox_right, bbox_bottom)) {
        // Increase global counter by 1
        global.Counter += global.acamount 
		anger()
		money()
        
       
    }
}
	}