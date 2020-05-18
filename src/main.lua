
-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no')

-- Empèche Love de filtrer les contours des images quand elles sont redimentionnées
-- Indispensable pour du pixel art
love.graphics.setDefaultFilter("nearest")

-- Cette ligne permet de déboguer pas à pas dans ZeroBraneStudio
if arg[#arg] == "-debug" then require("mobdebug").start() end

local keyPressed = ""

local myWindow = require("window")
local myHero = require("hero")


-- *******************************
-- ** FONCTIONS UTILISATEUR **
-- *******************************
function initialise()  
  myWindow.constructor()
  myHero.constructor()
  myHero.setPosition(myWindow.largeur/2, myWindow.hauteur/2)    
end


-- On charge le jeu qui lui chargera le héro
-- local myGame = require("game")

function love.load()
  initialise()
  
  -- myGame.Load()
  
end

function love.update(dt)

  -- myGame.Update(dt)

end

function love.draw()
  
  print(myHero.x)
  
  love.graphics.print("keypressed = "..keyPressed, 0, 0)  
  
  -- Affichage du Hero
  love.graphics.draw(myHero.image, myHero.x, myHero.y, 0, 1, 1, myHero.width/2, myHero.height/2)
  -- love.graphics.draw(Hero.image, Hero.x, Hero.y)
  -- myGame.Draw()

end

function love.keypressed(key)  
  keyPressed = key
end
  