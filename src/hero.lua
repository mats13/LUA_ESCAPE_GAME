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
end

function Hero.setPosition(x, y)
  Hero.x = x
  Hero.y = y
end


return Hero