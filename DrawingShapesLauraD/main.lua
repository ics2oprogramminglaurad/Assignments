-- Title: DisplayingShapes
-- Name: Duffley Duffley
-- Course: ICS2O/3C
-- This program displays four polygons.
--The triangle has a base and a hight which is calculated. FINSH THIS 

--create my local variables
local areaText
local textSize = 40

local baseOfTriangle = 3
local heightOfTriangle = 10
local areaOfTriangle = baseOfTriangle * heightOfTriangle / 2

local pentagonVertices 
local octagonVertices 
local hexagon vertices  


-- set the background color of the screen.
display.setDefault("background" 252/255, 241/255, 172/255 )

--to remove the status bar
display.setStatusBar(display.HiddenStatusBar)

-- draw the triangle
display.newPolygon( 50,50 )