if is_hovered(xS,yS,sprite_get_width(sprS),sprite_get_height(sprS)) {

 if mouse_check_button_released(mb_left) {
 bp = true
 }
}

if bp = true {
sprSF ++
}

if sprSF >= sprSFS{
room_goto_next()

}