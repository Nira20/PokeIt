function globalVars() {
    // Gameplay Mechanics
    global.acCapSpeed = 100; // Max Auto Clicker Speed
    global.acamount = 1; // amount to increase with each auto click
    global.acspeed = 1; // Base action speed
    global.oacspeed = 1; // Original action speed
    global.accost = 1; // Action cost
    global.acq = 1; // Auto Clicker Quantity
    global.Counter = 100; // General counter

    // Environmental Properties
    global.cage = 100; // Cage health or restriction limit
    global.maxPlatformHP = 100; // Maximum platform HP

    // Timers & Time Tracking
    global.rTimer = 1; // General reset timer
    global.elapsed_time = 0; // Total elapsed time
    global.motivate_timer = 0; // Motivation timer

    // Scaling & Transformations
    global.pYScale = 3; // Player Y-axis scale
    global.pXScale = 3; // Player X-axis scale

    // Entity Attributes
    global.jarred = 0; // Indicates if entity is jarred
    global.slimeSizeCounter = 1; // Tracks slime size
    global.angerCounter = 0; // Tracks entity anger level
    global.sAttackCounter = 0; // Special attack counter
    global.slimeColor = c_white; // Defines slime color

    // Game State & Control
    global.gState = "initialize"; // Current game state
    global.pause = 0; // Pause state tracker

    // Behavior & AI
    global.pacify = false; // Defines pacification state
    global.pacifyCounter = 0; // Pacification effect duration

    // Financial System
    global.debt = 6000; // Total outstanding debt
    global.nextPay = 400; // Next required payment
    global.intrest = 1.6; // Interest rate
    global.regen = 1; // Regeneration factor

    // Payment Tracking
    global.paymentNum = 0; // Current payment number
    global.totalPayments = 14; // Total payments required
    global.paymentsMade = 0; // Number of payments completed
    global.remainingPayments = 14; // Remaining payments
    global.nextPayDue = 0; // Due date for next payment
    global.nextPayRemaining = 0; // Amount left for next payment
    global.nextPayTotal = 0; // Total next payment amount

    // Time Counters
    global.hcounter = 0; // H counter
    global.dcounter = 0; // D counter
    global.mcounter = 0; // M counter

    // Color Setup
    createColors(); // Initializes custom colors
}

function createColors(){
global.colors = [
 	#fc3032,
	#01cce9,
	#0dde01,
	#faf016,
	#ff00ff,
	#76167c,
	#130505,
	#d297dd,
	#88f4e1,
    #2b3256,
	#fc3032,
	#7400ff,
	#00fffe,
	#004aff,
	#00ffc4,
	#ff0000,
	];


}
