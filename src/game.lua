-- Initialisation à vide de l'objet
local Game = {}


-- * MODULES EXTERNES *
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

function Game.load()  
  initialise()
end

function Game.update(dt)
  myHero.update(dt)
end

function Game.draw()
  
  -- love.graphics.print("keypressed = "..keyPressed, 0, 0)  
  
  myHero.draw()
end

return Game