ChaptersMenuState = Class{__includes = BaseState}

function ChaptersMenuState:init()
    SystemTransition.start('uncover', function() end)
    self.usingMouse = false
    self.lastMouseX = 0
    self.lastMouseY = 0
    self.selected = 1 
    self.maxOptions = 4

    self.chapter = 1
    self.minChapter = 1
    self.maxChapter = 20

    self.options = {
        {x = 22, y = 10, w = 24, h = 20}, -- option 1
        {x = 85, y = 69, w = 20, h = 20}, -- option 2
        {x = 142, y = 69, w = 20, h = 20}, -- option 3
        {x = 98, y = 98, w = 50, h = 21}  -- option 4
    }

    self.levels = {
        [1] = 'level1',
        [2] = 'level2',
        [3] = 'level3',
        [4] = 'level4',
        [5] = 'level1',
        [6] = 'level1',
        [7] = 'level1',
        [8] = 'level1',
        [9] = 'level1',
        [10] = 'level1',
        -- keep going up to 20
    }
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
            local levelName = self.levels[self.chapter]
            if levelName then
                SystemTransition.start('cover', function()
                    gStateMachine:change(levelName)
                end)
            end
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
                    local levelName = self.levels[self.chapter]
                    if levelName then
                        SystemTransition.start('cover', function()
                            gStateMachine:change(levelName)
                        end)
                    end
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
    love.graphics.setColor(1, 1, 1, 1)

    --Print chapter
    love.graphics.setFont(gFonts['dogicapixel'])
    love.graphics.setColor(0, 0, 0, 1)
    local text = tostring(self.chapter)
    local font = gFonts['dogicapixel']
    love.graphics.setFont(font)
    local textWidth = font:getWidth(text)
    local centerX = 124 
    love.graphics.print(text, centerX - textWidth / 2, 75)
    love.graphics.setColor(1, 1, 1, 1)
    

   -- Debug hitboxes
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

