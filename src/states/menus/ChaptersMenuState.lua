ChaptersMenuState = Class{__includes = BaseState}

function ChaptersMenuState:init()
    SystemTransition.start('uncover', function() end)
    self.usingMouse = false
    self.lastMouseX = 0
    self.lastMouseY = 0
    self.selected = nil
    self.maxOptions = 5

    self.minChapter = 0
    self.maxChapter = 20
    self.maxUnlocked = Save.load()
    self.chapter = self.maxUnlocked

    self.eraseHoldTime = 0
    self.eraseHoldDuration = 3
    self.isHoldingErase = false
    self.eraseLocked = true

    self.options = {
        {x = 22, y = 10, w = 24, h = 20}, -- option 1
        {x = 85, y = 69, w = 20, h = 20}, -- option 2
        {x = 142, y = 69, w = 20, h = 20}, -- option 3
        {x = 98, y = 98, w = 50, h = 21},  -- option 4
        {x = 199, y = 92, w = 40, h = 17}  -- option 5
    }

    self.levels = LevelList.get()
end

function ChaptersMenuState:update(dt)
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

    --Logic for holding the erase button
    local eraseOption = self.options[5]
    local hoveringErase =
        mx >= eraseOption.x and mx <= eraseOption.x + eraseOption.w and
        my >= eraseOption.y and my <= eraseOption.y + eraseOption.h

    local holdingMouse = hoveringErase and love.mouse.isDown(1)
    local holdingKey = (self.selected == 5) and (love.keyboard.isDown('return') or love.keyboard.isDown('space'))

    if (holdingMouse or holdingKey) and not self.eraseLocked then
        self.isHoldingErase = true
        self.eraseHoldTime = self.eraseHoldTime + dt
        if self.eraseHoldTime >= self.eraseHoldDuration then
            if love.filesystem.getInfo("save.lua") then
                Save.save(0)
            end
            self.maxUnlocked = 0
            self.eraseHoldTime = 0
            self.isHoldingErase = false
            self.eraseLocked = true
        end
    else
        self.isHoldingErase = false
        self.eraseHoldTime = 0
        if not holdingMouse and not holdingKey then
            self.eraseLocked = false
        end
    end

    --Keyboard detection
    if love.keyboard.wasPressed('right') then
        if not self.selected then
            self.selected = 1
        else
            self.selected = self.selected + 1
        end
        if self.selected > self.maxOptions then
            self.selected = 1
        end
        self.usingMouse = false
    elseif love.keyboard.wasPressed('left') then
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

    if self.isHoldingErase then
        return
    end

    --Trigger keyboard
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') or love.keyboard.wasPressed('space') then
        if self.selected == 1 then
           SystemTransition.start('cover', function() gStateMachine:change('menu') end)
        elseif self.selected == 2 then
            --decrease chapter
            self.chapter = self.chapter - 1
            if self.chapter < self.minChapter then
                self.chapter = self.maxChapter
            end
        elseif self.selected == 3 then 
            --increase chapter
            self.chapter = self.chapter + 1
            if self.chapter > self.maxChapter then
                self.chapter = self.minChapter
            end
        elseif self.selected == 4 then
            local entry = self.levels[self.chapter]
            if self.chapter > self.maxUnlocked then
                gSounds['grab']:play()
                return
            end
            if entry then
                SystemTransition.start('cover', function()
                    gStateMachine:change(entry.state, entry.params)
                end)
            end
        elseif self.selected == 5 then
            
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
                    SystemTransition.start('cover', function() gStateMachine:change('menu') end)
                elseif i == 2 then
                    --decrease chapter
                    self.chapter = self.chapter - 1
                    if self.chapter < self.minChapter then
                        self.chapter = self.maxChapter
                    end
                elseif i == 3 then
                    --increase chapter
                    self.chapter = self.chapter + 1
                    if self.chapter > self.maxChapter then
                        self.chapter = self.minChapter
                    end 
                elseif i == 4 then
                    local entry = self.levels[self.chapter]
                    if self.chapter > self.maxUnlocked then
                        gSounds['grab']:play()
                        return
                    end
                    if entry then
                        SystemTransition.start('cover', function()
                            gStateMachine:change(entry.state, entry.params)
                        end)
                    end
                elseif i == 5 then
                    
                end
            end
        end
    end
end

function ChaptersMenuState:render()

    love.graphics.draw(gTextures['mainBg'], 0, 0)
    love.graphics.draw(gTextures['selectTitle'], 0, 0)

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
    drawOption(gTextures['selectPrev'], self.selected == 2)
    drawOption(gTextures['selectNext'], self.selected == 3)
    drawOption(gTextures['selectPlay'], self.selected == 4)
    drawOption(gTextures['selectErase'], self.selected == 5)
    love.graphics.setColor(1, 1, 1, 1)

    --Print chapter number 
    love.graphics.setFont(gFonts['dogicapixel'])
    local text = tostring(self.chapter)

    if self.chapter > self.maxUnlocked then --Check if chapter is unlocked
        love.graphics.setColor(0, 0, 0, 0.3) 
    else
        love.graphics.setColor(0, 0, 0, 1)
    end

    local font = gFonts['dogicapixel']
    love.graphics.setFont(font)
    local textWidth = font:getWidth(text)
    local centerX = 124 
    love.graphics.print(text, centerX - textWidth / 2, 75)
    --Route of game saves = C:\Users\jonasbroders\AppData\Roaming\LOVE\TheGame
    love.graphics.setColor(1, 1, 1, 1)

    --Progress bar when deleting save file 
    if self.isHoldingErase then
        local option = self.options[5]
        local progress = self.eraseHoldTime / self.eraseHoldDuration
        love.graphics.setColor(0, 0, 0, 0.5)
        love.graphics.rectangle('fill', option.x, option.y + option.h + 2, option.w, 4)
        love.graphics.setColor(1, 0, 0, 0.8)
        love.graphics.rectangle(
            'fill',
            option.x,
            option.y + option.h + 2,
            option.w * progress,
            4
        )
    end
    love.graphics.setColor(1, 1, 1, 1)
    

--    -- Debug hitboxes
--     for i, option in ipairs(self.options) do
--         if i == 1 then
--             love.graphics.setColor(1, 0, 0, 0.3) -- red
--         elseif i == 2 then
--             love.graphics.setColor(0, 1, 0, 0.3) -- green
--         elseif i == 3 then
--             love.graphics.setColor(0, 0, 1, 0.3) -- blue
--         elseif i == 4 then
--             love.graphics.setColor(1, 1, 0, 0.3) -- yellow
--         elseif i == 5 then
--             love.graphics.setColor(0, 1, 1, 0.3) -- 
--         end
--         love.graphics.rectangle('fill', option.x, option.y, option.w, option.h)
--     end
--     love.graphics.setColor(1, 1, 1, 1)

    SystemTransition.render()
end

