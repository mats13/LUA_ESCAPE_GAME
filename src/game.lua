-- Initialisation à vide de l'objet
local Game = {}


-- * MODULES EXTERNES *
local myWindow        = require("window")

local CSpriteFactory  = require("class/CSpriteFactory")
local CPrisonnier     = require("class/CPrisonnier")
local CMaton          = require("class/CMaton")

local TYPE_SPRITE = require("enum/ETypeSprite")

-- ****************************
-- ** VARIABLES GLOBALES **
-- ****************************
local objPrisonnier = nil
local objMaton      = nil
local listCharacter = {}


-- *******************************
-- ** FONCTIONS UTILISATEUR **
-- *******************************
function initialise()  
  
  myWindow.load()
  
  objPrisonnier = CPrisonnier:createNew(listCharacter, myWindow)   
  
  local nMaton
  for nMaton=1,100 do
    objMaton      = CMaton:createNew(listCharacter, myWindow)
  end
  
  
end

function Game.load()  
  initialise()
end

function Game.update(dt)
  for i,character in ipairs(listCharacter) do
    -- objPrisonnier:update(dt)
    if(character.objSprite.typeSprite == TYPE_SPRITE.PRISONNIER) then
      character:update(dt)
    end
    if(character.objSprite.typeSprite == TYPE_SPRITE.MATON) then
      character:update(dt)
    end
  end
end

function Game.draw()  
  for i,character in ipairs(listCharacter) do
    -- objPrisonnier:update(dt)
    if(character.objSprite.typeSprite == TYPE_SPRITE.PRISONNIER) then
      character:draw()
    end
    if(character.objSprite.typeSprite == TYPE_SPRITE.MATON) then
      character:draw()
    end
  end
  --objPrisonnier:draw()
end

return Game