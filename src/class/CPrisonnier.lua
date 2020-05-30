--[[ * PRINCIPES *
  On importe tout le fichier de code, pas simplement une fonction factory

--]]

-- On crée une table qu'on renverra à la fin. En fait, une référence, mais on changera le contenu à chaque appel de new().
local CPrisonnier = {}



-- Cette métatable fera le lien entre la table locale qu'on crée dans le new et la table exportable moduleAliens
local cprisonnier_mt = { __index = CPrisonnier }


-- local CSprite = require("class/CSprite")

-- Notre méthode Factory qui renvoie une fonction particulière de lua
function CPrisonnier.new(pobjSprite)
  
  print("CPrisonnier.new() / Création d'un instance de CSprite")
  
  local objPrisonnier = {}
  objPrisonnier.objSprite = pobjSprite
  objPrisonnier.x = 0
  objPrisonnier.y = 0
  -- Les dimensions du Prisonnier (la taille de l'image ici)
  objPrisonnier.width = 20
  objPrisonnier.height = 20 
  
  return setmetatable( objPrisonnier, cprisonnier_mt)
end

function CPrisonnier:setPosition(x, y)
  self.x = x
  self.y = y
end


function CPrisonnier:update(dt)
  -- * GESTION du N° de FRAME qu'on incrémente petit à petit
  self.objSprite.idFrameAVirguleCourant = self.objSprite.idFrameAVirguleCourant + 7*dt
  if self.objSprite.idFrameAVirguleCourant >= #self.objSprite.framesAnimMatrix + 1 then
    self.objSprite.idFrameAVirguleCourant = 1
  end
  
  -- * GESTION des Fleches de contrôle
  if love.keyboard.isDown("up") then
      -- L'id d'animation que l'on lance
      self.objSprite.idAnimCourant = 2
      self.y = self.y - (50*dt)
  end
  
  if love.keyboard.isDown("down") then    
      -- L'id d'animation que l'on lance
      self.objSprite.idAnimCourant = 1
      self.y = self.y + (50*dt)
  end
   
  if love.keyboard.isDown("right") then  
      -- L'id d'animation que l'on lance
      self.objSprite.idAnimCourant = 4
      self.x = self.x + (50*dt)
  end  
  
  if love.keyboard.isDown("left") then      
      -- L'id d'animation que l'on lance
      self.objSprite.idAnimCourant = 3
      self.x = self.x - (50*dt)
  end
end


function CPrisonnier:draw()  
  -- On aggrandi tout
  -- love.graphics.scale(4,4)

  local idFrameEntier = math.floor(self.objSprite.idFrameAVirguleCourant)
  -- Affichage du Hero
  love.graphics.draw(self.objSprite.image, self.objSprite.framesAnimMatrix[self.objSprite.idAnimCourant][idFrameEntier], self.x, self.y, 0, 1, 1, self.width/2, self.height/2)
  
end



-- Lorsqu'à l'extérieur, on fait un "=require(module4)", ça récupère ce qui suit
return CPrisonnier 