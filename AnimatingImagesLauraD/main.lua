--Title: Animating Images
-- By: Laura Duffley
-- Course: ICS2O/3C
-- This program displays 3 objects that move on the screen aswell
-- as text that says "Aquatic Animals"

-- create local variables
local Dolphin
local AngelFish
local Shark
local textObject

-- hide the status bar
display.setStatusBar (display.HiddenStatusBar)

-- global variable
scrollspeed = 3
scrollspeedtwo = -3

-- background image with width and height
local backgroundImage = display.newImageRect ("Images/beachview.png", 2048,1536)

-- character image with width and height
local Dolphin = display.newImageRect ("Images/Dolphin.png", 250, 250)

-- set the dolphin to be transparent
Dolphin.alpha = 0

-- set the initial x and y value of the dolphin
Dolphin.x = 100
Dolphin.y = 140

-- function MoveDolphin
-- Input: this function accepts an event listener
-- output
-- Description: This function adds the scroll speed to the x-value of the ship
local function MoveDolphin (event)
	-- add the scroll speed to the x-value of the Dolphin
	Dolphin.x = Dolphin.x + scrollspeed
	-- Change the transparency of the dolphin every time it moves so that it fades out
	Dolphin.alpha = Dolphin.alpha + 0.01
end

-- MoveDolphin will be called over and over again
Runtime:addEventListener("enterFrame", MoveDolphin)

-- Character image with width and height
local AngelFish = display.newImageRect("Images/AngelFish.png", 215,215)

-- set the image to be transparent
AngelFish.alpha = 0

-- set the initial x and y value of the AngelFish
AngelFish.x = 1000
AngelFish.y = 350

-- Function: MoveAngelFish
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the x-value of
-- the AngelFish
local function MoveAngelFish (event)
	-- add the scroll speed to the x-value of the AngelFish
	AngelFish.x = AngelFish.x + scrollspeedtwo
	-- Change the transparency of the AngelFish every time it moves
	-- so that it fades out
	AngelFish.alpha = AngelFish.alpha + 0.02

	AngelFish:rotate( 5 )
end

-- MoveAngelFish will be called over amnd over again
Runtime: addEventListener("enterFrame", MoveAngelFish)

-- displays text on the screen
textObject = display.newText ("Aquatic Animals", 500, 725, nil, 60)

-- sets the color of the text
textObject: setTextColor (37/255, 105/255, 172/255)

-- character image with width and height
local Shark = display.newImageRect("Images/Shark.png", 300, 250)

-- set the image to be transparent
Shark.alpha = 0

-- set the initial x and y position of the shark
Shark.x = 70
Shark.y = 550

-- Function: MoveShark
-- Input: this function accepts an event listener
-- output: none
-- Description: This function adds the scroll speed to the x-value of the Shark
local function MoveShark (event)
	--add the scroll speed to the x-value of the Shark
	Shark.x = Shark.x + scrollspeed
	--change the transparency of the Shark every time it moves so
	-- that it fades out
	Shark.alpha = Shark.alpha + 0.01
end

-- MoveShark will be called over and over again
Runtime: addEventListener("enterFrame", MoveShark)

-- Function: textObjectlistner
-- Input: Touch listener
-- output: none
-- Description: When the text object is touched, move it
local function textObjectListener (touch)

	if (touch.phase == "moved")then
		textObject.x = touch.x
		textObject.y = touch.y
	end

end

-- Add the respective listener to the object
textObject:addEventListener("touch",textObjectListener)