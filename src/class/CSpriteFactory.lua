--[[ * PRINCIPES *
  On importe tout le fichier de code, pas simplement une fonction factory

--]]

-- On crée une table qu'on renverra à la fin. En fait, une référence, mais on changera le contenu à chaque appel de new().
local CSpriteFactory = {}



-- Cette métatable fera le lien entre la table locale qu'on crée dans le new et la table exportable moduleAliens
local cspriteFactory_mt = { __index = CSpriteFactory }


local CSprite = require("class/CSprite")

-- Notre méthode Factory qui renvoie une fonction particulière de lua
function CSpriteFactory.new()
  
  print("CSprite.new() / Création d'un instance de CSprite")
  
  local objSpriteFactory = {}
  objSpriteFactory.x = 0
  
  return setmetatable( objSpriteFactory, cspriteFactory_mt)
end

function CSpriteFactory:createSpritePrisonnier()
  local objSpritePrisonnier = CSpriteFactory:createSprite("images/prisonnier-up-down.png")
  -- self.x = 5
  objSpritePrisonnier.x = 19
  
  return objSpritePrisonnier
end

function CSpriteFactory:createSpriteMaton()
  local objSpriteMaton = CSpriteFactory:createSprite("images/maton-up-down.png")
  -- self.x = 5
  objSpriteMaton.x = 18
  
  
  
  return objSpriteMaton
end


-- LOCAL METHOD
function CSpriteFactory:createSprite(psCompleteImageFileName)
  local objSprite = CSprite.new()
  -- self.x = 5
  objSprite.x = 18
  
  
  objSprite:setImage(psCompleteImageFileName)
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
  
  return objSprite
end


-- Lorsqu'à l'extérieur, on fait un "=require(module4)", ça récupère ce qui suit
return CSpriteFactory 