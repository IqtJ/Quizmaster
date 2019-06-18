--------------------------------------------
--------addition questions
--------------------------------------------


----composer
local composer = require( "composer" )
 
local scene = composer.newScene()


-----goes back to category scene

local function showCategorycene()
	
	local options = {
		effect = "fade",
		time = 500
	}
	composer.gotoScene( "category", options) --goes to category selection
end

------------event functions
function scene:create( event )
 
    local sceneGroup = self.view
    --creates the scene
end
 
 
-- show screen
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- about to come on screen

        local background = display.newRect( 0, 0, 10000, 10000)
        background:setFillColor( 0, 255, 0)
        sceneGroup:insert(background)

 
    elseif ( phase == "did" ) then
    	--score variable

    	local score = 0

    	--seconds left
    	local secondsLeft = 20

        --answer text field (user writes answer here)
        local answerTextField = native.newTextField( display.contentCenterX, display.contentCenterY + 60, 300, 50 )
        answerTextField.id = "answer extField"
        sceneGroup:insert(answerTextField)
        answerTextField.placeholder = "Type answer here"

        --enter button to check answer
        local enterButton = display.newImageRect("assets/enter.png", 80, 60)
		enterButton.x = display.contentCenterX + 190
		enterButton.y = display.contentCenterY + 60
		enterButton.id = "enterButton"
		sceneGroup:insert(enterButton)

		--correct or incorrect text
		local correctText = display.newText( " ", display.contentCenterX, display.contentCenterY - 100, native.labelFont, 25 )
		correctText.id = "correct text"
		correctText:setFillColor( 0, 0, 0 )
		sceneGroup:insert(correctText) 
        
        ---question text
        local questionText = display.newText( "Click Next to Start", display.contentCenterX, display.contentCenterY - 30, native.labelFont, 15 )
		questionText.id = "question text"
		questionText:setFillColor( 0, 0, 255 )
		sceneGroup:insert(questionText) 

		--time text to show how many seconds left
		local timeText = display.newText( " seconds", display.contentCenterX + 200, display.contentCenterY - 130, native.labelFont, 20 )
		timeText.id = "time text"
		timeText:setFillColor( 255, 0, 0 )
		sceneGroup:insert(timeText) 

		--score text

		local scoreText = display.newText( "Score:"..score, display.contentCenterX - 200, display.contentCenterY - 130, native.labelFont, 20 )
		scoreText.id = "sports text"
		scoreText:setFillColor( 0, 0, 0 )
		sceneGroup:insert(scoreText) 

		--next button
		local nextButton = display.newImageRect("assets/next.png", 120, 80)
		nextButton.x = display.contentCenterX 
		nextButton.y = display.contentCenterY + 130
		nextButton.id = "nextButton"
		sceneGroup:insert(nextButton)

		--time counter
		local function updateTime( event )
 
    		-- Decrement the number of seconds
    		secondsLeft = secondsLeft - 1
    		timeText.text = (secondsLeft.." seconds")
    		if secondsLeft <= 0 then
	    		local screen = display.newRect( 0, 0, 10000, 10000)
	        	screen:setFillColor( 255, 255, 255)
	        	sceneGroup:insert(screen)

	        	local endText = display.newText( " Time's Up! ", display.contentCenterX , display.contentCenterY , native.labelFont, 40)
				endText.id = "end text"
				endText:setFillColor( 255, 0, 0 )
				sceneGroup:insert(endText) 

				--score text
				local scoreText = display.newText( "Score:"..score, display.contentCenterX, display.contentCenterY - 100, native.labelFont, 30 )
				scoreText.id = "sports text"
				scoreText:setFillColor( 0, 255, 0 )
				sceneGroup:insert(scoreText)

				local homeButton = display.newImageRect("assets/home.png", 120, 80)
				homeButton.x = display.contentCenterX 
				homeButton.y = display.contentCenterY + 130
				homeButton.id = "homeButton"
				sceneGroup:insert(homeButton)

				answerTextField:removeSelf()

				local function showDivideScene()
	    
	    			local options = {
	       	    		effect = "fade",
	        			time = 500
	    			}
	    			composer.gotoScene( "division", options) 
				end

				local function homeButtonTouch( event )
					timer.performWithDelay(500, showCategorycene)
				end

				homeButton:addEventListener("tap",homeButtonTouch)
			end
    	end

    	local countDownTimer = timer.performWithDelay( 1000, updateTime, secondsLeft )

		local function nextButtonTouch( event )
			--random numbers to add (max 100)
			math.randomseed( os.time() )

			local number1 = math.random(1,50)
			local number2 = math.random(1,50)
			questionText.text = (number1.. " + "..number2)

	

			local answer = number1 + number2 --answer
			print(answer) 

			local function enterButtonTouch( event )

				--checks for right answer
				if answerTextField.text == tostring(answer) then
					score = score + 10
					scoreText.text = ("Score: "..score)
					correctText.text = ( "Correct" )
				else
					correctText.text = ( "incorrect" )


				end
				
			end

			enterButton:addEventListener("tap", enterButtonTouch)
			
		end

		nextButton:addEventListener("tap", nextButtonTouch)
        
 
    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- about to go off screen 
    elseif ( phase == "did" ) then
        -- entirely off screen
    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    -- removes scene
 
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
 
return scene
