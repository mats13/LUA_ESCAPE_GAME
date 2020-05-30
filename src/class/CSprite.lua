--[[ * PRINCIPES *
  On importe tout le fichier de code, pas simplement une fonction factory

--]]
-- On crée une table qu'on renverra à la fin. En fait, une référence, mais on changera le contenu à chaque appel de new().
local CSprite = {}

-- Cette métatable fera le lien entre la table locale qu'on crée dans le new et la table exportable moduleAliens
local csprite_mt = { __index = CSprite }

-- Notre méthode Factory qui renvoie une fonction particulière de lua
function CSprite.new()
  
  print("CSprite.new() / Création d'un instance de CSprite")
  
  local objSprite = {}
  objSprite.x = 0
  objSprite.y = 0
  objSprite.image = nil
  objSprite.framesAnimMatrix = {}
  -- Le numéro d'animation courant
  objSprite.idAnimCourant = 1
  -- le numéro de frame courant (mais pas entier)
  objSprite.idFrameAVirguleCourant = 1
  
  return setmetatable( objSprite, csprite_mt)
end

function CSprite:setImage(nomCompletFichier)
  self.x = 5
  self.image = love.graphics.newImage(nomCompletFichier)
end

function CSprite:addQuadAnim(idAnim, pX, pY, pWidth, pHeight)
  -- Si l'idAnim est supérieur au nombre d'anims déjà dans le tableau, c'est qu'il faut le créer
  if(idAnim > #self.framesAnimMatrix) then
    -- On crée une nouvelle entrée 
    self.framesAnimMatrix[idAnim] = {}
  end
  self.framesAnimMatrix[idAnim][#self.framesAnimMatrix[idAnim] + 1] = love.graphics.newQuad(pX, pY, pWidth, pHeight, self.image:getWidth(), self.image:getHeight())
end
 
function CSprite:affiche()
  
  print("Affichage")
  print("X : "..self.x)
  print("type sprite : "..self.typeSprite)
  -- print("test : "..self.test)
  print("nb animations framesAnimMatrix : "..#self.framesAnimMatrix)
  print("nb frame de animation 1 : "..#self.framesAnimMatrix[1])
  -- print("image : "..self.image)
end

-- Lorsqu'à l'extérieur, on fait un "=require(module4)", ça récupère ce qui suit
return CSprite 