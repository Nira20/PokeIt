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
    spr = spr_slimebase; // Reset to idle sprite
    angerTimer = 0; // Reset anger timer
    global.sAttackCounter = 0; // Reset attack counter
    global.angerCounter = 0; // Reset anger counter
}

function posUpdate(){
x =room_width/2
y =room_width *.4
}

function sizeUpdate(){
if global.slimeSizeCounter >= 30 {
sizeMultiplier = 4 + (global.slimeSizeCounter * .01)}
else {sizeMultiplier = 4 + (30 * .01)}
image_xscale =sizeMultiplier
image_yscale =sizeMultiplier

}
function slimeAttack() {
    if (!attacking) {
        global.cage -= (global.slimeSizeCounter + global.angerCounter);
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
	
function updatePacify(){

if (global.pacify) {
        global.pacifyCounter -= 1; // Decrease the timer by 1 frame

        // If the timer reaches 0, reset the speed
        if (global.pacifyCounter <= 0) {
            global.pacify = false; // Clear the speed-up flag
            global.pacifyCounter = 0; // Ensure the timer is reset
			}}}