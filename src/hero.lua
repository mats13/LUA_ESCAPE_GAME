local Hero = {}

function Hero.constructor()
    
end

function Hero.setPosition(x, y)
  Hero.x = x
  Hero.y = y
end

function Hero.load()
  
  Hero.x = 0
  Hero.y = 0
  Hero.image = nil
  Hero.width = 0
  Hero.height = 0
  -- On en déduit les dimensions du Hero
  -- Hero.width = Hero.image:getWidth()
  Hero.width = 20
  -- Hero.height = Hero.image:getHeight()  
  Hero.height = 20  
  -- Hero.vx = 0
  -- Hero.vy = 0
   -- Une seule image contenant les quatres pxcel arts côte à côte
  Hero.image = love.graphics.newImage("images/personnage-up-down.png")
  -- Hero.image = love.graphics.newImage("images/hero.png")
  
  -- print(Hero.image:getWidth())
  -- print(Hero.image:getHeight())
  -- On délimite 4 quads pour aller charger la bonne image
  Hero.idFrameAVirgule = 1
  Hero.frames = {}
  Hero.frames[1] = love.graphics.newQuad(0,0,20,20, Hero.image:getWidth(), Hero.image:getHeight())
  Hero.frames[2] = love.graphics.newQuad(20,0,20,20, Hero.image:getWidth(), Hero.image:getHeight())
  Hero.frames[3] = love.graphics.newQuad(40,0,20,20, Hero.image:getWidth(), Hero.image:getHeight())
  Hero.frames[4] = love.graphics.newQuad(60,0,20,20, Hero.image:getWidth(), Hero.image:getHeight())
  
end

function Hero.update(dt)
  -- * GESTION du N° de FRAME
  Hero.idFrameAVirgule = Hero.idFrameAVirgule + 7*dt
  if Hero.idFrameAVirgule >= #Hero.frames + 1 then
    Hero.idFrameAVirgule = 1
  end
  
  -- * GESTION des Fleches de contrôle
  if love.keyboard.isDown("up") then
      Hero.y = Hero.y - (50*dt)
  end
  
  if love.keyboard.isDown("down") then
      Hero.y = Hero.y + (50*dt)
  end
   
  if love.keyboard.isDown("right") then
      Hero.x = Hero.x + (50*dt)
  end  
  
  if love.keyboard.isDown("left") then
      Hero.x = Hero.x - (50*dt)
  end
end

function Hero.draw()  
  -- On aggrandi tout
  -- love.graphics.scale(4,4)

  local idFrame = math.floor(Hero.idFrameAVirgule)
  -- Affichage du Hero
  love.graphics.draw(Hero.image, Hero.frames[idFrame], Hero.x, Hero.y, 0, 1, 1, Hero.width/2, Hero.height/2)
  -- love.graphics.draw(Hero.image, Hero.frames[idFrame], Hero.x, Hero.y)
  -- love.graphics.draw(Hero.image, Hero.x, Hero.y)
  
end


return Hero