
if global.gState = "playing" || global.gState = "initialize"
{draw_sprite_stretched(spr_rmBg,1,0,0,room_width,room_height)
draw_set_font (fn_arialBig)
draw_sprite(spr_kkoin,0,64,64)

draw_text(116,48,string(playerMoney))
draw_text(xr - string_width(global.nextPayRemaining ) -150,48 , "Owed: " + string(global.nextPayRemaining))
}


gstateSwitch()
menuSwitch()
singleButton(xm,yb - 100,spr_back,menuStart)
