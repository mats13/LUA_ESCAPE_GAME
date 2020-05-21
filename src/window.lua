local Window = {}

function Window.load() 
  love.window.setMode(1024,768)
  
  Window.largeur = love.graphics.getWidth()
  Window.hauteur = love.graphics.getHeight()
end

return Window