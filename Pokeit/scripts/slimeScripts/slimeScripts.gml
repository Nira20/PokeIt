function slimeCreate(){
spriteWidth = sprite_width
spriteHeight= sprite_height
button_pressed = false
sizeMultiplier =0
idle_sprite = noone; // Variable for idle sprite
attack_sprite = noone; // Variable for attack sprite
damage_sprite = noone; 
color1 = noone; // First color
color2 = noone; // Second color
color3 = noone; // Third color
color4 = noone; // Fourth color

  // Set attributes based on global.pet
    switch (global.pet) {
        case "GlowStoat":
            idle_sprite = spr_stoutIdle;
            attack_sprite = spr_stoutAttack; // Example attack sprite
			damage_sprite = spr_slimeSlime; 
            color1 = c_blue;
            color2 = c_green;
            color3 = c_purple;
            color4 = c_white;
            break;

        case "AshClaw":
            idle_sprite = spr_crestedGeckoIdle;
            attack_sprite = spr_crestedGeckoAttack;
			damage_sprite = spr_slimeSlime;
            color1 = c_orange;
            color2 = c_red;
            color3 = c_black;
            color4 = c_white;
            break;

        case "SeaBunny":
            idle_sprite = spr_rabbitIdle;
            attack_sprite = spr_rabbitAttack;
			damage_sprite = spr_slimebunny;
            color1 = c_gold;
            color2 = c_silver;
            color3 = c_white;
            color4 = c_gray;
            break;

        case "DustMew":
            idle_sprite = spr_catIdle;
            attack_sprite = spr_catAttack;
			damage_sprite = spr_slimeSlime;
            color1 = c_gray;
            color2 = c_black;
            color3 = c_silver;
            color4 = c_white;
            break;

        case "Skelpling":
            idle_sprite = spr_shrewIdle;
            attack_sprite = spr_shrewAttack;
			damage_sprite = spr_slimeSlime;
            color1 = c_black;
            color2 = c_white;
            color3 = c_gray;
            color4 = c_red;
            break;

        case "Inkpecker":
            idle_sprite = spr_crowIdle;
            attack_sprite = spr_crowAttack;
			damage_sprite = spr_slimeSlime;
            color1 = c_inkBlack;
            color2 = c_iridescentBlue;
            color3 = c_glossyWhite;
            color4 = c_white;
            break;

    }
acolor = c_white
image_speed = .25
depth = -10

platformCreate()
createAnger()

}


function createAnger(){
angerMax =200
angerTimer = 0


}

function angerGenerate() {
    // Check if pacify is active or attacking
    if (!global.pacify && !attacking) {
        angerTimer++; // Increment anger timer

        if (angerTimer >= angerMax) {
            angerTimer = 0; // Reset anger timer
            global.Counter += global.angerCounter; // Increase global counter
            slimeAttack(); // Trigger slime attack
        }
    }
}

function resetSlimeState() {
    attacking = false;
    spr = idle_sprite; // Reset to idle sprite
    angerTimer = 0; // Reset anger timer
    global.sAttackCounter = 0; // Reset attack counter
    global.angerCounter = 0; // Reset anger counter
}

function posUpdate(){
x =room_width/2
y =room_height *.2
}

function sizeUpdate(){
if global.slimeSizeCounter >= 30 {
sizeMultiplier = 1 + (global.slimeSizeCounter * .01)}
else {sizeMultiplier = 1 + (30 * .01)}
image_xscale =sizeMultiplier
image_yscale =sizeMultiplier

}
function slimeAttack() {
    if (!attacking) {
        global.cage -= ((global.slimeSizeCounter /5) + global.angerCounter);
        attacking = true;
        spr = attack_sprite; // Play attack animation
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
	
function updatePacify(){

if (global.pacify) {
        global.pacifyCounter -= 1; // Decrease the timer by 1 frame

        // If the timer reaches 0, reset the speed
        if (global.pacifyCounter <= 0) {
            global.pacify = false; // Clear the speed-up flag
            global.pacifyCounter = 0; // Ensure the timer is reset
			}}}