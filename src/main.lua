
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


-- On charge le jeu qui lui chargera le héro
-- local myGame = require("game")

function love.load()
  myGame.load()
  
end

function love.update(dt)

  myGame.update(dt)

end

function love.draw()  
  myGame.draw()

end



function love.keypressed(key)  
  keyPressed = key
end
  