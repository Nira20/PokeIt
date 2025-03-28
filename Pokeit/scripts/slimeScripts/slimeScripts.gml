function slimeCreate(){
spriteWidth = sprite_width
spriteHeight= sprite_height
button_pressed = false
sizeMultiplier =0

acolor = c_white
image_speed = .25
depth = -1
autoClickerSetup()
platformCreate()
createAnger()

}
function createAnger(){
angerMax =100
angerTimer = 0


}

function angerGenerate() {
    if (!attacking) {
        angerTimer++;
        if (angerTimer >= angerMax) {
            angerTimer = 0;
            global.Counter += global.angerCounter;
            slimeAttack(); // Trigger attack when anger is generated
        }
    }
}
function resetSlimeState() {
    attacking = false;
    spr = spr_slimebase; // Reset to idle sprite
    angerTimer = 0; // Reset anger timer
    global.sAttackCounter = 0; // Reset attack counter
    global.angerCounter = 0; // Reset anger counter
}



function sizeUpdate(){
x =room_width/2
y =room_width *.4
sizeMultiplier = 4 + (global.slimeSizeCounter * .1)
image_xscale =sizeMultiplier
image_yscale =sizeMultiplier

}
function slimeAttack() {
    if (!attacking) {
        global.cage -= global.slimeSizeCounter;
        attacking = true;
        spr = spr_slimeAttack; // Play attack animation
        subbed = 0; // Reset animation frame tracker
    }
}


function calculateDanger() {
    return angerTimer / angerMax; // Adjust these variables based on your game logic
}
function draw_radial_progress(pos_x, pos_y, progress, radius, color, thickness) {
    var angle_step = 360 * progress; // Calculate the angle based on progress (0 to 1)
    var start_angle = 90; // Starting angle

    draw_set_colour(color);
    draw_set_alpha(1);

    for (var angle = 0; angle < angle_step; angle++) {
        var x1 = pos_x + lengthdir_x(radius, angle + start_angle);
        var y1 = pos_y + lengthdir_y(radius, angle + start_angle);
        var x2 = pos_x + lengthdir_x(radius - thickness, angle + start_angle);
        var y2 = pos_y + lengthdir_y(radius - thickness, angle + start_angle);

        draw_line(x1, y1, x2, y2); // Draw line for each radial segment
    }
	    draw_set_colour(c_white);
}