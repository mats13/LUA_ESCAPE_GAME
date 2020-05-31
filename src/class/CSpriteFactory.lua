--[[ * PRINCIPES *
  On importe tout le fichier de code, pas simplement une fonction factory

--]]

-- On crée une table qu'on renverra à la fin. En fait, une référence, mais on changera le contenu à chaque appel de new().
local CSpriteFactory = {}



-- Cette métatable fera le lien entre la table locale qu'on crée dans le new et la table exportable moduleAliens
local cspriteFactory_mt = { __index = CSpriteFactory }


local CSprite               = require("class/CSprite")
local TYPE_SPRITE           = require("enum/ETypeSprite")
local DIRECTION_ANIMATION   = require("enum/EDirectionAnim")
local STATE_MATON           = require("enum/EStateMaton")

-- Notre méthode Factory qui renvoie une fonction particulière de lua
function CSpriteFactory.new()
  
  print("CSpriteFactory.new() / Création d'un instance de CSpriteFactory")
  
  local objSpriteFactory = {}
  objSpriteFactory.x = 0
  
  return setmetatable( objSpriteFactory, cspriteFactory_mt)
end

function CSpriteFactory:createSpritePrisonnier()
  local objSpritePrisonnier = CSpriteFactory:createSprite("images/prisonnier-up-down.png")
  -- On surcharge
  objSpritePrisonnier.typeSprite = TYPE_SPRITE.PRISONNIER
  
  return objSpritePrisonnier
end

function CSpriteFactory:createSpriteMaton()
  local objSpriteMaton = CSpriteFactory:createSprite("images/maton-up-down.png")
  -- On surcharge
  objSpriteMaton.typeSprite               = TYPE_SPRITE.MATON    
  objSpriteMaton.speed                    = 0
  objSpriteMaton.target                   = nil
  objSpriteMaton.rangeDetection           = 0
  objSpriteMaton.state                    = STATE_MATON.NONE
  
  return objSpriteMaton
end


-- LOCAL METHOD
function CSpriteFactory:createSprite(psCompleteImageFileName)
  local objSprite = CSprite.new()
  -- self.x = 5
  objSprite.x = 18
  
  
  objSprite:setImage(psCompleteImageFileName)
  
  -- On déduit de l'image la largeur et hauteur du sprite
  objSprite.width   = 20
  objSprite.height  = 20
  
  objSprite:addQuadAnim(DIRECTION_ANIMATION.WALK_DOWN, 0, 0, 20, 20)
  objSprite:addQuadAnim(DIRECTION_ANIMATION.WALK_DOWN, 20, 0, 20, 20)
  objSprite:addQuadAnim(DIRECTION_ANIMATION.WALK_DOWN, 40, 0, 20, 20)
  objSprite:addQuadAnim(DIRECTION_ANIMATION.WALK_DOWN, 60, 0, 20, 20)
  
  objSprite:addQuadAnim(DIRECTION_ANIMATION.WALK_UP, 0, 20, 20, 20)
  objSprite:addQuadAnim(DIRECTION_ANIMATION.WALK_UP, 20, 20, 20, 20)
  objSprite:addQuadAnim(DIRECTION_ANIMATION.WALK_UP, 40, 20, 20, 20)
  objSprite:addQuadAnim(DIRECTION_ANIMATION.WALK_UP, 60, 20, 20, 20)  
  
  objSprite:addQuadAnim(DIRECTION_ANIMATION.WALK_LEFT, 0, 40, 20, 20)
  objSprite:addQuadAnim(DIRECTION_ANIMATION.WALK_LEFT, 20, 40, 20, 20)
  objSprite:addQuadAnim(DIRECTION_ANIMATION.WALK_LEFT, 40, 40, 20, 20)
  objSprite:addQuadAnim(DIRECTION_ANIMATION.WALK_LEFT, 60, 40, 20, 20)  
  
  objSprite:addQuadAnim(DIRECTION_ANIMATION.WALK_RIGHT, 0, 60, 20, 20)
  objSprite:addQuadAnim(DIRECTION_ANIMATION.WALK_RIGHT, 20, 60, 20, 20)
  objSprite:addQuadAnim(DIRECTION_ANIMATION.WALK_RIGHT, 40, 60, 20, 20)
  objSprite:addQuadAnim(DIRECTION_ANIMATION.WALK_RIGHT, 60, 60, 20, 20)
  
  return objSprite
end


-- Lorsqu'à l'extérieur, on fait un "=require(module4)", ça récupère ce qui suit
return CSpriteFactory 