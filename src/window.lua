local Window = {}

function Window.constructor() 
  love.window.setMode(1024,768)
  
  Window.largeur = love.graphics.getWidth()
  Window.hauteur = love.graphics.getHeight()
end

return Window