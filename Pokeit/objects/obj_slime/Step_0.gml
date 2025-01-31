/// @description Insert description here
// You can write your code in this editor
var sizeMultiplier =4+ global.Counter* .01;
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




switch (obj_slime.apprentice) {
    case 0:
        draw_sprite(spr_apprenticeSticks, 2, x, y); // Draw sprite 0
        break;
    
    case 1:
        draw_sprite(spr_apprenticeSticks, 3, x, y); // Draw sprite 1
        break;

    // Add more cases as needed

    default:
        draw_sprite(spr_apprenticeSticks, 1, x, y); // Default sprite if variable doesn't match any case
        break;
}