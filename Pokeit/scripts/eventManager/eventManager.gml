// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function eventManager(){

}

function checkContainment() {
   
    if (global.cage <=0 ){ // If slime grows too large
        triggerGameOver()
    }
    
}

function triggerGameOver() {
    global.gState = "gameover"; // Set the game state to 'game over'
    
    // Optional: Display a game over message
    show_message("Game Over! The slime has broken free.");

    // Optional: Stop all game logic or restart
    game_restart(); // Restarts the game (customize as needed)
}

function checkState() {
    // Check for game over conditions during gameplay
    if (global.gState == "initialize" || global.gState == "playing") {
        checkContainment(); // Continuously monitor containment
    }
    if (global.gState == "gameover") {
        // Optional: Freeze gameplay or return to the main menu
    }
}