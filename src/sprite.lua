local Sprites = {}

-- On passe une liste pList dans laquelle on va insérer en plus l sprite que l'on est en train de créer
-- @arg pList : cette liste
-- @arg pType : string du type de sprite qu'on crée : "humain", "zombie"
-- @arg psImageFile : le radical du nom du fichier
-- TODO : passer à la place des deux derniers paramètres un ImageQuad
function Sprites.createSprite(pList, pType, psImageFile, pnFrames)
  local mySprite = {}
  
  mySprite.type = pType
  mySprite.visible = true
  
  mySprite.images = {}
  mySprite.currentFrame = 1
  local i
  for i=1,pnFrames do
    local fileName = "images/"..psImageFile..tostring(i)..".png"
    print("Loading frame "..fileName)
    mySprite.images[i] = love.graphics.newImage(fileName)
  end
  
  mySprite.x = 0
  mySprite.y = 0
  mySprite.vx = 0
  mySprite.vy = 0
  
  mySprite.width = mySprite.images[1]:getWidth()
  mySprite.height = mySprite.images[1]:getHeight()
  
  table.insert(pList, mySprite)
  
  return mySprite
end

function Sprites.setType(pType)
  
end

return Sprites