StartMenuState = Class{__includes = BaseState}

function StartMenuState:init()
    SystemTransition.start('uncover', function() end)
    self.usingMouse = false
    self.lastMouseX = 0
    self.lastMouseY = 0
    self.selected = 1 
    self.maxOptions = 4

    self.options = {
        {x = 20, y = 90, w = 50, h = 30}, -- option 1
        {x = 76, y = 90, w = 67, h = 30}, -- option 2
        {x = 146, y = 90, w = 53, h = 30}, -- option 3
        {x = 200, y = 90, w = 45, h = 30}  -- option 4
    }
end

function StartMenuState:update(dt)
    SystemTransition.update(dt)
    --freeze when on transitions
    if SystemTransition.active then
        self.dx = 0
        self.dy = 0
        return
    end

    --Mouse detection
    local mx, my = love.mouse.getPosition()
    mx, my = push:toGame(mx, my)
    if mx ~= self.lastMouseX or my ~= self.lastMouseY then
        self.usingMouse = true
    end
    self.lastMouseX = mx
    self.lastMouseY = my
    if self.usingMouse then
        for i, option in ipairs(self.options) do
            if mx >= option.x and mx <= option.x + option.w and
            my >= option.y and my <= option.y + option.h then
                self.selected = i
            end
        end
    end

    --Keyboard detection
    if love.keyboard.wasPressed('right') then
        self.selected = self.selected + 1
        if self.selected > self.maxOptions then
            self.selected = 1
        end
        self.usingMouse = false
    elseif love.keyboard.wasPressed('left') then
        self.selected = self.selected - 1
        if self.selected < 1 then
            self.selected = self.maxOptions
        end
        self.usingMouse = false
    end

    --Trigger keyboard
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        if self.selected == 1 then
            SystemTransition.start('cover', function() gStateMachine:change('video') end)
        elseif self.selected == 2 then
            SystemTransition.start('cover', function() gStateMachine:change('menuChapters')  end)
        elseif self.selected == 3 then 

        elseif self.selected == 4 then
            SystemTransition.start('cover', function() love.event.quit() end)
        end
    end
    --Trigger mouse
    if love.mouse.wasPressed(1) then
        local mx, my = love.mouse.getPosition()
        mx, my = push:toGame(mx, my)
        for i, option in ipairs(self.options) do
            if mx >= option.x and mx <= option.x + option.w and
            my >= option.y and my <= option.y + option.h then
                
                if i == 1 then
                    SystemTransition.start('cover', function() gStateMachine:change('video') end)
                elseif i == 2 then
                    SystemTransition.start('cover', function() gStateMachine:change('menuChapters') end)
                elseif i == 3 then
                    
                elseif i == 4 then
                    SystemTransition.start('cover', function() love.event.quit() end)
                end

            end
        end
    end
end

function StartMenuState:render()

    love.graphics.draw(gTextures['mainBg'], 0, 0)
    love.graphics.draw(gTextures['mainTitle'], 0, 0)
    love.graphics.draw(gTextures['main1'], 0, 0)
    --love.graphics.draw(gTextures['main1.1'], 0, 0)
    love.graphics.draw(gTextures['main2'], 0, 0)
    love.graphics.draw(gTextures['main3'], 0, 0)
    love.graphics.draw(gTextures['main4'], 0, 0)

    if self.selected == 1 then 
        love.graphics.draw(gTextures['mainOp1'], 0, 0)
    elseif self.selected == 2 then
        love.graphics.draw(gTextures['mainOp2'], 0, 0)
    elseif self.selected == 3 then 
        love.graphics.draw(gTextures['mainOp3'], 0, 0)
    elseif self.selected == 4 then
        love.graphics.draw(gTextures['mainOp4'], 0, 0)
    elseif self.selected == nil then
        
    end

    --Debug hitboxes
    -- for i, option in ipairs(self.options) do
    --     if i == 1 then
    --         love.graphics.setColor(1, 0, 0, 0.3) -- red
    --     elseif i == 2 then
    --         love.graphics.setColor(0, 1, 0, 0.3) -- green
    --     elseif i == 3 then
    --         love.graphics.setColor(0, 0, 1, 0.3) -- blue
    --     elseif i == 4 then
    --         love.graphics.setColor(1, 1, 0, 0.3) -- yellow
    --     end
    --     love.graphics.rectangle('fill', option.x, option.y, option.w, option.h)
    -- end
    -- love.graphics.setColor(1, 1, 1, 1)

    SystemTransition.render()
end

