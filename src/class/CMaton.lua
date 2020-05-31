--[[ * PRINCIPES *
  On importe tout le fichier de code, pas simplement une fonction factory

--]]

-- On crée une table qu'on renverra à la fin. En fait, une référence, mais on changera le contenu à chaque appel de new().
local CMaton = {}



-- Cette métatable fera le lien entre la table locale qu'on crée dans le new et la table exportable moduleAliens
local cmaton_mt = { __index = CMaton }


-- local DIRECTION_ANIMATION = require("enum/EDirectionAnim")
local CSpriteFactory  = require("class/CSpriteFactory")

-- Notre méthode Factory qui renvoie une fonction particulière de lua
function CMaton.new()
  
  print("CPrisonnier.new() / Création d'un instance de CSprite")
  
  local objMaton = {}
  -- objMaton.objSprite = pobjSprite
  
  return setmetatable( objMaton, cmaton_mt)
end

function CMaton:addToList(pList)
  table.insert(pList, self)
end

function CMaton:setPosition(pX, pY)
  self.objSprite:setPosition(pX, pY)
end

function CMaton:createNew(pList, pWindow)
  local objSpriteFactory  = CSpriteFactory.new()
  local objSpriteMaton    = objSpriteFactory:createSpriteMaton()
  
  local objMaton          = CMaton.new()
  objMaton.objSprite      = objSpriteFactory:createSpriteMaton()
  
  objMaton:addToList(pList)
  
  -- On le place au hasard dans la partie haute de la fenêtre  
  objMaton.speed = math.random(5,50) / 200
  objMaton.range = math.random(10, 150)
  objMaton.target = nil
  objMaton:setPosition(
    math.random(10, pWindow.largeur-10),
    math.random(10, (pWindow.hauteur/2)-10)
  )    
  
  return objMaton
end


function CMaton:update(dt)
  -- * GESTION du N° de FRAME qu'on incrémente petit à petit
  self.objSprite.idFrameAVirguleCourant = self.objSprite.idFrameAVirguleCourant + 7*dt
  if self.objSprite.idFrameAVirguleCourant >= #self.objSprite.framesAnimMatrix + 1 then
    self.objSprite.idFrameAVirguleCourant = 1
  end
end
  


function CMaton:draw()  

  local idFrameEntier = math.floor(self.objSprite.idFrameAVirguleCourant)
  -- Affichage du Hero
  love.graphics.draw(self.objSprite.image, self.objSprite.framesAnimMatrix[self.objSprite.idAnimCourant][idFrameEntier], self.objSprite.x, self.objSprite.y, 0, 1, 1, self.objSprite.width/2, self.objSprite.height/2)
  
end



return CMaton 