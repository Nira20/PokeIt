function payDebt() {
    var button_labels = ["Max", "Min", "100", "Other"];
    var button_width = 120, button_height = 50;
    var spacing = 20;
    var start_x = (room_width - button_width) / 2;
    var start_y = room_height - 400;

    for (var i = 0; i < array_length(button_labels); i++) {
        var button_y = start_y + i * (button_height + spacing);

        if (is_hovered(start_x, button_y, button_width, button_height)) {
            drawHighlight(start_x, button_y, button_width, button_height);

            if (mouse_check_button_pressed(mb_left)) {
                var pay = 0;

                switch (button_labels[i]) {
                    case "Max": pay = playerMoney; break;
                    case "Min": pay = 10; break;
                    case "100": pay = 100; break;
                    case "Other": othr = true; visable = false; break;
                }

                if (playerMoney >= pay && pay > 0) {
                    playerMoney -= pay;
                    spentMoney += pay;
                    global.debt -= pay;
                } else if (pay > 0) {
                    show_message("Not enough money to pay!");
                }
            }
        }

        draw_sprite_stretched(spr_button, 0, start_x, button_y, button_width, button_height);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_text(start_x + button_width / 2, button_y + button_height / 2, button_labels[i]);
    }
}

function debtIncrements(buttons, hslot) {
    var increments = [100, 10, 1, 0, -1, -10, -100];
    if (buttons[hslot] != "iPay") {
        iPay += increments[hslot];
        iPay = clamp(iPay, 0, playerMoney);
    }
}

function draw_interface() {
    var spacing = 20;
    var buttons = ["<<<", "<<", "<", "iPay", ">", ">>", ">>>"];
    var button_width = (room_width - ((array_length(buttons) + 1) * spacing)) / array_length(buttons);
    var button_height = 64;
    var start_x = 30;
    var start_y = yb - 300;

 yn(applyPayment, denyPayment, "Accept", "Decline");

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

function createTables() {
    global.paymentNum = global.totalPayments - global.paymentsMade;
    global.nextPayDue = global.debt / global.paymentNum;
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
                    playerMoney -= iPay;
                    spentMoney += iPay;
                    global.debt -= iPay;
					global.nextPayTotal += iPay;
                }

 iPay =0
}

function denyPayment() {
    iPay =0 
	othr = false
	visable = false
}