--[[ * PRINCIPES *
  On importe tout le fichier de code, pas simplement une fonction factory

--]]

-- On crée une table qu'on renverra à la fin. En fait, une référence, mais on changera le contenu à chaque appel de new().
local CPrisonnier = {}



-- Cette métatable fera le lien entre la table locale qu'on crée dans le new et la table exportable moduleAliens
local cprisonnier_mt = { __index = CPrisonnier }


local DIRECTION_ANIMATION = require("enum/EDirectionAnim")
local CSpriteFactory      = require("class/CSpriteFactory")

-- Notre méthode Factory qui renvoie une fonction particulière de lua
function CPrisonnier.new(pobjSprite)
  
  -- print("CPrisonnier.new() / Création d'un instance de CSprite")
  
  local objPrisonnier = {}
  objPrisonnier.objSprite = pobjSprite
  
  return setmetatable( objPrisonnier, cprisonnier_mt)
end


function CPrisonnier:createNew(pList, pWindow)
  local objSpriteFactory      = CSpriteFactory.new()
  local objSpriteMaton        = objSpriteFactory:createSpritePrisonnier()
  
  local objPrisonnier         = CPrisonnier.new()
  objPrisonnier.objSprite     = objSpriteFactory:createSpritePrisonnier()
  
  objPrisonnier:addToList(pList)  
  
  -- Placé temporairement au centre de la fenêtre
  objPrisonnier:setPosition(pWindow.largeur/2, pWindow.hauteur/2)   
  
  return objPrisonnier
end


function CPrisonnier:addToList(pList)
  table.insert(pList, self)
end

function CPrisonnier:setPosition(pX, pY)
  self.objSprite:setPosition(pX, pY)
end


function CPrisonnier:update(dt)
  -- * GESTION du N° de FRAME qu'on incrémente petit à petit
  self.objSprite.idFrameAVirguleCourant = self.objSprite.idFrameAVirguleCourant + 7*dt
  if self.objSprite.idFrameAVirguleCourant >= #self.objSprite.framesAnimMatrix + 1 then
    self.objSprite.idFrameAVirguleCourant = 1
  end
  
  -- * GESTION DE LA POSITION DU PRISONNIER LORSQUE IDLE *
  if(     not love.keyboard.isDown("up")
      and not love.keyboard.isDown("right")
      and not love.keyboard.isDown("down")
      and not love.keyboard.isDown("left")
  ) then
    -- Par défaut, on se positionne sur la position idle correspondant à la dernière flêche
    if(self.objSprite.idAnimCourant == DIRECTION_ANIMATION.WALK_UP) then
      self.objSprite.idFrameAVirguleCourant = 1
    elseif(self.objSprite.idAnimCourant == DIRECTION_ANIMATION.WALK_RIGHT) then
      self.objSprite.idFrameAVirguleCourant = 1
    elseif(self.objSprite.idAnimCourant == DIRECTION_ANIMATION.WALK_DOWN) then
      self.objSprite.idFrameAVirguleCourant = 1
    elseif(self.objSprite.idAnimCourant == DIRECTION_ANIMATION.WALK_LEFT) then
      self.objSprite.idFrameAVirguleCourant = 1
    end
  end
  
  -- * GESTION des Fleches de contrôle et CALCUL des novelles COORDONNEES
  if love.keyboard.isDown("up") then
      -- L'id d'animation que l'on lance
      self.objSprite.idAnimCourant = DIRECTION_ANIMATION.WALK_UP
      self.objSprite.y = self.objSprite.y - (50*dt)
  end   
  
  if love.keyboard.isDown("right") then  
      -- L'id d'animation que l'on lance
      self.objSprite.idAnimCourant = DIRECTION_ANIMATION.WALK_RIGHT
      self.objSprite.x = self.objSprite.x + (50*dt)
  end  
  
  if love.keyboard.isDown("down") then    
      -- L'id d'animation que l'on lance
      self.objSprite.idAnimCourant = DIRECTION_ANIMATION.WALK_DOWN
      self.objSprite.y = self.objSprite.y + (50*dt)
  end
  
  if love.keyboard.isDown("left") then      
      -- L'id d'animation que l'on lance
      self.objSprite.idAnimCourant = DIRECTION_ANIMATION.WALK_LEFT
      self.objSprite.x = self.objSprite.x - (50*dt)
  end
end


function CPrisonnier:draw()  
  -- On aggrandi tout
  -- love.graphics.scale(4,4)

  local idFrameEntier = math.floor(self.objSprite.idFrameAVirguleCourant)
  -- Affichage du PRISONNIER
  love.graphics.draw(self.objSprite.image, self.objSprite.framesAnimMatrix[self.objSprite.idAnimCourant][idFrameEntier], self.objSprite.x, self.objSprite.y, 0, 1, 1, self.objSprite.width/2, self.objSprite.height/2)
  
end



return CPrisonnier 