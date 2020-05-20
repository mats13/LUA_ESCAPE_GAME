local Hero = {}

function Hero.constructor()
    
  Hero.x = 0
  Hero.y = 0
  Hero.image = nil
  Hero.width = 0
  Hero.height = 0
  -- On charge l'image du Hero
  Hero.image = love.graphics.newImage("images/hero.png");
  -- On en déduit les dimensions du Hero
  Hero.width = Hero.image:getWidth()
  Hero.height = Hero.image:getHeight()  
  -- Hero.vx = 0
  -- Hero.vy = 0
end

function Hero.setPosition(x, y)
  Hero.x = x
  Hero.y = y
end

function Hero.update(dt)
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
  print(Hero.x)
  -- Affichage du Hero
  love.graphics.draw(Hero.image, Hero.x, Hero.y, 0, 1, 1, Hero.width/2, Hero.height/2)
end


return Hero