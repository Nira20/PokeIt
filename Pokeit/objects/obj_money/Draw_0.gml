
draw_sprite(sprite_index, 0, x, y);
draw_sprite(spr_markings, 0, x, y);

if (y < -sprite_height) {
    // Delete the instance
    instance_destroy();
}



