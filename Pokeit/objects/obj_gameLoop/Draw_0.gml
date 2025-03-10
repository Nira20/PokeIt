draw_sprite_stretched(spr_rmBg,1,0,0,room_width,room_height)
draw_set_font (fn_arialBig)


draw_text(20,20,"Current Cash: $" + string(playerMoney))
draw_text(20,20 + 45,"Total Earned: $" + string(totalMoney))
drawInventory()

//debugging

// Count the number of instances of obj_money
var count = instance_number(obj_money);

// Set the position where you want to display the count
var display_x = 20;
var display_y = 85;

// Draw the count on the screen
draw_text(display_x, display_y, "obj_money: " + string(count));
