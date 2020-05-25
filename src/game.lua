-- Initialisation à vide de l'objet
local Game = {}


-- * MODULES EXTERNES *
local myWindow = require("window")
local myHero = require("hero")
local mySprite = require("sprite")
local CSprite = require("class/CSprite")


-- *******************************
-- ** FONCTIONS UTILISATEUR **
-- *******************************
function initialise()  
  
  local listSprites = {}
  myWindow.load()
  --[[
  myImageQuad_01 = ImageQuadFactory.getImageQuad(1, "personnage-up-down", 0, 0, 20, 20)
  myImageQuad_02 = ImageQuadFactory.getImageQuad(2, "personnage-up-down", 20, 0, 20, 20)
  myImageQuad_03 = ImageQuadFactory.getImageQuad(3, "personnage-up-down", 40, 0, 20, 20)
  myImageQuad_04 = ImageQuadFactory.getImageQuad(4, "personnage-up-down", 60, 0, 20, 20)
  
  table.insert(listSprites, myImageQuad_01)
  table.insert(listSprites, myImageQuad_02)
  table.insert(listSprites, myImageQuad_03)
  table.insert(listSprites, myImageQuad_04)
  ]]
  
  local objSprite = CSprite.new();
  objSprite:setImage("images/personnage-up-down.png")
  -- objSprite:addQuadAnim("WALK_UP", 0, 0, 20, 20)
  objSprite:addQuadAnim(1, 0, 0, 20, 20)
  objSprite:addQuadAnim(1, 20, 0, 20, 20)
  objSprite:addQuadAnim(1, 40, 0, 20, 20)
  objSprite:addQuadAnim(1, 60, 0, 20, 20)
  
  objSprite:addQuadAnim(2, 0, 20, 20, 20)
  objSprite:addQuadAnim(2, 20, 20, 20, 20)
  objSprite:addQuadAnim(2, 40, 20, 20, 20)
  objSprite:addQuadAnim(2, 60, 20, 20, 20)
  
  
  objSprite:addQuadAnim(3, 0, 40, 20, 20)
  objSprite:addQuadAnim(3, 20, 40, 20, 20)
  objSprite:addQuadAnim(3, 40, 40, 20, 20)
  objSprite:addQuadAnim(3, 60, 40, 20, 20)
  
  
  objSprite:addQuadAnim(4, 0, 60, 20, 20)
  objSprite:addQuadAnim(4, 20, 60, 20, 20)
  objSprite:addQuadAnim(4, 40, 60, 20, 20)
  objSprite:addQuadAnim(4, 60, 60, 20, 20)
  
  
  objSprite:affiche()
  
  
  myHero.load(objSprite)
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