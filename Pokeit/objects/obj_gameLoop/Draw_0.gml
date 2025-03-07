draw_sprite_stretched(spr_rmBg,1,0,0,room_width,room_height)
draw_set_font (fn_arialBig)


draw_text(20,20,"Current Cash: $" + string(playerMoney))
draw_text(20,20 + 45,"Total Earned: $" + string(totalMoney))
drawInventory()
