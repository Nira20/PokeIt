/// @description Insert description here
// You can write your code in this editor
sizeMultiplier = 4 +global.Counter *.01
//x = x+global.slimescore
image_xscale =sizeMultiplier
image_yscale =sizeMultiplier
// Step Event of the object containing the sprite
if (mouse_check_button_released(mb_left)) {
    // Check if the mouse click is within the boundaries of the sprite
    if (point_in_rectangle(mouse_x, mouse_y,bbox_left,bbox_top,bbox_right, bbox_bottom)) {
        // Increase global counter by 1
        global.Counter += 10;
        
       
    }
}
