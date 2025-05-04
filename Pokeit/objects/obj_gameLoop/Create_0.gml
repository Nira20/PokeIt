instance_create_depth(room_width / 2, room_height / 3, depth -10, obj_slime);
instance_create_depth(room_width / 2, room_height / 3, depth -10, obj_timeKeeper);

// Initialize global and local variables
globalVars();  // Ensure global variables are initialized
createColors(); // Setup colors
createStore();  // Setup store variables

// Player financials
playerMoney = 0;
spentMoney = 0;
totalMoney = 0;
iPay = 0;

// UI and interaction variables
inventoryOpen = false;
othr = false;
hslot = -1;
