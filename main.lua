_G.love = require("love")

function love.load()
  love.window.showMessageBox("Welcome!","Welcome to the Arc game!It is the first game in the franchise known as Arc game.Controls:","info",attachtowindow)
  love.window.showMessageBox("Controls","-w(to go up),s(to go down),a(to go to left),d(to go to right),e(to close the program),z(to reset the score)","info",attachtowindow)
  love.window.showMessageBox("Logger","Logging in........","info",attachtowindow)
  love.window.showMessageBox("Getter","Game loaded!","info",attachtowindow)
  love.window.setTitle("Arc game!")
  love.mouse.setVisible(true)
   arc = {}
   arc.x = 200
   arc.y = 250
   arc.radius = 50
   score = 0
   arc.angle1 = 1
   arc.angle2 = 5
   font = love.graphics.newFont(40)
   love.graphics.setBackgroundColor(1,2,1)
end

function love.update(dt)
   if love.keyboard.isDown("down") then
    arc.angle1 = arc.angle1 + math.pi * dt
    arc.angle2 = arc.angle2 + math.pi * dt
   elseif love.keyboard.isDown("up") then
    arc.angle1 = arc.angle1 - math.pi * dt
    arc.angle2 = arc.angle2 - math.pi * dt
   end
  if love.keyboard.isDown("w") then
    arc.y = arc.y - 3
    score = score + 1
  elseif love.keyboard.isDown("s") then
    arc.y = arc.y + 3
    score = score + 1
  elseif love.keyboard.isDown("a") then
    arc.x = arc.x - 3
    score = score + 1
  elseif love.keyboard.isDown("d") then
    arc.x = arc.x + 3
    score = score + 1
  elseif love.keyboard.isDown("e") then
    love.event.quit()
  elseif love.keyboard.isDown("z") then
    score = score - score
 end
end

function love.draw()
  love.graphics.setColor(0,0,0)
  love.graphics.printf("FPS: " .. love.timer.getFPS(),50,90,love.graphics.getWidth())

  love.graphics.setColor(0,0,255)
  love.graphics.arc("fill",arc.x,arc.y,arc.radius,arc.angle1,arc.angle2)
  
  love.graphics.setFont(font)
  love.graphics.setColor(128,128,0)
  love.graphics.print(score,0,0)
end