
draw_sprite_stretched(spr_rmBg,1,0,0,room_width,room_height)
draw_set_font (fn_arialBig)
draw_sprite(spr_kkoin,0,64,64)
draw_sprite(spr_kkoin,0,64,64)
draw_text(116,44,string(playerMoney))


drawJars()
if visable = true {drawInventory()}
if visable = false {menuButtons()}




