
draw_sprite(sprite_index, 0, x, y);
draw_sprite_ext(spr_markings, marking, x, y,2,2,0,c_white,1);

if (y < -sprite_height) {
    // Delete the instance
    instance_destroy();
}



