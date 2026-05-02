OptionsMenuState = Class{__includes = BaseState}

function OptionsMenuState:init()
    SystemTransition.start('uncover', function() end)
    self.usingMouse = false
    self.lastMouseX = 0
    self.lastMouseY = 0
    self.selected = nil
    self.maxOptions = 4
    self.maxUnlocked = Save.load()

    self.options = {
        {x = 22, y = 10, w = 24, h = 20}, -- option 1
        {x = 136, y = 28, w = 60, h = 20}, -- option 2
        {x = 136, y = 57, w = 60, h = 20}, -- option 3
        {x = 59, y = 81, w = 105, h = 22}  -- option 4
    }

    self.levels = LevelList.get()

    --Options values
    self.sfxVolume = gConfig.sfx
    self.musicVolume = gConfig.music
    self.fullscreen = gConfig.fullscreen

    self.sfxSlider = { minX = -58, maxX = 0, y = 0 }
    self.musicSlider = { minX = -58, maxX = 0, y = 0 }
    self.draggingSFX = false
    self.draggingMusic = false

    --For numbers fade out
    self.sfxDisplayTimer = 0
    self.musicDisplayTimer = 0
    self.displayDuration = 1       
    self.fadeDuration = 0.5  

    --For keyboard holding/sliding 
    self.keyHoldTime = 0
    self.keyRepeatDelay = 0.3
    self.keyRepeatRate = 0.05
    self.keyRepeatTimer = 0
    self.holdingKey = nil
end

--Function to toggle fullscreen
function OptionsMenuState:applyFullscreen()
    push:setupScreen(
        VIRTUAL_WIDTH,
        VIRTUAL_HEIGHT,
        WINDOW_WIDTH,
        WINDOW_HEIGHT,
        {
            fullscreen = self.fullscreen,
            vsync = true,
            resizable = true,
            canvas = false
        }
    )
end

--Function to slide with keyboard 
function OptionsMenuState:adjustSlider(direction)
    local step = 0.02
    if self.selected == 2 then
        self.sfxVolume = math.max(0, math.min(1, self.sfxVolume + step * direction))
        Config.update(self.sfxVolume, self.musicVolume, self.fullscreen)
        self.sfxDisplayTimer = self.displayDuration + self.fadeDuration
    elseif self.selected == 3 then
        self.musicVolume = math.max(0, math.min(1, self.musicVolume + step * direction))
        Config.update(self.sfxVolume, self.musicVolume, self.fullscreen)
        self.musicDisplayTimer = self.displayDuration + self.fadeDuration
    end
end

function OptionsMenuState:update(dt)

    SystemTransition.update(dt)
    --freeze when on transitions
    if SystemTransition.active then
        self.dx = 0
        self.dy = 0
        return
    end

    --number% timers
    self.sfxDisplayTimer = math.max(0, self.sfxDisplayTimer - dt)
    self.musicDisplayTimer = math.max(0, self.musicDisplayTimer - dt)

    --Mouse detection
    local mx, my = love.mouse.getPosition()
    mx, my = push:toGame(mx, my)
    if mx ~= self.lastMouseX or my ~= self.lastMouseY then
        self.usingMouse = true
    end
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

    --Keyboard functions
    if love.keyboard.wasPressed('left') then
        self.holdingKey = 'left'
        self.keyHoldTime = 0
        self.keyRepeatTimer = 0
        self:adjustSlider(-1)
        if self.selected == 2 then
           Sound.playSFX("menuClick", { volume = 1 }) 
        end
    end
    if love.keyboard.wasPressed('right') then
        self.holdingKey = 'right'
        self.keyHoldTime = 0
        self.keyRepeatTimer = 0
        self:adjustSlider(1)
        if self.selected == 2 then
           Sound.playSFX("menuClick", { volume = 1 }) 
        end
    end
    if self.holdingKey and love.keyboard.isDown(self.holdingKey) then
        self.keyHoldTime = self.keyHoldTime + dt
        if self.keyHoldTime > self.keyRepeatDelay then
            self.keyRepeatTimer = self.keyRepeatTimer + dt
            if self.keyRepeatTimer > self.keyRepeatRate then
                self.keyRepeatTimer = 0
                if self.holdingKey == 'left' then
                    self:adjustSlider(-1)
                    if self.selected == 2 then
                        Sound.playSFX("menuClick", { volume = 1 }) 
                    end
                elseif self.holdingKey == 'right' then
                    self:adjustSlider(1)
                    if self.selected == 2 then
                        Sound.playSFX("menuClick", { volume = 1 }) 
                    end
                end
            end
        end
    else
        self.holdingKey = nil
    end

    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') or love.keyboard.wasPressed('space') then
        if self.selected == 1 then
            --Make selected sound
            local pitch = 0.8 + math.random() * 0.3
            Sound.playSFX("boardBlip", {
                pitch = pitch,
                volume = 0.7
            })
            SystemTransition.start('cover', function() gStateMachine:change('menu') end)
        elseif self.selected == 4 then
            self.fullscreen = not self.fullscreen
            self:applyFullscreen()
            Config.update(self.sfxVolume, self.musicVolume, self.fullscreen)
        end
    end

    --Mouse sliders
    local dx = mx - self.lastMouseX
    if self.draggingSFX then
        self.sfxVolume = self.sfxVolume + dx / self.options[2].w
        self.sfxVolume = math.max(0, math.min(1, self.sfxVolume))

        local step = math.floor(self.sfxVolume * 20)--sound shit, make click
        if step ~= self.lastSFXStep then
            self.lastSFXStep = step
            Sound.playSFX("menuClick", { volume = 1 })
        end

        Config.update(self.sfxVolume, self.musicVolume, self.fullscreen)
        self.sfxDisplayTimer = self.displayDuration + self.fadeDuration
    end
    if self.draggingMusic then
        self.musicVolume = self.musicVolume + dx / self.options[3].w
        self.musicVolume = math.max(0, math.min(1, self.musicVolume))
        Config.update(self.sfxVolume, self.musicVolume, self.fullscreen)
        self.musicDisplayTimer = self.displayDuration + self.fadeDuration
    end

    --Trigger mouse
    if love.mouse.wasPressed(1) then
        local mx, my = love.mouse.getPosition()
        mx, my = push:toGame(mx, my)
        for i, option in ipairs(self.options) do
            if mx >= option.x and mx <= option.x + option.w and
            my >= option.y and my <= option.y + option.h then
                
                if i == 1 then
                    --Make selected sound
                    local pitch = 0.8 + math.random() * 0.3
                    Sound.playSFX("boardBlip", {
                        pitch = pitch,
                        volume = 0.7
                    })
                    SystemTransition.start('cover', function() gStateMachine:change('menu') end)
                elseif i == 4 then
                    self.fullscreen = not self.fullscreen
                    self:applyFullscreen()
                    Config.update(self.sfxVolume, self.musicVolume, self.fullscreen)
                end
            end
        end

        local opt = self.options[2]------- Knobs grab
        if mx >= opt.x and mx <= opt.x + opt.w and
        my >= opt.y and my <= opt.y + opt.h then
            local t = (mx - opt.x) / opt.w
            self.sfxVolume = math.max(0, math.min(1, t))
            self.draggingSFX = true
            Config.update(self.sfxVolume, self.musicVolume, self.fullscreen)
        end
        local opt = self.options[3]
        if mx >= opt.x and mx <= opt.x + opt.w and
        my >= opt.y and my <= opt.y + opt.h then
            local t = (mx - opt.x) / opt.w
            self.musicVolume = math.max(0, math.min(1, t))
            self.draggingMusic = true
            Config.update(self.sfxVolume, self.musicVolume, self.fullscreen)
        end
    end

    if not love.mouse.isDown(1) then--for knobs grab
        self.draggingSFX = false
        self.draggingMusic = false
    end
    self.lastMouseX = mx
    self.lastMouseY = my
end

function OptionsMenuState:render()

    love.graphics.draw(gTextures['mainBg'], 0, 0)

    -- Decrease opacity of selected option
    local function drawOption(texture, isSelected)
        if isSelected then
            love.graphics.setColor(1, 1, 1, 0.5)
        else
            love.graphics.setColor(1, 1, 1, 1)
        end
        love.graphics.draw(texture, 0, 0)
    end
    drawOption(gTextures['selectBack'], self.selected == 1)
    drawOption(gTextures['optionsOp1'], self.selected == 2)
    drawOption(gTextures['optionsOp2'], self.selected == 3)
    drawOption(gTextures['optionsOp3'], self.selected == 4)
    love.graphics.setColor(1, 1, 1, 1)

    --knobs
    local sfxX = self.sfxSlider.minX + (self.sfxSlider.maxX - self.sfxSlider.minX) * self.sfxVolume
    love.graphics.draw(gTextures['optionsKnob1'], sfxX, self.sfxSlider.y)
    local musicX = self.musicSlider.minX + (self.musicSlider.maxX - self.musicSlider.minX) * self.musicVolume
    love.graphics.draw(gTextures['optionsKnob2'], musicX, self.musicSlider.y)
    --checkmark
    if self.fullscreen then
        love.graphics.draw(gTextures['optionsCheck'], 0, 0)
    end

    --Numbers for sliders
    love.graphics.setFont(gFonts['dogicapixel'])
    local function drawFadingText(value, x, y, timer)
        if timer <= 0 then return end
        local alpha = 1
        if timer < self.fadeDuration then
            alpha = timer / self.fadeDuration
        end
        love.graphics.setColor(0, 0, 0, alpha)
        local percent = math.floor(value * 100 + 0.5)
        love.graphics.print(percent .. '%', x, y)
    end
    drawFadingText(self.sfxVolume, 205, 34, self.sfxDisplayTimer)
    drawFadingText(self.musicVolume, 205, 64, self.musicDisplayTimer)
    love.graphics.setColor(1, 1, 1, 1)

    -- --Debug hitboxes
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

