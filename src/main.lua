
-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no')

-- Empèche Love de filtrer les contours des images quand elles sont redimentionnées
-- Indispensable pour du pixel art
love.graphics.setDefaultFilter("nearest")

-- Cette ligne permet de déboguer pas à pas dans ZeroBraneStudio
if arg[#arg] == "-debug" then require("mobdebug").start() end



-- * MODULES EXTERNES *
local myGame = require("game")


local keyPressed = ""


function love.load()
  myGame.load()
  
end

function love.update(dt)

  myGame.update(dt)

end

function love.draw()  
  
  -- love.graphics.push()
    
  -- love.graphics.scale(2,2)
  myGame.draw()
  
  -- love.graphics.pop()

end



function love.keypressed(key)  
  keyPressed = key
  print(keyPressed)
end
  