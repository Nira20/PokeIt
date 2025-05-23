
if global.gState = "playing" || global.gState = "initialize"
{background()
draw_set_font (fn_arialBig)
draw_sprite(spr_kkoin,0,64,64)

draw_text(116,48,string(playerMoney))
draw_text(xr - string_width(global.nextPayRemaining ) -150,48 , "Owed: " + string(global.nextPayRemaining))
menuSwitch()
}


gstateSwitch()

singleButton(xm,yb - 100,spr_back,menuStart)
singleButton(xm -100 ,yb - 100,spr_koin,game_restart)
