--------------------------------------------
-------splash screen
--------------------------------------------
----composer
local composer = require( "composer" )
 
local scene = composer.newScene()


-----forwards to screen 2

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
        background:setFillColor( 255, 255, 255)
        sceneGroup:insert(background)

        local image = display.newImageRect("assets/splash.png", 200, 200)
		image.x = display.contentCenterX
		image.y = display.contentCenterY
		image.id = "image"
		sceneGroup:insert(image)


 
    elseif ( phase == "did" ) then
        -- on screen
        timer.performWithDelay(1000, showCategorycene)
 
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
