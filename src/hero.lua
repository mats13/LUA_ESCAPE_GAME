local Hero = {}

function Hero.constructor()
    
end

function Hero.setPosition(x, y)
  Hero.x = x
  Hero.y = y
end

function Hero.load(objSprite)
  
  Hero.objSprite = objSprite
  
  Hero.x = 0
  Hero.y = 0
  -- On en déduit les dimensions du Hero
  -- Hero.width = Hero.image:getWidth()
  Hero.width = 20
  -- Hero.height = Hero.image:getHeight()  
  Hero.height = 20  
  -- Hero.vx = 0
  -- Hero.vy = 0
   -- Une seule image contenant les quatres pxcel arts côte à côte
  -- Hero.image = love.graphics.newImage("images/personnage-up-down.png")
  
  -- print(Hero.image:getWidth())
  -- print(Hero.image:getHeight())
  -- On délimite 4 quads pour aller charger la bonne image
  -- Hero.idFrameAVirgule = 1
  --[[
  Hero.frames = {}
  Hero.frames[1] = love.graphics.newQuad(0,0,20,20, Hero.image:getWidth(), Hero.image:getHeight())
  Hero.frames[2] = love.graphics.newQuad(20,0,20,20, Hero.image:getWidth(), Hero.image:getHeight())
  Hero.frames[3] = love.graphics.newQuad(40,0,20,20, Hero.image:getWidth(), Hero.image:getHeight())
  Hero.frames[4] = love.graphics.newQuad(60,0,20,20, Hero.image:getWidth(), Hero.image:getHeight())
  ]]
end

function Hero.update(dt)
  -- * GESTION du N° de FRAME qu'on incrémente petit à petit
  Hero.objSprite.idFrameAVirguleCourant = Hero.objSprite.idFrameAVirguleCourant + 7*dt
  if Hero.objSprite.idFrameAVirguleCourant >= #Hero.objSprite.framesAnimMatrix + 1 then
    Hero.objSprite.idFrameAVirguleCourant = 1
  end
  
  -- * GESTION des Fleches de contrôle
  if love.keyboard.isDown("up") then
      -- L'id d'animation que l'on lance
      Hero.objSprite.idAnimCourant = 2
      Hero.y = Hero.y - (50*dt)
  end
  
  if love.keyboard.isDown("down") then    
      -- L'id d'animation que l'on lance
      Hero.objSprite.idAnimCourant = 1
      Hero.y = Hero.y + (50*dt)
  end
   
  if love.keyboard.isDown("right") then  
      -- L'id d'animation que l'on lance
      Hero.objSprite.idAnimCourant = 4
      Hero.x = Hero.x + (50*dt)
  end  
  
  if love.keyboard.isDown("left") then      
      -- L'id d'animation que l'on lance
      Hero.objSprite.idAnimCourant = 3
      Hero.x = Hero.x - (50*dt)
  end
end

function Hero.draw()  
  -- On aggrandi tout
  -- love.graphics.scale(4,4)

  local idFrameEntier = math.floor(Hero.objSprite.idFrameAVirguleCourant)
  -- Affichage du Hero
  love.graphics.draw(Hero.objSprite.image, Hero.objSprite.framesAnimMatrix[Hero.objSprite.idAnimCourant][idFrameEntier], Hero.x, Hero.y, 0, 1, 1, Hero.width/2, Hero.height/2)
  -- love.graphics.draw(Hero.image, Hero.frames[idFrame], Hero.x, Hero.y)
  -- love.graphics.draw(Hero.image, Hero.x, Hero.y)
  
end


return Hero