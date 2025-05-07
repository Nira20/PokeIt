function gstateSwitch(){
switch (global.gState) {
    case "gameOverS":
        gameOverSlime();
        break;
    
    case "gameOverM":
        GameOverM();
        break;
    
    case "paying":
        // Insert payment logic here if needed
        break;


}}