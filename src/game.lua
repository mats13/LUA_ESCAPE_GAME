-- Initialisation à vide de l'objet
local Game = {}


-- * MODULES EXTERNES *
local myWindow = require("window")
-- local myHero = require("hero")
local CSpriteFactory = require("class/CSpriteFactory")
local CPrisonnier = require("class/CPrisonnier")
-- local CSprite = require("class/CSprite")

-- ****************************
-- ** VARIABLES GLOBALES **
-- ****************************
local objPrisonnier = nil


-- *******************************
-- ** FONCTIONS UTILISATEUR **
-- *******************************
function initialise()  
  
  local listSprites = {}
  myWindow.load()
  
  local objSpriteFactory  = CSpriteFactory.new()
  local objSpritePrisonnier     = objSpriteFactory:createSpritePrisonnier()
  
  objSpritePrisonnier:affiche()
  
  objPrisonnier = CPrisonnier.new(objSpritePrisonnier)
  objPrisonnier:setPosition(myWindow.largeur/2, myWindow.hauteur/2)    
end

function Game.load()  
  initialise()
end

function Game.update(dt)
  objPrisonnier:update(dt)
end

function Game.draw()  
  
  objPrisonnier:draw()
end

return Game