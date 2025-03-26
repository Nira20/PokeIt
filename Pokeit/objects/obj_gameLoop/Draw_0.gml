
draw_sprite_stretched(spr_rmBg,1,0,0,room_width,room_height)
draw_set_font (fn_arialBig)
draw_sprite(spr_effect,0,64,64)

draw_sprite_ext(spr_koin,0,64,64,.6,.6,0,c_gold,1)
draw_text(116,44,string(playerMoney))


drawJars()
drawInventory()


draw_text(80,80, string(debugging))
