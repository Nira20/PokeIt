/// @description Insert description here
// You can write your code in this editor
draw_self()
draw_rectangle(bbox_left,bbox_top,bbox_right, bbox_bottom,1)

switch (obj_slime.apprentice) {
    case 0:
        draw_sprite(spr_apprenticeSticks, 1, x, y); // Draw sprite 0
        break;
    
    case 1:
        draw_sprite(spr_apprenticeSticks, 0, x, y); // Draw sprite 1
        break;

    // Add more cases as needed

    default:
        draw_sprite(spr_apprenticeSticks, 2, x, y); // Default sprite if variable doesn't match any case
        break;
}

 draw_text(x,y,string(global.Counter))




