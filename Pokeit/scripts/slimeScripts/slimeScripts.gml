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
function angerGenerate(){
	angerTimer ++ 
	if angerTimer >= angerMax{
	angerTimer =0
	global.Counter += global.angerCounter
	}
angerTimer = 0

}
function sizeUpdate(){
x =room_width/2
y =room_width *.4
sizeMultiplier = 4 + (global.slimeSizeCounter * .1)
image_xscale =sizeMultiplier
image_yscale =sizeMultiplier

}
function slimeAttack(){
global.cage -= global.slimeSizeCounter

}
function attackCounter(){
global.sAttackCounter ++
	if global.sAttackCounter >= angerMax - global.angerCounter
	{
	slimeAttack()
	global.sAttackCounter =0
	global.angerCounter --
	}



}
	
