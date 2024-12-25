function love.load()
   CHRIS_1 = love.graphics.newImage("CHRIS_1.jpg", { mipmaps = true, linear = true, dpiscale = 4 })
   CHRIS_2 = love.graphics.newImage("CHRIS_2.jpg", { mipmaps = true, linear = true, dpiscale = 6 })
   CHRIS_3 = love.graphics.newImage("CHRIS_3.jpg", { mipmaps = true, linear = true, dpiscale = 4 })
   CHRIS_4 = love.graphics.newImage("CHRIS_4.jpg", { mipmaps = true, linear = true, dpiscale = 4 })

   love.graphics.setNewFont(12)
   love.graphics.setBackgroundColor(0, 0, 0)
   love.window.setMode(1024, 768)
   x = 10
   y = 30
   CHRIS_SELECTED = false
   IMAGE = nil
end

function love.update(dt)
   if not CHRIS_SELECTED then
      if love.mouse.isDown(1) then
         local mouseX, mouseY = love.mouse.getPosition()
         if mouseX >= 10 and mouseX <= 10 + CHRIS_1:getWidth() and mouseY >= 30 and mouseY <= 30 + CHRIS_1:getHeight() then
            IMAGE = CHRIS_1
            CHRIS_SELECTED = true
         end

         if mouseX >= 210 and mouseX <= 210 + CHRIS_2:getWidth() and mouseY >= 30 and mouseY <= 30 + CHRIS_2:getHeight() then
            IMAGE = CHRIS_2
            CHRIS_SELECTED = true
         end

         if mouseX >= 510 and mouseX <= 510 + CHRIS_3:getWidth() and mouseY >= 30 and mouseY <= 30 + CHRIS_3:getHeight() then
            IMAGE = CHRIS_3
            CHRIS_SELECTED = true
         end

         if mouseX >= 760 and mouseX <= 760 + CHRIS_4:getWidth() and mouseY >= 30 and mouseY <= 30 + CHRIS_4:getHeight() then
            IMAGE = CHRIS_4
            CHRIS_SELECTED = true
         end
      end
   else
      if love.keyboard.isDown("up") then
         y = y - 1000 * dt -- this would increment num by 100 per second
      end

      if love.keyboard.isDown("down") then
         y = y + 1000 * dt -- this would decrement num by 100 per second
      end

      if love.keyboard.isDown("left") then
         x = x - 1000 * dt -- this would decrement num by 100 per second
      end

      if love.keyboard.isDown("right") then
         x = x + 1000 * dt -- this would increment num by 100 per second
      end

      if x <= 0 then
         x = 0
      end

      if y <= 0 then
         y = 0
      end

      if x >= love.graphics.getWidth() - IMAGE:getWidth() then
         x = love.graphics.getWidth() - IMAGE:getWidth()
      end

      if y >= love.graphics.getHeight() - IMAGE:getHeight() then
         y = love.graphics.getHeight() - IMAGE:getHeight()
      end
      if love.keyboard.isDown("escape") then
         CHRIS_SELECTED = false
         IMAGE = nil
      end
   end
end

function love.draw()
   if not CHRIS_SELECTED then
      love.graphics.print("Click a CHRIS to select your CHRIS", 10, 10)
      love.graphics.draw(CHRIS_1, 10, 30)
      love.graphics.draw(CHRIS_2, 210, 30)
      love.graphics.draw(CHRIS_3, 510, 30)
      love.graphics.draw(CHRIS_4, 760, 30)
   else
      love.graphics.print("Use the arrow keys to MOVE THE CHRIS. Press ESCAPE to return to menu", 10, 10)
      love.graphics.draw(IMAGE, x, y)
   end
end
