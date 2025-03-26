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

