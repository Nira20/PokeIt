
function debtIncrements(buttons, hslot) {
    var increments = [100, 10, 1, 0, -1, -10, -100];
    if (buttons[hslot] != "iPay") {
        iPay += increments[hslot];
        iPay = clamp(iPay, 0, playerMoney);
    }
}

function debtPaymentsInterface() {
	
    var spacing = 20;
    var buttons = ["<<<", "<<", "<", "iPay", ">", ">>", ">>>"];
    var button_width = ((room_width - 100) - ((array_length(buttons) + 1) * spacing)) / array_length(buttons);
    var button_height = 64;
    var start_x = 0+( (array_length(buttons) + 1) * spacing) / array_length(buttons)
    var start_y = yb - 300;

 yn(applyPayment, denyPayment);

    for (var i = 0; i < array_length(buttons); i++) {
        var button_x = start_x + i * (button_width + spacing);

        draw_rectangle_color(button_x, start_y, button_x + button_width, start_y + button_height, c_gray, c_gray, c_gray, c_gray, false);
        draw_text_color(button_x - 30 + (button_width / 2), start_y + button_height / 2, buttons[i] == "iPay" ? string(iPay) : buttons[i], c_black, c_black, c_black, c_black, 1);

        if (is_hovered(button_x, start_y, button_width, button_height)) {
            hslot = i;
            drawHighlight(button_x, start_y, button_width, button_height);

            if (mouse_check_button_pressed(mb_left)) {
                debtIncrements(buttons, hslot);
            }
        }
    }
}


function paymentManager() {
    global.paymentNum = global.totalPayments - global.paymentsMade;
    global.nextPayDue =  global.debt / global.paymentNum; 
    global.nextPayRemaining = global.nextPayDue - global.nextPayTotal;
}

function applyInterest() {
    global.debt *= global.intrest;
}

function increaseInterest() {
    global.intrest += 0.1;
}

function decreaseInterest() {
    global.intrest -= 0.1;
}

function applyPayment() {
	if (playerMoney >= iPay && iPay > 0) {
                 
                    spentMoney += iPay;
                    global.debt -= iPay;
					global.nextPayTotal += iPay;
                }

 iPay =0
}

function denyPayment() {
    iPay =0 
}