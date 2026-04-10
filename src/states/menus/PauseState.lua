PauseState = Class{__includes = BaseState}

function PauseState:init()
    --Animation
    self.y = VIRTUAL_HEIGHT + 300
    self.rotation = -0.25
    self.targetY = 0
    self.speed = 8
    self.overlayAlpha = 0
    self.timer = 0.9
    self.timerFlag = true

    self.exiting = false
    self.exitSpeed = 3
    self.exitY = VIRTUAL_HEIGHT + 300
    self.exitRotation = 0.25
    self.exitAlpha = 0
    self.animTime = 0
    self.animDuration = 0.4

    --Control menu
    self.usingMouse = false
    self.lastMouseX = 0
    self.lastMouseY = 0
    self.selected = nil
    self.maxOptions = 3
    self.canControl = false
    self.options = {
        {x = 85, y = 61, w = 103, h = 12}, -- option 1
        {x = 85, y = 83, w = 103, h = 13}, -- option 2
        {x = 85, y = 105, w = 103, h = 23}, -- option 3
    }
end

function PauseState:enter(params)
    params = params or {}
    self.previousState = params.previousState
    if params.isQuickPause then
        self.timer = 0
        self.canControl = true
        self.y = self.targetY
        self.rotation = 0
        self.overlayAlpha = 0.5
    end
end

function PauseState:canUnPause()
    return true
end

--Close pause
function PauseState:onResume()
    gStateMachine:pop()
end

function PauseState:update(dt)
    SystemTransition.update(dt)
    --freeze when on transitions
    if SystemTransition.active then
        self.dx = 0
        self.dy = 0
        return
    end

    self.animTime = math.min(self.animTime + dt, self.animDuration)
    local t = self.animTime / self.animDuration
    
    --animate panel
    if not self.exiting then
        self.y = self.y + (self.targetY - self.y) * math.min(dt * self.speed, 1)
        self.rotation = self.rotation + (0 - self.rotation) * math.min(dt * self.speed, 1)
        self.overlayAlpha = self.overlayAlpha + (0.5 - self.overlayAlpha) * math.min(dt * self.speed, 1)
    else
        local t = self.animTime / self.animDuration
        t = t * t -- ease-in

        self.y = self.startY + (self.exitY - self.startY) * t
        self.rotation = self.startRotation + (self.exitRotation - self.startRotation) * t
        self.overlayAlpha = self.startAlpha + (self.exitAlpha - self.startAlpha) * t

        if self.animTime >= self.animDuration then
            gStateMachine:pop()
        end
    end

    --Control when can control
    self.timer = self.timer - dt
    if self.timer <= 0 and self.timerFlag then
        self.timerFlag = false
        self.timer = 0
        self.canControl = true
    end
    if not self.canControl then
        return
    end

    --unpause
    if love.keyboard.wasPressed('escape') then
        self.exiting = true
        self.animTime = 0
        self.canControl = false
        self.startY = self.y
        self.startRotation = self.rotation -- animation logic made when tired, sorry
        self.startAlpha = self.overlayAlpha
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
        local hoveringAny = false

        for i, option in ipairs(self.options) do
            if mx >= option.x and mx <= option.x + option.w and
            my >= option.y and my <= option.y + option.h then
                self.selected = i
                hoveringAny = true
            end
        end

        if not hoveringAny then
            self.selected = nil
        end
    end

    --Keyboard detection
    if love.keyboard.wasPressed('down') then
        if not self.selected then
            self.selected = 1
        else
            self.selected = self.selected + 1
        end
        if self.selected > self.maxOptions then
            self.selected = 1
        end
        self.usingMouse = false
    elseif love.keyboard.wasPressed('up') then
        if not self.selected then
            self.selected = self.maxOptions
        else
            self.selected = self.selected - 1
        end
        if self.selected < 1 then
            self.selected = self.maxOptions
        end
        self.usingMouse = false
    end

    --Trigger keyboard
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') or love.keyboard.wasPressed('space') then
        if self.selected == 1 then
            self.exiting = true
            self.animTime = 0
            self.canControl = false
            self.startY = self.y
            self.startRotation = self.rotation 
            self.startAlpha = self.overlayAlpha
        elseif self.selected == 2 then
            gStateMachine:pop()
            gStateMachine:push('pauseOptions')
        elseif self.selected == 3 then 
            SystemTransition.start('cover', function() gStateMachine:change('menu') end)
            Sound.stop("ambience", 2)
            Sound.stop("music", 2)
            return
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
                    self.exiting = true
                    self.animTime = 0
                    self.canControl = false
                    self.startY = self.y
                    self.startRotation = self.rotation 
                    self.startAlpha = self.overlayAlpha
                elseif i == 2 then
                    gStateMachine:pop()
                    gStateMachine:push('pauseOptions')
                    return
                elseif i == 3 then
                    SystemTransition.start('cover', function() gStateMachine:change('menu') end)
                    Sound.stop("ambience", 2)
                    Sound.stop("music", 2)
                    return
                end

            end
        end
    end
end

function PauseState:render()
    -- dark overlay
    love.graphics.setColor(0, 0, 0, self.overlayAlpha)
    love.graphics.rectangle("fill", 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)
    love.graphics.setColor(1, 1, 1, 1)

    -- panel
    local x = (VIRTUAL_WIDTH - gTextures['pauseBg']:getWidth()) / 2

    love.graphics.draw(
        gTextures['pauseBg'],
        x,
        self.y,
        self.rotation
    )

    if not self.exiting then
        if self.selected == 1 then 
            love.graphics.draw(gTextures['pause1'], 0, 0)
        elseif self.selected == 2 then
            love.graphics.draw(gTextures['pause2'], 0, 0)
        elseif self.selected == 3 then 
            love.graphics.draw(gTextures['pause3'], 0, 0)
        elseif self.selected == nil then
        end
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
