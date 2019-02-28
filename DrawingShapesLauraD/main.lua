-- Title: DisplayingShapes
-- Name: Duffley Duffley
-- Course: ICS2O/3C
-- This program displays four polygons.
--The triangle has a base and a hight which is calculated. FINSH THIS 

--create my local variables
local areaText
local textSize = 30

local baseOfTriangle = 3
local heightOfTriangle = 10
local areaOfTriangle = baseOfTriangle * heightOfTriangle / 2
local myTriangle
local TriangleVertices = {0,-200, -100,0, 100,0}

local pentagonVertices = {0,-200, 200,0, 50,150, -50,150, -200,0}
local myPentagon

local hexagonVertices = {0,-200, 100,-150, 100,0, 0,50, -100,0, -100,-150}
local myHexagon

local octagonVertices = {}
local myOctagon

-- set the background color of the screen.
 display.setDefault("background", 252/255, 241/255, 172/255)

--to remove the status bar
display.setStatusBar(display.HiddenStatusBar)

-- draw the triangle
myTriangle = display.newPolygon (850, 150, TriangleVertices)

-- fill color of triangle
myTriangle: setFillColor (247/255, 146/255, 207/255)

-- set width of the border
myTriangle.strokeWidth = 10

-- set the color for the border
myTriangle: setStrokeColor (5/255, 30/255, 80/255)

-- write the area on the screen 
areaText = display.newText ("The area of this triangle with a base of \n " ..
baseOfTriangle .. " and a height of 10 is " .. areaOfTriangle .. " pixels². ", 500,100, Arial, textSize, textColor)

-- set text color
areaText: setTextColor(80/255, 5/255, 5/255)

-- draw the pentagon
myPentagon = display.newPolygon (200, 350, pentagonVertices)

-- fill color of pentagon
myPentagon: setFillColor (228/255, 29/255, 142/255)

-- set width of the border
myPentagon.strokeWidth = 5

-- set the color of the border
myPentagon: setStrokeColor (123/255, 153/255, 213/255)

-- display text
areaText = display.newText ("Pentagon", 410, 300, Arial, textSize, textColor)

-- set text color
areaText: setTextColor(80/255, 5/255, 5/255)

-- draw the Hexagon
myHexagon = display.newPolygon (850, 450, hexagonVertices)

myHexagon: setFillColor (131/255, 12/255, 79/255)

-- set width of the border
myHexagon.strokeWidth = 15

-- set the color for the border
myHexagon: setStrokeColor (15/255, 245/255, 245/255)

-- display text
areaText = display.newText ("Hexagon", 675, 450, Arial, textSize, textColor)

-- set text color
areaText: setTextColor(80/255, 5/255, 5/255)

-- draw the Octagon
myHexagon = display.newPolygon (200, 500, octagonVertices)



-- set width of the border
myHexagon.strokeWidth = 20

-- set the color for the border
myHexagon: setStrokeColor (15/255, 245/255, 245/255)

-- set color of the text
areaText = display.newText ("Hexagon", 675, 450, Arial, textSize, textColor)

-- set text color
areaText: setTextColor(80/255, 5/255, 5/255)
