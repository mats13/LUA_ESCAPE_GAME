-- Initialisation à vide de l'objet
local Game = {}


-- * MODULES EXTERNES *
local myWindow = require("window")
local myHero = require("hero")
local CSpriteFactory = require("class/CSpriteFactory")
-- local CSprite = require("class/CSprite")


-- *******************************
-- ** FONCTIONS UTILISATEUR **
-- *******************************
function initialise()  
  
  local listSprites = {}
  myWindow.load()
  
  local objSpriteFactory  = CSpriteFactory.new()
  -- local objMaton          = objSpriteFactory:createMaton()
  local objPrisonnier     = objSpriteFactory:createSpritePrisonnier()
  
  
  -- myHero.load(objPrisonnier)
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