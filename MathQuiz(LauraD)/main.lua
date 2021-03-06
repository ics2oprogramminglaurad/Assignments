-- Title: Math Quiz
-- Name: Laura Duffley
-- Course: ICS2O/3C
-- This program displays a math problem and allow the user to enter the answer.

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)


--------------------------------------------------------
-- LOCAL VARIABLES
--------------------------------------------------------

-- background image with width and height
local backgroundImage

-- create local variables
local questionObject
local correctObject
local numericField

-- addition
local randomNumber1 = math.random(1,20)
local randomNumber2 = math.random(1,20)
-- substraction
local randomNumber3 = math.random(1,20)
local randomNumber4 = math.random(1,20)
-- multiplication
local randomNumber5 = math.random(1,10)
local randomNumber6 = math.random(1,10)
-- division
local randomNumber7 = math.random(1,10)
local randomNumber8 = math.random(1,10)
-- exponents
local randomNumber9 = math.random(1,5)
local randomNumber10 = math.random(1,5)
-- random operator
local randomOperator = math.random(1,5)

local userAnswer
local correctAnswer
local incorrectObject

local totalSeconds = 11
local secondsLeft = 11
local clockText
local countDownTimer

local lives = 3

local heart1
local heart2
local heart3

local scoreText
local score = 0

local gameOver
local youWin
local thumbDown

----------------------------------------------------------------------------------
-- SOUNDS
---------------------------------------------------------------------------------


local youWinSound = audio.loadStream("Sounds/Fireworks.wav")
local youWinSoundChannel

local youLoseSound = audio.loadStream("Sounds/whack.mp3")
local youLoseSoundChannel

local correctSound = audio.loadStream("Sounds/Spring.mp3")
local correctSoundChannel

local incorrectSound = audio.loadStream("Sounds/Boing.mp3")
local incorrectSoundChannel

local cheeringSound = audio.loadStream("Sounds/Boing.mp3")
local cheeringSoundChannel
----------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
---------------------------------------------------------------------------------

-- local functions
local function AskQuestion()

	-- choose random operator
	randomOperator = math.random(1,5)

	-- ******* testing remove after ***********
	randomOperator = 3

	-- if the random operator is 1, do addition
	if (randomOperator == 1) then

		-- calculate the correct answer
		randomNumber1 = math.random (1,20)
		randomNumer2 = math.random (1,20)
		correctAnswer = randomNumber1 + randomNumber2

		-- create question in textObject
		questionObject.text = randomNumber1 .. "+" .. randomNumber2 .. "="

	-- if it is 2, do subtraction
	elseif (randomOperator == 2) then
		--calulate the correct answer
		randomNumber3 = math.random(1,20)
		randomNumber4 = math.random(1,20)
		correctAnswer = randomNumber3 - randomNumber4
		questionObject.text = randomNumber3 .. "-" .. randomNumber4 .. "="

		if (randomNumber3 < randomNumber4) then
			-- negative answer
			correctAnswer = randomNumber4 - randomNumber3
			questionObject.text = randomNumber4 .. "-" .. randomNumber3 .. "="
		else 
			correctAnswer = randomNumber3 - randomNumber4
			-- create question in text object
			questionObject.text = randomNumber3 .. "-" .. randomNumber4 .. "="
		end
	
	-- if it is 3, do division
	elseif (randomOperator == 3) then
		-- calculate the correct answer
		randomNumber7 = math.random(1,10)
		randomNumber8 = math.random(1,10)
		correctAnswer = randomNumber7/randomNumber8
		questionObject.text = randomNumber7 .. "/" .. randomNumber8 .. "="
		correctAnswer = correctAnswer * 10
		correctAnswer = math.round(correctAnswer)
		correctAnswer = correctAnswer / 10
		

	-- if it is 4, do multiplication
	elseif (randomOperator == 4) then
		-- calculate the correct answer
		randomNumber7 = math.random(1,10)
		randomNumber8 = math.random(1,10)
		correctAnswer = randomNumber7 * randomNumber8

		-- create question in textObject
		questionObject.text = randomNumber7 .. "*" .. randomNumber8 .. "="

	-- exponents
	elseif (randomOperator == 5) then
		--calculate the correct answer
		randomNumber9 = math.random(1,3)
		randomNumber10 = math.random(1,3)
		correctAnswer = randomNumber9 ^ randomNumber10

		
		-- create question in text object
		questionObject.text = randomNumber9 .. "^" .. randomNumber10 .. "="
	end
end


-- decrease lives function
local function DecreaseLives ()

	if (lives == 3) then
		secondsLeft = totalSeconds
		heart1.isVisible = true
		heart2.isVisible = true
		heart3.isVisible = true
	elseif (lives == 2) then
		heart1.isVisible = true
		heart2.isVisible = true
		heart3.isVisible = false
		secondsLeft = totalSeconds
	elseif (lives == 1) then
		heart1.isVisible = true
		heart2.isVisible = false
		heart3.isVisible = false
		secondsLeft = totalSeconds
	elseif (lives == 0) then
		numericField.isVisible = false
		heart1.isVisible = false
		heart2.isVisible = false
		heart3.isVisible = false
		gameOver.isVisible = true
		youWin.isVisible = false
		youLoseSoundChannel = audio.play( youLoseSound )
		timer.cancel(countDownTimer)
		backgroundImage.isVisible = false
		thumbDown.isVisible = true
		clockText.isVisible = false
		questionObject.isVisible = false
		scoreText.isVisible = false
	end
end

-- update time
local function UpdateTime ()

	-- decrement the number of seconds
	secondsLeft = secondsLeft - 1

	-- dipslay the number of seconds left in the clock object
	clockText.text = "Seconds Left: " .. secondsLeft 

	if (secondsLeft == 0) then
		timer.performWithDelay (timer.cancel)
		-- reset the number of seconds left
		secondsLeft = totalSeconds
		lives = lives - 1


		-- if there are no lives left, play a lose sound show a you lose image and cancel the
		-- timer remove the third heart by making it invisible
		if (lives == 2) then
			heart3.isVisible = false
			heart2.isVisible = true
			heart1.isVisible = true
			gameOver.isVisible = false
			youWin.isVisible = false

		elseif (lives == 1) then
			heart3.isVisible = false
			heart2.isVisible = false
			heart1.isVisible = true
			gameOver.isVisible = false
			youWin.isVisible = false

		elseif (lives == 0) then
			heart3.isVisible = false
			heart2.isVisible = false
			heart1.isVisible = false
			gameOver.isVisible = true
			youWin.isVisible = false
			youLoseSoundChannel = audio.play( youLoseSound )
			timer.cancel(countDownTimer)
			scoreText.isVisible = false
			numericField.isVisible = false
			clockText.isVisible = false
			questionObject.isVisible = false
			countDownTimer.isVisible = false
			scoreText.isVisible = false
			thumbDown.isvisible = true
			DecreaseLives ()
		end
	end
end

-- winning the game
local function Win()
	if (score == 5) then
		youWin.isVisible = true
		youWinSoundChannel = audio.play( youWinSound )
		timer.cancel(countDownTimer)
		numericField.isVisible = false
		clockText.isVisible = false
		scoreText.isVisible = false
		heart1.isVisible = false
		heart2.isVisible = false
		heart3.isVisible = false
		questionObject.isVisible = false
		backgroundImage.isVisible = false
	end
end

-- hide correct
local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

-- hide incorrect
local function HideIncorrect ()
	incorrectObject.isVisible = false
	AskQuestion()
end

-- numeric field listener
local function NumericFieldListener ( event )

	-- user begins editing "numericField"
	if ( event.phase == " began ") then

		-- clear text field
		event.target.text = ""

	elseif event.phase == "submitted" then

		-- when the user's answer is submitted (enter key is pressed)
		-- set user input to the user's answer
		userAnswer = tonumber(event.target.text)
		print ("***userAnswer =" .. userAnswer)
		print ("***correctAnswer = " .. correctAnswer)

		-- if the user's answer and the correct answer are the same:
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true
			score = score+1
			scoreText.text = " Score = " .. score
			correctSoundChannel = audio.play( correctSound )
			timer.performWithDelay( 500, HideCorrect )
			secondsLeft = totalSeconds
			Win ()
		else
			incorrectObject.isVisible = true
			timer.performWithDelay ( 2000, HideIncorrect )
			incorrectSoundChannel = audio.play (incorrectSound)
			lives = lives-1
			DecreaseLives ()
		end
		-- clear textObject
		event.target.text = ""
	end
end

-- start timer
local function startTimer ()
	-- create infinite timer
	countDownTimer = timer.performWithDelay (1000, UpdateTime, 0)
end

----------------------------------------------------------------------------------
-- OBJECT CREATION
---------------------------------------------------------------------------------

-- background image
backgroundImage = display.newImageRect ("Images/forest.png", 2048, 1536)

-- create game over and make it invisible
gameOver = display.newImageRect("Images/gameover.png", 800,800)
gameOver.isVisible = false

-- x,y of game over
gameOver.x = 500
gameOver.y = 400

-- create you win and make it invisible
youWin = display.newImageRect("Images/you_win.png", 800,950)
youWin.isVisible = false

-- x.y of you win
youWin.x = 500
youWin.y = 350

-- displays a question and sets the color
questionObject = display.newText("", 150, 250, nil, 65)

-- sets the color of the text
questionObject: setTextColor(247/255, 180/255,234/255)

-- create the correct and incorrect text objects and make them invisible
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 65 )
correctObject:setTextColor(249/255, 235/255, 33/255)
correctObject.isVisible = false

incorrectObject = display.newText("Incorrect", display.contentWidth/2, display.contentHeight*2/3, nil, 65)
incorrectObject: setTextColor (247/255, 27/255, 27/255)
incorrectObject.isVisible = false

-- create points object
scoreText = display.newText("", 250, 600, nil, 50)
scoreText:setTextColor(33/255, 249/255, 249/255)
scoreText.text = "Score: " .. score

-- displays the time remaining on the screen
clockText = display.newText("Seconds Left: " .. secondsLeft, 200, 50, nil, 50)

-- sets the color of the text
clockText: setTextColor(33/255, 249/255, 249/255)

-- create numeric field
numericField = native.newTextField ( display.contentWidth/3, display.contentHeight/3, 150, 85 )

-- add the event NumericFieldListener
numericField: addEventListener("userInput", NumericFieldListener)

-- display hearts
heart1 = display.newImageRect ("Images/heart.png", 100,100)
heart2 = display.newImageRect ("Images/heart.png", 100,100)
heart3 = display.newImageRect ("Images/heart.png", 100,100)

-- thumb down object and make it invisible
thumbDown = display.newImageRect ("Images/thumbDown.png", 100,100)
thumbDown.isVisible = false

-- x,y of the thumb
thumbDown.x = 300
thumbDown.y = 400

-- set x,y position of hearts
heart1.x = 650
heart1.y = 70

heart2.x = 800
heart2.y = 70

heart3.x = 950
heart3.y = 70

----------------------------------------------------------------------------------
-- FUNCTION CALLS
---------------------------------------------------------------------------------
startTimer()

-- Function calls
AskQuestion ()