--[[ * PRINCIPES *
  On importe tout le fichier de code, pas simplement une fonction factory

--]]

-- On crée une table qu'on renverra à la fin. En fait, une référence, mais on changera le contenu à chaque appel de new().
local CMaton = {}



-- Cette métatable fera le lien entre la table locale qu'on crée dans le new et la table exportable moduleAliens
local cmaton_mt = { __index = CMaton }


local CSpriteFactory  = require("class/CSpriteFactory")
local TYPE_SPRITE     = require("enum/ETypeSprite")
local STATE_MATON     = require("enum/EStateMaton")
-- On stocke la window dont on a besoin partout pour les largeur et hauteur
local objWindow = nit

-- Returns the angle between two points.
function math.angle(x1,y1, x2,y2) return math.atan2(y2-y1, x2-x1) end

-- Notre méthode Factory qui renvoie une fonction particulière de lua
function CMaton.new()
  
  -- print("CPrisonnier.new() / Création d'un instance de CSprite")
  
  local objMaton = {}
  
  return setmetatable( objMaton, cmaton_mt)
end

function CMaton:addToList(pList)
  table.insert(pList, self)
end

function CMaton:setPosition(pX, pY)
  self.objSprite:setPosition(pX, pY)
end

function CMaton:createNew(pList, pWindow)
  -- On stocke le paramètre
  objWindow = pWindow
  
  local objSpriteFactory  = CSpriteFactory.new()
  
  local objMaton          = CMaton.new()
  objMaton.objSprite      = objSpriteFactory:createSpriteMaton()
  
  -- On SURCHARGE le sprite des MATONS car pas tous les sprites ont besoin de ces variables
  objMaton.objSprite.speed                    = 0
  objMaton.objSprite.angleRad                 = 0
  objMaton.objSprite.vx                       = 0
  objMaton.objSprite.vy                       = 0
  -- Le MATON
  objMaton.target                             = nil
  objMaton.rangeDetection                     = 0
  objMaton.state                              = STATE_MATON.NONE
  
  objMaton:addToList(pList)
  
  -- On le place au hasard DE BASE dans la partie haute de la fenêtre, vitesse au hasard, angle au hasard  
  objMaton:setPosition(
    math.random(10, objWindow.largeur-10),
    math.random(10, (objWindow.hauteur/2)-10)
  )    
  objMaton.objSprite.speed = math.random(5,50) / 200
  objMaton.objSprite.range = math.random(10, 150) -- détecte entre 10 et 150 pixels  
  
  -- Angle au hasard entre le point où est le maton et un point au hasard dans tout l'écran
  local xHasard = math.random(0,objWindow.largeur)
  local yHasard = math.random(0,objWindow.hauteur)
  objMaton.objSprite.angleRad = math.angle(objMaton.objSprite.x, objMaton.objSprite.y, xHasard, yHasard)
  
  -- print(objMaton.objSprite.angleRad * 360 / math.pi)
  objMaton.target = nil
  
  return objMaton
end


function CMaton:update(dt)
  -- * GESTION du N° de FRAME qu'on incrémente petit à petit
  self.objSprite.idFrameAVirguleCourant = self.objSprite.idFrameAVirguleCourant + 7*dt
  if self.objSprite.idFrameAVirguleCourant >= #self.objSprite.framesAnimMatrix + 1 then
    self.objSprite.idFrameAVirguleCourant = 1
  end
  
  
  if self.state == nil then
    print("***** ERROR STATE NIL *****")
  end
  
  if self.state == STATE_MATON.NONE then
    self.state = STATE_MATON.CHANGEDIR
  elseif self.state == STATE_MATON.WALK then
    -- COLLISION with BORDERS
    local bCollide = false
    if self.objSprite.x < 0 then
      -- On le colle à la paroie
      self.objSprite.x = 0
      bCollide = true
    end
    if self.objSprite.x > objWindow.largeur then
      self.objSprite.x = objWindow.largeur
      bCollide = true
    end
    if self.objSprite.y < 0 then
      self.objSprite.y = 0
      bCollide = true
    end
    if self.objSprite.y > objWindow.hauteur then
      self.objSprite.y = objWindow.hauteur
      bCollide = true
    end
    if bCollide then
      self.state = STATE_MATON.CHANGEDIR
    end
  elseif self.state == STATE_MATON.CHANGEDIR then    
    -- Angle au hasard entre le point où est le maton et un point au hasard dans tout l'écran
    local xHasard = math.random(0,objWindow.largeur)
    local yHasard = math.random(0,objWindow.hauteur)
    self.objSprite.angleRad = math.angle(self.objSprite.x, self.objSprite.y, xHasard, yHasard)
    
    self.state = STATE_MATON.WALK
  end
  
  -- * CALCUL des nouvelles COORDONNEES
  -- nouvelle Vx, Vy
  self.objSprite.vx = self.objSprite.speed * 2 * 60 * dt * math.cos(self.objSprite.angleRad)
  self.objSprite.vy = self.objSprite.speed * 2 * 60 * dt * math.sin(self.objSprite.angleRad)
  -- print("vx : "..self.objSprite.vx..", vy : "..self.objSprite.vy)
  
  -- nouvelles coordonées
  self.objSprite.x = self.objSprite.x + self.objSprite.vx
  self.objSprite.y = self.objSprite.y + self.objSprite.vy
  
end
  


function CMaton:draw()  

  local idFrameEntier = math.floor(self.objSprite.idFrameAVirguleCourant)
  -- Affichage du Hero
  love.graphics.draw(self.objSprite.image, self.objSprite.framesAnimMatrix[self.objSprite.idAnimCourant][idFrameEntier], self.objSprite.x, self.objSprite.y, 0, 1, 1, self.objSprite.width/2, self.objSprite.height/2)
  
end



return CMaton 