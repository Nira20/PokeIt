if global.gState = "playing" || global.gState = "initialize"
{draw_sprite_stretched(spr_rmBg,1,0,0,room_width,room_height)
draw_set_font (fn_arialBig)
draw_sprite(spr_kkoin,0,64,64)

draw_text(116,48,string(playerMoney))
draw_text(xr - string_width(global.debt) -100,48 , "owed: " + string(global.debt))



if visable = true {drawInventory()
if othr = true {draw_interface()
	}

// Check for Click
if (mouse_check_button_pressed(mb_left)) {
    if (mouse_x > x && mouse_x < x + 100 && mouse_y > y && mouse_y < y + 40) {
        visable = false; // Set the variable to false
    }
}}
if visable = false {menuButtons()}

}
/// Function to wrap text into separate lines


// Inside Draw Event
// Inside Draw Event
if (global.gState == "gameOverS") {
    gameOVerSlime()
}