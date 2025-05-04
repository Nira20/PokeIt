function checkContainment() {
   
    if (global.cage <=0 ){ // If slime grows too large
        triggerGameOver()
    }
    
}

function changegState(state) {
    global.gState = state; // Set the game state to 'game over'
}

function checkState() {
    // Check for game over conditions during gameplay
    if (global.gState == "initialize" || global.gState == "playing") {
        checkContainment(); // Continuously monitor containment
    }
}


