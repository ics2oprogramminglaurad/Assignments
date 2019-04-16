-- Title: companyLogoAnimation
-- Name: Laura Duffley
-- Course: ICS2O/3C
-- This program displays an animation of the
-- company logo

-- hide status bar
display.setStatusBar(display.HiddenStatusBar)

----------------------------------------------------------------------
-- GLOBAL VARIABLES -- 
----------------------------------------------------------------------

-- global variables -- 
scrollspeed = 3

----------------------------------------------------------------------
-- LOCAL VARIABLES -- 
----------------------------------------------------------------------
local backgroundImage

--------------------------------------------------------------------
-------- OBJECT CREATION ---------
-----------------------------------------------------------------------

-- background
backgroundImage = display.newImageRect ("Images/nightScene.png", 2000, 1000)

-- lamps
local lamp1 = display.newImageRect("Images/CompanyLogoLauraD1.png", 600, 600)
local lamp2 = display.newImageRect("Images/CompanyLogoLauraD2.png", 600, 600)
lamp2.isVisible = false
--text
local textObject = display.newText (" Nighttime Games ", 500, 700,nil, 100 )
textObject.isVisible = true

-- setting color of text
textObject: setTextColor(255/255, 255/255, 4/255)

-- set the initial x, y position of the lamps
lamp1.x = 0
lamp1.y = display.contentHeight/3

lamp2.x = display.contentWidth/2
lamp2.y = 200



-- set lamp1 to be transparent
lamp1.alpha = 0

--------------------------------------------------------------------
-------- LOCAL FUNCTIONS ---------
-----------------------------------------------------------------------
-- moving lamp 1
local function Movelamp1 (event)
	-- scrollspeed
	lamp1.x = lamp1.x + scrollspeed
	-- change the transparency of the lamp so
	-- that every time it moves it fades in
	lamp1.alpha = lamp1.alpha + 0.01

	lamp1:rotate(6)

	if (lamp1.x >= display.contentWidth/2) then
		lamp1.isVisible = false
		lamp2.isVisible = true
	end

end

-- stop lamp moving

----------------------------------------------------------------------
-- EVENT LISTENERS -- 
----------------------------------------------------------------------
Runtime:addEventListener("enterFrame", Movelamp1)