-- start dialog
--print("Color(Integer) werkt niet krijg maar kanker")
local dialog = Dialog("Paint blur settings")
	:number{
			id = "radius",
			label = "Sample Radius",
			decimals = 0,
		}
	:number{
			id = "treshold",
			label = "treshold",
			decimals = 3,
		}
	:number{
			id = "randomness",
			label = "Randomness",
			decimals = 3,
		}
	:number{
			id = "shadows",
			label = "Shadows",
			decimals = 3,
		}
	:button{
		id = "ok",
		text = "&Go"
	}
	:button{
		text = "&Cancel"
	}:show()

local data = dialog.data
if not data.ok then
	return
end
local treshold = data.treshold
local shadows = data.shadows
local radius = data.radius / 2
if (radius < 1.0) then radius = 1.0 end
local randomness = data.randomness

--step1 calculate intensity values
local spr = app.activeSprite
local selection = Selection(Rectangle(0,0,app.image.width, app.image.height))
app.command.CopyMerged()

local newLayer = app.command.NewLayer {
	name="Paint Anim",
	fromClipboard=true
}

local img = Image(app.image)
local tresholdImg = Image(img.width, img.height)

local ColorCancer = function(integer)
	local a = integer / 16777216
	local b = (integer / 65536) % 256
	local g = (integer / 256) % 65536
	local r = integer % 16777216
	return Color{a=a, r=r, g=g, b=b}
end

function math.sign(x)
   if x<0 then
     return -1
   elseif x>0 then
     return 1
   else
     return 0
   end
end

local calcBoostValue = function(col1, col2)
	local boost = (24.0) / (math.abs(col1.red - col2.red) +  math.abs(col1.green - col2.green) + math.abs(col1.blue - col2.blue) + 30.0)
	return boost
end



for it = 0 , radius do

	for x = 1, img.width -2 do
		for y = 1, img.height -2 do
			local rand = ((math.random() * 2.0) - 1.0) * randomness
			local colBase =   ColorCancer(img:getPixel(x,y))
			local colComp =   ColorCancer(img:getPixel(x,y+1)  )
			local colBoost1 = ColorCancer(img:getPixel(x-1,y)  )
			local colBoost2 = ColorCancer(img:getPixel(x+1,y)  )
			local colBoost3 = ColorCancer(img:getPixel(x-1,y-1))
			local variation = ( ((colBase.hsvValue / 65536.0) - ((colComp.hsvValue * (colComp.alpha / 256))/ 65536.0)^2) * 0.25)
			local boost = calcBoostValue(colBase, colBoost1)  + calcBoostValue(colBase, colBoost2) + calcBoostValue(colBase, colBoost3)
			local colValue = (variation * 0.5 * (math.sign(variation)+1.0)) *(1.0 + boost) + (boost * shadows)
			colValue = colValue + (colValue * rand)
			local col = Color{hue=0, saturation=0.0, value=colValue, alpha=255}
			tresholdImg:drawPixel(x,y,col)
		end
	end

	--todo generaliseren tot voer functie uit op images x,y,z
	local finalImg = Image(img)
	for x = 1, img.width -2 do
		for y = 1, img.height -2 do
			local colBase =   ColorCancer(tresholdImg:getPixel(x,y))
			local colBase2 =   ColorCancer(tresholdImg:getPixel(x,y+1))
			local colImg =  ColorCancer(img:getPixel(x,y))
			local colImg2 =  ColorCancer(img:getPixel(x,y+1))
			local val = colBase.hsvValue / 65536.0
			local val2 = colBase2.hsvValue / 65536.0
			local orgVal = colImg.hsvValue / 65536.0
			if val > treshold then finalImg:drawPixel(x,y+1, colImg)
			elseif val + val2 > treshold and radius > 1.0 and val2 < treshold then finalImg:drawPixel(x,y+1, colImg) end --blurry / lighted sprite correction
			if val > (treshold + (treshold / (radius))) and (y < img.height - 2 ) and orgVal > treshold then finalImg:drawPixel(x,y+2, colImg) --todo: blend als verschil heel groot en geselecteerd
			elseif val > (treshold + (treshold / (radius * 2.0))) and (y < img.height - 2 ) then finalImg:drawPixel(x,y+2, colImg2) end 
		end
	end
	
	img = Image(finalImg)
	treshold =  treshold + (treshold / (radius * 2.0))
	
	
	app.command.NewFrame()
	
	app.image:drawImage(finalImg)
end
