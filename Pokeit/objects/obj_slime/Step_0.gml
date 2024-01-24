/// @description Insert description here
// You can write your code in this editor

if ( mouse_check_button_pressed(mb_left))
{scr_buttonCheck(obj_slime)}

if (button_pressed = true) 
{
	global.Counter = global.Counter +1
	button_pressed = false

}


var sizeMultiplier = global.slimescore * .01;
//x = x+global.slimescore
image_xscale =sizeMultiplier
image_yscale =sizeMultiplier


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