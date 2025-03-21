
draw_sprite_ext(sprite_index, 0, x, y,.5,.5,0,col,alph);
draw_sprite_ext(spr_markings, marking, x, y,2,2,0,c_white,alph);

if (y < -sprite_height) {
    // Delete the instance
    instance_destroy();
}





