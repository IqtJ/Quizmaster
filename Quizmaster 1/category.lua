-------------------------------------
----category slection scene
----------------------
--------------------------------------------
-------splash screen
--------------------------------------------
----composer
local composer = require( "composer" )
 
local scene = composer.newScene()


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
        background:setFillColor( 255, 0, 255)
        sceneGroup:insert(background)

 
    elseif ( phase == "did" ) then

    	--addition	
    	local addButton = display.newImageRect("assets/add.png", 200, 100)
		addButton.x = display.contentCenterX - 150
		addButton.y = display.contentCenterY - 100
		addButton.id = "addButton"
		sceneGroup:insert(addButton)

		--subtract
		local subtract = display.newImageRect("assets/subtract.png", 200, 100)
		subtract.x = display.contentCenterX + 150
		subtract.y = display.contentCenterY - 100
		subtract.id = "subtract"
		sceneGroup:insert(subtract)

		local multiply = display.newImageRect("assets/multiply.png", 200, 100)
		multiply.x = display.contentCenterX - 150
		multiply.y = display.contentCenterY + 100
		multiply.id = "multiply"
		sceneGroup:insert(multiply)

		local divide = display.newImageRect("assets/divide.png", 200, 100)
		divide.x = display.contentCenterX + 150
		divide.y = display.contentCenterY + 100
		divide.id = "divide"
		sceneGroup:insert(divide)

	    ---addition screen 
	    local function showAddScene()
    
    	local options = {
       	    effect = "fade",
        	time = 500
    	}
    	composer.gotoScene( "addition", options) 
		end
		---changes screen whent add button is clicked
		local function addButtonTouch( event )
			timer.performWithDelay(100, showAddScene)
		end

		addButton:addEventListener( "tap", addButtonTouch)

		---subtraction screen 
	    local function showSubScene()
    
    	local options = {
       	    effect = "fade",
        	time = 500
    	}
    	composer.gotoScene( "subtraction", options)
		end
		---changes screen whent add button is clicked
		local function subtractButtonTouch( event )
			timer.performWithDelay(100, showSubScene)
		end

		subtract:addEventListener( "tap", subtractButtonTouch)

		---multiplication screen 
	    local function showMultiplyScene()
    
    	local options = {
       	    effect = "fade",
        	time = 500
    	}
    	composer.gotoScene( "multiplication", options) 
		end
		---changes screen whent add button is clicked
		local function multiplyButtonTouch( event )
			timer.performWithDelay(100, showMultiplyScene)
		end

		multiply:addEventListener( "tap", multiplyButtonTouch)

		---division screen 
	    local function showDivideScene()
    
    	local options = {
       	    effect = "fade",
        	time = 500
    	}
    	composer.gotoScene( "division", options) 
		end
		---changes screen whent add button is clicked
		local function divideButtonTouch( event )
			timer.performWithDelay(100, showDivideScene)
		end

		divide:addEventListener( "tap", divideButtonTouch)
 
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
